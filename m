Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp833671wrt;
        Fri, 25 Jan 2019 15:03:31 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5IRmpk0ozdHTlPX6pQGma38nhI8WZTf9EPlfNUrwtA3wmiEukxbbmN1dU4gueY5iq7rQRZ
X-Received: by 2002:adf:f211:: with SMTP id p17mr13075575wro.293.1548457411577;
        Fri, 25 Jan 2019 15:03:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548457411; cv=none;
        d=google.com; s=arc-20160816;
        b=uo4b0m2D6AqP18LMksGM488Bq60OA5DSVbCMvL+IrGVf12TWUcSbcAbXUEGy4fPlF+
         nbm4ouRjl6EC51T0SBotf8DobklmqrVrnHVTbSpss0UzRKJnGN4Aaq8ztYJnwui78ZZP
         9z16CaJX+5D2VknEM8XH9gQEEM+IXpKMsXCrVlg8oXCjkGogEyASLPEq7qKzndc2My94
         74WX/5ZIKiLUJCWPrGudisIiTvrgHfi8L80pFSyJDwlSrKAtH23Py58Q4KQ7yt8hMNp5
         zERo1FXlmLLQcymFaqK2tZh+inJ2J/BHO/hrzvO23kYBjbYuPnQveiSvKh9CeCcXCY4i
         uUag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=35jTPnayq8BRykC3e19xZBmqNKK/FMnPED4wcMPLbUk=;
        b=Z+Ineibl1JzMGbuk8rZRftmxzTS/rIiESIC5KXbqRKywWUUkNicmgBsDUTl8I8dAKs
         X5a6EoOgzLM8giionNKEkVuLkHaavDicboT492MIIqvNg31ChknLu9C6BfCTRqlfy4MJ
         2fDYCZMaNR2W0XrSJO2qYfXGe3ybgzP8puad1EV3/K8EOfES/+0P3+KQdimLDj6onTU4
         PxBGlifvVZHE/8iBa219Yd0Zvjc3hKlytoWKnGD4BCHFfuybeM4PioTTdB5QkFH/irUj
         3iTgdpF1wTjQQ+HmWvatrZFF1o0K4grJa0Q2alwzvm+HPOi4w4NUCS0xlngGe6GuRiSo
         JNuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i67si29674425wmi.164.2019.01.25.15.03.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 25 Jan 2019 15:03:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:52087 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gnAVW-0001E1-MH
	for alex.bennee@linaro.org; Fri, 25 Jan 2019 18:03:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52578)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <remi@remlab.net>) id 1gn9M8-0001Sj-Kp
	for qemu-devel@nongnu.org; Fri, 25 Jan 2019 16:49:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <remi@remlab.net>) id 1gn9M7-00035o-Ai
	for qemu-devel@nongnu.org; Fri, 25 Jan 2019 16:49:44 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:42982
	helo=ns207790.ip-94-23-215.eu) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <remi@remlab.net>)
	id 1gn9M5-0002wk-BT; Fri, 25 Jan 2019 16:49:41 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
	by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id 126DB5FBCB;
	Fri, 25 Jan 2019 22:49:27 +0100 (CET)
From: =?UTF-8?q?R=C3=A9mi=20Denis-Courmont?= <remi@remlab.net>
To: qemu-arm@nongnu.org
Date: Fri, 25 Jan 2019 23:49:25 +0200
Message-Id: <20190125214926.3204-2-remi@remlab.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1648289.tQCHxfjYn9@basile.remlab.net>
References: <1648289.tQCHxfjYn9@basile.remlab.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:41d0:2:5a1a::
X-Mailman-Approved-At: Fri, 25 Jan 2019 18:02:26 -0500
Subject: [Qemu-devel] [PATCH 2/3] target/arm: actually enable PAuth in user
 mode
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QPhl/WRkmMQg

From: Remi Denis-Courmont <remi.denis.courmont@huawei.com>

This always enables IA, IB, DA and DB keys in user mode on the maximum
CPU, in a manner that is consistent with the other CPUs. That is to say
redefining the reset value of SCTLR_ELx registers.

Without this patch, the PAC* and AUT* instructions have no effects
(except PACGA of course).

Signed-off-by: Remi Denis-Courmont <remi.denis.courmont@huawei.com>
---
 target/arm/cpu64.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index e9bc461c36..148c103ca4 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -413,8 +413,8 @@ static void aarch64_max_initfn(Object *obj)
                                 (void *)&apdb_bit, &error_fatal);
=20
             /* Enable all PAC keys by default.  */
-            cpu->env.cp15.sctlr_el[1] |=3D SCTLR_EnIA | SCTLR_EnIB;
-            cpu->env.cp15.sctlr_el[1] |=3D SCTLR_EnDA | SCTLR_EnDB;
+            cpu->reset_sctlr |=3D SCTLR_EnIA | SCTLR_EnIB;
+            cpu->reset_sctlr |=3D SCTLR_EnDA | SCTLR_EnDB;
         }
 #endif
=20
--=20
2.20.1

