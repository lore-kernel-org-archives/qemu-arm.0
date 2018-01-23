Received: by 10.28.71.27 with SMTP id u27csp4145629wma;
        Tue, 23 Jan 2018 07:00:25 -0800 (PST)
X-Google-Smtp-Source: AH8x226M1Vwz/96Rx38nipnfzr7RdhCt6BzNTwkZZDvjtCJAHOXk7+m6zcUcDtBhS4f7xLHNpRFL
X-Received: by 10.13.224.6 with SMTP id j6mr2676949ywe.484.1516719625757;
        Tue, 23 Jan 2018 07:00:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516719625; cv=none;
        d=google.com; s=arc-20160816;
        b=ML/yP7eedyRmJ3PVD5TDkKICYDsg0NH6E6KTDkV+lncFJ46QbWtIJJ8rRdXf7WqqaR
         Sw9/AGlBYJ9xL1SfWZMf+SG2gvb8ENL9DkCVMzlW4Ik4pHdHG51LntME89wodX3RV3y0
         lDVKdI5te8DsWXvY1Wr9Ppwtoj2dqRxu0VmbKuUD9pvnyORGFyrpppvVIL0Ae6nA7xKI
         xGBsJIPubzjfg43Z2BHNYvic7B/VtaFRqCFvwMCbPRz088v/1ZcLfhT9PcefCGyVFZSC
         vHgCnrHhS6VrDWA6bE/sBSCUmee+TdbymYLQH6F4LSz+bd8OeWjIa2YrECpAYckyhx2V
         mang==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=OO7IOEVHKU0zW67RebaFImuEQvXXUTHJp8DbB94rL1Q=;
        b=yNbRz8W9jCxt2G0lp8iwTCTR07dAcShje9j9N39LTnMdyxiwzRTJehctED4zITHLbN
         f/m6ZSk1Zqlp57gXbquKSNASLCU1rOoii8ajnSgTHhlcST3o9keLYfOhRtlyS9MtvCUw
         szE7BqQHvvkNd4o0C58V1W6nDwzpvSgQBwZEoGPBrn6vEP0Vh9rskA/sgww+/apTAugc
         mNIqVftdl8Uhc4XMRz08l4wSEC4gcgyA3kZE5lIisLNXv9Rc/zawMCdWUjU0TrFzFS/w
         T47A44kgKpJEuyNpdyDwUmDjKvauLLSHvNcFU6/TXvkPQfk8Bf8hQtCegMilMOixKfri
         wZYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=onPkjjrR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r8si4146954ywe.73.2018.01.23.07.00.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Jan 2018 07:00:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=onPkjjrR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33800 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ee03l-0000Vb-4C
	for alex.bennee@linaro.org; Tue, 23 Jan 2018 10:00:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45561)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1edzwE-0002Nk-AY
	for qemu-devel@nongnu.org; Tue, 23 Jan 2018 09:52:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1edzw9-0006xs-Kh
	for qemu-devel@nongnu.org; Tue, 23 Jan 2018 09:52:38 -0500
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:40444)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1edzw9-0006xO-G7; Tue, 23 Jan 2018 09:52:33 -0500
Received: by mail-qt0-x243.google.com with SMTP id s39so1877343qth.7;
	Tue, 23 Jan 2018 06:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=OO7IOEVHKU0zW67RebaFImuEQvXXUTHJp8DbB94rL1Q=;
	b=onPkjjrRDaIJM+Vi1ZKqEB617PPlej6yheXRpzygIV1xRfiZ4HnuKj/VtcyK78hx0s
	h/tnQHZOnMG8CnUrXPINkR/NcgB7ow4mFuStxwtiZ2WNwamEpeStYmPD8MmPaIZ7NJoV
	ipVgeHbeV7FbPKICadQR3mEy8VD6yC42m+9YxvqGAf50vtJJVRX6dZEDVzSFYq7pt+nc
	mWhvmPuHIn7dmjwOfMmKHHsjMN1QkBCq4aZQEfma3rEX6PuZ8jZLlbkzMuAoCv9Pcimq
	86PM2Ypb4fUBeOnuMeiSIX7I5eg/9Kip0bRSrKn9JC4a8rvD3gl46UQT0Z2Sebw0Bun8
	77Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=OO7IOEVHKU0zW67RebaFImuEQvXXUTHJp8DbB94rL1Q=;
	b=NEXDaX3Blkt1TNELt3BICfVXBMdZS02avOxbjKHXxtNh/qCYavuJ22RfoqteKF8V0T
	y3nNlA+XWWL3x0anPB16ND4nrtWHLowwAD+OLxn7ZHJ4JBD5BtNOLMn7CtXi3Ztp6SNi
	Pabs8UbIC3ppMeNXWpLEteow4eEk32lZD+2NpbTMSJmLySlOuPe1j4PgnEdnT7V3WySM
	Yd7vwyrqb1pzeBLLPv7mVUmRKuvqIQHFcBDrd3UZMRo8/BLfbZCqMOC34mDT5SO9ljvR
	tFYQznjcYTOu0vyMZEE7KW2KBR0xCFG+nfochuPtOt9yK51m8iHmcdjzOjs5lMfCmTdT
	NvCA==
X-Gm-Message-State: AKwxytcB6FmUKTZMwyt8nJo9M6q79bgA4wAF1NKU+/0yzwMgJsKkPzFm
	+EQkbDUAfPQf0Clpvo2xTrM=
X-Received: by 10.237.42.198 with SMTP id t64mr3914653qtd.177.1516719151344;
	Tue, 23 Jan 2018 06:52:31 -0800 (PST)
Received: from x1.lan ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id y30sm394574qtm.50.2018.01.23.06.52.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Jan 2018 06:52:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
	Laurent Vivier <laurent@vivier.eu>, Riku Voipio <riku.voipio@iki.fi>
Date: Tue, 23 Jan 2018 11:52:22 -0300
Message-Id: <20180123145222.2487-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-devel] [PATCH] linux-user/syscall: let recvfrom(struct
 sockaddr *) use abi_ulong
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
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CtsnrDRFS4xD

Currently recvfrom() is restricted to handle 32-bit pointers,
remove this limit for 64-bit hosts.

This fixes:

  31572 socket(AF_NETLINK, SOCK_RAW, NETLINK_AUDIT) = 3
  ...
  31572 sendto(3, {{len=124, type=0x454 /* NLMSG_??? */, flags=NLM_F_REQUEST|NLM_F_ACK, seq=1, pid=0}, "op=test:message acct=\"?\" exe=\"/tmp/nl-bad-addr\" hostname=localhost addr=? terminal=/dev/pts/2 res=success\0\0\0"}, 124, 0, 0xfffffa3897d0, 0) = 124
  31572 ppoll([{fd=3, events=POLLIN}], 1, {tv_sec=0, tv_nsec=500000000}, NULL, 0) = 1 ([{fd=3, revents=POLLIN}], left {tv_sec=0, tv_nsec=499993180})
  31572 recvfrom(3, 0x112a50eb4, 8988, MSG_PEEK|MSG_DONTWAIT, 0xfffffa3897e0, 0x42) = -1 EFAULT (Bad address)

Reported-by: Guido Günther <agx@sigxcpu.org>
Message-id: 20180123120541.GA14216@bogon.m.sigxcpu.org
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/syscall.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 11c9116c4a..28805b1785 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -4032,7 +4032,7 @@ static abi_long do_recvfrom(int fd, abi_ulong msg, size_t len, int flags,
     if (!host_msg)
         return -TARGET_EFAULT;
     if (target_addr) {
-        if (get_user_u32(addrlen, target_addrlen)) {
+        if (get_user_ual(addrlen, target_addrlen)) {
             ret = -TARGET_EFAULT;
             goto fail;
         }
@@ -4053,7 +4053,7 @@ static abi_long do_recvfrom(int fd, abi_ulong msg, size_t len, int flags,
         }
         if (target_addr) {
             host_to_target_sockaddr(target_addr, addr, addrlen);
-            if (put_user_u32(addrlen, target_addrlen)) {
+            if (put_user_ual(addrlen, target_addrlen)) {
                 ret = -TARGET_EFAULT;
                 goto fail;
             }
-- 
2.15.1

