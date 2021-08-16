Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp1588414lfg;
        Mon, 16 Aug 2021 11:03:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzI7MV9Nz1pNUzRWs837z80V9Q7fImknyZFxzbG1xo74jIqZo/+A9BT6n+sx0iV64Y70oh4
X-Received: by 2002:a17:906:7b53:: with SMTP id n19mr17205356ejo.14.1629137018769;
        Mon, 16 Aug 2021 11:03:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629137018; cv=none;
        d=google.com; s=arc-20160816;
        b=lFFSCqIsliqUhtegTwU6i4NrAyolLEHxQ98Sf0tjhKo1bQJPniCWJ/tt/l/x4XZ/0k
         Yx0fAmFqFa3JFTaULTU/P+YsmKBSqJhzx1FP0w/bavseQC2hbwO8EcbaJf5+9iJQPSV+
         MCWb6G1SmOSTGla0cBmYNr15ICxruENUHya63416L91cDNs9JK5xQGfrzxrnc8Wphv69
         bVDxfLGhqKb1D/NIRdUDtIYR30ffP1hxqNIj5srZuF80MpYIV1KcP64krMh2xjeEacbC
         vK3/6lFY8s5LxOHQG/SjzxLFHURqQ3GgVb0cXeBhbW76SjH+R6JlTbetJmtVnyLosmIo
         JyWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=ICREgosjl79r6d8x49A4C7JTGWN+7MdRwms8enSQfIA=;
        b=oOlCmJoJ96JnajLjQcniv1VE8cDteZqTBIJC6SpGdc79Y2tHOBboE4oBBOGkF8I7aM
         oDTM1PIhjWgZJl6A/AhcAhXi6pH1GP4YZEvos3ZfBsdIUdpIbsSmbYkXghnJIEgaLUWc
         S1idvtpokSb4/o4DMq4kmVd9bLei7z235LUTLcQqZ7okN6QR8QKC9/Y16w6vuwJuwxkv
         yt9VhRAEWLxjJZOdDIXHuTqVtPXkB5VAcqRAFUbSdPP4nEYL9kgBIiVUb9KQN9D96Lgh
         kyqnqdK4UmHXJawDnLJ6gDyirw3eCj19rokziDVGOf1rePfulWJ2U3BCqKZAzFU0C93J
         Hupg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ux77/2C6";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l1si11587841ejo.68.2021.08.16.11.03.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Aug 2021 11:03:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ux77/2C6";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mFgxV-0003iO-TA
	for alex.bennee@linaro.org; Mon, 16 Aug 2021 14:03:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFgx6-0002cC-Cd
 for qemu-arm@nongnu.org; Mon, 16 Aug 2021 14:03:12 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:35508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFgx3-0004bJ-JG
 for qemu-arm@nongnu.org; Mon, 16 Aug 2021 14:03:12 -0400
Received: by mail-wr1-x42e.google.com with SMTP id q10so24867155wro.2
 for <qemu-arm@nongnu.org>; Mon, 16 Aug 2021 11:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ICREgosjl79r6d8x49A4C7JTGWN+7MdRwms8enSQfIA=;
 b=ux77/2C6mjdNp/vUo9iYF2vIDofnpaPnJlapq3TvgwfCBJ9iVEmYSCYHMJbCay5yQU
 HGolHPdnZ4Uo9s/jA1Jyil6aYE6SUQsnGnVQzYzire46u0l9toN7y6xOxVShoznVfYU/
 c1y0DwzPttR88lVWnTVItdQjdutLUXi188c0sjJj2HexDv8vEy/qqeiUXsUnmDRmQcZL
 nbwW6fQHxCLeF8N4ijD1ribguvJcll1rFbE21vele+CroxBZiiDSL1NhJvXLPLWOgj+P
 5enD81xaWFj12HLwP987S8Jd+DYFf2d3IvgzNB/BB41Bgm/1EQLqkHcrHzxTpzNUX11v
 eygQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ICREgosjl79r6d8x49A4C7JTGWN+7MdRwms8enSQfIA=;
 b=iym86ppz+tRTTYZQ0o8efSm62zyGNZkQiHhFCGowOrRoWggSTbyjTh3waXSHV726lu
 P4TxtzYMKWOHTA9ikj/RGsWua6hEXpRR/9IM72qt7Xus85qZSh+V0hIDP0l/ODoBkiGv
 /qjb/DMZoFOJV6w0NC6KaMNB9XkLL/MeE+z1bhpnQGEhFziD77zAbTdmdnxEEzAKXdb5
 rXt8DHinWT8UebfQbUFMjczCP1ZpmTXLcwO/XVceSzm+ER6vRL5qDub0WO7O2FXG0yzz
 3gs11rvBG67Y7ttGkktpwgxgJv243bxY+O45QRgxdEX2J3+bHHcoxkC5l8Yr6PCYcx/6
 UEMQ==
X-Gm-Message-State: AOAM531ORsJdfty7HVKepUGpx0w5bmQbUU6QSoim8UtBDwsdtmYylw91
 19S+Hwy60HxMBULOSZC1ow0ppeWvPiJoYQ==
X-Received: by 2002:a5d:4311:: with SMTP id h17mr19849245wrq.263.1629136987625; 
 Mon, 16 Aug 2021 11:03:07 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id u16sm240053wmc.41.2021.08.16.11.03.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 11:03:07 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/2] target/arm: Implement remaining HSTR functionality
Date: Mon, 16 Aug 2021 19:03:03 +0100
Message-Id: <20210816180305.20137-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A9X3iSvGgLws

I was going through some old todo items from years back, and one of
them was "implement HSTR traps".  We actually already do the
interesting part of this (traps of coprocessor register access), but
there are a couple of small loose ends: v7A (but not v8A!) defines
HSTR.TTEE and HSTR.TJDBX trap bits for trapping various bits of the
trivial Thumb2EE and Jazelle implementation.

The documentation for this is in the v7A Arm ARM DDI0406C.d, section
B1.14.10 and B1.14.11, but the summary is that these bits trap from
NS EL0/EL1 to Hyp mode for:
 * TEECR and TEEHBR accesses
 * JOSCR or JMCR sysreg accesses
 * execution of the BXJ insn

This patchset implements the last of the HSTR functionality,
just so I can cross it off my todo list. I don't expect anybody
to actually be using this :-)

thanks
-- PMM

Peter Maydell (2):
  target/arm: Implement HSTR.TTEE
  target/arm: Implement HSTR.TJDBX

 target/arm/cpu.h       |  3 +++
 target/arm/helper.h    |  2 ++
 target/arm/syndrome.h  |  7 +++++++
 target/arm/helper.c    | 35 +++++++++++++++++++++++++++++++++--
 target/arm/op_helper.c | 16 ++++++++++++++++
 target/arm/translate.c | 12 ++++++++++++
 6 files changed, 73 insertions(+), 2 deletions(-)

-- 
2.20.1
