Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp6150020lfp;
        Tue, 4 Feb 2020 19:13:03 -0800 (PST)
X-Google-Smtp-Source: APXvYqzL8caLJ09ZV0OROTqKxGww8/b+4zno+6rX9LuHdxcKhAwmcWiWsNsfkIQ0kMXTBQI054DF
X-Received: by 2002:ac8:72d6:: with SMTP id o22mr31172710qtp.20.1580872383068;
        Tue, 04 Feb 2020 19:13:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580872383; cv=none;
        d=google.com; s=arc-20160816;
        b=cH7D3FsutaMCdlXiMy3R60LkfaK619l21WFz2A2i94aYYtAEcsW61PB867c2vGtQyU
         mFe5pPOB4cgYsK+KC9fL4s5U+WUeHKAruoMzOfkiYWgQzDN86tx5p8yFNrjyN2Y6BnOH
         QBb3J2W8rdQpT4+PpGR00uio34MqMsL56E+R1/DmAQP/g7AsYIotoGFKv9anoVNNKsMk
         PP5XWalIDYLUsj1P5HZb2bQUBIoQK06EyRUtWXELFH4Jt5x9p8ArJdwndWYqsRJFRuJH
         liGQOy6vZkfm/OeRSwAvL715yYrvox+oeX9nJv11WQxAtPDNZqmJVBzFuKR5GgbyRIl+
         Us4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=e3sZqixUTB6l4ZXXTVziX6Kdsz82alFvsnQ/+T1eNL0=;
        b=V5Q4A/wt2yZrnumDgM/tik9yN06hlLuVWiY4AyvF/ZPkse4Vr57b3BvAiVsucciKzb
         vLlGvcXH9YKSN0E0+mbLwfivQWtQ7slB/g/CogCRJ7exA7eXdsAMr6d2hn29VHL721pu
         44EerGvX8gs8Bgb5gJrAIvFcvoCpzketGZvztvLfOGRBkLH2ULPQGPyWN9q4wUS8BPRj
         ImMbpuh2S/RNpEIMWBnlr55d7ka0ic4mk6IqJj0IU5tl/FgKp8oY0QG7JcWvWbthn+VD
         KVqAZgWwnTAQ813xv3kckKFLobYg1mBcszvlT3dWRWi1YNoRhroXKrbQjspBjMn2TSgW
         zPpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="YL/pajQ9";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r10si14811298qvs.126.2020.02.04.19.13.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2020 19:13:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="YL/pajQ9";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izB7e-0005Ma-HN
	for alex.bennee@linaro.org; Tue, 04 Feb 2020 22:13:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45933)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gshan@redhat.com>) id 1izB7T-0005JJ-3k
 for qemu-arm@nongnu.org; Tue, 04 Feb 2020 22:12:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <gshan@redhat.com>) id 1izB7R-0003ZN-UL
 for qemu-arm@nongnu.org; Tue, 04 Feb 2020 22:12:51 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:40479
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <gshan@redhat.com>) id 1izB7R-0003VG-Qk
 for qemu-arm@nongnu.org; Tue, 04 Feb 2020 22:12:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580872368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=e3sZqixUTB6l4ZXXTVziX6Kdsz82alFvsnQ/+T1eNL0=;
 b=YL/pajQ9PhCXCCwzzRR1F9EH7K598xFqe0iftQRfKjWJohPVq+NXPyxbyXBJT1y60ns9ee
 rw8Gp0cpWYvncT/zh3Fb1EWveNn6chfJvTJyF0MBe1Uues8TeF1Z0ch4p31zJALq2vEzrB
 jIyH9EnuUxPRgZ2Xo88uDUmWpEUTCJU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-HGn0GsbIM5i_UTGpsoYgbA-1; Tue, 04 Feb 2020 22:12:45 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51D661137842;
 Wed,  5 Feb 2020 03:12:44 +0000 (UTC)
Received: from localhost.localdomain.com (vpn2-54-74.bne.redhat.com
 [10.64.54.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 09149811F8;
 Wed,  5 Feb 2020 03:12:40 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [RFC PATCH v2 1/2] target/arm: Allow to inject SError interrupt
Date: Wed,  5 Feb 2020 14:12:26 +1100
Message-Id: <20200205031227.24355-2-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: HGn0GsbIM5i_UTGpsoYgbA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, jthierry@redhat.com,
 aik@ozlabs.ru, maz@kernel.org, eric.auger@redhat.com, shan.gavin@gmail.com,
 pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LhrC2SYK+xXr

This allows to inject SError interrupt, which will be used on receiving
QMP/HMP "nmi" command in next patch.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 target/arm/cpu.c    | 11 +++++++++++
 target/arm/cpu.h    | 12 +++++++++---
 target/arm/helper.c |  4 ++++
 3 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index f86e71a260..24fd77437b 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -461,6 +461,17 @@ bool arm_cpu_exec_interrupt(CPUState *cs, int interrup=
t_request)
         }
     }
=20
+    if (interrupt_request & CPU_INTERRUPT_SERROR) {
+        excp_idx =3D EXCP_SERROR;
+        target_el =3D arm_phys_excp_target_el(cs, excp_idx, cur_el, secure=
);
+        if (arm_excp_unmasked(cs, excp_idx, target_el)) {
+            cs->exception_index =3D excp_idx;
+            env->exception.target_el =3D target_el;
+            cc->do_interrupt(cs);
+            ret =3D true;
+        }
+    }
+
     return ret;
 }
=20
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 608fcbd0b7..0bbc46ff6d 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -49,6 +49,7 @@
 #define EXCP_LAZYFP         20   /* v7M fault during lazy FP stacking */
 #define EXCP_LSERR          21   /* v8M LSERR SecureFault */
 #define EXCP_UNALIGNED      22   /* v7M UNALIGNED UsageFault */
+#define EXCP_SERROR         23   /* SError Interrupt */
 /* NB: add new EXCP_ defines to the array in arm_log_exception() too */
=20
 #define ARMV7M_EXCP_RESET   1
@@ -79,9 +80,10 @@ enum {
 };
=20
 /* ARM-specific interrupt pending bits.  */
-#define CPU_INTERRUPT_FIQ   CPU_INTERRUPT_TGT_EXT_1
-#define CPU_INTERRUPT_VIRQ  CPU_INTERRUPT_TGT_EXT_2
-#define CPU_INTERRUPT_VFIQ  CPU_INTERRUPT_TGT_EXT_3
+#define CPU_INTERRUPT_FIQ    CPU_INTERRUPT_TGT_EXT_1
+#define CPU_INTERRUPT_VIRQ   CPU_INTERRUPT_TGT_EXT_2
+#define CPU_INTERRUPT_VFIQ   CPU_INTERRUPT_TGT_EXT_3
+#define CPU_INTERRUPT_SERROR CPU_INTERRUPT_TGT_EXT_4
=20
 /* The usual mapping for an AArch64 system register to its AArch32
  * counterpart is for the 32 bit world to have access to the lower
@@ -2731,6 +2733,10 @@ static inline bool arm_excp_unmasked(CPUState *cs, u=
nsigned int excp_idx,
         pstate_unmasked =3D !(env->daif & PSTATE_I);
         break;
=20
+    case EXCP_SERROR:
+       pstate_unmasked =3D !(env->daif & PSTATE_A);
+       break;
+
     case EXCP_VFIQ:
         if (secure || !(hcr_el2 & HCR_FMO) || (hcr_el2 & HCR_TGE)) {
             /* VFIQs are only taken when hypervized and non-secure.  */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 19a57a17da..622a1d8796 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7980,6 +7980,7 @@ void arm_log_exception(int idx)
             [EXCP_LAZYFP] =3D "v7M exception during lazy FP stacking",
             [EXCP_LSERR] =3D "v8M LSERR UsageFault",
             [EXCP_UNALIGNED] =3D "v7M UNALIGNED UsageFault",
+            [EXCP_SERROR] =3D "SError Interrupt",
         };
=20
         if (idx >=3D 0 && idx < ARRAY_SIZE(excnames)) {
@@ -8566,6 +8567,9 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs=
)
     case EXCP_VFIQ:
         addr +=3D 0x100;
         break;
+    case EXCP_SERROR:
+        addr +=3D 0x180;
+        break;
     default:
         cpu_abort(cs, "Unhandled exception 0x%x\n", cs->exception_index);
     }
--=20
2.23.0

