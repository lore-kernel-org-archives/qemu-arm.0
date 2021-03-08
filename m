Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2263985lfg;
        Mon, 8 Mar 2021 15:11:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyqVrLsUdu2+ZmecqfXKEsxkEtPzzleDuBnySDT3qLo+rVJDQvo3HjJGZqA7su7WJJAX/Bj
X-Received: by 2002:aca:acc2:: with SMTP id v185mr910642oie.28.1615245113148;
        Mon, 08 Mar 2021 15:11:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615245113; cv=none;
        d=google.com; s=arc-20160816;
        b=XuCHFgKHD3EQiePHEKJj2OFLKOayifOmpfNGHlo/jRP2cug+HJIsPVfJAco5rFQ44S
         ufM7kiPLIg7YyTBTlp3seMETJQq1M1xDSkx2bMtJ63XifI4N+hZn91MQUjOe2wcB83e3
         91iZ5xLVvmYL8RNv1duICVJ7YZ/2aMvRZ7drAxm5yMWV35T9S+6JYd0lY7FiyknSOvar
         xuXtFTLqKsEzgMoW59pFWDSTYgU4coTDkALhQRgYSvAr7+uGi9PveXlO6X5r+TiQZebO
         N+kmpirYRGAjVI1zspYd308FxaKh5jKgM6p134UjVRYSdHvsUTpCtbfkxxskxdrCAfpH
         TXqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=wFlfdENY4Hsp6KG6WBQza+olq0T99MhK2MPAKbv7nBs=;
        b=liiox0uWmeWttcuU5PHkCbUV4dz3J3gGta2M7dK+GGx14vDjc9K9CEcbixrJ2lOT2T
         ihRFFQplMdnqRTlf9VcY1lTfhZm9XwOnvyW/2exa/8VR0TEMxdXGGhhaqysAvUx4kmL6
         3xf9BzieaZJtCDD025FYW2Y/JxqWXAI4E6LkVRR0pAhJpDUcuTOiMRCtWxlLMyWw3IYe
         rB34lH1BwUvRU/QU0pY4tZhHvCK0Yl8yGU/KqxeirctmODDle2SLpAthYaqXgLnN8gfQ
         COGQsZ5GIHgnbL/2UX5mLqK15CJwGUnk+sE1jYZc5k1Eowf1X7ezbHl000QcMbSnN2aL
         tKzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=nTqi9kr2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m15si10231931oiw.23.2021.03.08.15.11.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Mar 2021 15:11:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=nTqi9kr2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lJP2W-0002K6-DB
	for alex.bennee@linaro.org; Mon, 08 Mar 2021 18:11:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lJP27-0001gK-OD
 for qemu-arm@nongnu.org; Mon, 08 Mar 2021 18:11:27 -0500
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:45503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lJP26-0005jJ-56
 for qemu-arm@nongnu.org; Mon, 08 Mar 2021 18:11:27 -0500
Received: by mail-qk1-x732.google.com with SMTP id z128so11179307qkc.12
 for <qemu-arm@nongnu.org>; Mon, 08 Mar 2021 15:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wFlfdENY4Hsp6KG6WBQza+olq0T99MhK2MPAKbv7nBs=;
 b=nTqi9kr2FyK8KeJrkwmEyiw3I1K/8d73y+YHUPQyQ8laULZl6QwDEk8w7prx7pQf7w
 uLpiQaZ/1KoKWXzlCXuoQoH611NoC4Hfc1emK7GqeYgwlGZX3czflRV8jrV24w271gyF
 VfRQzsaEVYdiVWBFdoXKXnKAn0nO3HbsFAO/9y6Szy1lCuW0YM/zkrBp357JhHZFm18h
 3t6i1IzNhZMh8mzTu8VBb9WcPpHGCbta4nEg7tcwvkK++B1B9/bgJejLkGsXnH59ZUzd
 /qDXmUwWD2c1GBuPczNPYYRvOHGLkB8iw5CgtePMbbrJO9dPmgrUqbjlmd5NeB2CsqbP
 HoWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wFlfdENY4Hsp6KG6WBQza+olq0T99MhK2MPAKbv7nBs=;
 b=suIoSTNj//7HVNL+axFV2KaLCjqDYBzF3TiY/XeC859yaW0oL6yaj8Vi03NVUfZhII
 jRWstZS19D3vZaMHx7teiUTIYzuZbtUUkgLnnClBqe+8DKGwBUGrGRR/EDzVycBIUkNi
 gMAOerT1jK+GB6lcuDN+WXaJk4xGvmGKKES57S69rhdtzvtaVHE/UpK6xSnlfp92W3Z+
 vV2qSeK5BbXxw6SweNvYwJhYwsiRyK2bDpaNgOhFV0X0mRa6p0qs7o7ukZ7iqisc2LFb
 2UwljIV848ucPu+owkTg1UoLoJinI9btJiQDAVffq0cyU3Q1W7RILBI2MRvGNyvg7Vb1
 nk4g==
X-Gm-Message-State: AOAM531JYhkvhiJrVQmjjpZBoM0hSAHkHq0yVNczbWD9RGW1sI1s0FPL
 rNkrFVGS79O5UhHebQ25jIXZ9Q==
X-Received: by 2002:a37:a192:: with SMTP id
 k140mr23008740qke.278.1615245085105; 
 Mon, 08 Mar 2021 15:11:25 -0800 (PST)
Received: from cube.nuviainc.com (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id z6sm3312342qto.70.2021.03.08.15.11.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 15:11:24 -0800 (PST)
From: Rebecca Cran <rebecca@nuviainc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH v2 0/3] target/arm: Add support for FEAT_TLBIOS and
 FEAT_TLBIRANGE
Date: Mon,  8 Mar 2021 16:11:14 -0700
Message-Id: <20210308231117.12650-1-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=rebecca@nuviainc.com; helo=mail-qk1-x732.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pFPWIzINST2H

ARMv8.4 adds the mandatory FEAT_TLBIOS and FEAT_TLBIRANGE. 
They provides TLBI maintenance instructions that extend to the Outer
Shareable domain and that apply to a range of input addresses.
    
Changes from v1 to v2:

o Split new instructions into different ARMCPRegInfo sections, and only
  add them if ID_AA64ISAR0.TLB indicates they're supported.
o Improve the performance of the new code in cputlb.c.

Testing:
  o Ran scripts/checkpatch.pl: functions in exec-all.h fail,
    but I think that's acceptable?
  o Built all targets
  o Ran test code that executed the new instructions
  o Ran "make test": a qtest-sparc repeatedly timed out,
    but that's unlikely to be due to my changes.

Rebecca Cran (3):
  target/arm: Add support for FEAT_TLBIRANGE
  target/arm: Add support for FEAT_TLBIOS
  target/arm: set ID_AA64ISAR0.TLB to 2 for max AARCH64 CPU type

 accel/tcg/cputlb.c      |  67 ++++
 include/exec/exec-all.h |  41 +++
 target/arm/cpu.h        |  11 +
 target/arm/cpu64.c      |   1 +
 target/arm/helper.c     | 323 ++++++++++++++++++++
 5 files changed, 443 insertions(+)

-- 
2.26.2

