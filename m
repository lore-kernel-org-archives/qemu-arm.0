Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp2602711njc;
        Thu, 12 Jun 2025 13:59:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU+dceGHWU8LZIEKaYipZ0hQRyTjlLvAa/zBd/garqjjPi3Sg7nesbNTim9tJ8dCIxbdhq5kmHJGfw7mg==@linaro.org
X-Google-Smtp-Source: AGHT+IE6jenGZLbWq6kRC3wZVnmvadrY6nGSyScyZV8bZ+Nko0IwPjO7VpbJZX/+/yX1+se+OfPK
X-Received: by 2002:a05:620a:199b:b0:7c5:4c6d:7fa5 with SMTP id af79cd13be357-7d3bc4510e1mr132750085a.48.1749761974566;
        Thu, 12 Jun 2025 13:59:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749761974; cv=none;
        d=google.com; s=arc-20240605;
        b=EkL4DTdb6fQukMzFQZHYLA3s4SqBG9q5pbSCwlH4k8KSECDW4Hbtgjjs5mGUeUA0lg
         ap2t3gfcMfC3NQBaqFLSBxA386pZtU3aB4LKV4mXfWyNJAWSBEiDVRuRGEWcB0qwRWSW
         2rtI+waoeOrgtd2YTgbrfGLu1iJnEAgb9wWj/m9I/Hc6ve6EePpym5UAZbuHzAYJX3qf
         ZqgXJ6gsCLlZY4AyckeSpd+gmzxgbz5B1B/m+lpy3GZACtHlCGgXi96wQN/T790q9lC3
         FqYYS7cBYl6JmYy1nWE92KmX5gffPGOYrDJD9eaqDbqbcUiDsCUsFcJ+HdSMIHsgrFc+
         678Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=jCIejFSQfcGoCjcsgn+YLuJOKRTgKy2BSecLZSTojbc=;
        fh=Bqei7UspLQLDtJyhx8DFVPkwaTXoAlN/5Ng7ASZZYZk=;
        b=OPRcaevxh2Ds3/ACUE3UJyiODMKYYd4ijKD8FNKQx2BJhjfH+OIzLgESEsM5vEQCws
         AZQFQHjJe1AS6YnMjvg4cKZhw9v2CGfNA1jtpLvc2AL1obTxPsqZToTV2DrcMHRmyPtw
         OVciUGw3Dp1hdVhN7P4u69QrWuJhrd+EEgO4swbV2Jvdr/PpiHVLyQzezNzrkeY5yKqt
         aDrYcJ2ifzuHuX0fYvIYiW3JdW+9Be3O1/OAQVUslsTrARnROvecMW4g86xc2ptmj5xI
         O694PHGoLdtj6kQtEL2GiK5eqY1EWr++3i039/XvAzoDXxZw8rA7U+0xNchM+KGThLP6
         wsXQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=V6o9P+za;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7d3b8ecda85si150980285a.322.2025.06.12.13.59.34
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 13:59:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=V6o9P+za;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749761974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jCIejFSQfcGoCjcsgn+YLuJOKRTgKy2BSecLZSTojbc=;
	b=V6o9P+zan4NZDve8Wfb/r4uVCxe/azSbOyaSPpyd8oflKwGDSb7eEJIFEkBxUFdZJaE6IM
	rwjFFBbc2qwG0b5EE1P3uoE9ubn6XfpqYQUAUNTisd9O8QRFPwOMP6dTUFs+us66w0ydd9
	kwYAPX2ZqL9vJPCEfBrPiAExpvHOp9Q=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-214-Vdnvy8FPPUi8_9d5VP9VLw-1; Thu,
 12 Jun 2025 16:59:32 -0400
X-MC-Unique: Vdnvy8FPPUi8_9d5VP9VLw-1
X-Mimecast-MFC-AGG-ID: Vdnvy8FPPUi8_9d5VP9VLw_1749761967
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1391B18001D6;
	Thu, 12 Jun 2025 20:59:26 +0000 (UTC)
Received: from jsnow-thinkpadp16vgen1.westford.csb (unknown [10.22.80.54])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B9E4B1956050;
	Thu, 12 Jun 2025 20:58:57 +0000 (UTC)
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
Subject: [PATCH v2 07/12] fixup
Date: Thu, 12 Jun 2025 16:54:45 -0400
Message-ID: <20250612205451.1177751-8-jsnow@redhat.com>
In-Reply-To: <20250612205451.1177751-1-jsnow@redhat.com>
References: <20250612205451.1177751-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mYAG4uqIqGdQex5SGF7M8U98zvIu1tQejZ7VL3PfCvs_1749761967
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-TUID: Lap5grmkvnpn

These are manual fixes that ought be merged into the prior patch, but
are here separated for clarity to separate the automated portions of
this patch from the non-automated portions.

These fixes are only the necessary portions to allow python static
checks (and checkpatch.pl) to pass again, and don't perform any
"optional" cleanups. (i.e. this patch strictly prevents regressions.)

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/utils/qom_fuse.py |  1 +
 scripts/qapi/common.py        | 28 ++++++++++++++--------------
 2 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/python/qemu/utils/qom_fuse.py b/python/qemu/utils/qom_fuse.py
index c1f596e3273..e2ed70f9ded 100644
--- a/python/qemu/utils/qom_fuse.py
+++ b/python/qemu/utils/qom_fuse.py
@@ -41,6 +41,7 @@
 
 import fuse
 from fuse import FUSE, FuseOSError, Operations
+
 from qemu.qmp import ExecuteError
 
 from .qom_common import QOMCommand
diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index d1fa5003c29..ecdac1dff85 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -91,29 +91,29 @@ def c_name(name: str, protect: bool = True) -> str:
     """
     # ANSI X3J11/88-090, 3.1.1
     c89_words = {'auto', 'break', 'case', 'char', 'const', 'continue',
-                     'default', 'do', 'double', 'else', 'enum', 'extern',
-                     'float', 'for', 'goto', 'if', 'int', 'long', 'register',
-                     'return', 'short', 'signed', 'sizeof', 'static',
-                     'struct', 'switch', 'typedef', 'union', 'unsigned',
-                     'void', 'volatile', 'while'}
+                 'default', 'do', 'double', 'else', 'enum', 'extern',
+                 'float', 'for', 'goto', 'if', 'int', 'long', 'register',
+                 'return', 'short', 'signed', 'sizeof', 'static',
+                 'struct', 'switch', 'typedef', 'union', 'unsigned',
+                 'void', 'volatile', 'while'}
     # ISO/IEC 9899:1999, 6.4.1
     c99_words = {'inline', 'restrict', '_Bool', '_Complex', '_Imaginary'}
     # ISO/IEC 9899:2011, 6.4.1
     c11_words = {'_Alignas', '_Alignof', '_Atomic', '_Generic',
-                     '_Noreturn', '_Static_assert', '_Thread_local'}
+                 '_Noreturn', '_Static_assert', '_Thread_local'}
     # GCC http://gcc.gnu.org/onlinedocs/gcc-4.7.1/gcc/C-Extensions.html
     # excluding _.*
     gcc_words = {'asm', 'typeof'}
     # C++ ISO/IEC 14882:2003 2.11
     cpp_words = {'bool', 'catch', 'class', 'const_cast', 'delete',
-                     'dynamic_cast', 'explicit', 'false', 'friend', 'mutable',
-                     'namespace', 'new', 'operator', 'private', 'protected',
-                     'public', 'reinterpret_cast', 'static_cast', 'template',
-                     'this', 'throw', 'true', 'try', 'typeid', 'typename',
-                     'using', 'virtual', 'wchar_t',
-                     # alternative representations
-                     'and', 'and_eq', 'bitand', 'bitor', 'compl', 'not',
-                     'not_eq', 'or', 'or_eq', 'xor', 'xor_eq'}
+                 'dynamic_cast', 'explicit', 'false', 'friend', 'mutable',
+                 'namespace', 'new', 'operator', 'private', 'protected',
+                 'public', 'reinterpret_cast', 'static_cast', 'template',
+                 'this', 'throw', 'true', 'try', 'typeid', 'typename',
+                 'using', 'virtual', 'wchar_t',
+                 # alternative representations
+                 'and', 'and_eq', 'bitand', 'bitor', 'compl', 'not',
+                 'not_eq', 'or', 'or_eq', 'xor', 'xor_eq'}
     # namespace pollution:
     polluted_words = {'unix', 'errno', 'mips', 'sparc', 'i386', 'linux'}
     name = re.sub(r'[^A-Za-z0-9_]', '_', name)
-- 
2.48.1
