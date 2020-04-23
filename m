Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1590601lfm;
        Thu, 23 Apr 2020 00:34:36 -0700 (PDT)
X-Google-Smtp-Source: APiQypL2VmU8IEEl9MU8UPT32rEJ7elN+ruJ0t2HAiUOASw8nfgriMzrWvU1R5Tr0hDp2NcwPrvG
X-Received: by 2002:ac8:4907:: with SMTP id e7mr2661861qtq.300.1587627275550;
        Thu, 23 Apr 2020 00:34:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587627275; cv=none;
        d=google.com; s=arc-20160816;
        b=NlGuzXg448uKtaqc9FbzKFx3pekKgIGvtL1VDeOI9CMHWiKjP0YuXqKy4BVY5lbZ2G
         uvba6lmfQNkOZJWhYXzgoG/X4GxQ5JYYRPiiHpXs7o7sDOIG7T+CdmEoCyn7ZW4tfNXA
         GrwsSZWi4BUKCk9PsYkkpwXqA5PBwQHteOSE+nbJjmePbXHzVbNX6+7kGWyFdArS/b0f
         dzNHtGA8cAnG6q7E2hrhg61eYlkSL2IKTW83hTQQhTj8GIGh+EjMHJs1jMFA2VnOoUx5
         HQ3c9yqFQ26C9Msvc7gxbmuT+zs2gd5btyh/iyntYC+zUyVm4XxRfrjulhLFhiR9UR1g
         g4ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ftMZL3c3dNFKHuqGP/JAiTlnjJ0MT+zITksoR9a3Hzw=;
        b=utdl0tV/c5CCTgwEY1JJxTkG2iq1OXLzzXYLs26QPuwpr/wyqgffjeOmOXWeGKeMdR
         CEzFprIVEZmMwa325Td/2YX7AyNt169rCPsqMeoB0XuE0SYIToaOxdDcvX4OtDmrtiC/
         iER/Lz0X8ck0ntdHLHASkUFQcfN0KBsf+DSTWwy4Ocxc9mKednim9RgVk+XeNZrA8S2y
         gbYlN+358sjyqyuBW+E4lJQbTDL0WhKyOVNS9scgk1j40xamtvH+2dZwXrJ+Z51TEnb6
         W65liSBY1NWjqiU89ixJVcAQ8IsG6I51X5i2mMUpaBjeFPwPEJyggtzeeDk54/g/6Cq1
         CrGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PdRHNPlk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i11si843260qkk.156.2020.04.23.00.34.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Apr 2020 00:34:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PdRHNPlk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jRWNW-0004z6-Lf
	for alex.bennee@linaro.org; Thu, 23 Apr 2020 03:34:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46764)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jRWNF-0004yV-TN
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 03:34:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jRWNC-0006iA-NK
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 03:34:17 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:56948
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jRWNC-0006fU-8K
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 03:34:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587627253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ftMZL3c3dNFKHuqGP/JAiTlnjJ0MT+zITksoR9a3Hzw=;
 b=PdRHNPlkCGf4YqqVpVsm6haTApJHaqDMTvyy+KpDH+rA8ERaJU+wOXhyNH635OFhxGuFlr
 6MPBpqpHLdKFjnPe80Ki71Iiu4oQ2t6Y82k0xoXheUb5nIwftUEXMrSsQ8YCQMg/pnTaCh
 yfQINLPO287igYIuaxP68FzOSg+PfaA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-XYGDko4aMfCwrHQAdIScbg-1; Thu, 23 Apr 2020 03:34:10 -0400
X-MC-Unique: XYGDko4aMfCwrHQAdIScbg-1
Received: by mail-wr1-f71.google.com with SMTP id o8so1974640wrm.11
 for <qemu-arm@nongnu.org>; Thu, 23 Apr 2020 00:34:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HPb6SwnFh8ABexhp3OhZw3mu416B1z3vNp3cw7rGJvA=;
 b=ADv3t/OSj1VIiiWzFh6tIqlbmc5gn1jlBnih+/SkmUHKEGItJxO9HRjYhfLiDLeb9d
 DRdUCdeV0LBXtpMC8lj8v5GUBLf7ggdkEpdsI/2JO+YTzZyDD1dcS8gGKoB74VkGMPkd
 BFG4Qu7wgmJ2j0p+kFd3dDywrZojuGdWGwNimnBT/08RYy0RInPNG751G5p6d3DKDm0N
 uh0ZVCGDLsnLZG7DlJGcBV1Ds8SnbXFpoHurMg8xqted1MzquTSYTbaKUQbLrPVlS8My
 eUaHZpsbvMxedABta/ZTiQaEpEvV47TswaylWe/UbEsYm8+4YSR9u4lDmaJQcGH49bWd
 dQWA==
X-Gm-Message-State: AGi0PubiwF/PAOF8mNPAkKCY6MSvqr5pky/WFEMiquZ63W+6Qy9WbPuJ
 IIMkFkvjq4JSje3EXuKFF+myfVhjrA3iGbDsEkKTSXnWn0o+ndNOR5aWXG5zz3/18JZ2UskKpqc
 nn9riqOtfJYKr
X-Received: by 2002:a05:6000:14c:: with SMTP id
 r12mr3271054wrx.62.1587627248996; 
 Thu, 23 Apr 2020 00:34:08 -0700 (PDT)
X-Received: by 2002:a05:6000:14c:: with SMTP id
 r12mr3271034wrx.62.1587627248737; 
 Thu, 23 Apr 2020 00:34:08 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id p190sm2398798wmp.38.2020.04.23.00.34.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2020 00:34:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/5] target/arm: Restric the Address Translate write
 operation to TCG accel
Date: Thu, 23 Apr 2020 09:33:54 +0200
Message-Id: <20200423073358.27155-2-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200423073358.27155-1-philmd@redhat.com>
References: <20200423073358.27155-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/23 03:23:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /QRixTVIJYtx

Under KVM these registers are written by the hardware.
Restrict the writefn handlers to TCG to avoid when building
without TCG:

      LINK    aarch64-softmmu/qemu-system-aarch64
    target/arm/helper.o: In function `do_ats_write':
    target/arm/helper.c:3524: undefined reference to `raise_exception'

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 target/arm/helper.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7e9ea5d20f..dfefb9b3d9 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3442,6 +3442,7 @@ static CPAccessResult ats_access(CPUARMState *env, co=
nst ARMCPRegInfo *ri,
     return CP_ACCESS_OK;
 }
=20
+#ifdef CONFIG_TCG
 static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
                              MMUAccessType access_type, ARMMMUIdx mmu_idx)
 {
@@ -3602,9 +3603,11 @@ static uint64_t do_ats_write(CPUARMState *env, uint6=
4_t value,
     }
     return par64;
 }
+#endif /* CONFIG_TCG */
=20
 static void ats_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t v=
alue)
 {
+#ifdef CONFIG_TCG
     MMUAccessType access_type =3D ri->opc2 & 1 ? MMU_DATA_STORE : MMU_DATA=
_LOAD;
     uint64_t par64;
     ARMMMUIdx mmu_idx;
@@ -3664,17 +3667,26 @@ static void ats_write(CPUARMState *env, const ARMCP=
RegInfo *ri, uint64_t value)
     par64 =3D do_ats_write(env, value, access_type, mmu_idx);
=20
     A32_BANKED_CURRENT_REG_SET(env, par, par64);
+#else
+    /* Handled by hardware accelerator. */
+    g_assert_not_reached();
+#endif /* CONFIG_TCG */
 }
=20
 static void ats1h_write(CPUARMState *env, const ARMCPRegInfo *ri,
                         uint64_t value)
 {
+#ifdef CONFIG_TCG
     MMUAccessType access_type =3D ri->opc2 & 1 ? MMU_DATA_STORE : MMU_DATA=
_LOAD;
     uint64_t par64;
=20
     par64 =3D do_ats_write(env, value, access_type, ARMMMUIdx_E2);
=20
     A32_BANKED_CURRENT_REG_SET(env, par, par64);
+#else
+    /* Handled by hardware accelerator. */
+    g_assert_not_reached();
+#endif /* CONFIG_TCG */
 }
=20
 static CPAccessResult at_s1e2_access(CPUARMState *env, const ARMCPRegInfo =
*ri,
@@ -3689,6 +3701,7 @@ static CPAccessResult at_s1e2_access(CPUARMState *env=
, const ARMCPRegInfo *ri,
 static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
                         uint64_t value)
 {
+#ifdef CONFIG_TCG
     MMUAccessType access_type =3D ri->opc2 & 1 ? MMU_DATA_STORE : MMU_DATA=
_LOAD;
     ARMMMUIdx mmu_idx;
     int secure =3D arm_is_secure_below_el3(env);
@@ -3728,6 +3741,10 @@ static void ats_write64(CPUARMState *env, const ARMC=
PRegInfo *ri,
     }
=20
     env->cp15.par_el[1] =3D do_ats_write(env, value, access_type, mmu_idx)=
;
+#else
+    /* Handled by hardware accelerator. */
+    g_assert_not_reached();
+#endif /* CONFIG_TCG */
 }
 #endif
=20
--=20
2.21.1

