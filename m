Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44716D61015
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Jan 2026 13:50:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vlSPB-0007Jn-5O; Thu, 29 Jan 2026 08:49:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vlSOF-0006bo-Fv
 for qemu-arm@nongnu.org; Thu, 29 Jan 2026 08:48:57 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vlSOD-0008Uh-04
 for qemu-arm@nongnu.org; Thu, 29 Jan 2026 08:48:54 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-480142406b3so7539345e9.1
 for <qemu-arm@nongnu.org>; Thu, 29 Jan 2026 05:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769694531; x=1770299331; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=i39vnueW0R6mJX0qhth54AsfO2wnFdadpiJr87YviR4=;
 b=tnHVOhfwYTDELr8xtXM/tF077RZmD7GOTkgCHz2VdQ4j+8/LlTvEx9FTR7xDbYYKiB
 j7rpzmL0WZOunE4p4bPGRQ0jBQ0OTUSipI9S4ORd2WaLeQf8CvfKtRCIVwNK0YoA6jLj
 slKeelhlYZfrSeJTEOaPsZcI6Ssa2qvvR6N47brqzYChZ0bIaynKjxHk2VX2oDbRAXms
 326eDlSJ1fnq8UL6W3uKRt6CRazrCcL6phoK07W0/afczn7ZKgHL53q2g+9z6pkuG7oV
 GCPHbpLufeiP8OkH2+/cUDAgo2yirB02QdFdUOB8j9bzTUDytcflKc4vczq3yP/rPft4
 busA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769694531; x=1770299331;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i39vnueW0R6mJX0qhth54AsfO2wnFdadpiJr87YviR4=;
 b=phF2J32A6xZrmyhOv0yDaZQ4Tw9hlFi8HUXb1GLqFM/6f6leFknRbEyD0OU3UNIQQl
 1UnW/ds8CDbaBUU7g6ponf5nFKL6xVy7yiJXawtRsYxqccYLyb5bZAgnPz0SLFE6aJJD
 9CxYKs+TAMrzHIPmIaUgCve5ApnNn3LnyvFucheudKmvBo0KCdPfIQ//RrZXK1pt7fXT
 sci+c4uVwvzdvKEWpex5GoQjXzWkgccoaKHiioyD+iqcj8lvJYlO9bzDlexJGXE9FXMW
 kvjRl9L1mTr31U2j/4BkfDA7OkIJaG6oyQXkAJ2JOfUg10YVN+LqM+1jTqg24O0v+mUY
 HRUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAyuPvBclsyJtvV870tNolIU/Wo9KCpUa1eqEHQEU1/IODqUUK57LVYyKcRO/PqFSkAiThzh1Sww==@nongnu.org
X-Gm-Message-State: AOJu0YzzExtmKHMGYZkFYdd3VDA5KNEmqhXoRThNYIgLCqBaAX2O1Isy
 esaD46U8mq3boGPI0QvbBHXOkVtD1+/UCJ2L8z9Pg+70j42k9SDuHyvZbKKgIvGrIjc=
X-Gm-Gg: AZuq6aJ+8XnVQ/eiEe5ulD+jNfTTxQN3wqLtxQbOMM79vrT71Y6Mq2ofnaDsTJgmpC7
 tzwYk2v8Zoe4Z9KKm0Deeg+1KKyLEp4H16z0t6Cw49b6kdcQaXeuzqIcVRMdA53M4ElKIuPZEnT
 Av27N1ZpDUQEXIi0D2+fWvAYasJDwY0EuYnywViHvHvFGeCdMhgBwl3+TObMU++NN4BTKDpQGkP
 DYxzp6cohyKUhMNYZpTCl1kwSLiGgfaKH1IxhOUp31N0Z643XGu8FOJhTshVFzOlk/Ke2vXMmVG
 IFSOjFdcaiOmqtxOOR4pLUB5dla3davQsqf+srS2dMEDmLRcX9mlyyxwMirn89TT81z6gyiiV0D
 eVGqaXIC/9fs97UM+RlO7M7fe/q+WU2SWCcK0lSW7DlfDoA0v7OO4GtJvlw0UY0sfiIgyaLJA+5
 y4QsGbTdNcmNyXsuVuhKjsECPBPzwHVOIQCBihf2pZanNgsWepk2Jdu/LlOru1
X-Received: by 2002:a05:600c:1994:b0:47e:e2b0:15b8 with SMTP id
 5b1f17b1804b1-48069bfa73bmr114142145e9.4.1769694531006; 
 Thu, 29 Jan 2026 05:48:51 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-481a5e1b21fsm4400745e9.17.2026.01.29.05.48.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 29 Jan 2026 05:48:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>, devel@lists.libvirt.org,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/2] target/arm: Deprecate '-cpu any'
Date: Thu, 29 Jan 2026 14:48:47 +0100
Message-ID: <20260129134849.36557-1-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Arm '-cpu any' is aliased to '-cpu max' since more than
5 years. Deprecate the former in preparation of removal.

Philippe Mathieu-Daudé (2):
  target/arm: Remove dead code
  target/arm: Deprecate '-cpu any' (remplaced by '-cpu max')

 docs/about/deprecated.rst | 8 ++++++++
 target/arm/cpu.c          | 1 +
 target/arm/tcg/cpu32.c    | 3 ---
 3 files changed, 9 insertions(+), 3 deletions(-)

-- 
2.52.0


