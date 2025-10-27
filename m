Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 648E4CCF9EA
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Oct 2025 11:08:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDL2R-0001gE-1W; Mon, 27 Oct 2025 07:05:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vDL2C-0001HX-5R
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 07:05:08 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vDL1Y-0005bb-WB
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 07:05:06 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b3f5e0e2bf7so1016435266b.3
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 04:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761563029; x=1762167829; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j70gJxXdGck8MJa36gCkeQcF/t7I7PGzdE6PkZ71zsE=;
 b=D4vcdQYl789pFjgIDXaLfjweHugOVaM40Pd89aFoaDIB5cNgPf6/+hPY6NL1J7A/5x
 YxBQn31WOXZ3km06ytrmlF/SIDqq7geLUpAefHGVVOLLInh0yc0zytBPTnqcw4RKOKbb
 zcoIUJ5Otj5MAp4ZhnUffwo0zlInzOMIX+SaGsbbPGEsGfF8c0citK60/TijGkXzQEd1
 M1xeqx/ioN3EJr+SAcA4P/P7U3H31i75i/QKXco8XsQ2Lh8QbJ1vyeywO/kyWsY7Vdtt
 3JWGITBbsaY+xm9L6+/YJxT0gr09v8yWhy8sECUQm5d2ceObZa6LKSLOamQGJ4wdqJ/4
 gwPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761563029; x=1762167829;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j70gJxXdGck8MJa36gCkeQcF/t7I7PGzdE6PkZ71zsE=;
 b=EsNva0xSs81auL26CW4uO6kKl6fidGLQF2KFbX5YsgcnHEqPo66hQbBp5otQaclmjL
 2Ub/z4zYuwv4QUFT3KH8mWTuRZPslC3P0T50AiXY+H5eRtOxz7Fx9qPDZyjq9U9Zer8J
 GMMyzdD33ulWINyTL9/lm3us6aJBAwMMsCwvHSWrFQnVKOM1ouUL5hH9B2vnX9iENHl6
 XT8kY4uGXS7vcTph1W1xv0CmWC6rB79GUKjvtuq3fMkC/bUl5oOHqW1ZNWyGcz+Kx+Vx
 1hYsAPRaGMN1QvSTnJbe9tuwXC2ArSt3Etq0Hebi1NOGjmcV1J5NW4m9ZshQr1Exe4el
 uFtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRh5ez2DjAel8tC1YJoodNZ2giYPe5JOdqK84hE8RoJRYvZv9U0T7/d5QVWEjt+Uy7DM8dFyemYw==@nongnu.org
X-Gm-Message-State: AOJu0YwIiAvzKLlYMkV7z+qapiKWifVwtui2BDhLrBhNJ4d1046SXsN7
 95vwScUseIjk62IFKfMS0cFTz8LuS5AMc2D5+ZhwS4C8pwsxe9etdUkWorjnLuFbM9A=
X-Gm-Gg: ASbGncvqeCO6E86A14FMSt+44MaB4I+pnIQaAnMsJmR3OxDWjigMKHaZkVs/OVjb3hF
 vjudAXJ2b80QMXOSBaSfxG1Rf8Ya5VlZGiQsCdqwNA51aZ8n8uFqg6HWhje9cwjVm+FqSLRKHpT
 s8gSb7VfwPB0paS0s/BofAlYXBz/qpsOWq7cEGmtT9oIbbTA/qQM7IjrWNuYBcdu2HHuo7w0OIQ
 5Ul9BDx1fFxa0SldWLkkiz25J/IRT1S3ywT9nBzmslj9fgUutN1snBtDzJwfxLmEx0aueJbMziP
 8Wya1pOZtDCGqOIoG2P6+bnAb1oRZmVjPW5BkqpUyWzZf4voIc5ULQi+Kn8anzPtVWHreZ59f0L
 QR8yh5N1jb4ButSiurOD8umRZVxo2lvW3jaGoc6J7GcwyjtpGacYV+wSlckAqqGWwGHjHCAU1LD
 wRRPQAWbffSU4QKSK5OWOwDw==
X-Google-Smtp-Source: AGHT+IHMVv5tt5JLpSnfEJyZKqOa3wbzf1/A2Kwv6tqT7NQOmJaYgs5Vgi9m2Q2oWdSmj1jix/T2Ug==
X-Received: by 2002:a17:907:c11:b0:b32:8943:7884 with SMTP id
 a640c23a62f3a-b647500ee9amr3839114366b.45.1761563029024; 
 Mon, 27 Oct 2025 04:03:49 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d853edc87sm734402566b.46.2025.10.27.04.03.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 04:03:45 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 7C0705F9E0;
 Mon, 27 Oct 2025 11:03:44 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Chinmay Rath <rathc@linux.ibm.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stafford Horne <shorne@gmail.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Laurent Vivier <laurent@vivier.eu>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Michael Rolnik <mrolnik@gmail.com>,
 Song Gao <gaosong@loongson.cn>, qemu-riscv@nongnu.org,
 Aleksandar Rikalo <arikalo@gmail.com>
Subject: [PATCH 04/35] scripts/ci: allow both Ubuntu or Debian to run upgrade
Date: Mon, 27 Oct 2025 11:03:11 +0000
Message-ID: <20251027110344.2289945-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251027110344.2289945-1-alex.bennee@linaro.org>
References: <20251027110344.2289945-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x630.google.com
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

There is no practical difference between the systems when it comes to
updating the installed system.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 scripts/ci/setup/build-environment.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/ci/setup/build-environment.yml b/scripts/ci/setup/build-environment.yml
index 66bde188755..253d0b759bc 100644
--- a/scripts/ci/setup/build-environment.yml
+++ b/scripts/ci/setup/build-environment.yml
@@ -24,7 +24,7 @@
         update_cache: yes
         upgrade: yes
       when:
-        - ansible_facts['distribution'] == 'Ubuntu'
+        - ansible_facts['distribution'] in ['Ubuntu', 'Debian']
 
     # the package lists are updated by "make lcitool-refresh"
     - name: Define package list file path
-- 
2.47.3


