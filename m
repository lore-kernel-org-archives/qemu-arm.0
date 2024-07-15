Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp2391749nji;
        Mon, 15 Jul 2024 10:33:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVFigoSsIcBAgcqCDJvWOMyDC2HNCV38j7Q5VACigQiNp7SKFmOknxgWY8WRMObGbF2VZ5Wzuh67/E9n09Z2rp883PPwVCh
X-Google-Smtp-Source: AGHT+IHPyu/j0LmntQaqEvhBPsYiaErsnocOSUFyE80khRsEIF8OHyGsA1ZajTVSoi5glmyzKjxO
X-Received: by 2002:a05:620a:2698:b0:79d:55f0:d092 with SMTP id af79cd13be357-7a179f18d51mr63857485a.8.1721064804329;
        Mon, 15 Jul 2024 10:33:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721064804; cv=none;
        d=google.com; s=arc-20160816;
        b=Y2TG4VppYM73yUlSkPhfBMNk7YHbTAJrxGauwQJtqO3RqfKE1HBW0uBRCeePGa3yoj
         gpY2L5WAKod6g9NXKItceniGEYjIG4Mwy2dty6cPbx2u8ED/a1h/zgljXxVFlCzwnW/9
         mMnPE0gV58MCxHEHwCc4GCrFvnlNI/i3H5LWpAKoDXx6NtG4HHAyzUMfk9ayqqy47Trg
         j9r5pYaVhrcF78oyLAJg7VYwRdheoIv6h8nO0IHcpgobCKKcE/zdoy8QnX5rku9PXn1c
         cI0h9gaCjpJCDIHcYGjv2CvBSLiyw74IS6ewycGtiwv8bKKyvISy95cikDZTMhp+dmZg
         jYWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=z5l1q3T81yzOz2V0G9sVAkuZQRl7Lg8KfOv5S6cElYk=;
        fh=Vh4aLTjuyylyycFlCkrZ7Ouz37ZrS6wbH/qgUthxXT8=;
        b=uS7vmgFyh8c0rCt5xmuWMg2Z+8ned5Daa8C+SLbwrLDS7GuiufAO+63MV2HwyxguyI
         +bQyxfg4sQ887r76N7TzQ5xX4C95d0pAhxuzNBh/OyVBELSZfPRMqYwR6l3FvZrIWNY7
         KG3cNoOnRNLA/crjeZeY9CD7dhUID3bGT49JK7kYA67DYDvzoe7LFJ24npFlzNkXqWW0
         8Hdc/035DDTfpJLF67TplWPcavPqO89VbVvZeC0H6UTYoFdGB7IBBZEQDZ5EZUJMM7YC
         La4VAipbrGJiSZXgHSdFTXEcYtDJlRYfPlUvCjVFSWoxXBxc7Nkveaol6Wq/CuY0KH80
         x9hw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FbWc1cva;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7a160c496f1si570088785a.331.2024.07.15.10.33.24
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 10:33:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FbWc1cva;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721064804;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z5l1q3T81yzOz2V0G9sVAkuZQRl7Lg8KfOv5S6cElYk=;
	b=FbWc1cvaNgzkDAYlSO+lPpBypHpmsVLv78oj8hGlhP1MatzLYPlwzb5dkbAvwqXOMo4ZNa
	h0lbfUYuRWGueJqCQygw41/Wwtn3K9Kmqv6qNVQXPirA8PEw3qTq6PaOK3QnG5BclYFYsu
	ba56rHoeRDPWSlUtKtatBREA5ZYYsWg=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-648-U_il8DzCNdC-q9KbsIx0KA-1; Mon,
 15 Jul 2024 13:33:15 -0400
X-MC-Unique: U_il8DzCNdC-q9KbsIx0KA-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6052D1955D4A;
	Mon, 15 Jul 2024 17:33:12 +0000 (UTC)
Received: from scv.localdomain (unknown [10.22.65.127])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6FDF71955D44;
	Mon, 15 Jul 2024 17:33:05 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
	Joel Stanley <joel@jms.id.au>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Leonardo Bras <leobras@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	qemu-block@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
	Cleber Rosa <crosa@redhat.com>,
	qemu-arm@nongnu.org,
	Fabiano Rosas <farosas@suse.de>,
	Hanna Reitz <hreitz@redhat.com>,
	qemu-s390x@nongnu.org,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	John Snow <jsnow@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Michael Roth <michael.roth@amd.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Andrew Jeffery <andrew@aj.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Beraldo Leal <bleal@redhat.com>,
	Eric Farman <farman@linux.ibm.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Thomas Huth <thuth@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Peter Xu <peterx@redhat.com>
Subject: [PULL 3/6] iotests: Change imports for Python 3.13
Date: Mon, 15 Jul 2024 13:32:38 -0400
Message-ID: <20240715173241.572048-4-jsnow@redhat.com>
In-Reply-To: <20240715173241.572048-1-jsnow@redhat.com>
References: <20240715173241.572048-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-TUID: DM9Aelv03JtR

Python 3.13 isn't out yet, but it's in beta and Fedora is ramping up to
make it the default system interpreter for Fedora 41.

They moved our cheese for where ContextManager lives; add a conditional
to locate it while we support both pre-3.9 and 3.13+.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-id: 20240626232230.408004-4-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/testenv.py    | 7 ++++++-
 tests/qemu-iotests/testrunner.py | 9 ++++++---
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
index 588f30a4f14..96d69e56963 100644
--- a/tests/qemu-iotests/testenv.py
+++ b/tests/qemu-iotests/testenv.py
@@ -25,7 +25,12 @@
 import random
 import subprocess
 import glob
-from typing import List, Dict, Any, Optional, ContextManager
+from typing import List, Dict, Any, Optional
+
+if sys.version_info >= (3, 9):
+    from contextlib import AbstractContextManager as ContextManager
+else:
+    from typing import ContextManager
 
 DEF_GDB_OPTIONS = 'localhost:12345'
 
diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
index 7b322272e92..2e236c8fa39 100644
--- a/tests/qemu-iotests/testrunner.py
+++ b/tests/qemu-iotests/testrunner.py
@@ -27,11 +27,14 @@
 import shutil
 import sys
 from multiprocessing import Pool
-from typing import List, Optional, Any, Sequence, Dict, \
-        ContextManager
-
+from typing import List, Optional, Any, Sequence, Dict
 from testenv import TestEnv
 
+if sys.version_info >= (3, 9):
+    from contextlib import AbstractContextManager as ContextManager
+else:
+    from typing import ContextManager
+
 
 def silent_unlink(path: Path) -> None:
     try:
-- 
2.45.0
