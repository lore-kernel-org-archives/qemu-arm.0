Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp3152698lfo;
        Tue, 15 Mar 2022 13:43:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydmLRpcYK2RscYbDlMlqM7QZSVE5pdeHS0nweF2CxsZVQImNzewkXvqX7RgsxL9FaxsgnN
X-Received: by 2002:a25:d85:0:b0:633:7522:fa30 with SMTP id 127-20020a250d85000000b006337522fa30mr5076752ybn.152.1647377028803;
        Tue, 15 Mar 2022 13:43:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647377028; cv=none;
        d=google.com; s=arc-20160816;
        b=uUT9hFCBt1074Tez0mnS3QEKXlTgogpyS3iGzOiSnPy5yRZ8SMhRVmvVS1SGU8jvlg
         X/fZMWN8sPyRhVAOq1Ymnon/KA8rzv1ta1SS6QeG4FNRgUSdun8uiQiK4AifUcFyRriG
         Xid35+cecE1A4aiiAHRRekPZCyJwEHlOz/G36g6n3BtjqxEJ90ssVxvo7oYHhfYCVL5J
         V5TaNoy/68y9swqpZ1rvbAzfOCbYyPOMGPT/BT6lJ5jz72yE43puZegIsZEDxk/uY2tC
         +gs3iP9yFJgHgalLwqu8uBwR43rMjSqUAUYnO0gfPqlV2lY8qdGMBKsr+CjPBuKBnpUx
         2yrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=WjoW4TuhrLDh3vJbD36hIEHEEGiSVoyg+GX+kjzhoEI=;
        b=hTygvvobQgpbIiDtZISa6UvUrPzqGG/TbUcIRfl+SnRhyxVE5FxGoutOsnsJ3vRtGg
         0wAEYvSUBp7BHZsHuOv4fX3jNPi20tckjS8a6gIDYPPNVrf86zK/wK7HEIncpTb+8bV/
         xT28QcUWhMX/GFEgfc2u4abfqB7qIIXmnoLHNZeH/Amez3vf1kQL8OeA3dvXDlQ5AlD7
         esMN/kWS/7yfzuLfrliwqMOH2QD31tvjF+mN7I8ZCh1VIG136UuA1uLy14FxzfgZcKKH
         r8mYR6I+37SN7JiIzfF9XbX8xaPFi22+4QC5418lpgxQC/6an3gSETJpLdWetDypxQir
         3A7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KboKxyOI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c189-20020a8135c6000000b002e59cda2e93si54840ywa.287.2022.03.15.13.43.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Mar 2022 13:43:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KboKxyOI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nUE1D-0006PV-MF
	for alex.bennee@linaro.org; Tue, 15 Mar 2022 16:43:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUE0e-0006PC-MT
 for qemu-arm@nongnu.org; Tue, 15 Mar 2022 16:43:12 -0400
Received: from [2a00:1450:4864:20::429] (port=33381
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUE0c-0008Fd-Rw
 for qemu-arm@nongnu.org; Tue, 15 Mar 2022 16:43:12 -0400
Received: by mail-wr1-x429.google.com with SMTP id j17so311163wrc.0
 for <qemu-arm@nongnu.org>; Tue, 15 Mar 2022 13:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WjoW4TuhrLDh3vJbD36hIEHEEGiSVoyg+GX+kjzhoEI=;
 b=KboKxyOIUCopYWDgAigdTqExkbNXpYShjD/bZX5N9r2fvO+G17d8vYG+95seS6gyeY
 mxgPtpy3lR3T9UwbUSSQu8GR24GHB54k46peKKypI2VB/4pGGNQ9cA/wK4Aatr3L9Ysm
 n9ya6KkCYdSNXTLgGsARqrpDkHF0KXx3yw16DdlY8heGzgGv3uWD4sKPIfnAd2hOb49O
 eTPOfrmrJSXzpGWboOcE5bRnsRJNaFozQKytGd0/MoxkDOPEYceekV7lD42nxOmeAL4z
 5fE7/CPDjRIQedwW7TTC1whknIj9MpQftPxAVri1chsp+prbNDsGV3Pb7U01TusCKdkd
 LsuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WjoW4TuhrLDh3vJbD36hIEHEEGiSVoyg+GX+kjzhoEI=;
 b=LBRmRJikkLr3Eq9oW7jfrmdz5IWf11waDF1Wnhu5JRS4Wyrd+C6g6KUDtL01/J73n8
 iZjpKuqYVvw3W82242GlrHseOplIX/A9UFFQUUWvt0opaKhIz+Vl/ZzO0Zco8ZVlUV/D
 AfZ+Bn9hTcCco/ALvbc1ZxFymgwrpEdxAZltHA32/4/JNBNoXDqvEU8q/FYm/roROVH9
 j+QJehZQTgg+mNgT290G9BcR0ZD20NHZv9YIAcmIpErV9c/I5Tl38LJ6u04kiHuyqn45
 WT+5qIww7QxSNovmgPc9Y5hZSs3iS0ZsuGhr2jeyE4bIdfYZJvhJN5smIqf1JTcNeujw
 9SEg==
X-Gm-Message-State: AOAM53169hIXFS6I78MCUWla4aykDzO5unRywzGDuuBBtUKo5iGijp0t
 jwcxjAUbRYGUbHPA+T1//HJy+xFuevQDIQ==
X-Received: by 2002:a05:6000:16ca:b0:1f1:dfd6:723d with SMTP id
 h10-20020a05600016ca00b001f1dfd6723dmr21281905wrf.127.1647376988881; 
 Tue, 15 Mar 2022 13:43:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 h11-20020a05600c414b00b0038c6c3eaee9sm465208wmm.1.2022.03.15.13.43.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 13:43:08 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/2] target/arm: Improve M-profile exception logging
Date: Tue, 15 Mar 2022 20:43:04 +0000
Message-Id: <20220315204306.2797684-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rDkcUoesZBUl

Our current logging for M-profile exceptions has a couple of holes
which are particularly confusing for the case of an exception taken
immediately out of reset:
 * we don't log the initial PC/SP loaded from the vector table
 * we don't log the PC we load from the vector table when
   we take an exception
 * we don't log the address for i-side aborts

This case is quite common where the user has failed to provide a
vector table in their ELF file and QEMU thus loads garbage for the
initial PC. At the moment the logging looks like:

$ qemu-system-arm [...] -d in_asm,cpu,exec,int
Taking exception 3 [Prefetch Abort] on CPU 0
...with CFSR.IACCVIOL
...BusFault with BFSR.STKERR
...taking pending nonsecure exception 3
----------------
IN: 
0x20000558:  08000079  stmdaeq  r0, {r0, r3, r4, r5, r6}


After this patchset it looks like:

$ qemu-system-arm [...] -d in_asm,cpu,exec,int
Loaded reset SP 0x0 PC 0x0 from vector table
Loaded reset SP 0xd008f8df PC 0xf000bf00 from vector table
Taking exception 3 [Prefetch Abort] on CPU 0
...at fault address 0xf000bf00
...with CFSR.IACCVIOL
...BusFault with BFSR.STKERR
...taking pending nonsecure exception 3
...loading from element 3 of non-secure vector table at 0xc
...loaded new PC 0x20000558
----------------
IN: 
0x20000558:  08000079  stmdaeq  r0, {r0, r3, r4, r5, r6}

and I think it is somewhat clearer that we loaded a bogus
PC from the vector table at reset, faulted at that address,
loaded the HardFault entry point which was bogus but at
least readable, and started executing code from there.

The double-logging of the reset loads is the result of
the way we currently reset the CPU twice on QEMU startup.
If we ever manage to fix that silliness it'll go away.


(Patchset inspired by a stackexchange question:
https://stackoverflow.com/questions/71486314/loading-an-elf-file-into-qemu
)

thanks
-- PMM

Peter Maydell (2):
  target/arm: Log M-profile vector table accesses
  target/arm: Log fault address for M-profile faults

 target/arm/cpu.c      |  5 +++++
 target/arm/m_helper.c | 11 +++++++++++
 2 files changed, 16 insertions(+)

-- 
2.25.1

