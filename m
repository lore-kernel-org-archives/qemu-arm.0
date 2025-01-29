Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp3637177njk;
        Wed, 29 Jan 2025 01:03:01 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVCxGAZhSdvpxiyZBI/1EKb4E2lN41BlT6+j9pJf9SPF92sSXQeNr3xSz6+cFK+0PG39WTFWSSWsye9bw==@linaro.org
X-Google-Smtp-Source: AGHT+IGMT5dQ4hiPIgIwJNa37vYPIwX8PNnkSXQR2sQqp9QszgFdfZLyNYojAYTocpQntN1nHmu0
X-Received: by 2002:a05:620a:31a9:b0:7be:3cf0:d712 with SMTP id af79cd13be357-7bffccea19cmr316962285a.3.1738141380809;
        Wed, 29 Jan 2025 01:03:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738141380; cv=none;
        d=google.com; s=arc-20240605;
        b=VhdR+Iq0w1kEhh1EChTpiW0YXJjxINol6mB/NVJXLRxPEPazOvx8UtZcg/UA61GFwb
         PKbv320xW6DnVwajPfW7YepWrWkiRROa1WfRsDgleZiuNG1Jk369HK8AlncViyuKDwZw
         /k0vIOWobkzH0EVjOSPkrZwNqsctDwsYY1ZeRX5gLUk631tE6mDJv742Yae60eGIZf0m
         dYxFTkyrXrzyYVeL5/s/nd58Eqe+j4fSSSq2Ov1Au2bpuopU7ZvcJo1qFzDInRYdSIb7
         31qPYya6TkHiul05LU9r5Sj1Irnic/gdZ5ZgpE1tfFU5/TKhOFMnHvyki8Nbf+YD+Y+k
         Rinw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=I7e+um+ya3M7kZNyHa73rArelg2A7q9Wm0o6GUWosSU=;
        fh=Qjd/M3aHpG+IrxTHwKSC+qSfq1nO6byWLJQfV9mIB9o=;
        b=BOwRKedSaXs9hv4gKtv9WW5pCMKxIeiL5oEYGDURe1kPMDqe7b7tE866/btAy0sD8l
         VXvPa7loWUOQirgl7EoZeN31enWHRlCASNozMsORDGZCA8/qiSOm7XsVcLWJditrzGyC
         ummlnSOuPec3dwF0iZizQHvyBiRMqfNTRhLj/+mZ5QJqDieNUVQK2kYF9nJgDamWvDD4
         qv8HhN6isQ/d1LKC7nSZ23WKPVbqBSkUNkuJLlb/wwnRTjfmJ0xpgUw18jY9rRcPmXx7
         af0D5w/S56uaphU4/KjTgvTGu+/0VHdo81VMLqXmxXLcIecnCSpd0FpadiwqkSwWZ2ae
         lm4A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dNmTO6vw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be9ae81c75si1411526685a.9.2025.01.29.01.03.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jan 2025 01:03:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dNmTO6vw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1td3xu-0008SM-HO; Wed, 29 Jan 2025 04:02:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1td3xn-0008Qv-Gk
 for qemu-arm@nongnu.org; Wed, 29 Jan 2025 04:02:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1td3xl-0000tO-Od
 for qemu-arm@nongnu.org; Wed, 29 Jan 2025 04:02:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738141340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=I7e+um+ya3M7kZNyHa73rArelg2A7q9Wm0o6GUWosSU=;
 b=dNmTO6vwBQeQFOw61EjmHhqKY5mArGQIICLqSjXD1xGWyHzlNn37eFHQ7rcfIlDAo9GBwV
 dVCYWZM/z+z34KF1Yd8I+AaO1J1eVU7t7OjvVcmAkZZxdE2X5a7jooxPHgufioGC+nAhQ1
 XToiefRKx5OgrMKU+XThlsWCdVH1s9o=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-91-8tcSRYfePXa4tAI--CPVOg-1; Wed, 29 Jan 2025 04:02:19 -0500
X-MC-Unique: 8tcSRYfePXa4tAI--CPVOg-1
X-Mimecast-MFC-AGG-ID: 8tcSRYfePXa4tAI--CPVOg
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4361ecebc5bso33325225e9.1
 for <qemu-arm@nongnu.org>; Wed, 29 Jan 2025 01:02:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738141338; x=1738746138;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I7e+um+ya3M7kZNyHa73rArelg2A7q9Wm0o6GUWosSU=;
 b=BTh5hOyNbgFfvni0H3kSrIvWZBIz34qR/xZd9WKm0AgkwyuaOsetg3Qjgb59hvZJhh
 KstN1utc4N6dWd3FHlekUFeKR4XS55azGQvLgCEOZiwCcYKKdKl74Ce7jv3mG/jvcNoc
 xI7mfXunf05E9Tx8NIRr+er8UdR4I8Y0o1gyZUuVltsLR5LGzK1nKJWVAVnqlIrME9m7
 AaIQgw5cf22Sc7cKcIRnD/t8M0ZDg8bTRBnEk7VjDJ1L5wpx2DP2HcURg73Mv9pOUQPO
 ZxhjJ8+ZNei2sn1CICEgepp8gpwCP3WOENyuJEQ2nMTJpCep5gDBkRC2K9qavVYE11eb
 4Yqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMO8F5xDBVbIpzk3+QzVIrhqRrz5yrW8t2rGy56ToQ6yGsT+aml7XyGrnyrNzTbJ7g1q7uwT7QIA==@nongnu.org
X-Gm-Message-State: AOJu0YxHw2tn2ATznXFHcQ53/vZAfREYv1Yf11mvVFCBXYZwejm/yo3L
 aOFWTP7FxFrYoPPWBVCVuiG1aY1ME6DKW7ltYloPSWF3qPVp+EsHL0rwejzxE77oMUwhd1oxRDS
 a44Q6dCyXTNcYouHrr/YSRZKCt5f+O44FfndPqYba7IAq9G2Ugg==
X-Gm-Gg: ASbGncuvHmtHqIk4oKmdMn0xpEFq1UJKGDQmobn3O2lxnjHCCmm3eBPCkc5NXtGHFKT
 3yvEMvGOxVDxGSfQMPk4zPXPc5iB0iYR1OYx499KlM37Vv6LSaHgmDppu3rmvYO9mOxIMJNK/KO
 cKC3H/elghClf3Pq3h6U18fVpdac2BTQkEb0Py/9NSS7KHfxMauSRSlE37+SBvUf19c97b9CcR5
 JolQ3KUEgYfYwZhwZfPJIBAKq2uhnRB4Hmm4xRl12QxCSu30xuNrSWFaAE+ujnwxZmLWhr29j/4
 c5AWkG45qOvJCzJntac6uCuJr3Ee1QlbAf8c
X-Received: by 2002:a05:600c:138b:b0:436:faeb:2a1b with SMTP id
 5b1f17b1804b1-438dc3c7b6dmr17394175e9.13.1738141337824; 
 Wed, 29 Jan 2025 01:02:17 -0800 (PST)
X-Received: by 2002:a05:600c:138b:b0:436:faeb:2a1b with SMTP id
 5b1f17b1804b1-438dc3c7b6dmr17393885e9.13.1738141337451; 
 Wed, 29 Jan 2025 01:02:17 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-50-234.web.vodafone.de.
 [109.42.50.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc24e73sm15012695e9.16.2025.01.29.01.02.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2025 01:02:17 -0800 (PST)
Message-ID: <e83c270e-e0e4-4af9-8896-600c15d31d28@redhat.com>
Date: Wed, 29 Jan 2025 10:02:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] tests/functional: Introduce a witherspoon machine test
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>
References: <20250129071820.1258133-1-clg@redhat.com>
 <20250129071820.1258133-5-clg@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250129071820.1258133-5-clg@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QXnsfkFrG3iJg9A_Axne11_OARP3KR58eZxBGpYlVEY_1738141338
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.3,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: SxaOKuhIufXd

On 29/01/2025 08.18, Cédric Le Goater wrote:
> Use do_test_arm_aspeed_openbmc() routine to run the latest OpenBMC
> firmware build of the witherspoon BMC.
> 
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
>   tests/functional/meson.build                  |  2 ++
>   .../functional/test_arm_aspeed_witherspoon.py | 24 +++++++++++++++++++
>   2 files changed, 26 insertions(+)
>   create mode 100755 tests/functional/test_arm_aspeed_witherspoon.py
> 
> diff --git a/tests/functional/meson.build b/tests/functional/meson.build
> index b7719ab85f90..5c782ceb0a98 100644
> --- a/tests/functional/meson.build
> +++ b/tests/functional/meson.build
> @@ -22,6 +22,7 @@ test_timeouts = {
>     'acpi_bits' : 420,
>     'arm_aspeed_palmetto' : 120,
>     'arm_aspeed_romulus' : 120,
> +  'arm_aspeed_witherspoon' : 120,
>     'arm_aspeed_ast2500' : 480,
>     'arm_aspeed_ast2600' : 720,
>     'arm_aspeed_rainier' : 240,
> @@ -82,6 +83,7 @@ tests_arm_system_thorough = [
>     'arm_aspeed_ast1030',
>     'arm_aspeed_palmetto',
>     'arm_aspeed_romulus',
> +  'arm_aspeed_witherspoon',
>     'arm_aspeed_ast2500',
>     'arm_aspeed_ast2600',
>     'arm_aspeed_rainier',
> diff --git a/tests/functional/test_arm_aspeed_witherspoon.py b/tests/functional/test_arm_aspeed_witherspoon.py
> new file mode 100755
> index 000000000000..12714323733a
> --- /dev/null
> +++ b/tests/functional/test_arm_aspeed_witherspoon.py
> @@ -0,0 +1,24 @@
> +#!/usr/bin/env python3
> +#
> +# Functional test that boots the ASPEED machines
> +#
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +from qemu_test import Asset
> +from aspeed import AspeedTest
> +
> +class WitherspoonMachine(AspeedTest):
> +
> +    ASSET_WITHERSPOON_FLASH = Asset(
> +        'https://github.com/legoater/qemu-aspeed-boot/raw/master/images/witherspoon-bmc/openbmc-20240618035022/obmc-phosphor-image-witherspoon-20240618035022.ubi.mtd',
> +        '937d9ed449ea6c6cbed983519088a42d0cafe276bcfe4fce07772ca6673f9213');
> +
> +    def test_arm_ast2500_witherspoon_openbmc(self):
> +        image_path = self.ASSET_WITHERSPOON_FLASH.fetch()
> +
> +        self.do_test_arm_aspeed_openbmc('witherspoon-bmc', image=image_path,
> +                                        uboot='2016.07', cpu_id='0x0',
> +                                        soc='AST2500 rev A1');
> +
> +if __name__ == '__main__':
> +    AspeedTest.main()

Reviewed-by: Thomas Huth <thuth@redhat.com>

