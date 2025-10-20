Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 075C8CCD1A2
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Oct 2025 22:12:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vAy5M-0006gh-82; Mon, 20 Oct 2025 18:10:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vAy5K-0006fs-SD
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 18:10:34 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vAy5J-0006JX-9x
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 18:10:34 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3f2cf786abeso3744026f8f.3
 for <qemu-arm@nongnu.org>; Mon, 20 Oct 2025 15:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760998232; x=1761603032; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mlOoyEXpkN3tIXY88+1raREhED3aLNcbV+Eg9JKDcmA=;
 b=S6SzRAST23sflyOUV4AYEPy2BB7aiWLgVqn7DHkL/YNK5xTPNZ1tCZMkgn0kfc0bBk
 FUvRUnDhaEuqzYYYxcYXc7ZUGx7LBj6ctBEehzXTlTjIzGotp2U5Z/ysYig5XRbDo4sw
 HkZVP794Uj0sQXA3fS9cOMpQ5KJ6Gx3vF+ak43mJsgCabuErihWmfuX3VjIJYcJjbSoz
 qVeqUOA6Ddn3nNW74oaiREp89emtMG66SsOqZ91jTxM4svj5BO8+c9POe2/rsF84YRpU
 WdHlb0l4XFdx11329dFJh6lsjt3fIqAZqt4jTewUStqosIjGSzFvGKEfk4/FrQePhmkl
 Qo5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760998232; x=1761603032;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mlOoyEXpkN3tIXY88+1raREhED3aLNcbV+Eg9JKDcmA=;
 b=mm5J4c3d6GII3eNWAiv3lKpiIzKeX7uB2lCASahguud5utujCNFu08Vn00nPnFjxqv
 A+fA/2hbN4xTn7UP20a22e8HdVauR5XfUXs7fGlsuD955d2sPDIfAMlFsIDFerDrwy+/
 sgjAAuKZrapfjofY1TRaqv25XT1E7Ow6uCt5WsL1smPw3qW3o8Nb/YQ9gZDhxzmwrbN7
 S0lCG1hfw/veP9Jke8hFTAwRvvdrJy23ECj+pl1JQWd4ByCifmWLnkuqEzyviz777yBP
 Du6iH41UJVy0TtRGHVn5uhzTqH56RIw1CFAJUY0P5hGpkWp0/xUhcsRRWjl1HqOM25Wy
 WYYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeh0HlYTrDQYSnnUXefEEzTYLtuAFo9MSvqYm47vi4g3eMlYou1R3VkJbrFU0ZXHpeeHqwNoaGdQ==@nongnu.org
X-Gm-Message-State: AOJu0YxDqOW4YSC9tnOKYwg8+oNrR6m+bsf6VNJ6ltRcoCtetIKrlKCQ
 XjAcgZEYWOBmttS5mpOeS/H2+WlXdeq67wx5Pmfi8RNDFRfuzB2rGgQ/Qq4PyB7F0pg=
X-Gm-Gg: ASbGncsvhfzftgKg+dUAuCRLWHhFljlar+0FbWC0Vm8nhtjTrjWuC0uOEUEY9q7iEii
 iqXC4ILoGq26RseJuE2buFUFlSw3e917V3RUVg0l7jYWs1PnFFPE/I7J50ktW+gTVTJ0Z4Ozd9S
 6jpiZrW7JsXLEoKHWpTttlgdScl2dyO25EmeSK/joQSH5mIdeskVqmHBxoo3/KgCscclRDmQvbU
 5CsWxOyYip8Jx/xOtSHyRdWJyKV0LWyt9L9TABlCC1jJvrkjvqJxWf4xWckoxZvX8+CsBoKc47k
 RAC3SJAHZtgpuoxYHJcAeFY3Pqa9yy20aGD/4kF+CQch0U3XlJPAEFgWNrN0uuEMFIxL6/29fiW
 6ewXPv0cRF97EEAmIlcU89FS+UisEId1uZvCs9FKHXZt3Qrk9UEE2Pqz0qyn+udWlWa+FR0d9oE
 1NS0A+VgLbX60DaP53xNONE8rCWC2XwsZOvkWD9tLNeQslxEqC7w==
X-Google-Smtp-Source: AGHT+IE2VTyDGM5yZZkIotHm4CaoOzgiK8FwiCEDrUNHL+Cb9wsYleWkodcpP69eRMHIr2+IdPzYQA==
X-Received: by 2002:a05:6000:2287:b0:426:ff4f:39d7 with SMTP id
 ffacd0b85a97d-42704d9447dmr9488463f8f.34.1760998231874; 
 Mon, 20 Oct 2025 15:10:31 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-471144c82b8sm250516935e9.15.2025.10.20.15.10.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Oct 2025 15:10:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v6 09/30] qemu/target-info: Include missing
 'qapi-types-common.h' header
Date: Tue, 21 Oct 2025 00:09:18 +0200
Message-ID: <20251020220941.65269-10-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251020220941.65269-1-philmd@linaro.org>
References: <20251020220941.65269-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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

When adding the TargetInfo::@endianness field in commit a37aec2e7d8,
we neglected to include the "qapi-types-common.h" header to get the
EndianMode enum definition. Fix that.

Fixes: a37aec2e7d8 ("qemu/target-info: Add target_endian_mode()")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/qemu/target-info-impl.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/qemu/target-info-impl.h b/include/qemu/target-info-impl.h
index 17887f64e26..e446585bf53 100644
--- a/include/qemu/target-info-impl.h
+++ b/include/qemu/target-info-impl.h
@@ -9,6 +9,7 @@
 #ifndef QEMU_TARGET_INFO_IMPL_H
 #define QEMU_TARGET_INFO_IMPL_H
 
+#include "qapi/qapi-types-common.h"
 #include "qapi/qapi-types-machine.h"
 
 typedef struct TargetInfo {
-- 
2.51.0


