Received: by 10.28.4.212 with SMTP id 203csp195276wme;
        Fri, 4 May 2018 09:09:20 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZp85ZVb28TWZFDZqtGY6EShYVF7wNS5awMfSACXu8a0wjRdnHz/bPCgag5d02RDVQrBqkp4
X-Received: by 2002:a0c:afb2:: with SMTP id s47-v6mr24080706qvc.163.1525450160294;
        Fri, 04 May 2018 09:09:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525450160; cv=none;
        d=google.com; s=arc-20160816;
        b=Rzsb2kDngsUhl+++jnxsQSHxGscrAvKp9oCOuJxKjMWc3nPFrKO/31T30UOZDebtn9
         UdouQJhSg+cbDG4JgmbSPlRyAqEeIp9DY6JOsysc5WgIjitS5tYjUcusOlACvIGgg+/W
         HN3jGRWwVNESSDzSECjg769iyR3ucQNKekrrK9NccHbwYScIvLgxHP2aHewIkfR937ww
         8IzE3pzcXB2a/dF52r11MqhfsSZOzyrQPjHywARJR7vyPReKv1sEZKxopMXmHfnLZStb
         YdhACWEO2DfRi98UW8uK0AhvBtQ1+rvx2yEl+WfUb/tBqhKvFJhMhV7PUldmOEW8lCii
         +LkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=AhZTNnmz2bExtwkTHOFywLwZ1lgVO/zx2vNRoK/6NTs=;
        b=1IdJruMYA0SbxGvxteZulRH6eK1/3LpxbVhs6b0zeahVDngM5bvmSWNr+ySUNKEj/P
         NdbjIEixLEswaxMP3yVOa8ky//Xy404lYr+QUoyNc40aeH1xfWHopsX7b3QayLI/opJk
         nIdKvTxULb2UYA2QEqLWb4aWbaE3FeDdJcJ0Z65IxgVf8zZK2hO7Ai6ju1AothREnylO
         m/L5fxC1LMEU1aRjvlIhhSJHNI/O5zAmIPxW8K2dvFUKVan1AOgv27KlOi9QMVjoWswy
         e6v6VGhtYNiB+A9cfAfqq/V/s8906sw6jc9Mo5oHZ6okxZ9vNM0/OH/qxOD4vr9+Wt6a
         4zUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=n4sFDJxR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b10-v6si5035837qvj.239.2018.05.04.09.09.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 May 2018 09:09:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=n4sFDJxR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35080 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fEdGp-0001LC-Ni
	for alex.bennee@linaro.org; Fri, 04 May 2018 12:09:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54951)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fEd7b-0002bG-NQ
	for qemu-devel@nongnu.org; Fri, 04 May 2018 11:59:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fEd7W-0001Uu-T8
	for qemu-devel@nongnu.org; Fri, 04 May 2018 11:59:47 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:45535)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fEd7W-0001Ui-O5; Fri, 04 May 2018 11:59:42 -0400
Received: by mail-qt0-x241.google.com with SMTP id j42-v6so27941038qtj.12;
	Fri, 04 May 2018 08:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=AhZTNnmz2bExtwkTHOFywLwZ1lgVO/zx2vNRoK/6NTs=;
	b=n4sFDJxR5fzjfK6EPh5th25Kd6+K9PUHKD7MG0jsuMiUiIptNU5JqBtJX9tOfEbC2G
	dEgdNwlPIGQm9Z2Sv7U+MIV7C7cSryHqqN7xZfxJ/s9dMEO9PIcGCLJHpSyeALt5IT06
	GW6Wv6SSsJ86pIkY3BpQALjO2t1eCjPj5TBPebXwhyb0MeQqin4qpRhgpibcqcPg/8ft
	CJl3RyWgd5A2VlzEHPv6i42AuWQ8IU5rF6kWbTarnxkmpdyQlqjW+DhFlg4e65wx+GtG
	3STzfGcwbSEC1GNx+KOwU7su9tZv3PzjIGAqZM1Su2nD8QIzow/2Pnyl7zReIA9LjORn
	A5KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=AhZTNnmz2bExtwkTHOFywLwZ1lgVO/zx2vNRoK/6NTs=;
	b=BBR8WpdmiSAnk4VFkyY0VCW+1+79arfix6sE6J8/uLC85v2aSsd3UBOACAjnK2qI3y
	zXiV+E4UGtc+hgIle2pxY1mH3RYU1xv3wXrHluw62kxI5st+2qcOJOeIN6GBC8xHng9y
	jzTDOdTBFRvfHWDB9ZaIt+f4ttHZk5hx/YZZCgBF6GOST6v0RJmR48XlPe5u5+eiZQpL
	nVqSxVm914WKPGfWdx2unxogWyygPFzNdL5NrxVY9Ts6XFa58aa4gbdRnKY///ArZSfo
	GDO5GqrNSWBy7XRGJHiuUDLx8/ufODgTwmAhwO2fIcuK0XhW3t+29YK8TQsNQv/IIbqX
	ILug==
X-Gm-Message-State: ALQs6tC6391kYok89taVcFQbKzMIds+ZQDcM+nvE69vIb+e2H4rfxWUn
	euMFdkLYEns2W1ivobvvDHw=
X-Received: by 2002:ac8:35b0:: with SMTP id
	k45-v6mr23023286qtb.81.1525449582158; 
	Fri, 04 May 2018 08:59:42 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	a83sm8587066qkb.22.2018.05.04.08.59.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 May 2018 08:59:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>
Date: Fri,  4 May 2018 12:59:03 -0300
Message-Id: <20180504155918.21287-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180504155918.21287-1-f4bug@amsat.org>
References: <20180504155918.21287-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-devel] [PATCH 05/20] sdcard: Use the sd_prepare_request*()
 functions
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
Cc: Alistair Francis <alistair@alistair23.me>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Michael Walle <michael@walle.cc>,
	"open list:PXA2XX" <qemu-arm@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y93fQf9IaJR7

This guaranties all SDRequest members are initialized.

This silent the Coverity warning:

  "Use of an uninitialized variable (CWE-457)"

and fixes the following issues (all "Uninitialized scalar variable"):

- CID1386072 (hw/sd/sdhci.c::sdhci_end_transfer)
- CID1386074 (hw/sd/bcm2835_sdhost.c::bcm2835_sdhost_send_command)
- CID1386076 (hw/sd/sdhci.c::sdhci_send_command)
- CID1390571 (hw/sd/ssi-sd.c::ssi_sd_transfer)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/bcm2835_sdhost.c    | 3 +--
 hw/sd/milkymist-memcard.c | 7 +++----
 hw/sd/omap_mmc.c          | 4 +---
 hw/sd/pxa2xx_mmci.c       | 4 +---
 hw/sd/sdhci.c             | 6 ++----
 hw/sd/ssi-sd.c            | 5 ++---
 6 files changed, 10 insertions(+), 19 deletions(-)

diff --git a/hw/sd/bcm2835_sdhost.c b/hw/sd/bcm2835_sdhost.c
index ebf3b926c2..5134d7b5c7 100644
--- a/hw/sd/bcm2835_sdhost.c
+++ b/hw/sd/bcm2835_sdhost.c
@@ -110,8 +110,7 @@ static void bcm2835_sdhost_send_command(BCM2835SDHostState *s)
     uint8_t rsp[16];
     int rlen;
 
-    request.cmd = s->cmd & SDCMD_CMD_MASK;
-    request.arg = s->cmdarg;
+    sd_prepare_request(&request, s->cmd & SDCMD_CMD_MASK, s->cmdarg, false);
 
     rlen = sdbus_do_command(&s->sdbus, &request, rsp);
     if (rlen < 0) {
diff --git a/hw/sd/milkymist-memcard.c b/hw/sd/milkymist-memcard.c
index ff2b92dc64..d8cbb7b681 100644
--- a/hw/sd/milkymist-memcard.c
+++ b/hw/sd/milkymist-memcard.c
@@ -99,10 +99,9 @@ static void memcard_sd_command(MilkymistMemcardState *s)
 {
     SDRequest req;
 
-    req.cmd = s->command[0] & 0x3f;
-    req.arg = ldl_be_p(s->command + 1);
-    req.crc = s->command[5];
-
+    sd_prepare_request_with_crc(&req, s->command[0] & 0x3f,
+                                ldl_be_p(s->command + 1),
+                                s->command[5]);
     s->response[0] = req.cmd;
     s->response_len = sdbus_do_command(&s->sdbus, &req, s->response + 1);
     s->response_read_ptr = 0;
diff --git a/hw/sd/omap_mmc.c b/hw/sd/omap_mmc.c
index 5b47cadf11..7b71984115 100644
--- a/hw/sd/omap_mmc.c
+++ b/hw/sd/omap_mmc.c
@@ -135,9 +135,7 @@ static void omap_mmc_command(struct omap_mmc_s *host, int cmd, int dir,
     mask = 0;
     rspstatus = 0;
 
-    request.cmd = cmd;
-    request.arg = host->arg;
-    request.crc = 0; /* FIXME */
+    sd_prepare_request(&request, cmd, host->arg, false /* FIXME */);
 
     rsplen = sd_do_command(host->card, &request, response);
 
diff --git a/hw/sd/pxa2xx_mmci.c b/hw/sd/pxa2xx_mmci.c
index 82f8ec0d50..fd5c1e7686 100644
--- a/hw/sd/pxa2xx_mmci.c
+++ b/hw/sd/pxa2xx_mmci.c
@@ -224,9 +224,7 @@ static void pxa2xx_mmci_wakequeues(PXA2xxMMCIState *s)
     s->tx_len = 0;
     s->cmdreq = 0;
 
-    request.cmd = s->cmd;
-    request.arg = s->arg;
-    request.crc = 0;	/* FIXME */
+    sd_prepare_request(&request, s->cmd, s->arg, false /* FIXME */);
 
     rsplen = sdbus_do_command(&s->sdbus, &request, response);
     s->intreq |= INT_END_CMD;
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 63c44a4ee8..9260f59e80 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -336,8 +336,7 @@ static void sdhci_send_command(SDHCIState *s)
 
     s->errintsts = 0;
     s->acmd12errsts = 0;
-    request.cmd = s->cmdreg >> 8;
-    request.arg = s->argument;
+    sd_prepare_request(&request, s->cmdreg >> 8, s->argument, false);
 
     trace_sdhci_send_command(request.cmd, request.arg);
     rlen = sdbus_do_command(&s->sdbus, &request, response);
@@ -393,8 +392,7 @@ static void sdhci_end_transfer(SDHCIState *s)
         SDRequest request;
         uint8_t response[16];
 
-        request.cmd = 0x0C;
-        request.arg = 0;
+        sd_prepare_request(&request, 12, 0, false);
         trace_sdhci_end_transfer(request.cmd, request.arg);
         sdbus_do_command(&s->sdbus, &request, response);
         /* Auto CMD12 response goes to the upper Response register */
diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index 0bb26e596d..c22967170c 100644
--- a/hw/sd/ssi-sd.c
+++ b/hw/sd/ssi-sd.c
@@ -95,9 +95,8 @@ static uint32_t ssi_sd_transfer(SSISlave *dev, uint32_t val)
         if (s->arglen == 4) {
             SDRequest request;
             uint8_t longresp[16];
-            /* FIXME: Check CRC.  */
-            request.cmd = s->cmd;
-            request.arg = ldl_be_p(s->cmdarg);
+            sd_prepare_request(&request, s->cmd,
+                               ldl_be_p(s->cmdarg), false /* FIXME */);
             DPRINTF("CMD%d arg 0x%08x\n", s->cmd, request.arg);
             s->arglen = sdbus_do_command(&s->sdbus, &request, longresp);
             if (s->arglen <= 0) {
-- 
2.17.0

