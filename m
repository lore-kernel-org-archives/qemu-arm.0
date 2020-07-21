Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3333026lfm;
        Tue, 21 Jul 2020 07:37:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmGJO+m1WcmGdlwXbU2iYjt0B0QElvl8aUFJswsWCwG/y+cHu1zrVQ/Bvc5BzgsTnlLwJl
X-Received: by 2002:a25:68d3:: with SMTP id d202mr41742313ybc.96.1595342230511;
        Tue, 21 Jul 2020 07:37:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595342230; cv=none;
        d=google.com; s=arc-20160816;
        b=jGyiPsCe8q8A3jfUC2d5ArxJoRtMDTbuhiN5I7qutdDcVFIIEB1tL7MbVC7VDiSdDn
         1qVIuTr2bf5XbxhTpDx54LVUkAiAoVUXXMSaGW02RsQV6vtnEVru3NybQT5AulufCrAD
         gehrxVKWoL1vlgDNN72ufxhzbY6gaB2+JMC/VwNFUE1FCk3y6Pslg7q0cvHKVXDWigTD
         UjDedTgX55Lgj9h4qjrqIgTKr8XehHJ+9SfURYxk7IiRr5grEnXCkLA6kRhd1/MBuiFX
         i9vbwBrY/G1XC/cXBJEtiUCTRg6OOIlv6PjhywrTZgXPlFzr8zT9BkOHirbntYTr17ka
         ChRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=6I9SMKjr6PmWwGXVMVs+FgMWnXt/xrUHEYtD8jIqzQE=;
        b=Xyscm9bOatNsh5N2F8TaP3kHpJnAQWnRta5qoixOKHlM8waPr2DO4M6qgqLvftXmQN
         XU7o36tl1mw3vzGHFgKP/fjEqE/+7dZUcbnJWJhXydLgYjYK/vu/7Q2z6CoC44kO9cnO
         mWSZ7f72VfjKdFSYmEZ5X2MkCQNm9UI1z3kYgtsd25X7uIJHcuUKeqkyj+8h+HGISLv2
         SiEqkfCWHS7Pd86pWyAhnQh6ibqi9tr0NxmYhRe87k42fedsiblIhIL1rhXacT6be+v7
         3bsQMeFL7qJMCdqIOhjOnqNjgWBjMTlaI/EZA/Zud8T6zMu0KVx2tukcUcT4OmD036PW
         TuQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E3CbQozs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y124si19046012ybe.473.2020.07.21.07.37.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jul 2020 07:37:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E3CbQozs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jxtOH-0006Zx-Pz
	for alex.bennee@linaro.org; Tue, 21 Jul 2020 10:37:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jxtND-0005JH-Pt
 for qemu-devel@nongnu.org; Tue, 21 Jul 2020 10:36:03 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:35297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jxtNA-0005m6-UK
 for qemu-devel@nongnu.org; Tue, 21 Jul 2020 10:36:03 -0400
Received: by mail-wr1-x444.google.com with SMTP id z2so21486627wrp.2
 for <qemu-devel@nongnu.org>; Tue, 21 Jul 2020 07:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6I9SMKjr6PmWwGXVMVs+FgMWnXt/xrUHEYtD8jIqzQE=;
 b=E3CbQozsFoDamjMdege56dKXM/NL68NNHKQc586Iz2lpblrO9DaqEK95piq06Dj9rL
 LQCG1ld3ZcWDp2G1unw0zWRQrSA+8D7KyY9cDaS4zclmWTIJG/kfiz2OA4uwnJgk9SoD
 utmCzpQXAyKWDHttRASX9PeNX1dNlPbEoXs2mxzxQ6A55LXp5ukeEy9wAN8tHuoxCYII
 EXz3pbUEkvZ+80aQDqZHpf8YeSgljP8mgDkdtVbmp23N1gA6CBIykhweSoZ41Zf4bd0E
 j3Jgph6LurEpGFQhykGO0pG/4+3ej2cjvOu7uZ7qForhQ6NywpQUBBH4Byguufhvcrer
 3jyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6I9SMKjr6PmWwGXVMVs+FgMWnXt/xrUHEYtD8jIqzQE=;
 b=c5YyihpFbEId1Vqn6N46MVb1hC9kKrPQWoVVb57hJxlisS1pCrcTCiZAmQ6oN5mpWt
 M2FCdG9kgp2evqfQQNfQ0cyurK9+Se6RXdA57Upb7iSY+DSon34zClFeMTKSRf91drK9
 NEJui4ey9I/HY+4voX5xu5VddSXKFJObcUnzIXIzBQ2KByoEgZYa09ovd6BNwtJ2nC8P
 WyF+OO8BldW8ya+7xy0kukLEurEyWtR+O+1+lq+IVFPxLpQiTYzVPhBzBarebGNKAHqq
 EKDdYGVL9Vdd/tX1/Bj3a0mY4ZWcJk3n3J6vg0Gyi5+avihqwESIX/pFultlVqyY28SC
 U4Vw==
X-Gm-Message-State: AOAM532gbhVJp1vtg8cMry/tmEDYN+dv+QH2vA3HWNGHXkY1RJQcmZtc
 uchQxonFg/bvoA2/XJjH/QZclw==
X-Received: by 2002:a5d:618e:: with SMTP id j14mr773165wru.374.1595342159082; 
 Tue, 21 Jul 2020 07:35:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id k204sm1985773wma.21.2020.07.21.07.35.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 07:35:58 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-5.1] docs/system/arm/virt: Document mte machine option
Date: Tue, 21 Jul 2020 15:35:56 +0100
Message-Id: <20200721143556.19484-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x444.google.com
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 13B9kDPZOqZn

Commit 6a0b7505f1fd6769c which added documentation of the virt board
crossed in the post with commit 6f4e1405b91da0d0 which added a new
'mte' machine option. Update the docs to include the new option.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/virt.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
index 6621ab7205d..32dc5eb22ee 100644
--- a/docs/system/arm/virt.rst
+++ b/docs/system/arm/virt.rst
@@ -79,6 +79,10 @@ virtualization
   Set ``on``/``off`` to enable/disable emulating a guest CPU which implements the
   Arm Virtualization Extensions. The default is ``off``.
 
+mte
+  Set ``on``/``off`` to enable/disable emulating a guest CPU which implements the
+  Arm Memory Tagging Extensions. The default is ``off``.
+
 highmem
   Set ``on``/``off`` to enable/disable placing devices and RAM in physical
   address space above 32 bits. The default is ``on`` for machine types
-- 
2.20.1

