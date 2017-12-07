Received: by 10.223.159.74 with SMTP id f10csp5147118wrg;
        Thu, 7 Dec 2017 03:08:12 -0800 (PST)
X-Google-Smtp-Source: AGs4zMauRUs9WxzFNTnaDwSyP2q6dCcqeQhjFrJ7sNLlS49UmqRgSmYQqey4sigpMh+Hs8XtLf8J
X-Received: by 10.37.50.193 with SMTP id y184mr6418085yby.181.1512644892436;
        Thu, 07 Dec 2017 03:08:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512644892; cv=none;
        d=google.com; s=arc-20160816;
        b=KYw2d6U8ym1p4dQkhqr/p6H2l4mBEvciYJkUmU4zSD+ThhhkhxAxOIFodmzWHO/30d
         Rj9y60JJgajcqcwySE6Nf/pmoVOslpAtGJcHyAUw4VduOCxqPohZCxl+/28AUwauEbat
         jVsO/WB5g/8VNaJYecVub/UtgsKXjppOJcvrzcpMir0SBNG4OdzrBhsndmJbvMzVTWbL
         Y0JeT27BGtHPM96clK4R/cSpJYO49LSuyW3i1bIznFhnGSeREwH1858NnVPUdbBlEopD
         C/VX04g/+BaAaMMm1tbSEMnuzM6oi9o/ZyoFd1TzuO60SA3Lmj6on5UjlCmwdE+pkYYg
         e3kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=yHuEAvPNR2p12gCD1QLL7dF+dOjGkDeTC/xXJ0s8dQw=;
        b=OuLGe2Nfr79NnHVYKWJzA9qp+gD5qQdVPmWOgyYL7gxr4mQAfiOEaV1NWDNDt3zS5a
         KWKu/5/DfgiuE4y2c8PhLHNptg5w9eFr+NowfbhE978Mbpsx/uSDn/XwMpjlNiCOK+D/
         pULSdO9jtFDqSvIv5oreopqKKkt5K1U3uTIn5SJR6+4z/aqQcMuJKbTISzTnbnMPt1lS
         bA2NvFeQMQDupw/s1m0TQappjHQaNt7Df2lm9xo10zDFPxh3tlO4l771djw9VzFgu5AZ
         Ba0Xcqk2giMFZlXnbGHbwpRwLB2/vu0Nb3qmqQLhtGfoPenwqIvWdQww20Zyain3B3QY
         dhUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a9/Nea4+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p15si1081704ywm.566.2017.12.07.03.08.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Dec 2017 03:08:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a9/Nea4+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60004 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eMu2F-000562-U7
	for alex.bennee@linaro.org; Thu, 07 Dec 2017 06:08:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36252)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eMu28-00055t-Ul
	for qemu-arm@nongnu.org; Thu, 07 Dec 2017 06:08:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eMu28-00007O-0u
	for qemu-arm@nongnu.org; Thu, 07 Dec 2017 06:08:04 -0500
Received: from mail-ot0-x22d.google.com ([2607:f8b0:4003:c0f::22d]:44805)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eMu26-000056-M5
	for qemu-arm@nongnu.org; Thu, 07 Dec 2017 06:08:03 -0500
Received: by mail-ot0-x22d.google.com with SMTP id d27so6007255ote.11
	for <qemu-arm@nongnu.org>; Thu, 07 Dec 2017 03:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=yHuEAvPNR2p12gCD1QLL7dF+dOjGkDeTC/xXJ0s8dQw=;
	b=a9/Nea4+2IoXXI8f0tN7OfcsoAkeAdlGJO0MFpDhZCA4r5LK0Et9u9pq7q0MqaJpDn
	E3zIgoY4Gg7xKplySAkkbDZzDafMAs1bf9ltN8RTIp24vS4WG/I8Jq5xXzq5LRliDxh0
	v7koagJOeqFtRRvM/oPJd49VBLKD/fEVcnnwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=yHuEAvPNR2p12gCD1QLL7dF+dOjGkDeTC/xXJ0s8dQw=;
	b=bSG4JI0J/SFFYSIPhWsM9vFHWHiqJDyKMHPhREVZkzJBaci0MV36O/mp7vzun+WTkN
	/nIGm46peHT7KvSpq95M4OB9jssM+wLqo2rmq/D9MD2IhvcRodZPfqdp/b5E/RaHs4BC
	rCU8tpmAHdqQjRN6jrgby/bzZ/pCmfptq94oTwpUO1nhmnIBjn03FBASMRI9t6A4s7I5
	RyKnKLLFos5komP8eJuoqVXebMJ0+QhuhE9d3BVj4clPRu18zZpfI0SOz88Mp54WVIAL
	aDQKq40ftwBW1Uf7yvhHXG4l8o/SEg1GIAEWJoziQSISozTa0oeL/I/B3rRDqs38HjGN
	1YlQ==
X-Gm-Message-State: AJaThX4ytFK3H70LLNdbyucE9Tvq+WudWh5EuatMrIPXB82QVkpN5FPM
	rxCHFGn8Jn1K97ewZrKSCBvc7V6ACHB6lyarv3BW2Q==
X-Received: by 10.157.37.173 with SMTP id q42mr23468120ota.116.1512644882002; 
	Thu, 07 Dec 2017 03:08:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Thu, 7 Dec 2017 03:07:41 -0800 (PST)
In-Reply-To: <ac246e55-a12d-6d9d-959a-47aa0334c17f@amsat.org>
References: <1512153879-5291-1-git-send-email-peter.maydell@linaro.org>
	<1512153879-5291-5-git-send-email-peter.maydell@linaro.org>
	<ac246e55-a12d-6d9d-959a-47aa0334c17f@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Dec 2017 11:07:41 +0000
Message-ID: <CAFEAcA8zN1nd1pWE9SZGzE1AipO-Ss7Xz8kSXMEvFhX_C5LckA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::22d
Subject: Re: [Qemu-arm] [PATCH 4/7] target/arm: Split M profile MNegPri mmu
 index into user and priv
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: i24ZpRCZp9Tv

On 5 December 2017 at 21:23, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
> The patch is correct, but I don't like having magic values.

Yeah, you're right this would be better. I've already put this
patch into target-arm.next, so I'll just squash in this change:

--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2258,6 +2258,11 @@ static inline bool arm_excp_unmasked(CPUState
*cs, unsigned int excp_idx,
 #define ARM_MMU_IDX_NOTLB 0x20 /* does not have a TLB */
 #define ARM_MMU_IDX_M 0x40 /* M profile */

+/* meanings of the bits for M profile mmu idx values */
+#define ARM_MMU_IDX_M_PRIV 0x1
+#define ARM_MMU_IDX_M_NEGPRI 0x2
+#define ARM_MMU_IDX_M_S 0x4
+
 #define ARM_MMU_IDX_TYPE_MASK (~0x7)
 #define ARM_MMU_IDX_COREIDX_MASK 0x7

@@ -2328,7 +2333,7 @@ static inline int arm_mmu_idx_to_el(ARMMMUIdx mmu_idx=
)
     case ARM_MMU_IDX_A:
         return mmu_idx & 3;
     case ARM_MMU_IDX_M:
-        return mmu_idx & 1;
+        return mmu_idx & ARM_MMU_IDX_M_PRIV;
     default:
         g_assert_not_reached();
     }
@@ -2342,15 +2347,15 @@ static inline ARMMMUIdx
arm_v7m_mmu_idx_for_secstate(CPUARMState *env,
     ARMMMUIdx mmu_idx =3D ARM_MMU_IDX_M;

     if (el !=3D 0) {
-        mmu_idx |=3D 1;
+        mmu_idx |=3D ARM_MMU_IDX_M_PRIV;
     }

     if (armv7m_nvic_neg_prio_requested(env->nvic, secstate)) {
-        mmu_idx |=3D 2;
+        mmu_idx |=3D ARM_MMU_IDX_M_NEGPRI;
     }

     if (secstate) {
-        mmu_idx |=3D 4;
+        mmu_idx |=3D ARM_MMU_IDX_M_S;
     }

     return mmu_idx;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 14ab1f4..70cf313 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7885,10 +7885,7 @@ static inline bool
regime_translation_disabled(CPUARMState *env,
                 (R_V7M_MPU_CTRL_ENABLE_MASK | R_V7M_MPU_CTRL_HFNMIENA_MASK=
)) {
         case R_V7M_MPU_CTRL_ENABLE_MASK:
             /* Enabled, but not for HardFault and NMI */
-            return mmu_idx =3D=3D ARMMMUIdx_MUserNegPri ||
-                mmu_idx =3D=3D ARMMMUIdx_MPrivNegPri ||
-                mmu_idx =3D=3D ARMMMUIdx_MSUserNegPri ||
-                mmu_idx =3D=3D ARMMMUIdx_MSPrivNegPri;
+            return mmu_idx & ARM_MMU_IDX_M_NEGPRI;
         case R_V7M_MPU_CTRL_ENABLE_MASK | R_V7M_MPU_CTRL_HFNMIENA_MASK:
             /* Enabled for all cases */
             return false;


thanks
-- PMM
