Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C44CC6B08
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 08:48:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGY9e-0002Oo-GQ; Tue, 13 Oct 2026 04:46:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY4Q-000173-64
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:41:14 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY4O-0008F9-Bl
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:41:13 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-49fbb2acc90so22387105e9.2
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 01:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791880871; x=1792485671; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=fam63WVG4qIrwWX1AvZPXPDPo354Ibas6nosiQf5fbU=;
 b=bHvsVRoa0mfQO47MydvMHD+1yMo3RptSvZc1mDbbuc36yDB6Sn9U5jqb7qhI+t3rBT
 kmg5KiGdv1HXUunmGLFtU5bmGwyYHJGvDBuM1TQZSQj7STvbx27Yn05oHptTAvEX5JtM
 VsMGP7EoFF6YN/i63ek8kgOj50QBq/TeWo7WBSoAT9Hn46GUWp70CWe5dKK+Qp0OxoBc
 Oq4HLtxcPF1Ait22SQaLKQJBQoacfeJic5mko0pykgd9Tf1Irp6nRWWYLBqiTehVJg76
 l0EEU8u367mHajlSwrKmwa/wwajW7Uf0G+evOlkJuRxOghPZr90O5edW+TG7Vt1bWrr5
 71og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791880871; x=1792485671;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=fam63WVG4qIrwWX1AvZPXPDPo354Ibas6nosiQf5fbU=;
 b=xCxyZJkuIDKtxzBFqu87nFgjfMiJv/ww6RzURgtARU5wPCQgh8aZ7MjmCbZFPEiwm+
 x39WPnetMEVQzfsgJrVuSAP0GEF6dFt3qCw+CGqyLzOFk9IIP2oSmlss7PPf55D6f3VZ
 +xD5ASDp3sxdmoV3vSuxwLNdj7PZwJSDhUxViwQkWGpwn3pCJUCXq522+HsY/uumKHk0
 RR2BKUCLB8y0uE+iTTOnC8SoEUA0ixJiP+yDUCb8CQWi5+m9qGctdbDWpxqJLXIC6gQq
 kVeQQgcaKzZAT9bV0Rhyi7v5TSQ8mKCrgTZ8hl5srnu1Wr+CDNPBdSRn78CCeKJw/bJ7
 xy/g==
X-Gm-Message-State: AFq9FYInY+jgVBvtWYeObTa+kZOeZyCjjiDZZg4K5QkVnzQVVUCYubhe
 8uf8BijwmwwDX2wJBQrcMucNP3Ug2nVsgeQlymWNWlGZQxoaMid8Fy349JKOnl3/Pz98KbwLYaN
 WgRKMKE8=
X-Gm-Gg: AYBFou22qtGRD56OJMgBWVCyBp4AEhVEmI2INEZhia7NrgXUI9B0UD8u/Tf52udDR7O
 RYy9bvWs5YRmnVLHsmHdhN+8bQOiBoGW+D91OKKJpqZoNrBJrKXjgrvAkcfKem8eUX5W4lQ0inG
 I/8zk+XCDpX/dNlftJe6UOn5LpLxxQ4aQ4+UhfaHnUbz2AWONsvuf6DENIAtzC7qx0/9kwfPdrw
 tgRQYAZgcuH/BMXMWBmghl9dVNPeEwqv0sK1y0FYjc4cbhpB2Or5yFI3L/92USLkC+hM37RQpa5
 GJRU8j1oq8VX94oMleIwaIZr3qTgtPf9WixetMnot9MUQML4Dp0vxmCxTvPYdZFAAhdsMam+iWp
 v86DhNT/baoPoEgo8hbo+orv2D+3ubUHKml3J5G6TDWywoBJErJRqcYTzq91k+TsfwNf2PcVxIp
 PgRZLxQEisWmO65pjg5IV5xhMtrtVp4DJprZ8rL7P9qWUXrI3Rc1zWukd7tX0R99SOYxRzUcwvk
 tCavuTd4AN1cB8Bghme/un7PKYJT3uM9885pYSnSj6vmq/pm7tTlxcmpBvygjRKMmVqA+Egt/1d
 13Q=
X-Received: by 2002:a05:600c:4f89:b0:4a1:acaa:9d4c with SMTP id
 5b1f17b1804b1-4a1acaa9f79mr22107965e9.25.1791880870738; 
 Tue, 13 Oct 2026 01:41:10 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be96549sm495086735e9.6.2026.10.13.01.41.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 01:41:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 74/86] hw/intc/arm_gicv5: Handle virtual=true in
 gicv5_deactivate()
Date: Tue, 13 Oct 2026 09:39:21 +0100
Message-ID: <20261013083933.1024405-75-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013083933.1024405-1-peter.maydell@linaro.org>
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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

Handle deactivation of a virtual interrupt, using a similar process
to virtual interrupt config updates.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv5.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
index 7c68fd6cc2e..5a038fc14e9 100644
--- a/hw/intc/arm_gicv5.c
+++ b/hw/intc/arm_gicv5.c
@@ -645,6 +645,7 @@ DEF_SET_FIELD_FOR_IST(enabled, bool, ENABLE)
 DEF_SET_FIELD_FOR_IST(handling, bool, HM)
 DEF_SET_FIELD_FOR_IST(pending, bool, PENDING)
 DEF_SET_FIELD_FOR_IST(target, uint32_t, IAFFID)
+DEF_SET_FIELD_FOR_IST(active, bool, ACTIVE)
 
 void gicv5_set_priority(GICv5Common *cs, uint32_t id, uint8_t priority,
                         GICv5Domain domain, GICv5IntType type, bool virtual,
@@ -1097,8 +1098,12 @@ void gicv5_deactivate(GICv5Common *cs, uint32_t id, GICv5Domain domain,
     trace_gicv5_deactivate(domain_name[domain], inttype_name(type), virtual, id);
 
     if (virtual) {
-        qemu_log_mask(LOG_GUEST_ERROR, "gicv5_deactivate: tried to "
-                      "deactivate a virtual interrupt\n");
+        const GICv5ISTConfig *cfg = ist_for_vint(s, cs, domain, type, cpuidx);
+
+        if (!set_active_for_ist(cs, cfg, id, false, &iaffid)) {
+            return;
+        }
+        irs_recalc_vhppi(s, s->res_vpe[cpuidx]->vmte, iaffid);
         return;
     }
 
@@ -1106,15 +1111,10 @@ void gicv5_deactivate(GICv5Common *cs, uint32_t id, GICv5Domain domain,
     case GICV5_LPI:
     {
         const GICv5ISTConfig *cfg = &s->phys_lpi_config[domain];
-        L2_ISTE_Handle h;
-        uint32_t *l2_iste_p = get_l2_iste(cs, cfg, id, &h);
 
-        if (!l2_iste_p) {
+        if (!set_active_for_ist(cs, cfg, id, false, &iaffid)) {
             return;
         }
-        *l2_iste_p = FIELD_DP32(*l2_iste_p, L2_ISTE, ACTIVE, false);
-        iaffid = FIELD_EX32(*l2_iste_p, L2_ISTE, IAFFID);
-        put_l2_iste(cs, cfg, &h);
         break;
     }
     case GICV5_SPI:
-- 
2.43.0


