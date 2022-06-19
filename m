Received: by 2002:ac2:46e6:0:0:0:0:0 with SMTP id q6csp129427lfo;
        Sat, 18 Jun 2022 17:16:23 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tNUK8tD43/cjJTzcGug7OfYd1rNzUFmdv3Fi+6WI4QU1JXiWBKIN+2qUcRwA2E4Jfs/67I
X-Received: by 2002:a05:620a:1903:b0:67d:243b:a8ae with SMTP id bj3-20020a05620a190300b0067d243ba8aemr12161365qkb.142.1655597783198;
        Sat, 18 Jun 2022 17:16:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655597783; cv=none;
        d=google.com; s=arc-20160816;
        b=f/q/AaXySug1JEvWwpubtNX26Ak7myIf5NX46kI/K3o9zdlewLdddi93LStmBGCcKu
         4Lwm2azSr8AMR0biu8pNKuck8eOZWPLlpuzFqje4DzRy/nm5/f0As9FInLIq7S0LJJQr
         z0ZtlWK93oWKrRjQingnWnD5jgKrdqMfRZFhZUupwlUg9vkvSMMSELgubEzmogZcaae7
         m4gIyqqMFZNAZZv/gHVoe/AbbayxGW3GXeaG3k5h3UbddmgBFSbzF2Tz67eBu/I+dDzR
         0exyQ/gdGJ+bK7nwKwyc/cteeZKTCA47+wGBFUo4z/60jLiMTXQFiqYyKRP6Kb1Y/taf
         OdZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=Ujn5G+wwPlkF3YRhTOae2EhzDxKtq1O/qgyrxfdb2t8=;
        b=dPrFTH2ZqQuD+EZZReYkKNFsuepiBJSz6hR8OJvHOzt4XZql7w4nmRQQ6N/JGXl6Cw
         ByPIK+NSkPXskf8/x1jOYbWPnMUbrjZb0IWJld/xUg8V4Z8dy8WDYBFwvGihozQdYfgT
         +RUix31JOsn2daIvDs2mUjQQGDhVMIv90K57YtirKK8N2pc3VpR4+fbJImo/z2ECPiiO
         fDRXv6NSA6kx/AvpEc7O7EaMDEoYUDXgXjuwqQt5O7BdphvAOs2jvZMGVxB/Pj4LqrOa
         OfdeGC5F9D7or4yHWPO3WhUYIrg/e7lWX3TXdZdgQmh1G+HuPbyReXsc8F+boLN1Ea3I
         3+Bg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NgUNnZjA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h10-20020a0cf20a000000b0046d82b5b1bfsi4058172qvk.243.2022.06.18.17.16.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 18 Jun 2022 17:16:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NgUNnZjA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o2ic2-0007U3-Lt
	for alex.bennee@linaro.org; Sat, 18 Jun 2022 20:16:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o2ibT-0007Sz-AE
 for qemu-arm@nongnu.org; Sat, 18 Jun 2022 20:15:47 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:44973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o2ibQ-0001ws-St
 for qemu-arm@nongnu.org; Sat, 18 Jun 2022 20:15:46 -0400
Received: by mail-pl1-x633.google.com with SMTP id h1so6784838plf.11
 for <qemu-arm@nongnu.org>; Sat, 18 Jun 2022 17:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ujn5G+wwPlkF3YRhTOae2EhzDxKtq1O/qgyrxfdb2t8=;
 b=NgUNnZjAO1+LMKA0zYI8X+0f3FfmucQYaadfnA9B7IuOIeHwr5RmrHwZgHsYczdfBq
 OygypcezEBTeW+k039MJl8Sed3UTBI0tRGyvXR9DdRAcPz8WNj5isL644855EXR9TnRu
 pmYJsMILxcmgy4kF3pYirVevxtx87uJ/qF6a5UzJ8CrHFyMY6FsRd2fbddoYIalkUz0r
 QNrQWMZEBTMXT8ZoGFBQBbzqur4UYeWFkvZbEHW70cNVec2j1ZUfLtcvuV1hfK7mBEvu
 EUdnSzfPf4NMkfc7waUqWPuxzsCojEhVC1clL6iWJXQMN++Vaoh/u0P4t9p9qX82hUqx
 nl0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ujn5G+wwPlkF3YRhTOae2EhzDxKtq1O/qgyrxfdb2t8=;
 b=Ce9Caa+htmqjSL7wMr4wv3qBFwhdStVfUCCcet/LVW8uws/ujWUN/HKlT+a1etojwY
 RWui53vu8NJ7zsr9gaqvqKiOlG1DfNsuk//z3nXSurgBO1eB6w9XfmS87fD/cpP3d90t
 3winJeTD1YEouhPj1jnF4/AYDqKdoEsSU3hkUhQj2hwYX2eZCS6uU2qMnzgFrrTNJnRn
 Kkasu3j+4FSpw0Z3LYhl98b4Ep1Spvh3Fesoja+BIac+lc8tLFoGQhTwYG250ONTf5+E
 DVLU5gmFyq4Up9jOOLdw/8YK3uE/p74i/hKVj3mKyniIHKtLH+qg0rDeZBjqD4fuPnHQ
 NXqQ==
X-Gm-Message-State: AJIora/jDWXXm02gbfhxNFWrxXuojO02h0OOhzA8x+zMw2BnEfmqBkg1
 zDcJk6h0flqmUlL1fznmFLF5SQ3e6oUMzA==
X-Received: by 2002:a17:90a:1109:b0:1ea:f413:f72d with SMTP id
 d9-20020a17090a110900b001eaf413f72dmr16247372pja.127.1655597742869; 
 Sat, 18 Jun 2022 17:15:42 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:848a:b814:8a9c:88d6])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a17090a5d1100b001e0d4169365sm7790724pji.17.2022.06.18.17.15.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jun 2022 17:15:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 0/2] target/arm: Fix issue 1078
Date: Sat, 18 Jun 2022 17:15:39 -0700
Message-Id: <20220619001541.131672-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: RP0MlaRgiyNa

Nicely summarized by the reporter, but I thought it would be
nicer to pull all of the logic into arm_pamax, rather than
leave it separated.


r~


Richard Henderson (2):
  target/arm: Extend arm_pamax to more than aarch64
  target/arm: Check V7VE as well as LPAE in arm_pamax

 hw/arm/virt.c    | 10 +---------
 target/arm/ptw.c | 26 ++++++++++++++++++++------
 2 files changed, 21 insertions(+), 15 deletions(-)

-- 
2.34.1

