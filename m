Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9FB6CA600E
	for <qemu-arm@archiver.kernel.org>; Thu,  8 Oct 2026 09:24:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xEkLg-00084K-Lc; Thu, 08 Oct 2026 05:23:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xEkLd-00082x-MJ
 for qemu-arm@nongnu.org; Thu, 08 Oct 2026 05:23:33 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xEkLb-0002q5-W2
 for qemu-arm@nongnu.org; Thu, 08 Oct 2026 05:23:33 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4a140e7405dso50203225e9.3
 for <qemu-arm@nongnu.org>; Thu, 08 Oct 2026 02:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791451409; x=1792056209; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=BjccOuCbnIoSCjSCagogsG7qWonMcY6BChy8KmQg39U=;
 b=Fajfz0r96ttwOH01g5RDR6F2QYteRtC7+CWzrew/Zl65VFA0T3gHh3cx3GWK6Eh+XI
 HVHgPhbmhgSzxLKBYF13D+bvdJ5wEfRhLvWePU9vWpJjsrYXVytrM0IFGMyq3VTFAj/u
 80Zu5DNn+rFiiP0BFW/H6Kp4uu6DEhZ2uevbVchOMgxdRz7sJjZveQV1MtxfdeGGc2Oh
 idqQsp9JhAD3AeyBFlqWEBFbMxs4HdHEJV781fVKlCPFc50Uc9wXS4j36Xx4J39d5x1Q
 x0AGQ1MV+MwiTW0ptJvCAYSNYazc9bYZktiUnLGOChG/5UmpH/d6tpNMtX453Qv+cgoC
 aWtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791451409; x=1792056209;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=BjccOuCbnIoSCjSCagogsG7qWonMcY6BChy8KmQg39U=;
 b=naekUWAxqeVJLh83w7Yn6KSGs/cX6Jy4szanY+LfkNRjL2l/vWFUu74/OUkaOGuXcC
 eyQrYPPNxncucL64icBsP83yIeXLsejzAXPQOf4x29xnLnaQY/pmWwr96sKDcZMctost
 bTSUJzb0X1pAzKkR53Sb/ypmisbl9M3XDMqw3dIs7/smzRV8+HTHEdjY+hrXay8t0iy6
 5jz8mrIb9b1JQPDe9zz0BcTXfuLqKUSjWPmqWJOaC24R1VrranhNZ6Iz6n6Qk+1V58Hi
 fSFuFVvOdH7zc3xBjKV9Sx8szJOqG4hyjpg2baWW7wmZ6zhaRw/8vS43csz4gOc2cK/j
 GT6w==
X-Gm-Message-State: AFuF++k2vYhPocBmdjDOR13GoKG3oBqp+yoHBGNBGuHpcwiyOOZbObhZ
 u55rWQEWf5dS+l3K+FVvj/73CwJST/ROcITalEifgYNm7GMkdrl+yRxeVgs8SAb5C/GYTVPSf/r
 ZwGrjeWs=
X-Gm-Gg: AYBFou1IufMhr8x3Oe1Lt6He5ZKcDtrDO6DJCYTvqa29gLv1ZDWU62W5I0VoRZ+cEys
 1jAza8YXL5w56uRemSOtGjerdEtDInAYhuLh4rarQTLZSw078m0nqDEDhyXskF0c0mlLHAKy75E
 y7GeMRJT0SbkfX3TdgdYH2sLqzfk9FkPyaPEcbzCTc//Z2MKtkz5X3k8FVDKEaIIztN8N1sM42o
 B015hAjcl7Kax2KkTAstpzAV+Vczd73OkDJ2eHS33AKW7AmEmD83pjjayt6iULJxroHf3nG02Fd
 JUXE7Pl2txC6LBoJvTM5Ykb26MUwuVvQ/Nx8doKxSGiWVqKX9+xsBQBPVHjsQnynqnM7rBS3kjn
 CEr24o38dB+33pe9HeQmaImtgVhVdRiYFifPZmNMcDWzzv1tz/fYpseHud0MNcMomJKluRvHzqk
 SoudE5AInWmYXUKIQGB94e/ll30CTsI/+RMinnDJprlS4sHd4XDhqBcVyirVDiJ+vJ8/oJFq4aH
 feefl2BdSgC92rOfA50+9fA81mMkvaHTtGKemK/T7twWF66nVgVCPAExUrS+MAl25wJCjNMgwBp
 /Ew=
X-Received: by 2002:a05:600c:810c:b0:4a1:7163:3e41 with SMTP id
 5b1f17b1804b1-4a1804234ffmr80152545e9.9.1791451409460; 
 Thu, 08 Oct 2026 02:23:29 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a181aeaea2sm108798785e9.5.2026.10.08.02.23.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2026 02:23:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] hw/intc/arm_gicv5: Make IRS_IDR0 reads return actual value,
 not 0
Date: Thu,  8 Oct 2026 10:23:27 +0100
Message-ID: <20261008092327.4036856-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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

IN the code for handling reads of IRS_IDR0, we carefully construct
the correct value starting with cs->irs_idr0 and adjusting it.
However, we never actually write the final value into *data, so
the guest will always see zero.

We didn't notice this before, because Linux happens to not care
about this register value except to check for the presence of
virtualization.

Cc: qemu-stable@nongnu.org
Fixes: 405ad2e76f13254 ("hw/intc/arm_gicv5: Implement IRS ID regs")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv5.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
index 08878193dfc..ebfb0878af3 100644
--- a/hw/intc/arm_gicv5.c
+++ b/hw/intc/arm_gicv5.c
@@ -1433,6 +1433,7 @@ static bool config_readl(GICv5 *s, GICv5Domain domain, hwaddr offset,
             /* ...which means VIRT_ONE_N is also RES0 */
             v &= ~R_IRS_IDR0_VIRT_ONE_N_MASK;
         }
+        *data = v;
         return true;
 
     case A_IRS_IDR1:
-- 
2.43.0


