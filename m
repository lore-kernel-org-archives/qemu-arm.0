Received: by 2002:a17:906:e18:b0:a38:6d10:c5dd with SMTP id l24csp44949eji;
        Tue, 6 Feb 2024 15:24:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGEqHjDd8nQ6SB+zENgm/BJYtuKAQ80U40d0cIwyNtHFsfygmenamESa5x6SQWcpwqJcuik
X-Received: by 2002:a05:6870:d1c9:b0:219:43b9:9ef8 with SMTP id b9-20020a056870d1c900b0021943b99ef8mr4719532oac.8.1707261848273;
        Tue, 06 Feb 2024 15:24:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707261848; cv=none;
        d=google.com; s=arc-20160816;
        b=SKMlXZ2+IqiR1l9eBkmbST1Pqas8BmnrAihlO+JKC0kmcKuEgiugGB+m8OpbrbAnX9
         wWFm3tBJIJxvg1D555ktEEN4EbEn91BJKVW2cd6x6FODI6E8TEeO0RE37h9vrivOdoXx
         Bbr2COv2m7sFhp8StIU69J4MUQMM0ps2vRLYNY+tQ4O4SJ5ASpbEl9xC4LqnFip43Bm4
         s+msKR2if7sx0jeEj/bZhPwBv2wvcux7YEWhLxZJrTaqpxy0Gx2frxhjgveIJGpT+Zp6
         TkUmgM8lTeYju/+2w99f0CTOaKiyj5YbEm12PS1ruJWS2Y/WnrNti3lPvp06qDgKb4i1
         cWdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=Q4joH6qxgZL675hV+mshQF+wvkCtYa09lcCu1PX3ELY=;
        fh=akc/aKFBY1P4Dc+EDnXm5RJf8mbQgwl3TL37b23Ynho=;
        b=TXw0DsQ/Ztbr/5Er7AZgs6jWWB4u6tN9ez9Fq58qi/3D3GtGH0Bp6+ALhiCosxQ308
         OcnRE0Vzs9rtOSGt9M4d6rhBUPhmKTfmClhaJm8fgQQB5fCnDt8bFS+fG6DnY8t1Cj/q
         Moycc+3mvmZu7K3WnZbAhLaevpKLpaavT/RCxuPz+q4IvEbLIziWQ6h8UqpjgHuupP3o
         qfJK3oct/dkbNKvGqJRIkT5Fz+qpwKCoBXRcBciYJlCFRxX9+h7txk9MMlhAyHy0I8ZX
         MoP6pD0oaY3U9yYcFvQ2jRZ0GtI7VX4dYyvL51fQVvGOCjeKQftCmuKvPkJpWcO3hzj3
         s+zA==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=fRolq+AD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
X-Forwarded-Encrypted: i=0; AJvYcCVnKgkrOj8PJ0kmB8vHN43v3GJ4T3bmscjG41yPOMPTuqk635zR5liShyvXmbmQHKZUAnR679V3Ztr5ysfFYWjiN/dTNfDj
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i18-20020ac85c12000000b0042a630184dasi3589327qti.443.2024.02.06.15.24.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Feb 2024 15:24:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=fRolq+AD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rXUn9-0002B3-6F; Tue, 06 Feb 2024 18:23:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3fr_CZQwKCD0mZahgdrsdeZmfnnfkd.bnlpdlt-Zqlmnmfmt.nqf@flex--nabihestefan.bounces.google.com>)
 id 1rXUn5-00029h-1X
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 18:23:47 -0500
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3fr_CZQwKCD0mZahgdrsdeZmfnnfkd.bnlpdlt-Zqlmnmfmt.nqf@flex--nabihestefan.bounces.google.com>)
 id 1rXUn3-0006WP-AR
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 18:23:46 -0500
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-6041bb56dbfso644867b3.2
 for <qemu-arm@nongnu.org>; Tue, 06 Feb 2024 15:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1707261822; x=1707866622; darn=nongnu.org;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Q4joH6qxgZL675hV+mshQF+wvkCtYa09lcCu1PX3ELY=;
 b=fRolq+AD3xJigPkRDQwSPcmP92fSO+Eo44XW3DURCbJJWnlMV6cawk5DokTe+RCzrA
 zuos159VXlyyqu4JjPAj0IlvdJd4Y2+XyId4Ys0lUBAe/AiXPsmkTZyKz/AEu+Fg9ALk
 GI45uLZKj2SqR3wDfvqzuNkUlymFiXc2KEbWVW80lLia/I1g89ClBHNEOHe3dfTD47z5
 FrjHszmU1B0Qh0E3O1QgH/BY4fOEIGNnWQe6hUC9iL+N2PPc4j27UnwMd6Z3zYVb1YAp
 UiuELFk9VhEDs4pSXiTt2OKRG7KO0Kz9mZ/shTY83HwdZaMCAZIRdywpZxSi+zoudswe
 7QOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707261822; x=1707866622;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Q4joH6qxgZL675hV+mshQF+wvkCtYa09lcCu1PX3ELY=;
 b=eu80PXeSmKSD/Cbpk0dl4wGgO0okEKwgpsg9kgleVg5AiYm3o6myHh3a1/We6e7j8P
 MWvd80/vCNTE7gntJA6FCDAXOjC3/hBZsxzCAjLPcydheB+0wDAqupktt/ZEnnBph9pH
 W+EAJbxgtnOgeTD0FtCbzGfzfoyuWn0AM1QMmkX45E1fLvZBobHyfB7oKmqVNIb6/bcD
 Jp1pj1vOkHD+IFkqHCwHkrqQCJqLmW9x7qdpZ82UW3VqV56HINEjT/NJvJiOJZY6p6v5
 0XbDZeA9SNZSiCepr5I5rSuWqtUboY4Gu+7Y4gMWYkfRQC2m6lsm80keOFGWJ0xk/+8Q
 m42Q==
X-Gm-Message-State: AOJu0YztRThvvem974KUmyzMfu1zctWEgNIsEIRmTdD/r1+C0c/3b99s
 g3wg2KKHXWnmlkh757+Rf71B774tIYWFb0X3K8heK3CO2nEhmamK3nJc/uNmQEqlbH5FyvnVX05
 ZeW5DAy68bD2a2ZQzCh3rxfYquA==
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a05:690c:86:b0:604:b83:9cad with SMTP
 id be6-20020a05690c008600b006040b839cadmr559640ywb.5.1707261822165; Tue, 06
 Feb 2024 15:23:42 -0800 (PST)
Date: Tue,  6 Feb 2024 23:23:36 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.594.gd9cf4e227d-goog
Message-ID: <20240206232337.1043760-1-nabihestefan@google.com>
Subject: [PATCH 0/1] Sending small fix for NPCM GMAC test to properly test on
 Nuvoton 7xx
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasowang@redhat.com, avi.fishman@nuvoton.com, 
 nabihestefan@google.com, kwliu@nuvoton.com, tomer.maimon@nuvoton.com, 
 Hila.Miranda-Kuzi@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::114a;
 envelope-from=3fr_CZQwKCD0mZahgdrsdeZmfnnfkd.bnlpdlt-Zqlmnmfmt.nqf@flex--nabihestefan.bounces.google.com;
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
X-TUID: UY5ASRm62lgh


Nabih Estefan (1):
  tests/qtest: Fixing GMAC test to run in 7xx

 tests/qtest/meson.build      |  4 ++--
 tests/qtest/npcm_gmac-test.c | 12 ++----------
 2 files changed, 4 insertions(+), 12 deletions(-)

-- 
2.43.0.594.gd9cf4e227d-goog

