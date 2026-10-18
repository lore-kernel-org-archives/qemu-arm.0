Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06410CCF2C4
	for <qemu-arm@archiver.kernel.org>; Sun, 18 Oct 2026 13:37:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xIR3x-0002bd-Mh; Sun, 18 Oct 2026 09:36:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1xIR3q-0002Tf-IJ
 for qemu-arm@nongnu.org; Sun, 18 Oct 2026 09:36:26 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1xIR3m-0002Ky-Uj
 for qemu-arm@nongnu.org; Sun, 18 Oct 2026 09:36:26 -0400
Received: by mail-qk1-x72d.google.com with SMTP id
 af79cd13be357-93f2049ea7aso94769585a.2
 for <qemu-arm@nongnu.org>; Sun, 18 Oct 2026 06:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792330582; x=1792935382; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=x4IaF9z025l/Fpk2IsxGNfdeO5acQjE/iVO9VTHti00=;
 b=Rp81lUiWcDpBGTDCTBibkbGJt0EX6+wSUXes3dkIOa1l0PgECNI0b+IVr+XhDuyxs8
 t2n224i5LyViA/z+dDaAZSuE9y1JK5+9OWnBqwQdWLuS7dvPnwnCax+WOQYCAUA84bwJ
 a+uBGNgAu7/81wgWcXIHJB6kYInoI46kEl4PHwyB52X9Huuei80VoLTBzA4wUYdF60Db
 1gDsrwVkW0FqfGfMzg9IPiH7e12a9ZUDjPXS9G8A62ZI1S6p/REv+aU+yjaCdqFn4dbX
 5/Y064TA2H/qw4PTV0OIY0DQJS962de168E5NNumIh36MvXWLc3Zq0qoSNxbclrWzrT8
 R9Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792330582; x=1792935382;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=x4IaF9z025l/Fpk2IsxGNfdeO5acQjE/iVO9VTHti00=;
 b=ajeqxrW0ED7CzzVAij8TjciDbi65vxtY1JkDe4zAmcrn9EfhLySrvgqPNdr/6UylFB
 0vlXcjRdfC8MvCq4JARbyrLOkYgVdOiLiNTr7t4ezoj2/VzFfr3sScho6kFYR/dkyZfu
 5f91sMKkqvnZ7s54SetVOtLuh5r7ZfOLTPW2rPb8Wk3Q8Esi1G0crS36SHovM0H/t76R
 TykbnBTGKrduNRp9FQcQbpOQ0RsxbZXOgdn7O/z0l1VWRJzWOrzK0enQ2pk3z4l822ow
 ZlIe7nKaTFvzyk4grv6tJcSXugSQG7lscWDcyhlhSk9+z+SnwwBuH7EB0KgVWgOqeQHq
 n/fw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzZfqfthgKPX31pTZLpCi6VKo73Y9INYMq3gMUnvoCaSdwTTu4vM+6ZhAIcFH/dPBtEPZpkuMyzNA==@nongnu.org
X-Gm-Message-State: AFq9FYLo1mVf7oTye0WFW8uM9kVgYPraA1zdpNa6Gs+i0zobbuqnYATf
 M+f9Sn9RgIyfq/QV9ffbUsby8HNwFppelASC8+K/nOqYKrFRMoYXpjvG
X-Gm-Gg: AYBFou3PaE3Ybadgoi/8KOpRc+ssGat+xjysnYmbylq75iNRjDzxheW3rRNztKNyisG
 6oM8l2wkVJH/wOFFuZYReGebpoVY5RmDTiyHJ9DOwsU2kF3TWafpCn6Gd/h/W6YkjANu+TFxQmk
 Ar5+pRX95jjLnAxqGPRhj9NvsZLoOCKZ6Vrijx6ROpk1odymnevDSEBjNUm0O4OaYo+O3pnRNeP
 B6RAT0ncnVso7pMZjsXi8Z65nN/WjJ33Qr5c2cZG7gGvj8UgCV6MeG1te8K57dE/TzJYtcUPv+9
 unYObM4ZldxH2vWdRcFPhR9kky35kOW8d2sILa0JnmGY2Eaefag2onYycH1slED+By5wGM3H45s
 +RCCOCNec/1Slp32eXcBMoYhCXfcRCbbXqbDCgiK50bD2Q+Xv1EVLNKb2S4ilcG9VCFE5pROoGO
 LFuPdfPdnMzk+HkOAeziYQp+MjAi40jgVOK7A+x8nMSEdU4jZigmeZZISWhWcGJ5Ut8uald2mLl
 ni+Km9LAKmE/NhglgbKAA3/GzvrHA/N8DAKU+n/9FKQ5FMOG7bTDQUqOpFv9wEa/E/iFBo=
X-Received: by 2002:a05:620a:290e:b0:93c:ba44:673d with SMTP id
 af79cd13be357-93f29ceece7mr865957185a.23.1792330581954; 
 Sun, 18 Oct 2026 06:36:21 -0700 (PDT)
Received: from localhost.localdomain ([2606:6d00:159:2900:ecfc:9d0d:b95b:11bf])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93f2a854bb7sm459056485a.23.2026.10.18.06.36.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 18 Oct 2026 06:36:21 -0700 (PDT)
From: Marcelo Manzo <marcelomanzo@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, philmd@oss.qualcomm.com,
 Marcelo Manzo <marcelomanzo@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v4 16/17] docs/system/arm/raspi: move PCIe/GENET from missing
 to implemented
Date: Sun, 18 Oct 2026 09:36:02 -0400
Message-ID: <20261018133603.64323-17-marcelomanzo@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261018133603.64323-1-marcelomanzo@gmail.com>
References: <20261018133603.64323-1-marcelomanzo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=marcelomanzo@gmail.com; helo=mail-qk1-x72d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

raspi4b now has a working PCIe Root Complex and GENET Ethernet
controller (added in the preceding patches); move them out of the
"Missing devices" list and into "Implemented devices".

Signed-off-by: Marcelo Manzo <marcelomanzo@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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
2.55.0


