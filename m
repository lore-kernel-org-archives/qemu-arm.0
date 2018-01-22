Received: by 10.28.71.27 with SMTP id u27csp3197004wma;
        Mon, 22 Jan 2018 11:48:21 -0800 (PST)
X-Google-Smtp-Source: AH8x2267PBsjK70fcNtV5T9xqQUTODNav3vpg9xRjqyJhXD/+Jip7W7BTGeCWvevLnK5WSF8k53K
X-Received: by 10.129.118.18 with SMTP id r18mr12330ywc.96.1516650500965;
        Mon, 22 Jan 2018 11:48:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516650500; cv=none;
        d=google.com; s=arc-20160816;
        b=awvA9oOQu36VUpmr55Az9vB+E0kFdKPW1IFAhp8Cnn+nwqTT145OTmgI1S15Z0eS3T
         98xZgcLY/Py+MSFla2UkDlMLvD5ST/W+v1j/xyd/yWFWT5/g2IJOhpcgZJrixI4K/lmm
         /VV5gNvR0xEwhDWo6liU4ZXvr1L9yJst6c2Ss66BWTRxAW7hg1ipAdbPNc4/OK9OLLe9
         BNnc8vQ3tUbv+TCf38Xc8x+RNLh6EcOF06/i6KFHAXuesFNf9iOthIvB1WxPRn/Nc0wp
         Kxh5iHxJNHig/u7H3rkV+/xoDqxYV9ePE+8PE3Kobd6U+WWxqCk3xj/Vm3OVJMG2GqAy
         0PpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=BDDG8Xz03COM+89QzfPV0TQGkFrkjTbvo09xeOTyOnY=;
        b=pgCjgt6D5jFlWIyTOG+C2M+QqJTv14LZYYuWJj5O0TkRrdNWIazqCEQFNDVo6jZFK4
         DjWD0AZqVuN4XxT0tNl2Khr8fkaYCePGnIBYHFhnE5QM6/eXkJ7gkU/xoLH4hp7ohLyf
         Yk/naeDIhwwySX3QVRM/usYkb4oyMxyGE8NbnTA9f2vyTS/zSgSidg6tA6OUSzbM7LPY
         XX4s9bstRZV8/Ukfb/mXANZaSBRmNofkmcOr7CqyxLayTHchKsHc0zO5vAjYDorDQOSI
         MCbyje/3znmusHXHQbC6bOVTv5Xb4aP5jZ5M/Z7Dd/X3LJ8uryzvFXV5XoWYcAEL88FU
         EVnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=C0pmQglx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l16si3769860ywm.219.2018.01.22.11.48.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Jan 2018 11:48:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=C0pmQglx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33686 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1edi4q-0006md-8S
	for alex.bennee@linaro.org; Mon, 22 Jan 2018 14:48:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47814)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1edi4F-0006li-AO
	for qemu-devel@nongnu.org; Mon, 22 Jan 2018 14:47:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1edi4E-0005kQ-Dp
	for qemu-devel@nongnu.org; Mon, 22 Jan 2018 14:47:43 -0500
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:33537)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1edi4E-0005j0-8T; Mon, 22 Jan 2018 14:47:42 -0500
Received: by mail-pg0-x241.google.com with SMTP id u1so7889315pgr.0;
	Mon, 22 Jan 2018 11:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=BDDG8Xz03COM+89QzfPV0TQGkFrkjTbvo09xeOTyOnY=;
	b=C0pmQglxd2Cz8/epOtRA+Go38XyWgBEWymbq8xiL8Z5gMoHPMeQcVPSr70fsADd06p
	pGr+D/ApvRYNqq5qYmUjI4eaSezCkuMLpOp48i2QrBIom5LjxqrxAiBYHNtvvLZfMJoM
	6URwNess1MVaEV9LyD/v8zYDRKSdfzce5It+HpDpQ9tCXKFb/9eJ6GrGbmNANxrZVrQ6
	vUlLtZQWQmULl/O7E0DnsE2dpSCfHA9SdPkGM/7jnzwdVC/pjaHW0A4aOW39P2Irffrw
	ilG2GmmrghFoj08tkLa+bb3TB1Q3vP4uR9jmDh4/a4XP54Hwk5+4MrHE6gMYVLOHZI16
	mm4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=BDDG8Xz03COM+89QzfPV0TQGkFrkjTbvo09xeOTyOnY=;
	b=Q+7rDoiw97/EnJvE9Z1Fs4VPuy37vtQvYdZWLssCjOeXQy2zh+OWwmG0Q9IUa/+9+l
	eGxdAOKgYDppPiTNiV2X3Vi9kd868v+/51zvvYM6M0kscbQi/lzk8/cRlqWtwCHUWDRj
	0tqGN7uNVpGFJqJgDRtAF8b+JVz4FWZ6Vt0hLHR/im0nXpV3fic0ulb2hReZtWlPycM0
	B4twOee4jCQdGe8Vsosj6pYPOsmrBr6CqHt0ImqhOvBtHffiEYon1/PFL0UfMdzJwZ7K
	qjWnowLYm/WXF4MYes8qJZIW/5ljjZ9X/ouPMkWDBjoKLkzjGJKc2XbxbVkZy9h/bpxw
	lUpQ==
X-Gm-Message-State: AKwxytcALnWrOurbYNcM4ks1qQpFUCb4fhTEBs7bpdAhDHzNlr82/beU
	6aCtUyf1n0F0oa66Odc8H4GAu6fT
X-Received: by 10.98.141.199 with SMTP id p68mr8650908pfk.25.1516650460725;
	Mon, 22 Jan 2018 11:47:40 -0800 (PST)
Received: from localhost ([149.199.62.254])
	by smtp.gmail.com with ESMTPSA id 8sm2435995pfh.170.2018.01.22.11.47.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 22 Jan 2018 11:47:39 -0800 (PST)
From: Alistair Francis <alistair.francis@xilinx.com>
To: qemu-devel@nongnu.org, edgar.iglesias@xilinx.com, edgar.iglesias@gmail.com
Date: Mon, 22 Jan 2018 11:43:16 -0800
Message-Id: <dc02ea064f789c5120db0f0a00b45c6ad45d61b6.1516650109.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1516650109.git.alistair.francis@xilinx.com>
References: <cover.1516650109.git.alistair.francis@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: [Qemu-devel] [PATCH v7 1/9] microblaze: boot.c: Don't try to find
 NULL file
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
X-TUID: cukIWM+RIeXV

Previously if no device tree was passed to microblaze_load_kernel() then
qemu_find_file() would try to find a NULL pointer. To avoid this put a
check around qemu_find_file().

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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

