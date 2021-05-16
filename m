Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp652776lfm;
        Sun, 16 May 2021 13:02:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0PtEH6mQ1ASeZVCPWwMncj3nRkssBe80/OLn3D8jiBZ7RRnYBU76tbHJZvL2C+wfBTLBI
X-Received: by 2002:a05:6602:221a:: with SMTP id n26mr28548522ion.205.1621195357697;
        Sun, 16 May 2021 13:02:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621195357; cv=none;
        d=google.com; s=arc-20160816;
        b=lmM340vMo07zRbPMQGvaE6BgZ/lE4YRV6a/0hjOTpyylab76rEAN3jevsGrabaTG8T
         nhRUM5tpYCTschkOZfuvvQ1cXZhNgME1tIyIIAK8DV3v0KEtXJG7RO6lh2GaOjzJINZ7
         EjbY//AI5fwE2VNEY2zwpQGTF0Sii/ymwcUL4Hb1vdfozbWfqb4DgD6eP7HvPhN3qv5v
         HKQbVIiD/Ae2r4MOsnXRD8mAOMay+mlVEbw8JrKUt8OilEdqXIrLZ8+sEWmb+4N8sNGC
         3q8Vu7yen9XlxjLnXsEDJZJThpMxJdkO5Tj4dKErgQKTYRRIWPl2b67aS50DeGo8SAlH
         D/CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=b8xR6b1TLxWZchZF3CnbdIFxuGe4SMi0PceqZeZvdhI=;
        b=PFFp5S9PW10NaJzK/vabH31AYP+f8vCv4Bmd+sV1brBYXAfQz8PqnKyv6sR40gpo0y
         1xY43jgtxBnFEgokWwHqNgVHwEkOXYS8MMFWCJSve/OVztOG6IjnmxVrQJomBvuXdZsm
         hSnuoOP6sqhaOS+fMiPWOILB3Jy/fh9om0dbtUh9HsslOMPNka1CTCb1oi92ufUbGs5X
         QvoPyOMxDVFkf4HtQLK3KrCadWOgd3QJoSuwkAHy9K6gSp1rarXbxT5Up+bGC5neWsOm
         jAGitf6+NH5UeHL4HJbPPRsDuzgf6ttC3u0XV04WCVRgmX7A557zzL8DiwFrPv0YLP68
         tN6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i5si13262043iow.84.2021.05.16.13.02.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 May 2021 13:02:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1liMyD-00008G-0M
	for alex.bennee@linaro.org; Sun, 16 May 2021 16:02:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1liMun-0001vh-Mc; Sun, 16 May 2021 15:59:05 -0400
Received: from mail.csgraf.de ([85.25.223.15]:45392 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1liMul-0008Fz-PM; Sun, 16 May 2021 15:59:05 -0400
Received: from localhost.localdomain
 (dynamic-095-118-089-019.95.118.pool.telefonica.de [95.118.89.19])
 by csgraf.de (Postfix) with ESMTPSA id 4CF9F60806A1;
 Sun, 16 May 2021 21:59:00 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [PATCH v7 06/19] hvf: Remove use of hv_uvaddr_t and hv_gpaddr_t
Date: Sun, 16 May 2021 21:58:42 +0200
Message-Id: <20210516195855.28869-7-agraf@csgraf.de>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210516195855.28869-1-agraf@csgraf.de>
References: <20210516195855.28869-1-agraf@csgraf.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm <qemu-arm@nongnu.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c61ObRkMpeXd

The ARM version of Hypervisor.framework no longer defines these two
types, so let's just revert to standard ones.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 accel/hvf/hvf-accel-ops.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index 5bec7b4d6d..7370fcfba0 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -109,7 +109,7 @@ static int do_hvf_set_memory(hvf_slot *slot, hv_memory_flags_t flags)
     macslot->present = 1;
     macslot->gpa_start = slot->start;
     macslot->size = slot->size;
-    ret = hv_vm_map((hv_uvaddr_t)slot->mem, slot->start, slot->size, flags);
+    ret = hv_vm_map(slot->mem, slot->start, slot->size, flags);
     assert_hvf_ok(ret);
     return 0;
 }
@@ -253,12 +253,12 @@ static void hvf_set_dirty_tracking(MemoryRegionSection *section, bool on)
     /* protect region against writes; begin tracking it */
     if (on) {
         slot->flags |= HVF_SLOT_LOG;
-        hv_vm_protect((hv_gpaddr_t)slot->start, (size_t)slot->size,
+        hv_vm_protect((uintptr_t)slot->start, (size_t)slot->size,
                       HV_MEMORY_READ);
     /* stop tracking region*/
     } else {
         slot->flags &= ~HVF_SLOT_LOG;
-        hv_vm_protect((hv_gpaddr_t)slot->start, (size_t)slot->size,
+        hv_vm_protect((uintptr_t)slot->start, (size_t)slot->size,
                       HV_MEMORY_READ | HV_MEMORY_WRITE);
     }
 }
-- 
2.30.1 (Apple Git-130)

