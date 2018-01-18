Received: by 10.28.173.206 with SMTP id w197csp6869928wme;
        Thu, 18 Jan 2018 10:43:34 -0800 (PST)
X-Google-Smtp-Source: ACJfBospfSDVVYc3oTg0Q6pWkId0ec9l8rERqGJTJ/fXGr1jcXZ0Zw5uDVkpsn0h/TF+IZjTiBVJ
X-Received: by 10.37.219.83 with SMTP id g80mr21781394ybf.201.1516301013966;
        Thu, 18 Jan 2018 10:43:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516301013; cv=none;
        d=google.com; s=arc-20160816;
        b=bzyFeNjQHqOTc9QWsoyfQISCtc5vfjSrS6LFtinJQ2SZPNm/igiwOfExvvZ7IdlMn6
         biLaW/S0IjdLHIs1YTQhlMiokKZSRyxFO1nlGYPNE1IWInzLX/JLFpeNXOWEM9AlXaHj
         OvSBO4vCgD5bn4+FQmpmAiyrWmf1qat/BhbDN0B6DDH/sI3ThjZIw74mExmZXWy0GYVN
         xxO/EjtOax0QeR5NNdutmaNFBq842koLkfBpBNfv6Cbtq9zRdWRYOOv3dSEsnDfjqZXb
         uLRzs/rjqEFfAJ5Ffm1f/cz0KQOsLJLZXMAnCYT+axO4veW3zzExzL+eSolFCmHUgAk3
         5SJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=jnjZxUo6DdDuRrFsJf0BnqEIpqJuKubvBWE4IGEwKHg=;
        b=npKO8pxxbnFboGmJCy72HgIfnzuBg5WT1zRNNRQfubMGaAUhIjwxOQw2pggtPkjoik
         YBAIgy1YjnX/nS02vbbLchF7iIJItVyNDkqkpaE/Nciysm0jvi+OxV9U6BHm7iYYFmo4
         fye6zGUVpk63JuGjC1pvVE4S36hjKIQ0VjP89KDXfj6puM+q5UYsTYuqszNomxsPxaVd
         ASbuYHqRzjbs3/3CPYL+aT321p7W72Y62kWvuZvNhCcNe5fq31EKjlprEgj7R5j7nW4c
         BmCIbbXRcWuTajlWyF7m8oKeO/3ftc0k1UzWzEXC0GvFf4ctwW1uXmZtoHGdoPP0WLao
         m51Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gfmiMoiS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x133si1850291ywc.605.2018.01.18.10.43.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Jan 2018 10:43:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gfmiMoiS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47219 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ecF9x-0008CU-Au
	for alex.bennee@linaro.org; Thu, 18 Jan 2018 13:43:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41484)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ecF8j-0007TT-F0
	for qemu-devel@nongnu.org; Thu, 18 Jan 2018 13:42:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ecF8i-0002qj-Hv
	for qemu-devel@nongnu.org; Thu, 18 Jan 2018 13:42:17 -0500
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:43203)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1ecF8i-0002pf-CP; Thu, 18 Jan 2018 13:42:16 -0500
Received: by mail-pg0-x243.google.com with SMTP id n17so7420221pgf.10;
	Thu, 18 Jan 2018 10:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jnjZxUo6DdDuRrFsJf0BnqEIpqJuKubvBWE4IGEwKHg=;
	b=gfmiMoiS8eBbJEVTQFXDPAmulJ28CX313BFYhVnVRD/YVMplCB8j990j4IIO1BsT2+
	/z9vfeMT3nWzPCooXhAG3NHDV4qZ55avt4KuZGpfQ1cDiz+6oUKl+SFpU6aJgDL/uxPe
	lWSVNEAs1ymtunWICPvSVrxhUDJtEuMXDoa51istEsgArOceP3nkru0XpNC+GH33GMkn
	+14j3R7agFnsJj2PBdvDvl9SDXPMOFYGdM8+tvWacZ5aUQtx/3PteQjDvUy0ti7bFETV
	t+lZ3U+3yFU3GWCmzNpYZeRrwANj8ryj0/6Rh9saLGJjMYy1w70quA4g9COd/gNAyFTl
	10fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=jnjZxUo6DdDuRrFsJf0BnqEIpqJuKubvBWE4IGEwKHg=;
	b=LGk8NzTRmwJ3rUWYUCwDc2eXHjWPYQdjUUVPj43bK/AC8wH2KroNapavIAQYVURqUB
	rxwvoBUmM+3OLEVSH6LQKW72ob+fg9cyOIb9W55jkHQi2Vr6n7H5iaMzXNmT2wjWPHYG
	ji5m+8y1H6k+1OixZZYwnKP/TTAE9YqI7OMcdFb322NmfcnYu4uejNpDuELmKxnmE5te
	9ZhcHwnhQ/rP1Pg6fTx9U5J5o+O2cBsOg7DEnIpVf9NCNabr/582aUAb6/NaUp/B4QBe
	HbfYcwwSFCKYPJcYyMxhsX3LjysNOM1SJU/wgwaWoHIMcde7amqdpRW28gML506s6NnN
	s8Aw==
X-Gm-Message-State: AKwxyterlPHVCULphDoLWtRYhmxTBDyzsgwnKeOyrTcy1YkrG31a/Ydp
	DxbXKCxsylg0SeJX738OJqZqnuFExaA=
X-Received: by 2002:a17:902:59ce:: with SMTP id
	d14-v6mr234424plj.36.1516300935060; 
	Thu, 18 Jan 2018 10:42:15 -0800 (PST)
Received: from localhost ([149.199.62.254]) by smtp.gmail.com with ESMTPSA id
	u71sm9896785pfd.37.2018.01.18.10.42.13
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 18 Jan 2018 10:42:14 -0800 (PST)
From: Alistair Francis <alistair.francis@xilinx.com>
To: qemu-devel@nongnu.org, edgar.iglesias@xilinx.com, edgar.iglesias@gmail.com
Date: Thu, 18 Jan 2018 10:37:49 -0800
Message-Id: <3ddf66fa53e18ba941908bdba5e056e67ccf854b.1516300623.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1516300623.git.alistair.francis@xilinx.com>
References: <cover.1516300623.git.alistair.francis@xilinx.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::243
Subject: [Qemu-devel] [PATCH v6 1/9] microblaze: boot.c: Don't try to find
 NULL pointer
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
Cc: alistair23@gmail.com, qemu-arm@nongnu.org, alistair.francis@xilinx.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NARAfcmqW3pU

Previously if no device tree was passed to microblaze_load_kernel() then
qemu_find_file() would try to find a NULL pointer. To avoid this put a
check around qemu_find_file().

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Reported-by: Peter Maydell <peter.maydell@linaro.org>
---

 hw/microblaze/boot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/microblaze/boot.c b/hw/microblaze/boot.c
index 457a08a2fe..35bfeda7aa 100644
--- a/hw/microblaze/boot.c
+++ b/hw/microblaze/boot.c
@@ -124,7 +124,7 @@ void microblaze_load_kernel(MicroBlazeCPU *cpu, hwaddr ddr_base,
     kernel_cmdline = qemu_opt_get(machine_opts, "append");
     dtb_arg = qemu_opt_get(machine_opts, "dtb");
     /* default to pcbios dtb as passed by machine_init */
-    if (!dtb_arg) {
+    if (!dtb_arg && dtb_filename) {
         filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, dtb_filename);
     }
 
-- 
2.14.1

