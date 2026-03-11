Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AECFCFD88DF
	for <qemu-arm@archiver.kernel.org>; Wed, 11 Mar 2026 02:28:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w09IW-0000XW-DE; Tue, 10 Mar 2026 22:27:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1w09IT-0000Qc-C7
 for qemu-arm@nongnu.org; Tue, 10 Mar 2026 22:27:41 -0400
Received: from mail-dl1-x1236.google.com ([2607:f8b0:4864:20::1236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1w09IR-0003sX-SR
 for qemu-arm@nongnu.org; Tue, 10 Mar 2026 22:27:41 -0400
Received: by mail-dl1-x1236.google.com with SMTP id
 a92af1059eb24-1271195d2a7so797830c88.0
 for <qemu-arm@nongnu.org>; Tue, 10 Mar 2026 19:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773196058; x=1773800858; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qs5wJWhyZT6XUWYG06o5mhToQbdPiBSiCeM1BJtNX2s=;
 b=Nh9DMWEd3ePaeXeywIk06gNze9WC/+i56hCd0rciCD/y7zhLc1PJMXEaHz0vVVg24k
 O2srS94hqYFbTncbI26mQDHSsIZb62tCYrGxnUiVi85FqnKQf147SUJ+1PDnitwZ+Ogh
 0TqqKiOxwWG6BS0y7+uYlFkkScKYFAzih8Z1si3QC0I8YA2SYblIUnRdgN/WbfJHwce+
 X+7SjbkhFXbR9/uBkfp9m/UHeKF72iXR4+1gQz8LFRe5cGEjwFCrKjU0n4cffbknQtxi
 F/YRCttr/NXoQWc5DcH48ArQYZ0WlujcqHYEdDhurVuB/ALZDte8kRL5Q6uAz5QTBZWZ
 D8hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773196058; x=1773800858;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qs5wJWhyZT6XUWYG06o5mhToQbdPiBSiCeM1BJtNX2s=;
 b=TS2AcgOM+ZQBDnmVNpuKugNqxTHqkk1osaDC913ZlU6o4UNsSItDjgPETSAr4n15di
 yKrms/EYaJKPrakcHZl4gkXM+q8egFUgQYlidP3sa9yxuXUpKkUlRtOmBBx3h41mawXs
 FBMsxCp8ryf3x8daxxr0tEiC+nrVxV4jXAL2mexSfr1EbTiq7piv6VKWu245BGyYNZr4
 wESC2PPTl7puwSeyLdr6YEGwQfsRx9DHjXuK0q/VAisGBEDDp0Bxd4XP1nZlsuFeRL3f
 qCwwZBEeLmdeIMUSDuTRLJEuNTrygFT96MkL/k98xPDV0c/OQQ5vswEnBOFzJiLg8FRO
 Xemg==
X-Gm-Message-State: AOJu0YzPob5GergRqUFuBhDIgrXFEDZK9pD0786FX2eNm3InsJswVnIE
 j59btNDnvpYmGSRDtl6soEWvEZwNPdZV5RvoNYrFulFmX0O44RZ6vs0V
X-Gm-Gg: ATEYQzy/9JnjuZ6APbA5NptOzBWMOUi2F7Rg/KIU+deKX2Ibbd4GBN7Y7XsX3YUZ+Se
 d2leW4T+W7Y/qGkHx36DMHnP0LT46EMGR5cVfziD7a1KM9vnZnW1qW2s3max6pQGwvzwK3jFtzJ
 EvKmFvsc7ayUJvGaPWxZEURGIfN5P64trYtHsit594jHygVfEFuyavpwiI7s9uzIf+lNsPiHmUg
 V0dv8CI2wmxvMVZY1kAdQwJBFwMwEYdu/LcUdGerSqm8/YDt445VuHGEVy1kZgMKc87DmN3tnbH
 oB086oAyWznioUFzi7gD5NsRJvyyeJ4sG9I6IPs80HLqKsD/qBrLRwonRD2IHd5hDWzGCz1ZJ5O
 42tWROhEXhdhB/Vrnej0Wb/AkkIQiBu+61qGxJ3mLpvPqpJMCB93Ng/7QhzlkOq0s37i9PfUZgS
 7jfs26DjxjEGpnxhEulA9d94wU/jKmfPAisN+OaKmmnk9llpq1MTQ=
X-Received: by 2002:a05:7022:6714:b0:128:c134:c86 with SMTP id
 a92af1059eb24-128e780efe6mr536449c88.23.1773196057900; 
 Tue, 10 Mar 2026 19:27:37 -0700 (PDT)
Received: from 192.168.0.29 ([2804:14d:4c71:86dd:80a9:8ba1:b664:ae3d])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-128e7bf1e1asm937039c88.3.2026.03.10.19.27.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Mar 2026 19:27:37 -0700 (PDT)
From: Lucas Amaral <lucaaamaral@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Lucas Amaral <lucaaamaral@gmail.com>
Subject: [PATCH v2 0/2] hvf: map granule abstraction and configurable IPA
Date: Tue, 10 Mar 2026 23:27:30 -0300
Message-ID: <20260311022732.64141-1-lucaaamaral@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260309214906.92578-1-lucaaamaral@gmail.com>
References: <20260309214906.92578-1-lucaaamaral@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1236;
 envelope-from=lucaaamaral@gmail.com; helo=mail-dl1-x1236.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FSL_HELO_BARE_IP_2=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

macOS ARM64 requires 16KB alignment for hv_vm_map(), but the guest
kernel uses 4KB pages.  When virtio-gpu blob BAR offsets are not
16KB-aligned, the interior-mapping path fails, falling back to slow
MMIO emulation.

This series introduces:

1. A map granule abstraction (hvf_set/get_map_granule) replacing
   hardcoded qemu_real_host_page_size() calls in HVF memory mapping.
   Non-aligned regions return early instead of proceeding with
   add=false (which attempted an unnecessary unmap).
   An 'ipa-granule' property (auto, 4k, 16k) on the HVF accelerator
   object allows opt-in configuration:

     -accel hvf,ipa-granule=4k

2. macOS 26 IPA granule support via hv_vm_config_set_ipa_granule(),
   reading the ipa-granule property to select HV_IPA_GRANULE_4KB or
   HV_IPA_GRANULE_16KB.  Falls back with a warning on macOS < 26.
   Warns if the resolved granule exceeds the guest page size (Venus
   blob mapping safety check).

Dependencies: none.

Changes v1 → v2 (Mohamed Mosaad review):
- Replace hardcoded 4KB with configurable ipa-granule property
  (auto, 4k, 16k) on the HVF accelerator object.
- 'auto' defaults to host page size; explicit values opt in.
- Add fallback warning when macOS < 26 can't honor the request.
- Add Venus blob mapping safety warning (moved from venus-nogl
  series to keep cross-series independence).
- Use KiB constants instead of magic numbers.

Lucas Amaral (2):
  accel/hvf: introduce map granule abstraction and IPA property
  target/arm/hvf: configure IPA granule on macOS 26

 accel/hvf/hvf-all.c      | 67 ++++++++++++++++++++++++++++++++++++++--
 include/system/hvf.h     | 15 +++++++++
 include/system/hvf_int.h |  1 +
 target/arm/hvf/hvf.c     | 49 +++++++++++++++++++++++++++++
 4 files changed, 129 insertions(+), 3 deletions(-)

--
2.52.0


