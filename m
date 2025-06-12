Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp2603258njc;
        Thu, 12 Jun 2025 14:00:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV02KWArIcXpF1PXDtFIW1dKwYaUkVS2iXKqonsHfrKjUdMQZJXteYgvROGmZMmHmVe8vvGmNxw7yT8yw==@linaro.org
X-Google-Smtp-Source: AGHT+IHTEvGoOUEzw2wcZHbvsfbm8N1qFuYEmkZnFVejx5NFWJTG2gzExTB3y95IDsSjCrSbCMiV
X-Received: by 2002:a05:622a:248e:b0:494:78d5:baea with SMTP id d75a77b69052e-4a72ff327cemr10711231cf.51.1749762037498;
        Thu, 12 Jun 2025 14:00:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749762037; cv=none;
        d=google.com; s=arc-20240605;
        b=Nva+tp7ckRlvFEGjQqwIQoNoYVC35jt8CLwFff/DZgyt32IaVES4BT12guUxAAZHiz
         j/f+fvtknyD9SrtxkmjhKD4K2tUajFkRkfI/t4gJcU6KRmXf+0DV0SKkkrw+hWD9OOyD
         mmAvx9IO2iT16tinoteR1D0egOlqZmvnxEfaLvoi0AOLkPCuqPXcWWwEZ7HLUa7n9rpv
         hcoR1khcBpMRwkpxRZlsSOEvT0xd3u3zbD1fkIk4hQTSpRMlaYEWiq7i5eHb3RIfjgCx
         y8LAjvKqh7vq5qCJpCqDuhMtOAjpdqTEb4YAduZLXY3HJEz4ZWDc+0w3tGyweJlK6qdu
         Z2dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=PBxHPU8F9xytU1WJw8ndoGxgIxFGcDQhUL4l1zUYAMc=;
        fh=Bqei7UspLQLDtJyhx8DFVPkwaTXoAlN/5Ng7ASZZYZk=;
        b=YzA02XhF4k5c+ujKoJhEmzFNzm5hXoNrPOa1nlaqiWlB6QF45xhsA2krHEkzAKqfkX
         4cOvR6Hbdte+wqb1nJlaoUrbKrVQ02WwvxZuMl+awvfDz0QPDkRpuRGts/hSx/d8QNR7
         /VCrXpMKGr4RzDGKguEkIytyC7nZBBlGfT42sz/CLQTFKKcmdHv9ygBpSBlwY9d33Eei
         f+8qo2Mx1Uk2PrpXjAF1NMgh+o/vjMBKOU/vofLy51p1tAPH3iSfAJU/1HK5SS2Yqpmw
         EkgCk23FGJ6SB0sXFobwESxKrg0+kVnlgQT/IhjbfGnB//AajqHL9raMGqHrnv8Lig6T
         yRrQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LJlToFdn;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a72a2b90a7si16049921cf.37.2025.06.12.14.00.37
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 14:00:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LJlToFdn;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749762037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PBxHPU8F9xytU1WJw8ndoGxgIxFGcDQhUL4l1zUYAMc=;
	b=LJlToFdnuzFgxsblkK0o8s46IbZ2zVcl7YoYLycR2GuO0P3cTLvsm3mLjJdq8bzffA2Y1S
	Ohve0uOw7F6NObr2DdUk/qGuo3uGa/+B8ZcYgd5o9StH9veIgk3fboYR+8q7SM1HiEywtj
	ADz95fGNQTZfV2GfW9278OdfoULaCDY=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-362-GBjP-yf1OPaff_ObhgnFzg-1; Thu,
 12 Jun 2025 17:00:33 -0400
X-MC-Unique: GBjP-yf1OPaff_ObhgnFzg-1
X-Mimecast-MFC-AGG-ID: GBjP-yf1OPaff_ObhgnFzg_1749762027
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 287D519560AA;
	Thu, 12 Jun 2025 21:00:26 +0000 (UTC)
Received: from jsnow-thinkpadp16vgen1.westford.csb (unknown [10.22.80.54])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E49291956050;
	Thu, 12 Jun 2025 20:59:55 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>,
	Yi Liu <yi.l.liu@intel.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Helge Deller <deller@gmx.de>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Fabiano Rosas <farosas@suse.de>,
	Alexander Bulekov <alxndr@bu.edu>,
	Darren Kenny <darren.kenny@oracle.com>,
	Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Ed Maste <emaste@freebsd.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Warner Losh <imp@bsdimp.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Tyrone Ting <kfting@nuvoton.com>,
	Eric Blake <eblake@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Troy Lee <leetroy@gmail.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
	Michael Roth <michael.roth@amd.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Ani Sinha <anisinha@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	John Snow <jsnow@redhat.com>,
	Eric Farman <farman@linux.ibm.com>,
	Steven Lee <steven_lee@aspeedtech.com>,
	Brian Cain <brian.cain@oss.qualcomm.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Jamin Lin <jamin_lin@aspeedtech.com>,
	qemu-s390x@nongnu.org,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	qemu-block@nongnu.org,
	Bernhard Beschow <shentey@gmail.com>,
	=?UTF-8?q?Cl=C3=A9ment=20Mathieu--Drif?= <clement.mathieu--drif@eviden.com>,
	Maksim Davydov <davydov-max@yandex-team.ru>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Paul Durrant <paul@xen.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Jagannathan Raman <jag.raman@oracle.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Anton Johansson <anjo@rev.ng>,
	Peter Maydell <peter.maydell@linaro.org>,
	Cleber Rosa <crosa@redhat.com>,
	Eric Auger <eric.auger@redhat.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	qemu-arm@nongnu.org,
	Hao Wu <wuhaotsh@google.com>,
	Mads Ynddal <mads@ynddal.dk>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	qemu-riscv@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	Alessandro Di Federico <ale@rev.ng>,
	Thomas Huth <thuth@redhat.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	Hyman Huang <yong.huang@smartx.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	qemu-rust@nongnu.org,
	Bandan Das <bsd@redhat.com>,
	Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	Fam Zheng <fam@euphon.net>,
	Jia Liu <proljc@gmail.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Kyle Evans <kevans@freebsd.org>,
	Song Gao <gaosong@loongson.cn>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Peter Xu <peterx@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	BALATON Zoltan <balaton@eik.bme.hu>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Barrat?= <fbarrat@linux.ibm.com>,
	qemu-ppc@nongnu.org,
	Radoslaw Biernacki <rad@semihalf.com>,
	Beniamino Galvani <b.galvani@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Ahmed Karaman <ahmedkhaledkaraman@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>
Subject: [PATCH v2 09/12] python: update mkvenv to type-check under different python versions
Date: Thu, 12 Jun 2025 16:54:47 -0400
Message-ID: <20250612205451.1177751-10-jsnow@redhat.com>
In-Reply-To: <20250612205451.1177751-1-jsnow@redhat.com>
References: <20250612205451.1177751-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: b-bhJN-XS6-YURShlWK8F4BIZixxhXgq_ijH9O80Fws_1749762027
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-TUID: 2HMLrJOymKTv

Currently, we instruct mypy to pretend it is type checking under a
specific version of python. For our case, where our scripts may in fact
actually be executing under a number of different environments in the
build system, we want mypy to remove this restriction.

This patch adjusts some of the import logic in mkvenv.py to make it type
check under a wider range of python versions. It's largely arbitrary, to
work around some mypy fussiness.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/scripts/mkvenv.py | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/python/scripts/mkvenv.py b/python/scripts/mkvenv.py
index 8026ca24861..b5d1edd3afa 100644
--- a/python/scripts/mkvenv.py
+++ b/python/scripts/mkvenv.py
@@ -99,16 +99,18 @@
         HAVE_DISTLIB = False
 
 # Try to load tomllib, with a fallback to tomli.
-# HAVE_TOMLLIB is checked below, just-in-time, so that mkvenv does not fail
+# TOML is checked below, just-in-time, so that mkvenv does not fail
 # outside the venv or before a potential call to ensurepip in checkpip().
-HAVE_TOMLLIB = True
+TOML = None
 try:
     import tomllib
+    TOML = tomllib
 except ImportError:
     try:
-        import tomli as tomllib
+        import tomli
+        TOML = tomli
     except ImportError:
-        HAVE_TOMLLIB = False
+        pass
 
 # Do not add any mandatory dependencies from outside the stdlib:
 # This script *must* be usable standalone!
@@ -194,6 +196,7 @@ def compute_venv_libpath(context: SimpleNamespace) -> str:
         # Python 3.12+, not strictly necessary because it's documented
         # to be the same as 3.10 code below:
         if sys.version_info >= (3, 12):
+            assert isinstance(context.lib_path, str)
             return context.lib_path
 
         # Python 3.10+
@@ -710,7 +713,7 @@ def _do_ensure(
 
 
 def _parse_groups(file: str) -> dict[str, dict[str, Any]]:
-    if not HAVE_TOMLLIB:
+    if not TOML:
         if sys.version_info < (3, 11):
             raise Ouch("found no usable tomli, please install it")
 
@@ -722,7 +725,7 @@ def _parse_groups(file: str) -> dict[str, dict[str, Any]]:
     # Debian bullseye-backports) and v2.0.x
     with open(file, encoding="ascii") as depfile:
         contents = depfile.read()
-        return tomllib.loads(contents)  # type: ignore
+        return TOML.loads(contents)  # type: ignore
 
 
 def ensure_group(
-- 
2.48.1
