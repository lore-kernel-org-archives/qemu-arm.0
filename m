Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31947C5DF85
	for <qemu-arm@archiver.kernel.org>; Wed, 19 Aug 2026 18:55:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wwlQt-0005Uc-Jc; Wed, 19 Aug 2026 14:54:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wwlQs-0005UL-LK
 for qemu-arm@nongnu.org; Wed, 19 Aug 2026 14:54:38 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wwlQq-0007NZ-9O
 for qemu-arm@nongnu.org; Wed, 19 Aug 2026 14:54:38 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-499ac87c92bso8123865e9.1
 for <qemu-arm@nongnu.org>; Wed, 19 Aug 2026 11:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787165675; x=1787770475; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=xy6npAxreR3WN5RNBLJXXOS1U38mC2qbi1jMTA5TtLk=;
 b=LNDAujTlAO8PBQrNjHqX26kU8pygtu/IwqUa5tPV6kUvwStTwoA1HDSSh2oz0MNsz0
 HVhvDZgheScXqMViF6qimg1qnYAU8wUGkvmWO3rONyNILA8COTi2Z5bOJyEaonEv/4ci
 Ymq3Xj7PmQ1NzwB+glqWbtbOzeHSKUASGR2qw6056MI5MSPc5mn5J4uRzAektG7rsnrS
 Qcgx3hH4CuoJ6lkKv1KRjl4MjvddlfqUz6Jsh6y9ShIu9QGpxLLfo4s/gmOvZgv0rP4t
 Go0xYQ0ity+HeijVSCAmEd54Z0QlG5E1jaQsaS0Bi12Svu1rCppqyIpYeAFFWQWV00/j
 wqOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787165675; x=1787770475;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=xy6npAxreR3WN5RNBLJXXOS1U38mC2qbi1jMTA5TtLk=;
 b=VYqWWk6Et/kpa8zZTEDR6pRAzoGCXf0jHLn7lKR6mYcpyO3iJoGDbLUmRyYfSHholO
 XhtnXEmaGKU3uYg+1+YTW6/EfwSawCMsG4d/YbCgYjqpwN6agsdOvCiL+Pzs8adIFPtS
 rNHWb9Ovv+/8bIxo+tRnZrn078Lmp03o6/5uYE4ZYXJcRt6vhHojYnUtjv5hP4yYbo4I
 yKyCsD7SxSlZ1oz9h/WUfQyX64D4wtPDilEp3MZskhNnpuz+TlGzayPJq3TiIUV05CPN
 FLJ7phepzxnwmPAK9Y3mhMA7yk71wTzWFt1HiluV71ngXjOJKL1FCM2/+FYWyGDUNigP
 7Oxw==
X-Gm-Message-State: AOJu0Ywxp8vzcKSLhdjkdYwqkO1s24YLb61GREkktlMzEXRbf3J/brlW
 Wy0CutaPZrFZhDVq8/2rOYupaimY7EawUII+jLFdfGIUto0dQkXzqlpib/ZxtW5W+5FoUHozPai
 ti/Sb
X-Gm-Gg: AR+sD11qDsY33nE1g13cZMzWQzrApDhR04IgTyLYA/gMignz4i1iSVFW8g9uFag1vh0
 2g6hixV1OKxbzgRoQzTmQjRN9GRirknSdn4gZ95zRLd75vlx0k0YfqwVEgoyDWjeDk9qzkw7GiT
 njhkZpcUekWDe6uMNIJHHiyYgcZEA0jKLnGt9K7v9JHx2HOwIxTTe/iQYCbSJhwBGlNkjEOl8dR
 RoCa0KWM7lJVBqfjEAZOmAlCC30l7BHj12hT4jIM++SnESCEs9XYnPSxHwzVVxmEkvHf3oMqvqH
 kR5w2DzuuxuooGyYJwytdgN65dMNPH77C+qRyZZn5/ftk6a52Bm5nHLoHR540s1w/AqfrJQMhvX
 MEwUuBCbPqMX397C7Mld1qfjwDDilOsR6YodLCpyN8J8xQIVAOwYiVvEnoB0hkErzCU5XvAqwPt
 g34a28gdviT6bsYKz+xrJN2RLujAUq1vKEohO9rw3nIkIPD6IL02Bw56X/LedaaJ3Lq14UGZZe1
 BSssCW8prA4mMUD5DBfNdbFoCukCCO950HaPFduKFpmeqFb/V01rfdjgqfWMs78HacIBQ==
X-Received: by 2002:a05:600c:3596:b0:495:4749:16a7 with SMTP id
 5b1f17b1804b1-499aa1e269emr122257365e9.14.1787165674692; 
 Wed, 19 Aug 2026 11:54:34 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b145c9d7sm7995048f8f.15.2026.08.19.11.54.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2026 11:54:33 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Jan Kiszka <jan.kiszka@web.de>
Subject: [PATCH 2/5] hw/arm: Remove spurious WM8750 dependency from Realview
 Kconfig
Date: Wed, 19 Aug 2026 19:54:27 +0100
Message-ID: <20260819185430.3467629-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819185430.3467629-1-peter.maydell@linaro.org>
References: <20260819185430.3467629-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The REALVIEW Kconfig stanza has a "select WM8750"; however the board
itself doesn't actually use this i2c audio device: its audio is
provided by the pl041 (which connects to an LM4549). Remove the
spurious dependency.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 260d2f0751..5e9a0bd8dc 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -155,7 +155,6 @@ config REALVIEW
     select ARM11MPCORE
     select ARM_TIMER
     select VERSATILE_PCI
-    select WM8750 # audio codec
     select LSI_SCSI_PCI
     select PCI
     select PL011 # UART
-- 
2.43.0


