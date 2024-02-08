Received: by 2002:a17:906:c945:b0:a38:6d10:c5dd with SMTP id fw5csp334595ejb;
        Thu, 8 Feb 2024 11:37:45 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXIpl6gKAK4oe5qslR+D81hQJPje22uc/AjbxSWLjY6nZ5m2OVKVt8y+cvHV5e1C/2Xm9Bjdi3Tj9tGn/t5wnpBszgUDT77
X-Google-Smtp-Source: AGHT+IFWrZhf5XcalwkcpEFcpM+bUzrK+YndgzW/U+RgCI98T8DKZ/Lp1kMIgKyKHS3umHu24+pa
X-Received: by 2002:a05:6808:130c:b0:3bf:d1fb:556b with SMTP id y12-20020a056808130c00b003bfd1fb556bmr367913oiv.46.1707421065180;
        Thu, 08 Feb 2024 11:37:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707421065; cv=none;
        d=google.com; s=arc-20160816;
        b=OJDxpebm/V202YnAR1fmsF8KKRJkw51lCGJKXfBaOVsmV8yEFs71qnl1PriwKuqWEl
         tgAmEpvWISxWXzwigvgimOMOtpGvr4PwlrwuUVL5P7/G0el+w90r659zPXezky6ZdNVj
         fxJvLJKPpH6gHQa5EwXqIFf1/Dib6QAR4Fevaf6PHX5HbZpsLrmyRNYQ3SG4b2X3dLnw
         eDCn+NB5VfjIf3UVU5sPtMlaon7E9FX68Q+cgGQZf5FJPec7h6NX+FSPUvQ4q5OWlfE5
         TXgh73kQPo4RG4YAlKx8OCtL5O1rtg+jG3iAmvvf6xR0L2NIUajGqvDNaEVw2ePfnO5v
         0j4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=92fOOnHCkanWg80V2hAwSCwodLG+3/RgTATFlOBrVEc=;
        fh=Vhl2FbdkDcu5C3gMiwNuzDf+x8sD70PJGDjsUF/Abl0=;
        b=pTVyvTVFID+GbzAMKx6u9fmSO2syjZ2AyxghenlNUEvg4G0ZH08261ObpEl/SWr7sA
         6Mc7Sf5oFaQOiW/6KkGjK0C5jT5H9j7QJVINf4UIrGSTw7F2sSvzEYGa8tjdRlXSCLDq
         TNbR81KfFNhHqf0vRqvWaZo/DkBD6p4YLgPGagR7cjSl0WcDRf9LiC4s8FLpGSr5bcha
         PM0+C+dbazckAieW6VN1YBFAjV2GWSqc4Xfub25yIp7NP9Vw3g3wXP6raOIWzWjSEfeM
         1nWSxVLUSx93TOdpxXuLiL28lIA8zW8v6ODwHwivY3IEB/61EJ7pgfT/KJ8ljG3J6D5O
         JZiQ==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=uonYE1le;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
X-Forwarded-Encrypted: i=1; AJvYcCWhl4SUVUKRebsuidTm1B9Y3iT4dCcv9/zDpDgN9PklwjwkCodcFieQo7su9FzjKCe7pZJvE+Vy6NTK99P5AuDtJhXleHP4
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id os4-20020a05620a810400b007812c8e4f2esi267339qkn.510.2024.02.08.11.37.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Feb 2024 11:37:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=uonYE1le;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rYADM-0007dS-2C; Thu, 08 Feb 2024 14:37:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3fi3FZQwKCCMM9AHGDRSDE9MFNNFKD.BNLPDLT-9QLMNMFMT.NQF@flex--nabihestefan.bounces.google.com>)
 id 1rYADK-0007d6-M5
 for qemu-arm@nongnu.org; Thu, 08 Feb 2024 14:37:38 -0500
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3fi3FZQwKCCMM9AHGDRSDE9MFNNFKD.BNLPDLT-9QLMNMFMT.NQF@flex--nabihestefan.bounces.google.com>)
 id 1rYADJ-0005FL-Cw
 for qemu-arm@nongnu.org; Thu, 08 Feb 2024 14:37:38 -0500
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-6049f0f9856so4605887b3.2
 for <qemu-arm@nongnu.org>; Thu, 08 Feb 2024 11:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1707421054; x=1708025854; darn=nongnu.org;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=92fOOnHCkanWg80V2hAwSCwodLG+3/RgTATFlOBrVEc=;
 b=uonYE1leyPJN8S+akq0QDUYFPONU5tPfve28krn6TzSaKYLgF+Cx8aDlWuBnXOaPbb
 ZLV379hCmNvJXdXhOiB+O3/DmHkVwTmS/XZ49mr9y+1jaxGQm64urFhfvhx1OPyKKVHg
 TiStClUO0161Xt4ksYwk35Ne4mQp2IzvmHd534E0K99QUN+y7ICiy7ejOcs/Jo4QkKpb
 6CbyOBxo8PJ1HZDCbVAiFh1FkisScjAidADcJNbrkVX++vLeR5RU2nwiz3WtlSmFXPQV
 Wr8VkK7mc9cWVF6DgI5s4FLCGaL/BkT910iczaMOkL/DxBkZAr+17Tc6QFOn9dA1CsMW
 jtkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707421054; x=1708025854;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=92fOOnHCkanWg80V2hAwSCwodLG+3/RgTATFlOBrVEc=;
 b=MoFirSxY98v73DrI84SKcBPmiNMFMxcvNM2mBK+ZjHVg3Gdjs6iT4ZbdnmYr5FBpdA
 BVKgwEalFNa10vfW8+3wnbem6AvHF0ICYfoVL42rGp9Y6YEeyNk1xJGQlwKrF3oFiSCR
 BR9Y09eM7eq5WHkZQZ16w7V+EIQ+qUhuLNC1SPGykWjpG/VUxpaXHuVC8U6+/GW2UOHd
 urkC4H35NcJoW6COX25t/lB25Wxnkyq1Hd1kLagsWVydMohLBc4UNfSHIqXmcyGuNe8i
 o3L/fPWEU3NfLM0Bc4vuxwbX8i7cqFIfWYKn/EDTe4W6ukKOhXrRoyRn6UFKmC2aXUOT
 J5sg==
X-Gm-Message-State: AOJu0YzdYhiWlgtpLxrwPeLdVyv1++OkkSoVJfAgLLOZ+DP3ozkFQ1MQ
 Olqs6DExT48ODh0+e1PAkT7J8ulLTvbOHJYmVXdQz1LxaVmVxqP23k1kGfa739y7To7xDUF5NEp
 iHsqHXcNGMnlRFwAnD03QAR/QgA==
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a81:9284:0:b0:602:d17a:7f60 with SMTP
 id j126-20020a819284000000b00602d17a7f60mr58779ywg.10.1707421054552; Thu, 08
 Feb 2024 11:37:34 -0800 (PST)
Date: Thu,  8 Feb 2024 19:37:26 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
Message-ID: <20240208193730.2777982-1-nabihestefan@google.com>
Subject: [PATCH v2 0/1] Sending small fix for NPCM GMAC test to properly test
 on Nuvoton 7xx
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, Nabih Estefan <nabihestefan@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1149;
 envelope-from=3fi3FZQwKCCMM9AHGDRSDE9MFNNFKD.BNLPDLT-9QLMNMFMT.NQF@flex--nabihestefan.bounces.google.com;
 helo=mail-yw1-x1149.google.com
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
X-TUID: 1JscFhlxUKOr

Removing testing for PCS registers since that doesn't exist on 7xx.

Nabih Estefan (1):
  tests/qtest: Fixing GMAC test to run in 7xx

 obmc-phosphor-image-gsj.static.mtd | Bin 0 -> 33554432 bytes
 tests/qtest/meson.build            |   4 +-
 tests/qtest/npcm_gmac-test.c       |  84 +----------------------------
 3 files changed, 4 insertions(+), 84 deletions(-)
 create mode 100644 obmc-phosphor-image-gsj.static.mtd

-- 
2.43.0.687.g38aa6559b0-goog

