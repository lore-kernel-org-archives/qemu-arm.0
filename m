Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670DCC88E77
	for <qemu-arm@archiver.kernel.org>; Wed, 16 Sep 2026 08:54:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6lP7-00086d-3D; Wed, 16 Sep 2026 04:54:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x6lP5-00085k-LC
 for qemu-arm@nongnu.org; Wed, 16 Sep 2026 04:54:07 -0400
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x6lP3-00051t-4x
 for qemu-arm@nongnu.org; Wed, 16 Sep 2026 04:54:07 -0400
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-482f6350f88so331856f8f.2
 for <qemu-arm@nongnu.org>; Wed, 16 Sep 2026 01:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789548833; x=1790153633; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=5jEk54sCARbNqwEALWIYvVVIO6zgDvVb82j7zjwYhno=;
 b=lR/PFgyOT2fAD78nGUrUEPAmD5nreOCBVTldzoEV+2icFdBkkYM9BI6V+IIrGsVRi6
 HhTsbE//ppVc7PTVOob+z9ioXr52DGOYoA3+4Qz1GD2OrqTE2nmQ7SE+5o4zhtcIDNTe
 ao7gnCjV3HQ3cI/HCKgOlUBTR6yNdMg28yslJQbax04kvKMInr7z5u9mVsnnTgu2F7xP
 bDEfPKqpdRTMaImQylb+tOd0AHTga658d/0XDdFzYJzBhIQ5kE5LiIgbe1otqCWiNgQ9
 1Y65IPBvjsZTO/HS9QKowUrViDe5w2+dsAytgll65dEu+XQFkmN5UTTnvBP/kHjtgWmC
 sdzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789548833; x=1790153633;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=5jEk54sCARbNqwEALWIYvVVIO6zgDvVb82j7zjwYhno=;
 b=HQxaWcZvTT1qZYixRNzBG+dtCpQU0ForzahhLzLZ8nt/1b+Ri1LterJ6jEs8Ceo2Jp
 pv7p97rad9+o0ir5+Grbfx/jIuG0KRypbW7WArriWHJBe6VPY2P2H1xiomcD0TWcJG5n
 gNqiW0fs+coazFxrwITXb+Iy8yyrrESBP0C1lieuKh+9lxggsF0iQKKLXrlflmLkjtqr
 Tjb9XGJDwSuVtvNgqslso0W3yfDfv5qIv3YhlKLKAq6RQ5OLYsvFWM/D/3chLEYd5FJd
 LpaNq7+SglILNwV0S1vlsO/iaUz9zh2uMChKyjWOHXhU24iySjSIMj7Bt6VIANTSMft2
 bFHA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxYZBu41JhEZLfS5gPpCMrtw2xM4IhSXqPg3bw7a7lLHn8Shi2gqL+myrrXgY0tAjE95k+ibrr8Hg==@nongnu.org
X-Gm-Message-State: AFuF++m1MuLosXaAHb/mRNv7uk7sYDGnW5ARSGs9zOklzdAkbr+Xh5YR
 xYT0ZiznvvAYF4iQQ5+1OwPpafcgTAzJqO99ab16988UNmWMbvk1DCZhHJOVUjnqD5s=
X-Gm-Gg: AYBFou2oWsmsE5uz4htwDavHERh75tPYnE7ipIqCFqccLt0MCULzcT6o8qgd6/HBsrh
 nzLiA/nMiOCnrGQhR8zz7/SomWPraLnpo4Jq9fuOZrj3lMph0QodZtuWqoxxO2/VygzNgqovqzi
 wuS3aEaTC2zy3u4/oCH9GknTS6tZiSqhNXq71YVVIgYihOImZhmOZBI8InVVQBFFdOwZPwSxNPu
 ijb2UBa5itdWGEIfCDkLFMkz80bu8dRdPqT3NJedxSbpBhkmYzhpRZWF07tG4hoBk65hePHmukL
 y1e6hAROlqhpOCW1ZjYUcKkVqh25uO10gw3JcTkv+MZLRUkzXcb5vooW4s1jBEH/HpBqdWt8Ynt
 lL+Ix5Q+eS9pXovOJtWgK2fsvnHik/gbi58+xOUZo4XqmDxrkITbjiGjhmyXU2g7ooz1BtnFddK
 QiRxjUkbRnsMFrv8jNuBv7DYqc2C+KjL6h1KMDtgAIGlIloLbeqPaz1Mx97ddF4IVoHGaUero=
X-Received: by 2002:a05:6000:2288:b0:487:663:3082 with SMTP id
 ffacd0b85a97d-4870d26fac3mr2099936f8f.52.1789548833456; 
 Wed, 16 Sep 2026 01:53:53 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4870bf27a41sm5306303f8f.18.2026.09.16.01.53.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2026 01:53:50 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 1076B61971;
 Wed, 16 Sep 2026 09:53:43 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Helge Deller <deller@gmx.de>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <th.huth+qemu@posteo.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Brad Smith <brad@comstyle.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, Warner Losh <imp@bsdimp.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>, Song Gao <gaosong@loongson.cn>,
 Kyle Evans <kevans@freebsd.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Eric Farman <farman@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v3 15/17] gitlab: update the @user id mapping file
Date: Wed, 16 Sep 2026 09:53:38 +0100
Message-ID: <20260916085341.1692742-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260916085341.1692742-1-alex.bennee@linaro.org>
References: <20260916085341.1692742-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:30::10;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr2-x10.google.com
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


