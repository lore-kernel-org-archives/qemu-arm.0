Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp541299wrd;
        Sat, 1 Sep 2018 05:51:21 -0700 (PDT)
X-Google-Smtp-Source: ANB0Vdbv1dx1Y54tsaxrQeqRx4KcrEhZaZmMNZMb32AhwZ7I1ebOoM7wOKAfuQf8OUjt3p3nSou+
X-Received: by 2002:a37:a54f:: with SMTP id o76-v6mr18426907qke.125.1535806281346;
        Sat, 01 Sep 2018 05:51:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535806281; cv=none;
        d=google.com; s=arc-20160816;
        b=XoawOP4NsvH63GWB2u/aGK088rICyydMnuxWwxC0JDlM56eqops42rC0QwsdQcFZoa
         JE9w7s5i9D8naRAknKU5WLyooFJO3+4aWWC1j/hCy6hcs4nKSOMCk1Me8xLAAaqsVOna
         0abER7pCFjLRIGGguSyUDfjFM/xlOt6YDBBBQ26JOYrIc0MNqQtveG5dKlvmck6IkD0z
         zFqXZw8HPv9onEc4V+jfL2GFGmAd6OCM+8VTk/XPsesSLSuyLpnwAp4DtypltpR4U74u
         QtcWiqQuW1uhBpS553n4iUG8eQeH//1koBhENQ/VYfHNJrQu12oot2HNOqQIqK7cnfDS
         Qe9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=S219CghyKBbanwz6oa4OgtSKNV5nOdtQD+H/g4UPg1k=;
        b=CX/8KRZkugtS2a9LyH624v3+oF2S1rX1JyItOi3+pKfQ7bbeTlmJIEI5XpvTdRXXgL
         kTb8YJ/s5AC6zfrfz1d6kM3DR9+Q0AwrsNOchZ3SwzawLBKvrZlVn/fFdBKoyl63uMu0
         AFwnYFFPtaAYW+rVh5XgzZNjPclkP651cVeZlQr0MnRrEbpWERRBwnLsPkG36crGSCRP
         vq3DlulP0PsJH1Qw1Km8OcQwCpVb0hF080t3rIHBYt/CF8CPfYOokXDJAHIDQNX8uBYa
         MFTY/n/JGlbFqwNpbcBzSw1M4ozE3pCuUotEQreQiwde5quo70FuR4gB3+ghngHFTnV8
         VRog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=ukYnZFYp;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=ukYnZFYp;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=gp8rMuTe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d1-v6si4830566qtk.102.2018.09.01.05.51.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 01 Sep 2018 05:51:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=ukYnZFYp;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=ukYnZFYp;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=gp8rMuTe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37055 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fw5N2-0000fJ-Pl
	for alex.bennee@linaro.org; Sat, 01 Sep 2018 08:51:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35588)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fw5JW-00066s-A0
	for qemu-arm@nongnu.org; Sat, 01 Sep 2018 08:47:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fw5JR-0007uv-5t
	for qemu-arm@nongnu.org; Sat, 01 Sep 2018 08:47:42 -0400
Received: from greensocs.com ([193.104.36.180]:40645)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fw5JQ-0007kS-RO; Sat, 01 Sep 2018 08:47:37 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id C1D60DFFED;
	Sat,  1 Sep 2018 14:47:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1535806032;
	bh=H1BEeWZcXbhpNd6Me1rhtl3y8JK99Adxfg+psjia9g8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ukYnZFYp/m8aMitDU5I110umm6Sq3g4kVo+CS6vmkfZw3VjmApC4misij0J2D8isf
	HTMr+DmPX5BPwLMS8EtmuMZIvo12uvHIwvwN966LHHunCDmekyYs+Ws/pgUslyb4w8
	PQWDAqYzqbOcy65DKS1rtwArmkaRXOz7a4Ev8row=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=ukYnZFYp;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=gp8rMuTe
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IcFmYGyFwRrk; Sat,  1 Sep 2018 14:47:12 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 02DF0521AAF; Sat,  1 Sep 2018 14:47:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1535806032;
	bh=H1BEeWZcXbhpNd6Me1rhtl3y8JK99Adxfg+psjia9g8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ukYnZFYp/m8aMitDU5I110umm6Sq3g4kVo+CS6vmkfZw3VjmApC4misij0J2D8isf
	HTMr+DmPX5BPwLMS8EtmuMZIvo12uvHIwvwN966LHHunCDmekyYs+Ws/pgUslyb4w8
	PQWDAqYzqbOcy65DKS1rtwArmkaRXOz7a4Ev8row=
Received: from michell-laptop.home.lmichel.fr
	(LFbn-LYO-1-488-36.w2-7.abo.wanadoo.fr [2.7.77.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 6075A521A9F;
	Sat,  1 Sep 2018 14:47:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1535806031;
	bh=H1BEeWZcXbhpNd6Me1rhtl3y8JK99Adxfg+psjia9g8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gp8rMuTeJuLIoqJuROxNAfp1M4KSTljWUBQixpGux9BCAiOKracORZl8uGZlBVEWs
	BwWVDtLbyuHANmkNZxdcCx7WujxHfpxn0Htw70bkBXGxCDeupqeB5vZQXhI5t7J/Uj
	i+c6rPxO8ntYxCMPLWwL7G5b2nbp5V1+ejXv29bA=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Sat,  1 Sep 2018 14:46:37 +0200
Message-Id: <20180901124639.19735-14-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180901124639.19735-1-luc.michel@greensocs.com>
References: <20180901124639.19735-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH 13/15] gdbstub: gdb_set_stop_cpu: ignore request
 when process is not attached
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
Cc: Peter Maydell <peter.maydell@linaro.org>, alistair@alistair23.me,
	mark.burton@greensocs.com, saipava@xilinx.com, edgari@xilinx.com,
	qemu-arm@nongnu.org, Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uWw5ruINp/XC

When gdb_set_stop_cpu() is called with a CPU associated to a process
currently not attached by the GDB client, return without modifying the
stop CPU. Otherwise, GDB get confused if it receives packets with a
thread-id it does not know about.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
---
 gdbstub.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/gdbstub.c b/gdbstub.c
index 36ed7081ea..6a55bf2785 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1759,10 +1759,19 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
     return RS_IDLE;
 }
 
 void gdb_set_stop_cpu(CPUState *cpu)
 {
+    GDBProcess *p = gdb_get_cpu_process(gdbserver_state, cpu);
+
+    if (!p->attached) {
+        /* Having a stop CPU corresponding to a process that is not attached
+         * confuses GDB. So we ignore the request.
+         */
+        return;
+    }
+
     gdbserver_state->c_cpu = cpu;
     gdbserver_state->g_cpu = cpu;
 }
 
 #ifndef CONFIG_USER_ONLY
-- 
2.18.0

