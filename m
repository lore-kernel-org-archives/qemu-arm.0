Received: by 10.223.150.237 with SMTP id u100csp2110396wrb;
        Sun, 12 Nov 2017 21:55:52 -0800 (PST)
X-Google-Smtp-Source: AGs4zMYhHdGZ3aF6GV3n5Q7egSiLViUYHt7R5ezyQDk6UBapjuniTzvktZxMtX65URIHkuX1fxxo
X-Received: by 10.129.160.213 with SMTP id x204mr5378781ywg.498.1510552552109;
        Sun, 12 Nov 2017 21:55:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510552552; cv=none;
        d=google.com; s=arc-20160816;
        b=0w5TQ/h8sm8F2/XrRUuzTgQfm7TmI+V18KrI4SomHKRvqMBEJIK5rb7Gb6yo5w6vod
         12CrU1IZmt18GXRpxvGYi0ERzc1DuCw1gOLgUs/K7ukqVQpDERC69r+THn+dlrwiZnWA
         o1tXTBvWoSZa9wEJrr1PP/STJ1672YNB0LcyvI3x8CJP8ZSAPE7hmkvZJwJx4XAmwDd8
         Z2e5IkSNSgvNe845xNt6XVDy5M6JG2Wkhl7CfvIdygANSbCZjmFPCuLSnoDmLQniuAye
         tzdVXHM8H0Re4yUlRC10yyl0X+GgYpYFp17paWoIul9hLnKEBB2OviWvJHyd2lKyoUFX
         Gw0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=q2JJ8fmwG+KzTe/M30cTOe7MvSj7F95aEzr+iVaGtiw=;
        b=A0sp7ySg7uOgr569EIJZnyEE+hdhRZGQWt75+/jgReGYTTiFRdSbxFxlNs71eLbYtc
         uutUsm76NFewY/fkyod57saYtAyIHt4/7Hav72pPIG/awl7X3V7JECua/H+mT/aw1PuL
         Nu3dyJl1VnekWtp6FjMfLXWQbouttsiGQ2l76YXiN6k3XnttU0s/p6Y/iPlQRCL3nbXy
         nsJWejxFSua9J+Nlv0T50iFjTGfsuotoORelazhhOyljJISjKUUVfJkmjFd9R9gVzePU
         Vgv7mi4lL2Ze1I8Rsl4jFNPFPgMFWK6TaAD/+EVzezGpeSG+L80uAvg/Wh0BQa3yg2ko
         5WLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iBwAcoVh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l204si3271964ybb.767.2017.11.12.21.55.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 12 Nov 2017 21:55:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iBwAcoVh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52758 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eE7ip-0004Kl-J2
	for alex.bennee@linaro.org; Mon, 13 Nov 2017 00:55:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56627)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1eE7ie-0004K0-Me
	for qemu-arm@nongnu.org; Mon, 13 Nov 2017 00:55:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1eE7id-0003iu-SC
	for qemu-arm@nongnu.org; Mon, 13 Nov 2017 00:55:40 -0500
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:44675)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1eE7iY-0003gb-Bl; Mon, 13 Nov 2017 00:55:34 -0500
Received: by mail-pg0-x241.google.com with SMTP id 4so3062790pge.1;
	Sun, 12 Nov 2017 21:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=q2JJ8fmwG+KzTe/M30cTOe7MvSj7F95aEzr+iVaGtiw=;
	b=iBwAcoVhK9e1rJ4E7/kUnmwltCwaospDhvoevoBDAVe5yqydil/3zQAtBzlCNWpFJn
	5hOrDEhjiJ/MEtzk48Ukr9UEP6QJo+fySpoWV3vqxtbD8NiO3EsYw4SnkG9/pkLCWG01
	QQSimHt7p29TVXpZqGceidRWGlAw4QldQs2tRR9cHJNdXlERcGK7m7RVed7KEYm0nmHq
	wGVCO2kfFtfb09AO6RaGGQHcweXl4iJAfPtz6aCS45NbvbobnaVZMB/po+EuMM/eLBfZ
	Za42KqxFABtd6KjyIeiBHYE7NYRUUq5THBhyJXNnLn5XVBSs9THA0cDKLw+B4kdAMk8Q
	oBxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=q2JJ8fmwG+KzTe/M30cTOe7MvSj7F95aEzr+iVaGtiw=;
	b=P3qlZIqfOk0RZgYWVrckcwi4a7zuCLnuc+yrlL0AVj200vUpFrt8Gbq6+9F8P2Qivv
	05Sn9yUmMRTB+wIxHojqZK4nS2mTcRxHvFKK1Ajyv+sS2MPwTZV+VbYhPKRnPmXi2/fK
	pbbo2lAzXNzclgK7ZPrUJJf3Kl9slhukfhRGUWuUUxEPAbyH9fZx2OsUfhmN/GM6k9AU
	k+REo2G+MPaxeMMslKVzH4NeWHrltVoYYXRBzyO7BJ5DetxDWxq9u1SzwbwP90Rjl0Os
	e6VTSURZGl0FCf/zJ6tpa1KRP4VGNg+KBa8oftpbgjbde9hHVCj+NhCCdwaJSfNLXdrN
	qwew==
X-Gm-Message-State: AJaThX5OJq62cGYmGDhsvQ6W5XFbBXsGZFfgj8N7ybMSTpwu1pFtAcYS
	8t+N0swnS1WBwAdE+FeThQNJyA==
X-Received: by 10.101.72.196 with SMTP id o4mr7584425pgs.147.1510552532753;
	Sun, 12 Nov 2017 21:55:32 -0800 (PST)
Received: from localhost.localdomain ([124.123.71.184])
	by smtp.gmail.com with ESMTPSA id
	n22sm29166326pfa.161.2017.11.12.21.55.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 12 Nov 2017 21:55:32 -0800 (PST)
From: Subbaraya Sundeep <sundeep.lkml@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Mon, 13 Nov 2017 11:25:20 +0530
Message-Id: <1510552520-3566-1-git-send-email-sundeep.lkml@gmail.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: [Qemu-arm] [Qemu devel PATCH v2] MAINTAINERS: Add entries for
 Smartfusion2
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
Cc: peter.maydell@linaro.org, Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	f4bug@amsat.org, alistair23@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yK2fefSybiiZ

Voluntarily add myself as maintainer for Smartfusion2

Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2:
	reframed commit message as per Alistair's comment.
	Renamed MSF2 SoC -> SmartFusion2
			MSF2 SOM -> Emcraft M2S-FG484
		as per Philippe's comments.

 MAINTAINERS | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0cd4d02..ffd77b4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -564,6 +564,23 @@ M: Alistair Francis <alistair@alistair23.me>
 S: Maintained
 F: hw/arm/netduino2.c
 
+SmartFusion2
+M: Subbaraya Sundeep <sundeep.lkml@gmail.com>
+S: Maintained
+F: hw/arm/msf2-soc.c
+F: hw/misc/msf2-sysreg.c
+F: hw/timer/mss-timer.c
+F: hw/ssi/mss-spi.c
+F: include/hw/arm/msf2-soc.h
+F: include/hw/misc/msf2-sysreg.h
+F: include/hw/timer/mss-timer.h
+F: include/hw/ssi/mss-spi.h
+
+Emcraft M2S-FG484
+M: Subbaraya Sundeep <sundeep.lkml@gmail.com>
+S: Maintained
+F: hw/arm/msf2-som.c
+
 CRIS Machines
 -------------
 Axis Dev88
-- 
2.5.0

