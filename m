Received: by 10.28.71.155 with SMTP id m27csp551753wmi;
        Fri, 23 Mar 2018 07:32:44 -0700 (PDT)
X-Google-Smtp-Source: AG47ELtpdQtVIIB1ZvKid+NZZ7webaNOli1EBUsdHGImigzylxfbXNXP6sFKny9z5pCvQuyEDf3U
X-Received: by 10.55.198.153 with SMTP id s25mr38762174qkl.221.1521815564022;
        Fri, 23 Mar 2018 07:32:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521815564; cv=none;
        d=google.com; s=arc-20160816;
        b=mkpDDBz8k3ztW/9pEamYZrHLOyz+fISfnqAIIa8ZCVjyW2FHwsokghTbPNOQGDKGyn
         Fyk/W9f1u5wUydqbwPVLsc1XnElwJkby8b3/fFmLEvziRbZEVuPgx2lWGFkul6Rn3oeF
         HSZg1LKfti9M31lO7Lom528FOFn6JejNNNAF7/2Klmxi5gdqEEDIIJlfJMe7jxhlmJKo
         uP7pufSJK7cpYo/1OqehofQvb2Q2GlmxMJv4RDSs4d9AVTGOM+hcGEl8BNCV1ER8ZPK4
         MUzqryHauVHmGjfQicx13U8FJ1BmjDh8/kzS+C44p0YYu7N3qFHMm0NNep63xX0Iinhl
         yo/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=b9x9aE+h2Gts3z0T7Pgvm1VEek78s7+lZZsSSwBrumc=;
        b=qtKc8L2gbRfd/k/9EifREtvL87OMyYm5hfYwwk03DvRY0+/pzIPzGoYp6os47Ev36y
         EQuT8OjPIPN7wmLKcjeV1JJ+qnLr75wEucFf35Wh69ue+nFqlRe3+vrLcA2ECylp+vAU
         dOsmPHHZwlIhBzanR8yBuPMga9BNOo0MCx+jfiZ2xu1LO1XLxaxfmjOfvb1XHZUW1QZ/
         wYR1UK8J6Arw2ce62/OT6J6v0djjgd7S8iFSQy2kLHcxuVEcYtXpHUHuV8XRWUQgCEps
         ut8aKX5uK+CiVaeGhk5SFn/cC2H91mXkfDfDKTRhpNaxTOgnLQT1vpUgK1G4jaknPdVu
         8RBg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g38si1213040qtf.128.2018.03.23.07.32.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Mar 2018 07:32:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38338 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ezNkJ-00044Y-AM
	for alex.bennee@linaro.org; Fri, 23 Mar 2018 10:32:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36282)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ezNk0-00041R-D4
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 10:32:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ezNju-00035y-Gf
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 10:32:24 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:50626 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1ezNju-00035l-C5; Fri, 23 Mar 2018 10:32:18 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D12269BA46;
	Fri, 23 Mar 2018 14:32:17 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-204-35.brq.redhat.com [10.40.204.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6B7482023233;
	Fri, 23 Mar 2018 14:32:11 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 23 Mar 2018 15:31:58 +0100
Message-Id: <20180323143202.28879-2-lvivier@redhat.com>
In-Reply-To: <20180323143202.28879-1-lvivier@redhat.com>
References: <20180323143202.28879-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Fri, 23 Mar 2018 14:32:17 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Fri, 23 Mar 2018 14:32:17 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'lvivier@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v2 1/5] make: improve check for stale generated
 files in source dir
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, Alexander Graf <agraf@suse.de>,
	Max Filippov <jcmvbkbc@gmail.com>, Eric Blake <eblake@redhat.com>,
	Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
	qemu-trivial@nongnu.org, Yongbok Kim <yongbok.kim@mips.com>,
	Markus Armbruster <armbru@redhat.com>,
	Richard Henderson <rth@twiddle.net>, Fam Zheng <famz@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
	Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SUqF7owE3IJ5

From: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

When doing a build with builddir !=3D srcdir, if any generated files are
accidentally present in srcdir from a previous build, these can cause
unexpected failures.

Currently there is a rule that checks for existance of config-host.mak,
but there have been cases where config-host.mak is absent, while other
generated files still exist.

Update the check to look at every file listed in $(GENERATED_FILES). To
do this we must move the check further down after $(GENERATED_FILES) has
been populated.

Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
---
 Makefile | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/Makefile b/Makefile
index 727ef118f3..d588a13687 100644
--- a/Makefile
+++ b/Makefile
@@ -52,16 +52,6 @@ endif
=20
 .git-submodule-status: git-submodule-update config-host.mak
=20
-# Check that we're not trying to do an out-of-tree build from
-# a tree that's been used for an in-tree build.
-ifneq ($(realpath $(SRC_PATH)),$(realpath .))
-ifneq ($(wildcard $(SRC_PATH)/config-host.mak),)
-$(error This is an out of tree build but your source tree ($(SRC_PATH)) =
\
-seems to have been used for an in-tree build. You can fix this by runnin=
g \
-"$(MAKE) distclean && rm -rf *-linux-user *-softmmu" in your source tree=
)
-endif
-endif
-
 CONFIG_SOFTMMU :=3D $(if $(filter %-softmmu,$(TARGET_DIRS)),y)
 CONFIG_USER_ONLY :=3D $(if $(filter %-user,$(TARGET_DIRS)),y)
 CONFIG_XEN :=3D $(CONFIG_XEN_BACKEND)
@@ -1028,6 +1018,25 @@ ifdef SIGNCODE
 endif # SIGNCODE
 endif # CONFIG_WIN
=20
+define nl
+
+
+endef
+
+CHECK_FILES =3D config-host.mak $(filter-out .git-submodule-status, $(GE=
NERATED_FILES))
+UNEXPECTED_FILES =3D $(wildcard $(CHECK_FILES:%=3D$(SRC_PATH)/%))
+
+# Check that we're not trying to do an out-of-tree build from
+# a tree that's been used for an in-tree build.
+ifneq ($(realpath $(SRC_PATH)),$(realpath .))
+ifneq ($(UNEXPECTED_FILES),)
+$(error Stale files in source tree:${nl}${nl} $(UNEXPECTED_FILES:%=3D  %=
${nl}) ${nl}\
+This is an out of tree build but your source tree ($(SRC_PATH)) \
+seems to have been used for an in-tree build. You can fix this by runnin=
g \
+"$(MAKE) distclean && rm -rf *-linux-user *-softmmu" in your source tree=
)
+endif
+endif
+
 # Add a dependency on the generated files, so that they are always
 # rebuilt before other object files
 ifneq ($(wildcard config-host.mak),)
--=20
2.14.3

