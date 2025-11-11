Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BBD2CCFA1A
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Nov 2025 17:20:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vIs2H-0008O8-14; Tue, 11 Nov 2025 12:20:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vIrzz-0005qo-Lv
 for qemu-arm@nongnu.org; Tue, 11 Nov 2025 12:17:43 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vIrzs-0003zW-UH
 for qemu-arm@nongnu.org; Tue, 11 Nov 2025 12:17:43 -0500
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b72dad1b713so562581566b.2
 for <qemu-arm@nongnu.org>; Tue, 11 Nov 2025 09:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762881455; x=1763486255; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6fTw1tbKCxfSYtSshvI7Ey8m20SzjiVCQ9bgtYepDy4=;
 b=mpPjQqMgTNFM7k07KKAdUJaTVsx8IH4uhhMabGFNI/769qdztxyfmsuZOYh1DsBLKb
 QHFxaR1WR0RJKY+G9gNXO80DfzOjENfZco1/DvbPSpPm5oGwKv2sYc/VxbStwVPXbgPX
 qinHvEsy/jNG3b6zEn5v50hD70FB+h/BqjcfdQWrOoCgAn1b7a8tQdYlB6Brw3fv9VFZ
 5PpCez9WYPH2vN0nICi3xDesaef3iGhPAuSy6zSHbM2hjJDtlTJdwKbyK/k1FLQz/fkZ
 TQkrfWXw5GEIgP1wea5230yTRFCH4nXa4ds5t7Q2qb3ri+chMs2dTcj/DpQdky6D/BY8
 Gpiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762881455; x=1763486255;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6fTw1tbKCxfSYtSshvI7Ey8m20SzjiVCQ9bgtYepDy4=;
 b=t0MqJiL0JY4s4CCPHOaCd8XMGwa1FrTkxyZ+TPsuuYnCEpUcBJpcIU/pQB7ZaH+VPo
 OXxmLXkbHs9dbXHQj6vV1aupB6v/UjANLbG6tNN8mgQKBxMsA/f5kn8J8hyEZA75sjq0
 hSCgmUCwA60YP/PS8w9A+gPFEc2BM5PwC+UQMEpfONJIjBLDi5zwiHt8MtcXtP9FCfiH
 BMhGyTtpolx+ZcuoteVnc/JR0ZdQazMk6CI0gH6O5orByLwcR0fmhUqK2fdxjOQ2Wynb
 5xfR9Je34p4mARyQhZbW0rbW3EDKdtY918E+KR4VdCBSxV6tkkK4vR+4U5niuMSMrXLR
 lG0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfxTcKep6R0/y12Tc+NPoXxelZpUQ2WGfEqyZjU0kzt29qFtQeyZnJin9GnwAN0FXwsxDsRcHREQ==@nongnu.org
X-Gm-Message-State: AOJu0YzXi8aJK9pOc+P6UPEsdObC9C/N0fHmo/xPAd8ZFflh7UE+6vdG
 fhX+RDqFgRBJh8TybpyjWlbdqUN/1sMEmOzDFhlm4p6eL0h8+eVylCxxeRCfwTKjMUs=
X-Gm-Gg: ASbGncvz9QnpyHXb4czCXfhJirCRxLWwAGKS8Rcbw8BcdBA/zsnu/sp6HqtmSUXELr1
 XYt+6MHKDR1u4RMGzIXb+TB/L78r6bOso/MFfvjHlpzwFGieRdX5A5uHmFseDmJvlfsVhtEilLJ
 COhSRK+LAmwVt590hTXmndewOxeTpZMOW2xb4njpyHrKc29hIZ2DFNNtNE+GlSj2c+H7rKdjud7
 fTpONjtkYNbI3lslCQWXLzPSv6DCl5Xnjl2tIbYt1t3Km8HjEBdW9ziJfGWKfS0GYpGpPGbNB3h
 er8kIKaDgPCI48Q33w9w/M4VW6jJIkwEe+6Chm8pYyjxPa1J9MZextDKkQLsoWkZpJgtjx64mq7
 pEuglN+rN+M+Ps8rtXFWVy6aiLo/R88LRxe/Ry6xoca4PMqlQpbVSABhZmqIgHAyhcTEv9eNC4q
 Em
X-Google-Smtp-Source: AGHT+IEIBJSo9FgSIMHiM7CQsZpHOl0WJofaTdHZ+a73Qle06jSr+jEjM5ZdvzkUWrmqxAA6DKq6Hg==
X-Received: by 2002:a17:907:60ce:b0:b71:88eb:e60c with SMTP id
 a640c23a62f3a-b72e05e686emr1169167566b.44.1762881455418; 
 Tue, 11 Nov 2025 09:17:35 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6411f862cd7sm13899498a12.30.2025.11.11.09.17.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Nov 2025 09:17:33 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 8F4A660804;
 Tue, 11 Nov 2025 17:17:25 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>, Kohei Tokunaga <ktokunaga.mail@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 Ed Maste <emaste@freebsd.org>, Paul Durrant <paul@xen.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Thomas Huth <thuth@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-stable@nongnu.org
Subject: [PATCH 11/16] tests: move test_kvm to share.linaro.org
Date: Tue, 11 Nov 2025 17:17:18 +0000
Message-ID: <20251111171724.78201-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251111171724.78201-1-alex.bennee@linaro.org>
References: <20251111171724.78201-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62a.google.com
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

Linaro are migrating file-hosting from the old NextCloud instance to
another sharing site.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: qemu-stable@nongnu.org
---
 tests/functional/aarch64/test_kvm.py | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/tests/functional/aarch64/test_kvm.py b/tests/functional/aarch64/test_kvm.py
index 9fb9286139f..c8351afc5ec 100755
--- a/tests/functional/aarch64/test_kvm.py
+++ b/tests/functional/aarch64/test_kvm.py
@@ -18,11 +18,8 @@
 
 class Aarch64VirtKVMTests(LinuxKernelTest):
 
-    ASSET_KVM_TEST_KERNEL = Asset(
-        'https://fileserver.linaro.org/s/HmjaxXXYHYSqbes/'
-        'download?path=%2F&files='
-        'image-with-kvm-tool-and-unit-tests.gz',
-        '34de4aaea90db5da42729e7d28b77f392c37a2f4da859f889a5234aaf0970696')
+    ASSET_KVM_TEST_KERNEL = Asset('https://share.linaro.org/downloadFile?id=Dt5pQbTe5RrxEii',
+                                  '34de4aaea90db5da42729e7d28b77f392c37a2f4da859f889a5234aaf0970696')
 
     # make it easier to detect successful return to shell
     PS1 = 'RES=[$?] # '
-- 
2.47.3


