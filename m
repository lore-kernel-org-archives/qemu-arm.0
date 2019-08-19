Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3188790wrs;
        Mon, 19 Aug 2019 15:03:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzgEFkY5zfddwd8FrIjiuDAiUvr2lWH7vLvwSJcVyNTBmWGbWN7xCm5T4a4z31o7Vyl5sCj
X-Received: by 2002:a50:fc8c:: with SMTP id f12mr27913338edq.191.1566252202193;
        Mon, 19 Aug 2019 15:03:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566252202; cv=none;
        d=google.com; s=arc-20160816;
        b=XH2N1b4NDtT/CsdKgXqAlMMqpC6pGx5jNHaA3HKLfSzVs1fvjyT6uUn4Jaz0+k4QbU
         wB3sFKtWxiNshid7+PX1z7QLLBQCFUd5PMX7zd04KGUkI9EZPm3L/s03uhsLnrgBUbz4
         LeHX0jkPRj7SLD/tPGUUPfqf8VptcB8d0QD9kDiLUWxv8cxe9FfnRLugLGXfxY4kkJ2W
         ljq2y7sFIPc8zLswdiN7SUZc0nqR/FhmHWq+YarLQgavi93sRxVo4iIzMYMY/jkjPqiu
         TJjcGMbupoy41F2svyZGKwi8xaG0qASNUxew34b+NAf7fxY3a/LYHd1JZUYHOAqRl0WO
         8e6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=wLniY7IH5XOVstT1ZURU/Pqp4JvYW6tk9V3WWoNomaw=;
        b=LvNBDxvbLYUpxKE17K597YN6txXnxVkkxvBBhIDhDryrBzmuhWKuBsi3ZdQiCkoQc4
         FpQ/omyhhNHX560l0h3BbvkNh6r2GYC2g8qRLifmUtsNfGUG08KVel46ND5MKW6yooc/
         kXtNdcmSG22iktDlAImIRdTINOcpCebmDkKPFpRTTJgfVVXr6TPXcJ9aSQNUW59p68YL
         Wt2g+NXptEZjlTZ1IOqXOTmcTx2Df5wCs4nYUfFWpLqdq4CrtLpRnr2DTIKlw7lGFpoE
         T3D4qFTHyAteD0xz1vROMPr7SZKsDfRVKJDpeAk79nh4VvfCAq6NA9Ogs2YIDpjJfQFq
         BTgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Fzr8/0vm";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f9si7439000eja.7.2019.08.19.15.03.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 15:03:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Fzr8/0vm";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59431 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzpkG-0000pT-R6
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 18:03:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59476)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMX-0002Np-C8
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMV-0006W8-6m
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:49 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:46045)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzpMV-0006Vf-0c
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:47 -0400
Received: by mail-pg1-x544.google.com with SMTP id o13so1921058pgp.12
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2019 14:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=wLniY7IH5XOVstT1ZURU/Pqp4JvYW6tk9V3WWoNomaw=;
 b=Fzr8/0vmfS6tSszW7ZllixzfRjddneCkY3yTW+m9YASnALE0+/I7xJV/rXV2NlepPR
 l7fvYZFPWDJL4lkV5FoRQLS2oyKNOCjBasxe7Hy6SFdbHARbFNwLcaGGdqyyz0tPi3a8
 cG5BPLHtvUaf9yk6KZgXd7IWYlPTbyuXchEl0ZaMsxJpDU6rjB1cKu79L0ZCv49UG5dt
 MhasRf1cTv4f3KH2ZUvuF6HuvbZHRgrKqfTxu9533K1jNkvSMtnqF7jO6Ky2mWlkh8o/
 eTdvgsbPzhgo2hX1QvhOE5VDz0vzv/HbIczzBC90C4q1HZyhPqLphzwnEqY82AgH015a
 rTrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=wLniY7IH5XOVstT1ZURU/Pqp4JvYW6tk9V3WWoNomaw=;
 b=rlHa0Mr/uoUZC5OCWjABPGazWG622uz4mbzfcEkqFtMyRgDzah+9u2XBlkyVa1KZCf
 LPwYf3OuMzFvmEE1GpIapUXGzSGykF8mlmwnPtttjvn+FiLmfSL9fpvbo1VlrBF5wemF
 mjiDYQJtSiS8osbEnVWGVINdV3WwQC4dGnop2AOrG3tCOfdqGqq3Y3xapEOaSKdJCiAt
 o8wliaVGq7QLZfb/U8jJVvVQzmosclsrMcadNnzEHKcJxnCDfKZHxQW56HP7MHSikvbG
 5AcbUANB3Q0o2io0e58dYF+Myez6202RM3HjvT04ffPNEUDEp+cUVoCBqrIPn5qlHBvj
 srVw==
X-Gm-Message-State: APjAAAVcCe0roaS/mhcq0520KEW646C9NuJKfn/ehkWOIKLswWClrjd5
 kWSS/QUDSEidWYJeiNwgAKNsHniXBjM=
X-Received: by 2002:a62:2603:: with SMTP id m3mr27356125pfm.163.1566250726092; 
 Mon, 19 Aug 2019 14:38:46 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d2sm13446951pjs.21.2019.08.19.14.38.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 14:38:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 14:37:27 -0700
Message-Id: <20190819213755.26175-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819213755.26175-1-richard.henderson@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: [Qemu-arm] [PATCH v2 40/68] target/arm: Convert SG
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UHK0w10MU6g8

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 51 ++++++++++++++++++++++++------------------
 target/arm/t32.decode  |  5 ++++-
 2 files changed, 33 insertions(+), 23 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 7c05e7006e..9a8864e8ff 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8426,6 +8426,34 @@ static bool trans_SMC(DisasContext *s, arg_SMC *a)
     return true;
 }
 
+static bool trans_SG(DisasContext *s, arg_SG *a)
+{
+    if (!arm_dc_feature(s, ARM_FEATURE_M) ||
+        !arm_dc_feature(s, ARM_FEATURE_V8)) {
+        return false;
+    }
+    /*
+     * SG (v8M only)
+     * The bulk of the behaviour for this instruction is implemented
+     * in v7m_handle_execute_nsc(), which deals with the insn when
+     * it is executed by a CPU in non-secure state from memory
+     * which is Secure & NonSecure-Callable.
+     * Here we only need to handle the remaining cases:
+     *  * in NS memory (including the "security extension not
+     *    implemented" case) : NOP
+     *  * in S memory but CPU already secure (clear IT bits)
+     * We know that the attribute for the memory this insn is
+     * in must match the current CPU state, because otherwise
+     * get_phys_addr_pmsav8 would have generated an exception.
+     */
+    if (s->v8m_secure) {
+        /* Like the IT insn, we don't need to generate any code */
+        s->condexec_cond = 0;
+        s->condexec_mask = 0;
+    }
+    return true;
+}
+
 /*
  * Load/store register index
  */
@@ -10437,28 +10465,7 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
              * - load/store doubleword, load/store exclusive, ldacq/strel,
              *   table branch, TT.
              */
-            if (insn == 0xe97fe97f && arm_dc_feature(s, ARM_FEATURE_M) &&
-                arm_dc_feature(s, ARM_FEATURE_V8)) {
-                /* 0b1110_1001_0111_1111_1110_1001_0111_111
-                 *  - SG (v8M only)
-                 * The bulk of the behaviour for this instruction is implemented
-                 * in v7m_handle_execute_nsc(), which deals with the insn when
-                 * it is executed by a CPU in non-secure state from memory
-                 * which is Secure & NonSecure-Callable.
-                 * Here we only need to handle the remaining cases:
-                 *  * in NS memory (including the "security extension not
-                 *    implemented" case) : NOP
-                 *  * in S memory but CPU already secure (clear IT bits)
-                 * We know that the attribute for the memory this insn is
-                 * in must match the current CPU state, because otherwise
-                 * get_phys_addr_pmsav8 would have generated an exception.
-                 */
-                if (s->v8m_secure) {
-                    /* Like the IT insn, we don't need to generate any code */
-                    s->condexec_cond = 0;
-                    s->condexec_mask = 0;
-                }
-            } else if (insn & 0x01200000) {
+            if (insn & 0x01200000) {
                 /* load/store dual, in decodetree */
                 goto illegal_op;
             } else if ((insn & (1 << 23)) == 0) {
diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index 0cc0808c05..ce46650446 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -485,7 +485,10 @@ STRD_ri_t32      1110 1001 .100 .... .... .... ........    @ldstd_ri8 w=0 p=1
 LDRD_ri_t32      1110 1001 .101 .... .... .... ........    @ldstd_ri8 w=0 p=1
 
 STRD_ri_t32      1110 1001 .110 .... .... .... ........    @ldstd_ri8 w=1 p=1
-LDRD_ri_t32      1110 1001 .111 .... .... .... ........    @ldstd_ri8 w=1 p=1
+{
+  SG             1110 1001 0111 1111 1110 1001 01111111
+  LDRD_ri_t32    1110 1001 .111 .... .... .... ........    @ldstd_ri8 w=1 p=1
+}
 
 # Load/Store Exclusive, Load-Acquire/Store-Release, and Table Branch
 
-- 
2.17.1

