Received: by 10.25.159.19 with SMTP id i19csp1754745lfe;
        Sun, 17 Jan 2016 23:15:50 -0800 (PST)
X-Received: by 10.140.108.8 with SMTP id i8mr29654367qgf.83.1453101349976;
        Sun, 17 Jan 2016 23:15:49 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o38si29603782qge.95.2016.01.17.23.15.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 17 Jan 2016 23:15:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58005 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aL42X-0007on-Bp
	for alex.bennee@linaro.org; Mon, 18 Jan 2016 02:15:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42562)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aL3zv-0003Gt-5j
	for qemu-devel@nongnu.org; Mon, 18 Jan 2016 02:13:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aL3zu-00075w-5D
	for qemu-devel@nongnu.org; Mon, 18 Jan 2016 02:13:07 -0500
Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d]:34594)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aL3zt-00075c-Sd; Mon, 18 Jan 2016 02:13:06 -0500
Received: by mail-pa0-x22d.google.com with SMTP id uo6so415136428pac.1;
	Sun, 17 Jan 2016 23:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=DuUKhiPMRPtZzgP92rKzKYoaDBQ66S3mGqthNdSSzPU=;
	b=hgmffcT9RaZhVXCKGBvORYnDFx1g0HlKqS4fOKa28i4sY9e1QX87691OV417zlXBoc
	fBgkECaQoOwoboeafY0j0OKFc0RIquA/vLmCmURU6bNyK28LK/QW6G1j0GVFWHZhIMP2
	Gaaq542VjAJUSNNTm+L1FuPEeKB0GJ3SaLEQ70+4ogF+yp8pP7BnG7kEA54bks0qUUdG
	RYoYSuaR+1WM/DDr5luFATIJFnJcq60ZMV7At+f0kjR7/G9cAeJCHylT0zAGEPYAs9M2
	Ck2TNApDPMAMLVrHaMTqeLKQdo1d3jBanB7EbsCIdLJTwToGTBRdcuzRxERLmu1euWcx
	UnKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=DuUKhiPMRPtZzgP92rKzKYoaDBQ66S3mGqthNdSSzPU=;
	b=aMnwnRhAaZPqXYlHzF3JDje363aJInXQ0kgPsmJXBSy/ZIMjDdEn2EWt1vyg8i1ykn
	jBW+xahiirOXwOX3oCgCXgzrZi79MqC6lKXlPsLDtS//VJkKJ9ZqUxF/GmLb/4h0BwXr
	9f9Qc7dckWsBkOwAuZECWIWFgNM8bu2PY6RnFofkjUzk5uoH6CQ010RHAwDPwfwzeZPR
	iCdM03OREnUYknzlVb6iG8ESbI4C7eEIFFeHu7hVm5CR0nPaO/WZHZeyc05Uy5CnMwZA
	w1rfUVlKMCfq7d1ekhMAFv32Mls44gwX9ia8sNFlEqtFq8F8p+Vaygwm8MzNGdQJQnpA
	vfVg==
X-Gm-Message-State: ALoCoQkO9sfbYk+m4WaKOGiAv+tUDeHPa1E+CuXGMTNZlbvkUQut36ClimrpQNRm2Ka2DH7OhRxuAyRFj4Gmw0bch9Dj49l5Sw==
X-Received: by 10.67.6.67 with SMTP id cs3mr34641273pad.143.1453101185419;
	Sun, 17 Jan 2016 23:13:05 -0800 (PST)
Received: from localhost.localdomain (c-73-70-184-119.hsd1.ca.comcast.net.
	[73.70.184.119]) by smtp.gmail.com with ESMTPSA id
	xv2sm31471880pab.10.2016.01.17.23.13.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 23:13:04 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 17 Jan 2016 23:12:37 -0800
Message-Id: <2e141a5f2a5c38936bdf1a06eaeb1a5595f0f833.1453100525.git.crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453100525.git.crosthwaite.peter@gmail.com>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
In-Reply-To: <cover.1453100525.git.crosthwaite.peter@gmail.com>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::22d
Cc: peter.maydell@linaro.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	alistair.francis@xilinx.com, sridhar_kulk@yahoo.com,
	qemu-arm@nongnu.org, pbonzini@redhat.com, piotr.krol@3mdeb.com
Subject: [Qemu-devel] [PATCH v1 10/17] target-arm: implement setend
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: LuOi+treyyCP

From: Paolo Bonzini <pbonzini@redhat.com>

Since this is not a high-performance path, just use a helper to
flip the E bit and force a lookup in the hash table since the
flags have changed.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---

 target-arm/helper.h    |  1 +
 target-arm/op_helper.c |  5 +++++
 target-arm/translate.c | 16 ++++++++--------
 3 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/target-arm/helper.h b/target-arm/helper.h
index c2a85c7..2315a9c 100644
--- a/target-arm/helper.h
+++ b/target-arm/helper.h
@@ -48,6 +48,7 @@ DEF_HELPER_FLAGS_3(sel_flags, TCG_CALL_NO_RWG_SE,
                    i32, i32, i32, i32)
 DEF_HELPER_2(exception_internal, void, env, i32)
 DEF_HELPER_4(exception_with_syndrome, void, env, i32, i32, i32)
+DEF_HELPER_1(setend, void, env)
 DEF_HELPER_1(wfi, void, env)
 DEF_HELPER_1(wfe, void, env)
 DEF_HELPER_1(yield, void, env)
diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
index e42d287..2a4bc67 100644
--- a/target-arm/op_helper.c
+++ b/target-arm/op_helper.c
@@ -295,6 +295,11 @@ uint32_t HELPER(usat16)(CPUARMState *env, uint32_t x, uint32_t shift)
     return res;
 }
 
+void HELPER(setend)(CPUARMState *env)
+{
+    env->uncached_cpsr ^= CPSR_E;
+}
+
 /* Function checks whether WFx (WFI/WFE) instructions are set up to be trapped.
  * The function returns the target EL (1-3) if the instruction is to be trapped;
  * otherwise it returns 0 indicating it is not trapped.
diff --git a/target-arm/translate.c b/target-arm/translate.c
index cb925ef..192a5d6 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -7726,10 +7726,10 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
         if ((insn & 0x0ffffdff) == 0x01010000) {
             ARCH(6);
             /* setend */
-            if (((insn >> 9) & 1) != s->bswap_code) {
-                /* Dynamic endianness switching not implemented. */
-                qemu_log_mask(LOG_UNIMP, "arm: unimplemented setend\n");
-                goto illegal_op;
+            if (((insn >> 9) & 1) != !!(s->mo_endianness == MO_BE)) {
+                gen_helper_setend(cpu_env);
+                gen_set_pc_im(s, s->pc);
+                s->is_jmp = DISAS_JUMP;
             }
             return;
         } else if ((insn & 0x0fffff00) == 0x057ff000) {
@@ -11064,10 +11064,10 @@ static void disas_thumb_insn(CPUARMState *env, DisasContext *s)
             case 2:
                 /* setend */
                 ARCH(6);
-                if (((insn >> 3) & 1) != s->bswap_code) {
-                    /* Dynamic endianness switching not implemented. */
-                    qemu_log_mask(LOG_UNIMP, "arm: unimplemented setend\n");
-                    goto illegal_op;
+                if (((insn >> 3) & 1) != !!(s->mo_endianness == MO_BE)) {
+                    gen_helper_setend(cpu_env);
+                    gen_set_pc_im(s, s->pc);
+                    s->is_jmp = DISAS_JUMP;
                 }
                 break;
             case 3:
-- 
1.9.1

