Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp5575959wrp;
        Tue, 10 Sep 2019 07:52:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx+jRZORGOdXHDctxBCkixE/yeKHVL8JhQMFv6eilIRNLQYhDnchqgMz95YcKs7f8XSIsEO
X-Received: by 2002:a50:de08:: with SMTP id z8mr30928542edk.121.1568127136271;
        Tue, 10 Sep 2019 07:52:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568127136; cv=none;
        d=google.com; s=arc-20160816;
        b=nsc3amxSPB93kBnRafUy7SnrmCQtn5KzPwWum/D+vBYsM2tuVrnzPTBOMpUe48FCgh
         Hd604mqB4BIhI2Dj2AlMxXiNOtlezwj3RpQ7vy6eTnH+ARFMwk1M3T1OLqRYqN0PPYvf
         f0D8ej5QmFTsGI+z7Ld1AVlYKR9tNI753MxH1OQ8Xj9N1JakF02ZdK8D0C1Gh58ah5mV
         A1eWySzU1lWiOmjsx2knhO6mR3W589hJlwb2chlPEXhlv1CY9oyuARHbP+uTP8D6Tzbk
         bdLREpHqiNGLNwGmHcfN4tUdoLqlsTeht35TOBxMZ+joJmGwCK77Ebh7NuMXdZDegARG
         OXdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=sq8nSzuTSE3z6TeW22Jb/p8ysGSeKIUIld6DHEj34Ck=;
        b=NhOHBrXan+b2esL9FcPU6sqfxrzJH87ZxQE2ce342FUwI8piNE9Bf2g2QPCa0TuJMe
         4dxT/aIMgsjl7Vyt7vlviaSgB8Ywap+fhRR4dsxYEH2o6AbPNDteDEqrnIRLON9B6kIj
         vReNEJxof6GajtK+VSyR34D+H+OkaujbAHvkGQvQHwg5nNItK67pHZ7ipbwEM7rvKXS3
         Qwv3D1pV5r9KihImK0KpDeATjmMyDf1ir3i8QVuAH2VeZqXG4VkrckWReA173bxgUqzY
         P5E9BAzkTMAKeunD378q/xD/TzogiCP5ku7BRVh3xgtcIIj5YvuaEX2a3U1eGoueDlq3
         hhcw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vJRR4zhM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a30si11691949eda.39.2019.09.10.07.52.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Sep 2019 07:52:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vJRR4zhM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i7hV9-00047N-3d
	for alex.bennee@linaro.org; Tue, 10 Sep 2019 10:52:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54131)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i7hNs-0005Zr-U9
 for qemu-arm@nongnu.org; Tue, 10 Sep 2019 10:44:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i7hNr-00054v-NG
 for qemu-arm@nongnu.org; Tue, 10 Sep 2019 10:44:44 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:39187)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i7hNr-00054C-H9
 for qemu-arm@nongnu.org; Tue, 10 Sep 2019 10:44:43 -0400
Received: by mail-wr1-x444.google.com with SMTP id t16so20833122wra.6
 for <qemu-arm@nongnu.org>; Tue, 10 Sep 2019 07:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=sq8nSzuTSE3z6TeW22Jb/p8ysGSeKIUIld6DHEj34Ck=;
 b=vJRR4zhMarIJwOEag+GQp1yXeXT+q/UXt9Xtub70Zzd0iBgHFR+zDca6QkL3KyQrFF
 d6jtVtMtoVx0jQhhcNC7jmNK1/5GDty5Rk1Lbt04v/3Qg9d7SNU0govHcBdLEL1mawnW
 /jEdgOl/Fjh/WQ2YyxW8Wvuaus0ak96VghwQvvTVFYD0UUNfdvhFogYqvnXL9ydFz3Dw
 MHnuvpPut6aHKKU7jvwQEn7vihCg15FIrLr4OVkNUkQcAjgy9uMDn877ZPCHsiyOJ9FA
 0U8/NfbaYmKxarb753GB18++ClK8tHper8pHlhsqg8dPa7hCksO/HE/LdgodaFfjNWjB
 8Bqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sq8nSzuTSE3z6TeW22Jb/p8ysGSeKIUIld6DHEj34Ck=;
 b=ng+tD9pKWV4LMNXOBa/rCf8I5vAl0Dpuzuw+KkJN3Cvsrb/kzOm1H/Ucyq3gtV/ITa
 yEx6N2gvbead/KgjdqJUNezBqDOOY0mT6/JXhHMxHjyczg5yZ48wrHvLZCA+skgFTO5V
 SK4T0D+ofCv1OF2RHRePPH1UV/UCc4SkI8vwRhzRs0aQKUpFYojzyQ8vnlg4+EvSue3J
 YirrwwE2vzDBLMdFWVO7eOGyjcUL5KbWaF5ScEoDQ1o9bGu+bNPawQB4aJtlEIO9I2V0
 grbxgUxkEALMCSXETeI4q+rswNFcQRU6obEysO0jbtVE2cUUG9NT2Qikgvx3UrQLiTlt
 X9RQ==
X-Gm-Message-State: APjAAAXaVrI6nrGDvTGtY/hENdcHEG9G0MsPyn2tybHZ25FW9cVOyEuI
 pxgJOfYIv68XJ5C17AImsFfjRqsTRVwA8g==
X-Received: by 2002:adf:f812:: with SMTP id s18mr28610093wrp.32.1568126682426; 
 Tue, 10 Sep 2019 07:44:42 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a192sm5703814wma.1.2019.09.10.07.44.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2019 07:44:41 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 10 Sep 2019 15:44:25 +0100
Message-Id: <20190910144428.32597-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190910144428.32597-1-peter.maydell@linaro.org>
References: <20190910144428.32597-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-arm] [PATCH 10/13] target/arm/arm-semi: Factor out
 implementation of SYS_FLEN
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5MzOi2cjj2eU

Factor out the implementation of SYS_FLEN via the new
function tables.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/arm-semi.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
index c548ce849e7..f9019b00b8d 100644
--- a/target/arm/arm-semi.c
+++ b/target/arm/arm-semi.c
@@ -352,6 +352,7 @@ typedef uint32_t sys_readfn(TaskState *ts, ARMCPU *cpu, GuestFD *gf,
 typedef uint32_t sys_isattyfn(TaskState *ts, ARMCPU *cpu, GuestFD *gf);
 typedef uint32_t sys_seekfn(TaskState *ts, ARMCPU *cpu, GuestFD *gf,
                             target_ulong offset);
+typedef uint32_t sys_flenfn(TaskState *ts, ARMCPU *cpu, GuestFD *gf);
 
 static uint32_t host_closefn(TaskState *ts, ARMCPU *cpu, GuestFD *gf)
 {
@@ -417,6 +418,16 @@ static uint32_t host_seekfn(TaskState *ts, ARMCPU *cpu, GuestFD *gf,
     return 0;
 }
 
+static uint32_t host_flenfn(TaskState *ts, ARMCPU *cpu, GuestFD *gf)
+{
+    struct stat buf;
+    uint32_t ret = set_swi_errno(ts, fstat(gf->hostfd, &buf));
+    if (ret == (uint32_t)-1) {
+        return -1;
+    }
+    return buf.st_size;
+}
+
 static uint32_t gdb_closefn(TaskState *ts, ARMCPU *cpu, GuestFD *gf)
 {
     return arm_gdb_syscall(cpu, arm_semi_cb, "close,%x", gf->hostfd);
@@ -450,12 +461,19 @@ static uint32_t gdb_seekfn(TaskState *ts, ARMCPU *cpu, GuestFD *gf,
                            gf->hostfd, offset);
 }
 
+static uint32_t gdb_flenfn(TaskState *ts, ARMCPU *cpu, GuestFD *gf)
+{
+    return arm_gdb_syscall(cpu, arm_semi_flen_cb, "fstat,%x,%x",
+                           gf->hostfd, arm_flen_buf(cpu));
+}
+
 typedef struct GuestFDFunctions {
     sys_closefn *closefn;
     sys_writefn *writefn;
     sys_readfn *readfn;
     sys_isattyfn *isattyfn;
     sys_seekfn *seekfn;
+    sys_flenfn *flenfn;
 } GuestFDFunctions;
 
 static const GuestFDFunctions guestfd_fns[] = {
@@ -465,6 +483,7 @@ static const GuestFDFunctions guestfd_fns[] = {
         .readfn = host_readfn,
         .isattyfn = host_isattyfn,
         .seekfn = host_seekfn,
+        .flenfn = host_flenfn,
     },
     [GuestFDGDB] = {
         .closefn = gdb_closefn,
@@ -472,6 +491,7 @@ static const GuestFDFunctions guestfd_fns[] = {
         .readfn = gdb_readfn,
         .isattyfn = gdb_isattyfn,
         .seekfn = gdb_seekfn,
+        .flenfn = gdb_flenfn,
     },
 };
 
@@ -657,16 +677,7 @@ target_ulong do_arm_semihosting(CPUARMState *env)
             return set_swi_errno(ts, -1);
         }
 
-        if (use_gdb_syscalls()) {
-            return arm_gdb_syscall(cpu, arm_semi_flen_cb, "fstat,%x,%x",
-                                   gf->hostfd, arm_flen_buf(cpu));
-        } else {
-            struct stat buf;
-            ret = set_swi_errno(ts, fstat(gf->hostfd, &buf));
-            if (ret == (uint32_t)-1)
-                return -1;
-            return buf.st_size;
-        }
+        return guestfd_fns[gf->type].flenfn(ts, cpu, gf);
     case TARGET_SYS_TMPNAM:
         qemu_log_mask(LOG_UNIMP, "%s: SYS_TMPNAM not implemented", __func__);
         return -1;
-- 
2.20.1

