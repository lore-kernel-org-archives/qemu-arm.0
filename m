Received: by 2002:a17:906:f20a:b0:98d:b2f5:1316 with SMTP id gt10csp2863190ejb;
        Wed, 9 Aug 2023 05:37:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXk+7mrB/LP2k9HR1dBn7AITiNnUzSd1BijhKFIDWatfiSMNLa/e2kyP5tLLMFNSov6rFD
X-Received: by 2002:a05:620a:430c:b0:768:1e00:76c4 with SMTP id u12-20020a05620a430c00b007681e0076c4mr3235071qko.51.1691584649082;
        Wed, 09 Aug 2023 05:37:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691584649; cv=none;
        d=google.com; s=arc-20160816;
        b=DIfg2ZebeY7uGUO+tt/bcyTDQ/79edKnvwZx/MW7Sn5xUvpRjow6OuFQFZoySPMaCX
         St7PeuF2hPwAClSHt0yztMJOXvvtQXKkgRMlvKdr5ffQpl9MBW/JSBOQngT9nqdEYAoz
         rikIgTVwq12eg88G8+jkGmWjNg3H6ERysTaQWdg5ymGE3hOku2xeL5K7pho9+dH9qMUf
         Qaz87RoxsR6SGDx8c1dN/xyPjXS6OB87AeMXCJzGvdVkVncVwJQ1H4Zc7XrodLe654m2
         htSEjkjiJx9rHpRzu6rxEv4kL2ZxoycXQ3DzuoKV9C9ulyYVrvC30QSNCXyWPjl4AC6Y
         JrGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=/4ysh9xQ8pcgY+P8IcJ5XzhWArdi/CT5G2Y6EcaPHbo=;
        fh=zMLmPP9ozJY0jj0bAXqZquWHP0BgmjJZ9lKiHhJNaWU=;
        b=DZqmupmNkjfODeo9hlL3Djy0/hu75GymxEH0N7PT+6GanGfPNVOJxi3SoB8BL+/w/1
         6RLl84Dg6a2JwMDNg6HkvKXL+6vYgzoGVk9Zz3loeDmUDDqmrQ3uVDDcIVj4lwkSJFe6
         zgbOOM9LeM+kcDl0fBWNC9Hc3nKWsAnnU9wj+otv4dRBAPSy8UbUupYZdowSh+PRKWmh
         g6EzKhPUrkg7/E/ZHJOLnFs+i+onMjDDMdvcxg3xnNLWMJcnr7OAyoJDjn/87G25XddS
         k5epD0OEXoY/0pcK40Nu/H56Bdiw26Lhnk/iipNz1V08o4cLV7uoloka6gVesjbInAXT
         rnwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OpNWUhih;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id to18-20020a05620a4c9200b0075b06bf2f4dsi7106533qkn.159.2023.08.09.05.37.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Aug 2023 05:37:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OpNWUhih;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qTiRF-0002Y6-M9; Wed, 09 Aug 2023 08:37:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1qTiRE-0002XO-5s
 for qemu-arm@nongnu.org; Wed, 09 Aug 2023 08:37:20 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1qTiRC-0002nl-AW
 for qemu-arm@nongnu.org; Wed, 09 Aug 2023 08:37:19 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3175d5ca8dbso5143329f8f.2
 for <qemu-arm@nongnu.org>; Wed, 09 Aug 2023 05:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691584635; x=1692189435;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/4ysh9xQ8pcgY+P8IcJ5XzhWArdi/CT5G2Y6EcaPHbo=;
 b=OpNWUhihDLHlvVr6Y0IQh7P6heQit8mh0P2tbEIX5waUneUCpbTTygJFI+Pi05/izt
 xKeuF8WjRrgSdMTYOWq46N9+Fm7DlhJypaTIeDeWYFjITpXQVh821C1xBRGPeY6/056S
 QF/vEJahEzjxAKG9mWEb0DyxCzaoH7zYtxLv5+7c0hf26JKY0K1Q7cwtKd+VAihBkLJo
 kcjfqgSNXu8lRNBK3ABrOm3tqNO3kZ12BVa7szbEttrDWYuyo4viB9xS6EwHs2e7N4EN
 MtxTasv8EyXFSrEhe60rINIiwcj0NoSzxzu3QThYsqgvFefIBtwSfg330rMDm/7jbzdu
 9ZSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691584635; x=1692189435;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/4ysh9xQ8pcgY+P8IcJ5XzhWArdi/CT5G2Y6EcaPHbo=;
 b=C5mgFMd1o5hULOI8S+W75WP10q0AMfA5yuq+Ph1OmwrOmPmLhDKvlbujLBzXxvtY+b
 8JARxr0TKjFNRkj9CDdglG+XuXUSoD+wUJRFZ9F3kBoHSrcj5BRLStQok38zjePFredK
 Rno1tQPuDRLTE04qd1J97rRQWlFVf0rcx7S4aKNUYuuqc95hkF7smBxgTMwoqtUlU2tb
 MKu6hST/QW++sWqeEkbeR2+U0ANTdYGASjDxKfCM/7Zg2RewhKwidVZOE1oxeCvYCRBt
 1bSGos41tvg3JtUY+36YCZzwDlm2PGT9bpQHddZRCAHQI71TC0dEpBuJhZrcQlEXIGWt
 o9RQ==
X-Gm-Message-State: AOJu0YzyuN0hgKz9htKMLhc2Qv8THQFgfREKG9cP1d98p+T1dn6QbwcW
 7IQddJTTuGRqmk0O+i+51D3VVw==
X-Received: by 2002:adf:edd2:0:b0:317:eeaa:22cd with SMTP id
 v18-20020adfedd2000000b00317eeaa22cdmr1869460wro.37.1691584634894; 
 Wed, 09 Aug 2023 05:37:14 -0700 (PDT)
Received: from localhost.localdomain ([2.219.138.198])
 by smtp.gmail.com with ESMTPSA id
 k6-20020a5d5246000000b00317f70240afsm5617888wrc.27.2023.08.09.05.37.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Aug 2023 05:37:14 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v3 0/6] target/arm: Fixes for RME
Date: Wed,  9 Aug 2023 13:37:00 +0100
Message-ID: <20230809123706.1842548-1-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: KUsyN0Qqvxai

A few patches to fix RME support and allow booting a realm guest, based
on "[PATCH v2 00/15] target/arm/ptw: Cleanups and a few bugfixes"
https://lore.kernel.org/all/20230807141514.19075-1-peter.maydell@linaro.org/

Since v2:

* Updated the comment in patch 5. I also removed the check for FEAT_RME,
  because as pointed out in "target/arm: Catch illegal-exception-return
  from EL3 with bad NSE/NS", the SCR_NSE bit can only be set with
  FEAT_RME enabled. Because of this additional change, I didn't add the
  Reviewed-by.

* Added an EL-change hook to patch 6, to update the timer IRQ
  when changing the security state. I was wondering whether the
  el_change function should filter security state changes, since we only
  need to update IRQ state when switching between Root and
  Secure/NonSecure. But with a small syscall benchmark exercising
  EL0-EL1 switch with FEAT_RME enabled, I couldn't see any difference
  with and without the el_change hook, so I kept it simple.

* Also added the .raw_write callback for CNTHCTL_EL2.

v2: https://lore.kernel.org/all/20230802170157.401491-1-jean-philippe@linaro.org/

Jean-Philippe Brucker (6):
  target/arm/ptw: Load stage-2 tables from realm physical space
  target/arm/helper: Fix tlbmask and tlbbits for TLBI VAE2*
  target/arm: Skip granule protection checks for AT instructions
  target/arm: Pass security space rather than flag for AT instructions
  target/arm/helper: Check SCR_EL3.{NSE,NS} encoding for AT instructions
  target/arm/helper: Implement CNTHCTL_EL2.CNT[VP]MASK

 target/arm/cpu.h        |   4 +
 target/arm/internals.h  |  25 +++---
 target/arm/cpu.c        |   4 +
 target/arm/helper.c     | 184 ++++++++++++++++++++++++++++++----------
 target/arm/ptw.c        |  39 ++++++---
 target/arm/trace-events |   7 +-
 6 files changed, 188 insertions(+), 75 deletions(-)

-- 
2.41.0

