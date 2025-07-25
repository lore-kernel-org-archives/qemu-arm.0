Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D301C87FCA
	for <qemu-arm@archiver.kernel.org>; Fri, 25 Jul 2025 23:09:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufRX9-0002qD-WB; Fri, 25 Jul 2025 19:09:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufRX8-0002od-7W
 for qemu-arm@nongnu.org; Fri, 25 Jul 2025 19:08:58 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufRX6-0001oR-NI
 for qemu-arm@nongnu.org; Fri, 25 Jul 2025 19:08:57 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-235f9e87f78so29120755ad.2
 for <qemu-arm@nongnu.org>; Fri, 25 Jul 2025 16:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753484935; x=1754089735; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rJjiNpYq8k65ULjdI+KSiLvLZ8E6sNk39U16k7ksgyI=;
 b=yzoFoXS4nmpOL1Zlus7gsXJXKxeMO6dI8e5xnFmBDXw1iIA2ebOeRlt7nMGM81t9dK
 sWOJz17UXWmA/vnbirmi0GkhtEK2O85yBSyFx1Tgd0Htqf5kxcy+Uy3Q5f/ZsMLTSrYF
 XtdCLBXz2GrTMO/b+pXXtiEMpAhB+8a3a1yxi6Y2UtptZ0nRxeEkwEUuJ3qpB0iHusbB
 pURI/H7BbL1Hok+dZulzVxSlOabeCHIgGF36J2fTMs2c7SBfXPEGB6exbBmD7NCANTFw
 GrmEcMNlII/RWC/k3NeeVYZDo/L8KrSxqmqwXcunTgQnJKS66V5WaYeWPbkV73jbtZKY
 paMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753484935; x=1754089735;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rJjiNpYq8k65ULjdI+KSiLvLZ8E6sNk39U16k7ksgyI=;
 b=X5ffToUW/WZHTesKAwXy8m3Urh1BFcEGtNV0H3X3rtPizH0UFk+uvcb0rod6G8j5kO
 KAosCtTugdrDBCce0YzzZY6XvM9gkbCeO7DDoj9d/ae9O6tuqzL37uW0X9C874Hg8ALo
 aG/foXgxSDmZDlyeL1CtWi6O15fvPnUL+Y+DcYtEkv70pmzW8wvFH1KkvpkG99EX/Vry
 0Rpp3bMNIZU0fuT0ckkS1I61OWl4mCatWpxnUCa0t8PECQAEtHKgM3S4HWwbj0/9h1YK
 6LRaCKFmT4+cOf5xzsvCesTyrd0QuKbRoFWAR4sSsu4Id2jscNsRFQ0CKck6CVeT2BBu
 dnDQ==
X-Gm-Message-State: AOJu0Yy+X007AZCN+ISQ1y8+yIBC8FqNdP3twZzOjgoWvdsfqhlWlDfp
 Tuc0bc2m9Ogg6LEeEXDFkdtPbfo72zHZg9ZouA/Y7DXwo3pzt+e4q219iNX64tWpu84KxVbwMs3
 A5FAH
X-Gm-Gg: ASbGncvYHPZENYC454sna6RyllqfemLI0MYiwa36TBoqZ7zaukIpMReMPzkdaz1SzMm
 kWM4rCWnEKavvMyBZJW7wcPoyKLFiefCP7c3zUZNnAEQgO48c1W8WLELHrBJqHUPID6s43raQGc
 bhLlBImZ+YyfLOngYB+n5OrnwRwOhwloNuATsRkiPqDiyAzwl7C4j3bXxv2fskE6vyO0vnc7Heq
 leDhHYxllKOYdeuQTrsG8LRqE23P5U7PeyxcYVIeySbk92rvnFcalW5C10lrpS5d5F5Dhzzl1lf
 rtu9CPRWraRV65gyK5ml6F4/sTtqRj2PNBYcTYEjUJrgp9FeTqaJCX2s1cx0SWZoNjXSU7pSjH5
 1pBFnGXp3Iw0AwRA69ryB1zpUHwqI8/AlzLsntIgnu3ywdtqApwkKyO+C2a95huSvfIlbu+Dv9K
 neG6lHQ6wAWw==
X-Google-Smtp-Source: AGHT+IHUEBrbl3psdfb+myW3R4/QoFWBrmQbFt1jEQMS9VoeCCfzNhtZqJajGeAkWnotcQSdAfrf+Q==
X-Received: by 2002:a17:903:1b05:b0:234:b743:c7a4 with SMTP id
 d9443c01a7336-23fb30e42a3mr62942525ad.38.1753484934859; 
 Fri, 25 Jul 2025 16:08:54 -0700 (PDT)
Received: from localhost.localdomain (syn-098-150-199-049.res.spectrum.com.
 [98.150.199.49]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fbe545368sm5033375ad.172.2025.07.25.16.08.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jul 2025 16:08:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH for-10.2 v2 0/3] linux-user/aarch64: Syndrome fixes and
 enhancements
Date: Fri, 25 Jul 2025 13:08:46 -1000
Message-ID: <20250725230849.13026-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

Based-on: 20250725175510.3864231-1-peter.maydell@linaro.org
("[PATCH v2 for-10.1 0/3] linux-user/aarch64: Fix SME/SME2 signal frame handling")

Changes for v2:
  - Split out syndrome handling from cpu_loop (pbo)
  - Enumerate all exception codes and document them.
    Include code for several cases missed by v1.

The FIXME in patch 2 suggests the whole patch set wait for 10.2.


r~


Richard Henderson (3):
  linux-user/aarch64: Split out signal_for_exception
  linux-user/aarch64: Check syndrome for EXCP_UDEF
  linux-user/aarch64: Generate ESR signal records

 linux-user/aarch64/cpu_loop.c | 153 +++++++++++++++++++++++++---------
 linux-user/aarch64/signal.c   |  34 +++++++-
 2 files changed, 148 insertions(+), 39 deletions(-)

-- 
2.43.0


