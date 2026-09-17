Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0752C88E72
	for <qemu-arm@archiver.kernel.org>; Thu, 17 Sep 2026 16:59:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x7FQV-0000L5-Gk; Thu, 17 Sep 2026 12:57:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x7FPO-0007jT-6S
 for qemu-arm@nongnu.org; Thu, 17 Sep 2026 12:56:27 -0400
Received: from mail-wr2-x1b.google.com ([2a00:1450:4864:30::1b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x7FPL-0000nq-1V
 for qemu-arm@nongnu.org; Thu, 17 Sep 2026 12:56:24 -0400
Received: by mail-wr2-x1b.google.com with SMTP id
 ffacd0b85a97d-482f633ecdeso1011076f8f.2
 for <qemu-arm@nongnu.org>; Thu, 17 Sep 2026 09:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789664181; x=1790268981; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=fwUrFGyorIDTBMSXlq8EypmrdttVYEm3Ebm5JuAiB9I=;
 b=n5sHbfVfD13BxVHRKaYG81uxucoLfChbs12p+iSAlD/Fdf1pJqjwFOlowPYxzj2uzb
 axXDKBQ3eLjOzzr+JcARe9ogXl+ho+pMOlEelgXiAPPl7r3n5RuqTH7gaDiHV2x+jcbO
 DIdNsfrjAJPN9+G0WViKhYyQ48A7XXCiPOUor0PmrpyfWfIZA6pKbXq3ayETzo2NyIJ2
 c7P60lYyOq/qN7Ubiw2E/4NRdm1fqjinbPR0BZ0KkdkEzRVskLWDRD3cC+Nmvus+u+7H
 gkyhmrIARvqbqHdERnj5Yb8mz3MQ4xSzVQdtV0rwGhFl7p57fSplfKNuCIcZgnCPVvDy
 LvQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789664181; x=1790268981;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=fwUrFGyorIDTBMSXlq8EypmrdttVYEm3Ebm5JuAiB9I=;
 b=ZF8CK9wSjkhLwZ5oST2tOogsJMtDQH+G3eo6ZTg7fXBJUvSg34WbPeGUeYnk6EMSSw
 2c9kJDUtN6leNZfZ2e9ek3CARWbDsbhVXjTV7LQeTf9q24VqyukJUJ+96dz0MJFsPhNl
 5M5LM6hWw0WxPUFjdbBwFLLHsO4RgmW8Ktvk/359clZGzzQ2igW/eehR93aQ+RQkEMc0
 llom+gC8m8oE4satE5VKUjEL1nn1uHS1DD1EacH3N9rEiDkuu0/FCNmXeyARIQrWbHA2
 p9gDv4vnoOd+cWUjq4BIhvEyu9ccA9SERda3jsGpjwiUBSo0Y2SExntGYscxNAYlt/il
 ibkg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxqAK6h9dgvKDOP5nFgF9gNFRkMBvD3Fy6KDoKqFm6hjU+lJrCXKxsMLoySSONEAPXtbE0Bl4Oi3A==@nongnu.org
X-Gm-Message-State: AFuF++m9Fz/nDEMxKg003Hm9ovNJFdFFnP7o6QZiI6DpQMRGSEij0Rjs
 sTZXHsGS3tWYfDF+HfM9m7+sE1IjTaxv7NT3uOKvWCVrM9xLZjcg3EWLFaXTRF1+KLs=
X-Gm-Gg: AYBFou1p85iuN7QqUFae/jDjStmKwmCkmEDeRq/wSl7fXhN5nw6EM8F5vLz09f+bTNa
 gtMu75FnrqbU9RL2BOAwyNDylnVhYzs6FsfVYdscoSB1Vx0XsiLAmWP6VMwBiXGGQX/IdAnJ67U
 olzO9kgCx59/SADQa9VhKmBs+VPSCQdQUuhe6PJQcvUTcpQQn/bcU6BQTwJp/JeBk4tWuXoBA5X
 KctwZ5H8b2GKhaIh7kU/bfZRfkjhi/m2IMM0zTn4wOR56qDirsR0MNGEokw7LIXxSpEBmiKo4cR
 bQKJYxUlK0WTn1rSCzHjXy59s1eJZhMfczMCTeB8z5EsHA+GDY7jIC97BEVJvmAKNQ74riDZvc6
 hQRtRQPoZdF3gV/e9vlP7+0xCArmsKlc0H2HWjz5F90qL6mT2SoOXKn8L6oqKbdAbif9WK/3c0I
 d6tyFt72E32v+Quip/w+X7ocuj8XezhFNH6AafBfD4F6/SKbp3gKM9762eTrI8kFf2XNeQhS4=
X-Received: by 2002:a05:6000:460b:b0:487:6f2:1a45 with SMTP id
 ffacd0b85a97d-4870cf1641amr10020842f8f.18.1789664181257; 
 Thu, 17 Sep 2026 09:56:21 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4870bf1f98csm16551193f8f.11.2026.09.17.09.56.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 09:56:18 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id A5D595FCA8;
 Thu, 17 Sep 2026 17:56:03 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, qemu-arm@nongnu.org,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Thomas Huth <th.huth+qemu@posteo.eu>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 David Hildenbrand <david@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Song Gao <gaosong@loongson.cn>, Warner Losh <imp@bsdimp.com>,
 John Snow <jsnow@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Laurent Vivier <laurent@vivier.eu>,
 Brad Smith <brad@comstyle.com>, Kyle Evans <kevans@freebsd.org>,
 Amit Machhiwal <amachhiw@linux.ibm.com>
Subject: [PATCH v5 14/17] gitlab: update the @user id mapping file
Date: Thu, 17 Sep 2026 17:55:58 +0100
Message-ID: <20260917165602.3405537-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917165602.3405537-1-alex.bennee@linaro.org>
References: <20260917165602.3405537-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:30::1b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr2-x1b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

I needed to fix a POSIX-ism in the script as well.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Tested-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Amit Machhiwal <amachhiw@linux.ibm.com>
Message-ID: <20260914184534.706637-1-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Amit Machhiwal <amachhiw@linux.ibm.com>
---
 .gitlab-map-auto          | 8 +++++---
 scripts/gitlab-map-update | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/.gitlab-map-auto b/.gitlab-map-auto
index 28ce448f1bf..3f717a15d4e 100644
--- a/.gitlab-map-auto
+++ b/.gitlab-map-auto
@@ -12,11 +12,12 @@ a1xndr	Alexander Bulekov
 adi-g15-ibm	Aditya Gupta
 agraf	Alexander Graf
 alex.williamson	Alex Williamson
-aliang1	Aihua Liang
 alistair23	Alistair Francis
+amachhiw	Amit Machhiwal
 anisinha	Ani Sinha
 anthony-linaro	Anthony Roberts
 anthonyper	Anthony PERARD
+aroxell	Anders Roxell
 berrange	Daniel P. Berrangé
 birkelund	Klaus Jensen
 bonzini	Paolo Bonzini
@@ -36,10 +37,10 @@ dwmw2	David Woodhouse
 eauger1	Eric Auger
 ebblake	Eric Blake
 edgar.iglesias	Edgar E. Iglesias
+efarman	Eric Farman
 ehabkost	Eduardo Habkost
 eldondev	Eldon
 epilys	Manos Pitsidianakis
-famzheng	Fam Zheng
 farosas	Fabiano Rosas
 gautammenghani	Gautam Menghani
 gkurz	Greg Kurz
@@ -51,7 +52,6 @@ imammedo	Igor Mammedov
 jasowang	Jason Wang
 jmacarthur	Jim MacArthur
 jsnow	John Snow
-juan.quintela	Juan Quintela
 kbastian-qemu	Bastian Koppelmann
 kmwolf	Kevin Wolf
 kostyanf14	Kostiantyn Kostiuk
@@ -67,6 +67,7 @@ mauromatteo.cascella	Mauro Matteo Cascella
 mcayland	Mark Cave-Ayland
 mdroth	Michael Roth
 mediouni-m	M. Mediouni
+mjrosato	Matthew Rosato
 mjt0k	Michael Tokarev
 mstredhat	MST
 npiggin	npiggin
@@ -79,6 +80,7 @@ pipo.sk	Peter Krempa
 pkrempa	Peter Krempa (work)
 pm215	Peter Maydell
 qemu-janitor	Qemu Janitor
+raphael.s.norwitz	Raphael Norwitz
 rathc	Chinmay Rath
 rth7680	Richard Henderson
 schoenebeck	Christian Schoenebeck
diff --git a/scripts/gitlab-map-update b/scripts/gitlab-map-update
index c134c226aa2..743ad11900d 100755
--- a/scripts/gitlab-map-update
+++ b/scripts/gitlab-map-update
@@ -33,7 +33,7 @@ glab api --paginate /projects/qemu-project%2fqemu/members | \
     .gitlab-map-auto.tmp
 test $? != 0 && fail=1
 
-if test $fail == 0
+if test $fail -eq 0
 then
   grep '^#' .gitlab-map-auto > .gitlab-map-auto.new
   LC_ALL=C sort .gitlab-map-auto.tmp | uniq >> .gitlab-map-auto.new
-- 
2.47.3


