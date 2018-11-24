Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3064182wrt;
        Sat, 24 Nov 2018 00:41:54 -0800 (PST)
X-Google-Smtp-Source: AFSGD/Upf/eZig54deQXek2F2/s9nEETrm/mE6V6HgxlHkqoUix/Z8GgbD9xjgJw+lobyioPZpQU
X-Received: by 2002:a25:b4f:: with SMTP id 76-v6mr19246322ybl.50.1543048914877;
        Sat, 24 Nov 2018 00:41:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543048914; cv=none;
        d=google.com; s=arc-20160816;
        b=d9lZme/nWhp15et83xDEA0py3+JPYEUhUbRo4ZDoPSFIx1DwOzeQATuAF6yoWmBHI0
         oh9PkeePp98jF0qKDdv58AtKlrRlnJn/KBBnFSyzkl20+dVWPnf8GnAcYrnYEXn6e7MS
         Gw/XrnAhcPYguN5E2LxYYK49lAhkD4IhT86XDpeIaLLngoRFgfwezCMAmkvYjQBcsXdQ
         I/Za/ftn+0IEf9l8nW9EH3m9P6lSCri78OZYbW7tjId3lwpeGRME3GBc6ffwKx+mTxU2
         eUFREAlRKsqn7meAdXX2sSHtJWivpqLSqoXlHcnIpqOJEBGaUVdlXGrCl7XYqTtlABM4
         f28w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=UGnwbvDTCC3C3B/5TR0eTmaXMKhuqEFTu9Ac6QqCsO8=;
        b=JzfqIOgtQ5ddw9mDyXcClQ8k7MuoPcELN5JVC/PLYUcXa0H43ORPw26lO4ozWCyjae
         wFKHNI0uxsemABG9cruvsMH+MPIdc35cufYqeC6kOD90Eyn/hrkgEehn/3BBqFZCF0wL
         11V6dJMTMUXSQ5KaiCE8LIaDX5hudaoyq8Jo5GtkqYTPvy77Sy1LRCDP2rdeCbh6p6WR
         mz3mx8byiqhb+YRx18uwHv8VvEtkoylWurXGfDqYE22de8e2pj40nsjT7MsmA3/sYrth
         2ZIxtak2rQomFRsER/GFuXjfCJgLlmq4SwmD32+MHJF9xkh+M1omji2tR1+ZkVjaol14
         WJNg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p9si13914309ywm.390.2018.11.24.00.41.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 24 Nov 2018 00:41:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55710 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQTVg-0003IK-8f
	for alex.bennee@linaro.org; Sat, 24 Nov 2018 03:41:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52498)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gQTUJ-0002Xf-9M
	for qemu-devel@nongnu.org; Sat, 24 Nov 2018 03:40:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gQTSb-0000HR-40
	for qemu-devel@nongnu.org; Sat, 24 Nov 2018 03:38:41 -0500
Received: from out1.zte.com.cn ([202.103.147.172]:55420 helo=mxct.zte.com.cn)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gQTSW-000068-Ag; Sat, 24 Nov 2018 03:38:36 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id 6329D12C195BDA3446EB;
	Sat, 24 Nov 2018 16:38:34 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wAO8cS9X035001;
	Sat, 24 Nov 2018 16:38:28 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018112416391446-12702398 ;
	Sat, 24 Nov 2018 16:39:14 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com
Date: Sun, 25 Nov 2018 01:00:12 +0800
Message-Id: <1543078821-16636-2-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1543078821-16636-1-git-send-email-peng.hao2@zte.com.cn>
References: <1543078821-16636-1-git-send-email-peng.hao2@zte.com.cn>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-11-24 16:39:14,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-11-24 16:38:08
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MAIL: mse01.zte.com.cn wAO8cS9X035001
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 202.103.147.172
Subject: [Qemu-devel] [PATCH V8 01/10] hw/misc/pvpanic: Build the pvpanic
 device in $(common-obj)
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
Cc: Peng Hao <peng.hao2@zte.com.cn>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Qu+9hONgBrN9

From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

The 'pvpanic' ISA device can be use by any machine with an ISA bus.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
---
 hw/misc/Makefile.objs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index 680350b..c387ce4 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -8,6 +8,7 @@ common-obj-$(CONFIG=5FISA=5FTESTDEV) +=3D pc-testdev.o
 common-obj-$(CONFIG=5FPCI=5FTESTDEV) +=3D pci-testdev.o
 common-obj-$(CONFIG=5FEDU) +=3D edu.o
 common-obj-$(CONFIG=5FPCA9552) +=3D pca9552.o
+common-obj-$(CONFIG=5FPVPANIC) +=3D pvpanic.o
=20
 common-obj-y +=3D unimp.o
 common-obj-$(CONFIG=5FFW=5FCFG=5FDMA) +=3D vmcoreinfo.o
@@ -70,7 +71,6 @@ obj-$(CONFIG=5FIOTKIT=5FSECCTL) +=3D iotkit-secctl.o
 obj-$(CONFIG=5FIOTKIT=5FSYSCTL) +=3D iotkit-sysctl.o
 obj-$(CONFIG=5FIOTKIT=5FSYSINFO) +=3D iotkit-sysinfo.o
=20
-obj-$(CONFIG=5FPVPANIC) +=3D pvpanic.o
 obj-$(CONFIG=5FAUX) +=3D auxbus.o
 obj-$(CONFIG=5FASPEED=5FSOC) +=3D aspeed=5Fscu.o aspeed=5Fsdmc.o
 obj-$(CONFIG=5FMSF2) +=3D msf2-sysreg.o
--=20
1.8.3.1

