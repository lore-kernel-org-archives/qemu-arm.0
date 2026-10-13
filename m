Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50251CA9ED2
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 08:46:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGY8e-0007vW-0A; Tue, 13 Oct 2026 04:45:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY4I-0000cO-Fw
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:41:06 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY4F-0008AK-GK
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:41:06 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4a1af482519so1821785e9.1
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 01:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791880862; x=1792485662; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=wPv7Ak7ok91z1l/gQWZ23Vr8Ogtm8j6ZmfZUtTCQdFo=;
 b=lU3Yxz1OHJLQD9YPuG9pRd4ykCAOgJPZ5OidntbYX0FKBWhDjTZBmVPgnw/5Nabdbp
 OWq9dKTCTZX38VDuaD3PrxGwqXYei3YyNiP7+bVctwGqhDMvr6gdLZpU3eHoXV4HXB7x
 TQkpEPr0+q1txBVdvOSNvLRlGqkTKP243iZ8VtukguhgE6lKHYjDNtddutzPVs8xnu8f
 ow5X3m4cx/mWZ/mKt87cY1l+NYAk9ezwm/P22XLvN9AMi0frdDK5UqUanBVQ4rCiS1lU
 dtwbuZfM5AYJYkqQ0b/WUA12SnkDtGOpk5clADCX+zUOy/iJ4ntPuw/JX0DJ9NkUyGJ3
 LJZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791880862; x=1792485662;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=wPv7Ak7ok91z1l/gQWZ23Vr8Ogtm8j6ZmfZUtTCQdFo=;
 b=Lqb+G3GEaxVwNBx3C6bqAGEf0iui/X3dpepgeRHIEBnt8yNO+lBVF3FhCqaZY/C9LE
 lYkUKNoxZHkV2ZMyUh4+aiL97Y6qAzLHGTrPqNI6ECRCK5vZd1CJ5pMlttCg88RFVp/j
 P3pqib0NgoNIMZWefaHbew18lbow2/Jaz5YuGmbqfsYfiUQE/38qVLixVhiSu66hbGj5
 uCshiahTRuWKXdTG+mzbCVWSygFlQSHrHs5151D8P+iFk8FD+O6cGUjseBvYid0czIp5
 cLy+XmrM65SlveKKsi9Wkc9f21pBbX0rE++YY3A60krPHyrkfy22i0QsUuZTUDuH08cB
 lBgQ==
X-Gm-Message-State: AFq9FYJKWm97rOvrJFi1ax6aiW2RkHk3QJCkACWIiLGvn0CD4vlin+Hg
 219/AeU8V/LwNTt1+TosqlKo/HWz6tM1fPbO1yjLwuLkXclhlsx6xIav0TRCIzXyvnX/uOaf743
 vFnYD9Xo=
X-Gm-Gg: AYBFou3+BKSLhjpuF4O4TB35CREqdbN56noavLrQZpwjimDquSZ8NivufoaFkE3k498
 hNNdNP0AKM6/WCzXJgQ9i8RRtWknt4Rwcx4yB48zK6UPYEJqCEWDQLtjOnN9uT6/qLaJXdVIuv1
 sUhL7/3SovvJX+owQcAJPTo9vazXchDtAB7hEfnnOY53DBfReR7f53pZlQjxu4AEXATg8jokvuR
 IWu7LyAALPv/+ynSdyPeI6iUnORtL8WrekyGNDW2Zm0qaFrZEoRlMYImjEN97cHBh5As5NEIuNN
 NiYf7ijFPB3VeivClAStjF//+cpvckSygf6bn7ZuTeP0SPaZ3nLNd9+nhmokAvTIHLbWqAfUA0q
 yOUi/EwZj6qSskyLPIqyUuoyKTNaegnZwIIGmowGOM729wfPiS0di/hkjb9sl9oHVTelCcBBzoA
 1rEovrmf3YqknSYS6/PZJMNg3TJ8CGlN+xftRNfdVI/p5ki1JhNl1HY1l3dfOb90O17FRLYY1J1
 hyhHNo8phEPTa1RkY5I7kQLLr2IaZ+JBEYX4yUnpfOgWu05sNHsD9hW6RQji8UB2Kp0ecCJ650v
 7UU=
X-Received: by 2002:a05:600c:4e92:b0:49e:63cc:6324 with SMTP id
 5b1f17b1804b1-4a18e4837e7mr230958985e9.6.1791880861802; 
 Tue, 13 Oct 2026 01:41:01 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be96549sm495086735e9.6.2026.10.13.01.41.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 01:41:01 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 67/86] hw/intc/arm_gicv5: Implement IRS_VPE_CR0
Date: Tue, 13 Oct 2026 09:39:14 +0100
Message-ID: <20261013083933.1024405-68-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013083933.1024405-1-peter.maydell@linaro.org>
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
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

IRS_VPE_CR0 is a 32-bit VPE configuration register which has
semantics similar to IRS_VPE_DBR.  However, the only configuration
field it has is for configuring 1-of-N VPE selection.  Since QEMU
does not implement the optional 1-of-N handling, for us the entire
register is RES0.

We don't need to implement the "writes to the register trigger a
re-check of the validity of the VPE in IRS_VPE_SELR and update
IRS_VPE_STATUSR.V" when the whole register is RES0, so our
handling of the register can be simple.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv5.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
index f7d2d4a7143..18ca7034011 100644
--- a/hw/intc/arm_gicv5.c
+++ b/hw/intc/arm_gicv5.c
@@ -2334,6 +2334,10 @@ static bool config_readl(GICv5 *s, GICv5Domain domain, hwaddr offset,
             *data = 0;
         }
         return true;
+    case A_IRS_VPE_CR0:
+        /* RES0 when VIRT_ONE_N is not implemented */
+        *data = 0;
+        return true;
     case A_IRS_VPE_STATUSR:
         if (gicv5_domain_has_virt(cs, domain)) {
             *data = cs->irs_vpe_statusr[domain];
@@ -2524,6 +2528,9 @@ static bool config_writel(GICv5 *s, GICv5Domain domain, hwaddr offset,
         irs_vpe_dbr_write(s, domain,
                           deposit64(cs->irs_vpe_dbr[domain], 32, 32, data));
         return true;
+    case A_IRS_VPE_CR0:
+        /* RES0 when VIRT_ONE_N is not implemented */
+        return true;
     case A_IRS_SPI_SELR:
         cs->irs_spi_selr[domain] = data;
         return true;
-- 
2.43.0


