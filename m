Received: by 10.182.158.201 with SMTP id ww9csp729884obb;
        Tue, 17 Nov 2015 05:42:47 -0800 (PST)
X-Received: by 10.31.47.88 with SMTP id v85mr3784416vkv.111.1447767767261;
        Tue, 17 Nov 2015 05:42:47 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h193si2727683vkh.151.2015.11.17.05.42.47
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Tue, 17 Nov 2015 05:42:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58489 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZygX0-0001cl-UH
	for alex.bennee@linaro.org; Tue, 17 Nov 2015 08:42:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56894)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1ZygUv-0000dE-Ta
	for qemu-devel@nongnu.org; Tue, 17 Nov 2015 08:42:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1ZygTT-0003aI-Oq
	for qemu-devel@nongnu.org; Tue, 17 Nov 2015 08:40:37 -0500
Received: from mail-lf0-x22a.google.com ([2a00:1450:4010:c07::22a]:32846)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1ZygTT-0003a9-Di; Tue, 17 Nov 2015 08:39:07 -0500
Received: by lfaz4 with SMTP id z4so5586088lfa.0;
	Tue, 17 Nov 2015 05:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ErYd7TIWRA1E2bt20/JmZmga87+7DnXTMF0NHmUV3KA=;
	b=HdMxuB9fiSMF4eJB/mwHe05fzu4OXV7OIH5ch8OY3/dwPZ7gjuE2iDxg8hgGkXHaYE
	lngDlegbK20VVf4VngCWD1KU+kA0lWA9a7QLB0uzLiofkQOVc9sHYPumhJ6xYM+9bG98
	cWDv4FCU4xNKbobMMN2TRsCHb2KQuSA487cfQaB2l9D61Py8Sn/dzIYckBlcQZWBLi9S
	d5FLhmkOVtBCpXCk8H28ITbJghyrdopK/fGPUbbDOy7sDPA8r0ISNJgaYbnaF8c5sY+6
	ijln44g/+lf4auliJ2DdPx8SroorMMV+AU/s3B/ZczX/QATtCHyk95V6Pg6BBQhwndvJ
	h7ww==
X-Received: by 10.25.21.145 with SMTP id 17mr19210873lfv.61.1447767546711;
	Tue, 17 Nov 2015 05:39:06 -0800 (PST)
Received: from sfedorov-laptop.smware.local ([213.243.91.10])
	by smtp.gmail.com with ESMTPSA id
	u12sm6342000lbk.45.2015.11.17.05.39.05
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 17 Nov 2015 05:39:06 -0800 (PST)
From: Sergey Fedorov <serge.fdrv@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue, 17 Nov 2015 16:38:46 +0300
Message-Id: <1447767527-21268-2-git-send-email-serge.fdrv@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1447767527-21268-1-git-send-email-serge.fdrv@gmail.com>
References: <1447767527-21268-1-git-send-email-serge.fdrv@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c07::22a
Cc: Sergey Fedorov <serge.fdrv@gmail.com>, qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [Qemu-devel] [PATCH v2 1/2] target-arm: Update condexec before CP
	access check in AA32 translation
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
X-TUID: BcJ8SYe8NYX8

Coprocessor access instructions are allowed inside IT block.
gen_helper_access_check_cp_reg() can raise an exceptions thus condexec
bits should be updated before.

Signed-off-by: Sergey Fedorov <serge.fdrv@gmail.com>
---

Notes:
    Changes in v2:
     * Typo fixed

 target-arm/translate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target-arm/translate.c b/target-arm/translate.c
index 4351854..739f373 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -7210,6 +7210,7 @@ static int disas_coproc_insn(DisasContext *s, uint32_t insn)
                 break;
             }
 
+            gen_set_condexec(s);
             gen_set_pc_im(s, s->pc - 4);
             tmpptr = tcg_const_ptr(ri);
             tcg_syn = tcg_const_i32(syndrome);
-- 
1.9.1

