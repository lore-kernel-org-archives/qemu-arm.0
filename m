Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D78CCA470
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Oct 2025 17:12:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v40LH-0007nl-DR; Wed, 01 Oct 2025 13:10:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v40LE-0007lv-Oq
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 13:10:13 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v40L0-00034s-0B
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 13:10:10 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-46e61ebddd6so547595e9.0
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 10:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759338592; x=1759943392; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HFZ8C6dVlFXouFScJF89eaJ6YpiH5CFvMgWd/SVwrhI=;
 b=cZJYQFFJ1lIcexnskGyayim5Y+lZ6vX9YLRRcc+CEIKJK+8N9QBrEM8vcg+Bv9J7WP
 EXQXspYcFd6ySzOmlVRM5kKSU0yUeuiyJ2LAiQfdAhz1cBolrvclixHJSr7aGNoSCiPt
 mwaCiPQl4qqOu0MCKwJLBVWzllsQC4njO9/V98Veoyvm8SCxgs5if0T5LYzrQR/qipkv
 qHpu0sMypOEqHz8Z33gB7RntLnFpWL7CLAGmVsmdIv2eKNrgFKtqiRz/YbZ+kaYLYlJM
 6yHLLRopbS9+gXopkumUztMRLAKOSx5VD/kp6irZMWczAjx0hiHUk5Vk51b9hAMp5AT+
 LQ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759338592; x=1759943392;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HFZ8C6dVlFXouFScJF89eaJ6YpiH5CFvMgWd/SVwrhI=;
 b=bkNHoAinq/7pkgLbHDUpVC0lmdMBaokR0Lef6/1KN3c6RNCKmhBjJC5hok0u1jCoQK
 HST3uxgSGJOKn33xsTjT/34IkuOLjJB3bf3n7jreANhPxtrro1yy96azIbpbh2B6Nc9i
 eQMVsbbUneFn2bMavsE2YRVTkqaZeZkhhCHIyYQN6W9qwz2Lw0d8iFbFxZbP3RSwFPYi
 G6zAYnJ/euDUWVFiE0jAeQoEl6CSVnVOd6GFo2JAE93NLKnXdThWupOzr0GKuJRlyYf/
 oaopvjtLFJk8vGkxfBWPHP/6YYFtaJlG7Xi5DpivSsM7XpsIRWXmDlcb+oHh+UkV1Dn8
 kYXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHOzTrmfpIOgWFvucMS/IC15YHJvhiHZxvpHiDDRJTZAYyIVD3amwZVswdCG3aVhhs4ZSWQA2epw==@nongnu.org
X-Gm-Message-State: AOJu0Yzv2xoVg93xUIrWhX7iBlKBYEyxjMqEDhBWJ4H5eol33TW5einW
 dhcn0n6MgFMNlgPjFaR7gY74hvNh1iKhLYNNguHbWDb/0xgTyHTsqnP6kwDCPUMCQaM=
X-Gm-Gg: ASbGncs7iN2w94q+CT0duIAxusL4xCnAirJ9uKfmkPWpJiqYlyMKJKbZ78EB/iPe+Oh
 +rlmFLFrMjpw7XbdFfS0bjXBhQ7MIrrqiEsmSMlS1AW3NboT6CANY4oUfodU44xatCAwY2eTczJ
 mGMWGu7gLYTc8+aAtvCM9VXYE9vIaZmt/ggJmFhHgC41ou8SyxfhaNJtQfp3fhBc2c7huhYy+5i
 Nm88D89TPw0hHkID3QxmCSjQYZtU8n7npjnkMr042JUddd5brn/sRKrs6yOgeXZ5WEyhAOmSKLu
 k/BkECGA+dgWrj+ddFhmQ+y9NwzmoqEf1brpvWqiuZz7mtph49T4KaLxBWinwoaDEsHmyaNU/FV
 6YHKEbPAZD9BFOnVdcCx3b1pzon1HV8V0B7+hroFB4t41MR80cqCT9UdMug==
X-Google-Smtp-Source: AGHT+IHM76ZSjGvkoN4OANG9xzvBXIvs2iRzIoXPK58xWZNBC0s5Cz1p6AAYpIu/DPgx+Su5WAjMGg==
X-Received: by 2002:a05:600c:8b24:b0:45b:7a93:f108 with SMTP id
 5b1f17b1804b1-46e6125cf2amr36609315e9.3.1759338591848; 
 Wed, 01 Oct 2025 10:09:51 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e61a18b76sm47647165e9.18.2025.10.01.10.09.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Oct 2025 10:09:48 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id B9E315F7F6;
 Wed, 01 Oct 2025 18:09:47 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 3/7] .gitmodules: restore qemu-project mirror of
 u-boot-sam460ex
Date: Wed,  1 Oct 2025 18:09:43 +0100
Message-ID: <20251001170947.2769296-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251001170947.2769296-1-alex.bennee@linaro.org>
References: <20251001170947.2769296-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

With this change also reference the upstream repo.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitmodules | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/.gitmodules b/.gitmodules
index e51abe65258..c307216d173 100644
--- a/.gitmodules
+++ b/.gitmodules
@@ -28,7 +28,8 @@
 	url = https://gitlab.com/qemu-project/seabios-hppa.git
 [submodule "roms/u-boot-sam460ex"]
 	path = roms/u-boot-sam460ex
-	url = https://gitlab.com/qemu-project-mirrors/u-boot-sam460ex.git
+        # upstream is https://github.com/zbalaton/u-boot-sam460ex
+	url = https://gitlab.com/qemu-project/u-boot-sam460ex.git
 [submodule "roms/edk2"]
 	path = roms/edk2
 	url = https://gitlab.com/qemu-project/edk2.git
-- 
2.47.3


