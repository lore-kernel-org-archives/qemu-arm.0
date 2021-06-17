Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp25722lff;
        Wed, 16 Jun 2021 17:23:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzaVwBOHgOFt9LLnSgAS1QPfTAJfGq0/4nF4DKIrG7U3Hvt/J5p3HudkPS1KfavUXNK+l+r
X-Received: by 2002:a05:620a:4045:: with SMTP id i5mr1067702qko.310.1623889430506;
        Wed, 16 Jun 2021 17:23:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623889430; cv=none;
        d=google.com; s=arc-20160816;
        b=v43IESJOQhChj2qnkguj5x9zJgri8LHwl/VWO+D4eeepapVCcq9KvpxHFjIciC4OGI
         QyULf4okVytqeFx/s/kWfBw65hlcTLP2pkBjZ5xwllQDkASkNEcZ1TAhtlGbJBU3Zvh4
         NVpZGTbEtQMGdIPnO7NwFbovDqRliJZqeXthBDXukMyyZBJ4Swv0cAZcllqtulD5U9Hb
         IPDPJbH9uFQkj0Pht8WdY88iqkE/Irwy09TqZd4o2LJovXD5ezFCLFGzyO2TXK7MEKbv
         DjHCHKHnY3Al+WCoITQwa+sCKLyYUH0vfgCSEOY7cUUxWLBjZdnIx7IEh6sHohWzoAII
         RWrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Jvyle/Pmz2XGVlT0IHRNBLcwn+v2I26cnlJMxyRy9x4=;
        b=sM+qJMDtXPGrI19RGCxL4jIUrYA+yPN54Op2LRuVXop0qiE30UdRDBm7w8CO5Tq7/s
         gMVKomgojNnZ4e+KwbwpX1WckteB195Gh1rYJ5EGic8lYWXvCZWVLiG41uxOf1OWLWfJ
         U2i/sRdrNXoka/1SFsfNx1OhJgyg0ko9tOVLyV2VLDglrLEhGhWh9sKZykiCkcYWLsXC
         NFHivlFFEm9KA0/IGE60u5wCuFraz3+qo5c23/eSOmFapyA3BTHTBNSdzQy0D/gEDFcI
         H9fvt0NX/e8LTZ69eo2luN5DxLxFvg4aku9HCdKXZS8+C9FTZ3y3lkx31rtkn1DWN27R
         k/qQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fMfTRhiC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j4si607829qkk.77.2021.06.16.17.23.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Jun 2021 17:23:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fMfTRhiC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltfoz-0006EG-Qb
	for alex.bennee@linaro.org; Wed, 16 Jun 2021 20:23:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltfoc-0005iX-Hd
 for qemu-arm@nongnu.org; Wed, 16 Jun 2021 20:23:26 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:54112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltfoZ-0006f6-K3
 for qemu-arm@nongnu.org; Wed, 16 Jun 2021 20:23:26 -0400
Received: by mail-pj1-x102e.google.com with SMTP id ei4so2756404pjb.3
 for <qemu-arm@nongnu.org>; Wed, 16 Jun 2021 17:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Jvyle/Pmz2XGVlT0IHRNBLcwn+v2I26cnlJMxyRy9x4=;
 b=fMfTRhiCmcYgr5c/mKBFHtB3C9x0bVblIpbAw272IKuBQooNT2AeBcafh/L+Y3MUsC
 jV3cMgPNore1e6X8Azb7QRsSaRsn1FrdWfaNJrKHiDeE3tR0PL3DAG76Mldnn7WBlOWA
 LISqaxySs+0buonWghi0eRyH7ArJgCyZkQNwsluW5lnSmcQtaklL5hgjLlyOm+F15Qy5
 1hQeobf0LOCiQTpPAl2xIq/fQc2E4YQwrXKE0X8nUMWmKAe8K9Un3ygKLmcH252wQTlt
 75R7Eyi0+C4rIH317UwlGGi3J0S1ndFNg2hPh1ylNWaJWGR7roCqT/SWbs/aI7lNxJn5
 7Psg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Jvyle/Pmz2XGVlT0IHRNBLcwn+v2I26cnlJMxyRy9x4=;
 b=qTN5AiIFPLM9ktERsYEiphE8WHqRo9s2zcQKrWrGNG74TA84HKMJnSqwd0mBFA/U/e
 VPCD6O3HewO5r5beCR+ehps7+4IJ/0S+wbgAiITF9kMFxz5FQ3nct+asnZ3UIYnOaUyS
 TKTJffiVMsN4/3DKQ734/lrfrtfQHAdZw8Zul94H1KNMH+Jg4u22CYZQOvp+/KOlH7Kv
 oDhcA5dLBi8NXTbFV7JJgG1jZFu+n975t6q/o1Pb/tRVo59xaY7SgCCZp7KjkrS8H90o
 7uC11CWZnS+Krdb3nv9fQ2BzfpbPPxqRiSEOq45c6u6kyGjBMHPIDhQSGH0qwMpTQlw0
 peDA==
X-Gm-Message-State: AOAM530sZhfBsBGcWmZJ/xMKu0olCQtGcFgYRAm2pO4f6oCIdZ1BrMFU
 FWyG2KDPFCaR5uaexhcAkAPuFQ==
X-Received: by 2002:a17:902:da91:b029:116:864e:893b with SMTP id
 j17-20020a170902da91b0290116864e893bmr2001991plx.26.1623889401864; 
 Wed, 16 Jun 2021 17:23:21 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 k19sm3138128pji.32.2021.06.16.17.23.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 17:23:21 -0700 (PDT)
Subject: Re: [PATCH v4 15/15] hw/i2c: Introduce i2c_start_recv() and
 i2c_start_send()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210616214254.2647796-1-f4bug@amsat.org>
 <20210616214254.2647796-16-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ecc2bf57-82fa-a49e-ae5c-740c7538ccad@linaro.org>
Date: Wed, 16 Jun 2021 17:23:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210616214254.2647796-16-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.17,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Corey Minyard <cminyard@mvista.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7vw+XnmpirjR

On 6/16/21 2:42 PM, Philippe Mathieu-Daudé wrote:
> To ease reviewing code using the I2C bus API, introduce the
> i2c_start_recv() and i2c_start_send() helpers which don't
> take the confusing 'is_recv' boolean argument.
> 
> Use these new helpers in the SMBus / AUX bus models.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   include/hw/i2c/i2c.h  | 24 ++++++++++++++++++++++++
>   hw/i2c/core.c         | 10 ++++++++++
>   hw/i2c/pm_smbus.c     |  4 ++--
>   hw/i2c/smbus_master.c | 22 +++++++++++-----------
>   hw/misc/auxbus.c      | 12 ++++++------
>   5 files changed, 53 insertions(+), 19 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
