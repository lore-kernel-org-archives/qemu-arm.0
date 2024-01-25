Received: by 2002:a17:906:590b:b0:a31:23a7:2a34 with SMTP id h11csp668569ejq;
        Wed, 24 Jan 2024 18:10:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEaE6zWRHc5CuA/nDqoqHQWZh6IBIiRZkxwRXztd8aJBl8IP1bAi0sAopb+vBFM2/i7Nye2
X-Received: by 2002:a05:622a:107:b0:42a:3503:2f2a with SMTP id u7-20020a05622a010700b0042a35032f2amr425052qtw.34.1706148614775;
        Wed, 24 Jan 2024 18:10:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706148614; cv=none;
        d=google.com; s=arc-20160816;
        b=AjvpQ7Pzekjha6epH3rSOOFctncFLEhYq1I2Uei34yhfqb7idiYcO3MYFVUGjXo8/S
         jbKFdXqSYzWrEdPno+eYfDsRLOQZKjkoZQGB6HPyFvoAxx1TPDLpV2xOQUGFjkmmG16A
         anXs6EnLJTegYRn4Km1S/k9EG+KQxW9zrIdDox0aE7TUK5JIJ8f9n6Z+SaQW6omBkUiq
         RGHspgthjhNAUlKKD0g1Ack3C1h+1wg2wOAemL/J8Whi/FT8POLXTv5WKl35uNKp/iBg
         WaVUc06QAsjy7e/LLFGxAQg5CVSWL8NmIkaYx6vF9TKN3stUVy17R4f5kqnMIAjGY+C8
         lguw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=MOHbsRr20QruXk56khtKTTMov+K3GYDTbgrYusTtrGc=;
        fh=39N9WEP22ZX5RpcHhH9m770ca1Njks1d53douB51LrA=;
        b=z2l+qUFBhdBzA95Djj62Je5ibBQGHpbdWThHn0sxbg6APr9urxzkwwhejwaDh79xRB
         d4WDmuIiza9MjRcDbadPltUJmDBLbLjElKTJmDQh1Qhy2aZIwwUhb2oknA66KDfzQfIn
         M1GN8ZQcXXHv6XblkYdGziZ1WbZRdc0pJx4v3Ied6rQihAhlwAW0Tb/45c6tyA5MZ2QG
         xtxEa7NvU4aO+7JL8Qvn62X035DOxJpYm4fqroFhifNxFvmksJF9HSyF1LqMJIguHReV
         H53q0/k5qPPa3U82hc+39t26p535QLyNywdAeDxSEFrqVJY+Pw1aNZAUB/yvSAP1B5zz
         Z/4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bqxOWOTg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f37-20020a05622a1a2500b0042a59d8bafcsi3628297qtb.739.2024.01.24.18.10.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jan 2024 18:10:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bqxOWOTg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rSpBc-0000qc-GN; Wed, 24 Jan 2024 21:09:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1rSpBa-0000q2-5U
 for qemu-arm@nongnu.org; Wed, 24 Jan 2024 21:09:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1rSpBY-0005AA-MC
 for qemu-arm@nongnu.org; Wed, 24 Jan 2024 21:09:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706148583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MOHbsRr20QruXk56khtKTTMov+K3GYDTbgrYusTtrGc=;
 b=bqxOWOTgnmvHpM41A94arR+ZGFCRjjcSQHZalZ/2Th+L5BAtrrnWJVGNn6RUNLu5ZX59TX
 NuYCr9fsDc/8vkMf7kPJ5fNtU6X9pa69HNmRQt9Ey1q/hMbpXwv6ht95whKlUGZu9jYSwr
 I41CEUxXZMU72kfFVM9nFKmth5ZbJw4=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-522-Qjd1LUuaPUyhVNxG2qFT-w-1; Wed, 24 Jan 2024 21:09:41 -0500
X-MC-Unique: Qjd1LUuaPUyhVNxG2qFT-w-1
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-1d7434d9ab4so40681565ad.2
 for <qemu-arm@nongnu.org>; Wed, 24 Jan 2024 18:09:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706148580; x=1706753380;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MOHbsRr20QruXk56khtKTTMov+K3GYDTbgrYusTtrGc=;
 b=Yr7XEKPNTsJ3D6oCw61tjecMWSoOcbadnu/gFRnn/hBC5jxen4K161w1RGTWt/GkBx
 LxtbbicFZ5NHR6W8jEQH8bMJ13V6va6ZC197hF3GZDkZtZXWbc0oaP+MJbbQYgai7uOR
 9ojjioddVtHQmE6+Qvtbv20O8+JMGCSK7la5Qq0tBcF+FThlcJ85iZnHy8AAdXBlmHjD
 Wvkod/zarql34u4KDQ/dcxkk+DEMq19P+FECUnEDfSW+C4IlFGo1LZ4j8AJbxweraSD6
 rDIEIKovA0k9dsuMTlvgKNzjPeluBz2GMYK/eV7vROfaAHd03Z/LGthWD/iYqgpT1bUB
 Gnig==
X-Gm-Message-State: AOJu0YxZ+FMkdGPyJsNTI7jOMSCV/LN+0uxpJ3Y4UZSmyF5XyppTWEGH
 1IJ0MAHRYlxfrdcbW9o6pExNaU0LIGHMMGeGkJE347XYKizUbeatD87xLnfVjrgYaoKxpUbakNm
 +8m3hA4BuTLnrGI2TkTNt/wC7/j3T39n3kcWIW2u5wqMONZTcwQ==
X-Received: by 2002:a17:902:e744:b0:1d7:505f:9223 with SMTP id
 p4-20020a170902e74400b001d7505f9223mr346186plf.80.1706148580222; 
 Wed, 24 Jan 2024 18:09:40 -0800 (PST)
X-Received: by 2002:a17:902:e744:b0:1d7:505f:9223 with SMTP id
 p4-20020a170902e74400b001d7505f9223mr346167plf.80.1706148579938; 
 Wed, 24 Jan 2024 18:09:39 -0800 (PST)
Received: from [10.72.112.202] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 12-20020a170902e9cc00b001d7035b11d6sm11015403plk.254.2024.01.24.18.09.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jan 2024 18:09:39 -0800 (PST)
Message-ID: <8f5768fb-71f0-4c26-97d7-95177fa6cac3@redhat.com>
Date: Thu, 25 Jan 2024 12:09:30 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] hw/arm/exynos: Add missing QOM parent for CPU cores
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Rob Herring <robh@kernel.org>,
 Joel Stanley <joel@jms.id.au>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Alistair Francis <alistair@alistair23.me>,
 Igor Mammedov <imammedo@redhat.com>
References: <20240123222508.13826-1-philmd@linaro.org>
 <20240123222508.13826-2-philmd@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20240123222508.13826-2-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.5,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 9mGD7LN7j413

On 1/24/24 08:25, Philippe Mathieu-Daudé wrote:
> QDev objects created with qdev_new() need to manually add
> their parent relationship with object_property_add_child().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/arm/exynos4210.c | 1 +
>   1 file changed, 1 insertion(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

