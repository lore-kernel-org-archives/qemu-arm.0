Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1722619ejc;
        Fri, 13 Oct 2023 12:10:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnqerBEzD+yeCvY+C9b/hB2V+v9Q121G4ZYekNr4DVJfwgKgkjIoh3BPGainYwsR+48P2N
X-Received: by 2002:a05:622a:170e:b0:417:fa23:4f40 with SMTP id h14-20020a05622a170e00b00417fa234f40mr1638343qtk.33.1697224212144;
        Fri, 13 Oct 2023 12:10:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697224212; cv=none;
        d=google.com; s=arc-20160816;
        b=L8aAlMSJdCedeuFygozObD6clKfGMe5CGlRkubYius48PsNUixigLym08xie20FTrU
         kn/K+5IdkbGmTGwzZY87JMn1whFM6prKU0WSaz6J2SbS9XGfmkcRRZWaP8hE+z/B9U6J
         NAsnb7fwgk1Ylj6zHXaxQMCcyMTphCg144sg2SsnXprZQNbdywNeAweRnPYMnyDy/1jU
         Q80FPoUe8E+7p5Brzzm68RSs3KK+lo1XeQoE+PeB4IAyM2MaNdbb5O+d/hwDx46nOH2o
         AKs3hqCHDiJf1lYfp2XS2/IDdkDO9Yv0GjotFiEayteinVjW8u4BdKTA4QiMdQPv71my
         MtSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=k4pDy5yigXAGZndabx5fdFH2aTq3nNUlcYK9vjXYh24=;
        fh=D6q9Zl84lh9f35IkUo72nHtoK2p7pHS0kVOpFtZg6qI=;
        b=m3KGZhYcPB2NEmHXr2H2Y5C8kPNPpIUvScSSRCzEmLaQ0yYBRMYO9UXKRYp5vIGVUo
         aFD0Hv7DEsR7PZmVtc056nTa7KO7DzJhu4JY6LB8mhbbvPj0z8y5HIcFO7sc6p4/dqyA
         e/zK+bcnGbyyOuEVX9z2KYUMnP5/sKTZlgfc+fwORKhEQk4jiNKg1xWpxCZwg9NJHKtq
         1xQr/5DhWX8esQCtG/ObVNqX9JRwDPxvJFHmXktLJ0VjIn/zWZa6vWk6hAhagX9S7rQk
         0I+Imm2Bxa/DX+qLdMBU0S05nuWBaw9HMTx3Ou6ILAO7NM87opWXwH3RPTT39UPY8JHD
         5AWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TMK5pIFj;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id g8-20020ac87f48000000b00418122a226dsi1682503qtk.159.2023.10.13.12.10.11
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 12:10:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TMK5pIFj;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697224211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k4pDy5yigXAGZndabx5fdFH2aTq3nNUlcYK9vjXYh24=;
	b=TMK5pIFjBcx2akQ26jWLST9TZtOOnDzh4cdizF8CKqkM2vZ+UO6FdBSU+tgOc7ahp77mND
	1xDwkyhK1VNAM7K2fIiVediyXP/glYcFnDTkEke5qKJKzx9wismBAQ43M4QUqtV/xOobSp
	x2ONOhJHDSRVXHgcLfGflLlO3Pd6bfU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-686-IL-wlz9zMDyIhucIn2noLQ-1; Fri, 13 Oct 2023 15:10:06 -0400
X-MC-Unique: IL-wlz9zMDyIhucIn2noLQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 88303946DC6;
	Fri, 13 Oct 2023 19:10:05 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.32.124])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5448440C6CA1;
	Fri, 13 Oct 2023 19:10:04 +0000 (UTC)
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
Subject: [PULL 17/25] iotests: QemuStorageDaemon: add cmd() method like in QEMUMachine.
Date: Fri, 13 Oct 2023 15:09:32 -0400
Message-ID: <20231013190941.3699288-18-jsnow@redhat.com>
In-Reply-To: <20231013190941.3699288-1-jsnow@redhat.com>
References: <20231013190941.3699288-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-TUID: wm2p0ZWeYSLc

From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

Add similar method for consistency.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-id: 20231006154125.1068348-8-vsementsov@yandex-team.ru
Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/iotests.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 0c061d8986..ee7b6ddeff 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -38,7 +38,7 @@
 from contextlib import contextmanager
 
 from qemu.machine import qtest
-from qemu.qmp.legacy import QMPMessage, QEMUMonitorProtocol
+from qemu.qmp.legacy import QMPMessage, QMPReturnValue, QEMUMonitorProtocol
 from qemu.utils import VerboseProcessError
 
 # Use this logger for logging messages directly from the iotests module
@@ -466,6 +466,11 @@ def get_qmp(self) -> QEMUMonitorProtocol:
         assert self._qmp is not None
         return self._qmp
 
+    def cmd(self, cmd: str, args: Optional[Dict[str, object]] = None) \
+            -> QMPReturnValue:
+        assert self._qmp is not None
+        return self._qmp.cmd(cmd, **(args or {}))
+
     def stop(self, kill_signal=15):
         self._p.send_signal(kill_signal)
         self._p.wait()
-- 
2.41.0
