Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp700414wru;
        Wed, 1 Aug 2018 05:34:05 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpff+qjdiXBhY6bDfeuPEYxIWijDiySwqA5khBBwkG/ceysWuZwj/GnOdMC6mVMMEew6KSVr
X-Received: by 2002:ac8:43da:: with SMTP id w26-v6mr16853636qtn.137.1533126845038;
        Wed, 01 Aug 2018 05:34:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533126845; cv=none;
        d=google.com; s=arc-20160816;
        b=jZmjfx/90FD1GxjG6j18GMZ4cV9D+VsUole+fjYhuYQMY201fR62obZ+eZh1lt6GYc
         9LLePmv3peZq/DXIX7UBFLsb36REe4UEs58EuVEZelQFrvzRffBNf/vj8EtBAmDnnw69
         UmbjL4MUJbLRJGWNzzTa4aoP4FTJmJ55ab0BxEeB4HMdU52Ru5rBWOFlr05UR82onk7M
         eIf3vFcXKSBmg6NSQvM9QE/h/NAZdwkyXlZWSlfjZI7e5uEhYWeVnlIvD+0H8FJL3WcX
         p879YpXbk8cr4zokrewJBJ+FWzKVG2Wvg+xExhCluO9gwJfmit/FIu8F3ZTNRtVsCFMQ
         LZOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=GwPY6gVFdvr+UurE88kCGyUfc6NtbP71iOkSJDm1FTA=;
        b=QIsEhX3PcnIveNpaJVmtE2oAOhbwKmwoT4QbDUasTYdxmn69Mg71f5XzUt1L41XvCt
         UoecbareCmEjBsFDiHpGtQGpNUYbfyDYDAZNL63+aRJyUVxdeAiQLubtg2n6ElJGGDKJ
         hdqJOyOprET2DCk3bSzKGoYRGoaCTGU0zBduaJ5lRm+4QU1ZLVT0jfLLSoZp+q24r8uM
         vL+6aGnM5U+yPTVZCs3G/dlCjDNiGtJV5M3uF7nqAIoMrKNNGik5kibQWwHVWmcq6yFV
         cB4Dx9UtnuidZwlCni0H7jhy6pf6VxAvUeKelU81WyowpvprEw7NrHLNOvhLvQj7wgMV
         kCPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=b6Sa58PU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d19-v6si9156915qte.348.2018.08.01.05.34.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 01 Aug 2018 05:34:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=b6Sa58PU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39616 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fkqKK-00076L-Fg
	for alex.bennee@linaro.org; Wed, 01 Aug 2018 08:34:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52110)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fkqHh-0005lJ-R6
	for qemu-devel@nongnu.org; Wed, 01 Aug 2018 08:31:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fkqHe-0004P3-ON
	for qemu-devel@nongnu.org; Wed, 01 Aug 2018 08:31:21 -0400
Received: from mail-vk0-x242.google.com ([2607:f8b0:400c:c05::242]:36466)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fkqHe-0004OQ-KQ
	for qemu-devel@nongnu.org; Wed, 01 Aug 2018 08:31:18 -0400
Received: by mail-vk0-x242.google.com with SMTP id y9-v6so9179668vky.3
	for <qemu-devel@nongnu.org>; Wed, 01 Aug 2018 05:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=GwPY6gVFdvr+UurE88kCGyUfc6NtbP71iOkSJDm1FTA=;
	b=b6Sa58PU0t4nCKopl0CySkNMO2tC7WHZVs8GRUXIgTe9GgVpRH7M7bm5wRtX7cvSOD
	WpUH9lslBqax1FDm79NBhwY04nzwnlxu86823B5RQS7wbjo9fqBTMs/xxi4STyfJIcKl
	7qU2WMX2J50peaxIJA2utvGSgGeFv2FwZDIR8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=GwPY6gVFdvr+UurE88kCGyUfc6NtbP71iOkSJDm1FTA=;
	b=LSoFCGx9IHH2gYH82tyxWYtFZqcpr3s7SnLRpi5RpFCN2wrMGuVfizzEN19HeEOUP7
	cxsViT68AoxEGHvOxjhdWhT4nYXsrJxmjonQL/jjvNpGbUUaKbCftLd9aTidbSg4cpZf
	nNdZ9VgtalgvsGAvra4wOpGosa9xyuCyoky27MrWJAGg7WGXNb8Z/glq5/SMvS8Exngf
	hY/x7R2lZF9mvU1kovu/YzJjXGO1xwT/lGJLCtCl4L4iSA16FBkUdgQr8o1MuaMmromP
	XJU8xiy1nseqEVQKxMbRSDvzoXqJlnjPeJqTOoTLZITPpQsNASxRkX5D1l1EbJIYHspv
	cSlQ==
X-Gm-Message-State: AOUpUlE+TtoPOepRWsTpl8S2ZehwG4w+3GRfs6wTEMJ1A40IKOn2vRDN
	sXMrLcz4TLwlbUeRHWj8qM4xDfOsS/M=
X-Received: by 2002:a1f:cb83:: with SMTP id
	b125-v6mr15743229vkg.68.1533126677609; 
	Wed, 01 Aug 2018 05:31:17 -0700 (PDT)
Received: from cloudburst.twiddle.net ([190.166.236.188])
	by smtp.gmail.com with ESMTPSA id
	f60-v6sm4247847uaf.10.2018.08.01.05.31.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 01 Aug 2018 05:31:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  1 Aug 2018 08:31:07 -0400
Message-Id: <20180801123111.3595-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c05::242
Subject: [Qemu-devel] [PATCH 0/4] target/arm sve fixes
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
Cc: laurent.desnogues@gmail.com, peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BZO9pnhL+FG6

These four patches are minor, reported by Laurent this week.

If there happens to be an -rc4 release, it would be nice if
they were included.  But if not, no biggie.  I suspect that
other minor issues will be found past these four, so I would
hope everyone who cares about sve is just as happy working
from a branch anyway.


r~


Richard Henderson (4):
  target/arm: Fix sign of sve_cmpeq_ppzw/sve_cmpne_ppzw
  target/arm: Fix typo in do_sat_addsub_64
  target/arm: Reorganize SVE WHILE
  target/arm: Fix typo in helper_sve_movz_d

 target/arm/sve_helper.c    | 19 ++++++--------
 target/arm/translate-sve.c | 51 ++++++++++++++++++++++++--------------
 2 files changed, 40 insertions(+), 30 deletions(-)

-- 
2.17.1

