Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED64CA9ED2
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 08:40:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGY34-0006q5-FL; Tue, 13 Oct 2026 04:39:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY30-0006nY-VQ
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:39:47 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY2z-0007Z9-7B
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:39:46 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4a0213948d3so16335755e9.2
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 01:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791880784; x=1792485584; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=dY5bJ6dJUERrSTEf33O+vZmh2Dy5obdCXPAP66j8BsQ=;
 b=N3GtelX+1jIP79XN9kYqU/WTQAESAPsHCaWTA0OcJKM0vTaiCYjQ116QbJ+U0GekQM
 zoTaA5LCKAEi9d25+ALAfZjd05FDHsIeWoLJb4XRHWol5iwpyXMHHjcq4IU/XwYILqAH
 vEjSJtaetWBDec64Ohzk4rdGNZotK+5bBxR8CdJxZUgj1eHUrA/Ro7QdhQBGVSlkBd24
 c6E2jE/fvxC0vR+iKPFU/IOKfPgUGljhOXEfEXcaYV6LS5eOpyZVreVUTfsMZ6wwZrW7
 ChXvAxx9NVe73XDSWpeGsckHLgDBwBhIbX/JcutjWsiRt3Q3b3gZT7FrTUgCWeuYPDlo
 nRKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791880784; x=1792485584;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=dY5bJ6dJUERrSTEf33O+vZmh2Dy5obdCXPAP66j8BsQ=;
 b=q/vw8xpuj6vv/c9kE2fNBbZMcGYWpcskOwUZ9x8Ts3zj43yOgiJ/q30BAalXYC6bPC
 8dITXYfI7D5ppicqw5iXWvmd8trmxUL4E5wJrrKbDcaNTOdj2hC+aaiyH8TQg+3yYPac
 wV/dMIZicdVoAV4X3qPahJ6SJacLp6dHuuKXPduEPbka+ktN9iW37ZRuplDcjHtZFov/
 an1brff15JFbnr6RCIRupe6JPebzS04MZ4zpFIA9bcnqBSmmrvrZDiHuhMSbQcg5jmhR
 Zze1Dki3XGlEK4OPuksIfysgHNiHMWpmebuoaLPyY1/gEINrp0iFYcScdR+56uFHOU5r
 QrWg==
X-Gm-Message-State: AFq9FYJS6yPDsuLhsqKG6GmBWsC4pqPHls7TtaecqqUwLPi6QZhPYpR3
 vgMPtcbfaRIKi04RSU72yzTnIuxpkYV3LlS01Ul3LiKoFhhODvUSk6zJJ5BEcOm+IgHHqXwPuM0
 1xOp8dFY=
X-Gm-Gg: AYBFou2HTUtB095CiARcvLyXoREm7AUMPhnNTVb/5HRghFjlu2BYOg3zO9Ndlfd5QuJ
 UjUgJ/CCTDaDjO66rtuZjHdbhEiaNZoD1TNbH1uv056LsUGteVufYQjGhrp5ClDB6feWT5JpEY2
 HtUYWQS1NAs8ZeAtru2s6n3+0sn+EHIVdYHJuVrfHsoeqUpbfJXw8elRdsadH1gPBJHC0R7u436
 VrDaFRsqFM5q4WbSPNnQOH6AcPyWBUJouaIlMXC2cMuCzSAU9knWIlozCBTLN7V9EtrOvE2y40J
 MhhoWQ6e5lkXCpQWbr3ASnGxC8Xpb0HxLpOcugEOMaJYpct1McswgI6qTbRkJNZrmkhtnCfIMAX
 2mteFAtpdjBPPB43cfY7XL4kU8RFHCrz3j3xCoWiiOhnhnwf+6L1uVfmCeMTOmO8YW0ohq01qb2
 C9zmiJ5MRjS1Oa9D8lHRy10YT5EG0wv2gyCqOx3Ksv9HFa6q4FBXGTxYDxB0udZSH3TjnZIvAU7
 W2f99hGeu4IF+ORqN/uaARPfhavLDrbEoQr9mO4nMFbikXJKKnVCjlf+kHidOAm/Tryk2RE2IIU
 5Mc=
X-Received: by 2002:a05:600c:1c1f:b0:4a1:a484:2c37 with SMTP id
 5b1f17b1804b1-4a1a4842caemr80018425e9.25.1791880783731; 
 Tue, 13 Oct 2026 01:39:43 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be96549sm495086735e9.6.2026.10.13.01.39.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 01:39:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 04/86] hw/intc/arm_gicv5: Regularize spacing in config_readl()
 switch
Date: Tue, 13 Oct 2026 09:38:11 +0100
Message-ID: <20261013083933.1024405-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013083933.1024405-1-peter.maydell@linaro.org>
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

In this file we don't put blank lines between cases in switches,
except that for the switch in config_readl() we've written it half
with blank lines and half without.  Delete the blank lines to make it
consistent with itself and the rest of the file.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 hw/intc/arm_gicv5.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
index 2b08f8feec2..d354ac6b992 100644
--- a/hw/intc/arm_gicv5.c
+++ b/hw/intc/arm_gicv5.c
@@ -1469,53 +1469,41 @@ static bool config_readl(GICv5 *s, GICv5Domain domain, hwaddr offset,
         }
         *data = v;
         return true;
-
     case A_IRS_IDR1:
         *data = cs->irs_idr1;
         return true;
-
     case A_IRS_IDR2:
         *data = cs->irs_idr2;
         return true;
-
     case A_IRS_IDR3:
         /* In EL3 IDR0.VIRT is 0 so this is RES0 */
         *data = domain == GICV5_ID_EL3 ? 0 : cs->irs_idr3;
         return true;
-
     case A_IRS_IDR4:
         /* In EL3 IDR0.VIRT is 0 so this is RES0 */
         *data = domain == GICV5_ID_EL3 ? 0 : cs->irs_idr4;
         return true;
-
     case A_IRS_IDR5:
         *data = cs->irs_idr5;
         return true;
-
     case A_IRS_IDR6:
         *data = cs->irs_idr6;
         return true;
-
     case A_IRS_IDR7:
         *data = cs->irs_idr7;
         return true;
-
     case A_IRS_IIDR:
         *data = cs->irs_iidr;
         return true;
-
     case A_IRS_AIDR:
         *data = cs->irs_aidr;
         return true;
-
     case A_IRS_IST_BASER:
         *data = extract64(cs->irs_ist_baser[domain], 0, 32);
         return true;
-
     case A_IRS_IST_BASER + 4:
         *data = extract64(cs->irs_ist_baser[domain], 32, 32);
         return true;
-
     case A_IRS_IST_STATUSR:
         /*
          * For QEMU writes to IRS_IST_BASER and IRS_MAP_L2_ISTR take effect
@@ -1523,11 +1511,9 @@ static bool config_readl(GICv5 *s, GICv5Domain domain, hwaddr offset,
          */
         *data = R_IRS_IST_STATUSR_IDLE_MASK;
         return true;
-
     case A_IRS_IST_CFGR:
         *data = cs->irs_ist_cfgr[domain];
         return true;
-
     case A_IRS_SPI_STATUSR:
         /*
          * QEMU writes to IRS_SPI_{CFGR,DOMAINR,SELR,VMR} take effect
@@ -1538,7 +1524,6 @@ static bool config_readl(GICv5 *s, GICv5Domain domain, hwaddr offset,
         v = FIELD_DP32(v, IRS_SPI_STATUSR, IDLE, 1);
         *data = v;
         return true;
-
     case A_IRS_SPI_CFGR:
     {
         GICv5SPIState *spi = spi_for_selr(cs, domain);
-- 
2.43.0


