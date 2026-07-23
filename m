Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1488C531CC
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Jul 2026 20:10:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wmzjK-00064l-1h; Thu, 23 Jul 2026 16:09:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wmzjG-00061m-Uo
 for qemu-arm@nongnu.org; Thu, 23 Jul 2026 16:09:15 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wmzjD-0006eK-1K
 for qemu-arm@nongnu.org; Thu, 23 Jul 2026 16:09:13 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4955484387cso8341945e9.1
 for <qemu-arm@nongnu.org>; Thu, 23 Jul 2026 13:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784837347; x=1785442147; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=RKyIBqN3S0X+T5YwXipes02FFm/ApvlBFwhhjh4hxUM=;
 b=IrxX3ZpAwEUA/5u0dKDSbG6tx8RrayIh9/1ZEhXDqcxWf32HsR5+PUA2Jf3AKRT+aZ
 JDmzWg5fsXgiu8X8lADv6FVOsAdUNS826O4aAakIxewCftuV3KzEdTvOQLcXvZYyXdb/
 xlTNdzdrRwySh+9d1EYbeorOdTXwCa1jZRLBg7LXEuic6VU6oTdjBeVbd+pUBw+VSifN
 SZyQ6Tl/1Nr/NIuKNJ0V8puDwgPh+Mc4q+EXZRhYkPx2bZnLINli1u/OHZQHGLXCldWV
 LwVWDOWRSuFF2Rez5lOSy4AS65LECvfqLr8oJz3VNwhf4AtRhn4J97CpV5Dj9ANJjV3r
 GeSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784837347; x=1785442147;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=RKyIBqN3S0X+T5YwXipes02FFm/ApvlBFwhhjh4hxUM=;
 b=mxGBRf59he6zxD6mGN+XCciPIqvj64Y4VRXml51YfUR173JLu9WndjoEujNqpcRO9u
 03srIBTUywqK3WbjNEwL5UdVIDvaWTknPDq6maoTrEujRZ471RyoPe63FbhUAndGCZ8z
 702cfiHJbxXdJdjSROCBOjJt7ebFK0fPhaOqDjBuYg1RtMo5vo4MqmPp6L63sHd6J1Dd
 kBCLIS3IF7yd4D1berhJZUex2LTzj4Y8L9q+57h26zxI63KwwPGH0daDVEv/wqHXvP6Y
 G4z5qCmBeLYzuczJS/6NvHqDIwQQhvR4brQ+epiZDIvtQnG4k3G6WVYEXV/Pip+uXxbz
 bizQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rob47KSFE/KiMAoNlJANUZ1Nw1E3T7a5jdOYKtvEsMgvjsElobYF3COOe6/kWQbDkT7ygcdQFcI9g==@nongnu.org
X-Gm-Message-State: AOJu0YyjSfCpbjSGyUYCoziNmXkVeBPrdjZ6hSCxkVeDLhGeZDFrvNKI
 zu6vqqY+93s7rN5hspZOfUTF0bAiisSsGMRft3M0ZILrXjxlGhCvwjZ8cI/184KPENk=
X-Gm-Gg: AR+sD13enpqidGCwohJcdhgiV7vmCOucgRKff/f4kVkpXlXQ8qS5XLALTwGYl1Yc3q4
 6C8/HJZpNLVpZxpExH3q1AkxclvjqdRLrsiFmlSfzWsM3ypjEZew9P/mtBJ3c6MBNOagZGvnvDp
 /dd6xcWb2IkAYM7HnB0Us+hzj65/y9AdtRDQhA1TYiTCneTWsf6wuPcinriT8QvqSp7c8UJXPYI
 AOYmCaRNa65Nt/l+gTMq3QIEpGee9WKySGcUrHXvd2A2cB4t6m0mn2QrHVDqNYt9/wThtYucaVw
 IQqUMbQVmPpB0+rOttl0B/E60YcTVqZMD071ZthQkA6huHAT2YFLPGh3uGnGVjRCAoLsbssafem
 UhX816JfvShFvLWy0ly9Aigpvv2mid0JQs7xAg6Y4fKWN+GDzZBaetI4r9qa6nPgkl4EUiu0o0d
 cc0w==
X-Received: by 2002:a05:600c:4f44:b0:493:bd2a:93bb with SMTP id
 5b1f17b1804b1-49573c8d564mr51653435e9.3.1784837346986; 
 Thu, 23 Jul 2026 13:09:06 -0700 (PDT)
Received: from draig.lan ([185.124.0.114]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4957b5f2918sm13923425e9.2.2026.07.23.13.09.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2026 13:09:05 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id A2B965F7C2;
 Thu, 23 Jul 2026 21:09:04 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Warner Losh <imp@bsdimp.com>, Brad Smith <brad@comstyle.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>, Song Gao <gaosong@loongson.cn>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Thomas Huth <th.huth+qemu@posteo.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Cleber Rosa <crosa@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kyle Evans <kevans@freebsd.org>
Subject: [PATCH 0/3] testing/next: random fixes in case useful (gitlab, arm tcg,
 macos)
Date: Thu, 23 Jul 2026 21:09:01 +0100
Message-ID: <20260723200904.224413-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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

I'm off for the next two weeks but I thought it would be worth posting
these in case they were useful. Feel free to cherry pick what is
needed and I'll deal with the rest when I'm back.

Alex.

Alex Bennée (3):
  gitlab: use .base_meson_job_template for macOS jobs
  tests/arm: add explicit CFLAGS for system build
  gitlab: add arm-softmmu tests to the macOS build

 .gitlab-ci.d/macos.yml                | 7 ++++---
 tests/tcg/arm/Makefile.softmmu-target | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

-- 
2.47.3


