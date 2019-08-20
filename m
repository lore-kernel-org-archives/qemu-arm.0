Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1790wrs;
        Tue, 20 Aug 2019 14:20:43 -0700 (PDT)
X-Google-Smtp-Source: APXvYqys6m5O1NJ6GonmiwYRGSnDEQHNO4w9GwwwNbJuPcXDm6Umsw2sHPxql575BfvevQxb5Hv5
X-Received: by 2002:ac8:7b97:: with SMTP id p23mr28558229qtu.357.1566336043251;
        Tue, 20 Aug 2019 14:20:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566336043; cv=none;
        d=google.com; s=arc-20160816;
        b=m9r63kN0Cp7wl1jZk0NWGeyo+9k9Wxn7lT/GOamv2tzC8YssniSIOyICGoeMsosQzZ
         2zE95bYeHJnUaj11kzdyovQNk26G78Qtnga/JjJL/IYXGl5dJJhBw9pLSibTaL3hQiMb
         wp39t0DKQi6rBULpgRU5n7gFCvpYaCshhuCrqG9+IGdrpFR1/kfhQSQLuXQZtAPnQFMj
         Ojq2y4bze+Fbt3pHUuQfeFNflAKEBjH+F8jVn9x5pViFDtfYgdP4QrUvYUbFkQ5J8R+2
         6oKDhPa75OttH3WWC6DdBZI/lZrt88FirZz0EPwvGVkeEFtMc1RVIrmlo5FiE8nLzgu5
         q1Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=cAE3egBYYhx3Un5p/9eiXe7aY/AvfKY8XXQvwdeHeks=;
        b=0TL6hLJYN2H3b/bGnGrG9HBrQuBe7O56/+C2k4F+oYkvNJ0TLhkVkGUTA+ctbly4rB
         MkEdTPxM5uDlYPiJB1WUHiipKVt1/rLyDTAGa/TQPdRt/CzqotuZlQOl7tYS35Si4jLh
         9EWYtGNJIjxM5a5JJIzn0oxCOSYyvluGZpO524DFFIbIT38tK5LrmSvBoZckjaQk5BQc
         lwFsYIpxx+kMNLbfvXCbMLFjyt2wzmbM7jVo5o7/zAs+88CozXmiSuTrbMQ2QsWMaZs+
         VL9pE+s60Lfj53/CF9M6XFTQEGdfdsMIoAWS5LJdQZdOlG4qqKw9Qd3OkrzdnDr6Y4nx
         xB9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IMDWHWGk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s77si11110500qke.29.2019.08.20.14.20.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Aug 2019 14:20:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IMDWHWGk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i0BYY-00038l-B8
	for alex.bennee@linaro.org; Tue, 20 Aug 2019 17:20:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53872)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i0BLz-0000JH-UP
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 17:07:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i0BLy-00008u-Sn
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 17:07:43 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:39431)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i0BLx-0008U9-0f
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 17:07:42 -0400
Received: by mail-pg1-x542.google.com with SMTP id u17so13592pgi.6
 for <qemu-devel@nongnu.org>; Tue, 20 Aug 2019 14:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=cAE3egBYYhx3Un5p/9eiXe7aY/AvfKY8XXQvwdeHeks=;
 b=IMDWHWGkACnr3xshcVwyGWECtPIROaDZSeLtMBPd/2joZErI37Z+YX+nJzN2E6BnW2
 8KKu39ETpX71aPkEAbCpD33AS0UkhGSzmr3wJh+lIyRSDdvWnWWzvFdQF0+eqKSI02WV
 OqG/rjEUVbJP3Dd/C4E4l/931bmvxsZed7SHtwqWVTTLCz0OYz3AN0kUn7TSq57jFsH8
 zaK/ij2cq91GNzsAu5jKi5c0JTpYHRE7YI9iHbTAjgfsOHYeeZW4jmw6daIpk5BjkoK8
 IwuN9BcvL6wS7gUJCdWt7f/DZg0eTeMOpKnuJgZDOguBqLvkgHYh1/rruenfHExEuYEe
 N8qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=cAE3egBYYhx3Un5p/9eiXe7aY/AvfKY8XXQvwdeHeks=;
 b=UN51y8+5wHFHVtIrZ7RchjXDjFb1QD73LLkGRgEl49zZ6eycJqGR2N9lAr3/GOtZtZ
 XS1r2BIJCBaqLqOKGDtD6Yv6oeoETWrFIfQkIt/eWTqB4sSxKbrCdkdnXZ4qaVaX8uxl
 /6jgww8VihsuzdCJPBT9GEHVYL7fngZ7QJEKvJL6iYYVMnEQLNwjwlt/lSNArbWM+B0F
 1LE0OIgqMgoFoAGZ1r/lFm71x++Ri0Re7EVuFAFlqsKVodA3usrKswp7MkAS+n33i8+x
 PiRlgQ5qU0/alZ12k8q3UR96X39Yknkk48Ab4otLdxT/wljldExKAJgFRDiDDpP2OXtO
 UIWg==
X-Gm-Message-State: APjAAAV9bnN0isnkGZ+qq/M9KHTyy+OtrzSIuAJG321jO2j4LHTmlx/s
 cK/XGzgs6JrJw9Sb1oIXs0nzINu39VE=
X-Received: by 2002:a62:be04:: with SMTP id l4mr30995464pff.77.1566335255019; 
 Tue, 20 Aug 2019 14:07:35 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id k22sm21690743pfk.157.2019.08.20.14.07.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 14:07:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 20 Aug 2019 14:07:12 -0700
Message-Id: <20190820210720.18976-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190820210720.18976-1-richard.henderson@linaro.org>
References: <20190820210720.18976-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: [Qemu-devel] [PATCH v5 09/17] target/arm: Hoist XSCALE_CPAR, VECLEN,
 VECSTRIDE in cpu_get_tb_cpu_state
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7QdcxQtM/wMm

We do not need to compute any of these values for M-profile.
Further, XSCALE_CPAR overlaps VECSTRIDE so obviously the two
sets must be mutually exclusive.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index fc071f95db..3889b9295a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11197,21 +11197,28 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
             }
         } else {
             flags = rebuild_hflags_a32(env, fp_el, mmu_idx);
+
+            /*
+             * Note that XSCALE_CPAR shares bits with VECSTRIDE.
+             * Note that VECLEN+VECSTRIDE are RES0 for M-profile.
+             */
+            if (arm_feature(env, ARM_FEATURE_XSCALE)) {
+                flags = FIELD_DP32(flags, TBFLAG_A32,
+                                   XSCALE_CPAR, env->cp15.c15_cpar);
+            } else {
+                flags = FIELD_DP32(flags, TBFLAG_A32, VECLEN,
+                                   env->vfp.vec_len);
+                flags = FIELD_DP32(flags, TBFLAG_A32, VECSTRIDE,
+                                   env->vfp.vec_stride);
+            }
         }
 
         flags = FIELD_DP32(flags, TBFLAG_A32, THUMB, env->thumb);
-        flags = FIELD_DP32(flags, TBFLAG_A32, VECLEN, env->vfp.vec_len);
-        flags = FIELD_DP32(flags, TBFLAG_A32, VECSTRIDE, env->vfp.vec_stride);
         flags = FIELD_DP32(flags, TBFLAG_A32, CONDEXEC, env->condexec_bits);
         if (env->vfp.xregs[ARM_VFP_FPEXC] & (1 << 30)
             || arm_el_is_aa64(env, 1) || arm_feature(env, ARM_FEATURE_M)) {
             flags = FIELD_DP32(flags, TBFLAG_A32, VFPEN, 1);
         }
-        /* Note that XSCALE_CPAR shares bits with VECSTRIDE */
-        if (arm_feature(env, ARM_FEATURE_XSCALE)) {
-            flags = FIELD_DP32(flags, TBFLAG_A32,
-                               XSCALE_CPAR, env->cp15.c15_cpar);
-        }
     }
 
     /* The SS_ACTIVE and PSTATE_SS bits correspond to the state machine
-- 
2.17.1

