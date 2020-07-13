Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3506765lfm;
        Mon, 13 Jul 2020 10:58:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqbKZAzkp3WqyhXJTzIKZHZxOhlh9K54wfPuKvxPjcFu5incJVt13eZcZdkkI+OFMjf9zU
X-Received: by 2002:a25:b085:: with SMTP id f5mr1833825ybj.418.1594663081845;
        Mon, 13 Jul 2020 10:58:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594663081; cv=none;
        d=google.com; s=arc-20160816;
        b=nU9AwKHHz0Nw/YE/34wg5B6xdLGga18SGKEc3oOWq+540WGAFnJrWZnEyev5i1E2LQ
         8tI6AIftQaCkYJcrsNdByjiBACOnhwvCODmI4I1C0CmV35yd3E3TLLmA2pr+iNvTN10U
         Qz7kalFMBfstfUogj9NCmCtqF9M9G6eZqVfh1N3PN+ErDIh4WGQBQeHYT5dWpyPhyN0e
         EYsi1vuvUKMWKTP3P/vjlqdZsztDKZtb320iE7ZCXwvJImv2os0g7VMRDj2/Ie3+A0rq
         VlYq5N5jiZBrvM5RW/xg2OP/El/vsTsTGfTDmCu9piXkDDVjebrZWMVujhYdlSr/KOc6
         SUoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=Vbg5izYI34iu471XO9N3fvyaBGXDvlDeLjxYI4mvRCM=;
        b=ESbJNX3voF/KumpcDa/Bl1CEwqCAksEsf8cGbV40EyCgpFlGs4bVWQmh5wzYjhRKH4
         TnDLWDZKLcGQazBriDHHPFe3vObmU3cMcZr0LXqRsO1y0jRhyAKoYNQgS+3LnyjvLfKj
         qeWSSMbojzZrUL7AjWC0B6EGmfAdPYzVFaWpLJRFhTOxz9OmkNNzSz1C50Dipe/B5QTI
         5junbS6Vj2A9VX/YkuXzBJ2TfoEN+dSCqbAXNCsc9a/YZs7HB/6wj5We1MGCHYtb3ANb
         tQSXTTug7sgN+xnq3SZNqiUbBMvEtmwzyuP7vFeKLa8FGzSIYoyQRdnhNs33p/wbCIav
         V6tQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u+0FuobU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g136si11481069ybf.35.2020.07.13.10.58.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Jul 2020 10:58:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u+0FuobU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jv2iH-00027p-5u
	for alex.bennee@linaro.org; Mon, 13 Jul 2020 13:58:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jv2i8-00026P-Ah
 for qemu-arm@nongnu.org; Mon, 13 Jul 2020 13:57:52 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:52271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jv2i6-00084R-JE
 for qemu-arm@nongnu.org; Mon, 13 Jul 2020 13:57:52 -0400
Received: by mail-wm1-x344.google.com with SMTP id q15so519967wmj.2
 for <qemu-arm@nongnu.org>; Mon, 13 Jul 2020 10:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Vbg5izYI34iu471XO9N3fvyaBGXDvlDeLjxYI4mvRCM=;
 b=u+0FuobU1Y3BTd3hEBc1kkmy2svengzkeVkGXZ8NMqG8lD+muXu76tpV/Ct9VQxUjr
 Q+snIzeXADa44BKIqam3k1gUzFcYgjtXANiruLPgpI2X03ZDUe13f9LKUlbIUnCsaf5M
 jmwnbriQudARFzocY4uGQapNgcbXllouJiMUIrKev0DTOQszf4CyQEp+35lF/gMYHIdu
 ewNpf9NXguuTH50gj4Uxt/EqF5o3J4XW0ikyn+cgGfEbEgDmgYXdLTZbC5JF1yvs9zVw
 M1nIIx6IXn2EMUL3sIXxwmyKplR1lnU7YI8/hsjbO899b2m+oqmP54zCO8XrSPRC13JO
 helA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Vbg5izYI34iu471XO9N3fvyaBGXDvlDeLjxYI4mvRCM=;
 b=AVXkRL3vnBjq3HE2UjMWfpXbBAAHYy81P8Ga0zSapGJC8LpkpxAaT5hxeUvg6uIVnF
 TbGSWGZdXWb6Bqzs98Novpc2rovGMUJgigPdYqLZwPTMs0y6hmDK4NJXKvskQXiameGB
 QW3+OECJM72Pqmw2XrI1Fb+u3JwSmgF3RAPMhxspvcJcVVEkLuYge1wOiFxOo2r1u8UN
 JaS5hbPiuCtov/5xZuEC4njA2k9uO5tkwGG5eMKsbMoCoSm2Nj0cOwTFYCulBv7rUT7q
 9lebkKct0EKnurRzdpzezMG4ff7YyJjsNrfiJjNifmLprDvBQ12k8XK+kbW393NoFpa0
 CbAg==
X-Gm-Message-State: AOAM531JZuHbLEH2aSivFFMxFR8YY1k6PeLSt+4wtDv5JyZGbsicMNRG
 F9vNWjSnbtH1kuiPjU7x0cLMlMmbkHHaCA==
X-Received: by 2002:a1c:1fc2:: with SMTP id f185mr606953wmf.0.1594663068575;
 Mon, 13 Jul 2020 10:57:48 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j4sm25723721wrp.51.2020.07.13.10.57.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 10:57:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-5.1 0/4] Document virt and a few other Arm boards
Date: Mon, 13 Jul 2020 18:57:42 +0100
Message-Id: <20200713175746.5936-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: UMwc9nkazFHl

This series adds some documentation to the system manual for
previously undocumented Arm board types.

The first 3 patches are very minimalist documentation of the
canon-a1000, collie and gumstix board families.  The info was
obtained by looking at source code comments, a brief scan of what
kinds of devices the code was creating, and sometimes the cover
letter for the patch series that added the board. The level
of documentation here doesn't seem fantastically useful but
on the other hand it's no worse than that we have for some
existing boards (eg cheetah) and it would be nice to eventually
get to complete coverage of all the arm board types. But
I figured some feedback on whether this level of documentation
was worth doing was worthwhile before I tried to add it for
any of the other board types.

Finally, patch 4 is more meaty: it documents the "virt" board
(which was a pretty embarrassing omission from the docs given
that it is the standard board type that we recommend for
Arm guests these days). I have attempted to fold in the info
on the board from https://wiki.qemu.org/Documentation/Platforms/ARM
where appropriate.

Peter Maydell (4):
  docs/system: Briefly document canon-a1100 board
  docs/system: Briefly document collie board
  docs/system: Briefly document gumstix boards
  docs/system: Document the arm virt board

 docs/system/arm/collie.rst  |  16 ++++
 docs/system/arm/digic.rst   |  11 +++
 docs/system/arm/gumstix.rst |  21 +++++
 docs/system/arm/virt.rst    | 157 ++++++++++++++++++++++++++++++++++++
 docs/system/target-arm.rst  |   4 +
 MAINTAINERS                 |   4 +
 6 files changed, 213 insertions(+)
 create mode 100644 docs/system/arm/collie.rst
 create mode 100644 docs/system/arm/digic.rst
 create mode 100644 docs/system/arm/gumstix.rst
 create mode 100644 docs/system/arm/virt.rst

-- 
2.20.1

