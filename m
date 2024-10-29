Received: by 2002:a17:504:82cc:b0:1be9:327d:8ee3 with SMTP id m12csp86731njj;
        Tue, 29 Oct 2024 01:31:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV9kdZz1S3QClYbSuaAI8G1d7pwO7K0BDUOJSJNU5gg+txeK+I88lbJv4+/I3P/eysCd2j7qgf0GBwTrw==@linaro.org
X-Google-Smtp-Source: AGHT+IHgo+0iVbR88XXIMxnxGVCJxr1xF1wKtj3/FHtjPvDnnZ0OaeuXNVC2HcZYla/WPjxbGSB1
X-Received: by 2002:a05:690c:6f8b:b0:6db:e280:a3ae with SMTP id 00721157ae682-6e9d89d61dfmr118797337b3.23.1730190713264;
        Tue, 29 Oct 2024 01:31:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730190713; cv=none;
        d=google.com; s=arc-20240605;
        b=J8hc0eZpFlKJWGMVj6ziUcgBeGyZHOHyLE+jOgaO9f7KPvpGthVOJMGiAAzLxji/Pa
         9xNSUvyksfczKLdsCGNj/hvdotA949jNr0LlhtB/CzDo9xP8WQmDHkd59CvO4U5vVeZC
         UVCta+mXq6cFa66/f4kgIhzmODoCLlqxPFt+llDHQC/H1OyQgynUTik83mm5smxFL+0O
         cUP6jCAMUvzEBYBTXyS5XIC2WPfIGRMyUEDh1F7rDJaqfZzjLNVqnNsFS3f0Ym7YNnSD
         k/a8e7kiiWHwQAJYA6oC4q2jhsntLvgOfpicuwF4m0TgtafqCf0l+i34A63a3DZQ0Tz/
         5Bjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=D0XIheK9vGi6LoGcHwZHotZ/yJur9F9Ah+F10jU6REM=;
        fh=6ILVr1oEIca51E/DhccYCIeasNpl/rrGbbtj0Cc168M=;
        b=BDCbhjwMrgF5IFuv08xMxsvxYow9WAFKvaVNdxax0a0ESiXYCfOWrTx+N8Ph+h/J0r
         CmmwisJxHN+uyNL3C4uYJg4PaKgoIuz7Q4VtWEWCrfb+maZu6G08GZCM15zj2vOEdKEP
         ltqBqBr8Zjx/6Hy4Zl5/S8tnNfcwi1pjLbF+43GzsnVb0g3lo0c4zLBx+eH0/SeSiERV
         lh+Hdca8B9RopIW4iijhUEdbUoc6YM+pIsU1NEShj6E/5Hrq4MkqSm/peOlkz1ec5uTw
         LkZFavjCIuutRmi5r6KRjqa464Qvy4vZWnCvQkspM6pMvfTB0OtnS9ryNKjkj53LBye+
         jnrQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d179a118dasi105411486d6.233.2024.10.29.01.31.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Oct 2024 01:31:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t5hdb-0001XN-Dh; Tue, 29 Oct 2024 04:31:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=qqaY=RZ=kaod.org=clg@ozlabs.org>)
 id 1t5hdY-0001X1-IK; Tue, 29 Oct 2024 04:31:36 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=qqaY=RZ=kaod.org=clg@ozlabs.org>)
 id 1t5hdW-0006t5-FA; Tue, 29 Oct 2024 04:31:35 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Xd3Pm12rRz4x8d;
 Tue, 29 Oct 2024 19:31:24 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xd3Pg6jJnz4wcl;
 Tue, 29 Oct 2024 19:31:19 +1100 (AEDT)
Message-ID: <43e5d460-dcd2-42d3-8e87-d64599a833a1@kaod.org>
Date: Tue, 29 Oct 2024 09:31:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/sd/sdcard: Fix calculation of size when using eMMC
 boot partitions
To: Jan Luebbe <jlu@pengutronix.de>, qemu-devel@nongnu.org
Cc: Guenter Roeck <linux@roeck-us.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org, qemu-block@nongnu.org
References: <1bce4c22-9281-44c5-8acb-860881dc271c@kaod.org>
 <20241028162308.2152712-1-jlu@pengutronix.de>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20241028162308.2152712-1-jlu@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=qqaY=RZ=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: g3EFNX/hIxQr

On 10/28/24 17:23, Jan Luebbe wrote:
> The sd_bootpart_offset() function calculates the *runtime* offset which
> changes as the guest switches between accessing the main user data area
> and the boot partitions by writing to the EXT_CSD_PART_CONFIG_ACC_MASK
> bits, so it shouldn't be used to calculate the main user data area size.
> 
> Instead, subtract the boot_part_size directly (twice, as there are two
> identical boot partitions defined by the eMMC spec).

Fixes: c8cb19876d3e ("hw/sd/sdcard: Support boot area in emmc image")

> Suggested-by: Cédric Le Goater <clg@kaod.org>
> Signed-off-by: Jan Luebbe <jlu@pengutronix.de>

Tested-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.



> ---
>   hw/sd/sd.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index 2d3467c3d956..8430d5ae361c 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -826,7 +826,9 @@ static void sd_reset(DeviceState *dev)
>           sect = 0;
>       }
>       size = sect << HWBLOCK_SHIFT;
> -    size -= sd_bootpart_offset(sd);
> +    if (sd_is_emmc(sd)) {
> +        size -= sd->boot_part_size * 2;
> +    }
>   
>       sect = sd_addr_to_wpnum(size) + 1;
>   

