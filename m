Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A717CD5BB4
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 13:18:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQ3I9-0004bo-6O; Thu, 21 May 2026 09:18:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wQ3Hm-000468-AP
 for qemu-arm@nongnu.org; Thu, 21 May 2026 09:18:02 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wQ3Hg-0008Vq-RO
 for qemu-arm@nongnu.org; Thu, 21 May 2026 09:18:02 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-43d75312379so5106067f8f.1
 for <qemu-arm@nongnu.org>; Thu, 21 May 2026 06:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779369470; x=1779974270; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gX4uwIwh+gHTvHNlBYIefbjuQa7ojD4zYP/K46jOPG0=;
 b=x3IikaGdVHn45Z+cf1hRJoI9wswbTq/+HpBTALgLWePEGKKIfBw+PZYk4iO/cNSITZ
 7RSPE9Fjd878iIau2w05b932f6eQ83FzC8NUCcovzLbYPyFIqWpfSLJ1Ur8cne98md52
 Fz2lObOInc/sRIkZT8soBa6+5ezrObRgTXnb7pMfadE3zM6QIZGxlrbPN748upC0a9yB
 tqZb2iDa6r1wVmde12moOP4K4IAz8Uw2V2jqt9azmApX8MPjltim/w0CIICntTFNfSeZ
 iNxVbpw6lLPKkizKEm3onAQ0RvEnPmKO6vxiHxyiyka28qennAJCOavASVVahsEXMPgU
 BkQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779369470; x=1779974270;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gX4uwIwh+gHTvHNlBYIefbjuQa7ojD4zYP/K46jOPG0=;
 b=kqjVqNqfVuAvRl66qLIwsGTWCcivfYzdCDUjcMElXS1p9xn2t/BnZ8DvcYpY+ltuTl
 LskwOGDF/nIWC+AHh+m0IGXPLLLdAJsi2kz4Eoc7zmiYwRcpze+XK9uu0OySbVLJgu3N
 CUmR5rxJfu+beir+en6UCT3VPNAVe4W4y4NSVvX4HYWXd8JcAHB8g+QA9Ke/MXYfaRr7
 dRtkQpmcjKFRftvFY+mgNjRWnrer3dw9hKJKsrZL8h58aHp9NS/uc1B1zt3GPlg4x4M7
 kfA8xjHtBkKHeMKrYT9LeyAhwh0MJXvdlN5EcNGOsITFhRDfVvcFEylX/lT9jm2tDfkE
 DBDQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+PTvervrbw/NSRtsdmIjhxhyGef+W9wSgJQTpHcPylyRaGAKfQz7Ux8ysVZNSVCsMMy3vVUCzPqg==@nongnu.org
X-Gm-Message-State: AOJu0YyqmNrFhh4k7Mv4S36fcA7NGa+Y5S6b4on3/wb6HwA/hRhqrTGr
 +M/VsbiOW8erEkkHg3EhPauUAxu5AsLKyCURxu4WqMx5V7vHGCgOcOimv9VCDw18oDc=
X-Gm-Gg: Acq92OHr5nPdwqQQ4GcDKTyDGJHHNChwIxuj9chNdMW6oQKOVjRAKQtTT55aCSHQkvo
 c9r148Tn6OHTPxYhhsDA9uIa2GPa13JKAhUBGDG74fqlcxNnbqPIXTpXP0p9RIkSQEde///k/C8
 zzBAXoKf6vE4uTDTAfgT9TMMC7HiYzSXF1d0tljomQ38g/wv8ZlL3WpFv/yWun3mBb7EDI2PxWv
 xFQWk8ixRWZuVYJGkswwkE18iTkmIBshoBcZ21jaBZFd4G8FBYBhFrwQjR26BuaR5y4GM38YDSC
 Gy+VPiXKWBDQuDJHUlB/YAycBWt/8iGRqlabs4xCiwErU0znTLCL/pqY9uO0kh4A49+e122ism8
 xXpZfgBk8t52Ynv8OGdccbkhnnsQdK90TuL5kmG/RVkXXmUcMSBhmgpAwncuw9WkHVO+ONwBq1s
 ClidBWeZFqrmaIYWc/NH/KwR8=
X-Received: by 2002:a05:6000:2798:b0:45e:733a:a0ff with SMTP id
 ffacd0b85a97d-45ea31290bcmr2916217f8f.3.1779369470093; 
 Thu, 21 May 2026 06:17:50 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eaa92ca4esm2870798f8f.22.2026.05.21.06.17.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2026 06:17:48 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 92F3861015;
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
Subject: [PATCH v2 14/16] MAINTAINERS: Cover python.docker with Python library
 section
Date: Thu, 21 May 2026 14:17:36 +0100
Message-ID: <20260521131739.540157-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260521131739.540157-1-alex.bennee@linaro.org>
References: <20260521131739.540157-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Message-ID: <20260518102222.80735-6-philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 62754d18341..bc054a6d97b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3484,6 +3484,7 @@ M: John Snow <jsnow@redhat.com>
 M: Cleber Rosa <crosa@redhat.com>
 S: Maintained
 F: python/
+F: tests/docker/dockerfiles/python.docker
 T: git https://gitlab.com/jsnow/qemu.git python
 
 Python scripts
-- 
2.47.3


