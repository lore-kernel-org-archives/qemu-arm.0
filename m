Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1722532ejc;
        Fri, 13 Oct 2023 12:10:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBOAFAniJ5vx69bncVDgInam+Co+YAgX+sVsYjPLK4hvzT4lGsuwC/h8AOITxJgdZHNcYH
X-Received: by 2002:a05:622a:58f:b0:410:ab6d:54da with SMTP id c15-20020a05622a058f00b00410ab6d54damr35765644qtb.16.1697224202311;
        Fri, 13 Oct 2023 12:10:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697224202; cv=none;
        d=google.com; s=arc-20160816;
        b=BI9ZsuGF7/zAlc4PgDXRfi3Q1tVJYp7UYS1HJpApk+37M2qex4Um3KMqgdYS2lQ35P
         Z8ctrkbIyRIcJKLRTDIFU/S3qaWLTkNn91bT4hqDUa57O+SCeNhHeWtozW8JyHC0ugBb
         cwFaifS3/Lwq6t5YWqgH2XfrXYV/eqM+iwlbXWJubKs1l1zz1tOztkP4JbniWcwp5rcv
         /S/9TKq6ko9lXACzwBSz6b+TRXNrNcbHrsqeZoLgx+ZiQjFDxNEonFOf4qun5iVyN+9d
         1JzyXUCvDVoYgvwBULzfCzoJ2UlCVwVdr2lFf+JNQ9LudpDKPELCdjwzYrRMXrcxUCcV
         EVFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=cxgTEoBavOn4bsrLaLlgOod3d59bBtFgJHbxexkR54s=;
        fh=D6q9Zl84lh9f35IkUo72nHtoK2p7pHS0kVOpFtZg6qI=;
        b=iA9NNynBlYD+Hd03MsR6Ei3hOlwRq+EXlMzqzP+WMGUh8GxMmh61N7RHKfQsLumO8z
         QJ0Lxy3AdpkpiJwzc4heVU+9CEPoGTakpOI0T+0+l7zwHSH1dE43XZgFOfmN24valmjg
         ImxQdZuKN4PbQ/73a3vBHk4/giKgEhnhncMbMrwO6L8YUWkxvSLTqbLDtOfRuHAT79cp
         kHuYnsO+z5a1y5cO4OPiIG0Jyiepgqlyoa/xLeyaLQ3KlqyunWyYGrj/in8j24upOr6Y
         yhH2vZOz2AZc8cAo+3JktuHkDDozu/I16Ce69RO6gz3V2IbeI3lF1/9fTA0qA5fMbcI1
         /ceQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=U8y6Ni7U;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id k3-20020ac85fc3000000b003f9ae403acasi1734065qta.263.2023.10.13.12.10.02
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 12:10:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=U8y6Ni7U;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697224201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cxgTEoBavOn4bsrLaLlgOod3d59bBtFgJHbxexkR54s=;
	b=U8y6Ni7UCzJ+mlRZebcguN2LIy9WimjEyKcFwFvOkBmqytmooYptGkPtUc39ONvY+tzPHj
	d2u7Zdml97094j0VVtzczt+n/yRFJrendM//H+VxgZS8KF1TwtTxUEw/k2yd4rpMwPjy9t
	FC22gRhnxBOywFRhL5LqHFyoVFx7L5g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-83-gMv1fUy1OkSI5r3m9cSsRQ-1; Fri, 13 Oct 2023 15:10:00 -0400
X-MC-Unique: gMv1fUy1OkSI5r3m9cSsRQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 062A41029F41;
	Fri, 13 Oct 2023 19:09:59 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.32.124])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A9B1640C6CA1;
	Fri, 13 Oct 2023 19:09:57 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	qemu-arm@nongnu.org,
	Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
	Ani Sinha <anisinha@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	qemu-s390x@nongnu.org,
	Peter Xu <peterx@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	John Snow <jsnow@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	qemu-block@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	Juan Quintela <quintela@redhat.com>,
	Leonardo Bras <leobras@redhat.com>,
	Joel Stanley <joel@jms.id.au>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Eric Farman <farman@linux.ibm.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Halil Pasic <pasic@linux.ibm.com>,
	Cleber Rosa <crosa@redhat.com>
Subject: [PULL 12/25] qmp_shell.py: _fill_completion() use .command() instead of .cmd()
Date: Fri, 13 Oct 2023 15:09:27 -0400
Message-ID: <20231013190941.3699288-13-jsnow@redhat.com>
In-Reply-To: <20231013190941.3699288-1-jsnow@redhat.com>
References: <20231013190941.3699288-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-TUID: OHK2vNCvIUfg

From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

We just want to ignore failure, so we don't need low level .cmd(). This
helps further renaming .command() to .cmd().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-id: 20231006154125.1068348-3-vsementsov@yandex-team.ru
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/qmp/qmp_shell.py | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/python/qemu/qmp/qmp_shell.py b/python/qemu/qmp/qmp_shell.py
index 619ab42ced..988d79c01b 100644
--- a/python/qemu/qmp/qmp_shell.py
+++ b/python/qemu/qmp/qmp_shell.py
@@ -91,14 +91,21 @@
 import sys
 from typing import (
     IO,
+    Dict,
     Iterator,
     List,
     NoReturn,
     Optional,
     Sequence,
+    cast,
 )
 
-from qemu.qmp import ConnectError, QMPError, SocketAddrT
+from qemu.qmp import (
+    ConnectError,
+    ExecuteError,
+    QMPError,
+    SocketAddrT,
+)
 from qemu.qmp.legacy import (
     QEMUMonitorProtocol,
     QMPBadPortError,
@@ -194,11 +201,12 @@ def close(self) -> None:
         super().close()
 
     def _fill_completion(self) -> None:
-        cmds = self.cmd('query-commands')
-        if 'error' in cmds:
-            return
-        for cmd in cmds['return']:
-            self._completer.append(cmd['name'])
+        try:
+            cmds = cast(List[Dict[str, str]], self.command('query-commands'))
+            for cmd in cmds:
+                self._completer.append(cmd['name'])
+        except ExecuteError:
+            pass
 
     def _completer_setup(self) -> None:
         self._completer = QMPCompleter()
-- 
2.41.0
