Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp4697993wrw;
        Tue, 13 Nov 2018 10:19:31 -0800 (PST)
X-Google-Smtp-Source: AJdET5c2Pu0VyqakaZZhxpS5xAAGV34uNcnjXmGBB8m/IYHXOw+gu2biBEw6/Q4pFVCNcGhC6mY0
X-Received: by 2002:ac8:2a81:: with SMTP id b1mr6167772qta.110.1542133171287;
        Tue, 13 Nov 2018 10:19:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542133171; cv=none;
        d=google.com; s=arc-20160816;
        b=ihKNgz/K/ZfZqqFvhYQW7706XdFrfP6CYADRr2Pj5bD3YvWncWj5qlhy7kC8dcYIf1
         ItR0KdFohUBUWcot8zrklyf/SjCaVlsBoi10xZLhZc5AZCIRdk1vFU6AuRnoUmDPB3ZD
         xV5UyhP4V/jHzmiHhHk2bXvLXW/WeVg9tycps+TEjfUg6JCNfaZTOskZP61j0LEiOJg5
         M38JLtZTRXTRXgXrZZGfO524TZEunds2poErzEWKPx1HKpGv5Re+pgGDLGfA14C0MAwS
         44x4ird60V1fMnTbRGxN4k7gUyAXFIfyyDTnSEFuSFvLYNtaI/6eLBPLYUt0doZR3vmm
         /5lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature;
        bh=F/r4v563c8olKIoYYxdRt/g3TiDRYae6w37kU+ienfw=;
        b=eJCsUPYSACCSI8TxwbwT3cN4iID5sNgWN+PImau8fMg1KOw9Jn0YqVCax2vOdLlFVd
         cWUXxFms0qTuhMsapvAcpq6MfgTksdadB7HJIzVH4VXCnUtVzXAtmiMqqt3Sr7vV3dA8
         PzLIl4JXafZjPGpRiBIc0UtytXyk9NVAq7vk8DMT0DdUM3GlekG5i7vp1rtAA9FoiyTN
         gqOv8Etg4LZrgR5AjKabJiRv33oLn5RxzMiY+gGpCHNJhEnKWxGRWlkYF4P4SuAXg/1S
         VfrMy4W/92V2BDNqTzlq5HiSTZcdclxfWj0T/fqQIQAvIQ55k70lu4dGVj+yttGEdn5A
         rcug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=d7magGlM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v60si7256350qtd.31.2018.11.13.10.19.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Nov 2018 10:19:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=d7magGlM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55585 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMdHe-00077H-JI
	for alex.bennee@linaro.org; Tue, 13 Nov 2018 13:19:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58346)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gMdEF-0003XY-0m
	for qemu-arm@nongnu.org; Tue, 13 Nov 2018 13:16:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gMd1Y-0007yJ-3y
	for qemu-arm@nongnu.org; Tue, 13 Nov 2018 13:02:55 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:55845)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gMd1W-0007vT-55
	for qemu-arm@nongnu.org; Tue, 13 Nov 2018 13:02:52 -0500
Received: by mail-wm1-x341.google.com with SMTP id i73-v6so7610548wmd.5
	for <qemu-arm@nongnu.org>; Tue, 13 Nov 2018 10:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=F/r4v563c8olKIoYYxdRt/g3TiDRYae6w37kU+ienfw=;
	b=d7magGlMgjj8bVhgxxVBVAYFd0GkQm6B4l0DmS/Q/J9SuF8/v/PoXBKCwk3hs3uxFg
	hR7xPTaiXuqoTF5RivwxjHRtyZRsQlOwXMYJgaxx6yfzhZaD2oRvkLCjuZesWnGW5tLX
	sPH769VvTnLz5DarYqymovgdczn+xx5u6jIgU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=F/r4v563c8olKIoYYxdRt/g3TiDRYae6w37kU+ienfw=;
	b=k1K6J5wRqByGnn2BPsM261QZF4XZsWVXCHUgkQroO5hd15pHThekkjV28r54D4Les2
	tB14YjHw5ZtenYqmHMiLswUwWng0jSYc5WBuXOJvITAsm5oPfRr9gDV+ovijG11iQagF
	6+VMowHUPvdlNn5kgp3W3Ipk8exHhkencXM4qRX7ocmLrEBMdO2Apng8DZvRFHF8A3OD
	QzSjuCieKDMMas/UBEfGWqKigdcS8fVMbHYhuBRQj7VXJlfGtvcDM8E/3FtYUyDyOeYU
	rbQvzwpW6CtOOHWKk9ScChOs9Pof2X71KJ6pbJ6aJ6mFXZUzRmWjCsLa7HERzatM5wu3
	CwJw==
X-Gm-Message-State: AGRZ1gI6HumbQ0Yt9+SKoZTIWqMqd4XjizsLLrcZC8IJuu2TTwNuhK83
	veYSAN8bYWH1ARbfDU2+W0oxaQ==
X-Received: by 2002:a1c:1cf:: with SMTP id 198-v6mr928713wmb.33.1542132164933; 
	Tue, 13 Nov 2018 10:02:44 -0800 (PST)
Received: from cloudburst.twiddle.net
	(26.red-176-87-105.dynamicip.rima-tde.net. [176.87.105.26])
	by smtp.gmail.com with ESMTPSA id
	j124-v6sm2715978wmb.1.2018.11.13.10.02.43
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 13 Nov 2018 10:02:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 13 Nov 2018 19:01:50 +0100
Message-Id: <20181113180154.17903-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: [Qemu-arm] [PATCH v5 0/4] target/arm: KVM vs ARMISARegisters
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ss8Zo9BLfxvX

Facepalm.  I managed to not push the v3 changes anywhere,
so the v4 changes were done on top of v2.  Ho hum.

r~


Richard Henderson (4):
  target/arm: Install ARMISARegisters from kvm host
  target/arm: Fill in ARMISARegisters for kvm64
  target/arm: Introduce read_sys_reg32 for kvm32
  target/arm: Fill in ARMISARegisters for kvm32

 target/arm/kvm_arm.h |  1 +
 target/arm/kvm.c     |  1 +
 target/arm/kvm32.c   | 77 +++++++++++++++++++++++--------------
 target/arm/kvm64.c   | 90 +++++++++++++++++++++++++++++++++++++++++++-
 4 files changed, 139 insertions(+), 30 deletions(-)

-- 
2.17.2

