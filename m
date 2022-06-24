Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp362494lft;
        Fri, 24 Jun 2022 07:25:55 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sZdcL3g4Qfx5kSIXMdxclSYfN/3trKMu/K3t+OeMbMUCg+m/T0akG1LLEjzw6wkq3tcfGy
X-Received: by 2002:ad4:4e13:0:b0:470:42f9:f22a with SMTP id dl19-20020ad44e13000000b0047042f9f22amr21798815qvb.85.1656080755042;
        Fri, 24 Jun 2022 07:25:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656080755; cv=none;
        d=google.com; s=arc-20160816;
        b=SsD9ahQMcesQvq3iqDYQGhA1XzeWGdoxt56UmeSHSdYqnTNVbNJGLOffvoy6y0Js6P
         7+GUfF/RQ5tQQWcC4ofL4ityCyuuPN3ee+z/Luky3lHC5T9pP4Jg3ZDQJhXQy8rSi+Yw
         KCIeLqqYjiJJd+aUZMBZFF2JpzwWOSMIStuIq6RZ6Akxie9qDbf63MoTu2LAg5j0sNpZ
         EQ75AUuEcQLtsa+Nz0NG5P1BNIvm4fsPAUslkts2EBAX5/0n/feHKlMHnfpJlxjncT2G
         h+rxrTzotN29KbQuvwrNlvaoCKFLRhijWv59u7wAQfCgbVX0cDpuKvGQGQYXWO3yQrQC
         bCsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=6Hphajeow5XmypenLR8EsWskzKd53PSyFRVp74G44H0=;
        b=A6b92IK6O2uAC1Wxhb66hsMQG9GTeXqEZ7gGwEx06wFDFEyadhD6EG8QvtZhipcASC
         aQ7eGPzzXu5nTGy64BEiQsncNwRRCYYuvOJhkq54fb2xTPg5Kqh4AS0gYCAbxwMSAuRM
         dOZSYBybR927MzLtqF8o1sRaQ9zL7vWFe6MJ156RRiIffoRF2mXncJwuvpmieT9yrfK8
         f+doI8Lw1FsSuzuOEWGnDtMDfQzlUySmuXYUqj3U8br0//VcJhBVH1N9BSbralW9hAev
         qrYaK98b6kJArCeBqyPlxaTrBM7bH/n//yTATX0lKMbLU6uAqp4HZ/ftzzDFt+/O3Vpn
         05gg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=yeWM3RE3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bs14-20020a05620a470e00b006a6c64ef202si2069103qkb.698.2022.06.24.07.25.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jun 2022 07:25:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=yeWM3RE3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:42324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4kFu-0002ne-Gp
	for alex.bennee@linaro.org; Fri, 24 Jun 2022 10:25:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jlL-00028g-2E; Fri, 24 Jun 2022 09:54:19 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jlJ-00070h-J2; Fri, 24 Jun 2022 09:54:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6Hphajeow5XmypenLR8EsWskzKd53PSyFRVp74G44H0=; b=yeWM3RE3UiJwEZHz3MlsVa9Dik
 xI1MWPKSq8IFwCXKL1rQo4YTfks8k8OzH9RLpwnbPyi0g6mwEqbn21odtjjfVbZY6oAvj/ox6LxBV
 1wJfhhEzKkVOUwAgp3s4nCEEatdqhIgMVY+X2IQK3TeJWD/EVWU2EFr3tMc0XnUhrT69qkdhsyNWN
 Caq4LeaHbbtLsP2IN7Den5H3lX3lmePwvwvCcqZSZz6V+GS2D4QJOEjtFUG7HdXUwBWzJOOJbVt7x
 jWo1l76ZA/MUqAC3t+Sab3Haxuc64x+fyQwPmJwwdadOqnXP2dYTl/PTuZH1Cu5Fits08OZxovBgp
 wtdZmH5kqAxK/U5BZG/tKfOIQGpUJqrGPpvKLOZtqe0b9tEhzS1Zjg+YXGr9puh1muT/BEBBnh5YG
 /pliVP48mJqP7x67OaJ1Yg9ggvh7GjZ6zzTPMQuyTiyBnHqUUUlYqVYLaSICo3YytJgZwkBAqD4A/
 z8SDGQY+PUgtcHyMWz4pxHNJ45davxzhTvp7ODEAfRc2IohwTn74cz6cq7fDh0q6PEwy48pL8PJVx
 7HXSJRfCHxUw8ExbHufv7MUT19McF/hG9Nv4Io5yrNet7vziIrjOLgtc9/AbcH08OhdikdPbHD5+q
 WQ8ERPx1ZWpcXVbMUDfSaXQSgvjxgL3+Web3jlSa4=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jaT-00037t-D6; Fri, 24 Jun 2022 14:43:05 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 24 Jun 2022 14:41:08 +0100
Message-Id: <20220624134109.881989-54-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 53/54] pckbd: add QEMU interface comment for I8042 device
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pvY5qQjQHzgF

This describes the I8042 device interface implemented within QEMU.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 include/hw/input/i8042.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/hw/input/i8042.h b/include/hw/input/i8042.h
index d4747b62b8..ca933d8e1b 100644
--- a/include/hw/input/i8042.h
+++ b/include/hw/input/i8042.h
@@ -39,6 +39,16 @@ typedef struct KBDState {
     hwaddr mask;
 } KBDState;
 
+/*
+ * QEMU interface:
+ * + Named GPIO input "ps2-kbd-input-irq": set to 1 if the downstream PS2
+ *   keyboard device has asserted its irq
+ * + Named GPIO input "ps2-mouse-input-irq": set to 1 if the downstream PS2
+ *   mouse device has asserted its irq
+ * + Named GPIO output "a20": A20 line for x86 PCs
+ * + Unnamed GPIO output 0-1: i8042 output irqs for keyboard (0) or mouse (1)
+ */
+
 #define TYPE_I8042 "i8042"
 OBJECT_DECLARE_SIMPLE_TYPE(ISAKBDState, I8042)
 
-- 
2.30.2

