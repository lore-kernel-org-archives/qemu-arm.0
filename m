Received: by 10.182.158.201 with SMTP id ww9csp395969obb;
        Mon, 16 Nov 2015 15:38:45 -0800 (PST)
X-Received: by 10.31.16.213 with SMTP id 82mr569905vkq.117.1447717125387;
        Mon, 16 Nov 2015 15:38:45 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 42si462227vkq.153.2015.11.16.15.38.45
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Mon, 16 Nov 2015 15:38:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52022 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZyTMC-00047a-Td
	for alex.bennee@linaro.org; Mon, 16 Nov 2015 18:38:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60865)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1ZyPYH-00063g-6X
	for qemu-devel@nongnu.org; Mon, 16 Nov 2015 14:34:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1ZyPYG-0001Qf-ER
	for qemu-devel@nongnu.org; Mon, 16 Nov 2015 14:34:57 -0500
Received: from mail-lb0-x230.google.com ([2a00:1450:4010:c04::230]:33185)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1ZyPYG-0001QK-78; Mon, 16 Nov 2015 14:34:56 -0500
Received: by lbbkw15 with SMTP id kw15so95041783lbb.0;
	Mon, 16 Nov 2015 11:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TQKVSp0clAPKzF7+vvpjRl0AXJ/1U9vbScepQLBSCd8=;
	b=GmhvRyUpt0s9thhO9+8hpqhyC2/Af2ZhXhmdQ1HGGmygpf84iSq5agCVyReFL8DqZr
	pHTJbeNcAlMkyMV+rZ1JNIS1i5qSPez4xdiKD8nXbd0bBgMv7tGZlLM3EoenE6nbidUL
	9uGIFRV4U8yBPVGN5GfbqwYyr7xZjPHE4Ts24xx3eauAIZH/AzkfpCwPPjHJqqbXBNBD
	QzHmuEGPnYLxhL1y5oVTF+P1AeoqV0dsV5YlNHtT/UM5cPvyI8sxg/GDu6lriRp1fRm2
	hSfcdMTO7jULgpPn+1VlFbJfSjUbklWqkdJI2OV1gt5P3nLjYV1A5p2b2ZNBalCcbim/
	V6+Q==
X-Received: by 10.112.205.10 with SMTP id lc10mr1725267lbc.31.1447702495624;
	Mon, 16 Nov 2015 11:34:55 -0800 (PST)
Received: from sfedorov-laptop.smware.local ([213.243.91.10])
	by smtp.gmail.com with ESMTPSA id a2sm5709847lbc.20.2015.11.16.11.34.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 Nov 2015 11:34:55 -0800 (PST)
From: Sergey Fedorov <serge.fdrv@gmail.com>
To: qemu-devel@nongnu.org
Date: Mon, 16 Nov 2015 22:34:39 +0300
Message-Id: <1447702479-6997-3-git-send-email-serge.fdrv@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1447702479-6997-1-git-send-email-serge.fdrv@gmail.com>
References: <1447702479-6997-1-git-send-email-serge.fdrv@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c04::230
Cc: Sergey Fedorov <serge.fdrv@gmail.com>, qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [Qemu-devel] [PATCH 2/2] target-arm: Update condexec before arch BP
	check in AA32 translation
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
X-TUID: PBQDPxUQPccx

Architectural breakpoint check could raise an exceptions, thus condexec
bits should be updated before calling gen_helper_check_breakpoints().

Signed-off-by: Sergey Fedorov <serge.fdrv@gmail.com>
---
 target-arm/translate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target-arm/translate.c b/target-arm/translate.c
index f1f8129..9e9f851 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -11374,6 +11374,7 @@ void gen_intermediate_code(CPUARMState *env, TranslationBlock *tb)
             QTAILQ_FOREACH(bp, &cs->breakpoints, entry) {
                 if (bp->pc == dc->pc) {
                     if (bp->flags & BP_CPU) {
+                        gen_set_condexec(dc);
                         gen_set_pc_im(dc, dc->pc);
                         gen_helper_check_breakpoints(cpu_env);
                         /* End the TB early; it's likely not going to be executed */
-- 
1.9.1

