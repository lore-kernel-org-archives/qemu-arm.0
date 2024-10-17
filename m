Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp333992njb;
        Thu, 17 Oct 2024 10:16:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVVfns/1HB0En6GRYBwfd5L6Nz/mzcNhU6CBUUTzsYXE3NtZO3OJzgtWYOy/9Ll9Yq9ZJNKxOy5eeivBQ==@linaro.org
X-Google-Smtp-Source: AGHT+IE9zrb13ICEHFDwgkmiZmz2/NwYx8kbvyE/7dJJBh9lZ/JQBx4wKE4TVt5V3d/27tHihzY5
X-Received: by 2002:a05:6214:3986:b0:6cb:dd09:7b54 with SMTP id 6a1803df08f44-6cc2b8bb819mr120375956d6.6.1729185396668;
        Thu, 17 Oct 2024 10:16:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729185396; cv=none;
        d=google.com; s=arc-20240605;
        b=IDCMaAUub588yuHmysWpAY/jRN8m5o55p8nt5VXNJAxQK5Elggl5sf5TcHgch5+wnr
         ycZp6rlMSKfi2BANHKJJdm0WMy0hKBrQyWgVSARSWQL5RQAgD4D2t3XZk74Wde879pDR
         Sn7hSJciQbzf14HkGGq7GKXxc/lbwx9JSox6mezULAw4MqC+HXWA5l0WfkwteB4oHQcM
         p8yue8RC5vjERTMwQdHzdIylAo2sjdI15B8SFi6p81KO4OSkCQf6mKQnPHhvoH5tAj49
         M4BaLQCh2Pe6U+NxddfeligTwogb6VbWGNFay/5OG1La8lRiUBgN68FOzPuCyfjtPSWa
         nH0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=EvuPZhiNa/w6z9pGKPjV6aHsr0tG/I535eh9chaLunI=;
        fh=vCf+ijVu54lqhgr0UKlsbbSsUZLfJyv0rOAESGbZ27Y=;
        b=ImT4uwjp94Af2CR0lxxFDZh3rCmieP3k1esCtjEz6LQFgS71B/YNoBljRVbYJLNiqY
         xoPSX9QLrVx63LgK/IXwq8eTgvEntry8r2DW6NjqYhbm94aTJn0d74ZSi+l631PTolq3
         4DSv5kV3LMN8xBP934fEQuvbDs8DFcoLPGpFovzCi+R8o6OohUrQi9AX0gv0ZsQcejd8
         L/FCmDUBAzxm4riPDio+e1SNMjutYnSJVpisJc9R44ga7ZTP2PiVHt/PnaNuxH/SRI4H
         rrWw230ownJ3BehnC8NJgoLJaLcRWJXqKeI+Ob+eMvbtb+F1WJah5JtvqMkdBQ7uCdRl
         X27A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ALQLvaX3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cc229cc820si67468346d6.76.2024.10.17.10.16.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2024 10:16:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ALQLvaX3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t1U6Y-00038g-CT; Thu, 17 Oct 2024 13:16:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1t1U6W-00035e-DP
 for qemu-arm@nongnu.org; Thu, 17 Oct 2024 13:16:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1t1U6S-00072W-Ae
 for qemu-arm@nongnu.org; Thu, 17 Oct 2024 13:16:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729185358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=EvuPZhiNa/w6z9pGKPjV6aHsr0tG/I535eh9chaLunI=;
 b=ALQLvaX3w/eFMPwXb6pLDJcYhWyPxwTC5Dym0mw1oo/3nbcZtu7Qp0DAJIHs68+nqFpuSS
 Sh/jyig0zbZ4oIOdeWluacQRwwChuT6DWSWgCoF3qEpVsFu241BF6ZZqQ/5LsGOvOarM3U
 bPN12gtXTyXSV0eMCQr2c0ekzjVvB1U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-544-197uzD38PYK3nRdLlKFXvw-1; Thu, 17 Oct 2024 13:15:55 -0400
X-MC-Unique: 197uzD38PYK3nRdLlKFXvw-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4311a383111so7309215e9.3
 for <qemu-arm@nongnu.org>; Thu, 17 Oct 2024 10:15:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729185354; x=1729790154;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EvuPZhiNa/w6z9pGKPjV6aHsr0tG/I535eh9chaLunI=;
 b=LJKSeLw5cJfLSyz8a+tuWa4m49BxaTd+Jf3uRw3qq7NHaeARbFx2Rs93dOCIN5khHd
 pJ5QMU1RpKFkfHSwJh/gARovCBT/xqFYRqcDA82JGVWiP4YlK9f1IYLykyo8lcYlHGXw
 9ag8yukb/oF+Psh/uPLUo69FW9GJDz6gjI3Y8KZKFDeiJtNeoD1PTIq9MYMMIePNZ7V9
 gXNJ4cirDWYfckLrtRrwoUYqS8Q+B1HCTzBSf7vA8jzzhy5Bth90hor9OSbaUA2RhWTL
 S07FcIiPvSdc712P5tZCok0BhI1fH0QhvTKKm6cl74BbYZSFblH2F6c0iiIwy7eeUHx6
 wofg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWphq21SQ6edVAZmxTLSkZAVyDIz/nqyRMGv5l7Ql8u7b+0r2OA555r7586hRuTWKlG8FGPhjdgWA==@nongnu.org
X-Gm-Message-State: AOJu0YxcGYClBiBrPcyIhg8Mcgk1YIrEAc4i0cYGuh0CDRk05TLSDeeO
 XSqmmZlYrgjhub/xJWRSqE3TpiqHIAD0EFbwRWodRXSQZmxwn6IJ0xNACOL+SsRyGP+9IKQHl+S
 P4yZlDDnHdUTm430OYRxqWPAvyutSnmp2YatImmVBfSYdE/AXeoR5qK+ofci+
X-Received: by 2002:a05:600c:1d99:b0:431:58c4:2eb9 with SMTP id
 5b1f17b1804b1-43158c430f0mr26798895e9.3.1729185354409; 
 Thu, 17 Oct 2024 10:15:54 -0700 (PDT)
X-Received: by 2002:a05:600c:1d99:b0:431:58c4:2eb9 with SMTP id
 5b1f17b1804b1-43158c430f0mr26798735e9.3.1729185353904; 
 Thu, 17 Oct 2024 10:15:53 -0700 (PDT)
Received: from [192.168.0.7] (ip-109-42-50-24.web.vodafone.de. [109.42.50.24])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4316069e8f6sm1500445e9.30.2024.10.17.10.15.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Oct 2024 10:15:53 -0700 (PDT)
Message-ID: <3ba99e35-3ef0-4c70-b7bc-e3682d090204@redhat.com>
Date: Thu, 17 Oct 2024 19:15:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] tests/functional: Add a functional test for the
 collie board
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Guenter Roeck <linux@roeck-us.net>
References: <20241017163247.711244-1-peter.maydell@linaro.org>
 <20241017163247.711244-2-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241017163247.711244-2-peter.maydell@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.068,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: bxzfjFmQgd7H

On 17/10/2024 18.32, Peter Maydell wrote:
> Add a functional test for the collie board that uses the kernel and
> rootfs provided by Guenter Roeck in the linux-test-downloads repo:
>   https://github.com/groeck/linux-test-downloads/
> 
> This just boots Linux with a userspace that immediately reboots
> the board, so we wait for the reboot log line.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   MAINTAINERS                         |  1 +
>   tests/functional/meson.build        |  1 +
>   tests/functional/test_arm_collie.py | 31 +++++++++++++++++++++++++++++
>   3 files changed, 33 insertions(+)
>   create mode 100755 tests/functional/test_arm_collie.py
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c21d6a2f9e1..10b3360ed40 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -929,6 +929,7 @@ F: hw/arm/strongarm*
>   F: hw/gpio/zaurus.c
>   F: include/hw/arm/sharpsl.h
>   F: docs/system/arm/collie.rst
> +F: tests/functional/test_arm_collie.py
>   
>   Stellaris
>   M: Peter Maydell <peter.maydell@linaro.org>
> diff --git a/tests/functional/meson.build b/tests/functional/meson.build
> index c90c02517a0..0450805a9c4 100644
> --- a/tests/functional/meson.build
> +++ b/tests/functional/meson.build
> @@ -51,6 +51,7 @@ tests_alpha_system_thorough = [
>   
>   tests_arm_system_thorough = [
>     'arm_canona1100',
> +  'arm_collie',
>     'arm_integratorcp',
>     'arm_raspi2',
>     'arm_vexpress',
> diff --git a/tests/functional/test_arm_collie.py b/tests/functional/test_arm_collie.py
> new file mode 100755
> index 00000000000..7e144a0a8fb
> --- /dev/null
> +++ b/tests/functional/test_arm_collie.py
> @@ -0,0 +1,31 @@
> +#!/usr/bin/env python3
> +#
> +# Functional test that boots a Linux kernel on a collie machine
> +# and checks the console
> +#
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +from qemu_test import LinuxKernelTest, Asset
> +from qemu_test.utils import archive_extract
> +
> +class CollieTest(LinuxKernelTest):
> +
> +    ASSET_ZIMAGE = Asset(
> +        'https://github.com/groeck/linux-test-downloads/raw/225223f2ad7d637b34426810bf6c3b727b76a718/collie/zImage',
> +        '10ace8abf9e0875ef8a83b8829cc3b5b50bc6d7bc3ca29f19f49f5673a43c13b')
> +
> +    ASSET_ROOTFS = Asset(
> +        'https://github.com/groeck/linux-test-downloads/raw/225223f2ad7d637b34426810bf6c3b727b76a718/collie/rootfs-sa110.cpio',
> +        '89ccaaa5c6b33331887047e1618ffe81b0f55909173944347d5d2426f3bcc1f2')
> +
> +    def test_arm_collie(self):
> +        self.set_machine('collie')
> +        zimage_path = self.ASSET_ZIMAGE.fetch()
> +        rootfs_path = self.ASSET_ROOTFS.fetch()
> +        self.vm.add_args('-append', 'rdinit=/sbin/init console=ttySA1')
> +        self.launch_kernel(zimage_path,
> +                           initrd=rootfs_path,
> +                           wait_for='reboot: Restarting system')
> +
> +if __name__ == '__main__':
> +    LinuxKernelTest.main()

Reviewed-by: Thomas Huth <thuth@redhat.com>

