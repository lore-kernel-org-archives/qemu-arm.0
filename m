Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A57CCFA07
	for <qemu-arm@archiver.kernel.org>; Mon,  3 Nov 2025 10:16:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vFrak-0007AN-SV; Mon, 03 Nov 2025 05:15:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vFraf-0006y4-Eq
 for qemu-arm@nongnu.org; Mon, 03 Nov 2025 05:15:10 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vFraX-000357-7V
 for qemu-arm@nongnu.org; Mon, 03 Nov 2025 05:15:06 -0500
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-429cf861327so851781f8f.0
 for <qemu-arm@nongnu.org>; Mon, 03 Nov 2025 02:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762164897; x=1762769697; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SwbaDBH3uop6eLfaqXGIAXVHT6IrJiklTC3nfwY6u3E=;
 b=VYdbUOlY2q5a9jb+mPXi8RCoXOLOu3UEs7TSf366+WuPCUvDetaW6hEnTyPpTAuuzt
 zhLpc0HRs7b5Neca20wxg0xMp0FUy1Gz4gdqsSM3X2pnV6V8JnOHWsmCXCmYKLKFmiYK
 TkESUSIQL2y42YhhU2NwE5I1GqYLnHeCKxWdAw25mcHd2VU0+cp4Rf8V0ivt7oeX7V5O
 fJstPR7WEGjEyNMF5VBwXqZBP05FOjRO/B5SAcdGMrOt3nY3WG+uvOEyr38VcFI6pTnc
 C/KNrIlTGKRsMg7VY4CwGb9RpV6TK6NqTCDentI/tgGqkmlyw9Ogb45pui3Fc5AiOEQT
 gx+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762164897; x=1762769697;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SwbaDBH3uop6eLfaqXGIAXVHT6IrJiklTC3nfwY6u3E=;
 b=fwyKK2WHePLii5/mrDTT+RRoBy+hzWy4eq4AFp303DXT84OSGK4ijRzeJiclAO8ImO
 GIfteEyLcq4PZwc1DlJaKH6O6mjb+ax3YUDb7pkaGWi7KQmgA1sI+xgoJ5BjxudVzrtG
 /2o5CriVpaj/8cM24aEFeUJeocPzZxFzQTLH+eAWJ54xHc8V/C17hZqmvxa8MKiZ7Z/z
 Q1g4bhUd+RLasnC6Bn6RHYLEe1he47SryGKxxXcQbW3/0P58k6NTX8ppZbA4H13MZ+hz
 /BCQbBZ1wH1aLnBu5mMj0gqNd4+QmC8LPHowqo6USPU+XzQ94QNt5afMZjcSZ3/HPJey
 SD3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXro3KthYv3wps9+WIG1TyJ5Exl1isq3hVxaeHOWx375qnTkwjhTdH1+fETob7uOi9S6Y8MZvv2Rg==@nongnu.org
X-Gm-Message-State: AOJu0Yz8tlmrmsgApeWYTEjYU280wtdpYQ9y+ANJw9EYxBpzKiJk8v+D
 fgg6f0P4YkodDJh3vDbdXJIHSn31BVaSLUkYV+/Dl/I6fusUDcM9MeVSLVTtCJPbinE=
X-Gm-Gg: ASbGncvBijuxP/rIl7c5TRv+ComidrHSrrvAoVcRUfeSddf3bGwp8+RFAYtbsqFolr8
 OeVxFiz68L4SXvW5NuExxDF4RxMe5vY4F+/6F6THSOCxmBkJjCcTkt00H0xkmDDjY4drq/qwTW+
 0V0ddb7v1s+lDdw9i/kOPIOTRZ3tXKsmrN4rH6iwie/cxAePNEO7/BJgaFnaG3pqPIvNLoWMQqt
 5VnAClSshD7K5/FAy7Vx/gJLmMMFFmt7iFwiYqHQxQpDyZSLaV89OAdmi89U7tuARSjDk4QrENf
 Y5cozMnUw+hLCEHso8ZpqoNiA5Q4nxDzKVZbKztaKitg4V4ExYEAIB5eFf/qTfegdlNnFDTKrTz
 m74uDNIIlpXnULtVJ8Tgk1y8XOMx175/6U8nH7C2nzEq63+yZ47HDjeB2bQvGKvi+5s/cu81+dg
 E8c0NXfY5fpa/krkwxUNu+ISos73m1lPT4/QsyvKBX8wcywU1TCsCVR2FtVpQ=
X-Google-Smtp-Source: AGHT+IHHcOWqv+uwo+HmK/GL3fNrGaXs9ETNHTZr9sAG2rAvYdwvB1+00WCsAe6B4i4d3ZEq2+WYaw==
X-Received: by 2002:a5d:5f50:0:b0:408:d453:e40c with SMTP id
 ffacd0b85a97d-429bd68774bmr10767807f8f.25.1762164896903; 
 Mon, 03 Nov 2025 02:14:56 -0800 (PST)
Received: from localhost.localdomain (ip-185-104-138-122.ptr.icomera.net.
 [185.104.138.122]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429c140629dsm19505975f8f.46.2025.11.03.02.14.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 03 Nov 2025 02:14:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Roman Bolshakov <rbolshakov@ddn.com>, Alexander Graf <agraf@csgraf.de>,
 Phil Dennis-Jordan <phil@philjordan.eu>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Peter Collingbourne <pcc@google.com>, Cameron Esfahani <dirty@apple.com>,
 Mads Ynddal <mads@ynddal.dk>, Mohamed Mediouni <mohamed@unpredictable.fr>
Subject: [PATCH v4 10/23] accel/hvf: Remove mac_slots
Date: Mon,  3 Nov 2025 11:10:19 +0100
Message-ID: <20251103101034.59039-11-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251103101034.59039-1-philmd@linaro.org>
References: <20251103101034.59039-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Richard Henderson <richard.henderson@linaro.org>

This data structure is no longer used.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/hvf/hvf-all.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/accel/hvf/hvf-all.c b/accel/hvf/hvf-all.c
index 76b8d4d4068..cbd0858b763 100644
--- a/accel/hvf/hvf-all.c
+++ b/accel/hvf/hvf-all.c
@@ -22,15 +22,6 @@
 
 bool hvf_allowed;
 
-struct mac_slot {
-    int present;
-    uint64_t size;
-    uint64_t gpa_start;
-    uint64_t gva;
-};
-
-struct mac_slot mac_slots[32];
-
 const char *hvf_return_string(hv_return_t ret)
 {
     switch (ret) {
-- 
2.51.0


