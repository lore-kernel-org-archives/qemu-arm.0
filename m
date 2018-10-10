Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1364558wrt;
        Wed, 10 Oct 2018 11:55:33 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61t1vlj/0Pd6cQZAdJBTZCzYWczjnUF/zH4W1+UDelbm20h/y4NqPEtPT71mHE2EsAuky+h
X-Received: by 2002:a37:a90b:: with SMTP id s11-v6mr26839679qke.171.1539197733232;
        Wed, 10 Oct 2018 11:55:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539197733; cv=none;
        d=google.com; s=arc-20160816;
        b=UUAizaXXybyt86LgS3sVP3RhoiLnEn8c1aBDNQQg4hRYRfArfh5yp80+dSKqJtqp6L
         g6dkA8WtVgTMxPApLwQWiq5RC6sVU3wSpm+F3hepOBuY6VVzQukCXGCDobFVd4nX2arT
         cqvicWimHhEajIsTiJFOu2OQQEzFjF3vnrZtF9cqniiBOBSVyxudZdRieSMJYnnIGZ9U
         ZhUGv9v4fYwnUNaftxh55SLH1yRxE4BySSWyxaX9/syVz74sbC1bMLifFKtIxWbpAz3Z
         Fsne2BRpWKHILCEXKUcvmgTTkDvJljrZ/t1b/+qpr4Vw3gSWIrNLeOc41M7+AzI1CARH
         dKiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=mjxaH/jzu0AnWTLLEpmZPjWLmrfZ7pNhAg4JK5GSa6c=;
        b=bzbdIiaEdWi/5XNYugSQI8f6WfEQF2ygGkg/f4Y4c36XfCYbAPiNQXOflxj2uH9fye
         LsKDC5jcG+EeTNxcp7yRzZa5EFNRUMIFnJryZZh0s4edfCnyX354tk3nJgkOvmXhsEg3
         DHHTwr35yd/WSDNd/u0aQZ9W2ycAZXgRWvangIZflPiERM6Um3rtS2IxsSP5hiXNOsB5
         2OB8SdQiN7X0E25oOdMYHmpja5w5DbGCldjzmn8Y2SjvWlCyySmNvm5hb178JvfTwmhG
         /XJqDWJU8Ri8UCI0Mguz4Bw0FNoedB3OUBbc4gfWEMERxD8w3Pu2RoYOrz6Cws6SUfOc
         yteQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i47-v6si3528907qta.379.2018.10.10.11.55.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 Oct 2018 11:55:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58683 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gAJds-0005Bh-Rb
	for alex.bennee@linaro.org; Wed, 10 Oct 2018 14:55:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40954)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xypron.glpk@gmx.de>) id 1gAJdT-00059g-AR
	for qemu-devel@nongnu.org; Wed, 10 Oct 2018 14:55:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <xypron.glpk@gmx.de>) id 1gAJdP-00067D-Vw
	for qemu-devel@nongnu.org; Wed, 10 Oct 2018 14:55:07 -0400
Received: from mout.gmx.net ([212.227.15.18]:38343)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <xypron.glpk@gmx.de>)
	id 1gAJdP-00066Q-Li; Wed, 10 Oct 2018 14:55:03 -0400
Received: from LT02.fritz.box ([95.222.187.17]) by mail.gmx.com (mrgmx003
	[212.227.17.184]) with ESMTPSA (Nemesis) id 0M54L0-1fkY1K207y-00zIO0;
	Wed, 10 Oct 2018 20:55:00 +0200
Received: from LT02.fritz.box ([95.222.187.17]) by mail.gmx.com (mrgmx003
	[212.227.17.184]) with ESMTPSA (Nemesis) id 0M54L0-1fkY1K207y-00zIO0;
	Wed, 10 Oct 2018 20:55:00 +0200
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 10 Oct 2018 20:54:45 +0200
Message-Id: <20181010185445.10290-1-xypron.glpk@gmx.de>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:iXB/pkhqGiuNR5s7f7RQ0Xvcvfs144WPqFWeYZHecig6XrVMdwl
	dgmdwBAA1MeuWRWuNN3Muw6jtJRsW/PUIDJ4igzQcE6Cloi1VyM6SbH+IYxz2e1l0cfgL21
	ss4HonjVZvTOYIJhI2lBgLDl7Nn+mEQ8r1kmjMCYP3qCmDEg49ZRL0X/oqxkPBjbn/SuStB
	ro+4pYPBjaEJLd3ovzigg==
X-UI-Out-Filterresults: notjunk:1;V01:K0:BbKaM8EdanY=:i9FC5WB7QOpwTGlKAL1Cs1
	XOSc8n3T2UI3V3aJdHM0prv2FPa+8mJGQEinhSDgOFzZyN/AJKUab/URBhwTww4EaI2QK9udt
	p3culn8iMwOQeo4G5u44FH+8Rt6aCLX0VNgEMHjiUXkElad0RNKIgypWwdbCYrcjPGsmPs4Z8
	RsuvL2Bit0dwFAkHT1UoV/ZeZ+rFSmhTCItksa/UWc81N6fVAOGEpByy54HX4kHxPpJOeP9xf
	g0BwHslhl7MUMIkz9lnT2hDXyug2anvib6PknOf0nR/4POuhMA+ufSRwwFizvPxuALv8uU2T5
	LayaS33DX96J4zQHUcIeNSzFTwXEK6g7xaX5MYSwxRR992KnVAX/Jru4qxwjms/EBNYiu0UAD
	i0OSrjZ+CCSj+tCmyXZPJedPbh+aLY9ULV0CBLAP8yG1xGRzxg5nqaUfSkrnmig9V9FUCfbEe
	PXL7IQnOyKjVhL85K30G1GDM5/9nw5qd/666a+QWhfC9n8dszWDLNJQH+GphV69yHKnAu+3f8
	q23SzJeED/Ccedv0iQi9eo2wucCSxkgVNMoVOm5kg9wGMOv54gCiPmMJF9HHHW8HaXmRt+hkJ
	0hOK5aZehpbzd5P+FVq4CENLvju6GRR+ofedbTXXIt+nmnu5u/JuII6j8gBAKXXU3L6WguWY7
	gQ4q7Q+mUVuWWfgHaLXrYEu1uxaTMFJf+dSl8kZZGMa5bcMHGKPvxQ4Nl7UqlZBk8Obuw0/5+
	f90Ga3dZyfxnESm2y7LfkQ+DTYMjp/W94O1Yf2ZcW0G4InsdilcFrx5FNMBOMZe+tVofLomvU
	it2nAhvtL8IhJrdUR/A2TZDnPylTw==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.15.18
Subject: [Qemu-devel] [PATCH 1/1] hw/arm/virt: provide a model property in
 the fdt
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
Cc: qemu-trivial@nongnu.org, Heinrich Schuchardt <xypron.glpk@gmx.de>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ED8znBX+D7Hk

Device trees in the Linux kernel generally provide a model property. Some
software like the Debian flash-kernel package rely on this property to
identify boards.

The patch sets the model property for the virt boards to 'QEMU virt'.

Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
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
+    qemu_fdt_setprop_string(fdt, "/", "model", "QEMU virt");
     qemu_fdt_setprop_string(fdt, "/", "compatible", "linux,dummy-virt");
     qemu_fdt_setprop_cell(fdt, "/", "#address-cells", 0x2);
     qemu_fdt_setprop_cell(fdt, "/", "#size-cells", 0x2);
-- 
2.19.1

