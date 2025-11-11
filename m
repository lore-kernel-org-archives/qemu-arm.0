Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D6C8CCFA18
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Nov 2025 18:00:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vIsfN-0002E2-Fb; Tue, 11 Nov 2025 13:00:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1vIsf8-0002AF-Mi
 for qemu-arm@nongnu.org; Tue, 11 Nov 2025 13:00:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1vIsf5-0002s1-NT
 for qemu-arm@nongnu.org; Tue, 11 Nov 2025 13:00:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762884010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=150Xt/V/GkrxDJPhyoPI44/9b/esPd6tBQN6rtW3DXY=;
 b=GBBDdTWiAXdlPX5/S2DXcmyaX6YjKclqwZbjpfV3hNo9RWyJFtXoqJcvVCUkyLxo8tnoYo
 gMfdKJ7dxO5DODO2FWR14mJIJy0Bqk4KvhJuGvYu54RhtWAsyXgP9djk2dqW4JfPwhDwbd
 2f08gIVRsM0qOpZi4KsKNHEsz4BJ3bw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-522-92bfBjqoM1iiJGd_eh3VZw-1; Tue, 11 Nov 2025 13:00:05 -0500
X-MC-Unique: 92bfBjqoM1iiJGd_eh3VZw-1
X-Mimecast-MFC-AGG-ID: 92bfBjqoM1iiJGd_eh3VZw_1762884005
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-477632ef599so6487115e9.1
 for <qemu-arm@nongnu.org>; Tue, 11 Nov 2025 10:00:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762884004; x=1763488804;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=150Xt/V/GkrxDJPhyoPI44/9b/esPd6tBQN6rtW3DXY=;
 b=bfKHFEJfw9buUBNrXZfP/E1jf92qwTFJVu5eCkyUhF/9u1dKg5T0Q22P45Kpu9ijnm
 nE+GjMNSkqasX+RFcRIb1oLNgrQpmi1a+jV3mSjffTwRM2xs1T/2wOQ/BhvubL/nac/+
 YsOFxnXJ/i3hOR4wzBp/p6u2jNJ3Z4GVaK/HbxT/W38k+F+6Ag1N5HIY5M5iUePMF4uv
 cH5JJk3OKe6VL1kK5HcBQbtqZUHY62HyAbjL6SnltbVKOUbKbkJDUnRvTISPfWlBA7Rh
 DeazFul0PMVWxtAQfKRQ8PMw+fm/vhYoYNKbOnQvwugPl0LeeMY5AOI372yHweKFpKaT
 mhdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVInmHPhHo5RbuZY4P81kxC+2Cz5qlm9IDkn7HcV1/2SupigALUBSg+jU07T0FcJdroGrPxRhumQA==@nongnu.org
X-Gm-Message-State: AOJu0YyeAf8D03F+4h8aa1dw1dskNkb8Xm1g246lQP2wCKcsy/ukvfK+
 NjBbz8NCMODOo/1XActoqWw+MbXtjksF6fXqGnlbWays1CHzkziyuF6kzFQ/HygZvB5lbLklnaL
 mkhnSwFoHts3+1RNq05Ztc99qXVTczu9ne6n2pJXoCiWjBOUMwPoeMg==
X-Gm-Gg: ASbGnct5ikzwXBAQ5+TlTH4k1BHOYf4NoAcqChVOZ6MO6cVrh8bfYD6hYgHPB47/0Cz
 FW7zzrWkCHyA0tmiMGSCopFFCrfWcSIo5p30dtc8wVJ2SOGjlehtbKVWDb/q0xHhBZ8tNyPawtN
 KaGx5xweC/PTPXFj5GMpM08n9ZCX4IFHWB1aDwofPA1UE/jaNuqHprOqBvcNdZjVss87zZwwzQE
 SBs4QiFwO1/1pAX9d5cCr5E4ylQBfIiUskoyaYhpfMmOINZ308Th3egP0YMtCgyqoIXEKaLQmk/
 1Peo8GW2axmScgwUsuaB53BNVfpFghcB0+iCx0j6/3KiPLtfSBkyOAi/aesP8+Trn9/Fcec=
X-Received: by 2002:a05:600c:1989:b0:475:ddad:c3a9 with SMTP id
 5b1f17b1804b1-4778732a909mr1798505e9.13.1762884004611; 
 Tue, 11 Nov 2025 10:00:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGM1Mos/oup87tmy8eOd1p6t0oy638lUHGwygjZheFFfdCYWRrJW8PGM2l2zvXiwZ8uUYwiUw==
X-Received: by 2002:a05:600c:1989:b0:475:ddad:c3a9 with SMTP id
 5b1f17b1804b1-4778732a909mr1798135e9.13.1762884004201; 
 Tue, 11 Nov 2025 10:00:04 -0800 (PST)
Received: from [192.168.0.7] ([47.64.113.41]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42ac675cd25sm29922278f8f.22.2025.11.11.10.00.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Nov 2025 10:00:03 -0800 (PST)
Message-ID: <d5da233a-c1ca-4d85-b380-7d7c34e13bb7@redhat.com>
Date: Tue, 11 Nov 2025 19:00:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/16] tests: move test_virt_gpu to share.linaro.org
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>, Kohei Tokunaga <ktokunaga.mail@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 Ed Maste <emaste@freebsd.org>, Paul Durrant <paul@xen.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-stable@nongnu.org
References: <20251111171724.78201-1-alex.bennee@linaro.org>
 <20251111171724.78201-13-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20251111171724.78201-13-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LbNg7drvXWn_BNtdeTR2KvnvnONeaXgc9IWuWwuK8u0_1762884005
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 11/11/2025 18.17, Alex Bennée wrote:
> Linaro are migrating file-hosting from the old NextCloud instance to
> another sharing site.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: qemu-stable@nongnu.org
> ---
>   tests/functional/aarch64/test_virt_gpu.py | 16 +++++-----------
>   1 file changed, 5 insertions(+), 11 deletions(-)
> 
> diff --git a/tests/functional/aarch64/test_virt_gpu.py b/tests/functional/aarch64/test_virt_gpu.py
> index 4e50887c3e9..89bd596b548 100755
> --- a/tests/functional/aarch64/test_virt_gpu.py
> +++ b/tests/functional/aarch64/test_virt_gpu.py
> @@ -22,17 +22,11 @@
>   
>   class Aarch64VirtGPUMachine(LinuxKernelTest):
>   
> -    ASSET_VIRT_GPU_KERNEL = Asset(
> -        'https://fileserver.linaro.org/s/ce5jXBFinPxtEdx/'
> -        'download?path=%2F&files='
> -        'Image.6.12.16.aarch64',
> -        '7888c51c55d37e86bbbdeb5acea9f08c34e6b0f03c1f5b2463285f6a6f6eec8b')
> -
> -    ASSET_VIRT_GPU_ROOTFS = Asset(
> -        'https://fileserver.linaro.org/s/ce5jXBFinPxtEdx/'
> -        'download?path=%2F&files='
> -        'rootfs.aarch64.ext2.zstd',
> -        'd45118c899420b7e673f1539a37a35480134b3e36e3a59e2cb69b1781cbb14ef')
> +    ASSET_VIRT_GPU_KERNEL = Asset('https://share.linaro.org/downloadFile?id=lL8wgnMmSXZo7Co',
> +                                  '7888c51c55d37e86bbbdeb5acea9f08c34e6b0f03c1f5b2463285f6a6f6eec8b')
> +
> +    ASSET_VIRT_GPU_ROOTFS = Asset('https://share.linaro.org/downloadFile?id=qOn1wbfKmS6KVHZ',
> +                                  'd45118c899420b7e673f1539a37a35480134b3e36e3a59e2cb69b1781cbb14ef')

I'm currently working on patches that check the functional test files with 
pylint, and that will complain if the line exceeds 100 columns. Could you 
please use the old indentation here to avoid that we exceed the limit?

  Thanks,
   Thomas


