Received: by 10.28.4.212 with SMTP id 203csp51524wme;
        Wed, 9 May 2018 10:58:46 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZoZxDaVrnO/o4035SxkVTqYhhr9F3be+o7jARdjbhAOrdBf8T9u7il+toUzn7Uxw43zJSSo
X-Received: by 10.55.170.204 with SMTP id t195mr38763252qke.54.1525888726249;
        Wed, 09 May 2018 10:58:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525888726; cv=none;
        d=google.com; s=arc-20160816;
        b=gScEggRTWCCSw3UlFaFMgdSdKnt37ziZGVYEb0PHO4HcXFzqzHVjQah3v6Ldy9LY40
         MabcG70lRqpKgXF9XseE1rrIvv2EKtG7yA7tXXC9SrhfuF+I0TqTWeQoV6FWsfhSQSbC
         q5MjHZK6ndCrehs6RPo6JDaa0V3O0U/Z5Amkn5HSVOV3K8mmGAPvcuKInBDWE7rddpYF
         da1GHjgXk5v/xM4PT4At2Bbdg7+zcbxOBNMPmafiwdAIJcFn8iTkTCcCcSm05WuYDDLV
         LrGYfgEqBgW9+0GCY04dPgUaFQ8OiOdjyDjmBtWP2z6JpZltlyXndasXYFrPgnNChEA+
         yz/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=GAioUsc1C1LLPac7W/bEA4orjitIu9soEw749saGkEA=;
        b=cNGkGodN1DXJa96rqpqoGTC8589E7BCEuBLD2jKM1BNUaiZyroCzj2xt/wENmPMaZ8
         ImEAJV4LaZiFWXInjE3+a+VOnN804KF1NJSBUtM7bWuf8wwT7UrM5SMrialN7ZrTXU1i
         ZfWUrLEs1bRhpF/n3ugojq3vR5Cu9HYhsJwqgkYJQ2C9QjGx9vBCycKCXXHgKVmXhuzG
         FBmFipGnzvbo8Dkfs0fCNox2YXPYQDaW4zDMC2GVjeAs4e8xbLZULeSF3p6mU4ZcSU22
         LM4VACX2UV4ilmgk3WLYuvxQAfDM+AmeW5+Za+Ll2Dxz5YOxL0NshLftPjlTtDqMe8T7
         msKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QaVIe/sh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p21-v6si9629qta.22.2018.05.09.10.58.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 09 May 2018 10:58:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QaVIe/sh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58108 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fGTMT-0000G2-Lx
	for alex.bennee@linaro.org; Wed, 09 May 2018 13:58:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47545)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fGTIw-0004Lc-GN
	for qemu-arm@nongnu.org; Wed, 09 May 2018 13:55:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fGTIs-00050j-Bc
	for qemu-arm@nongnu.org; Wed, 09 May 2018 13:55:06 -0400
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:36004)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fGTIs-0004yk-3e
	for qemu-arm@nongnu.org; Wed, 09 May 2018 13:55:02 -0400
Received: by mail-pf0-x243.google.com with SMTP id w129so20577167pfd.3
	for <qemu-arm@nongnu.org>; Wed, 09 May 2018 10:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=GAioUsc1C1LLPac7W/bEA4orjitIu9soEw749saGkEA=;
	b=QaVIe/shPKhKNIHf3WtW5AZJczBbdgXvDxtinDKNyys0bIBuskg7v1qQ1J8DWcXDOf
	SsZquveEMZk6oy0NSpSRZCxhSihQ9/1Eftuh+54NK9ePzXtxRzMVJm6JdoBFhAVQKg8H
	zLSfcUpv9RSx3d//hK65r5z6sz+Z0MH9LRvqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=GAioUsc1C1LLPac7W/bEA4orjitIu9soEw749saGkEA=;
	b=jxJmQS+Y32rBqCC+rQBeEMbLDwJ5SAvg+if1ZrjyGI/B4heqp+payXnuRPqwxLChXF
	H3Z6prr0wAq/5VWIsDovLNh8iXvt/5K+2LDkWyOt1s4bDCSkLt8x9aQr8hm4z9Py0BdU
	l3ill0YYNDwpqdOx3H/w3pqhmlmZlQ8Oym1EmVqzCKCEGbgC/y3PK/ff0OTmi7uf8KaZ
	3kWUiNiVixUIickQzngqOGNimFWcxEFGigrj4cY54jjUEMiQwDZmWUa3sQfF4htUQd7x
	aYNFxBkwAeSOJQsbmMQ+2sfNlS+/iquCz1paQ3LYUr8n9TKc9tahJpDQjX2Z2GK+yHTz
	NrRg==
X-Gm-Message-State: ALQs6tAOYtvWwarFwDedzvmXAcZKtaO9SRU0z1qvdT3Ef8UPatcQGiLt
	R7FY8r5D77650IGQVM1a7bRQhA==
X-Received: by 2002:a63:66c3:: with SMTP id
	a186-v6mr25524727pgc.408.1525888500517; 
	Wed, 09 May 2018 10:55:00 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	l90sm60332813pfb.149.2018.05.09.10.54.58
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 09 May 2018 10:54:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  9 May 2018 10:54:30 -0700
Message-Id: <20180509175458.15642-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::243
Subject: [Qemu-arm] [PULL 00/28] Bulk target patches
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
Cc: peter.maydell@linaro.org, Sagar Karandikar <sagark@eecs.berkeley.edu>,
	David Hildenbrand <david@redhat.com>, Palmer Dabbelt <palmer@sifive.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Max Filippov <jcmvbkbc@gmail.com>, Michael Clark <mjc@sifive.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Yongbok Kim <yongbok.kim@mips.com>,
	Alexander Graf <agraf@suse.de>, Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org, Stafford Horne <shorne@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Cornelia Huck <cohuck@redhat.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7GC+ZfvtIt8j

This contains two related patch sets from Emilio Cota, both
touching the translation loop for these 13 targets.

I promised Emilio that we'd get these merged early in this
next development cycle to avoid conflicts.


r~


The following changes since commit e5cd695266c5709308aa95b1baae499e4b5d4544:

  Merge remote-tracking branch 'remotes/cody/tags/block-pull-request' into staging (2018-05-08 17:05:58 +0100)

are available in the Git repository at:

  https://github.com/rth7680/qemu.git tags/cota-target-pull-request

for you to fetch changes up to 5b4f1d2db9fb0e24549054ee58c7a7d8f84ddd6e:

  target/riscv: convert to TranslatorOps (2018-05-09 10:12:21 -0700)

----------------------------------------------------------------
* Fix all next_page checks for overflow.
* Convert six targets to the translator loop.

----------------------------------------------------------------

Emilio G. Cota (28):
  target/riscv: avoid integer overflow in next_page PC check
  target/cris: avoid integer overflow in next_page PC check
  target/lm32: avoid integer overflow in next_page PC check
  target/xtensa: avoid integer overflow in next_page PC check
  target/unicore32: avoid integer overflow in next_page PC check
  target/tilegx: avoid integer overflow in next_page PC check
  target/microblaze: avoid integer overflow in next_page PC check
  target/arm: avoid integer overflow in next_page PC check
  target/s390x: avoid integer overflow in next_page PC check
  target/mips: avoid integer overflow in next_page PC check
  translator: merge max_insns into DisasContextBase
  target/sh4: convert to TranslatorOps
  target/sparc: convert to DisasJumpType
  target/sparc: convert to DisasContextBase
  target/sparc: convert to TranslatorOps
  target/mips: use lookup_and_goto_ptr on BS_STOP
  target/mips: convert to DisasJumpType
  target/mips: convert to DisasContextBase
  target/mips: use *ctx for DisasContext
  target/mips: convert to TranslatorOps
  target/s390x: convert to DisasJumpType
  target/s390x: convert to DisasContextBase
  target/s390x: convert to TranslatorOps
  target/openrisc: convert to DisasContextBase
  target/openrisc: convert to TranslatorOps
  target/riscv: convert to DisasJumpType
  target/riscv: convert to DisasContextBase
  target/riscv: convert to TranslatorOps

 include/exec/translator.h     |    8 +-
 target/arm/translate.h        |    2 +-
 accel/tcg/translator.c        |   21 +-
 target/alpha/translate.c      |    6 +-
 target/arm/translate-a64.c    |    8 +-
 target/arm/translate.c        |   20 +-
 target/cris/translate.c       |    6 +-
 target/hppa/translate.c       |    7 +-
 target/i386/translate.c       |    5 +-
 target/lm32/translate.c       |    6 +-
 target/microblaze/translate.c |    6 +-
 target/mips/translate.c       |  637 +++++++-------
 target/openrisc/translate.c   |  226 +++--
 target/ppc/translate.c        |    5 +-
 target/riscv/translate.c      |  255 +++---
 target/s390x/translate.c      | 1533 ++++++++++++++++-----------------
 target/sh4/translate.c        |  169 ++--
 target/sparc/translate.c      |  207 +++--
 target/tilegx/translate.c     |    4 +-
 target/unicore32/translate.c  |    6 +-
 target/xtensa/translate.c     |    9 +-
 21 files changed, 1554 insertions(+), 1592 deletions(-)

-- 
2.17.0

