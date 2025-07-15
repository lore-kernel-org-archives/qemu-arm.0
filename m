Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B28C83F1D
	for <qemu-arm@archiver.kernel.org>; Tue, 15 Jul 2025 06:07:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ubYox-0001So-0D; Tue, 15 Jul 2025 02:07:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ubYoN-0001LI-G2
 for qemu-arm@nongnu.org; Tue, 15 Jul 2025 02:06:45 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ubYoK-0002XL-8a
 for qemu-arm@nongnu.org; Tue, 15 Jul 2025 02:06:41 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a51481a598so2552902f8f.3
 for <qemu-arm@nongnu.org>; Mon, 14 Jul 2025 23:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752559598; x=1753164398; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ki+ILgBCKd+2YR+JASuxhQ6wwDjeOJkBc8IOClgqX5Q=;
 b=bnpeHvX1aWypys4WgxDvtNpFnU2LPud16WF7FEhi758EXTIKLJADbdAjyhM1Ftu9vm
 cAgTQ/8RmVvCz8KQ38vXB2nAx/NqI/MdWBvoLoxHxmPZARpUuJGSqWM/8oaClm1h69//
 hNqaPkEwygOOmSwCf1i1TXhA8fKn0b02ILQaKXJo4CGLqCYrURCqVKulC9eiZEayghcl
 CVMhsmfb6fLPRZ9O2lI6wiHGOKfSiEOteBt4ayYs+9GnYNkjXnakbtPuURUO7WGBYR+M
 HkPpTZnBbItHbIXfsMkew5DcRIPhfv1sCuVF7lS++GKWueLN555q1L099ADqxZwlN0yA
 zaNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752559598; x=1753164398;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ki+ILgBCKd+2YR+JASuxhQ6wwDjeOJkBc8IOClgqX5Q=;
 b=EiXTrIx7kGAC0sM67TiuOTKUK7fPC2Fbub5CuWIOhngS0NAuK5bn/OGsa1rM8vsrHj
 tykdJSQRBrIRY9+8lapzcf7x7eZTdi7e0jQElNVILaUnuAIA5nmldR1kBGGjN/5pXaXf
 k3pDJmb94BVECz3pECgy0DnpDw95rPd1yQqwrsUC0e9jt0J0uWMBEEET1H7POQVGynIa
 2MqT/iAqkqtrGWd7SRvE+rYLGpDwiE+nJ1LcWpo66m0XW/NBjqYaeXMkxNt+eRQ2E6QW
 xKC+IXS7m1dWiDjGyG/5teQ3uSZWgr6sa3rb3fYLBZjPpkLqtNYOnBRlv4uyvuTxqYYp
 7+nw==
X-Gm-Message-State: AOJu0Yy/FG5WSkkiNIh1tzIj79yJmocY+6RjqzAtsszX6/hDNdTkw7jL
 DMKhOgnUhEB3Dy2wW89vdWsZhOeA5LurpAPFHwi9F82jPf/WZjGY3RMTWrlG5tAKL9Q=
X-Gm-Gg: ASbGncuyV0cAxmhGQdf0V9l7WV5nu23bc7dBfC8QUeAwP5GCZsU7P16CUNA6PxGiCib
 n8bTrhixnLhex7ziUWMNRFu+3WSCYRHn+XIYDjlxVwD585M4ofqO8nPK3LUTWwZLj+HcNTgOxRi
 GQaBhEVT15cFIsSIhovWlQjEsCwGO3hKhFTCUIzg97HX5wxDZAEFvUf36/GI8moDW6OtH/sZ4M5
 dGiw1pfp9mM20bXpoh9Ldt9ZrlyEJV3clCRPkyNXwougzVqoVS8VaAYl8VVGf3Mtm6r0FrWJqLn
 Z57sgm/1e5Q+5j/fx4bHa8NaUbpSp3d16U57f5iiWXf0gOgmigZS6vyceG6X/hnEfcySN8qvWss
 qDlMMiSox1LdW/rf/uOKhWlzMCi+xaRMvbNiiBGcGi3f2ceMYfJT/aiM6ZHY3Z6aZzA==
X-Google-Smtp-Source: AGHT+IEzAHGUqjGdbCoz/R3viNymPJUkU3ZIM26I+Wnd0ZPPaIq5pGBU7bc33iFiIkse9GnRp40FQQ==
X-Received: by 2002:a05:6000:2f81:b0:3a4:f975:30f7 with SMTP id
 ffacd0b85a97d-3b5f2e3b17bmr11426328f8f.56.1752559598238; 
 Mon, 14 Jul 2025 23:06:38 -0700 (PDT)
Received: from [192.168.69.239] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454d5032fcbsm192367395e9.6.2025.07.14.23.06.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jul 2025 23:06:37 -0700 (PDT)
Message-ID: <87c791c8-accb-40de-9ed8-d86bd179dd47@linaro.org>
Date: Tue, 15 Jul 2025 08:06:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] DTB build housekeeping
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
References: <20250708204806.1898-1-shentey@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250708204806.1898-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 8/7/25 22:48, Bernhard Beschow wrote:
> This series removes the bundled device tree blobs from the repository which are
> redundant to the bundled device tree sources. To make this work, the device tree
> compiler 'dtc' is now required whenever libfdt is used. Furthermore, dtc can now
> be built from the bundled libfdt if needed.
> 
> v2:
> * Allow building dtc from bundled libfdt (Paolo)
> * Find dtc iff libfdt is used (Paolo)
> * Remove dtc configure option (now obsolete)
> 
> Bernhard Beschow (3):
>    hw/microblaze: Add missing FDT dependency
>    configure: Ensure existance of dtc when libfdt is used
>    pc-bios/dtb: Remove device tree blobs
> 
>   MAINTAINERS                                   |   2 +-
>   meson.build                                   |  16 +++--
>   hw/microblaze/Kconfig                         |   4 +-
>   pc-bios/dtb/bamboo.dtb                        | Bin 3211 -> 0 bytes
>   pc-bios/dtb/canyonlands.dtb                   | Bin 9779 -> 0 bytes
>   pc-bios/dtb/meson.build                       |  17 ++---
>   pc-bios/dtb/petalogix-ml605.dtb               | Bin 9882 -> 0 bytes
>   pc-bios/dtb/petalogix-s3adsp1800.dtb          | Bin 8161 -> 0 bytes
>   subprojects/dtc.wrap                          |   1 +
>   .../packagefiles/dtc-meson-override.patch     |  62 ++++++++++++++++++

Being not familiar enough with this meson fu, I'm only queuing the
first patch, being a good fix in its own.

Thanks,

Phil.

