Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp761407wrs;
        Thu, 22 Aug 2019 06:15:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxF15TZgjPGvL/62P7VG72w9Hobzymntxal/YZ/NYnRjKUHdU63O39QjZiGLhQ70/Fq1976
X-Received: by 2002:ac8:1419:: with SMTP id k25mr19960346qtj.339.1566479755008;
        Thu, 22 Aug 2019 06:15:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566479755; cv=none;
        d=google.com; s=arc-20160816;
        b=RxmAKzzbMCAppDKfEal5py+W2OJ+uJOTIVZgRHSAsGM9f4QvhC04YWTDRjPJOLczkR
         WBfR+aeZa1+vne4TeYMF22Dy9OPqvre7RcWbm1Pav2AEsU1VNn0NdXVTssqrlSpBVBHm
         nBn3UVLGIRrT6SKAkeRAR/rvYSIq3ED36YjuTaTALQHNAqHV7P2m46zESDmV6vqM+4ue
         Xecb40O96JzMOvXPL+mhR75rwkjSCIizVMbTOwtDa0/v1g49PrAMe6/eXwVQ+pvoA25/
         nzevMHwZ+LeubSPD5mUmmrmU6utMbD9K3xr6MpoBC5yC+EI9GTpmECP1kI4zz3yZ3HXV
         6D4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=V2nv/Uxsp/eRjcm2yZv9NXMn6rt7OMPnJeNLZd1Dp3Y=;
        b=0t0Z9tfVoREtvvOx82Js3qc0DJweU2ekRZxUvPHfDGY/t0iT8FXdyef7vd3vwc0dt7
         XCAU9Krp0uAlWBLo5Dhu59no56U2MArIMkw0WKKS/RE/NmdbZP0qXxLIlQtoI3fHZLqk
         vjHCIZA4xh4oVU4gufHWsDnDmwKkgK63gjji30aYIZc5OInlVvvBYjSTGxt6049nuLpo
         FSWJhO5H5YMMElywVLYgv9uuGKrdj+qNwkqXhI7YbKYTDriCp+bAzarufwOa1uhVJl+5
         DBXYOBzx5GkfVILDZ5O4JYEvwEw3H6MkLVN8mehEkKFUrlGtWd6i5DAWoQUD5Rb6Syeu
         4NkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Obskk4O9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f44si14698557qtk.148.2019.08.22.06.15.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Aug 2019 06:15:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Obskk4O9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i0mwU-00053J-9e
	for alex.bennee@linaro.org; Thu, 22 Aug 2019 09:15:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34961)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i0mwH-00052c-16
 for qemu-arm@nongnu.org; Thu, 22 Aug 2019 09:15:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i0mwF-0007ir-4N
 for qemu-arm@nongnu.org; Thu, 22 Aug 2019 09:15:40 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:51804)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i0mwE-0007i3-SK
 for qemu-arm@nongnu.org; Thu, 22 Aug 2019 09:15:39 -0400
Received: by mail-wm1-x344.google.com with SMTP id k1so5612533wmi.1
 for <qemu-arm@nongnu.org>; Thu, 22 Aug 2019 06:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V2nv/Uxsp/eRjcm2yZv9NXMn6rt7OMPnJeNLZd1Dp3Y=;
 b=Obskk4O93IojLMpFd7xriHxXntHqP0lpIV2N020nuuSVcptX8Va7IbYfuCoFEX01KW
 FZBDK+9X/F0O4sglPOLQhSEpH9yzKpBJR0gUCXO8+2gu/ZrTKTCZgXbxAFtDZl70b7ek
 UUpNPobf4Mkd3b8oMTG423OeFlx/y/wMJbQzieYoHyt2P2EuSt9OQw8wdBsh/JgOsUYR
 rhXGE92CRbfePHfKV71KmcCkcL6Kkmlf9vH9Z/ikqpYqkaE61Bh/0KcUHAajQBCCTT6h
 6neTkMiP9JG0AN7aVmXQACwa5eHm90v3995zfTvs3gEZv3EV5Li8j6xCARXwUTF1ZlRP
 oH1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V2nv/Uxsp/eRjcm2yZv9NXMn6rt7OMPnJeNLZd1Dp3Y=;
 b=s2uB2Ma/mK/K/kjJu7E8+yKhISKbcj/Q7myjkaiiCWok3wU3OCuHKamhKGjslFVX8g
 aK5lBM4sb7upwCcGLMRU5nT3+EXU+u+haQT0NPp9z9um9leYUNPtFYAHaJfpJ/Q8CDWK
 Qmsd5T/CPTOvn7BDGDQbB4JGwxOBO3PBqGTYWXZxFv2szaAl7tc0A1bcXd/cZmC4Mlsp
 rt42epfOi7DT9Wq+HrA/E3lDq5uWqh5yj1SprlsjUK52zFewhatKLEXDx9rdnBmdKEj6
 UlPCm0OYRtK1oLTsapVW92xZcTeVUCimHnqjZ+V9QU+qfcbMWnOH9BMxWjqK5Bk9mrCf
 FXyQ==
X-Gm-Message-State: APjAAAUu8kCyglKofDGhZiFgWw3EyEpEdwD4ZcZzPYNYIRgJkgj/dABp
 0DFhXz1yHMBTInDrD24oA6MilY99XKJRnw==
X-Received: by 2002:a1c:ca09:: with SMTP id a9mr6189818wmg.43.1566479736729;
 Thu, 22 Aug 2019 06:15:36 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p13sm30785512wrw.90.2019.08.22.06.15.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2019 06:15:36 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 22 Aug 2019 14:15:34 +0100
Message-Id: <20190822131534.16602-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: [Qemu-arm] [PATCH] target/arm: Don't abort on M-profile exception
 return in linux-user mode
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
Cc: Christophe Lyon <christophe.lyon@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PLMGVKkRGN7x

An attempt to do an exception-return (branch to one of the magic
addresses) in linux-user mode for M-profile should behave like
a normal branch, because linux-user mode is always going to be
in 'handler' mode. This used to work, but we broke it when we added
support for the M-profile security extension in commit d02a8698d7ae2bfed.

In that commit we allowed even handler-mode calls to magic return
values to be checked for and dealt with by causing an
EXCP_EXCEPTION_EXIT exception to be taken, because this is
needed for the FNC_RETURN return-from-non-secure-function-call
handling. For system mode we added a check in do_v7m_exception_exit()
to make any spurious calls from Handler mode behave correctly, but
forgot that linux-user mode would also be affected.

How an attempted return-from-non-secure-function-call in linux-user
mode should be handled is not clear -- on real hardware it would
result in return to secure code (not to the Linux kernel) which
could then handle the error in any way it chose. For QEMU we take
the simple approach of treating this erroneous return the same way
it would be handled on a CPU without the security extensions --
treat it as a normal branch.

The upshot of all this is that for linux-user mode we should never
do any of the bx_excret magic, so the code change is simple.

This ought to be a weird corner case that only affects broken guest
code (because Linux user processes should never be attempting to do
exception returns or NS function returns), except that the code that
assigns addresses in RAM for the process and stack in our linux-user
code does not attempt to avoid this magic address range, so
legitimate code attempting to return to a trampoline routine on the
stack can fall into this case. This change fixes those programs,
but we should also look at restricting the range of memory we
use for M-profile linux-user guests to the area that would be
real RAM in hardware.

Cc: qemu-stable@nongnu.org
Reported-by: Christophe Lyon <christophe.lyon@linaro.org>
Fixes: https://bugs.launchpad.net/qemu/+bug/1840922
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I have no idea how we could achieve the "restrict addresses
shown to guest for linux-user" mentioned in the last para:
any suggestions?
---
 target/arm/translate.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index cbe19b7a625..98e7105ecd2 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -915,10 +915,27 @@ static inline void gen_bx(DisasContext *s, TCGv_i32 var)
     store_cpu_field(var, thumb);
 }
 
-/* Set PC and Thumb state from var. var is marked as dead.
+/*
+ * Set PC and Thumb state from var. var is marked as dead.
  * For M-profile CPUs, include logic to detect exception-return
  * branches and handle them. This is needed for Thumb POP/LDM to PC, LDR to PC,
  * and BX reg, and no others, and happens only for code in Handler mode.
+ * The Security Extension also requires us to check for the FNC_RETURN
+ * which signals a function return from non-secure state; this can happen
+ * in both Handler and Thread mode.
+ * To avoid having to do multiple comparisons in inline generated code,
+ * we make the check we do here loose, so it will match for EXC_RETURN
+ * in Thread mode. For system emulation do_v7m_exception_exit() checks
+ * for these spurious cases and returns without doing anything (giving
+ * the same behaviour as for a branch to a non-magic address).
+ *
+ * In linux-user mode it is unclear what the right behaviour for an
+ * attempted FNC_RETURN should be, because in real hardware this will go
+ * directly to Secure code (ie not the Linux kernel) which will then treat
+ * the error in any way it chooses. For QEMU we opt to make the FNC_RETURN
+ * attempt behave the way it would on a CPU without the security extension,
+ * which is to say "like a normal branch". That means we can simply treat
+ * all branches as normal with no magic address behaviour.
  */
 static inline void gen_bx_excret(DisasContext *s, TCGv_i32 var)
 {
@@ -926,10 +943,12 @@ static inline void gen_bx_excret(DisasContext *s, TCGv_i32 var)
      * s->base.is_jmp that we need to do the rest of the work later.
      */
     gen_bx(s, var);
+#ifndef CONFIG_USER_ONLY
     if (arm_dc_feature(s, ARM_FEATURE_M_SECURITY) ||
         (s->v7m_handler_mode && arm_dc_feature(s, ARM_FEATURE_M))) {
         s->base.is_jmp = DISAS_BX_EXCRET;
     }
+#endif
 }
 
 static inline void gen_bx_excret_final_code(DisasContext *s)
-- 
2.20.1

