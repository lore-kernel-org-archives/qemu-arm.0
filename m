Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp1154321ejb;
        Fri, 16 Feb 2024 03:10:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVAY1gSdc64BCf+PXa5kqiwjsQXBeIIFsahWGUtERyQPR83A2ibqRzT23OoWwz/KVcLg4DEByLnzuRlun1U09OcCvJniMGP
X-Google-Smtp-Source: AGHT+IEyJe4yt3zKgPER0XvPAswScn5bwkX0xFPUfQX6rauAoUbGiqeJ8RNSmTQqpEXZfMyj7k9d
X-Received: by 2002:a0c:e20c:0:b0:68c:e799:ef4a with SMTP id q12-20020a0ce20c000000b0068ce799ef4amr4205799qvl.49.1708081812694;
        Fri, 16 Feb 2024 03:10:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708081812; cv=none;
        d=google.com; s=arc-20160816;
        b=FQAU9n58HCA7G2i1o6V4YXaXJueWSeLOCzY+C0lmqGNWvd4x2bQWxVhgQqdD8sBEZF
         gLkggiD/6kBBoSILX4VS160E7EgpTf72mtafd51QNlynwCVyUCuK6m0yST6v0Hzip0Jy
         BWSoFqbfTJneeM4U/Ut7mWKQv01H88aRowYljZh7HrURFoYU+tvf0uVHjRmz9ycXfxLd
         2FsjSkr4SUNPaKu+MLu6JgFA/z890MW1VULKq6Wvt9IPNBhjbjExqVLm2V/bvXAbNKd0
         +4BNRuar/HXt6wLRxXYNDJVcmG7Uq1c98/+y4/EN08Zh6ZiCVbYwBkra7lVFhAdni5KY
         gZQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=ayb72fTLc+P5DZxInFVQe9fe5BaOeWxKJSsQvczUXNs=;
        fh=d2ODzflfrnUzg+lCxMMukAHD7V6Syq/VuZoajNQKHPw=;
        b=OtY7jBqCTn6MUKCtPCeAGY+xA1348J7q5Q5jt6ROcbKc7jFGM2FiLZJ/TjN+gEkf9b
         s4W8C9kaVUjmp4nWo5QgNKw7GLJSQYpqFAb5Z53pmMtf2xzulDDxTIDJOlpMXXuAL8fj
         +RU2gKeIQF1bi6G9Z2K99JuI/6c64O5cGQjjN1A3eI0ewk3lebQ+xCJO1vcSj+u1+QMl
         HyIw0XbB8B5ODawSXTpUJJGcW1JMMSIkYzbgalM6PNzrlnJpC8qQqvUbfRDQy/xlQIbI
         J402auclKBn1xOoiHoxCt/CxtTyJZs/qvwohn6trY7rXRtDkEg+s7Rn/2olK8nLrpgEz
         6lzQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 12-20020a0562140d4c00b0068efbbe2ebbsi3560855qvr.179.2024.02.16.03.10.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Feb 2024 03:10:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1raw51-0001oC-MU; Fri, 16 Feb 2024 06:08:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=8DrN=JZ=kaod.org=clg@ozlabs.org>)
 id 1raw50-0001jv-D9; Fri, 16 Feb 2024 06:08:30 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=8DrN=JZ=kaod.org=clg@ozlabs.org>)
 id 1raw4y-0002Cn-EK; Fri, 16 Feb 2024 06:08:30 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Tbq111sLvz4wcv;
 Fri, 16 Feb 2024 22:08:21 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Tbq0x3FDhz4wcl;
 Fri, 16 Feb 2024 22:08:17 +1100 (AEDT)
Message-ID: <6ffab72b-c790-48c1-93cc-fffeb067dd5e@kaod.org>
Date: Fri, 16 Feb 2024 12:08:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/21] hw/ppc/pnv_bmc: Use qdev_new() instead of QOM API
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-block@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?B?RnLDqWTDqXJpYyBCYXJyYXQ=?= <fbarrat@linux.ibm.com>
References: <20240216110313.17039-1-philmd@linaro.org>
 <20240216110313.17039-6-philmd@linaro.org>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240216110313.17039-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=8DrN=JZ=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
X-TUID: omtPbFrXbmbK

On 2/16/24 12:02, Philippe Mathieu-Daudé wrote:
> Prefer QDev API for QDev objects, avoid the underlying QOM layer.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/ppc/pnv_bmc.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/ppc/pnv_bmc.c b/hw/ppc/pnv_bmc.c
> index 99f1e8d7f9..0c1274df21 100644
> --- a/hw/ppc/pnv_bmc.c
> +++ b/hw/ppc/pnv_bmc.c
> @@ -269,13 +269,13 @@ void pnv_bmc_set_pnor(IPMIBmc *bmc, PnvPnor *pnor)
>    */
>   IPMIBmc *pnv_bmc_create(PnvPnor *pnor)
>   {
> -    Object *obj;
> +    DeviceState *dev;
>   
> -    obj = object_new(TYPE_IPMI_BMC_SIMULATOR);
> -    qdev_realize(DEVICE(obj), NULL, &error_fatal);
> -    pnv_bmc_set_pnor(IPMI_BMC(obj), pnor);
> +    dev = qdev_new(TYPE_IPMI_BMC_SIMULATOR);
> +    qdev_realize(dev, NULL, &error_fatal);
> +    pnv_bmc_set_pnor(IPMI_BMC(dev), pnor);
>   
> -    return IPMI_BMC(obj);
> +    return IPMI_BMC(dev);
>   }
>   
>   typedef struct ForeachArgs {

