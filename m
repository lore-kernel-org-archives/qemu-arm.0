Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp2243015ejb;
        Wed, 21 Feb 2024 16:04:58 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV+NVe6lxXTDg4CDVkdPCZ4/kqJVzhbAqBmAts+Y3ttvl2bV8/XvVhSA9ZWgPH8HlKzDM5wzlT3s0OxfbofiD5teqsMzgk5
X-Google-Smtp-Source: AGHT+IHqAyjeTSobZgbIq1yReYdS7XKn1gfeofhItNtp9l6mTQ6QDmYIgO8ilyrvvMMMwAXJszs3
X-Received: by 2002:a05:6102:1610:b0:470:51ab:3e46 with SMTP id cu16-20020a056102161000b0047051ab3e46mr11385441vsb.30.1708560298733;
        Wed, 21 Feb 2024 16:04:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708560298; cv=none;
        d=google.com; s=arc-20160816;
        b=KJ1i0E540PgNlSpO4NTeaVIMJs/YAN/fMsJ2qacemRML8utsX42mJXb51C5XfnzzqR
         JholGCK/DPPxLD1qz5GqGT5xYdRPPQhSr1t6eTbzGXF/8CpQhfi5o9lguEN7tGgV8ehk
         bF2AhckTaiYIF57p7Ma5ACT3OthRqavetMfbyfMrUoFLs9DiX73TXXnep67OuI5rn68H
         0kudr3XlHgIzKWmSn84Z/dMTehjCeHmDhqYWfDUCbZP+76J2MXdqGt8EPjsd2GGWKaPQ
         Axa0ngtDeAXiVBdkWto7btA2/DiS2DF73am8mLUQXtHGb7cAG2Y466hhVwfgcNCj3Fbi
         02rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=uOqpFpRHeNTJkIs3ZCo+XPQx0TPFGZAjY2V7pgRTXhg=;
        fh=iEAsG9dCqS+2cVy9uTyNWfPGqEHl61dBFUbj0ZXFowI=;
        b=QIrh4zlHSU6aW7vgtH5keNLC640XDA7948n5mYZpXnq6aZhA3j7KiDr9P9QW+D7aSv
         ynJaBTZ1Lb5U/Ne/Ac80nBxIfa/4ggYvkN3ftExfpqGXCTlSs33laMiPOpBM98u/P5yr
         K+V3EzioB/WB8Sau9JkNJcIbwhqvRKM+HJzPv7ySfSaWPUpoxPllmsbu5BykBf/6G7J9
         r1DCTYcVosv9R1G8xOw015ag7jNSI1Eqr+I3Sa5Amtktz1y9f7LPpDL1oJ8BnJGfQLlO
         g6VDO5Mu8nZORQUXO6JrHjnk+laHTk6qM5yPWs8CBAR4htNrU/WAwB9bJcCu6l/EeYgl
         qzOQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@cl.cam.ac.uk header.s=mta3 header.b=NssVUuuY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t10-20020a67c78a000000b0046d1ca7dbe6si1443673vsk.350.2024.02.21.16.04.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 16:04:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@cl.cam.ac.uk header.s=mta3 header.b=NssVUuuY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rcwZS-0007Y8-J7; Wed, 21 Feb 2024 19:04:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jrtc4@cl.cam.ac.uk>)
 id 1rcwZQ-0007Xq-Nk; Wed, 21 Feb 2024 19:04:12 -0500
Received: from mta0.cl.cam.ac.uk ([2a05:b400:110::25:0])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jrtc4@cl.cam.ac.uk>)
 id 1rcwZO-0004oW-MN; Wed, 21 Feb 2024 19:04:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=cl.cam.ac.uk; s=mta3; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uOqpFpRHeNTJkIs3ZCo+XPQx0TPFGZAjY2V7pgRTXhg=; t=1708560247; x=1709424247; 
 b=NssVUuuYlpPQK1LRMcVMpFo2NEErxEXEh4sDRhJTek5ol/Nbr8cED28HcMFnHgTPEKpcSI+pynI
 9I76pPZ21JOR7r3/F7AbMtt4n2jd066hAVemjcx9nZWceUyAmrBuJdGb9qxLb1vu/CufwBC2hRMoS
 QVpyzZeFVnCP7iDhXY4bjQ9WGZybjfiJ3fvbzHgdGkn+HahOZ76GStyz+GmaM2R59CpkpOKBxDsy1
 Hc2+Bcty7HVIKm3HtvQoKXTxfjjJMx25cgif6LvV5dytClba/0Tqpvu4ru2XeyBJb3drnuRpBmpa8
 +0a0brA0mBZUHrGvCyIvGrxlq+iIxPxft+TA==;
X-CL-Received-SPF: pass (mta0.cl.cam.ac.uk: )
 client-ip=2001:630:212:238:e63d:1aff:fe8d:4a70;
 envelope-from=jrtc4@cl.cam.ac.uk; helo=technos.cl.cam.ac.uk
Received-SPF: pass (mta0.cl.cam.ac.uk: )
 client-ip=2001:630:212:238:e63d:1aff:fe8d:4a70;
 envelope-from=jrtc4@cl.cam.ac.uk; helo=technos.cl.cam.ac.uk
Received: from technos.cl.cam.ac.uk
 ([2001:630:212:238:e63d:1aff:fe8d:4a70]:34906) (dnseec=no)
 by mta0.cl.cam.ac.uk:25 [2a05:b400:110::25:0] with esmtp
 (Exim 4.95) id 1rcwZD-00HXhZ-SY (envelope-from <jrtc4@cl.cam.ac.uk>);
 Thu, 22 Feb 2024 00:03:59 +0000
Received: from jrtc4 by technos.cl.cam.ac.uk with local (Exim 4.95)
 (envelope-from <jrtc4@cl.cam.ac.uk>) id 1rcwZD-006YTc-3J;
 Thu, 22 Feb 2024 00:03:59 +0000
From: Jessica Clarke <jrtc27@jrtc27.com>
To: qemu-devel@nongnu.org
Cc: Jessica Clarke <jrtc27@jrtc27.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] pl031: Update last RTCLR value on write in case it's read back
Date: Thu, 22 Feb 2024 00:03:41 +0000
Message-Id: <20240222000341.1562443-1-jrtc27@jrtc27.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a05:b400:110::25:0;
 envelope-from=jrtc4@cl.cam.ac.uk; helo=mta0.cl.cam.ac.uk
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: jaH2I7FgVdqd

The PL031 allows you to read RTCLR, which is meant to give you the last
value written. PL031State has an lr field which is used when reading
from RTCLR, and is present in the VM migration state, but we never
actually update it, so it always reads as its initial 0 value.

Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
---
 hw/rtc/pl031.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/rtc/pl031.c b/hw/rtc/pl031.c
index 837b0bdf9b..563bb4b446 100644
--- a/hw/rtc/pl031.c
+++ b/hw/rtc/pl031.c
@@ -141,6 +141,7 @@ static void pl031_write(void * opaque, hwaddr offset,
         g_autofree const char *qom_path = object_get_canonical_path(opaque);
         struct tm tm;
 
+        s->lr = value;
         s->tick_offset += value - pl031_get_count(s);
 
         qemu_get_timedate(&tm, s->tick_offset);
-- 
2.34.1

