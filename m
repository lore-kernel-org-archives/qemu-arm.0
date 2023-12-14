Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp2614232ejo;
        Thu, 14 Dec 2023 13:16:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLb6bj4WieoSklT0gld9jiyicsQy5/MNAE/IKo+syo+JTn8cr94+mFixLhvKdrmVCnSR9R
X-Received: by 2002:a05:6214:226d:b0:67f:f12:74be with SMTP id gs13-20020a056214226d00b0067f0f1274bemr1716750qvb.127.1702588562269;
        Thu, 14 Dec 2023 13:16:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702588562; cv=none;
        d=google.com; s=arc-20160816;
        b=dfwZQSQvK3toHIju0BlUji0vrqGFXjwP6yPETQ1dtMBM/w/OaGQ2jujCaLaKVOy3Jj
         ilHjiTrnL8g6inhnHroHUfo3TtOWmVnxDDkr2CVIqdfsVYPtMDcajbLrvk7oTL6WOrwB
         s4ojvJzcPgTgildX37YvOXA3LOMO+Vo06xd2+6SLPOBEHDP/bTt2FHMh90PVxREYOxvU
         fP27DZwUD0ZuRVR3CkCJ8Fs/G0oUmvKCGvs7hNV7K1GpxjJPmuOI1c6MPi97+FhBifvY
         SuqhXR26VUSQzMnHnwn4mdj9vJpX4xyTeDCANzNqVxBuB9rNVWQjWr41scS0mRMkfNvV
         t2Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=b6M3uz5PP3WI4WwD3266w4VvYWKVsbINj1ldzM3fELs=;
        fh=+aVB0apLn7P4p3cMF9Qg7nFZ6+AnRx2Fcri+oFjNFtM=;
        b=hZga/wIRwW9v2sv529YBefe0vC0FJ3dFWjjGCiTTYKEttb+XAQZj676aX3ajyr9bsg
         nCwmwRyBgt8sUXtXwtRg+VOXzqQyHTHEOsqpWRdSpY6aHFjSH84Ac1rEGZkGU+TKHudW
         RMN0crvImI2gdNroO4vyfXHjVVE0DtbNtDCKdFCCD0mLkamInNsJiO8mGFJYmEc0ilhR
         aZdfBGvwnrP1Ka61OVcKi86iaiJ0uIf98CE6eqR/E4qEywNHQQltRnUPaNfd1lsCJYT9
         5soQ4oCabmnafNC4JGiFrhpqi/WgqZmbWeg2WOhJ9xps6E+oUos81/nd7i/9aWv04Ykf
         WyWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=WSguxils;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i4-20020a0cfcc4000000b0067a1fc7914bsi4805203qvq.236.2023.12.14.13.16.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Dec 2023 13:16:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=WSguxils;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rDt3d-0002UX-S0; Thu, 14 Dec 2023 16:15:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3cnB7ZQwKCHMeRSZYVjkVWReXffXcV.TfdhVdl-RidefeXel.fiX@flex--nabihestefan.bounces.google.com>)
 id 1rDt3V-0002U7-KK
 for qemu-arm@nongnu.org; Thu, 14 Dec 2023 16:15:42 -0500
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3cnB7ZQwKCHMeRSZYVjkVWReXffXcV.TfdhVdl-RidefeXel.fiX@flex--nabihestefan.bounces.google.com>)
 id 1rDt3R-0005uK-3K
 for qemu-arm@nongnu.org; Thu, 14 Dec 2023 16:15:41 -0500
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-5e19414f714so104867b3.0
 for <qemu-arm@nongnu.org>; Thu, 14 Dec 2023 13:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1702588530; x=1703193330; darn=nongnu.org;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=b6M3uz5PP3WI4WwD3266w4VvYWKVsbINj1ldzM3fELs=;
 b=WSguxils7jfyqY3wSxj/Ga3UD5OKH4O1LML2HWI8/EM8ENyMSRDi4aF9qhUgBHLDOn
 8q8k4aXlGm4ZrWhfWrQ/kXqXRfuSam/xbDaQrvjUmdDOxyrr4ZBeo3BxhzywiC0NhGCA
 csO2kjE1hd3b5r9l/N/zFSFhK5dHq2KogBwYr4Q198f6XHoQnekM+yoBcokoi/BsKU15
 nfqJQbSs2IJGaDmbn9ImmhVnnjoRY3KKNWiayGDaIGYs4ddupeccqor3PA8qGWuQCqiA
 BQ+VP0hqlLN/NUO4POSSw3bGcqLffslfjcTgtFyeTsK63b+5O/2KiOrd3KpZoaJ45PZM
 w3aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702588530; x=1703193330;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=b6M3uz5PP3WI4WwD3266w4VvYWKVsbINj1ldzM3fELs=;
 b=U/s7cO26B27kd74Ar5l7gcEZ3/GaeHNTnS2cTOJStrslrf+Tx3avZjk6xHXzHi6yFn
 K3uZM7tMbnZz0nBWdaNMPLVpqpyejRgKPekiLYvpM+YghKiUrVVHSvWDzmwdfllzBozS
 FCiM4PukpHO+WLQw7DezUPw+gqvAPwn4jCvybHkaH40IAn79tSh5O4mSW2CknbQLTVM2
 J6oa/Becl00VmAF6C8QLN9RJoYONalr+br4VbylAZfLhVcQ44m4scmpLk5mMwI9gH9vn
 xI+zC7Yl+yK/NM9qSz37YM9YdZDsW2kOT127SyKFI16br2i2GVn09o2s/9JbAw74MHMj
 zgLA==
X-Gm-Message-State: AOJu0Yw0ZgNJ8g0ZrFn+MWuf61b8h7hTqlWnNp1icO7jUseGZOjuoll/
 YEAlaHl4xxyODB61m3XqJXfWrjVZ48PdQ3ttzq4=
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a25:2e0a:0:b0:dbc:c4a7:3bf7 with SMTP
 id u10-20020a252e0a000000b00dbcc4a73bf7mr50320ybu.1.1702588530579; Thu, 14
 Dec 2023 13:15:30 -0800 (PST)
Date: Thu, 14 Dec 2023 21:15:16 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Message-ID: <20231214211527.1946302-1-nabihestefan@google.com>
Subject: [PATCH v8 00/11] Implementation of NPI Mailbox and GMAC Networking
 Module
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasowang@redhat.com, avi.fishman@nuvoton.com, 
 nabihestefan@google.com, kwliu@nuvoton.com, tomer.maimon@nuvoton.com, 
 Hila.Miranda-Kuzi@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::114a;
 envelope-from=3cnB7ZQwKCHMeRSZYVjkVWReXffXcV.TfdhVdl-RidefeXel.fiX@flex--nabihestefan.bounces.google.com;
 helo=mail-yw1-x114a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: SYdZxFi5rHQs

From: Nabih Estefan Diaz <nabihestefan@google.com>

[Changes since v7]
Fixed patch 4 declaration of new NIC based on comments by Peter Maydell
(peter.maydell@linaro.org)

[Changes since v6]
Remove the Change-Ids from the commit messages.

[Changes since v5]
Undid remove of some qtests that seem to have been caused by a merge
conflict.

[Changes since v4]
Added Signed-off-by tag and fixed patch 4 commit message as suggested by
Peter Maydell (peter.maydell@linaro.org)

[Changes since v3]
Fixed comments from Hao Wu (wuhaotsh@google.com)

[Changes since v2]
Fixed bugs related to the RC functionality of the GMAC. Added and
squashed patches related to that.

[Changes since v1]
Fixed some errors in formatting.
Fixed a merge error that I didn't see in v1.
Removed Nuvoton 8xx references since that is a separate patch set.

[Original Cover]
Creates NPI Mailbox Module with data verification for read and write (internal and external),
wiring to the Nuvoton SoC, and QTests.

Also creates the GMAC Networking Module. Implements read and write functionalities with cooresponding descriptors
and registers. Also includes QTests for the different functionalities.

Hao Wu (5):
  hw/misc: Add Nuvoton's PCI Mailbox Module
  hw/arm: Add PCI mailbox module to Nuvoton SoC
  hw/misc: Add qtest for NPCM7xx PCI Mailbox
  hw/net: Add NPCMXXX GMAC device
  hw/arm: Add GMAC devices to NPCM7XX SoC

Nabih Estefan Diaz (6):
  tests/qtest: Creating qtest for GMAC Module
  include/hw/net: Implemented Classes and Masks for GMAC Descriptors
  hw/net: General GMAC Implementation
  hw/net: GMAC Rx Implementation
  hw/net: GMAC Tx Implementation
  tests/qtest: Adding PCS Module test to GMAC Qtest

 docs/system/arm/nuvoton.rst         |   2 +
 hw/arm/npcm7xx.c                    |  53 +-
 hw/misc/meson.build                 |   1 +
 hw/misc/npcm7xx_pci_mbox.c          | 324 ++++++++++
 hw/misc/trace-events                |   5 +
 hw/net/meson.build                  |   2 +-
 hw/net/npcm_gmac.c                  | 942 ++++++++++++++++++++++++++++
 hw/net/trace-events                 |  19 +
 include/hw/arm/npcm7xx.h            |   4 +
 include/hw/misc/npcm7xx_pci_mbox.h  |  81 +++
 include/hw/net/npcm_gmac.h          | 340 ++++++++++
 tests/qtest/meson.build             |   3 +
 tests/qtest/npcm7xx_pci_mbox-test.c | 238 +++++++
 tests/qtest/npcm_gmac-test.c        | 341 ++++++++++
 14 files changed, 2351 insertions(+), 4 deletions(-)
 create mode 100644 hw/misc/npcm7xx_pci_mbox.c
 create mode 100644 hw/net/npcm_gmac.c
 create mode 100644 include/hw/misc/npcm7xx_pci_mbox.h
 create mode 100644 include/hw/net/npcm_gmac.h
 create mode 100644 tests/qtest/npcm7xx_pci_mbox-test.c
 create mode 100644 tests/qtest/npcm_gmac-test.c

-- 
2.43.0.472.g3155946c3a-goog

