Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654D8606A31D
	for <qemu-arm@archiver.kernel.org>; Fri, 23 Oct 2026 14:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KH/4kaOA
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xKFog-0001ZP-JB; Fri, 23 Oct 2026 10:00:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1xKFoB-0000t7-NY
 for qemu-arm@nongnu.org; Fri, 23 Oct 2026 09:59:49 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1xKFo8-0004t1-KI
 for qemu-arm@nongnu.org; Fri, 23 Oct 2026 09:59:47 -0400
Received: by mail-qk1-x72e.google.com with SMTP id
 af79cd13be357-93e515769d3so83984185a.3
 for <qemu-arm@nongnu.org>; Fri, 23 Oct 2026 06:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792763984; x=1793368784; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=x4IaF9z025l/Fpk2IsxGNfdeO5acQjE/iVO9VTHti00=;
 b=KH/4kaOAZB1dSXdoHehavhqxkshPasDt+wkuMXMUhRq6q2Oee/9pCChGvC5Rnv6l/i
 HVUasVMy3rM3XbrwJv65XW0eCvSc9trBua0ujDE3Gg4yVrMYGB/2M7ExLDEaJC7+bXwP
 9zsqo9fVrRVW9qp7M26utB6xj68NtggrnTJhFdYsA9mxs+8SARePquD86UjX3LBA5/n7
 SNXeEA8vp65ALqV+Z/BsDooVo96X3YeJwnHhwmMOuAxhHuxgQZXiNuVcKDg7FmdqLyOQ
 B3cLNenV6n0JE7yIQqrQpzQisD3kNsnlc/Wh6zAglzWjOC8QMShyLChpp+CPfZ8RJKA8
 3ewA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792763984; x=1793368784;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=x4IaF9z025l/Fpk2IsxGNfdeO5acQjE/iVO9VTHti00=;
 b=Wa53+jPAYRoU23dUMH1YNdGKh16o4BzcM88SWDDwrQsxXj2xDG3SadFdk1jlg7VBNd
 rQ+R+7+6H8/MsK9VM8yrs2TlgptVgqSmqBEq2jq8FB+D00bQK7BicIr3haBy1E+11Xc7
 dkyt5I1Sc7Upl1xIMzssJtFG/HgcB9jtmngrYOUi4Sh2EswFK3tYOnHIJOXJ6bw0ODSM
 6XeYDFDXmGf6o6iWDyrksndbtnc4BaHIgHEMxv41MFq9UeynLwpT9M9ZBtlRtR1GRxol
 +Nx3t5dBTlm1wUCbG6ZlCVw44aCZ1ky7F4FX4lI97FIv6cdLDu/BkVTI81oz86j44k2k
 N+SQ==
X-Gm-Message-State: AFq9FYI6ruC/3z+JM2J7qJMTsAEqGYDElRfRxIyoj8komOyXHZrIF3dL
 RZnNZ+cKZNWZrw+E7/aVVojHGilkcv2BLvUOwkCNjTC1RPXTh1GTfP5CCdMdbVgw
X-Gm-Gg: AYBFou2IztKFWcGTBc4knitcwHVgj+w2jQ9aZ6GYiO9WKLTJcrf4PGh9Yfx66T9W6Rj
 93EjOLSoWYr1no8p+Pcre7K4IBN7TrIpVLISpRuThuhtjWeR6/ImMsqZV6XkYNp5r9Ugnk98KQB
 IUzMG8a5ooh/eWTPVozU2TQMt+8JxPXMAfydq39NYGMdiGq2XQSyYzyo7uF8zF9GMh1CFk2UoA2
 aQ59HIDotnggxMg063kKOkUw+qHsSxFYvADYSVZlxYWAtKOTcQGjeSm3Zkf8O1f9HZIl6CjUkq0
 p0gTjPXxjZvfcokmi12Uvq30DLxbXzywLKHQ4BDtBFMBG5xADTmLsul3RziwLP9WRXTPBBek2v3
 FG4lvTeIJrwzT3QUk1NCofJ7VFq+evzJghhzuSAW7z9sOWk4jrCuseA81P1+hKnvrb5AEeeUeAk
 Q/VWBzdGXekVZ6dPl9jFFvqQs+D0GLe/hg4xQu1Uyn+6YGltZ9+wahhcstUbjfKnbQyB8ah6esy
 /9h/Wu3SspDYVWTNF40a1x/4A46j4WHOJx3kCB6B6ziMhB8auIHIjKuOgF8CYP0KZPHNb2wRzcS
 gOSlfWlz50tZBTx1HA35qi1770+gjBe5Tk9lL38rvR2wD7V4V24d
X-Received: by 2002:a05:620a:278c:b0:93b:c537:fdb8 with SMTP id
 af79cd13be357-93f6f58a4a1mr404598085a.6.1792763983688; 
 Fri, 23 Oct 2026 06:59:43 -0700 (PDT)
Received: from localhost.localdomain ([2606:6d00:159:2900:450e:e72b:156b:33d1])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-94047811552sm23741285a.18.2026.10.23.06.59.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 23 Oct 2026 06:59:42 -0700 (PDT)
From: Marcelo Manzo <marcelomanzo@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, philmd@oss.qualcomm.com,
 Marcelo Manzo <marcelomanzo@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v5 15/16] docs/system/arm/raspi: move PCIe/GENET from missing
 to implemented
Date: Fri, 23 Oct 2026 09:59:23 -0400
Message-ID: <20261023135924.64990-17-marcelomanzo@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261023135924.64990-1-marcelomanzo@gmail.com>
References: <20261023135924.64990-1-marcelomanzo@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=marcelomanzo@gmail.com; helo=mail-qk1-x72e.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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


