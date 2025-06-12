Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp2604266njc;
        Thu, 12 Jun 2025 14:02:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWvbb78YHNAXqdOrw4h/5pLl/Tr/u0mohCggh3M7f74mMROPJXl3XXtWy1wTp3Hx3UdHL4rvJ9fHAez1Q==@linaro.org
X-Google-Smtp-Source: AGHT+IGqD31gaZXjSW53NX6Db8RT3mxWYWYY76J9gJQR8yQztFrkwxE15ftZCSEq7DGVtEubbhbI
X-Received: by 2002:a05:622a:904:b0:4a6:f9b0:2093 with SMTP id d75a77b69052e-4a72ff3e28emr10628901cf.46.1749762126559;
        Thu, 12 Jun 2025 14:02:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749762126; cv=none;
        d=google.com; s=arc-20240605;
        b=aX67mxlz8OsVZOybDZYQfspwrI56/TroaBTUT1oUcwWM/00YT/+S2Sx59rO3Rcb5pE
         2yOt3cuwVacBxuJpHCGj+oglUZ6HsywjxFUnXA9RNKOQRpD6UuVXEh4ZW572eajDJT5W
         6vSENIaT9mCfTySncyxfRYWvq8hYZJfFFPGjErWgxZN0Y6QUtCOBHlosBjdg6Xr/aCrq
         5unFj54B6uQaptY/DP2mHK7WWARQLpxb85tJnxHs3L2AvnMS7TDZ5vfYmjGNwTaaRKkr
         XkcJ4QWhFTHg0ifeOFZ/hUycXtsbqkta5dnLzeaSeEe9qBtqJrxC1Gjm/9Kn+KH+OmDv
         eY5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=JJA305OgYfWdFpeBb895vZC1w+JpOwGtBxhuAxXTPBY=;
        fh=Bqei7UspLQLDtJyhx8DFVPkwaTXoAlN/5Ng7ASZZYZk=;
        b=NLHuwcASgmEzu0XLPlFbHvKJhWZ1cJLo1NnYT6u/RoEjTUsbcZFddf4XTm+pYlYlPY
         zTEMWKOSMDsvjHU3vRN58ijVqh02ZvBKBJT+GV1PAHXBhu/2GOjmH5392JBitdjdNUb+
         WDSk9UMdaenWy9SveGh+kNAEpwLUwztqU0jBjb6vSVpwd5//JlHEzeVJole0dOPosmd7
         gSeWn1ajtmvJyIiW/cqUcbKg4hTXShs9ddU4zi7BwH5N382HoyNtN3g5NK2rKJCbkd1g
         JkYUiqiAso5yEUUGf/xLt90YjaTj+XJaLcKiqlvjc/u7xdgVU3Vz/5kty36seSWILdCH
         JqBQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jBEqisLH;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a72a2b938dsi15829091cf.26.2025.06.12.14.02.06
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 14:02:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jBEqisLH;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749762126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JJA305OgYfWdFpeBb895vZC1w+JpOwGtBxhuAxXTPBY=;
	b=jBEqisLHhxv9idfajNW2E8BIN0aPWrpJP0xSTH89dufaCFe/ZLxcrsB5vtVpr1CUnVHfL2
	VQNHrzSpP9Q3oCmygMVpBHGpqSHjxTjuYvJI8r5ri/EW+rNQUkIghQFlyomxMzbpgGhDnj
	KYukBqle9lsOY2TNS8FyDTmZRREqi6Q=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-331-VtcxKj9dMB62CsMMn7fsAA-1; Thu,
 12 Jun 2025 17:02:04 -0400
X-MC-Unique: VtcxKj9dMB62CsMMn7fsAA-1
X-Mimecast-MFC-AGG-ID: VtcxKj9dMB62CsMMn7fsAA_1749762119
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DF37D195608E;
	Thu, 12 Jun 2025 21:01:58 +0000 (UTC)
Received: from jsnow-thinkpadp16vgen1.westford.csb (unknown [10.22.80.54])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A929F1956050;
	Thu, 12 Jun 2025 21:01:29 +0000 (UTC)
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
Subject: [PATCH v2 12/12] scripts/codeconverter: remove * imports
Date: Thu, 12 Jun 2025 16:54:50 -0400
Message-ID: <20250612205451.1177751-13-jsnow@redhat.com>
In-Reply-To: <20250612205451.1177751-1-jsnow@redhat.com>
References: <20250612205451.1177751-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WpTN1zcE1tveA7m7bxxZf1-xnRwWKAn-Lw6669pV41I_1749762119
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-TUID: X4za9ldTgxij

Python static analysis tools generally don't like dealing with asterisk
imports as it's tough to deduce what's actually getting used and from
where. Replace these imports with explicit imports.

This also helps eliminate deprecated imports from the typing module.

These files have more style issues that are not addressed by this patch,
so the command-line I am using to ensure I am not creating new
identifier problems is a flake8 command set to squelch most style
issues:

flake8 --ignore=E111,E114,E117,E127,E128,E129,E201,E221,E222,\
                E225,E226,E252,E231,E261,E265,E301,E302,E303,\
                E305,E306,E501,E502,E703,E712,E731,E741,F841,\
                W292,W391,W503,W504 \
                *.py

I am also using pylint's errors-only mode:

pylint -E *.py

Signed-off-by: John Snow <jsnow@redhat.com>
---
 .../codeconverter/codeconverter/patching.py   |  4 +-
 .../codeconverter/codeconverter/qom_macros.py | 83 +++++++++++++------
 .../codeconverter/qom_type_info.py            | 76 ++++++++++++++---
 .../codeconverter/test_patching.py            |  9 +-
 .../codeconverter/test_regexps.py             | 32 ++++++-
 scripts/codeconverter/codeconverter/utils.py  |  7 +-
 6 files changed, 161 insertions(+), 50 deletions(-)

diff --git a/scripts/codeconverter/codeconverter/patching.py b/scripts/codeconverter/codeconverter/patching.py
index 0165085caed..f336377972e 100644
--- a/scripts/codeconverter/codeconverter/patching.py
+++ b/scripts/codeconverter/codeconverter/patching.py
@@ -25,6 +25,8 @@
     Union,
 )
 
+from .utils import LineAndColumn, line_col
+
 
 logger = logging.getLogger(__name__)
 DBG = logger.debug
@@ -32,8 +34,6 @@
 WARN = logger.warning
 ERROR = logger.error
 
-from .utils import *
-
 
 T = TypeVar('T')
 
diff --git a/scripts/codeconverter/codeconverter/qom_macros.py b/scripts/codeconverter/codeconverter/qom_macros.py
index 04512bfffdd..f28d91ae90c 100644
--- a/scripts/codeconverter/codeconverter/qom_macros.py
+++ b/scripts/codeconverter/codeconverter/qom_macros.py
@@ -5,14 +5,47 @@
 #
 # This work is licensed under the terms of the GNU GPL, version 2.  See
 # the COPYING file in the top-level directory.
+from collections.abc import Iterable, Iterator
 from itertools import chain
 import logging
 import re
-from typing import *
+from typing import (
+    Literal,
+    NamedTuple,
+    Optional,
+    cast,
+)
 
-from .patching import *
-from .regexps import *
-from .utils import *
+from .patching import (
+    FileInfo,
+    FileList,
+    FileMatch,
+    Patch,
+    RequiredIdentifier,
+)
+from .regexps import (
+    CPP_SPACE,
+    NAMED,
+    OPTIONAL_PARS,
+    OR,
+    RE_COMMENT,
+    RE_COMMENTS,
+    RE_EXPRESSION,
+    RE_FILE_BEGIN,
+    RE_FUN_CALL,
+    RE_IDENTIFIER,
+    RE_INCLUDE,
+    RE_MACRO_CONCAT,
+    RE_NUMBER,
+    RE_SIMPLEDEFINE,
+    RE_STRING,
+    RE_STRUCT_TYPE,
+    RE_TYPE,
+    SP,
+    M,
+    S,
+)
+from .utils import merge, opt_compare
 
 
 logger = logging.getLogger(__name__)
@@ -69,7 +102,7 @@ def __str__(self) -> str:
         s = ', '.join('%s=%s' % (f,v) for f,v in values if v is not None)
         return f'{s}'
 
-    def check_consistency(self) -> List[str]:
+    def check_consistency(self) -> list[str]:
         """Check if identifiers are consistent with each other,
         return list of problems (or empty list if everything seems consistent)
         """
@@ -236,7 +269,7 @@ def find_typedef(f: FileInfo, name: Optional[str]) -> Optional[TypedefMatch]:
         NAMED('qom_typename', RE_IDENTIFIER), r'\s*\)\n',
         n='?', name='check_args'))
 
-EXPECTED_CHECKER_SUFFIXES: List[Tuple[CheckerMacroName, str]] = [
+EXPECTED_CHECKER_SUFFIXES: list[tuple[CheckerMacroName, str]] = [
     ('OBJECT_GET_CLASS', '_GET_CLASS'),
     ('OBJECT_CLASS_CHECK', '_CLASS'),
 ]
@@ -268,7 +301,7 @@ def sanity_check(self) -> None:
         if self.typedefname and self.find_typedef() is None:
             self.warn("typedef used by %s not found", self.name)
 
-    def find_matching_macros(self) -> List['TypeCheckMacro']:
+    def find_matching_macros(self) -> list['TypeCheckMacro']:
         """Find other check macros that generate the same macro names
 
         The returned list will always be sorted.
@@ -281,7 +314,7 @@ def find_matching_macros(self) -> List['TypeCheckMacro']:
                    and (my_ids.uppercase == m.type_identifiers.uppercase
                         or my_ids.typename == m.type_identifiers.typename)]
 
-    def merge_ids(self, matches: List['TypeCheckMacro']) -> Optional[TypeIdentifiers]:
+    def merge_ids(self, matches: list['TypeCheckMacro']) -> Optional[TypeIdentifiers]:
         """Try to merge info about type identifiers from all matches in a list"""
         if not matches:
             return None
@@ -581,10 +614,12 @@ def gen_patches(self) -> Iterable[Patch]:
             return
 
         # group checkers by uppercase name:
-        decl_types: List[Type[TypeDeclaration]] = [DeclareInstanceChecker, DeclareInstanceType,
-                                                   DeclareClassCheckers, DeclareClassType,
-                                                   DeclareObjCheckers]
-        checker_dict: Dict[str, List[TypeDeclaration]] = {}
+        decl_types: list[type[TypeDeclaration]] = [
+            DeclareInstanceChecker, DeclareInstanceType,
+            DeclareClassCheckers, DeclareClassType,
+            DeclareObjCheckers
+        ]
+        checker_dict: dict[str, list[TypeDeclaration]] = {}
         for t in decl_types:
             for m in self.file.matches_of_type(t):
                 checker_dict.setdefault(m.group('uppercase'), []).append(m)
@@ -603,9 +638,9 @@ def gen_patches(self) -> Iterable[Patch]:
             field_dict = {f: v.pop() if v else None for f,v in fvalues.items()}
             yield from self.gen_patches_for_type(uppercase, checkers, field_dict)
 
-    def find_conflicts(self, uppercase: str, checkers: List[TypeDeclaration]) -> bool:
+    def find_conflicts(self, uppercase: str, checkers: list[TypeDeclaration]) -> bool:
         """Look for conflicting declarations that would make it unsafe to add new ones"""
-        conflicting: List[FileMatch] = []
+        conflicting: list[FileMatch] = []
         # conflicts in the same file:
         conflicting.extend(chain(self.file.find_matches(DefineDirective, uppercase),
                                  self.file.find_matches(DeclareInterfaceChecker, uppercase, 'uppercase'),
@@ -634,8 +669,8 @@ def find_conflicts(self, uppercase: str, checkers: List[TypeDeclaration]) -> boo
         return False
 
     def gen_patches_for_type(self, uppercase: str,
-                             checkers: List[TypeDeclaration],
-                             fields: Dict[str, Optional[str]]) -> Iterable[Patch]:
+                             checkers: list[TypeDeclaration],
+                             fields: dict[str, Optional[str]]) -> Iterable[Patch]:
         """Should be reimplemented by subclasses"""
         return
         yield
@@ -644,8 +679,8 @@ class DeclareVoidTypes(TypeDeclarationFixup):
     """Add DECLARE_*_TYPE(..., void) when there's no declared type"""
     regexp = RE_FILE_BEGIN
     def gen_patches_for_type(self, uppercase: str,
-                             checkers: List[TypeDeclaration],
-                             fields: Dict[str, Optional[str]]) -> Iterable[Patch]:
+                             checkers: list[TypeDeclaration],
+                             fields: dict[str, Optional[str]]) -> Iterable[Patch]:
         if self.find_conflicts(uppercase, checkers):
             return
 
@@ -672,8 +707,8 @@ def gen_patches_for_type(self, uppercase: str,
 class AddDeclareTypeName(TypeDeclarationFixup):
     """Add DECLARE_TYPE_NAME declarations if necessary"""
     def gen_patches_for_type(self, uppercase: str,
-                             checkers: List[TypeDeclaration],
-                             fields: Dict[str, Optional[str]]) -> Iterable[Patch]:
+                             checkers: list[TypeDeclaration],
+                             fields: dict[str, Optional[str]]) -> Iterable[Patch]:
         typename = fields.get('typename')
         if typename is None:
             self.warn("typename unavailable")
@@ -754,7 +789,7 @@ def find_typename_uppercase(files: FileList, typename: str) -> Optional[str]:
 
 def find_type_checkers(files:FileList, name:str, group:str='uppercase') -> Iterable[TypeCheckerDeclaration]:
     """Find usage of DECLARE*CHECKER macro"""
-    c: Type[TypeCheckerDeclaration]
+    c: type[TypeCheckerDeclaration]
     for c in (DeclareInstanceChecker, DeclareClassCheckers, DeclareObjCheckers, ObjectDeclareType, ObjectDeclareSimpleType):
         yield from files.find_matches(c, name=name, group=group)
 
@@ -775,8 +810,8 @@ class InitialIncludes(FileMatch):
                  n='*', name='includes'))
 
 class SymbolUserList(NamedTuple):
-    definitions: List[FileMatch]
-    users: List[FileMatch]
+    definitions: list[FileMatch]
+    users: list[FileMatch]
 
 class MoveSymbols(FileMatch):
     """Handle missing symbols
@@ -790,7 +825,7 @@ def gen_patches(self) -> Iterator[Patch]:
             self.debug("skipping object.h")
             return
 
-        index: Dict[RequiredIdentifier, SymbolUserList] = {}
+        index: dict[RequiredIdentifier, SymbolUserList] = {}
         definition_classes = [SimpleTypedefMatch, FullStructTypedefMatch, ConstantDefine, Include]
         user_classes = [TypeCheckMacro, DeclareObjCheckers, DeclareInstanceChecker, DeclareClassCheckers, InterfaceCheckMacro]
 
diff --git a/scripts/codeconverter/codeconverter/qom_type_info.py b/scripts/codeconverter/codeconverter/qom_type_info.py
index 4ecdd728890..76fcf498f58 100644
--- a/scripts/codeconverter/codeconverter/qom_type_info.py
+++ b/scripts/codeconverter/codeconverter/qom_type_info.py
@@ -5,14 +5,49 @@
 #
 # This work is licensed under the terms of the GNU GPL, version 2.  See
 # the COPYING file in the top-level directory.
+from collections.abc import Iterable
+import logging
 import re
+from typing import Optional, Union
 
-from .patching import *
-from .qom_macros import *
-from .regexps import *
-from .utils import *
+from .patching import (
+    FileInfo,
+    FileList,
+    FileMatch,
+    Patch,
+    RegexpScanner,
+)
+from .qom_macros import (
+    DeclareClassCheckers,
+    DeclareInstanceChecker,
+    DeclareObjCheckers,
+    ExpressionDefine,
+    OldStyleObjectDeclareSimpleType,
+    SimpleTypedefMatch,
+    TypeDeclaration,
+    TypeDeclarationFixup,
+    find_type_checkers,
+    find_typename_uppercase,
+)
+from .regexps import (
+    CPP_SPACE,
+    NAMED,
+    OR,
+    RE_ARRAY,
+    RE_ARRAY_ITEM,
+    RE_COMMENTS,
+    RE_EXPRESSION,
+    RE_IDENTIFIER,
+    RE_SIZEOF,
+    SP,
+    M,
+    S,
+)
 
 
+logger = logging.getLogger(__name__)
+DBG = logger.debug
+
 TI_FIELDS = [ 'name', 'parent', 'abstract', 'interfaces',
     'instance_size', 'instance_init', 'instance_post_init', 'instance_finalize',
     'class_size', 'class_init', 'class_base_init', 'class_data']
@@ -27,7 +62,7 @@
 RE_TYPEINFO_START = S(r'^[ \t]*', M(r'(static|const)\s+', name='modifiers'), r'TypeInfo\s+',
                       NAMED('name', RE_IDENTIFIER), r'\s*=\s*{[ \t]*\n')
 
-ParsedArray = List[str]
+ParsedArray = list[str]
 ParsedInitializerValue = Union[str, ParsedArray]
 
 class ArrayItem(FileMatch):
@@ -57,7 +92,7 @@ def parsed(self) -> ParsedInitializerValue:
             return array.parsed()
         return parsed
 
-TypeInfoInitializers = Dict[str, FieldInitializer]
+TypeInfoInitializers = dict[str, FieldInitializer]
 
 class TypeDefinition(FileMatch):
     """
@@ -341,7 +376,9 @@ def gen_patches(self) -> Iterable[Patch]:
 
         ok = True
 
-        #checkers: List[TypeCheckerDeclaration] = list(find_type_checkers(self.allfiles, uppercase))
+        #checkers: list[TypeCheckerDeclaration] = list(
+        #    find_type_checkers(self.allfiles, uppercase)
+        #)
         #for c in checkers:
         #    c.info("instance type checker declaration (%s) is here", c.group('uppercase'))
         #if not checkers:
@@ -446,7 +483,11 @@ class ObjectDefineType(TypeDefinition):
                r'\s*\);?\n?')
 
 def find_type_definitions(files: FileList, uppercase: str) -> Iterable[TypeDefinition]:
-    types: List[Type[TypeDefinition]] = [TypeInfoVar, ObjectDefineType, ObjectDefineTypeExtended]
+    types: list[type[TypeDefinition]] = [
+        TypeInfoVar,
+        ObjectDefineType,
+        ObjectDefineTypeExtended
+    ]
     for t in types:
         for m in files.matches_of_type(t):
             m.debug("uppercase: %s", m.uppercase)
@@ -456,9 +497,12 @@ def find_type_definitions(files: FileList, uppercase: str) -> Iterable[TypeDefin
 
 class AddDeclareVoidClassType(TypeDeclarationFixup):
     """Will add DECLARE_CLASS_TYPE(..., void) if possible"""
-    def gen_patches_for_type(self, uppercase: str,
-                             checkers: List[TypeDeclaration],
-                             fields: Dict[str, Optional[str]]) -> Iterable[Patch]:
+    def gen_patches_for_type(
+        self,
+        uppercase: str,
+        checkers: list[TypeDeclaration],
+        fields: dict[str, Optional[str]],
+    ) -> Iterable[Patch]:
         defs = list(find_type_definitions(self.allfiles, uppercase))
         if len(defs) > 1:
             self.warn("multiple definitions for %s", uppercase)
@@ -552,7 +596,10 @@ def gen_patches(self) -> Iterable[Patch]:
             if not self.file.force:
                 return
 
-        decl_types: List[Type[TypeDeclaration]] = [DeclareClassCheckers, DeclareObjCheckers]
+        decl_types: list[type[TypeDeclaration]] = [
+            DeclareClassCheckers,
+            DeclareObjCheckers
+        ]
         class_decls = [m for t in decl_types
                        for m in self.allfiles.find_matches(t, uppercase, 'uppercase')]
 
@@ -632,7 +679,10 @@ def gen_patches(self) -> Iterable[Patch]:
             if not self.file.force:
                 return
 
-        decl_types: List[Type[TypeDeclaration]] = [DeclareClassCheckers, DeclareObjCheckers]
+        decl_types: list[type[TypeDeclaration]] = [
+            DeclareClassCheckers,
+            DeclareObjCheckers
+        ]
         class_decls = [m for t in decl_types
                        for m in self.allfiles.find_matches(t, uppercase, 'uppercase')]
         if class_decls:
diff --git a/scripts/codeconverter/codeconverter/test_patching.py b/scripts/codeconverter/codeconverter/test_patching.py
index b125eee2b72..4e5165a8014 100644
--- a/scripts/codeconverter/codeconverter/test_patching.py
+++ b/scripts/codeconverter/codeconverter/test_patching.py
@@ -7,13 +7,8 @@
 # the COPYING file in the top-level directory.
 from tempfile import NamedTemporaryFile
 
-from .patching import (
-    FileInfo,
-    FileList,
-    FileMatch,
-    Patch,
-)
-from .regexps import *
+from .patching import FileInfo, FileList, FileMatch
+from .regexps import NAMED, RE_IDENTIFIER, S
 
 
 class BasicPattern(FileMatch):
diff --git a/scripts/codeconverter/codeconverter/test_regexps.py b/scripts/codeconverter/codeconverter/test_regexps.py
index 86d0499c50e..deba604361b 100644
--- a/scripts/codeconverter/codeconverter/test_regexps.py
+++ b/scripts/codeconverter/codeconverter/test_regexps.py
@@ -5,9 +5,35 @@
 #
 # This work is licensed under the terms of the GNU GPL, version 2.  See
 # the COPYING file in the top-level directory.
-from .qom_macros import *
-from .qom_type_info import *
-from .regexps import *
+
+import re
+
+from .qom_macros import (
+    RE_CHECK_MACRO,
+    RE_MACRO_DEFINE,
+    RE_STRUCT_TYPEDEF,
+    InitialIncludes,
+)
+from .qom_type_info import (
+    RE_TI_FIELD_INIT,
+    RE_TI_FIELDS,
+    RE_TYPEINFO_START,
+    TypeInfoVar,
+)
+from .regexps import (
+    CPP_SPACE,
+    RE_ARRAY,
+    RE_ARRAY_CAST,
+    RE_ARRAY_ITEM,
+    RE_COMMENT,
+    RE_COMMENTS,
+    RE_EXPRESSION,
+    RE_FUN_CALL,
+    RE_IDENTIFIER,
+    RE_MACRO_CONCAT,
+    RE_SIMPLE_VALUE,
+    SP,
+)
 
 
 def test_res() -> None:
diff --git a/scripts/codeconverter/codeconverter/utils.py b/scripts/codeconverter/codeconverter/utils.py
index ced81a76486..b39cfb8b7d1 100644
--- a/scripts/codeconverter/codeconverter/utils.py
+++ b/scripts/codeconverter/codeconverter/utils.py
@@ -6,7 +6,12 @@
 # This work is licensed under the terms of the GNU GPL, version 2.  See
 # the COPYING file in the top-level directory.
 import logging
-from typing import *
+from typing import (
+    NamedTuple,
+    NewType,
+    Optional,
+    TypeVar,
+)
 
 
 logger = logging.getLogger(__name__)
-- 
2.48.1
