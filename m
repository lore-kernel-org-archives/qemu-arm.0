Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp1810679lfq;
        Mon, 28 Feb 2022 06:08:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwqwBBaxTcDiPKowggUKZZUsUcpei2HojNqq+B1gVv9oRERxv7TFL5jyrrtwCODFx10TDxY
X-Received: by 2002:ab0:72d1:0:b0:342:3751:d637 with SMTP id g17-20020ab072d1000000b003423751d637mr7325518uap.143.1646057288234;
        Mon, 28 Feb 2022 06:08:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646057288; cv=none;
        d=google.com; s=arc-20160816;
        b=VK8XGqFLFJzK3EOCcSRSME8+d+k/6KvTCUEmxFozN1Et7PK42tmOsxzbxfKyv5jQxn
         rPEXTx33Vr/oQB82jakFi14fQwHKGoxLBnmmF5eb2WU4fvOLUYF9NrKBnvtgCElfkNGg
         uuMB6+gvKlcl4ooIrTPkRG28vCkn44Cep36OurTTe/BX2odZ1tMtEvBJxJwlYJPPmOlD
         V8NOqs/uBp7w0bngyzuKGQbO/RXMgGtxNCwkmjDUc7LIqF51CItr0+RCd+uiu+mUc+6X
         2X3mzBGZjNelX9KORfmO6SwF8tadw+lFBgNsBu3+Ue36WsnFd88GvS3rSwxiCslxV0uH
         2ASQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:to:in-reply-to:message-id:subject:date
         :from;
        bh=eYT28grsanQ3tIdurvz5kcHBNbX363SrfqFu4dcQ+Zg=;
        b=dSKA6q87rYUub4A2JNWAF0E7MDZW3GiVcsMnKEUJUYEMWqYurT8yAeFZtIE+Hl/hRZ
         Ipjhr4Wum0iEdL93mPsXH3p+U/She5n1AR8XswkPchJtjfyMs/L0uDjjGCfELQX4Gtn+
         iCgrJ2Yo8rmV0jdc0gF7IBEgz1T+0zJyAJs87ERe01J2Bo30lHDn/7Ms774SU5dgalgQ
         qtJ6zH6UA58orxaJqev8lz9y78rjfP59weE+dgWhEhTgGMyFvriz209pej0OsjcvvZYJ
         f74xbycrLnCUceBoNYdDQPecldGtWF5r67i7mpL0Igvv8/fPiuTmWyBjDkoXq/+94yXZ
         PNbA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r21-20020ab06f15000000b0033d0a36d5d8si859869uah.224.2022.02.28.06.08.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Feb 2022 06:08:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1]:52924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nOgh5-0007r2-I5
	for alex.bennee@linaro.org; Mon, 28 Feb 2022 09:08:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nOZn7-0001Yv-6c; Mon, 28 Feb 2022 01:45:53 -0500
Received: from mail-b.sr.ht ([173.195.146.151]:58202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nOZn5-0003JJ-9c; Mon, 28 Feb 2022 01:45:52 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 70DFD11EF53;
 Mon, 28 Feb 2022 06:45:46 +0000 (UTC)
From: ~ubzeme <ubzeme@git.sr.ht>
Date: Mon, 28 Feb 2022 09:41:52 +0800
Subject: [PATCH qemu 6/7] hvf: add a lock for memory related functions
Message-ID: <164603074537.20094.1732342403585879912-6@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <164603074537.20094.1732342403585879912-0@git.sr.ht>
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 18
X-Spam_score: 1.8
X-Spam_bar: +
X-Spam_report: (1.8 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 FREEMAIL_FORGED_REPLYTO=2.095, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 28 Feb 2022 09:07:40 -0500
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
Reply-To: ~ubzeme <ubzeme@gmail.com>
Cc: Yan-Jie Wang <ubzeme@gmail.com>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3qkgR1WsSzdM

From: Yan-Jie Wang <ubzeme@gmail.com>

We follow how KVM accel does in its memory listener (kvm-all.c) and add
a lock for the memory related functions.

Signed-off-by: Yan-Jie Wang <ubzeme@gmail.com>
---
 accel/hvf/hvf-mem.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/accel/hvf/hvf-mem.c b/accel/hvf/hvf-mem.c
index b8d8bf6799..4948578adf 100644
--- a/accel/hvf/hvf-mem.c
+++ b/accel/hvf/hvf-mem.c
@@ -43,6 +43,7 @@ typedef struct HVFSlot {
 } HVFSlot;
=20
 static HVFSlot memslots[HVF_NUM_SLOTS];
+static QemuMutex memlock;
=20
 static HVFSlot *hvf_find_overlap_slot(hwaddr start, hwaddr size)
 {
@@ -140,6 +141,8 @@ static void hvf_set_phys_mem(MemoryRegionSection *section=
, bool add)
         readonly =3D memory_region_is_rom(area) || memory_region_is_romd(are=
a);
=20
         /* setup a slot */
+        qemu_mutex_lock(&memlock);
+
         slot =3D hvf_find_free_slot();
         if (!slot) {
             error_report("No free slots");
@@ -169,8 +172,12 @@ static void hvf_set_phys_mem(MemoryRegionSection *sectio=
n, bool add)
=20
         ret =3D hv_vm_map(host_addr, start, size, flags);
         assert_hvf_ok(ret);
+
+        qemu_mutex_unlock(&memlock);
     } else {
         /* remove memory region */
+        qemu_mutex_lock(&memlock);
+
         slot =3D hvf_find_overlap_slot(start, size);
=20
         if (slot) {
@@ -179,6 +186,8 @@ static void hvf_set_phys_mem(MemoryRegionSection *section=
, bool add)
=20
             slot->size =3D 0;
         }
+
+        qemu_mutex_unlock(&memlock);
     }
 }
=20
@@ -186,6 +195,8 @@ static void hvf_set_dirty_tracking(MemoryRegionSection *s=
ection, bool on)
 {
     HVFSlot *slot;
=20
+    qemu_mutex_lock(&memlock);
+
     slot =3D hvf_find_overlap_slot(
             section->offset_within_address_space,
             int128_get64(section->size));
@@ -201,6 +212,8 @@ static void hvf_set_dirty_tracking(MemoryRegionSection *s=
ection, bool on)
         hv_vm_protect((uintptr_t)slot->start, (size_t)slot->size,
                       HV_MEMORY_READ | HV_MEMORY_WRITE | HV_MEMORY_EXEC);
     }
+
+    qemu_mutex_unlock(&memlock);
 }
=20
 static void hvf_log_start(MemoryListener *listener,
@@ -271,10 +284,13 @@ bool hvf_access_memory(hwaddr address, bool write)
     hv_return_t ret;
     hwaddr start, size;
=20
+    qemu_mutex_lock(&memlock);
+
     slot =3D hvf_find_overlap_slot(address, 1);
=20
     if (!slot || (write && slot->flags & HVF_SLOT_READONLY)) {
         /* MMIO or unmapped area, return false */
+        qemu_mutex_unlock(&memlock);
         return false;
     }
=20
@@ -290,10 +306,12 @@ bool hvf_access_memory(hwaddr address, bool write)
         assert_hvf_ok(ret);
     }
=20
+    qemu_mutex_unlock(&memlock);
     return true;
 }
=20
 void hvf_init_memslots(void)
 {
+    qemu_mutex_init(&memlock);
     memory_listener_register(&hvf_memory_listener, &address_space_memory);
 }
--=20
2.34.1

