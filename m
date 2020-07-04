Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3424690lfm;
        Sat, 4 Jul 2020 08:42:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4p7kFt8xtF8vMtAWdt/IPP70y76RiWkVvbyPHLYI0l0LKci5SvC3nH4rN6e/fRBP+ad2X
X-Received: by 2002:a25:3586:: with SMTP id c128mr66060035yba.494.1593877367743;
        Sat, 04 Jul 2020 08:42:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593877367; cv=none;
        d=google.com; s=arc-20160816;
        b=QdqHzjLE5PA9IW0DU6e43id3wYmCqjLkZgqrkfoAiiwOt0eTzG20JG0dxHikDfyDqv
         /Vmfnq11m5UXjgHjObq+bGpgOEoqHiwYNdss7E4wukVUi+RB9J9npROOlp+0BFCsEBNp
         oytjvnyzg9zYVbB+CvhgJX5x9CXQ4olH6nRdl1q644B77ZCQD/Nntvgx2cmknTWzUD01
         mADHGEnjgDw3HQrB1WlIiWLBdN4oJ0GVJrR7IIAIen4nSSWRaowL0NekRsVQ+AjXRgkp
         CsSh/QAIO7o3OmFZ0SGdHRas8wm+tYAwik9ifQy047Qjbzb5VEj+EmlK/7H9y/PXQejs
         q2vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ohYFQDQtBBzlIBSO6MkXhxqMR6JUtdL8Voi/meJKGaU=;
        b=E41v5onENagZoHXg6O/dN5u6iDQM3mZkS/o+soIrG8ryCkJLFYcahP6cHAo1gRKDHo
         PUewOd961k6oguXBq+A5n7mqq7XFFi+05CK4wGIPC+NtYD7vC4B6FocFOMk4R7+DV0QZ
         dr+BwElJJxd1oeNr/fPfJl8/cXoxISblo453ieH8l/01+ka6kKQfl0MnXFCSn5ePjGC0
         IKA01k3wKaHZJUaH6kKe18iHyaiLjIErkM4GmUSJ9SQAtzjt/fku1bfr8z2UhGXx8DqX
         SDGeERraaEO6m6C2uiLvwja8OPce4meMYPjHs2sURSnNlwY5PKgVFd6ygUsuabv6SxvW
         kSqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="QWnfbi/H";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w191si15097172ybe.103.2020.07.04.08.42.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 Jul 2020 08:42:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="QWnfbi/H";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrkJT-0005Bs-4B
	for alex.bennee@linaro.org; Sat, 04 Jul 2020 11:42:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkGj-0001Ua-3c
 for qemu-devel@nongnu.org; Sat, 04 Jul 2020 11:39:57 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:26600
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkGh-0007YC-1t
 for qemu-devel@nongnu.org; Sat, 04 Jul 2020 11:39:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593877187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ohYFQDQtBBzlIBSO6MkXhxqMR6JUtdL8Voi/meJKGaU=;
 b=QWnfbi/H0MTAsLlDU0xPTJrRfxnn3ipwKeTMkzcAwMXHuRMJlSO25UNmmDFbdisZSW+WJY
 ScGOOFzJIZXZBxQfeCYcgyqcGDlIcRh/zgSTDdanMb6VtHNWUkjDmaY37DmII8QQaEDEU6
 ncAmCLUbv30ev4N/O6vZFD1kuaPETgo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-6vB_t4W2M3uudb6HJRHPrQ-1; Sat, 04 Jul 2020 11:39:45 -0400
X-MC-Unique: 6vB_t4W2M3uudb6HJRHPrQ-1
Received: by mail-wm1-f69.google.com with SMTP id t145so39825967wmt.2
 for <qemu-devel@nongnu.org>; Sat, 04 Jul 2020 08:39:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ohYFQDQtBBzlIBSO6MkXhxqMR6JUtdL8Voi/meJKGaU=;
 b=dKkIy26U3Em8ztquxj0BU1XVmwZd+VNa60m3dIm0x2dJPLlVlttnOtzpEKy01MzqcY
 6aZ7YhbnBZqfo7QySaj2iAniSSzJkXMxnl/JHbrzigh1RXZGawPcd9LQ1i+HuYi9eqgc
 06Fb3lGLh0csJ2AoroyKlCkfwxa15BJX2pNGUHz4MDrkvXP9AXT5Yt8nlvk+AFhBBe3/
 rNIAPRJWRu4rZdqQxSLkImt/nN4ABJEOvcEe2ZAOQzbjHAKkvBl/toV/O2gi6pSR7SUJ
 q5o+cTuWMsgxW6BYdMW/YZWn2OZQwKZ+D4AF0Tskwks0337FvteXkldjdApBRNkfhM4s
 uCUA==
X-Gm-Message-State: AOAM531579vJCvcdcMEsP5ImmDV5eI8+wmvTZUf2FrZZHiz3BEFlaVrF
 Ibsnw/UegwD20LBkPhdQv9lsJjgEBeC2lbOl4v6aSdod5rxGtiOLBaPPR3dgcUuag0Dj9v78vSM
 oVN9qpEc74w2Qtns=
X-Received: by 2002:a5d:5706:: with SMTP id a6mr6327516wrv.328.1593877184618; 
 Sat, 04 Jul 2020 08:39:44 -0700 (PDT)
X-Received: by 2002:a5d:5706:: with SMTP id a6mr6327492wrv.328.1593877184429; 
 Sat, 04 Jul 2020 08:39:44 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id w128sm17724101wmb.19.2020.07.04.08.39.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 08:39:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 06/23] hw/char/parallel: Emit warning when old code is
 used
Date: Sat,  4 Jul 2020 17:38:51 +0200
Message-Id: <20200704153908.12118-7-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200704153908.12118-1-philmd@redhat.com>
References: <20200704153908.12118-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/04 08:57:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WIMzcQyDb4Uv

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/char/parallel.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/char/parallel.c b/hw/char/parallel.c
index c0f34bf924..02eb1a7ef4 100644
--- a/hw/char/parallel.c
+++ b/hw/char/parallel.c
@@ -36,6 +36,7 @@
 #include "hw/char/parallel.h"
 #include "sysemu/reset.h"
 #include "sysemu/sysemu.h"
+#include "hw/qdev-deprecated.h"
 #include "trace.h"
 
 //#define DEBUG_PARALLEL
@@ -621,6 +622,8 @@ bool parallel_mm_init(MemoryRegion *address_space,
 {
     ParallelState *s;
 
+    qdev_warn_deprecated_function_used();
+
     s = g_malloc0(sizeof(ParallelState));
     s->irq = irq;
     qemu_chr_fe_init(&s->chr, chr, &error_abort);
-- 
2.21.3

