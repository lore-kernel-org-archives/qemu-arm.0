Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6AEACD5BB1
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 13:20:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQ3I5-0004M5-22; Thu, 21 May 2026 09:18:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wQ3Hj-00044L-5I
 for qemu-arm@nongnu.org; Thu, 21 May 2026 09:17:59 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wQ3Hg-0008VG-O8
 for qemu-arm@nongnu.org; Thu, 21 May 2026 09:17:58 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4891d7164ddso33281095e9.3
 for <qemu-arm@nongnu.org>; Thu, 21 May 2026 06:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779369469; x=1779974269; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rTVlKsaFgg0tIzupuoHVqOYQ+PBnu11p6ihQwnWRn+4=;
 b=u5Xuve2wC1CvpX/ej4YU2PeE7Cg7x6KZFEQR6kjCKSw8irWL82S9+yQts288HeGnQJ
 J3VdP8cXTXuMqF8K62Skw8ITusG4X9z+znrL9pNPn5m4NjM0PtnOIMHOfzxyLe7XvffJ
 BUUkiDzhazjTK0w/VQjI5hRRFp4FzKKd1BVKX4vCSfXvpFimKxasjrswLhaS5rc2aJpY
 A7siCR14aI+t1SRFG2sZ22f9X80WmieUbGza0DZ934n0uj7Gv3Mva/lcra1hRKM8Gnyd
 S44q8p/Wy98On0MaRKkvHzA6F8tSLT0JPnj4D6eqSYVHL0IoPcOzdh54rnqZmnp522Oq
 kmCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779369469; x=1779974269;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rTVlKsaFgg0tIzupuoHVqOYQ+PBnu11p6ihQwnWRn+4=;
 b=jlJBLH5KFEEGt3I/ZXzLKyeEbxPDuiLtPlVGMmLOB3DnnDYZVoJWb/a9/oJVHheDaa
 y/GkiF2UkZU3VsYdwMj9wXqnsREtyrTv/J2wKo4WddBi6XU/A3toeCD5ZG5Qv+HtMQpd
 hPdVjYu0B1BZyhJVpm97LUhTbX8SZ9oHvzBy8n2NM4GYhwHCUZvvJFZN9jXhr4Me+ThD
 lOzgbFW7czfo7NEDtQKYEJwKKZ9gD+dp9iv6pisSNGAFehKDKkR8beVTZkUP8rpt9wll
 ZvTYevQZ64VkJf3ree/Il4KF26wcnNpuymso3QaV2zx/ycGTAzaEHKOvVDWCVb1EAfr1
 PEMw==
X-Forwarded-Encrypted: i=1;
 AFNElJ89zyOtjjg9JKpRO5Bs91hlA9KLMtO0pyCMieYTXPhgmzNUxantyLYGMgpE7GWn4LgJcn7IkVF/mA==@nongnu.org
X-Gm-Message-State: AOJu0YxnR3mZUo3P2a5z7pBbE35WkDJpvfmZ51cfU4KSagOAjEA3PlqF
 RPY2Yjcmhp0QHThYXfodEc/eDoYjuZ08cGeulPOze3lDRwrqe97e9B7qyDwWkGNwxEbR7oupS+w
 TSw3/lUQ=
X-Gm-Gg: Acq92OFEMvR3rw+jJ1yT9d3Y5i7dJFHrPa+ifC6Ca0HTrCxuROQjLHMnDEVLJvE3zQ7
 FzBEIcY9oGSUY9zpbdl7vuP5MpRDuxvLE0CStivmYsWNxWkJE3VvFO1weqoOONolowqghgMeSui
 fWlhNYBTYRzjyXJjOgFd9iTD9nnzuV0kTuTluRVz1ilFpk99eWTORrDhaQOCkN1s6TuS/F/q5MH
 DuN1CZxSWNwcErKECs87UykDoiYBO2EgOtK2QB5q+BdO9qK0ymRvAh5n6+wIl814+4wO3QHRi78
 nLLV5Ss/4bBlxjbgwVaNhCYvqN5Jkq5X69+J8o99VQsUFG/KzPBr8VzzNIdCpVp+/r07gc8AOBh
 9CnyGnPsNe50xXrf0A1xXFUoV7izBXFxLxPsfYbsZQ5r6SXJ8lDeYanFxvRIV1XOQWGg89+he+O
 EG4GseXok0TrCTOlHYGrqgpUU=
X-Received: by 2002:a05:600c:8592:b0:48a:5970:1fe1 with SMTP id
 5b1f17b1804b1-49036033339mr35805995e9.4.1779369469024; 
 Thu, 21 May 2026 06:17:49 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eaa92ca96sm2598593f8f.19.2026.05.21.06.17.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2026 06:17:48 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 6482360E4D;
 Thu, 21 May 2026 14:17:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <th.huth+qemu@posteo.eu>, Song Gao <gaosong@loongson.cn>,
 John Snow <jsnow@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Brad Smith <brad@comstyle.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>, Fabiano Rosas <farosas@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH v2 12/16] MAINTAINERS: Cover debian-xtensa-cross.docker with
 Xtensa section
Date: Thu, 21 May 2026 14:17:34 +0100
Message-ID: <20260521131739.540157-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260521131739.540157-1-alex.bennee@linaro.org>
References: <20260521131739.540157-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Message-ID: <20260518102222.80735-4-philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 03ec57efe75..c04fc1cd2e8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -445,6 +445,7 @@ W: http://wiki.osll.ru/doku.php?id=etc:users:jcmvbkbc:qemu-target-xtensa
 S: Maintained
 F: target/xtensa/
 F: hw/xtensa/
+F: tests/docker/dockerfiles/debian-xtensa-cross.docker
 F: tests/functional/xtensa/meson.build
 F: tests/tcg/xtensa/
 F: tests/tcg/xtensaeb/
-- 
2.47.3


