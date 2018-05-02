Received: by 10.28.4.212 with SMTP id 203csp1219904wme;
        Wed, 2 May 2018 15:16:49 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrySfbu9o+HPYK9S0MaBCMtBmG6ESeHSRQmma7eKVEG0goCdN6XuPTWwugWUGXf8mDD2WMr
X-Received: by 2002:a0c:bfaa:: with SMTP id s39-v6mr17161611qvj.185.1525299409531;
        Wed, 02 May 2018 15:16:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525299409; cv=none;
        d=google.com; s=arc-20160816;
        b=ZasHCje3iYUIvVZDKHDW1ZMjf3PwdxIrwSpSf/N5Rs2PzPnrcez/P5DwMosO7SVwxI
         rk5e8iUtilU4pjYUEGWXgqDR54lADmhjvcg/IWiusEF2BRwUO7F7bmHidc/JRla8MLpL
         iniGT9FtcdpE/q6MGL0nHjpBa/Dwk5JjcQ+rHXJ+pEQgztgL0dbcVdY0Whoov7/rSp68
         8n0OEUIGUdTBQ35Y4Qyn+65flkDvCMHzFfa/yrML9dpCDqy/YUqj9yT3c7HIpTqEeJ7Y
         OJrS015BnLrgLH5vpkaQrVZabETLC+1KlY0DjVZ/qzPHVTNwzfgLbhmvjs/PaJ6NvaVT
         LS4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=jJ3Mi/VIDbSyzjOF0EkhAkrHQYKwkOKZD5pA4N3ndMA=;
        b=DUy0+ME1zlAUoCjDVnk6/1c55YD4b51N1N4yJ62E9BYpmlMsi4F7kL6ZcsWiLynixp
         pBfHGfQ+AUOcN147f4xpt9h26zRobZIrARSVhnPpClQ1WJ4z/8IFSPcUi4Ez2/6bHdVr
         20+IlloRzez+sRnUMM3hEy/Yq7bf8DW7UArxnNdx20NCmWDVgtk83o+EQD9MxpyxD1s9
         H1Wg0yU9uIGVbJZZl9new4RbAMCNovZaByxa+m7TDtVSFF8zYK7m8J0b9uaHSNOUHHnB
         8hiUdQVEnmKhXSIS9rJbKQtjc0q9GiA2S+OrFO1g4YhZr/o477hempkCa31UdeRg2Rah
         YY4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FcP8KXvs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l32-v6si2284114qtd.355.2018.05.02.15.16.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 May 2018 15:16:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FcP8KXvs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52780 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fE03N-0000bF-1z
	for alex.bennee@linaro.org; Wed, 02 May 2018 18:16:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58574)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fE02Z-0000ao-DA
	for qemu-devel@nongnu.org; Wed, 02 May 2018 18:16:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fE02W-0007nk-CN
	for qemu-devel@nongnu.org; Wed, 02 May 2018 18:15:59 -0400
Received: from mail-pg0-x231.google.com ([2607:f8b0:400e:c05::231]:37874)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fE02W-0007nJ-6F
	for qemu-devel@nongnu.org; Wed, 02 May 2018 18:15:56 -0400
Received: by mail-pg0-x231.google.com with SMTP id a13-v6so11633294pgu.4
	for <qemu-devel@nongnu.org>; Wed, 02 May 2018 15:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jJ3Mi/VIDbSyzjOF0EkhAkrHQYKwkOKZD5pA4N3ndMA=;
	b=FcP8KXvskgQMjs1Xvdf19wfyp+udQgf0MkAuoB5BiVWo7J3b+CCWhFdZ7NgSXS2c/Y
	k7C9JYZ7id+Jfg/urLqnJ508A/RZmrPs0Y8J6FlfWQPQwSonHoXk/bl2AODLfX7lIMQX
	0x2FWhEMYhv5XupDLh1gAKbHyV2GvTBScv9sI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jJ3Mi/VIDbSyzjOF0EkhAkrHQYKwkOKZD5pA4N3ndMA=;
	b=Op6cvXeBVnF/MKCEH2Jbdd+WSE0MLqSpEVcIWgvmbexV4tq2uGYq9d5LbTro8+diCV
	cA1XbP0cudAdXJW/oNu4C1lvnWMw4kt0ZSbzawpclAKkF79FsfoePUXg/lPslQVTLgX+
	NrgHkfT3+/Ze02dJHHNUOq0ipiAq7E+iCHg3pGnkO7tazeGsH3BEvFC1DKckfp3nZBZi
	LRXSUpKgPYw8Gkeavr0KIHEuqdZbZrFZULIQp5A6s/5L3sTac93HbsMEVsDE/qMQXMDj
	w2OV1943AHZlpA3nDoETf4ZUuO3Bs5HQkOYUGh5DJHl/FXdyJRH+tmnvbsMmiPCxDpZt
	Nf+w==
X-Gm-Message-State: ALQs6tBAFUrmIkmNGJHHOAJQWwpWBa2EbYHtbIHijMCIUF47DC6PhV8T
	WChi7RCdu6xJFHyNoh3+ogTI21GaW7k=
X-Received: by 2002:a17:902:d808:: with SMTP id
	a8-v6mr21771558plz.177.1525299354841; 
	Wed, 02 May 2018 15:15:54 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	65sm26170145pft.74.2018.05.02.15.15.53
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 02 May 2018 15:15:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  2 May 2018 15:15:38 -0700
Message-Id: <20180502221552.3873-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::231
Subject: [Qemu-devel] [PATCH v2 00/14] target/arm: Fixups for
 ARM_FEATURE_V8_FP16
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NzNQlt0g2G7o

When running the gcc testsuite with current aarch64-linux-user,
the testsuite detects the presence of the fp16 extension and
enables lots of extra tests for builtins.

Quite a few of these new tests fail because we missed implementing
some instructions.  We really should go back and verify that nothing
else is missing from this (rather large) extension.

In addition, it tests some edge conditions on data that show flaws
in the way we were performing integer<->fp conversion; particularly
with respect to scaled conversion.

Changes since v1:
  * Rebased vs master instead of tgt-arm-sve-9.
  * Alex did some additional digging through the ARM xhtml
    and came up with some additional missing instructions.
  * Everything cc'd to qemu-stable.


r~


Alex Bennée (4):
  target/arm: Implement FCMP for fp16
  target/arm: Implement FCSEL for fp16
  target/arm: Implement FMOV (immediate) for fp16
  target/arm: Fix sqrt_f16 exception raising

Richard Henderson (10):
  target/arm: Implement vector shifted SCVF/UCVF for fp16
  target/arm: Implement vector shifted FCVT for fp16
  target/arm: Fix float16 to/from int16
  target/arm: Clear SVE high bits for FMOV
  target/arm: Implement FMOV (general) for fp16
  target/arm: Implement FCVT (scalar,integer) for fp16
  target/arm: Implement FCVT (scalar,fixed-point) for fp16
  target/arm: Introduce and use read_fp_hreg
  target/arm: Implement FP data-processing (2 source) for fp16
  target/arm: Implement FP data-processing (3 source) for fp16

 target/arm/helper-a64.h    |   2 +
 target/arm/helper.h        |   6 +
 target/arm/helper-a64.c    |  10 +
 target/arm/helper.c        |  87 +++++++-
 target/arm/translate-a64.c | 535 ++++++++++++++++++++++++++++++++++++---------
 5 files changed, 532 insertions(+), 108 deletions(-)

-- 
2.14.3
