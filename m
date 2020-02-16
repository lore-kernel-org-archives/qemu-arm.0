Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4381533lfp;
        Sun, 16 Feb 2020 13:42:46 -0800 (PST)
X-Google-Smtp-Source: APXvYqwXB5F9PuA3lt03lCcUthJccwbHZPOIBw0OcVIW40ay7YhIXlPJSFRY1n85tAVjS3pOzsa5
X-Received: by 2002:a05:620a:204d:: with SMTP id d13mr11203181qka.56.1581889366594;
        Sun, 16 Feb 2020 13:42:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581889366; cv=none;
        d=google.com; s=arc-20160816;
        b=cXs7V2MMeZHiPnW3XdO+4w9o0NkUcPaVjl4EamjX5eL/t7EXdBmOBAJvfjG3Z7YHJ1
         5FtM7joOeV57C8bwpJQpTlfTWB61W5gzFVahlI6ASFMAV/GMwZJG809XkctSP1KdwsPF
         Tb5YrNiD8o/hyC8eiuu9z4UeGTk0oBoy4v1azoiaWh/dhAYUxGToA9+4tMT08SfXSb9M
         FATsTnT0b/wchJh/ka4biLMprcJIDyyytmSvqoRJo4kdv3t0XBSfuGqqEwncm3mMg6xN
         aPh4gx26G1ksJ0bQF7dK3tWko96zQPKXmlHm3Tp1v41iGBWIgZl0vXLj0pWHAvyNEZya
         tNmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=iwAfLdSd4Nz0+d0j/xxVSEbWBf2WYBccmS2/+I5uAl0=;
        b=nzY2j2JgZpGKelF3G9/95OpyGPcR2neEg7SL17aIKqmjYenGas1FE6N9DOWP4hHQ2n
         r3DGwTjD+JfhMhDGps2/3ulnOWS/k4kGYCmliW/z7yKoUFyHo2na0M/cpwHlQJmetLdZ
         NVFM8ZjVm02twH1uGKsxB+/gIEh9aEpOyq2gGwT31gwge9zW73g+gaPg4ilG0y+AlGnW
         va/h7qaBJfj/GVMSezDn9svgSr4fwDL/sXDuVdz8JbxI6QOLdQJkeNRmTuMPJ6oQqiiK
         STiQ7w53OSpu55r84e1aO2iUONdJyejkXkW00NY2SMd9tk9TK0sveF4bV26EmTy+MJwF
         gDMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="tHH7RU/3";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q2si5779340qvv.198.2020.02.16.13.42.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 Feb 2020 13:42:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="tHH7RU/3";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3Rgb-0007qA-UN
	for alex.bennee@linaro.org; Sun, 16 Feb 2020 16:42:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47660)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j3RgS-0007pr-Iu
 for qemu-arm@nongnu.org; Sun, 16 Feb 2020 16:42:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j3RgR-0004qV-8s
 for qemu-arm@nongnu.org; Sun, 16 Feb 2020 16:42:36 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:46728)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j3RgR-0004pX-1Z
 for qemu-arm@nongnu.org; Sun, 16 Feb 2020 16:42:35 -0500
Received: by mail-pf1-x443.google.com with SMTP id k29so7767448pfp.13
 for <qemu-arm@nongnu.org>; Sun, 16 Feb 2020 13:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iwAfLdSd4Nz0+d0j/xxVSEbWBf2WYBccmS2/+I5uAl0=;
 b=tHH7RU/3tsSyj+jbN59lDUi5kcyKVVlCHnied+hnlcfdqm0qa1miVFoKQXPZCsuXgZ
 KrG/JJqzo3qmWl69eRCDzNjxje8NIP6OXFALJePYZraW5mq1C4bir8+O8q4cQBVBd+Pr
 2IpvpKBZxiMu888EkUYR7AxO4tgS/nWNVsikUdBLqDbUCGhKvkB8Pds4UEw0hrQHPnZD
 n96se0KW+pwKFE8oOujvcUYVuVRnw3YyMen/g1Dq/Bq7RjXZSo+p4sJX/1da+n1yRZzn
 jMEGtd8HHt13mlXESXrhwnDUua0tyDhSBYcchJEuFF3ams6K7qtbrKrK7ONcAqrAC8RJ
 i1AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iwAfLdSd4Nz0+d0j/xxVSEbWBf2WYBccmS2/+I5uAl0=;
 b=Ap6PFIPa/vwMPa4L6ORHQF3uDFbF2LV5WATnxau+Zvfp3Zemxa/c3U/LhKBgJUHXGD
 /Z5jGIodFjGgcESGiFzUh3FumSPRHktJ9uu0Ltw46pnCw24Luv7Dmz44jXLM/ewui76q
 bBYL01TglvkkcITVvGdiLgCucYa8boRlFgvxY6htggCYwM+oMKNbDNRIv0gVNhxLdbWh
 r+nhrgqAHVIvZy80aXMF+M3Wr88Et3TrXeGMRZc0y0ti2yV9RHyTrd3ohqg7PH5Eb3Q3
 /sUxErt6YmytGxfbfezh+kmko7ENMN9JK1mNWxh4x36LMY9Yn+Gf3zb66bGJjaESBw8g
 OBMw==
X-Gm-Message-State: APjAAAWnYmE9jU25PWmJqxEvKsLpvb5eEITxhcVasDBXF9uiF791kf8O
 2OmMV0IkEdSHYzgPAc2gGCN8Uw==
X-Received: by 2002:a63:38b:: with SMTP id 133mr14552527pgd.153.1581889353666; 
 Sun, 16 Feb 2020 13:42:33 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id z29sm14821848pgc.21.2020.02.16.13.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Feb 2020 13:42:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/4] target/arm vector improvements
Date: Sun, 16 Feb 2020 13:42:28 -0800
Message-Id: <20200216214232.4230-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hbNfVNTIZ3Tl

Changes for v2:

* Rename function arguments as requested by ajb.
* Minor optimization in helper_gvec_pmul_b.

Original blurb:

The first patch has been seen before.

  https://patchwork.ozlabs.org/patch/1115039/

It had a bug and I didn't fix it right away and then forgot.
Fixed now; I had mixed up the operand ordering for aarch32.

The next 3 are something that I noticed while doing other stuff.

In particular, pmull is used heavily during https transfers.
While cloning a repository, the old code peaks at 27% of the
total runtime, as measured by perf top.  The new code does
not quite reach 3% repeating the same clone.

In addition, the new helper functions are in the form that
will be required for the implementation of SVE2.


r~

Richard Henderson (4):
  target/arm: Vectorize USHL and SSHL
  target/arm: Convert PMUL.8 to gvec
  target/arm: Convert PMULL.64 to gvec
  target/arm: Convert PMULL.8 to gvec

 target/arm/helper-sve.h    |   2 +
 target/arm/helper.h        |  21 ++-
 target/arm/translate.h     |   6 +
 target/arm/neon_helper.c   | 117 -------------
 target/arm/translate-a64.c |  83 ++++-----
 target/arm/translate.c     | 348 ++++++++++++++++++++++++++++++++-----
 target/arm/vec_helper.c    | 211 ++++++++++++++++++++++
 7 files changed, 560 insertions(+), 228 deletions(-)

-- 
2.20.1

