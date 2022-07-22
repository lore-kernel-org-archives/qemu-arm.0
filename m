Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp73638lfp;
        Thu, 21 Jul 2022 23:37:39 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tp/ysNb0cQ9QyCBEY05PCnL5ukNO4alwHDVwJxbZ5bdvSkWPG4AIz/G7Fszg02pIdWQus5
X-Received: by 2002:a05:620a:2584:b0:6ab:91fd:15dd with SMTP id x4-20020a05620a258400b006ab91fd15ddmr1443330qko.287.1658471859393;
        Thu, 21 Jul 2022 23:37:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658471859; cv=none;
        d=google.com; s=arc-20160816;
        b=u7pU2eRxEJncnjOK1q/MlOY36f1npqtXm0uUAvSS+GzwhDs8njvx9FCgN5pRO3fFTF
         gjmbTkveb/gim/hnQRd/um0/bUvNn+RNLVtqkdG1YJvOr3yq/U/Tc/fXn1ZMMUtDQzY6
         SvT4dIqlSt2W6aJL5Xdch0F6OtFHekYrsKkJWhHZlr/fEmLwNjK7+jNOxrhD2pzWDIff
         7dLUlCRjTkI/KTt2tkrxXvjgXAXde5V8ZvLJ42fGlD35WyLqVdh1OIVuwooQOC7lNsH3
         jvLtMRxozmCQBuZlsigOdFDll2jai0VSQvDWGaNrRFPGsw8quCk4KSLTldEtg7lXODFm
         FTRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=vZsLuJucEr4nQIl/fYOjHj53SWRRa8XWxka56OWci6Q=;
        b=v67i1q5HPt3xJ8CT34hE0vXWB3pkkkoSybRlpyY6ya/dH6lq8eoruhOrOHaDGgoiZJ
         S0TTAVekc/LsKZUApwLnfx1GjuoLQ0r7iKnlTfq6Xa2dtJRa4OJKTlfZ7CmgGj392CzD
         naJcg4u3wfCo9FRX6RDudNXbF1q7eb/HuUK15ILmjTb++zr8rCzvg1ljJ0X4HuurKfJM
         jMIPsaduXwmnAtEd6yNFGb0SkncCMS5ZQldN5wwsTFXrKzmzQeZNiEvf1Wt3Rq7rlZf1
         7ASmIQQkM5kQ5KKCnRSwE0jVKbM9B52RidTdgEzVtfUfe45j6XoKDRLx4PcsXlMiNs4R
         x1nQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f3-20020a05620a408300b006b57c91172esi3107126qko.507.2022.07.21.23.37.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Jul 2022 23:37:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oEmI6-0000Mw-MG
	for alex.bennee@linaro.org; Fri, 22 Jul 2022 02:37:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=w2Kw=X3=kaod.org=clg@ozlabs.org>)
 id 1oEmGt-000892-TH; Fri, 22 Jul 2022 02:36:23 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:57353
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=w2Kw=X3=kaod.org=clg@ozlabs.org>)
 id 1oEmGr-0000zC-5C; Fri, 22 Jul 2022 02:36:23 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Lq07v5KRCz4xGH;
 Fri, 22 Jul 2022 16:36:11 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Lq07p5ngfz4xG6;
 Fri, 22 Jul 2022 16:36:06 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Iris Chen <irischenlj@fb.com>, Michael Walle <michael@walle.cc>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v3 0/8] m25p80: Add SFDP support 
Date: Fri, 22 Jul 2022 08:35:54 +0200
Message-Id: <20220722063602.128144-1-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=w2Kw=X3=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: o18Kejrdx8Fi

Hello, 

This is a refresh of a patchset sent long ago [1] adding support for
JEDEC STANDARD JESD216 Serial Flash Discovery Parameters (SFDP). SFDP
describes the features of a serial flash device using a set of internal
parameter tables. Support in Linux has been added some time ago and
the spi-nor driver is using it more often to detect the flash settings
and even flash models.

Francisco and I are not entirely satisfied with the way the tables are
defined. We add some private discussion on how to resolve that but
neither of us had the time to pursue the study. Latest Francisco
proposal was : 

    #define define_sfdp_read_wrap(model, wrap_sz)            \
    uint8_t m25p80_sdfp_read_##model(SFDPTable t, uint32_t addr) \
    {                                                            \
         return m25p80_sdfp_read(t, addr & (wrap_sz-1));          \
    }
    ...
    define_sfdp_read_wrap(mt25ql512ab, SZ_256)
    
    A new variable in the section would solve it aswell but not convinced at the
    moment if it is clear enough:
    
    typedef struct SFDPSection {
         const uint32_t addr;
         const uint32_t size;
         const uint32_t wrap_sz;
         const uint8_t *data;
    } SFDPSection;
    
    #define SFDP_RAW(start_addr, vals...) \
    {                                     \
       .addr = start_addr,                 \
       .size = sizeof((uint8_t[]){vals}),  \
       .data = (const uint8_t[]){vals}     \
    }
    
    #define SFDP_RAW_WRAP(start_addr, _wrap_sz, vals...) \
    {                                     \
       .addr = start_addr,                 \
       .size = sizeof((uint8_t[]){vals}),  \
       .wrap_sz = _wrap_sz,                \
       .data = (const uint8_t[]){vals}     \
    }
    
    #define SFDP_TABLE_END() { 0 }
    #define IS_SFDP_END(x) (x.size == 0)
    
    #define M35T4545_WRAP_SZ 0x100
    
    static const SFDPTable m35t4545 = {
         SFDP_RAW_WRAP(0, M35T4545_WRAP_SZ,
                       0x53, 0x46, 0x44, 0x50, 0x00, 0x01, 0x00, 0xff,
                       0x00, 0x00, 0x01, 0x09, 0x30, 0x00, 0x00, 0xff),
    
         SFDP_RAW(0x38,
                  0xe5, 0x20, 0xfb, 0xff, 0xff, 0xff, 0xff, 0x0f,
                  0x29, 0xeb, 0x27, 0x6b, 0x08, 0x3b, 0x27, 0xbb,
                  0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x27, 0xbb,
                  0xff, 0xff, 0x29, 0xeb, 0x0c, 0x20, 0x10, 0xd8,
                  0x00, 0x00, 0x00, 0x00, 0xff, 0xff, 0xff, 0xff),
    
         SFDP_TABLE_END()
    };
    
    uint8_t m25p80_sfdp_read(SFDPTable t, uint32_t addr)
    {
         if (t[0].wrap_sz) {
             addr &= (t.wrap_sz-1);
         }
    
         for (int i = 0; !IS_SFDP_END(t[i]); i++) {
             if (addr >= t[i].addr && addr < (t[i].addr + t[i].size)) {
                 return t[i].data[addr];
             }
         }
         return 0xFF;
    }

Since there is a need, we have been using these patches in OpenBMC for
some time now and other projects/companies have requested it, I am
resending the patchset as it is to restart the discussion.

Thanks,

C.

Cédric Le Goater (8):
  m25p80: Add basic support for the SFDP command
  m25p80: Add the n25q256a SFDP table
  m25p80: Add the mx25l25635e SFPD table
  m25p80: Add the mx25l25635f SFPD table
  m25p80: Add the mx66l1g45g SFDP table
  m25p80: Add the w25q256 SFPD table
  m25p80: Add the w25q512jv SFPD table
  arm/aspeed: Replace mx25l25635e chip model

 hw/block/m25p80_sfdp.h |  27 ++++
 hw/arm/aspeed.c        |   6 +-
 hw/block/m25p80.c      |  49 ++++++-
 hw/block/m25p80_sfdp.c | 296 +++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS            |   2 +-
 hw/block/meson.build   |   1 +
 hw/block/trace-events  |   1 +
 7 files changed, 371 insertions(+), 11 deletions(-)
 create mode 100644 hw/block/m25p80_sfdp.h
 create mode 100644 hw/block/m25p80_sfdp.c

-- 
2.35.3

