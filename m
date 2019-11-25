Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp3091414lfc;
        Mon, 25 Nov 2019 04:36:09 -0800 (PST)
X-Google-Smtp-Source: APXvYqyhdbCqySuRIQwVU+3w1oYDTWZX43Uv+dOmREGmy/3AX1BCu4n2Vjfvoo3Q7Ja1kJnIc/bR
X-Received: by 2002:a17:906:57c3:: with SMTP id u3mr37280882ejr.254.1574685369449;
        Mon, 25 Nov 2019 04:36:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574685369; cv=none;
        d=google.com; s=arc-20160816;
        b=VfnmXGPPUSDIkQqzbC9zXB3C65cd0fBXgQQrHe2pHIB1RrFWSyYynCzPwHwjwLBZe9
         /eUZ3G5VAJR3qMJ5n1l5fhka5YVSMzegE2r5Lxp6Zc5znzmsOzrkVIYukBcZ/uZhbfnf
         7XW0deMSHF8PmwBh/wa+daz8aJ1DGmGQfAsJRKGCzlRkg1MN5Q4rVicpfpfl50I1pXof
         7QM524Jw0bqTIqd4SVV5yBXt8t6iFq5mh8+eV3PCvyWPhjKFfTpPxgq32bozALPjOtFO
         99W+5xnvbl37cimOtiBf6Lk1MZd++b0vV2fxnotVoTJbuMmiT0aP4l+lFjqTSK53SHzz
         hffw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from;
        bh=YhGSQLV2D7XNSxzSxCbubGu4XO9QMlaCo9qKLd5hMtY=;
        b=X8g2zf5JBupPSOGEgrqkfEv1XHQn3/CKYZHR9QP4P6CBHFnsl3kpweanfXsnzyU0RB
         Zv1Lu5XM4ANQBnbgYtrqeDUIMVa3OuQPhyS+qX632jq5XUEdEB/eI7JXJ0kfaCEntrZ6
         6EsgaEqaTIBRPEppCvDdA/S42QMTTAL87B0BExKoz28/4UPaL8CiKO8HFTRJBjr2XQm+
         ATs0e06JH/sQS/dVb/o/qs2hRnXQ0iBOwzhXxxPdxdZ4RjiOIHFWDmZIZnd0B/7yEUB7
         aTBFY/wsRvtSnPJJA+YBGw30EULf+wh1Ed5uUmMhmIzm2Gnjr5+dxSsPlLwNgS4iIh6B
         Pltw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v13si4221689eju.409.2019.11.25.04.36.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Nov 2019 04:36:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iZDb6-0005DQ-D1
	for alex.bennee@linaro.org; Mon, 25 Nov 2019 07:36:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33596)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1iZDaU-0005AU-Aq
 for qemu-arm@nongnu.org; Mon, 25 Nov 2019 07:35:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1iZDaR-0005zK-Eu
 for qemu-arm@nongnu.org; Mon, 25 Nov 2019 07:35:29 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:48886 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1iZDaQ-0005tw-U9; Mon, 25 Nov 2019 07:35:27 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 2FFE3C02C28C39762234;
 Mon, 25 Nov 2019 20:35:15 +0800 (CST)
Received: from HGHY2P002143101.china.huawei.com (10.184.39.213) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.439.0; Mon, 25 Nov 2019 20:35:05 +0800
From: <pannengyuan@huawei.com>
To: <david@gibson.dropbear.id.au>
Subject: [PATCH V2] ppc/spapr_events: fix potential NULL pointer dereference
 in rtas_event_log_dequeue
Date: Mon, 25 Nov 2019 20:34:51 +0800
Message-ID: <1574685291-38176-1-git-send-email-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.7.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.184.39.213]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.32
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
Cc: kuhn.chenqun@huawei.com, qemu-arm@nongnu.org,
 PanNengyuan <pannengyuan@huawei.com>, qemu-devel@nongnu.org,
 kenny.zhangjun@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0+RDeV4+ReZm

From: PanNengyuan <pannengyuan@huawei.com>

This fixes coverity issues 68911917:
        360
    CID 68911917: (NULL_RETURNS)
        361. dereference: Dereferencing "source", which is known to be
             "NULL".
        361        if (source->mask & event_mask) {
        362            break;
        363        }

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: PanNengyuan <pannengyuan@huawei.com>
---
 hw/ppc/spapr_events.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
index 0e4c195..e355e00 100644
--- a/hw/ppc/spapr_events.c
+++ b/hw/ppc/spapr_events.c
@@ -358,6 +358,7 @@ static SpaprEventLogEntry *rtas_event_log_dequeue(SpaprMachineState *spapr,
             rtas_event_log_to_source(spapr,
                                      spapr_event_log_entry_type(entry));
 
+        g_assert(source);
         if (source->mask & event_mask) {
             break;
         }
-- 
2.7.2.windows.1


