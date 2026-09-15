Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF6EBC982C1
	for <qemu-arm@archiver.kernel.org>; Tue, 15 Sep 2026 20:18:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6ZbW-0008OL-Tv; Tue, 15 Sep 2026 16:18:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x6ZZl-0006tF-DO
 for qemu-arm@nongnu.org; Tue, 15 Sep 2026 16:16:22 -0400
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x6ZZf-0003Ke-06
 for qemu-arm@nongnu.org; Tue, 15 Sep 2026 16:16:18 -0400
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49b965f447cso1897835e9.3
 for <qemu-arm@nongnu.org>; Tue, 15 Sep 2026 13:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789503373; x=1790108173; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=5jEk54sCARbNqwEALWIYvVVIO6zgDvVb82j7zjwYhno=;
 b=S8CbPDXpZkAGBaBC6qj/UbjJQOvqXQcONDZrn35ojDZYHV5ZqfnlfvQaaeKagyuNij
 OqIIGPI9fWENh2F+uj3RIW3M465CRv46F5fDZVccuFaepLGH68T01Kr1bPcIU4PoYhgv
 og4tH917QBIkedIG1QT/xypUd3v08ZvBqOlhBli+aQrZnSs/x+g1NiR/51/2O9WxS9ox
 bfeMrURjr2XcladcNq35LqGO/7NuLV+WG5eCFQ+Wq5V+ezDV6tyMupm4RMwcye8wjzqq
 z8C72x/Xy/k8W6XkfQpLDtf+g5TLVSjhDaRs+Zjp7xq6DnnY1OmBicT5zeM6Jm1ZacWS
 OUmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789503373; x=1790108173;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=5jEk54sCARbNqwEALWIYvVVIO6zgDvVb82j7zjwYhno=;
 b=sw0uBYbCLTvtWG1arIUlUfdmtEoZF8XpvA5i1PnKIHufwVsOeNsa7r1pxQaCd4BXNE
 vmj4M03g4Sio5WJAZ0GOVaDLgLuEdG4CO+udp97YKX+mKfct1stpYZrzYQaspCPyHRZ6
 amyGK7YkW7IWptY6j+XLKdk82SzZFq7b1wkp9/D9eKzNgOxVi+FBMrh2bCR4hj9hppaF
 sfu2R98nedckEhKuuQWfJC1mzJNIvYHY479EwHt5S1l/feZNP6i/Tfrx61kG41uoUnJy
 LRFcfzrjqd+IUYjR9tTU1nXsT5phteDzrpK2a4RwrU/pcrIJ4PNZl3gxymkSpKtnYIcy
 xy+Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBz3vAd3mUYW5IbsDvSJusC9TgH/aTxZnd6HGsjD//p4R/bPGnGi1Fmj+SI/lSYUqo+SDjBcYvqxDQ==@nongnu.org
X-Gm-Message-State: AFuF++lkTMkq33Q+HqfIEH0Xi+GJJb0q5yzbPw3CjKs2d1VG5sTNprG+
 G3QkQ+zfMWXxp/C0pJtEYcMX+rUJwmXPhSwpL00IeFk0+H7QoBuw4/y8WBzVkLkAyyY=
X-Gm-Gg: AYBFou2KinKJAVZMrBmjprlhP6la4rw1Ybko24WjSM4CD+OPmf3Tm89x36WZ6L9kqMl
 bwwmQ90cjCuA27SKU0oZofvnG+GzbxSzGASGg45liGzu9tBWweUXvQro+IwaxlnLsePyxX1elTX
 tT4F2rJhthBCURg260bidyxFKQaIOFZJgBXk2WZKQL+SU29Yek/Bur1WpfDGdOILzG260kcGm2d
 a9KPNwUlznuzdFFjV8H0cKVI+8Jf2adXP/eB2sTmwEPXmQQvp72pA6+TzCXO32IUrN1rH2lglVg
 YExVa9yiKCgUQVZtAC5bsrMW60eVuXPGgpXslFmbRzOq8G3CAlao4Its0m0Ydzst/4+dtQfWs3p
 lB7W9YwcPVuIbDBBphH0IOWC5BdL5pUPtOAzguYtoaRyhLCW6uwzhG5HefpuA6VAjLQH8nx6uhU
 6t5AkFl7H2E0YdRfMM1Px3lRGiEC4ROxOfpQVZ2cMidWNVh0GTuuse0Wjkg8ILNKdgPHPRE2A=
X-Received: by 2002:a05:600c:3545:b0:49c:fa20:cc04 with SMTP id
 5b1f17b1804b1-49e7a679271mr94888725e9.27.1789503373210; 
 Tue, 15 Sep 2026 13:16:13 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49e83da071asm16260275e9.8.2026.09.15.13.16.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2026 13:16:09 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 3B89361971;
 Tue, 15 Sep 2026 21:16:03 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Helge Deller <deller@gmx.de>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Song Gao <gaosong@loongson.cn>,
 Thomas Huth <th.huth+qemu@posteo.eu>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>, Kyle Evans <kevans@freebsd.org>,
 Eric Farman <farman@linux.ibm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 John Snow <jsnow@redhat.com>, Brad Smith <brad@comstyle.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>
Subject: [PATCH v2 15/15] gitlab: update the @user id mapping file
Date: Tue, 15 Sep 2026 21:16:00 +0100
Message-ID: <20260915201601.1207839-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915201601.1207839-1-alex.bennee@linaro.org>
References: <20260915201601.1207839-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:31::10;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm2-x10.google.com
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

I needed to fix a POSIX-ism in the script as well.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-ID: <20260914184534.706637-1-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
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


