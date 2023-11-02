Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp133502eja;
        Wed, 1 Nov 2023 21:06:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEewvDbRZnxWAE+4IIL5mS3kKQJIEvIihks8Q/gC7pTqub2SBluVaoatDcM5jgqmeZT2oKs
X-Received: by 2002:a0c:b394:0:b0:66d:2b1b:acfa with SMTP id t20-20020a0cb394000000b0066d2b1bacfamr16165594qve.50.1698897974632;
        Wed, 01 Nov 2023 21:06:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698897974; cv=none;
        d=google.com; s=arc-20160816;
        b=aqXAcEJ8TwB32JROw0iNqCT3y8tJGgjxhNbQjM+8/eLLUAtqUQ8c0WKET0kVr0j+6W
         TnmSNEA3i36yzlLHhI6BueOxEcCyTE+QUyc5YjWeHYWCasjpP48Ai4Wrp3etOyUIR2hi
         sOd3aJfXlqlr2kPXMGJVPIsejyi0KcIaqGLfCUFU7sDmFvhC+nSbYyu28I7Nql1oB0qz
         ZHwGvNyhVsveSEmCOVwM93KkIF2cXvyocaKrcJdlUOcKti/g263VSKzI7ujXojela3+E
         GDWpUMj2iFVV5BundggrBkGtLhSNxI7WKNp03+tRw59Wsr5qfd7uwWHkbwIaOUcJd1qr
         AkKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=YxbzTRlaUwbjRDh7z/1Xe+slMYKeH0O5d7s4xKF2Wa4=;
        fh=vnd25H/Ke+7YaFzjpnMIhV1td4ceLAPtKNu/30RxYYA=;
        b=vOAhxzsG5B31GtPcqn8UonR/JinxP8yt8pY6hZLGuL5h4hmHH3GbV73rA/BKFzz0f1
         UGwpp0TJ7yFs0vrJco3eZq/FSo1NAXggIcgP4NhDwkYvGbgNql/x3OT10SwTIr0eRAxR
         /PI4Hhi2AuKo6Mr3LO3t/Pdc+Bp/cU+esOdZktzoZhpvPsMN+1fE7HgodQOyxNYc+7Ns
         6mLaY0WPh7W1hw0wMdNlS5KTK4Do2ROYBf/cr9S9oKNMUEei2s5tiWnS27hE0WXqgiv9
         Qa8N1jWuO+j0ZkCXIIKM56kB5yyIMsy+SW4ZqoHzf7RfUFllb2e+HBU8v2jXFIkALVI9
         8PPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lj2y14fA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dc7-20020a056214174700b0066db33faac2si3708295qvb.450.2023.11.01.21.06.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Nov 2023 21:06:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lj2y14fA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qyOxz-0008AW-6v; Thu, 02 Nov 2023 00:05:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qyOxx-0008AJ-H5
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 00:05:57 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qyOxv-0005D0-Jl
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 00:05:57 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1cc1ee2d8dfso4105305ad.3
 for <qemu-arm@nongnu.org>; Wed, 01 Nov 2023 21:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698897953; x=1699502753; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YxbzTRlaUwbjRDh7z/1Xe+slMYKeH0O5d7s4xKF2Wa4=;
 b=lj2y14fAhbiiDOOujHvD77N/XVcI2nctT8j/qhxXuzmEAhHWBCakN4N7BWN6nYbsEW
 nvyU5N7vxJkhjOLfJdlQdI65+LSKfVgo0OVtBik7orYbXp7VSLVG9DjeOu9NeSGODWWU
 vsWantp51R+20WiPwNymUA8X1NrM5PtDdYUNLFgGgwmcZR6SG4RQHqk5p8ekMMOkINQe
 Sy7hTzKDYPV73LG0XU7DT0mr22ndzDDAgkilLFeqhFdTGzPXVUEpFJ+9Xb3xreNSURLK
 fLuAT2x13YD4rB0CeJKebW536+glaCPJ5PZamz4Dw1uZC+C2yoHo5xpjpWcaWDUXekD3
 vwLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698897953; x=1699502753;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YxbzTRlaUwbjRDh7z/1Xe+slMYKeH0O5d7s4xKF2Wa4=;
 b=NhzEyCl7tftZHR+psA0Cv8m8WgDa+BArqu4PWyezProo8zHBjNEyt2viAd6oKFORx/
 Q9BjV5/S+d0rLiWsXl1fdbB9rnDY2MrPy5lDdOhEEJ4J0OZZLiOLZKM5+99am/8M59rV
 7Qa8pxRXJFoczodh9koFyuVxx3nvlUzzkFd5sV08wj0ZSFtNLM5PWGOMuZN8xUrACgTn
 1T47arP2e/AhRgiKZK59CuqdXQJANLWx+LBcv+Wqwf2NCjl5pqJQFFR90sYIzS7mEFJn
 a1lc0JXn6TAv2zFcXm2wuADiTw34fqMOU4SHMSVgEwyEGYutgFzpItz5eewy8qksOsTD
 ufyA==
X-Gm-Message-State: AOJu0YzvyILiOI5HHYmig6IzoJa0+AnqDVKNALYN/ShVMjPtVB+RPQ/C
 Sq/AaieOBOw3jTyZAzA4sGTtqgQle1JWiZi5ptY=
X-Received: by 2002:a17:902:ec84:b0:1cc:4cb0:d273 with SMTP id
 x4-20020a170902ec8400b001cc4cb0d273mr12550419plg.56.1698897953497; 
 Wed, 01 Nov 2023 21:05:53 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.149.95])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a170902e74100b001cc35c610c2sm2001804plf.298.2023.11.01.21.05.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Nov 2023 21:05:53 -0700 (PDT)
Message-ID: <dc7ae639-ff1b-4f82-ad66-a11d9afed9ae@linaro.org>
Date: Wed, 1 Nov 2023 21:05:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/33] target/arm: Use generic helper to show CPU model
 names
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
References: <20231102002500.1750692-1-gshan@redhat.com>
 <20231102002500.1750692-7-gshan@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231102002500.1750692-7-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: UbXp0E8XEtkC

On 11/1/23 17:24, Gavin Shan wrote:
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 5dc0d20a84..baf4b104ef 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -9436,17 +9436,15 @@ static void arm_cpu_list_entry(gpointer data, gpointer user_data)
>   {
>       ObjectClass *oc = data;
>       CPUClass *cc = CPU_CLASS(oc);
> -    const char *typename;
> -    char *name;
> +    const char *typename = object_class_get_name(oc);
> +    char *model = cpu_model_from_type(typename);

g_autofree.


r~
