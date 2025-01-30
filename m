Received: by 2002:a17:504:3e04:b0:1be9:327d:8ee3 with SMTP id i4csp136490njl;
        Wed, 29 Jan 2025 23:55:16 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWo6HRtyUlWqeUJ01O9BhnqOOo+X1vCB8Dh0Kk7/p50deb2OjIlLrwyx0uqcYvJEUzQLziV3fHmseVcjw==@linaro.org
X-Google-Smtp-Source: AGHT+IEiEXGaldWf6IuArJavW+9n2IUf0Cx3ICeKGrjh1ZJBj6mq1y+xMWzYbQPXNP8RYAu+XNeZ
X-Received: by 2002:a05:620a:448d:b0:7b6:d050:7210 with SMTP id af79cd13be357-7bffcce2f1fmr898787785a.15.1738223716040;
        Wed, 29 Jan 2025 23:55:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738223716; cv=none;
        d=google.com; s=arc-20240605;
        b=eF36BbvhM6go+Jr0v/YbU+gRxcifhyYyhiYnQu81Iv0o+/IfTG6pC5QlaUITN18Yqz
         KSBd+Eh49vhL+aODrMouArKIHyV442VLOed8cimfC5+W4qHN8hXyY+hWkQTVNLaSxRvl
         dI2PiOVmczRpqfayZftxnO2Xnn/QzVfbqSC7hfNsgzMRxl7lZle2CoDNjuAI1AldEjV8
         MMkCE0/Ge31BtIudxJ1Psyrnw0YZzcOWxQGY4Sc3WE62Wc/lDq3ItKNPk/mUuf0chE1Y
         +OucBnQfaMGFJgprz3JW3sciy0ceoXkY7p7/3gX6h37Lp5Et/QEWaYC7zQy8q78sX74W
         oZhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=83N77j35HMqhRcwCiguYX8Rv2G5zcDTT4f6mFCOCI9I=;
        fh=0/ExJPtUJL5yJSclSzBEiPgcvB+dJgGRllnMKfSNeH0=;
        b=PaF3X7CXxMq7PRIPbwDvo/HlsLSrHBdyf/94D6oi9r3OL5AHr9ltZV38pTFMdCOJ3u
         vCZj3pcibQp6ojUmxSNpYO27Q4Lf3bEP9LLWOgbnxj/3xbgH0cjKt1HH/+20swGiaavI
         +9G5cyCSr0537YUesVL1wkc6tSYwXFb7z+9w0c68tJfnH0YigRq4rif3SEClJfKMsmjW
         XrOvJVu8Ht01KwMZnOS8koYPvXY5nCrgFUHeYCntCKnSVof08xHxd0wcmzlH1Jfth0BJ
         FIPPchAggIxWoYBey4LVO9uuEfoxur1ur9lmENyfncCdbz1c4igJ3af3h2+YKvw5a2uJ
         SqDQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CUcv1Col;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c00a8d6436si119826485a.141.2025.01.29.23.55.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jan 2025 23:55:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CUcv1Col;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tdPOC-0002qY-U3; Thu, 30 Jan 2025 02:55:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tdPOA-0002qB-VG
 for qemu-arm@nongnu.org; Thu, 30 Jan 2025 02:55:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tdPO6-0001IF-4M
 for qemu-arm@nongnu.org; Thu, 30 Jan 2025 02:55:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738223696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=83N77j35HMqhRcwCiguYX8Rv2G5zcDTT4f6mFCOCI9I=;
 b=CUcv1ColNdaaRMxgt0ntGFaW1nVFeGdMTBkh5AJM7e3oKmkB2yeb2/Z16s8/XlOhjhR7iv
 lGJv63omZPmh1X0qDUjZHrDQPJ14M3x9aPo6PDd12wGwA8HWqYjt5nY1DBGMr4d1DAgUpm
 AF4dK08WXLLufiZvwjvrJmMuy/XtKfo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-2SB2Hv9KOSyOk4BrH6VvYQ-1; Thu, 30 Jan 2025 02:54:55 -0500
X-MC-Unique: 2SB2Hv9KOSyOk4BrH6VvYQ-1
X-Mimecast-MFC-AGG-ID: 2SB2Hv9KOSyOk4BrH6VvYQ
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4362b9c1641so1903405e9.3
 for <qemu-arm@nongnu.org>; Wed, 29 Jan 2025 23:54:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738223694; x=1738828494;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=83N77j35HMqhRcwCiguYX8Rv2G5zcDTT4f6mFCOCI9I=;
 b=W8c5CMdZk29A+p27qNznclLc+zQ6e+QSlfTf1dLqpljWvDBbaDcaUPGdnpupJvtw+I
 t89hpDC7Ups2u1XYOxQkt9NzwHYEN5A+RqlZiLaLIsCPeN8vvh40dJW2ummh0iRkSBeJ
 cXPMOVPrOCYu0Y+dGEHpcLhaT8lMiYLV7JmAR8GWL48L4mtr1vrGPxgoRhBHQ69iN9vg
 5KvkLFLGs6GcJaxvufuONLtIakayXMgYumNX/XUkyRPUdT5Q24kjYis9iUyzAKl/2W/a
 3eXeCGL1LHLN5cDaGaModcA8yxhQj3aQOnoECqp0VoL+lVF2TLbaSXO0gk4M4BdeNQ2G
 luFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXm961vJP+4AojzJXqaHiAyTlokdtC+xPaESt082G2RWNixh93+Nafbz4Dakj7y/hMPWRPHbaep1Q==@nongnu.org
X-Gm-Message-State: AOJu0YwZbJFE5sstNxxHO/Oc5JXpzlwr0gITE5NRIFCfylL+ad12icDn
 kuEmx6ACG/Mq8sNlkKE8hX2QydyC4K3Ed7PlyFuptcyP48uSs8/6wubBBSYXuG62zRJqbECOfMU
 2zkFATqxL7sLsuy26i25CXVM7/dTjYJ3EC7+uLWERcW+fgxu+pSc8zFCXuQ==
X-Gm-Gg: ASbGncuk216h3wX+InSJ4JLKHypRRyKv5p7maNZG+HMQyzMBUKw/KRcFLte8e4AhqNW
 w0P+O3qqWyxvUr8KpvloaF9OmmLJeJMzQKEhco4slJewfqExvvMPRa9XmpNqw6H94ywvME5QQyy
 FWB9PZEKFE/fP2klfpdBZHnb5j/OcAoA+9OzMoPaCHpHjdZX3f0k82vN88e74OcIb/DjvKh1fc7
 ctwjsWLlVjFB5Mh2W1zNVf+9K5O+j2oeGqq2VX7m7j5/i1mQPUisV+qOGLQzeA5MSQbhiISQZwu
 Vphy4dnRXO00DPZwhbsiHa/b3FjYe5iYGYKG
X-Received: by 2002:a05:600c:458a:b0:436:ed50:4f8a with SMTP id
 5b1f17b1804b1-438dc3c333cmr57323765e9.10.1738223694106; 
 Wed, 29 Jan 2025 23:54:54 -0800 (PST)
X-Received: by 2002:a05:600c:458a:b0:436:ed50:4f8a with SMTP id
 5b1f17b1804b1-438dc3c333cmr57323555e9.10.1738223693786; 
 Wed, 29 Jan 2025 23:54:53 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-50-234.web.vodafone.de.
 [109.42.50.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc2e384sm50609745e9.19.2025.01.29.23.54.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2025 23:54:53 -0800 (PST)
Message-ID: <bf801db0-ffab-48de-b8fe-1577c3bd17eb@redhat.com>
Date: Thu, 30 Jan 2025 08:54:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] tests/functional: Introduce a bletchley machine test
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>
References: <20250129071820.1258133-1-clg@redhat.com>
 <20250129071820.1258133-6-clg@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250129071820.1258133-6-clg@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jptPPB6iMASMCTd8Z286WByVKhpWZVYA1H-BDvPjU-M_1738223694
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
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: hNNCkQg4JV/O

On 29/01/2025 08.18, Cédric Le Goater wrote:
> Use do_test_arm_aspeed_openbmc() to run the latest OpenBMC firmware
> build of the bletchley BMC.
> 
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
>   tests/functional/meson.build                  |  2 ++
>   tests/functional/test_arm_aspeed_bletchley.py | 24 +++++++++++++++++++
>   2 files changed, 26 insertions(+)
>   create mode 100755 tests/functional/test_arm_aspeed_bletchley.py
> 
> diff --git a/tests/functional/meson.build b/tests/functional/meson.build
> index 5c782ceb0a98..a8eb9c9a7af5 100644
> --- a/tests/functional/meson.build
> +++ b/tests/functional/meson.build
> @@ -25,6 +25,7 @@ test_timeouts = {
>     'arm_aspeed_witherspoon' : 120,
>     'arm_aspeed_ast2500' : 480,
>     'arm_aspeed_ast2600' : 720,
> +  'arm_aspeed_bletchley' : 120,
>     'arm_aspeed_rainier' : 240,
>     'arm_bpim2u' : 500,
>     'arm_collie' : 180,
> @@ -86,6 +87,7 @@ tests_arm_system_thorough = [
>     'arm_aspeed_witherspoon',
>     'arm_aspeed_ast2500',
>     'arm_aspeed_ast2600',
> +  'arm_aspeed_bletchley',
>     'arm_aspeed_rainier',
>     'arm_bpim2u',
>     'arm_canona1100',
> diff --git a/tests/functional/test_arm_aspeed_bletchley.py b/tests/functional/test_arm_aspeed_bletchley.py
> new file mode 100755
> index 000000000000..10e6703b53cb
> --- /dev/null
> +++ b/tests/functional/test_arm_aspeed_bletchley.py
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
> +class BletchleyMachine(AspeedTest):
> +
> +    ASSET_BLETCHLEY_FLASH = Asset(
> +        'https://github.com/legoater/qemu-aspeed-boot/raw/master/images/bletchley-bmc/openbmc-20250128071329/obmc-phosphor-image-bletchley-20250128071329.static.mtd.xz',
> +        'db21d04d47d7bb2a276f59d308614b4dfb70b9c7c81facbbca40a3977a2d8844');
> +
> +    def test_arm_ast2600_bletchley_openbmc(self):
> +        image_path = self.uncompress(self.ASSET_BLETCHLEY_FLASH)
> +
> +        self.do_test_arm_aspeed_openbmc('bletchley-bmc', image=image_path,
> +                                        uboot='2019.04', cpu_id='0xf00',
> +                                        soc='AST2600 rev A3');
> +
> +if __name__ == '__main__':
> +    AspeedTest.main()

Reviewed-by: Thomas Huth <thuth@redhat.com>

