Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C6E1CD5BB1
	for <qemu-arm@archiver.kernel.org>; Tue, 26 May 2026 11:06:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wRpYy-0002fU-Ne; Tue, 26 May 2026 07:03:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wRpYm-0002Zb-MT
 for qemu-arm@nongnu.org; Tue, 26 May 2026 07:02:57 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wRpYj-00062p-70
 for qemu-arm@nongnu.org; Tue, 26 May 2026 07:02:56 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-49039a8851fso48738705e9.2
 for <qemu-arm@nongnu.org>; Tue, 26 May 2026 04:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779793368; x=1780398168; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I3yYafY8TJmCrFTnnXsB+UoyMxcWEdJ2PX05QeDqqFg=;
 b=XaeDs8V8IMKLx9SmzPhkq6rNmRxc8on7aYmUg4HXeYonYtsryNMkKcvYT0J6i1J1/W
 GwQ/cuU/g+gi3lr2vr23iVJ9CJ2U2XRllW+RPGxVGn6KT1Aoc6z9iGk8L/7Pug8IwzTG
 qgP/dmMmA6LRqnYwQxKFTGqjmoHz2k8re+9RJYNZogXGOflUuv5ZVzJnbFcy9uDhhjxb
 Cd8UWsCqf1J4lzwlIT1HD54brDghspeqQVyNaW90Tu3XUZg8/IvRSeNamr+cJSa4G1R2
 o7opPigrakYxPAiL4z/pjGNrajxgGtNAES9QfzqjQbfcYdMwjfob4yCuRtJonCCQYGXq
 rzmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779793368; x=1780398168;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=I3yYafY8TJmCrFTnnXsB+UoyMxcWEdJ2PX05QeDqqFg=;
 b=SljkboA/rV5h2P6bQ1KwBqyanVDTJuq0axNgDCNIFvTs2+esBWZmdsKmtvKb8Aeacc
 G2FRNKcn8SpOlbDBTq1JBebk2IKWRab/ZruVLlvKicGPOa1OflKnRCoRuIcibCnivHIh
 HIG/SeNaD4WFsWeaWS+MuNzoK4FXcV0/Sd2W0bkwBIHq+1G076IWZY6hI0n7XzlIdqyL
 ttxVfertUmqnvL4FZy0Edz+5UVJ9Fmdix7tIfizSGpoOEMR4LVXjvasqSCdh7TK4WLo3
 65VAOkvGaU2sbe2ylBpJrhER+qeSCtna1k6Gylccn54mG48mMCPBpuKbVwMVjX9sVPRv
 OhEw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/g/uJixAfO/vrIcOhxLyVEEPPikhC6VavEUcdaTpFjdsN8BfuPB7VDWC+ipspFP7dPz1PyczWi9A==@nongnu.org
X-Gm-Message-State: AOJu0YzgpSCmh32rUpkPJze/qt5FQDnP6RHjxwHdQdYHU17mgWlbnidI
 agra7YP3RmskQBLEgcmcOI2f/sHzz7uNWoaj/zfuj3NvwR89/ZKMfPsl68Z9YHxh1wA=
X-Gm-Gg: Acq92OEfYguaDBIOIJ6Eylr7uiL79oVFXi1IKoJBa+MimMBL+gJwlp12BcPmVeetoxD
 6TcIEfm7vHp5suUEezCT+s6ehGqLXUWxN/dlAVoLNifUifPfL6HlOIKDGmiTp933OTFL0vcbwIV
 Dk+xf9t3yXiOiYApjX8D5QGEHZDy//LRwTh4tTiMWHuInXra0e4yZANAi5hzwDmHTPwgZv5cQdC
 6QkQnrfm03MQAHT6xl5V1u8Auftv0gh3n/PRyLOUAHEbrhrYvu2vLytR4gyAZiyBHT1DxBAbETY
 UepAOvuUrIT5uuPI7oBpFVGEYNCqKjVrnPA3uHntNJxAYVayqUsj1yuNQP6IqVWa8HF86mnqVwI
 GpxHiOJncDQ1qvVxfAEY7OMjsEsiTc4oxgcdNk2ArCgYRBy7NEWZUbllpBIrJkK6QVmukCSbYn7
 +5oC1O68U0/qShCXFSbYnFG0hkHClFyIBS2w==
X-Received: by 2002:a05:600c:3b21:b0:490:6889:200 with SMTP id
 5b1f17b1804b1-4906889028cmr96776855e9.25.1779793368368; 
 Tue, 26 May 2026 04:02:48 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eb6d48e23sm33380497f8f.20.2026.05.26.04.02.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 04:02:46 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 4711060452;
 Tue, 26 May 2026 12:02:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Brad Smith <brad@comstyle.com>, Thomas Huth <thuth@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Kyle Evans <kevans@freebsd.org>,
 Thomas Huth <th.huth+qemu@posteo.eu>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org,
 Warner Losh <imp@bsdimp.com>
Subject: [PATCH v3 08/14] gitlab: update issue template for binary test cases
Date: Tue, 26 May 2026 12:02:36 +0100
Message-ID: <20260526110243.470002-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260526110243.470002-1-alex.bennee@linaro.org>
References: <20260526110243.470002-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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

Binary test cases are sketchy because they can be vectors for phishing
and other malware. Lets strongly hint that source bases tests are
preferred and binaries should have their provenance declared.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-ID: <20260511161757.105994-1-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab/issue_templates/bug.md | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/.gitlab/issue_templates/bug.md b/.gitlab/issue_templates/bug.md
index 53a79f58284..e20f586008d 100644
--- a/.gitlab/issue_templates/bug.md
+++ b/.gitlab/issue_templates/bug.md
@@ -55,6 +55,10 @@ https://www.qemu.org/contribute/security-process/
 <!--
 Attach logs, stack traces, screenshots, etc. Compress the files if necessary.
 If using libvirt, libvirt logs and XML domain information may be relevant.
+
+If attaching binary test cases you should describe where they were obtained
+from, preferably linking to the original source. We greatly prefer test cases in
+the form of source code that can be audited before compiling by the engineer.
 -->
 
 <!--
-- 
2.47.3


