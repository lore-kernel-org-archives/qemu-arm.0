Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp351041lft;
        Fri, 24 Jun 2022 07:10:03 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tvXgCESVRxwtqq+nJ/Lua9hehkR78T9XZKOOAF1MKo8BiyKNpcUz1jqdiWmJUkqHeJp+kn
X-Received: by 2002:ac8:5b04:0:b0:306:6cea:18e2 with SMTP id m4-20020ac85b04000000b003066cea18e2mr12938796qtw.95.1656079802882;
        Fri, 24 Jun 2022 07:10:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656079802; cv=none;
        d=google.com; s=arc-20160816;
        b=y37qA9D4Sp6fXRtYqbZl/rZ3pZdGDCGzJJHs+IRWbmFfamJFwgio2oJAj8ndjQYCa+
         Ob11wXQfHM0oxJC/fGkTIgAEHGFCy47ijFGREyTEveJxQSEUFyBMpHGi6/zEPMR/edQt
         9c9eWFq2o5bXCXKxqoLXA1EwChF400Rrp8ccASByNZ4Veym3LnI/rwf2BJNgRHWUfBEt
         0y4t8KU1ILBK10WeWJTkIDdxvdN96+0jmRMc/mC0RziXWjCYU4IMu0zDHOZzUXG0gjxu
         2hSDtclYtZzX25KZTLf1jomC83pFzX2GSKDoHAYS70musFHIpRs6trxmLN+H4Cft0MqR
         hmWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=zg0t8VdiNRtLycCcEYbqAdy/8pY2GIqdnnIop5Qoibo=;
        b=IpyCTh/43X2g31BvD2sdnBNmENS71tuTGCE1k3MbnpmkV/VYsIO50uPOc8NPu3aMCL
         equyiUHbAECPolrml2MZp7a+YBO3F7Z4UbSi5+LbBp6StLuo8halL5gW6yN1jJ2KaTcC
         Dm5/yYoCwBJGLhfPZ8MtBmYNQ8IRD94dWvG7qs7hggTIgLhkIbG48BhNnUcdSrmM/ZvS
         CWsNcX2xXq/6NNDt6x++lp4KYbdn6xgjfKqwjDpzP2V0hFj7tHrpMja/vhCJYCn6Vpyq
         3vT6ZaBoQN2q36jtiA57BHR5uxegkL3Zm2OkQpFOs0k1+XY48SxXDmQMikeh+Nf9rfeD
         LWog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=kSK+IV0j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f13-20020a056214076d00b0046435854368si1573473qvz.93.2022.06.24.07.10.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jun 2022 07:10:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=kSK+IV0j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:55742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4k0Y-0005nn-Ce
	for alex.bennee@linaro.org; Fri, 24 Jun 2022 10:10:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jb4-0002vz-Ny; Fri, 24 Jun 2022 09:43:42 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jb3-0005Jg-A9; Fri, 24 Jun 2022 09:43:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zg0t8VdiNRtLycCcEYbqAdy/8pY2GIqdnnIop5Qoibo=; b=kSK+IV0jL8wS1wwF8Wv/tZYARM
 MDxcnKAgYzFYiAVOvF3QeVfVTVHYZ2BWsmxJHyrJf5+049iEnaz0UC7GjLKeFLIiXBMPyNEuDhl9N
 HLoqEXYrIwlM/prylT4T6TpvjRYvWzLOqoqcJX4DzdFsc47XivjjEhy1+w1JIwqbYyHsTob+Y2TDd
 F3eZ0uDBRHNov5cNoRE8J3lpCr7Iy7WTR/8Lh78gHsa2Y2UTUBuunpr0PrFxw4s96TmX1DQRz9w8W
 tIdpOcx4iN/KDLwzbBn8nGZ+sLDZ3hNIAhu3IiLkjR0ljNjZnPxxQNQQSrVevXV+H7F+jqoeydOzx
 6obdCL9klMZUBqJ38d7NBXLSsLBMnOyBODYN+ytm2k22JFymO0+cr/QONAaUWva0RMdEWEN5vlL6t
 BKy3CvE+XiinijQ1B/X4+J6wWIvAdDS3VX7dFeMutJpKeg8JvUma3Lu//KhYjR1HVj/e7djhVnwiQ
 YVKatJK27WBhLYGbX7hNMgS2JSdZTVGIF/Gzf0Xxp2MZIvUpmqySrZ8+5m2/rCL7fPfQAV15KtmqN
 mjGuAySy2ji2lHuSZyHqJFbMf18F93GYcdtFmpjQqXkif2yhutsznrcbUdpO2OLSNGj2qEbelMvJE
 DHNyjRmPdp7Hr9yYNG1uXCJUQEgp/U8DSlCZIoKfA=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jZU-00037t-Kc; Fri, 24 Jun 2022 14:42:04 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 24 Jun 2022 14:40:48 +0100
Message-Id: <20220624134109.881989-34-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 33/54] ps2: introduce ps2_lower_irq() instead of calling
 update_irq() directly
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
X-TUID: dZFE0Gxe7+hK

This consolidates the logic of lowering the PS2 IRQ into one single function.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/input/ps2.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index a14281bc54..bc0bcf1789 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -177,6 +177,11 @@ static void ps2_raise_irq(PS2State *s)
     s->update_irq(s->update_arg, 1);
 }
 
+static void ps2_lower_irq(PS2State *s)
+{
+    s->update_irq(s->update_arg, 0);
+}
+
 void ps2_queue(PS2State *s, int b)
 {
     if (PS2_QUEUE_SIZE - s->queue.count < 1) {
@@ -554,7 +559,7 @@ uint32_t ps2_read_data(PS2State *s)
             q->cwptr = -1;
         }
         /* reading deasserts IRQ */
-        s->update_irq(s->update_arg, 0);
+        ps2_lower_irq(s);
         /* reassert IRQs if data left */
         if (q->count) {
             ps2_raise_irq(s);
@@ -1001,7 +1006,7 @@ static void ps2_reset(DeviceState *dev)
 
     s->write_cmd = -1;
     ps2_reset_queue(s);
-    s->update_irq(s->update_arg, 0);
+    ps2_lower_irq(s);
 }
 
 static void ps2_common_post_load(PS2State *s)
-- 
2.30.2

