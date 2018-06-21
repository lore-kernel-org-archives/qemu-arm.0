Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2279517wrq;
        Thu, 21 Jun 2018 10:37:11 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIRqLEsreoQdUHL0JG9/DYWkx35FuTNufYtAE4KoEYTNSonlT3F6cw52jEn+DOKHahZrWms
X-Received: by 2002:a0c:b665:: with SMTP id q37-v6mr23565819qvf.43.1529602631229;
        Thu, 21 Jun 2018 10:37:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529602631; cv=none;
        d=google.com; s=arc-20160816;
        b=nkmArxWxSLOxX9TbRBJNpmZk8/F+/RZD2S/g2UlTNqj4b7vVV/msTm0PPt8iXh8qkf
         3aPAzRp1iBEC0O3JuhhyC2IQ1dt+LdKcKl8dLtXFa3yyIDedQTQ6gnOsOkI4GCV+R0un
         QvPlB5oHKE4nAFh86fd6F56oR5ltraYezVckWJwXV0Q2vbv6EIbVB+N40JDW68NmQ1bE
         bioGyVSYpl/NCgPwbSQpDhc4JYgQ24JivMyXEUUMIRPq8kQg0gQ9EYoA4UVWrsHv1X0j
         dFoZHrwmfKJKjiYK3fUVGF1daBvr4K5d0cEwfQlPjxjd75BwUufcWPcvKZDpfXaZUb93
         BZEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=mrdjd9hN4fCg0o8Qc2ICPeQVfMmlMnPEOi7KNHAfcBs=;
        b=jH1yBncEtRnQnvW2o4akDN5dGR9gBK1x98ydYpcBnrdQjTtJWFmIVBFA8Bzb9XWnBT
         G4pWvwEXI6j24j9UURgWJu2M9SeJzjONAhXvadvW5rG3/sTbJJREzjaYDpJXUAq4ZQ90
         nzJb9NEQlXFhNt4gUgvzcM+TA9Rl6JNRApGgmhvH/Fg7/0sd5yl4Xj+JPZ+fDevaiEUz
         cZOpYVtp/6aZruVQ5dgWNCYCJyPT3+05Wohc/UcYtbYvRlY5fKy2rE6CWPGYUet8CqnC
         RxR44533KvkUnWCevgfkqnfJ0S0QTJDIIKuKgn6cTZ9ZSJB5kfDX/KlysHrKCgXgEGIe
         bZqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BP7aChKp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f4-v6si4519384qvb.255.2018.06.21.10.37.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Jun 2018 10:37:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BP7aChKp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56908 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fW3WA-0000rH-Iz
	for alex.bennee@linaro.org; Thu, 21 Jun 2018 13:37:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54934)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fW3Vl-0000r4-LT
	for qemu-devel@nongnu.org; Thu, 21 Jun 2018 13:36:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fW3Vi-0004Kz-HM
	for qemu-devel@nongnu.org; Thu, 21 Jun 2018 13:36:45 -0400
Received: from mail-pl0-x241.google.com ([2607:f8b0:400e:c01::241]:39459)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fW3Vi-0004Kb-2r
	for qemu-devel@nongnu.org; Thu, 21 Jun 2018 13:36:42 -0400
Received: by mail-pl0-x241.google.com with SMTP id s24-v6so2050104plq.6
	for <qemu-devel@nongnu.org>; Thu, 21 Jun 2018 10:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=mrdjd9hN4fCg0o8Qc2ICPeQVfMmlMnPEOi7KNHAfcBs=;
	b=BP7aChKpqW9FRuFQoqcOKjRWPssM7lTvPDozihDEkxZ+ce8JfrE8YdlPxFegaBEJa2
	Ed5m9sYmfrhG5zYbZh5k4ZLKTuCB+jaOJ3awxB5VMT93QAlU+HyApzEVgVuwMedyXWUR
	kX//wnl1ritgHDzfmUzSlwnXsgeEovmic4Esc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=mrdjd9hN4fCg0o8Qc2ICPeQVfMmlMnPEOi7KNHAfcBs=;
	b=oBmiY6M65W1mvgsdh8IWlQV2efXXQSdtXCZ2Lp34ShbodQBhFazudUPH3LXQNZ+SY9
	sqG/k2bAd/Q6vZDKHf6WtCtIiFvFx79EmepNmpPSxHxP5XPfh5Yl4ohjMugKSGEvYa98
	vHcgx9a1V+K6b4UVd3qPa1jhsrot6Bv2auOMwZTk/+gznK2PS2cSXAiebwfHv2pt2g6Q
	zbcM+e/RL8HnAxZIs3YfflGDIIsn7LjiFwyb9BJeCW/sMne4Bsj6uE6CbgR9izFX/4zg
	qDKtfgDCNECK2okaMPo7PeFE+Iesmxcpp2exbFvR7osb9+X8Ubz0xvbJnex8XveEjnqg
	oCOw==
X-Gm-Message-State: APt69E1jeFdTGgd7goTiPaiK1SOueJGn+604rGjOpMZb0vNftij1KpbN
	Rxb0zRotEGMCCCAM5ClkdE3qD48RUUI=
X-Received: by 2002:a17:902:c85:: with SMTP id
	5-v6mr29661993plt.126.1529602600645; 
	Thu, 21 Jun 2018 10:36:40 -0700 (PDT)
Received: from cloudburst.twiddle.net (mta-98-147-121-51.hawaii.rr.com.
	[98.147.121.51]) by smtp.gmail.com with ESMTPSA id
	e192-v6sm9642897pfg.187.2018.06.21.10.36.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 21 Jun 2018 10:36:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 21 Jun 2018 07:36:33 -1000
Message-Id: <20180621173635.21537-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::241
Subject: [Qemu-devel] [PATCH 0/2] linux-user: Change mmap_lock to rwlock
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
Cc: cota@braap.org, laurent@vivier.eu, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Vp13gopq5NxP

The objective here is to avoid serializing the first-fault
and no-fault aarch64 sve loads.

When I first thought of this, we still had tb_lock protecting
code generation and merely needed mmap_lock to prevent mapping
changes while doing so.  Now (or very soon), tb_lock is gone
and user-only code generation dual-purposes the mmap_lock for
the code generation lock.

There are two other legacy users of mmap_lock within linux-user,
for ppc and mips.  I believe these are dead code from before these
ports were converted to use tcg atomics.

Thoughts?


r~


Based-on: <20180621143715.27176-1-richard.henderson@linaro.org> [tcg-next]
Based-on: <20180621015359.12018-1-richard.henderson@linaro.org> [v5 SVE]


Richard Henderson (2):
  exec: Split mmap_lock to mmap_rdlock/mmap_wrlock
  linux-user: Use pthread_rwlock_t for mmap_rd/wrlock

 include/exec/exec-all.h    |  6 ++--
 accel/tcg/cpu-exec.c       |  8 ++---
 accel/tcg/translate-all.c  |  4 +--
 bsd-user/mmap.c            | 18 +++++++++---
 exec.c                     |  6 ++--
 linux-user/elfload.c       |  2 +-
 linux-user/mips/cpu_loop.c |  2 +-
 linux-user/mmap.c          | 60 +++++++++++++++++++++++++-------------
 linux-user/ppc/cpu_loop.c  |  2 +-
 linux-user/syscall.c       |  4 +--
 target/arm/sve_helper.c    | 10 ++-----
 target/xtensa/op_helper.c  |  2 +-
 12 files changed, 76 insertions(+), 48 deletions(-)

-- 
2.17.1
