Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC62C43458
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Jul 2026 05:39:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wenf7-0008Tb-RU; Wed, 01 Jul 2026 01:39:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1wenf5-0008TD-95
 for qemu-arm@nongnu.org; Wed, 01 Jul 2026 01:39:03 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1wenf2-0004IE-VY
 for qemu-arm@nongnu.org; Wed, 01 Jul 2026 01:39:02 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-84347ad88edso297700b3a.1
 for <qemu-arm@nongnu.org>; Tue, 30 Jun 2026 22:38:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782884337; cv=none;
 d=google.com; s=arc-20260327;
 b=B5Mlmi6HFTk/UQhiDRS97C5SAUyhElrpxv6jM2lGML9KRfK72lrZrH7UbkGiR5GygM
 KVTNx/56wa6VwpGlJd6vigEY6Osg0VG2KiU+yRxUc6CHAZyu1PGIDhUQcnrf6gEm8aGd
 GPJFAEeK8GEk0Wqr2ISDho82ZmJeEWoYemjkPyWkMgxLKKlIgdibg/xc1sa7UUUDoJMT
 FMJhinI9j7OnB12NmrZf330AehvO+wIwaJYhvw9NkNYKV5bN7lxyZxnlCMGg2r+6KUeX
 0qUgzgdtSFpQBNGOJ+DcXwOtQQrNN4K7BZp9SwoUfh65Ohs38FxEMwChgJnH5ZNNG5GK
 w6mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=2tGjOoVjR/8nFMMUnv40ozYvFgs90qmTPu5OwPCZMig=;
 fh=cg1m4uTcsBD2d5lLOztoNkAzswLL6AwUByUEXbZcbK8=;
 b=BLtyLiObfe/mafUoM7j3fRcqrRj0E/UiVnm3zdh5lKdb7EyG+JjGiLEwB0xSKSc0hN
 fqvOlTSUEBTrgccAM5ny052FHvTVg7lDaSt3OaE2Y0+ct1d6PMXWvtcTU6P6FW8T4HYW
 onJfdr7FfSxFrT4i2kKg/gW3jBqEfuajNuek1AIS19z0V0RJ3YC906rYs+drIGgXGQlD
 2Eds7+VG9lgE+wVjFXSfmCu7lMbM+wkdLKbXnzxvFxEFFcTZ3fRP6Nh5cLchKX0CfRQW
 BMb+i78Y8rgx03E+Prb36jDiO/xvfY3su6lIAE46ZzHl11lKRXzcHpJNr4tipaS794uL
 l+ww==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782884337; x=1783489137; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2tGjOoVjR/8nFMMUnv40ozYvFgs90qmTPu5OwPCZMig=;
 b=b0anI8ir0qXZ7Knb+cBEcqcrw56rmJmKpY2QI7gFI1urRuc+4JXJOPAv+EqW9/WMfd
 S/lTuhMGTxO1V7Mo289mT24JuIei5wlKN/L26j/QtDyYxcoVl6BPniMi/BdKS3razn/Q
 0oT+4uy5QEAeNlSu5B4hTAEaguCh8JDHAc/ByzSExRKUlvOCMPjuDXpvzpTetjJm1X+D
 JHSQz93pvxH5uNg7hzpJMrEiZKJ4/sWJfZz4Djkg5ePW5vGWjbijgFe9BlZNVat2N8c9
 WL27JxsxnJfi0jz3Uv8lfVMA5Ow8PK5Z18GcL5sTNETxN/eoGreCOHyu0+w9BTmrkKaB
 5G1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782884337; x=1783489137;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2tGjOoVjR/8nFMMUnv40ozYvFgs90qmTPu5OwPCZMig=;
 b=Q8JZIRs56xSjqw6murivhqguHkiGOYw9kNPjTHQg86PHebzVHudEBsBgUPdyPfW2+5
 3FGnZZH7fflDPV4E1Co35aiYnXYxf554n2w7ga/9QQ5SeNclDY/qpV4Nz+17WqASQAX2
 N+AlpdgcRXkYnaVHBXlz5C7JU8TasOMs02dwZDfU3tjNhlm+f19SjNfDx8tMOHSGc4nn
 CsBmBSerR9w6FCsqK6o4wMEnya7DQaEKUDlMq7eLPM37ck+I1at0q6zjgHuRfLK/rQiJ
 3XV7b7lCKlBHFUFSsz7esfsNaPNjxZ562z7aLGXMr6QTKek96vKo8VX8QDgTfGSVPzsJ
 POQg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr+S8IZokO5AnIjFmHCNcoxqMTq3y6QyULC26gD8JaEQ//M1PLugmDDga9/tsrwmCNClcknPJHsmw==@nongnu.org
X-Gm-Message-State: AOJu0YwhT+P5vXJ4C5yHk94gaPOutdcDZvC8jw07PCaOCFJbaiQJ3aD2
 yf45hccPgjteihn/0cYnF9WE9GJLM87oYnit6Y3ICFzGmsHSEzIpBiN35qSpxOq2E3Z14w/d+mZ
 GcG3EUG3jMaXMLFcE7GttbY8d+EhsQFM=
X-Gm-Gg: AfdE7cn32eIX+pLM7hlv6nwNc/AM+QllFqaAS/+DPsAflROoHzbDRMDBHp0W+AQXpXM
 huIsvFgrGeaAbSoCDS3vw3WpWTFuJsFACKglEmlrgMxnt3Y06hoFP1NZhXS4smz6HHk7eS2vmnx
 e9DHGLUez6ruNpuFDPqg6XuyZJppHU7h1Xm8PdDQfdAk4TK03BgqyHgGrmq1kA6R33W4s16QLS+
 nuwRVrzH2uRIYG2CKGCpIRHsB/jlVTBlnyg/Yu8JvJgTi2agj0JwaO+/pNCFxQR/W3WyGXtNG0m
 +6FEKdPDtP8=
X-Received: by 2002:a05:6a00:2a0e:b0:82f:9407:d167 with SMTP id
 d2e1a72fcca58-847c09c8386mr129950b3a.38.1782884336637; Tue, 30 Jun 2026
 22:38:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260529-feat-mte4-v7-0-ccbd3c14eb3c@gmail.com>
 <CAFEAcA8R1RXrGo2xov-4gKLQXX=FTVKoK1rGuxuYmBo9e8SN_g@mail.gmail.com>
In-Reply-To: <CAFEAcA8R1RXrGo2xov-4gKLQXX=FTVKoK1rGuxuYmBo9e8SN_g@mail.gmail.com>
From: Gabriel Brookman <brookmangabriel@gmail.com>
Date: Tue, 30 Jun 2026 22:38:45 -0700
X-Gm-Features: AVVi8CeOBtZJTvsljiabzMR8Fo81rmvNVpq8-chsg7c0ssTUY6z7FEJUK5wsM14
Message-ID: <CA+1f7BD2pVP2ByBRbwbHBRWNNuZHKdM_7xSVSmPztEWw1BbVbw@mail.gmail.com>
Subject: Re: [PATCH v7 00/15] target/arm: add support for MTE4
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Gustavo Romero <gustavo.romero@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>, Helge Deller <deller@gmx.de>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=brookmangabriel@gmail.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Sorry, repeating as I forgot to include the mailing list:

Hello,

According to ARM developer, FEAT_MTE4 only implies the existence of
its 4 subfeatures, plus FEAT_MTE2, and MTE_PERM, all of which are now
implemented. There are no features that MTE4 guarantees that aren't
either already present or introduced by my series. This means that we
can now claim to implement FEAT_MTE4, and close the issue.

We can also add it to emulation.rst. My apologies -- I can't do that
right now because of my current role, but it should be a trivial
one-liner for whoever picks it up.

Thanks,
Gabriel

