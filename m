Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp131936eja;
        Wed, 1 Nov 2023 21:01:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOBOPlshBJBc0vbgQC9RV71tSRxX1KEWIAsx1GWfg/4nGsZiMPuroifWWcxdCn1PUd5q6Y
X-Received: by 2002:a05:620a:4454:b0:76a:db80:121d with SMTP id w20-20020a05620a445400b0076adb80121dmr19445555qkp.6.1698897715259;
        Wed, 01 Nov 2023 21:01:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698897715; cv=none;
        d=google.com; s=arc-20160816;
        b=KFA4MP8OiPhjsGp6KJL9MkhHf41+UZxJ3fHzASRLy95pWPrrXG2Z7ImD1Kxg22u+Xf
         9MaHzqibAsIayLrN6rFsWBLH7LiGKFdohgNcKr84U14T72B032HuVL6xFPeJSj0pt9bB
         Z24a/ZXWaiPFZFFIbeCvRfvAATF6vnymG0AbSobwVfJGfJJwk7BLOIZEPgSepgInf8Fm
         GLt4OPAS7ctz1dR5/OxoxAqWJAZPbP/WCZbACZa67GyzSrnjBYUhtGT4NRtki61CNDlD
         ttc8bbTv/3gdL1IS+70dZ3PTrEJtSTaiS12jq/oh6GowtUvyZxa8BfrIv8tsNZky1Q9Z
         dogQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=qF3/iVE/BIpzKqgkwzVBz4c3YrzT0a7nxHcrIa97ycA=;
        fh=vnd25H/Ke+7YaFzjpnMIhV1td4ceLAPtKNu/30RxYYA=;
        b=BUH4yra8yt9Wf5re1F667HrW7bfKTlFV7I7hMkdmIqmNhb2sJa/F157iErEq1KR2JF
         ohAWpEY299kP2V1t1TR6SFghb6jTZsHjbzQaqTw4Q1QDkmPhsCQgYta57KTLw0QlclSk
         TFs6MOmdVCOwoM1UKQT3MLQ5HOsZaVzf+1aq+yxlj3SvL43oCAPz4LqTN5PxBZYk8mQz
         rE576CkJwB2kS5l7EGD5aw+Wl51cMQzmNBAnOyqUXeQwvPddfOVFJpGpL8zNdPfonBcI
         qU54F0sG+Sf7ZdLCKt3W9Tyubre6/VdjDpn9e4ZdLTxgy1Bp0PAUqFxDGco+ao4vsInx
         Im2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LtMqKqqi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bq15-20020a05620a468f00b00775cf5f88a2si4040726qkb.526.2023.11.01.21.01.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Nov 2023 21:01:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LtMqKqqi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qyOtq-0007Ex-D7; Thu, 02 Nov 2023 00:01:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qyOtn-0007Dn-BD
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 00:01:40 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qyOtl-0001A4-PH
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 00:01:39 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1cc58219376so4289485ad.1
 for <qemu-arm@nongnu.org>; Wed, 01 Nov 2023 21:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698897696; x=1699502496; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qF3/iVE/BIpzKqgkwzVBz4c3YrzT0a7nxHcrIa97ycA=;
 b=LtMqKqqiu0RNfb/A2hlDBupeoZiKyklMghlEIRW98x8uzV+GZdYnboQih8eVdQq0tS
 R37H/UjRg5kVfcej+per6uwIcqZRwmDoqnHww8BjQvwoRDm/GNig/Zp/xaF5US/Zb2Kf
 cmCy9kWXWG1CxN1kRL+8CHT6wSMl0cO+SQMX/ycZn5/SdILm8V4LtyE0+7X/RZnmyZmh
 BgqMZFjTpPJFFd4EeKTMg2cLLPMjjXyZ63zHNIHdttssS5brrP0Ay3RaTKHhUD/+lBBl
 qDc3iKlDaZ6n1gCxlOssavbxtXN0Bx+3rc/C8szumYAYerCRC6iYaYdL4jPG70WKI0ZC
 z5fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698897696; x=1699502496;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qF3/iVE/BIpzKqgkwzVBz4c3YrzT0a7nxHcrIa97ycA=;
 b=XdSfCq4Mbkckj9dIE8eFZ4Rc5Lf4ZvQbmfT+qmuIKCZymKJlm7Oa1YwPH2i7KuqqcI
 jkhcLNGaME3ALbV8tZEUtuC5+ReNUZp5sa4qctOXsYl0t7HyCJxAzHrmOtG6Pz0UyP9M
 lLrzR6hcJdkioIuLiofS26Iv+kq6v96s7ryxzhgGggUncMonCgNorEFjkQ1IAfaDe1N5
 hdTEP07aq2K/U7ZuKjNQed0YdsOD+EMKWTC5lGwUebNBSZvXYpnznd5nT6CRqrhecfvi
 H1zW8KOifXp8wsuTzlssMgCOvs6f6icfy6TY04l3/i42HEFKag4Fj9o1WNhzav+NxJRz
 y8hA==
X-Gm-Message-State: AOJu0Yz7acKFi+/xf4+lxdCf+NhNqiJdMIiXygdbns6rOdUFdGH4n5DT
 in5XNQPi5vPZEBJK/pX7cFxReg==
X-Received: by 2002:a17:902:ea11:b0:1cc:520a:544 with SMTP id
 s17-20020a170902ea1100b001cc520a0544mr11106944plg.48.1698897695943; 
 Wed, 01 Nov 2023 21:01:35 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.149.95])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a1709028c8500b001c5076ae6absm1977632plo.126.2023.11.01.21.01.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Nov 2023 21:01:35 -0700 (PDT)
Message-ID: <e13fc0aa-d96e-49fc-90d5-e059edea0157@linaro.org>
Date: Wed, 1 Nov 2023 21:01:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/33] target/alpha: Use generic helper to show CPU
 model names
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
References: <20231102002500.1750692-1-gshan@redhat.com>
 <20231102002500.1750692-6-gshan@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231102002500.1750692-6-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
X-TUID: ioPPnkXoX3FH

On 11/1/23 17:24, Gavin Shan wrote:
> For target/alpha, the registered CPU type name is always the combination
> of the CPU model name and suffix. Use cpu_model_from_type() to show the
> CPU model names instead of the CPU type names.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>   target/alpha/cpu.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
> index 9436859c7b..d4b35434cd 100644
> --- a/target/alpha/cpu.c
> +++ b/target/alpha/cpu.c
> @@ -89,9 +89,11 @@ static void alpha_cpu_realizefn(DeviceState *dev, Error **errp)
>   
>   static void alpha_cpu_list_entry(gpointer data, gpointer user_data)
>   {
> -    ObjectClass *oc = data;
> +    const char *typename = object_class_get_name(OBJECT_CLASS(data));
> +    char *model = cpu_model_from_type(typename);

g_autofree


r~

>   
> -    qemu_printf("  %s\n", object_class_get_name(oc));
> +    qemu_printf("  %s\n", model);
> +    g_free(model);
>   }
>   
>   void alpha_cpu_list(void)

