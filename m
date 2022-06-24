Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp361397lft;
        Fri, 24 Jun 2022 07:24:12 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uFhLifbO6+m2KikhRa0dZcuzGtrIMxOsqc0qbR/X9NjRsqDJJvIZtCsxaXi9U/5z223V/Z
X-Received: by 2002:a05:622a:34a:b0:304:f25a:ecf0 with SMTP id r10-20020a05622a034a00b00304f25aecf0mr13239812qtw.62.1656080652191;
        Fri, 24 Jun 2022 07:24:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656080652; cv=none;
        d=google.com; s=arc-20160816;
        b=HVEblKPxx2mi0N5KWkf02DGGdEqWxzP6+5dyETXEevPdORlniLtx7flMVk+5X1Hu7d
         upiSCei5Kr37GRzRvYmkNIjRXNY1qf9zKkFIB6WIchZy85XFb9w3YjLOtL3TIznSkGPS
         eZiz/feoWpG1CHBAez21haly7t1kpcY+MwcJPGLswxE3oMbvu6cFuXKJeyFgPfYUpMN8
         Gx/7wVcJitqRM16cEyWWG4j1HylnbbeZQalA8uEKGj74UtvVgbVg5afxtIyio+CN+jEc
         Fzc7at6qfqRH0VgUf3lEi2Uztq77i47e2WShqaCCCtGnRoQeK0k7x/ugCB41kTu/3MVP
         hBXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=pRgYgcKMk+LVeHplmBy38/Am3SUcdxIiwa0Zs40FFZo=;
        b=h7xvF47FSUTOYD0DBF8H6xZr0DOYyzxdAAZdEmMUrJoOv2jTyZKrZaJ/RE3wu3p/Yi
         aEEdFDMgEdqR3Hb8SMHEV9ZICUUrhrU8MIsOpGTjuwNnVXAP43FTsAqPKG/dHo9BQe2o
         833thBtEs37pNqxhuZLo6Ms+gX0eB3KYx53wlj76W75RG99LXxnfox8bXEAEu4C0vJzI
         +XahfV/DJbSRkVXk51oF5bRS65YluDmFuTAhy+PWA7NSm1DOdp3GnQC2FbqoPy93ynfT
         PttOvOxzasnTYNzKi4pdaPC4KasmKi0lUTLA4YUlR71MAWvaOQbAAT8o6r6TvKWPbQT8
         hLTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=F+MtvwHx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h4-20020a05620a284400b006a57b09338asi2086262qkp.726.2022.06.24.07.24.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jun 2022 07:24:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=F+MtvwHx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:36800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4kEF-0007Na-Lm
	for alex.bennee@linaro.org; Fri, 24 Jun 2022 10:24:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jbz-0004kn-2Z; Fri, 24 Jun 2022 09:44:39 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jbx-0005Yp-JR; Fri, 24 Jun 2022 09:44:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pRgYgcKMk+LVeHplmBy38/Am3SUcdxIiwa0Zs40FFZo=; b=F+MtvwHxZHCtRXcyzZ6g28u6he
 PLQYpQX5WaDxwjcZiBDUJ6Yp29o+9e00pk8oH5xxbp25kel9hpCFJY49EV0S2RChImT6K7LoQEH30
 tFx7XpHV2hSSdyu6SgP8fwF29oFcF0bAlG02ZViLo9ycVoVElU4S06CK0X7s4ZIs68ND/3+b8whhJ
 F17sPrM2IpnaDp5mulFPZ3TWPfHMimbPhsUzIXwYMdKuVWVp6OIUnx/98H9PPSkgRDqX5oHVkqIs4
 QCoSKvIW1o02ZIODdqiAZ3h62micyU503EPSLbt66+4MtCLiaEweV45nuR1Gi/ViLUjKe36sS2rwt
 vNhW71t84odoZHS7OrR5B1zCNT5RL1TtB/c/NyfVUmHaXhf+MuUTzBFNtpirWcuHzi7wjQuU7XjcV
 MGE77eT1Ko0huQP+Xz4OtQ5WCmufvshWs2gE/Me0FbkOb6le+og411qdSsEIJ5+rxegV7l9b20TzL
 E0dnx9NP6TbvKDQJ48YOfu3nBhWSyrbGN96S8ThAIVxMIWTt5BXVBG6sXQRE7yED5FzdcXCJhVC5W
 5TVede+x09k2repZr8YzaDJsCAA9pkGaCbB/+8g9FW5MMvrtoT179nX6XrEqc+W4cUZ0V+FQnQdBU
 Drc3AJKbJGJkDyVXDtf8p3VRNYMmbNjhoDZVIE/v8=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jaN-00037t-Fz; Fri, 24 Jun 2022 14:42:59 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 24 Jun 2022 14:41:03 +0100
Message-Id: <20220624134109.881989-49-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 48/54] lasips2: add QEMU interface comment
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
X-TUID: qag+uaSc63TZ

This describes the LASI PS2 device interface implemented within QEMU.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 include/hw/input/lasips2.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/hw/input/lasips2.h b/include/hw/input/lasips2.h
index 7e4437b925..03f0c9e9f9 100644
--- a/include/hw/input/lasips2.h
+++ b/include/hw/input/lasips2.h
@@ -4,6 +4,20 @@
  * Copyright (c) 2019 Sven Schnelle
  *
  */
+
+/*
+ * QEMU interface:
+ * + sysbus MMIO region 0: MemoryRegion defining the LASI PS2 keyboard
+ *   registers
+ * + sysbus MMIO region 1: MemoryRegion defining the LASI PS2 mouse
+ *   registers
+ * + sysbus IRQ 0: LASI PS2 output irq
+ * + Named GPIO input "ps2-kbd-input-irq": set to 1 if the downstream PS2
+ *   keyboard device has asserted its irq
+ * + Named GPIO input "ps2-mouse-input-irq": set to 1 if the downstream PS2
+ *   mouse device has asserted its irq
+ */
+
 #ifndef HW_INPUT_LASIPS2_H
 #define HW_INPUT_LASIPS2_H
 
-- 
2.30.2

