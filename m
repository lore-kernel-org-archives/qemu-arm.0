Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp3372705njb;
        Tue, 9 Jul 2024 08:46:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVY/krF9IdyVmO+wE4GR7amSMKRWBGrMLu56OR7i0t6QkIke0pUpXvof5QBhcMXGo4JeyMTfl8PCD7hJ79TfJxkcKbF9AlG
X-Google-Smtp-Source: AGHT+IFTp+VD6BUqDYqYE0jq6ImneT7HI8OaZUmaIqT4NvrTJaFq+fyihrUYfeuiDQ2RsJR9bUu4
X-Received: by 2002:a05:6102:cc8:b0:48f:a75a:278c with SMTP id ada2fe7eead31-490321e77femr3632846137.27.1720539961398;
        Tue, 09 Jul 2024 08:46:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720539961; cv=none;
        d=google.com; s=arc-20160816;
        b=bVN0feeFQNqhMFCKmg+Nnm2y56gWEVmJzATMX8AzXYQJO3UfkwWMPGorjP5bUFVXXX
         pY0Y/HPp7NsaLUD4ls0Wen4OXWCZ0N4Le4z7Bl7HwUzynBKb1O3m92YjIQwxVb5uXzpR
         RIUiRk2lcxOE1GXkET6VrXxrVsWq1x4EjQrlO17dE+FFS5snhxAWE5zUYxD7nOpcn954
         mRX7fQZUECrGMathXV17iNRs7aKcHg54YD0QUfxSB5HWOdfc1SwVlb+UoIQuHns89v9C
         JXz3itCIfWDdobUQ1w1Ojizq5benJqvXzdjixBH+YCdcUZYlFs9e+/oqOVTEO6LFI/AG
         GaJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=VfKEPrrv1ndASgd+2mUDsxgPGy4th/QC/d5aPFEzQIA=;
        fh=pXQCCfdofZB5e4ZqzVRXiVuRGYeJnl2WhJnhDCL9qiQ=;
        b=qRzp/amupbRHm1plrMaPvhNhEeri3uHVf4JbHPIZmH8iXlCOQJeUs1GKPlHvxcj0Rv
         r4Tclj6YQdAcHY173MPpD6BrBbhZFsL6LLLzRyJ1pRRUBFAjj4YcTo8pshqj8G8mujq7
         PrjKIZkuTYHG47Cvds5kHiE5CbGF+Glh5N9vTqD4cN5VCR42SADe9p98ooyx4B39Agj4
         zCvV+D2kOcNvloGmT4dq1p/2RZxgA/8lXcmQ9lD6PiOcCKC1r1ujLKB7rWIcTbLJE8xo
         eSfWe/EvcVQTiXQExczJhydwMLmNdz2L+BNSmwrUNCImHjb5j2Oey5+oP1nrdqnzwkf/
         6Y1A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-49031539415si314609137.218.2024.07.09.08.46.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2024 08:46:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sRD2I-0007FI-17; Tue, 09 Jul 2024 11:45:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=H1KF=OJ=kaod.org=clg@ozlabs.org>)
 id 1sRD2H-0007Bq-CG; Tue, 09 Jul 2024 11:45:45 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=H1KF=OJ=kaod.org=clg@ozlabs.org>)
 id 1sRD2E-0002KN-Ow; Tue, 09 Jul 2024 11:45:45 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4WJQLW5dh1z4x1P;
 Wed, 10 Jul 2024 01:45:39 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4WJQLR3Cncz4w2M;
 Wed, 10 Jul 2024 01:45:35 +1000 (AEST)
Message-ID: <fd66f8ad-3dc9-4558-80c6-babf308dc90a@kaod.org>
Date: Tue, 9 Jul 2024 17:45:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v47 11/19] hw/sd/sdcard: Add eMMC 'boot-size' property
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, qemu-block@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Steven Lee
 <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>
References: <20240709152556.52896-1-philmd@linaro.org>
 <20240709152556.52896-12-philmd@linaro.org>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240709152556.52896-12-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=H1KF=OJ=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: HsDeFaUk7mEO

On 7/9/24 5:25 PM, Philippe Mathieu-Daudé wrote:
> Avoid hardcoding 1MiB boot size in EXT_CSD_BOOT_MULT,
> expose it as QOM property.
> 
> By default, do not use any size. Board is responsible
> to set the boot size property.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

I would move this patch at the end with the other patches adding
boot support.


Thanks,

C.



> ---
>   hw/sd/sd.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index c809961418..df0e2345c0 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -129,6 +129,7 @@ struct SDState {
>       /* Static properties */
>   
>       uint8_t spec_version;
> +    uint64_t boot_part_size;
>       BlockBackend *blk;
>   
>       const SDProto *proto;
> @@ -490,7 +491,8 @@ static void mmc_set_ext_csd(SDState *sd, uint64_t size)
>       sd->ext_csd[EXT_CSD_TRIM_MULT] = 0x1; /* Trim multiplier */
>       sd->ext_csd[EXT_CSD_SEC_FEATURE_SUPPORT] = 0x15; /* Secure feature */
>       sd->ext_csd[EXT_CSD_BOOT_INFO] = 0x7; /* Boot information */
> -    sd->ext_csd[EXT_CSD_BOOT_MULT] = 0x8; /* Boot partition size. 128KB unit */
> +                                     /* Boot partition size. 128KB unit */
> +    sd->ext_csd[EXT_CSD_BOOT_MULT] = sd->boot_part_size / (128 * KiB);
>       sd->ext_csd[EXT_CSD_ACC_SIZE] = 0x6; /* Access size */
>       sd->ext_csd[EXT_CSD_HC_ERASE_GRP_SIZE] = 0x4; /* HC Erase unit size */
>       sd->ext_csd[EXT_CSD_ERASE_TIMEOUT_MULT] = 0x01; /* HC erase timeout */
> @@ -2693,6 +2695,7 @@ static Property sd_properties[] = {
>   };
>   
>   static Property emmc_properties[] = {
> +    DEFINE_PROP_UINT64("boot-size", SDState, boot_part_size, 0),
>       DEFINE_PROP_END_OF_LIST()
>   };
>   

