Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA2EEC5B56A
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Aug 2026 14:38:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wtnao-0000rB-EK; Tue, 11 Aug 2026 10:36:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1wtnaX-0000Mt-R7
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 10:36:23 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1wtnaV-0001wb-Mm
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 10:36:20 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id
 6a1803df08f44-8f1e274ccb9so15537216d6.2
 for <qemu-arm@nongnu.org>; Tue, 11 Aug 2026 07:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786458979; x=1787063779; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=sNEEyf0DhnqBWvsZHpey8UBC3nPrPs683XYOT8uHTkU=;
 b=QzXPoyaW3Sk2ZheorTZhOz2I0V9rWOCNWVcH5F/nloLKrFMIaPjxHJEwckmfK3bdmt
 3RHXljWFqedZ2q8toL2TiQSGNLaOsGn1vX2KqVSUZIkOn+V7Zk8ePV/3i9oIgyqG36lw
 0NOmfmhL98eekDoEZAzU6zz41x6u/sqUlyG8LB5aT30aieTAZbHlfCavvN0G3U6grc01
 6lLhqcs0mSHiQL20s5Crs3nq4DGOOwOenU5bCIfoNGJeeZcbPQxEEp/ZXWFPDGWhThHl
 xi3xbdw55dTnASP9bW3R/IRSkLAzWKuheMO6qeyq1rYvYOCOvoh6lei6IPF9XHgt1DqY
 +N2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786458979; x=1787063779;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=sNEEyf0DhnqBWvsZHpey8UBC3nPrPs683XYOT8uHTkU=;
 b=seVp9OE16MndZCe4u12btgOjYl8leevnSBOxG1cxMoHx1tXdN/kXQaTxSu3ihc5JVO
 WWhdtVibr9TBN50MbQJBnnVCwXdz7SSDNBjUTG6Sn72z9WOkEP064gTehcivLt56QhuM
 Cm7ZMfvX/fAfMaCx6RPhB7uDrf151IdM+S6PHwzFpxhSPilMtHd5hjXPt46zVWfQEpbE
 VamXAGd0qSFtjrqnu7esawrn7uVCEpbPTIc+MRHiFEd9UJrdmTU/EeGBfJrEGFaNZhdZ
 Hyw3rjcV67rXHwzCS/aZJ7DUyI1mEi26LJwjddYzL4Tp+Rp+gMR+T9CeCEKcBGHGJACS
 DLeQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RrCMjF/np2kLQ66y2rEo8bUBY3DQ5a856jcCKT4PcHIO4tCLRvS7k9paDCDgv/wQt7L0JCbBdXe8g==@nongnu.org
X-Gm-Message-State: AOJu0Yy0zn0VrZ6aJ6fpzTiNGSYMXZzDQW7v/CM63EuZVj6Tn/9CD3QZ
 Z4tBNy8hr/NFt0kBSsNlKncs+DnyTygV4cLkAmx/rp1WBjwAZnIPIhx8
X-Gm-Gg: AR+sD12va0FNXmDpS9XUectMwgEENFvgTTpjsUL/E9Dgz7m/AWS9DqAMfeKg+xypE6C
 Pieeh/KAtjjAf4ooE790ESaMv0VgRIPNiqiDHdYsuK0bjFatsog6rvfJuNasAGyJiX7IZzOAgYy
 Kf5RESKR69v/dgyDtQ0jhY9OamyGsfT6M5g6OE3n2wPGYrJ632/jzLuDdyjhnAIjkYKICh6ikNW
 BB7udQT43piK2W9F2zzsOn8FYYcoqucx+MZua6Te1K//qWjPQHVW34/nttbcLXuCQ+L6Ow15/Yz
 TTaOBnhBZGK4x/mhiHnCFDQNJnP611cSRMAH2g5gJe9ticjrE59MTEXJmt+wpVZMug0mKXTVpjd
 Y1ZFASMdhbGGxhO+C0P/bX58V2xuohMXMtZ6iZnd4V5i2wjEvBZ+g7fizBnkyqNAzgJRu/S1K94
 vORIftQlFEWjBtlFV8+JMsPWpAjK3NfNZW4H8Ro0XDymicotibGPS1+l+LRS/EYUV3T6HY42sZw
 pH92eoT3x5oLuhjtYr0L2hItgf2GKY=
X-Received: by 2002:a05:6214:4306:b0:8ee:756a:f1cb with SMTP id
 6a1803df08f44-90a6692620emr34950626d6.28.1786458978556; 
 Tue, 11 Aug 2026 07:36:18 -0700 (PDT)
Received: from localhost.localdomain ([198.16.145.87])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-90a6c26e074sm681286d6.2.2026.08.11.07.36.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 11 Aug 2026 07:36:18 -0700 (PDT)
From: Marcelo Manzo <marcelomanzo@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Marcelo Manzo <marcelomanzo@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v2 18/19] docs/system/arm/raspi: move PCIe/GENET from missing
 to implemented
Date: Tue, 11 Aug 2026 10:35:55 -0400
Message-ID: <20260811143557.7862-19-marcelomanzo@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260811143557.7862-1-marcelomanzo@gmail.com>
References: <20260811143557.7862-1-marcelomanzo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=marcelomanzo@gmail.com; helo=mail-qv1-xf2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

raspi4b now has a working PCIe Root Complex and GENET Ethernet
controller (added in the preceding patches); move them out of the
"Missing devices" list and into "Implemented devices".

Signed-off-by: Marcelo Manzo <marcelomanzo@gmail.com>
---
 docs/system/arm/raspi.rst | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/docs/system/arm/raspi.rst b/docs/system/arm/raspi.rst
index 44eec3f1c3..a8fc37e920 100644
--- a/docs/system/arm/raspi.rst
+++ b/docs/system/arm/raspi.rst
@@ -36,10 +36,12 @@ Implemented devices
  * VideoCore firmware (property)
  * Peripheral SPI controller (SPI)
  * Broadcom Serial Controller (I2C)
+ * PCIe Root Complex (raspi4b)
+ * GENET Ethernet Controller (raspi4b)
 
 Missing devices
 ---------------
 
  * Pulse Width Modulation (PWM)
- * PCIE Root Port (raspi4b)
- * GENET Ethernet Controller (raspi4b)
+ * PCIe MSI/MSI-X interrupt delivery (raspi4b) -- INTx works; a PCIe
+   device that only signals via MSI/MSI-X needs ``msi=off,msix=off``
-- 
2.47.1


