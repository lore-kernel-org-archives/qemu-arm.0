Received: by 2002:a17:906:b794:b0:9b6:5cec:e61e with SMTP id dt20csp21443ejb;
        Wed, 18 Oct 2023 11:15:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyWBnwzHXCJ9YWWx9EqwNEUjuobPBBZoBX0dLgLKUe2dV3HNiftaN0pv4GQdIdFdm4ls6P
X-Received: by 2002:a05:620a:254e:b0:76f:135d:ce08 with SMTP id s14-20020a05620a254e00b0076f135dce08mr6647897qko.57.1697652918839;
        Wed, 18 Oct 2023 11:15:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697652918; cv=none;
        d=google.com; s=arc-20160816;
        b=w88U+bm1VxcvpBdqCdrAytHU8iud2PuZ3tQSC1ttTPwV6EhaZYvL75/kfghQPK5vJb
         KHwEG0a3sGPP653hCSlw3bxzzgFK914adLCMuwBK7Wq+HeRRKzkx/Gt3er+jayPmscvr
         joQq6VraJEQxqJkhhK5sDBYqb2v6ShbNXQMGO9BD/77wAx50/qvg9YAVyzxp9jQBOq2q
         /VTK1UqQNKmuHMP9d7q2UBhrvYODEzmPBGJxzcT4xRkNo1E/L2Cxr9+33807wpn8crqK
         YXM+zma4xAjGJ5yM4/t+oSM9vXlpbpmpL3V867KChmL9mDe8rt8dyhmu52fB1GK3R66s
         rdrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=ryudDDILGHBqSPSusnyBRafd1nlh0D1vtdTegRn4Qsw=;
        fh=8TcdNm2PUOSTOLTAPwKw1HRZgze8qTDV0WK6iGCckjQ=;
        b=j0YNH+tFDWEUaSJf8Oz6Yi5GMatX6fb5zlkek5hDrbEkUL/BPmd2uzyFeZcwVGzSwL
         Cx6FxSvse4rNq4hodqbu3GWmbjd6hzNr2pagyVozqa3CnQQLOOhb6LkU1uwPxbzA50Ao
         xODC2G14tPXeUwJ0qm0kX6pswBBEVPrPCEgkDyElEMK0GtUtrDcInNI+H/ZhrB5VO9zO
         kQmaGm3fM3a6o3dK/qRjDBKIpXwTuWYzmyL2zXeZZfrylJAzImJ3ggkY/I0PWz3GMyAX
         /PHBiVCv3OPpjNSb0oA+95xba536x9xnXpUgkC63Lfn5PRIUd856vjVrDgwiiSH0HFLQ
         M97A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=OmAl4QX1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f11-20020a05620a20cb00b00767dc58f2f8si332766qka.48.2023.10.18.11.15.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Oct 2023 11:15:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=OmAl4QX1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qtB2Z-0008Aw-V3; Wed, 18 Oct 2023 14:13:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3LiAwZQwKCl8K78FEBPQBC7KDLLDIB.9LJNBJR-ABSBIKLKDKR.LOD@flex--nabihestefan.bounces.google.com>)
 id 1qtB2X-00081y-QJ
 for qemu-devel@nongnu.org; Wed, 18 Oct 2023 14:13:05 -0400
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3LiAwZQwKCl8K78FEBPQBC7KDLLDIB.9LJNBJR-ABSBIKLKDKR.LOD@flex--nabihestefan.bounces.google.com>)
 id 1qtB2V-0008Gt-Na
 for qemu-devel@nongnu.org; Wed, 18 Oct 2023 14:13:05 -0400
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-5a7e4745acdso110888637b3.3
 for <qemu-devel@nongnu.org>; Wed, 18 Oct 2023 11:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1697652782; x=1698257582; darn=nongnu.org;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ryudDDILGHBqSPSusnyBRafd1nlh0D1vtdTegRn4Qsw=;
 b=OmAl4QX1oHVKw1IhmYzFLK0Jd/yH2F1EQMboLYQriPcYM9f0vVhO5j8PZlm9amV8rc
 hX+6hyGuCd/n7cY3eAyyYOMI04u0yYVFHr3vktMNU6YFtLHzgWfLsPHbG3KnGkqkZmoH
 8bYwxnvl3ZDE5ZKfolMKGo0yDuzPJPOlUBDyiApTGfpH4OjGx2OsL7k+dQ0z17SiMVI2
 YJoqzzdseojHeDngGK7/263biAx1spmiIHiRPHgbmtRM12H/SZHlCb01gs2V2Hl0xHi4
 1JuumtIqi6MlHRDVdtwbTbBO4P8GeKNZ/Lc3oR/RWWfmPpj9japeiY9FFMmj/gb+5Mm1
 AmqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697652782; x=1698257582;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ryudDDILGHBqSPSusnyBRafd1nlh0D1vtdTegRn4Qsw=;
 b=Yq68VRUWvV8wbHmMt/Uxze5efy9nqFh+DCuM/ym3t06gOyy/TBiedYuXHJQHYZBke7
 p3nmETz52cP8xr241ew1w34I1fRCKq4iPGW+rCBeBYVRkRz8sqsXAl2Z1o3SgmOBxJG7
 Im0XaPI5PHInJABnddWQiHsu0mxvycQQZTLPyJiveNLJPy5ZJpCI6OBdTbgBMA3Rm03y
 WcT8/e6h5YHQ3EtdkhbrH4HK/Wmn3EFJ+33GZp55fwmc3Q6XEvzgtGTOd0CxUUet+lB6
 2JBUWloSqMRa2VzkLtzGE5UF4el6dWa+8PQ0TutzD4XsJ0YlyeDWfdPcGuA+Gz2EnwbN
 I/Ew==
X-Gm-Message-State: AOJu0Yx6oaPnSqPukbYlNUcN83g6yolEGtOLXwaXrqhQoFlfF0S4PJnT
 P7QGeomuQhSyt2c+u8kY0ZejB4RwAt2GRQ5Gm+Q=
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a0d:e245:0:b0:59b:ccba:1249 with SMTP
 id l66-20020a0de245000000b0059bccba1249mr870ywe.10.1697652782225; Wed, 18 Oct
 2023 11:13:02 -0700 (PDT)
Date: Wed, 18 Oct 2023 18:12:48 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
Message-ID: <20231018181259.748819-1-nabihestefan@google.com>
Subject: [PATCH v4 00/11] Implementation of NPI Mailbox and GMAC Networking
 Module
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasonwang@redhat.com, avi.fishman@nuvoton.com, 
 nabihestefan@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::114a;
 envelope-from=3LiAwZQwKCl8K78FEBPQBC7KDLLDIB.9LJNBJR-ABSBIKLKDKR.LOD@flex--nabihestefan.bounces.google.com;
 helo=mail-yw1-x114a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 4Bzqi37CnqD2

From: Nabih Estefan Diaz <nabihestefan@google.com>

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
 hw/net/npcm_gmac.c                  | 943 ++++++++++++++++++++++++++++
 hw/net/trace-events                 |  20 +
 include/hw/arm/npcm7xx.h            |   4 +
 include/hw/misc/npcm7xx_pci_mbox.h  |  81 +++
 include/hw/net/npcm_gmac.h          | 340 ++++++++++
 tests/qtest/meson.build             |   8 +-
 tests/qtest/npcm7xx_pci_mbox-test.c | 238 +++++++
 tests/qtest/npcm_gmac-test.c        | 341 ++++++++++
 14 files changed, 2353 insertions(+), 9 deletions(-)
 create mode 100644 hw/misc/npcm7xx_pci_mbox.c
 create mode 100644 hw/net/npcm_gmac.c
 create mode 100644 include/hw/misc/npcm7xx_pci_mbox.h
 create mode 100644 include/hw/net/npcm_gmac.h
 create mode 100644 tests/qtest/npcm7xx_pci_mbox-test.c
 create mode 100644 tests/qtest/npcm_gmac-test.c

-- 
2.42.0.655.g421f12c284-goog

