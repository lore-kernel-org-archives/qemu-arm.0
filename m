Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp825807wrt;
        Wed, 28 Nov 2018 01:58:42 -0800 (PST)
X-Google-Smtp-Source: AJdET5dCzYwPxfnqIgeCnjtpujUjcX/484pDZTLEy3a8qmOXr/k7ZKWroMGPgRrUUdjlbR2PvcSd
X-Received: by 2002:a81:3294:: with SMTP id y142mr37272354ywy.399.1543399122517;
        Wed, 28 Nov 2018 01:58:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543399122; cv=none;
        d=google.com; s=arc-20160816;
        b=UBJgmJjn9G+cZ17QE8wyo5Be+UAN5nixCd93CmJlpQbR0eUERBAY87OAvZno70hd3J
         YdfzcmSOHK6W+FDBc0uADaCKMx+lCK3BsJrJa/otUABiRtoyBLQ7bW2A7UGeg7jgMXtf
         9yJn0MeXckOrDq5VzUj1/29AS9P6rEawGwMV1D6g3t/W0ommhzvKtpSLOy2FRovLEVJp
         Dt2eKWaekoGClOdp/zXD4p0X/WfjoZzhRysTx0+HxhcNRaws1VJpgDaB7BtqITBd+tVO
         CA0UKvmd0J0tdEoVOVnLs67MeCnsq1TeVjkvdp9wOAGhEikQdcaTKvvvyb9Abr+cYdJB
         8tdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from;
        bh=h8Cq7jxnHKOOewfjXoQlaaWR0LxgWx/u8TB1hAq8104=;
        b=ZMI0nBuZqg4qWqYq+/B+ibZ0zEAa+KM+zI59t8CghrSfEJZW3tOyJR09eTdGPhHd+G
         qF5sHvx5W5xMOd0tTWfAdpQETJHeuiisj/v+X2qVQeL7KbejiiU2yb/mx1D83Pd+oP+G
         8hwj+695RTFiclGs2QIL5Mp6EzgaiYCg1KumYwBLIrgegjmh+gW1NVRGbkkW+piWBkUH
         dJ9IpbmRYoWxZTPUIj2XnMVYE5tydM8Ux8MA23PG556ap7jViA0eM+Tb5giJ+osbDCC+
         jiXi52NNtt8y4EoYhd15V6UermSQZzIpnqC+Et+EVkAcF0LtDYh/0HAPWmDkueYaEe/e
         z+Sg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v8-v6si4417307ybo.387.2018.11.28.01.58.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Nov 2018 01:58:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46870 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRwcD-00025a-UX
	for alex.bennee@linaro.org; Wed, 28 Nov 2018 04:58:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45172)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gRwby-00022c-3X
	for qemu-arm@nongnu.org; Wed, 28 Nov 2018 04:58:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gRwbs-0006Sl-Sq
	for qemu-arm@nongnu.org; Wed, 28 Nov 2018 04:58:25 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51598)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gRwbs-0006SI-Lq; Wed, 28 Nov 2018 04:58:20 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D407930044DF;
	Wed, 28 Nov 2018 09:58:19 +0000 (UTC)
Received: from thuth.com (ovpn-116-167.ams2.redhat.com [10.36.116.167])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4725970123;
	Wed, 28 Nov 2018 09:58:18 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Wed, 28 Nov 2018 10:58:14 +0100
Message-Id: <1543399094-2260-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Wed, 28 Nov 2018 09:58:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH for-3.1?] target/arm/sve_helper: Fix compilation
 with clang 3.4
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5XPmYdrFh3Z2

Clang 3.4 does not know the "flatten" attribute yet. We've already
introduced the QEMU_FLATTEN macro for this in commit 97ff87c0ed020c2,
so use this macro now here, too, to fix this issue.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/arm/sve_helper.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 8cbc651..bc84725 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -4382,20 +4382,20 @@ static void sve_ld4_r(CPUARMState *env, void *vg, target_ulong addr,
 }
 
 #define DO_LDN_1(N) \
-void __attribute__((flatten)) HELPER(sve_ld##N##bb_r)               \
+void QEMU_FLATTEN HELPER(sve_ld##N##bb_r) \
     (CPUARMState *env, void *vg, target_ulong addr, uint32_t desc)  \
 {                                                                   \
     sve_ld##N##_r(env, vg, addr, desc, 1, GETPC(), sve_ld1bb_tlb);  \
 }
 
 #define DO_LDN_2(N, SUFF, SIZE)                                       \
-void __attribute__((flatten)) HELPER(sve_ld##N##SUFF##_le_r)          \
+void QEMU_FLATTEN HELPER(sve_ld##N##SUFF##_le_r)                      \
     (CPUARMState *env, void *vg, target_ulong addr, uint32_t desc)    \
 {                                                                     \
     sve_ld##N##_r(env, vg, addr, desc, SIZE, GETPC(),                 \
                   sve_ld1##SUFF##_le_tlb);                            \
 }                                                                     \
-void __attribute__((flatten)) HELPER(sve_ld##N##SUFF##_be_r)          \
+void QEMU_FLATTEN HELPER(sve_ld##N##SUFF##_be_r)                      \
     (CPUARMState *env, void *vg, target_ulong addr, uint32_t desc)    \
 {                                                                     \
     sve_ld##N##_r(env, vg, addr, desc, SIZE, GETPC(),                 \
@@ -4832,7 +4832,7 @@ static void sve_st4_r(CPUARMState *env, void *vg, target_ulong addr,
 }
 
 #define DO_STN_1(N, NAME, ESIZE) \
-void __attribute__((flatten)) HELPER(sve_st##N##NAME##_r)           \
+void QEMU_FLATTEN HELPER(sve_st##N##NAME##_r) \
     (CPUARMState *env, void *vg, target_ulong addr, uint32_t desc)  \
 {                                                                   \
     sve_st##N##_r(env, vg, addr, desc, GETPC(), ESIZE, 1,           \
@@ -4840,13 +4840,13 @@ void __attribute__((flatten)) HELPER(sve_st##N##NAME##_r)           \
 }
 
 #define DO_STN_2(N, NAME, ESIZE, MSIZE) \
-void __attribute__((flatten)) HELPER(sve_st##N##NAME##_le_r)          \
+void QEMU_FLATTEN HELPER(sve_st##N##NAME##_le_r) \
     (CPUARMState *env, void *vg, target_ulong addr, uint32_t desc)    \
 {                                                                     \
     sve_st##N##_r(env, vg, addr, desc, GETPC(), ESIZE, MSIZE,         \
                   sve_st1##NAME##_le_tlb);                            \
 }                                                                     \
-void __attribute__((flatten)) HELPER(sve_st##N##NAME##_be_r)          \
+void QEMU_FLATTEN HELPER(sve_st##N##NAME##_be_r)                      \
     (CPUARMState *env, void *vg, target_ulong addr, uint32_t desc)    \
 {                                                                     \
     sve_st##N##_r(env, vg, addr, desc, GETPC(), ESIZE, MSIZE,         \
@@ -4966,7 +4966,7 @@ static void sve_ld1_zd(CPUARMState *env, void *vd, void *vg, void *vm,
 }
 
 #define DO_LD1_ZPZ_S(MEM, OFS) \
-void __attribute__((flatten)) HELPER(sve_ld##MEM##_##OFS)    \
+void QEMU_FLATTEN HELPER(sve_ld##MEM##_##OFS) \
     (CPUARMState *env, void *vd, void *vg, void *vm,         \
      target_ulong base, uint32_t desc)                       \
 {                                                            \
@@ -4975,7 +4975,7 @@ void __attribute__((flatten)) HELPER(sve_ld##MEM##_##OFS)    \
 }
 
 #define DO_LD1_ZPZ_D(MEM, OFS) \
-void __attribute__((flatten)) HELPER(sve_ld##MEM##_##OFS)    \
+void QEMU_FLATTEN HELPER(sve_ld##MEM##_##OFS) \
     (CPUARMState *env, void *vd, void *vg, void *vm,         \
      target_ulong base, uint32_t desc)                       \
 {                                                            \
@@ -5326,7 +5326,7 @@ static void sve_st1_zd(CPUARMState *env, void *vd, void *vg, void *vm,
 }
 
 #define DO_ST1_ZPZ_S(MEM, OFS) \
-void __attribute__((flatten)) HELPER(sve_st##MEM##_##OFS)    \
+void QEMU_FLATTEN HELPER(sve_st##MEM##_##OFS) \
     (CPUARMState *env, void *vd, void *vg, void *vm,         \
      target_ulong base, uint32_t desc)                       \
 {                                                            \
@@ -5335,7 +5335,7 @@ void __attribute__((flatten)) HELPER(sve_st##MEM##_##OFS)    \
 }
 
 #define DO_ST1_ZPZ_D(MEM, OFS) \
-void __attribute__((flatten)) HELPER(sve_st##MEM##_##OFS)    \
+void QEMU_FLATTEN HELPER(sve_st##MEM##_##OFS) \
     (CPUARMState *env, void *vd, void *vg, void *vm,         \
      target_ulong base, uint32_t desc)                       \
 {                                                            \
-- 
1.8.3.1

