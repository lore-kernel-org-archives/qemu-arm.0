Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64255C982E6
	for <qemu-arm@archiver.kernel.org>; Mon, 21 Sep 2026 21:52:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x8lsR-000747-4V; Mon, 21 Sep 2026 17:48:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1x8lsF-0006ly-Oo
 for qemu-arm@nongnu.org; Mon, 21 Sep 2026 17:48:32 -0400
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1x8lsE-0000R1-Aw
 for qemu-arm@nongnu.org; Mon, 21 Sep 2026 17:48:31 -0400
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49e6c0fce17so18061585e9.1
 for <qemu-arm@nongnu.org>; Mon, 21 Sep 2026 14:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790027299; x=1790632099; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=notC94T4bNBsCvNTC7YA0uXb459RvcuTT7pI85Z8gIo=;
 b=S75sLXuWhVt0Dp3fosO6g6qRUNbMZ+l4acxKGdAKUCmZjf+q1f/ESDAAfmR1QXc8OP
 yWNgmmQU+c7aaQxCEEY7lDRAfdrE1GfyzxgQ4L1tJ8t501Vfs3QOvFOy57MTTqf44uRv
 wNpgyVVXxxG7PnXSJK7tNJNvDIuu4xRp4wTfFWQ/SGjbuDkIOKAx5uHS0YPJxRoQotC1
 dEpUPh0UP0CTOoWz0/8Y1ujJuGR9nSpSoWyDjAeAF8gl+JCm8DjDGMyjQijmNB2iMVlb
 XBobXAOiRWH4LWi6aX48pZz5w7Y+nC68UVSG8/TR7rcWLvNPde7sOFX7svxgsh/CoBnS
 Zxhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790027299; x=1790632099;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=notC94T4bNBsCvNTC7YA0uXb459RvcuTT7pI85Z8gIo=;
 b=ZejaPAb5hxYS4X5mHIm+ZOFYUWwej7buRbQAvTe4WeFpKsmgA2u6n4Fy8xZAHBOATb
 Xt1jTUWwI05egeQwwj/WCvGwAVLjYgh0HD63MtDrn3tat/NN+QwgfXPlTuslo5h4pBhu
 lwDKnElN0KvYpGpGtR5E83t6SAG9DL38Y3L8QQmuZeSqv649C1YAda3D2VJVEo2zpyeA
 hQ1F84IDmN0qS7yfl9z07tIxHS6kSyWpiz+9Hgqw4Osl+p4JT448aA8EhECea/mz+bq2
 bb92Fh5i7t+yrH1sr/HGpsWDwaOlmOP3g+wZzf3VLMnYeWHf+8sP/EaBE2cr7BboImZH
 270A==
X-Forwarded-Encrypted: i=1;
 AKwUvBy+bYHaFPUTOFPz1IE5HSDoCjuvTrs1Z0HbGe2v3u5B7QUW6KUn3eDI1uYRhUFKdzmAeATqrjcnRQ==@nongnu.org
X-Gm-Message-State: AFuF++lNZGfU7Wtvf+eh8ON8bD7ByQBEmQ5OOpwVhrD5g7og+ABLPMsL
 LAPa5IfOGF1CrvBbfC5ERgRm+rRqvZpv1qA0S7dtAO9qwNiuyIVGLVV2
X-Gm-Gg: AYBFou16Zi4W6P1ZjPSF62oUlBm5E2GTc7KWjMY7xG4iS705O9t3w3cRNQi4386Cy5v
 dnFIncV2YYMBBC+fPSMMzJ0Uj50spB0BUrd+A4PzsIu1SVCYeVBdG/CGdbNJKdlAC6Ij4h0i1n+
 8z4Re0h7fx2nYkxeZ1sGue9YXQ0Vlmm1WIRAgmw0qHkme3K3u9vo3OXbMiicbipuPLzaEEy6c+s
 YsH8y0D6sW/G9rfzrkj1rpKFG/0CM4Nez2OtAmIBBmIfBiDa+V+/GqT/VjMncrW1pKZYWc5AYL6
 tSgAqi6fqI/ZazcHyAKfNwiDfyPc8riaigqYRu8J96rx1p3cuF9MTCsoa7ol+bdAudb0Fq1Lk00
 YAWYEU0LJGHof0vvX43N8RFqufnUo+AAHww7/ho37oqV2YB/BvOsdx436ux2mdIgV2JMo+w2jRQ
 Usi3D5Zo/7/SFmPxWReq+7PKgH3oGLuR3biOPDsW16FbhHd34eWba3TvtiJtvCBp+m0zBuOyhy8
 VQVkcS2z2OxUAjcVtFFHe35DVvbzWrpxUIWgBtu8Aod+3gY7KB2F1a2dC7mVhBJDaMmWmSQI3T4
 8l0=
X-Received: by 2002:a05:600c:3584:b0:49c:fc6e:a3d9 with SMTP id
 5b1f17b1804b1-49fc584fa71mr223737155e9.24.1790027298896; 
 Mon, 21 Sep 2026 14:48:18 -0700 (PDT)
Received: from Provence
 (dynamic-2a02-3100-1c91-bf00-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:1c91:bf00:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fda0ce29fsm4986905e9.6.2026.09.21.14.48.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2026 14:48:18 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Phil Dennis-Jordan <phil@philjordan.eu>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@csgraf.de>,
 Jason Wang <jasowangio@gmail.com>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>
Subject: [PATCH 39/42] hw/usb/imx-usb-phy: Avoid casting from void *
Date: Mon, 21 Sep 2026 23:47:07 +0200
Message-ID: <20260921214710.29422-40-shentey@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921214710.29422-1-shentey@gmail.com>
References: <20260921214710.29422-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:31::11;
 envelope-from=shentey@gmail.com; helo=mail-wm2-x11.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/usb/imx-usb-phy.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/usb/imx-usb-phy.c b/hw/usb/imx-usb-phy.c
index c25566d0fa..2b2913c387 100644
--- a/hw/usb/imx-usb-phy.c
+++ b/hw/usb/imx-usb-phy.c
@@ -49,7 +49,7 @@ static void imx_usbphy_reset(DeviceState *dev)
 
 static uint64_t imx_usbphy_read(void *opaque, hwaddr offset, unsigned size)
 {
-    IMXUSBPHYState *s = (IMXUSBPHYState *)opaque;
+    IMXUSBPHYState *s = opaque;
     uint32_t index = offset >> 2;
     uint32_t value;
 
@@ -108,7 +108,7 @@ static uint64_t imx_usbphy_read(void *opaque, hwaddr offset, unsigned size)
 static void imx_usbphy_write(void *opaque, hwaddr offset, uint64_t value,
                              unsigned size)
 {
-    IMXUSBPHYState *s = (IMXUSBPHYState *)opaque;
+    IMXUSBPHYState *s = opaque;
     uint32_t index = offset >> 2;
 
     switch (index) {
-- 
2.55.0


