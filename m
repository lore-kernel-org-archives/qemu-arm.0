Received: by 10.80.163.71 with SMTP id 65csp137319edn;
        Fri, 30 Sep 2016 03:21:17 -0700 (PDT)
X-Received: by 10.200.47.3 with SMTP id j3mr5770538qta.27.1475230876928;
        Fri, 30 Sep 2016 03:21:16 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k71si2209984qkh.230.2016.09.30.03.21.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Sep 2016 03:21:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42988 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bpuwO-0000JY-C7
	for alex.bennee@linaro.org; Fri, 30 Sep 2016 06:21:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46259)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1bpuuz-00086O-VD
	for qemu-devel@nongnu.org; Fri, 30 Sep 2016 06:19:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1bpuut-0005gL-UG
	for qemu-devel@nongnu.org; Fri, 30 Sep 2016 06:19:48 -0400
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:34872)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1bpuut-0005g1-Nw; Fri, 30 Sep 2016 06:19:43 -0400
Received: by mail-wm0-x242.google.com with SMTP id b4so2765539wmb.2;
	Fri, 30 Sep 2016 03:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=7lQhawYVQPTfW/sakPwqETrmJjKr561y3U1RJpgbbAc=;
	b=KJMYo0nvbD44+L53fz5FuXLQ6k6D4JOQSaQzdLCHpstSVYtBI5BB6oQckqRT9K9yOl
	b0qptpR6Qz/dOHzTW/Dm0PpOb+45rSzAatc7JityjusAkswlpNubmCN1MYk0hl0rPYBJ
	Xk4GnKKMOUhq5VI+ZBvHIlb/W5Fi608Ndm4JhpIOpyzxXVr9paqM+qKgZUi3rknJ9/iO
	UOuwVF9qJavW3BL2A+HXghXAeGZPM/+w1bXGRsyr5TGal5JsRRZdDGfAGzflMKbYPTR+
	Fr4dJXor/s+R9xh8EqoSajuHH+3ETflvcQyhGRaZ7ekOJBn3DxIyVVhrgAGEwkkSninf
	0Pnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7lQhawYVQPTfW/sakPwqETrmJjKr561y3U1RJpgbbAc=;
	b=SFRh3s4wkhwilQioVIHeUZhHOQdpSJ4LGc9bXi17714Dg36WBQF/1Hs4AkxJVG+PgF
	ewwb9fBoqAoDtSgXP/Gno5J7MTPrJkGtDjayFu8uCvjpNRTmtCr1G90aDNxja+ME2HNf
	goq3TgSAecwoxbM4uhwg5+QAYVlmWgSxH3xeK2oE4yAzEE4WbRZzLWoXPXtSbfwwOju3
	tuKARiwIWHxtdARp6/mihliP2yfltAMFSsr3Z2pLODCarL5CwZ4D2OhvPetGxanY0mJ6
	1B63LYYJwz4j7SQcMe8V4EncrJXjWYZMbbNexnWqwgu1atmJ3deQtGuWXhbFKkuwgIoH
	S8nw==
X-Gm-Message-State: AA6/9RmB2bET9+c8uqfyuLTgIGB89+T+7TeMbNg86Pnz7YfymTiyALZsu21K2dO670IiOg==
X-Received: by 10.28.38.69 with SMTP id m66mr2883790wmm.133.1475230782654;
	Fri, 30 Sep 2016 03:19:42 -0700 (PDT)
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id p3sm214856wjr.31.2016.09.30.03.19.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Sep 2016 03:19:41 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Date: Fri, 30 Sep 2016 12:19:40 +0200
Message-Id: <1475230780-8669-1-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::242
Subject: [Qemu-devel] [PATCH v1 1/1] target-arm: A64: Fix decoding of iss_sf
 in disas_ld_lit
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: edgar.iglesias@xilinx.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Pp28EozT3A5I

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Fix the decoding of iss_sf in disas_ld_lit.
The SF (Sixty-Four) field in the ISS (Instruction Specific Syndrome)
is a bit that specifies the width of the register that the
instruction loads to.

If cleared it specifies 32 bits.
If set it specifies 64 bits.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 target-arm/translate-a64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
index ddf52f5..eae25c3 100644
--- a/target-arm/translate-a64.c
+++ b/target-arm/translate-a64.c
@@ -2025,7 +2025,7 @@ static void disas_ld_lit(DisasContext *s, uint32_t insn)
         do_fp_ld(s, rt, tcg_addr, size);
     } else {
         /* Only unsigned 32bit loads target 32bit registers.  */
-        bool iss_sf = opc == 0 ? 32 : 64;
+        bool iss_sf = opc == 0 ? false : true;
 
         do_gpr_ld(s, tcg_rt, tcg_addr, size, is_signed, false,
                   true, rt, iss_sf, false);
-- 
2.7.4

