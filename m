Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp6535886lfp;
        Wed, 5 Feb 2020 03:09:08 -0800 (PST)
X-Google-Smtp-Source: APXvYqwKGDKBoHMlcmQ7pI2nXw2cCYgxFI5fd+t2a9i2j11XAZ3J8guUiln8Iz8kxKVcYGPuwsND
X-Received: by 2002:a05:6214:1428:: with SMTP id o8mr32254006qvx.87.1580900948080;
        Wed, 05 Feb 2020 03:09:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580900948; cv=none;
        d=google.com; s=arc-20160816;
        b=hP7b5acnNxxlBbrCb7skXEkKt83zYRmW747JX77AXpieXvxbAQlbNn1yzKXEeCppj2
         jg5G7yswpMana+ojOC14WbIEeKVscecZBMxW95QlbGmBQ6VlagC/P5JIRTK6ErZqFdqb
         fXoGAyB7/9RI/24Og70JXTu0K5gTJRsC7Y4kqRiEmsr1uecGzFIfbNxNWpiWBemjv/Qw
         H+6/yRYBaDdlnnJRRjE7KTAj1LV7mO2uK3xCkK5xH7oWtjzpu7UFLsFNavLhuOiKbm5C
         9DsqBmlAVRTxFgrkcBQz1gw1nvkLc/Y8fRhU7SsySc6jekYXloEyRJ8JIt4GaZH81AZC
         qdhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=e3sZqixUTB6l4ZXXTVziX6Kdsz82alFvsnQ/+T1eNL0=;
        b=o5Q0H+hPBGMneo24WJtlha4oa8OKRQ+zFIo6Spx8bisaNMpqRa4KBNFVD8ltzzX2zm
         ri7AhJf35MHjffQrTImzEtJLy+vtQX3YBslD5d87mx4WqseBqdtLyYQwKLK99+OGzdBn
         zve1I76R413BeCGAcCte/pzRVAm9rblRtRXjUk7/Ih8fDJsWgmgHxcXNxEDpTvfJmMsn
         /BHszUVegcRHD2L8rFWW2WpOV+L+ZmI5N32C9DgCSrjeYkKifXlFKHE87hDGvB0ydmkU
         8NQvlkq0b/Bhv7fSOuQnGh5cLYws6OfdKn20JYjKu1UHwQYf0A8zdSJmBsUVS7IdIR90
         2Niw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=A8Pv9jLR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b42si15261141qtc.156.2020.02.05.03.09.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Feb 2020 03:09:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=A8Pv9jLR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izIYN-0004uR-Gc
	for alex.bennee@linaro.org; Wed, 05 Feb 2020 06:09:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47083)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gshan@redhat.com>) id 1izIVO-0008SA-6S
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 06:06:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <gshan@redhat.com>) id 1izIVM-00061e-Pz
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 06:06:02 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:60149
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <gshan@redhat.com>) id 1izIVM-0005ye-Lb
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 06:06:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580900760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=e3sZqixUTB6l4ZXXTVziX6Kdsz82alFvsnQ/+T1eNL0=;
 b=A8Pv9jLRbAmjdLS9aUKwEs/3Ssfew+kHtu+NccAGhMKBNCGDVQ2YMswXkXr2lG8J51QJN9
 w2ZvRrP97N4f4Y72jxAVjngTy/TMzEfwnEAx13mJmke+xz79zuS2sh0zPO4K7G7EAgrEBC
 w7VOimqbRHWqA0mvierpZ24bisSvW/E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-0LMMxv78OiOYiA_Axh2k4g-1; Wed, 05 Feb 2020 06:05:58 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 920DB1835A03;
 Wed,  5 Feb 2020 11:05:57 +0000 (UTC)
Received: from localhost.localdomain.com (vpn2-54-31.bne.redhat.com
 [10.64.54.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D4743790C0;
 Wed,  5 Feb 2020 11:05:54 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [RESEND RFC PATCH v2 1/2] target/arm: Allow to inject SError interrupt
Date: Wed,  5 Feb 2020 22:05:40 +1100
Message-Id: <20200205110541.37811-2-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: 0LMMxv78OiOYiA_Axh2k4g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
X-TUID: 6jj9cQqPQTCU

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

