Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp1994506lfi;
        Thu, 2 Apr 2020 06:48:49 -0700 (PDT)
X-Google-Smtp-Source: APiQypKmqk+2MH2lZQj8BYgavHuZifyzNqBZ/jZh7TrRoW7zTy93ZsxWDjR5RfJjyvGWdCCc+2dJ
X-Received: by 2002:ac8:24e4:: with SMTP id t33mr3020287qtt.107.1585835329239;
        Thu, 02 Apr 2020 06:48:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585835329; cv=none;
        d=google.com; s=arc-20160816;
        b=Y2B4aThaEdeIGXWPSU+BLUmkbSvU67nOycUiOpc9v3ypZI1dckKSxoFRmNbja8t86T
         55JBJzwxG/0YOhQibQKzMmxxKETsF2btqa/sjvOXqk5Z+7RB8Gemz6a/UJkVd6uDY+p0
         dUXDHGSkcF4qCqYNNULuXS5FrE/L0YCopfnQgBaTqBN21rndDnHDswZgUpnun7b4y9cD
         lzpBPOdTuY65FLfEuwNDSgwcLop/4G6Xk+sVCP3TUfG7s3ykJi2qkTDa5jI7xieCmU7c
         MtXgXs/RoVnFa3IMJAKNnPve2u3RX5zOnbxOAAPit3T8lpf2IBmYhIbmZ99XQRN9dY3R
         sYhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=h4Q7MSpHXVMJ49cK44wbGbgCP5J9MGmDVmW1uuYRWUs=;
        b=UPcuC3EzHqNRBWurx91hFovz8vYrVhdn+U4tT4Hi9gGbqw4rtTpASj4Y5TLZttnIzo
         aOeHDctVZ4iNRTi3kcVZ0RQi51nmdyGmcOmmyv9QfG8N5eoaCxlAKRfrt/VpqTwSmuEx
         oEVyeq2nuXiY6ELj5yiFJXWdZ0NWgDcpdtG6dn2wjoNDyI54zhU/mN17JKLhQa5wquLN
         nbxSoYrdNUNzgT+eifsqovtcCekx8vBDuxUfE6F4vX9DsTwjDzF1yQt/I1mmii5D43vm
         BNBItF/9gdVIbQs5YBfqs0XZviHM2xzXwfvtAfsJflNYVH5Zcao0NJviThgz6InJg014
         YDLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Qm+SzTwP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d13si3168711qvo.115.2020.04.02.06.48.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Apr 2020 06:48:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Qm+SzTwP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jK0DA-0001Xc-Fn
	for alex.bennee@linaro.org; Thu, 02 Apr 2020 09:48:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50731)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <edgar.iglesias@gmail.com>) id 1jK0Ak-0006Qy-CH
 for qemu-arm@nongnu.org; Thu, 02 Apr 2020 09:46:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <edgar.iglesias@gmail.com>) id 1jK0Aj-0001xl-Cy
 for qemu-arm@nongnu.org; Thu, 02 Apr 2020 09:46:18 -0400
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:39278)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jK0Ah-0001oj-4e; Thu, 02 Apr 2020 09:46:15 -0400
Received: by mail-lf1-x142.google.com with SMTP id h6so2765409lfp.6;
 Thu, 02 Apr 2020 06:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h4Q7MSpHXVMJ49cK44wbGbgCP5J9MGmDVmW1uuYRWUs=;
 b=Qm+SzTwPSelbgQGrPXZ0eRecqfbd6cMSBxsf+s198QHT+gl8uK1hQQlDnIfTa/OyOY
 yOx6T2K49fZbybzn1i0iDKyxwfaEq4J6/n93gtIO+PerrYZrhvRQaNP4D/Q/tD9MchZ3
 +UO6r94GyrcM0AXr8PHLdeuSldt9NI2bUZ8Y6IBC/EIrSDhRYaKar8EHbAON4zkvQKIB
 VfRpqkMsW11mpwxJ8dZU5B7i6TkbSCPn4CqZ71QGSBO5n4z0Atd/Po2j4XuSeEy8Ixl0
 6NxV3SrMtzoXJaAVahYnp8zTpMyOKnIYkJugOPZJRnmwGRmt+i5kuGHcKvnuJftVd4ma
 ou7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h4Q7MSpHXVMJ49cK44wbGbgCP5J9MGmDVmW1uuYRWUs=;
 b=gSEkghOm7G+wwSl6GEA+8Fs0JOBo3WzB0zLrGhwNUmCMif+1JemLKGWTNNLiNSaJKM
 U86B/4sYqJ3fLt/L5c1a7Z9vwcUdBCPwUs+Z7uLAnRYx8XL4zGZZB4YAIixiXUzCpic6
 2EjG2AnzVO2+h62t7YhuYO708loqI0z3IKGkKko4WWLrKS443wlpB9EmtRNFPRXVuhNY
 Pdltd/FYH9yhlXTvtLuvLvWPFuwVNQkZXDeh35WASDAMZHq7JLY1dz1VPqFRr1ZE3ua1
 qnLHDkBDz1K7k6GVzV2t9UnkvXhGTqUGcxRiVLv0ohBZ+2cQVG03ImEaTdG1B0W1BJFA
 R7wg==
X-Gm-Message-State: AGi0PubE3J/cBo8mGPI9kbS0KrPGw2ouqOB1FD3m5A0wDDwS1K9utacT
 Fh7MW0GmeatOF1ZZfP8M8LdyYoJPHhMuSw==
X-Received: by 2002:a19:5519:: with SMTP id n25mr2280129lfe.198.1585835173457; 
 Thu, 02 Apr 2020 06:46:13 -0700 (PDT)
Received: from localhost (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id e1sm3202774ljo.16.2020.04.02.06.46.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2020 06:46:12 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 1/5] dma/xlnx-zdma: Remove comment
Date: Thu,  2 Apr 2020 15:47:17 +0200
Message-Id: <20200402134721.27863-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200402134721.27863-1-edgar.iglesias@gmail.com>
References: <20200402134721.27863-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::142
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, frederic.konrad@adacore.com, qemu-arm@nongnu.org,
 philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: t7yMwaB6jPvi

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Remove comment.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/dma/xlnx-zdma.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/dma/xlnx-zdma.c b/hw/dma/xlnx-zdma.c
index 2d9c0a0d5e..a6c5b2304a 100644
--- a/hw/dma/xlnx-zdma.c
+++ b/hw/dma/xlnx-zdma.c
@@ -511,7 +511,6 @@ static void zdma_process_descr(XlnxZDMA *s)
         zdma_src_done(s);
     }
 
-    /* Load next descriptor.  */
     if (ptype == PT_REG || src_cmd == CMD_STOP) {
         ARRAY_FIELD_DP32(s->regs, ZDMA_CH_CTRL2, EN, 0);
         zdma_set_state(s, DISABLED);
-- 
2.20.1

