Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECCC606A31B
	for <qemu-arm@archiver.kernel.org>; Tue, 27 Oct 2026 14:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0v5UnAHs
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xLiDm-0000Ll-4h; Tue, 27 Oct 2026 10:32:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1xLiCh-0007Kk-NT
 for qemu-arm@nongnu.org; Tue, 27 Oct 2026 10:31:15 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1xLiCf-0005CS-HW
 for qemu-arm@nongnu.org; Tue, 27 Oct 2026 10:31:07 -0400
Received: by mail-qk1-x72f.google.com with SMTP id
 af79cd13be357-93cb9e9405fso200542485a.2
 for <qemu-arm@nongnu.org>; Tue, 27 Oct 2026 07:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793111464; x=1793716264; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=x4IaF9z025l/Fpk2IsxGNfdeO5acQjE/iVO9VTHti00=;
 b=0v5UnAHshkW9461/PXPcU9GoCynKP/Otw1RyMQCI+ZNokNNbBCjw3NTele4EjhStzK
 d2EVkEqm8tQd77Rn3VEouYvNRSZhOWuJmYykAN2Fi5+RsZaS+61ZplaRIGpFT7KjlBlh
 g+li+HaKMbUvik+jIkVy38o15dluWtAgogNwqGac7Zm/SVPEKr/GxtJtt1g7Uxd61yns
 WhVx8aszxt/0sn2oxWs1bzFwRy26u8JXFMSCQcWRIo6Iy3pnGU+u3yhVZ0NcohLPYwLZ
 eR+rWUttB+BBcqV4S/IF9RKUfEtBdbXAZ3uQjMTUUUPwieb1+CBS+CoY5ss/HazEGvFn
 ansQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793111464; x=1793716264;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=x4IaF9z025l/Fpk2IsxGNfdeO5acQjE/iVO9VTHti00=;
 b=Y03XogPjSQ8zcKNiNGjGAUIWkS3aH+kZgOxKkzHZuO/tPAZ4EW3XmJpPtUtyujXy7y
 IEDFFEXjNn8cKDoG3QE1UZnj2mGP6HNnTM1kEKID7JMdDR2aQlflnLMQMvrQtvKKPyMH
 QSqZcfCyKdMVi4qiMf7cWtIuS1CUVbi8kbnOg7ciTzxxqkKH/ecNVDG5Qbq5s2PtMMzO
 qwUuZSe2bgwZaPV+9OW4GGBvHm/mClzdIueT34qhpDeM5fPSCGQi5zpnRPgtX457ceWT
 Sk2aZuvZRitCEuk/ohO60qj2B1qKwTP5i96ry1GZkiutODg6ZFhVLi2/1emuM0kSZsBT
 zx4Q==
X-Gm-Message-State: AFq9FYLPWyFIVmIlCQ8w5YcXret6DQ+SZMLFZgdrF5HywHhIqTD5oy47
 SftEbIndUe/RVtvrVnPNhmAHju3cA0hwVWIVoQRBXISOW45sk8+EETZUn96OSka3
X-Gm-Gg: AYBFou3JZHqhQq1m36EI4N0fMclXXSfQvJzuQnI5pJXSVYbqY7fpE/GPe/sMfIlOEPE
 HFT1cNYx31yJn9MNs3l9XVpwG/WIFuH1sgVrgW90gOqG1cONdgeUoQ8E1nXF5hxn0kgD6uyOXbt
 44h3c8KJiIENynXMs7pRXWkmTIJYeC8NBSnMUGpq916aENz0WwqyXUEWIKmpL5tLpcZMwIHU+sq
 H82s2muRDlLEA78YHOHwLvKvsZrw3qHci8tAD3gnPlZcSKUzMmutOs8RaeOkImq8VhMz3jhPEYZ
 9KjNW/o3/xYKKOjSJ60av0M0L6dO4sDN+LBrTdGW5uzqiCqtb/Htydpco6Hog8Yj4Wo9iMfQNlB
 Yb+6kN5Csd/9TV2us2hugJvwQy6zg9XipULfB0cVOKbVtihqJFKFcegg7XYNBa5BGD+TLblLC6g
 xb73iljqC5CkeR24V1q+XybPkH5edjI5ZXRkBNOnx2zj2YEdtgiZCcuae9NQtAAjHe7t7OtqqlK
 aVJEnzdWfuOa7Fz2RbfXU1//tKorFiMvbjAnlIXz7IMlFwqSTWeds+U3Ga/iCGKVWI6DwGyb2hj
 bhOKM6b94WoeHwXcq77/fC728mHMV9XSGEQThjjuSj3YAaQn1Ik=
X-Received: by 2002:a05:620a:4008:b0:93f:3bb5:545c with SMTP id
 af79cd13be357-940ef914106mr1625290885a.18.1793111464410; 
 Tue, 27 Oct 2026 07:31:04 -0700 (PDT)
Received: from localhost.localdomain ([2606:6d00:159:2900:9872:3600:589:5f3a])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-940f0a78c06sm986400885a.35.2026.10.27.07.31.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 27 Oct 2026 07:31:03 -0700 (PDT)
From: Marcelo Manzo <marcelomanzo@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, philmd@oss.qualcomm.com,
 Marcelo Manzo <marcelomanzo@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v6 16/17] docs/system/arm/raspi: move PCIe/GENET from missing
 to implemented
Date: Tue, 27 Oct 2026 10:30:35 -0400
Message-ID: <20261027143036.44973-17-marcelomanzo@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261027143036.44973-1-marcelomanzo@gmail.com>
References: <20261027143036.44973-1-marcelomanzo@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=marcelomanzo@gmail.com; helo=mail-qk1-x72f.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
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


