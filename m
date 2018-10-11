Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1929139wrt;
        Wed, 10 Oct 2018 20:50:59 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61jQ2RXQzN9mCuFOIu4jfaLbzDFprRmEhDB3aRDw4yz05O0sZ8fSvwIrJ4hyPdsmBnMD9NY
X-Received: by 2002:a37:f42:: with SMTP id z63-v6mr27459057qkg.132.1539229859061;
        Wed, 10 Oct 2018 20:50:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539229859; cv=none;
        d=google.com; s=arc-20160816;
        b=y5JDl2oCUh/yhZxmeJQYNMzEoFAzOXGYHtEouI6MacyUN1Ebwlfvf+3gjAGIB2DRqD
         hiMELOSWaCjP42uk4I+Dt/7lwNWMEjEp1ulofstuc5ALUqUBWu6ezj1g7vM0ueZENTie
         e25GlD7O0RS2O7JbJHeDapmatJDbewzU1+TxCJnwwCcXwysbLOlXGOWdTV30IKNZFxek
         m8LUbvZPfK7xK5yvIoQVKZfEAlWJIYOx9Wwl7Ih6A8E9Xec+atYIrNRPwz8xugeBIUac
         RgXp6ws9VpQ8DslVc0CsF3jz3Qythmw95Qit5H9wf/oIa/j8teoh5axZiptWPW8YCZfx
         b7yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=rzmbn0crPWR8Qf7mEQcAM8E3NBxwk+Mk/cF2d2rxMKE=;
        b=MAQxnYmvTqtb8Uziswfv86ptYshwrQqrwwAyqzi7kVUuRTJW62BQpWV1rn+LrcqQJ8
         7jtqkHCmD1QgXTinhODSU6ks6N07TsxIiXEisjGEEih9GiBe0j4B3LshwOjlctlEHkQE
         sEsOXR1NMHQ544NM6mCMSkB42TtAt5yR/VGYpO86Ox6Uo6OQAHdGwBdTfZcURDP/54dF
         7pOw3NMqQ/ApUeMvuf+eL3hui3REAM8YacEsgWwUoMBXm+1qzNqtZP6K5jyteGgAFhY1
         QIdr/OHBlGZqnaAxVwA5/5djAMZpwTzpg/OFLR7QcnVdEuEIvoRNp4a0N93SNcvqAg9q
         OZRg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s51-v6si2195329qtb.17.2018.10.10.20.50.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 Oct 2018 20:50:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60204 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gAS02-0003rq-JC
	for alex.bennee@linaro.org; Wed, 10 Oct 2018 23:50:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36710)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xypron.glpk@gmx.de>) id 1gARzn-0003qT-GN
	for qemu-arm@nongnu.org; Wed, 10 Oct 2018 23:50:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <xypron.glpk@gmx.de>) id 1gARzm-00056x-Rg
	for qemu-arm@nongnu.org; Wed, 10 Oct 2018 23:50:43 -0400
Received: from mout.gmx.net ([212.227.17.21]:35263)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <xypron.glpk@gmx.de>)
	id 1gARzh-00051C-5O; Wed, 10 Oct 2018 23:50:37 -0400
Received: from LT02.fritz.box ([95.222.187.17]) by mail.gmx.com (mrgmx103
	[212.227.17.174]) with ESMTPSA (Nemesis) id 0MTBfe-1gHZYl49xO-00S7lL;
	Thu, 11 Oct 2018 05:50:34 +0200
Received: from LT02.fritz.box ([95.222.187.17]) by mail.gmx.com (mrgmx103
	[212.227.17.174]) with ESMTPSA (Nemesis) id 0MTBfe-1gHZYl49xO-00S7lL;
	Thu, 11 Oct 2018 05:50:34 +0200
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Oct 2018 05:50:26 +0200
Message-Id: <20181011035026.23517-1-xypron.glpk@gmx.de>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181010185445.10290-1-xypron.glpk@gmx.de>
References: <20181010185445.10290-1-xypron.glpk@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:l2Oz9NoUti0aOdNumimRmZqmqde0CJJPl2babal3cETfPOT49Ag
	UbPx1MnvwgwL1WT3uQ/WsMQb8nCdspxTaSw/O6vIDNOtnulByNRMK4xu8snUOz4HShUge7V
	SIi9ZSiZvlydYyAy5YDj0F7a5ZVpXEQQHHsKTnmFin9WUfLW4G6UsEtFw8C+FJkSqERWUHx
	y9sgP/rcjwDYtKdadjI1w==
X-UI-Out-Filterresults: notjunk:1;V01:K0:zJzduwCZSLs=:+gyVEpeVnOLP7yqshNwsOM
	ldoS/djttjVvsYI3GX3214MPvMMCcB1UiS6dly8sh43b7tkaP3uEtuU7ujgiA6j64Yk5tuPQz
	gQU/7LgYzq8PJ7oISLAabEMUZzN/l2Er2sGTYkd5BSbCxxqgYoQgsg+qFa5ZWDe89gSFTR1OG
	M1Th4TdCVeiRMpubrFyabdkPoW2k+y57df+9XOYO/5yNRyHhe6AOZmyMa/SkH9vXtWIqpuf5f
	hz/BqsCMDwt96uC5pmYKHUIaYxajtO7XXhMA3xj4ApMGVzCRFNQExcdnONhA8tF6EYXIUzcOB
	WWBoyqiCqAneZ34n22fyh/kPY5FuBaSo+hy84/QEZM0OauY604Qkh8cXcu+bNCP02lGrDdX+O
	aT2zSTwfvuyci+osymvZgJkKrvG8ayiNaDYyx+cE6ZGCsMH5b0YmdVHf+7LsbD/54Rq7fanZO
	Ock74E6ebnY4rgUS2MX/+ruQNb305wrVBhKU7rkv4s8qRg43suWqn4vBhkZKodlDgx8beNBon
	E46Qi5JTAXIFz92Po2bOLC21XqrcjxjABEqMiR6UJOYauGauPwHuP+ycjjs6ztFYvH9bNp89G
	Nve8tcZa+nVp52CB0csefB2ATeFTqjhppUrXShdTDzDARlwss8drCI0Ey0suLVrpIc1Nr60Ol
	hyGYEZpgKmP6MB3OGXERIfpUfBaw4014qlRGrJSUmtMjddNJsQ0FDWPCp6Qoum+cOVnZPizSh
	xtLpbcztLCi08yVUjtb1BK4P0vXhpMvJstdSjn5RfGH4JRm2TXoNAI+yu40XnnCngCKl5Gzw8
	D1/Mjm/QGeE+BYlJQWcFniUgggcXg==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.21
Subject: [Qemu-arm] [PATCH v2 1/1] hw/arm/virt: provide a model property in
 the fdt
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, Heinrich Schuchardt <xypron.glpk@gmx.de>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RjiKCCyKMArn

According to the "Devicetree Specification, Release v0.2" 'model' is a
required property of the root node.

Some software like the Debian flash-kernel package rely on this property
to identify boards.

The patch sets the model property to 'qemu,virt'.

Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
---
v2
	use the recommended format of the model property
---
 hw/arm/virt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 281ddcdf6e..abe366895a 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -200,6 +200,7 @@ static void create_fdt(VirtMachineState *vms)
     vms->fdt = fdt;
 
     /* Header */
+    qemu_fdt_setprop_string(fdt, "/", "model", "qemu,virt");
     qemu_fdt_setprop_string(fdt, "/", "compatible", "linux,dummy-virt");
     qemu_fdt_setprop_cell(fdt, "/", "#address-cells", 0x2);
     qemu_fdt_setprop_cell(fdt, "/", "#size-cells", 0x2);
-- 
2.19.1

