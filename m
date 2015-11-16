Received: by 10.182.158.201 with SMTP id ww9csp400484obb;
        Mon, 16 Nov 2015 15:51:19 -0800 (PST)
X-Received: by 10.31.182.211 with SMTP id g202mr624934vkf.62.1447717878267;
        Mon, 16 Nov 2015 15:51:18 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h184si504285vke.64.2015.11.16.15.51.18
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Mon, 16 Nov 2015 15:51:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52311 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZyTYL-00050q-TF
	for alex.bennee@linaro.org; Mon, 16 Nov 2015 18:51:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60757)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1ZyPYD-000627-U8
	for qemu-devel@nongnu.org; Mon, 16 Nov 2015 14:34:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1ZyPYD-0001OB-0J
	for qemu-devel@nongnu.org; Mon, 16 Nov 2015 14:34:53 -0500
Received: from mail-lb0-x22c.google.com ([2a00:1450:4010:c04::22c]:33169)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1ZyPYC-0001Nq-Ph; Mon, 16 Nov 2015 14:34:52 -0500
Received: by lbbkw15 with SMTP id kw15so95040845lbb.0;
	Mon, 16 Nov 2015 11:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/kHSlwLfNZv6HRp1vu0O1+a2v18+wPv2ar5YTFpZq1w=;
	b=evdWkl+sv3tlv5HtRsSHYD2dDIYR6DQSRlGf/Ba7lKlqa28Euz/SoM5jFydqGGJEyR
	IZPEf6Kv2Njr4GItWbRljmxagPCmfV7WWCfZ0sy+Vzv0jIbw9E9+PVd+h6jRVz01wq2k
	Qy86+8qDgHoaJJzqNZ5MBhFJ7/U1xPxW0vZovQ7LQsK/+3PcxMcEPrX0WXwml9g7neXl
	7K/Gowp7JhufXxCzxexet+gHNDDuEi0LXXGRQxXC4snvaEFvFdgQGk86WEsZgtcK+wdD
	FBjBWtazNMnU2kzwupLeu1qOa4RymKZhAxdnyAdCD156wKNZ1Mm4ibPPZ9SyIAtbw3CJ
	V5uQ==
X-Received: by 10.112.12.193 with SMTP id a1mr18023346lbc.52.1447702492124;
	Mon, 16 Nov 2015 11:34:52 -0800 (PST)
Received: from sfedorov-laptop.smware.local ([213.243.91.10])
	by smtp.gmail.com with ESMTPSA id a2sm5709847lbc.20.2015.11.16.11.34.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 Nov 2015 11:34:51 -0800 (PST)
From: Sergey Fedorov <serge.fdrv@gmail.com>
To: qemu-devel@nongnu.org
Date: Mon, 16 Nov 2015 22:34:38 +0300
Message-Id: <1447702479-6997-2-git-send-email-serge.fdrv@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1447702479-6997-1-git-send-email-serge.fdrv@gmail.com>
References: <1447702479-6997-1-git-send-email-serge.fdrv@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c04::22c
Cc: Sergey Fedorov <serge.fdrv@gmail.com>, qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [Qemu-devel] [PATCH 1/2] target-arm: Update condexec before CP
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
X-TUID: 4/OIBWzc3umV

Coprocessor access instructions are allowed inside IT block.
gen_helper_access_check_cp_reg() can raise an exceptions thus condexec
bits should be updated before.

Signed-off-by: Sergey Fedorov <serge.fdrv@gmail.com>
---
 target-arm/translate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target-arm/translate.c b/target-arm/translate.c
index 4351854..f1f8129 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -7210,6 +7210,7 @@ static int disas_coproc_insn(DisasContext *s, uint32_t insn)
                 break;
             }
 
+            gen_set_condexec(dc);
             gen_set_pc_im(s, s->pc - 4);
             tmpptr = tcg_const_ptr(ri);
             tcg_syn = tcg_const_i32(syndrome);
-- 
1.9.1

