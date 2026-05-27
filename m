Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7240CCD5BD5
	for <qemu-arm@archiver.kernel.org>; Wed, 27 May 2026 11:44:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSCfZ-0005Kt-Ct; Wed, 27 May 2026 07:43:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wSCfX-0005Iy-SU
 for qemu-arm@nongnu.org; Wed, 27 May 2026 07:43:27 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wSCfV-0008UV-4e
 for qemu-arm@nongnu.org; Wed, 27 May 2026 07:43:27 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-44a5174670eso6482350f8f.1
 for <qemu-arm@nongnu.org>; Wed, 27 May 2026 04:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779882203; x=1780487003; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+7GYxN2UVnGng7v1vHA64tX2rIv4kqC27OcexOk0+YM=;
 b=U5B9t06H7u9az+5T4GeRnxIWGoRLwNCaoQBQnTGd4fHVrC1oHILBAtYkPLfrDLMDM0
 Q7sELKEpsSfPBdYWx8DpbWeFKmShc6oBXTsZBfBJNHyzrv9wr0IRwu0ynk1FC9ijjj6P
 O2bLGunOXaG+5xofdoeQuJr6WPQ1eKFZAjvP/WdqKjn+tmbJnqxaoH9PdqLj8blI7LOV
 qPKjcJHRWUjFx7aEbViiiYN+UA+gmYei3iWclNLPgYRsuCWS2ROKGy8EuL/FkDKNtAgK
 IovycJ8UjEbugdcwFa5p4dBWbY4Mbzpnc3IzawYHSczQZl6fNqloKYBaFOzBqAa7gJaq
 +wUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779882203; x=1780487003;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+7GYxN2UVnGng7v1vHA64tX2rIv4kqC27OcexOk0+YM=;
 b=OZHD44rqcGq9tecSDn201Hs+1iYMaldGv5Gss4D50yZbio/L+iSbNoDZbz+XFrzsIO
 EnL/WlTgSa37c50T48IAejZKa4Rby4dU3U2suqbgkSueB4yK5/+S468v35b+150zg7Z7
 aE8isooCqLkUc0SYvs4P8ero3Fo+y9K7hY03j54NOc4iqemxboq+ek/jDRw0AXgTjIS6
 le3UrzHcfVlYH6vBoKwxXtihj1tdROGAp1B9vKK2BNh7Po6roiIm8M45Jx2SSHQSVnTG
 U9t0RunR6sCOsuVdH6uYeBwYPqtVuL99VyjvFtslzfvRGnYNHRE9DTtbmTcelH6F18yj
 tHXQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8j/9soSuxQA6NdVzjqpue7p1t9Nfp4nr/Ssyz59mpkYtDWEYuDFbe29bvH+CcRlm+ZB00FlfowZw==@nongnu.org
X-Gm-Message-State: AOJu0YwILasKPP/P2SW5udDFPEFkQIYhRihIS4VB2BT0+qmkVB7jH8Iq
 P0scoII5+SN+TGpA8pyAHqwMwrClWkF2gujFUom1xUGcgLnQR9FLpKmDRc6RX7aoqUg=
X-Gm-Gg: Acq92OFKVTKA9SKKempJpXEACHH+P5HdXCC2/VqG8v7NPfNyr2h0aPK84Vlf5kKMvPT
 gBfRKF/KFn4dtzM4RHiS+z2KCeknfIIMeK23/XYkGOOYbqdWos2LFkdzSFsp7L+hr7im2CptVZQ
 oIz5fePCVimaJiUYPQoTaCDDkYq41QSlIIemz85LsWDbEqhtYlHIwdYsCL8Lb/wdj83PkTBYyR+
 ivPPqqEg0qHmI5Tm5ADHM81n/ZaEyCegNjin6LYq7MFd7eUJyQ5KJ+/K1ehmREWMnuRd4QMgxeV
 BkgrcTHa1Q5pClBSs8s964jMYi9u7uZUf5Nqcx2VDNLeK14UZsayTmu25ihfkvW5MsxCYImdwlV
 ZG2xFQ28ZQBRfZ0hu68Igk+GwsdZT0+hc6X79qabmZ13mAq5IJmAi0GQhKGCixMekRyG3z8Dm2m
 uctLdad2oqB7qKbpIBUNNTQlR7EBQlUOyipw==
X-Received: by 2002:a05:6000:26c1:b0:44f:d9f8:c0e7 with SMTP id
 ffacd0b85a97d-45eb36731f6mr39921252f8f.5.1779882202929; 
 Wed, 27 May 2026 04:43:22 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45edb5c47a2sm5341167f8f.37.2026.05.27.04.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2026 04:43:21 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id E2E5F5F92B;
 Wed, 27 May 2026 12:43:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Pedro Barbuda <pbarbuda@microsoft.com>, Alexander Graf <agraf@csgraf.de>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v6 1/8] target/arm: fix WFET typo in syndrome
Date: Wed, 27 May 2026 12:43:13 +0100
Message-ID: <20260527114320.1581552-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260527114320.1581552-1-alex.bennee@linaro.org>
References: <20260527114320.1581552-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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

A stray x slipped in and we didn't notice!

Fixes: 4575da5ecb7 (target/arm: report register in WFIT syndromes)
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/syndrome.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index 4d1f1c529e2..0eb54c15ce7 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -674,7 +674,7 @@ typedef enum {
     WFI = 0b00,
     WFE = 0b01,
     WFIT = 0b10,
-    WFET = 0xb11
+    WFET = 0b11
 } wfx_ti;
 
 static inline uint32_t syn_wfx(int cv, int cond, int rn, bool rv, wfx_ti ti, bool is_16bit)
-- 
2.47.3


