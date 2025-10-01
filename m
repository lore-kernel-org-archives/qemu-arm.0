Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19EB9CCA470
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Oct 2025 17:13:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v40Le-000818-MO; Wed, 01 Oct 2025 13:10:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v40La-0007yH-Pg
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 13:10:35 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v40L5-00034M-7F
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 13:10:32 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-46e2e363118so445385e9.0
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 10:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759338589; x=1759943389; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e4Fd/atNvJSkIPexyHAIzVIfwgyt31ObPrNjCVaDM0M=;
 b=jfu+cqETOAPlj6uwZxnh9+IdcphMkwUYfkR/2SWGW07OEp+rEvw16SOFjvHlrmO9dW
 JRcyrdKZYGeyyQwT4ELoPZZOx/7gD4bdgEFf0cuZ14PXyZ6IfqikfLoAq89JDl61vdDI
 w2FdMeEhwjtl8lSZ24erywqFpw5W0SM1h1obqxdMXqcsSGrAMTh7EvET0bB0WdqIHMLT
 i3z9KshhVkYTEV8CVh08hO4MUEfiLP5ytg+x7+53Ik8ApB/tZ7NESHDj0SugUOFIOcA5
 sYjF91Ddf4E7v9BQa7+hHnyrrTywqC/Wl85HIG9vYYUVntJUj38VkM11ZqcckT8KZRPX
 HMXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759338589; x=1759943389;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e4Fd/atNvJSkIPexyHAIzVIfwgyt31ObPrNjCVaDM0M=;
 b=ab2IX36TJQjdoGLG30OMvpyLfVpLzirhfpQlF79jnRw/t4V0dg7Ceww5erCad5labt
 D6VLNJInLdWBOWvPgt375lhjNSV09LWRIou59wFR9gIAwH4RjvdQ+ICORHM5xITiLxW+
 9+OjW/w9RCAfHeayzGHuhfjtsBLyHJE8RHtM56EfusaccYY3rGw8tBfNeq06Xd9KJOzA
 NYr0/Zjd3BkD5oiJ0eOaQMGhI1lDolUx4Q6Q1f3KprzWJFtimq5wl8sCbHNSkXE3hO+8
 iFIhhePCx9JfVVbH0kuz0nCzcdvEQPmNbQxgOxoump/nzZ+vbNesAHp8kRAPiC+yhtGP
 wV3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCTMfHX8QvFO1hCxUFy8aMGEUFNOXkhfiJv/AQyEG4XVa2MgyFHEb0+Ny87e7N77AKxEVSHI8koQ==@nongnu.org
X-Gm-Message-State: AOJu0Ywbtymg2IeWHvtQ93aRM+3LUTMnokXN1VMZR1Uu3dgL6ua+ghaG
 pylhGYrOP9Sl7Nl9PSmdNN/YK0oe4AZClvVO5uG1rusKm7tAg6hRKzNGEJmLYjJoPyE=
X-Gm-Gg: ASbGncvnj1wymuh2VcLJ609sP2QBFb1htwBXyivwV5rWVTpv/CTW5nYb0NhfkOit//M
 LLZvN6fITA8txTmeuAYbhcbNPd9LhNnEYdO+F86tq2KxZQNtQrlYqnKfjlL+3sAjMLNZPRf9OgU
 843DZWfA2ZgJ0aWSos9y54W5JpCrLEURde/6M6GJpqBnJ7Nh3g42X/ePCGwH4kJBbyjot0w6OR+
 lkkvMC0TI9zvaOkwxFQFmtn8ed6bhwxMNtZjCU7uIOli8RHdHAmkoyk7YK1+D4uLa9bM/wAeDg4
 65S77nUpcpLB7tH+OJxvuaYkQiNzAtF4WCVKJw/MRZuX0IaQMEXw3HIFQHrdaaafQYC5VRjnVTV
 M1LJfVXkasF6Qa2ZwSI51WYkhfmwX+VGZ5StQPzqX0nUIGH8=
X-Google-Smtp-Source: AGHT+IEmsrU7UPvkr31o+OtD86tMEPW2KX7DXZKr9EnlqG33DtAMj2TAYYuLaiGHEig8MYCox0SAIQ==
X-Received: by 2002:a05:600c:1395:b0:46e:1c16:7f42 with SMTP id
 5b1f17b1804b1-46e6610e1e4mr20882455e9.11.1759338589272; 
 Wed, 01 Oct 2025 10:09:49 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e61a2a808sm48054965e9.21.2025.10.01.10.09.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Oct 2025 10:09:48 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 8FE9B5F7A9;
 Wed, 01 Oct 2025 18:09:47 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH 1/7] .gitpublish: use origin/master as default base
Date: Wed,  1 Oct 2025 18:09:41 +0100
Message-ID: <20251001170947.2769296-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251001170947.2769296-1-alex.bennee@linaro.org>
References: <20251001170947.2769296-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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

This is very much the result of my recent fat finger but I think it's
safer to assume that origin/master points to a recent commit (or at
least a commit a given branch is based on) than master.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 .gitpublish | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/.gitpublish b/.gitpublish
index a13f8c7c0ec..a3adb21ffa1 100644
--- a/.gitpublish
+++ b/.gitpublish
@@ -4,48 +4,48 @@
 # See https://github.com/stefanha/git-publish for more information
 #
 [gitpublishprofile "default"]
-base = master
+base = origin/master
 to = qemu-devel@nongnu.org
 cccmd = scripts/get_maintainer.pl --noroles --norolestats --nogit --nogit-fallback 2>/dev/null
 
 [gitpublishprofile "rfc"]
-base = master
+base = origin/master
 prefix = RFC PATCH
 to = qemu-devel@nongnu.org
 cccmd = scripts/get_maintainer.pl --noroles --norolestats --nogit --nogit-fallback 2>/dev/null
 
 [gitpublishprofile "stable"]
-base = master
+base = origin/master
 to = qemu-devel@nongnu.org
 cc = qemu-stable@nongnu.org
 cccmd = scripts/get_maintainer.pl --noroles --norolestats --nogit --nogit-fallback 2>/dev/null
 
 [gitpublishprofile "trivial"]
-base = master
+base = origin/master
 to = qemu-devel@nongnu.org
 cc = qemu-trivial@nongnu.org
 cccmd = scripts/get_maintainer.pl --noroles --norolestats --nogit --nogit-fallback 2>/dev/null
 
 [gitpublishprofile "block"]
-base = master
+base = origin/master
 to = qemu-devel@nongnu.org
 cc = qemu-block@nongnu.org
 cccmd = scripts/get_maintainer.pl --noroles --norolestats --nogit --nogit-fallback 2>/dev/null
 
 [gitpublishprofile "arm"]
-base = master
+base = origin/master
 to = qemu-devel@nongnu.org
 cc = qemu-arm@nongnu.org
 cccmd = scripts/get_maintainer.pl --noroles --norolestats --nogit --nogit-fallback 2>/dev/null
 
 [gitpublishprofile "s390"]
-base = master
+base = origin/master
 to = qemu-devel@nongnu.org
 cc = qemu-s390@nongnu.org
 cccmd = scripts/get_maintainer.pl --noroles --norolestats --nogit --nogit-fallback 2>/dev/null
 
 [gitpublishprofile "ppc"]
-base = master
+base = origin/master
 to = qemu-devel@nongnu.org
 cc = qemu-ppc@nongnu.org
 cccmd = scripts/get_maintainer.pl --noroles --norolestats --nogit --nogit-fallback 2>/dev/null
-- 
2.47.3


