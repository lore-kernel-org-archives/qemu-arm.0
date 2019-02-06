Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6070398wrt;
        Wed, 6 Feb 2019 07:29:10 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbN1z93iqWEb8HaMLoUgqLdeYwPAaz99WtvDpXYJx4PtoZu/84DTw0r9JdylADAGmp/0TTc
X-Received: by 2002:a1c:23cc:: with SMTP id j195mr3526512wmj.124.1549466950218;
        Wed, 06 Feb 2019 07:29:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549466950; cv=none;
        d=google.com; s=arc-20160816;
        b=NaUuBcnTPVmmOUMUs7jqh1+7kobUBn/F2+CUlGvz8EXmZ+pn3n7X6UbCQjmS8ZWxjE
         oJnKV78Zo3DMp1tRsl25cIdy3X2jHkophjeSbzhooamWaHo0H7kiF8jk9l0vS14+aq5k
         JlPlcqw2G6g9w8P2EwDcMYBs2YGxZFc2yggQMybCwRpYaONSbzP2Vulpfwmm7tLf5heC
         rWi3VB5cBx2nKdWRtN2GfdFsMZAYnlc8posEZhd5yZhqEOcNlG0J7Xkf2eO3+N4ADIMd
         NHetrNrZyyMHKkxS047bX3/ipvui7DtBgouLPMdjAioVfDddtMxh2Lc444UTpOQohxjo
         ZN1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=GN5HTxmiu4BuWFwm0X3F4eIH9ZywdY+TO7vMgr3rzbE=;
        b=kXl00aVLGm0x7hA0McBnZAG9YV23u7pDVODreC6lx9xPLg0kXbtB2BSIZZU6We8LuH
         dFxVYuMoiw837v5oVdplMB0XJj8JNJn+JLeGA0K7ZE4ZnqrF2zaYpu9oZTGFTqTAzCja
         2u9sSUv4Ry/74ivjf9HwT+0xSSKuH6ME7DgFIpkT/SUf6nSGIcKNv6ls3Y6UlM10jpaC
         SF0XcQbN3oxZHGLJcaET/P9cNOW2w9kfa1jqhoMVU90Cw+HFoMhFII8pzf1mnhwzfdNV
         55csweAsgcHat+NU7AjPbTNInZrXFqh86i4gILk2RLa0Nyj4o1kfZblEl4kg6XaX465a
         8jMA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p2si5084268wrp.275.2019.02.06.07.29.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Feb 2019 07:29:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:52620 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1grP8P-0000Q7-52
	for alex.bennee@linaro.org; Wed, 06 Feb 2019 10:29:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55779)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1grP7x-00005J-VJ
	for qemu-arm@nongnu.org; Wed, 06 Feb 2019 10:28:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1grP7u-0004NR-Lm
	for qemu-arm@nongnu.org; Wed, 06 Feb 2019 10:28:40 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:52543)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1grP7k-0004L1-T9; Wed, 06 Feb 2019 10:28:30 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1N49Yn-1hHpwG3hQ1-0101Hh; Wed, 06 Feb 2019 16:28:18 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Date: Wed,  6 Feb 2019 16:28:02 +0100
Message-Id: <20190206152807.31896-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190206152807.31896-1-laurent@vivier.eu>
References: <20190206152807.31896-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:50GsQBkRs00UIdjKznqXiDUEnSYc3iLcB1QYRVJJtiPsDy0LKGi
	W6NqyJRP/m7xfmm3M/+Meig9bn/JJqJyJ0Yn8kloK4ahy1hUJgtWq3/KGX04DO/LZcoJkGa
	06uVe1j7USFPDszs79WjohXWU5daUAkK0tNKTL1pAqYDg/AbCpHuwNjKVu5eKMVXdb99Tkh
	u1lurMbwWV+Shs05xQ21g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2oBQh1yUJ3I=:0Tk4D5/7ClhGCJ1fQX8Ebk
	+3Bd0rgm7iHGI6ANmF0X1kkIurdI1wkN6QFQoGepjwFztcdba1Yy5S4E2eEVXaQbZ7EXe1LTj
	cv0bmdan0R5nR/rSc9GzCAnll4KbHVkTGn5WgPNrXS+SwhjLrD2US6547IEsLi6nCVuiMbp4x
	F4tuwR2i1ZpFV+qZ65RGZlYJh9hhlGskIN1OEABdIL7edu7eMmGW2lU1hJcNLv+QGC86VIEQF
	+hH/AWYF2WXSxwBNxJR1a4//vS4UJDverlJti6p7yvZw6eJeZmvQ8HhF5DQRW7J1425yPOWpH
	a0rTFJO2Q+hHyOXQvPXrZlXsIJZEq7et6ASBs3CLhWiFVYmhPkpPEu/ZB++h9qvY/DZlxsM4H
	4dfrjJ4N5BM7qVIHehxffzxYvqqJ4151mwwsHWVg0QYfu2HpWhJDss7gzOti712zixUyZTveP
	8e/g76YQg5taWIh0MTeclOcGfWG1WGJ8/PPw9Y6+/pEt4gOtoAq5ScyK62m3KMamyBP5hPURF
	lmzJ8g2RHd2757lDDzQ8jH5AwjI1EJ1yxtaYyonJwOhgap1Uy3U15chK/7aA5qbwA5iC+wrGR
	g27N4fNydiiU77PbJioFmRMrkCOdrjV/2ZByZ5VzZctlCKBG37RA9SGYSZqSZgPd3Yn7/uiPs
	dF/GAaTz6+Qr1auiLyCDjNcX9R8jCZhmgAEzsYsXgT3I9TPCeCqTSffl1TheL89rCUqkAtfAw
	p8vJdxxRkDw0pj0GxH0Hb8ulUPq/D7Ie4HYafA==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.133
Subject: [Qemu-arm] [PULL 2/7] target/moxie: Fix LGPL information in the
 file headers
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Anthony Green <green@moxielogic.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>,
	Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Andrzej Zaborowski <balrogg@gmail.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PmUYWd6S6EGL

From: Thomas Huth <thuth@redhat.com>

It's either "GNU *Library* General Public License version 2" or "GNU
Lesser General Public License version *2.1*", but there was no "version
2.0" of the "Lesser" license. So assume that version 2.1 is meant here.
Also the files mentioned the GPL instead of the LGPL after declaring
that the files are licensed under the LGPL, so change these spots to
use LGPL, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <1549266858-5043-1-git-send-email-thuth@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/moxie/cpu.c       | 2 +-
 target/moxie/cpu.h       | 4 ++--
 target/moxie/helper.c    | 4 ++--
 target/moxie/mmu.c       | 4 ++--
 target/moxie/translate.c | 4 ++--
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/moxie/cpu.c b/target/moxie/cpu.c
index 8d67eb6727..46434e65ba 100644
--- a/target/moxie/cpu.c
+++ b/target/moxie/cpu.c
@@ -13,7 +13,7 @@
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  * Lesser General Public License for more details.
  *
- * You should have received a copy of the GNU General Public License
+ * You should have received a copy of the GNU Lesser General Public License
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
diff --git a/target/moxie/cpu.h b/target/moxie/cpu.h
index d40f1e6c45..080df4ee6f 100644
--- a/target/moxie/cpu.h
+++ b/target/moxie/cpu.h
@@ -6,14 +6,14 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  * Lesser General Public License for more details.
  *
- * You should have received a copy of the GNU General Public License
+ * You should have received a copy of the GNU Lesser General Public License
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
diff --git a/target/moxie/helper.c b/target/moxie/helper.c
index 5b1532b837..f3d8ee7d6b 100644
--- a/target/moxie/helper.c
+++ b/target/moxie/helper.c
@@ -6,14 +6,14 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  * Lesser General Public License for more details.
  *
- * You should have received a copy of the GNU General Public License
+ * You should have received a copy of the GNU Lesser General Public License
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
diff --git a/target/moxie/mmu.c b/target/moxie/mmu.c
index bd90b1eebc..87783a36f8 100644
--- a/target/moxie/mmu.c
+++ b/target/moxie/mmu.c
@@ -6,14 +6,14 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  * Lesser General Public License for more details.
  *
- * You should have received a copy of the GNU General Public License
+ * You should have received a copy of the GNU Lesser General Public License
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
diff --git a/target/moxie/translate.c b/target/moxie/translate.c
index 29da02bc05..68ca223e22 100644
--- a/target/moxie/translate.c
+++ b/target/moxie/translate.c
@@ -5,7 +5,7 @@
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public License
- * as published by the Free Software Foundation; either version 2 of
+ * as published by the Free Software Foundation; either version 2.1 of
  * the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful, but
@@ -13,7 +13,7 @@
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  * Lesser General Public License for more details.
  *
- * You should have received a copy of the GNU General Public License
+ * You should have received a copy of the GNU Lesser General Public License
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
-- 
2.20.1

