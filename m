Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp7311870njc;
        Tue, 12 Nov 2024 05:04:53 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX0MPNhTSNhudxAjgvEu17+y/0U5Wqa1fp0UXbSJyE49oZG7w08KjyHv7Ht/1szy/PbYUnHmTZjkU1rhA==@linaro.org
X-Google-Smtp-Source: AGHT+IGVaCmZHl1g7eAAbUT2Cw72BVIJ3aWsdMsz+6QZZduQh6HmEY7RsC6SwAm2EPuH6pLlCKpV
X-Received: by 2002:a05:620a:4543:b0:79d:536f:7b3a with SMTP id af79cd13be357-7b331f1978emr2126552585a.56.1731416692961;
        Tue, 12 Nov 2024 05:04:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731416692; cv=none;
        d=google.com; s=arc-20240605;
        b=OMPZwWVNteR5n6Qs6Kitc0+hiqhb7O+E3BPjIaXabEoqCqxa8Qct9HDSxBRoRrzUua
         EOrqUBG5mNUmghzwwatkCLfFQjAZkYaighAX5CF5FGDMFC2UN+0zKBuy3IDbHerFzrOH
         w3BiktymfQsSlODweUsJD0FV0AC7uZigXgapSoVF63F3dURv5w5sUcENS0RoolIyJg6i
         EzHaqS2TOprLxKbi76Zjcp3Pr0OqDHCH/uBJ4WG5TmDUMvhdipTXnp1AqRExlH0TFIsb
         vS0DX31Knispr9YAHXbJkj++TVvOafq1B772vVR4Jp6td/VXru2liuGrC8sYnJVrKmod
         iCvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=7r9JlPFy+XMoABJs96fi5S295SlSc5Rou8kBzhpJxAw=;
        fh=36XeOeSnsB5LbZUpSpyTPSVUP6DQSW+xMm0rZH0YiK4=;
        b=URVe9Yv3dnKXeGrQCGdb4kYYoWsJpUzv4pehaV1CsqDeW5cR835Pf6oVtsElPSNKPP
         AgIwgjKJHhu9PRR60FQ0DTEKuVenUolcTUG9xXqC+wx8JIkctbToCm/PupJSplz+A+r2
         BG8YCakdRG4H9rxHS2AR9KEcIiVGTl0VT5is044fW9P4h/Q9/mtc2yxyiQ/0DxTq9rcg
         s5dHusknAhcUZXjbZA6k7bU0xZMNLAHYJuKCP5N+59I3PbIN+322W72yJadUWwdBL+lV
         yio6HLBN9ZFEb7WwTaJtvj1HW3s8u0cFNwKQqeRDBbZEo0CvbiiaGQ08KZY95fL70hYM
         z5Ng==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KrOQoqv4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b32ad0474esi1327841785a.502.2024.11.12.05.04.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Nov 2024 05:04:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KrOQoqv4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tAqY0-0005a5-2D; Tue, 12 Nov 2024 08:03:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tAqXy-0005ZZ-3x
 for qemu-arm@nongnu.org; Tue, 12 Nov 2024 08:03:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tAqXw-0003db-CC
 for qemu-arm@nongnu.org; Tue, 12 Nov 2024 08:03:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731416583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7r9JlPFy+XMoABJs96fi5S295SlSc5Rou8kBzhpJxAw=;
 b=KrOQoqv4ZRVoKsAbdmT8uzQQXJ93Yup9tRB19p8f0w1HD9Sxk7l4o4PhnrrzWv7MjoUvfF
 OgcvyCUB7QqGpt4qMbRUYLB+1oULc3QwygJInzeCI08dhfK+jPar9ngEYa/7MZHcaxk+DD
 BM5ycQCETIKPNo49IYh3c1xRJrujc0s=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-115-yaIZ3q02MqKbzmLK-1qh4Q-1; Tue,
 12 Nov 2024 08:02:59 -0500
X-MC-Unique: yaIZ3q02MqKbzmLK-1qh4Q-1
X-Mimecast-MFC-AGG-ID: yaIZ3q02MqKbzmLK-1qh4Q
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 97FF91955D44; Tue, 12 Nov 2024 13:02:57 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.193.48])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 906FF1956054; Tue, 12 Nov 2024 13:02:54 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v2 1/4] tests/functional: Introduce _console_read()
Date: Tue, 12 Nov 2024 14:02:43 +0100
Message-ID: <20241112130246.970281-2-clg@redhat.com>
In-Reply-To: <20241112130246.970281-1-clg@redhat.com>
References: <20241112130246.970281-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.122,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.671,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 1IU5moJQ9BWL

Interaction with the console has been a problem in our avocado
tests. In some cases, the expected string does not match in the
output, causing the test to fail with a timeout. These were worked
around by sleeping before reading the console and even with SSH
connections in some places.

To fix, process the console output char by char and not with
readline. This routine was largely inspired by console_wait() in
tests/vm/basevm.py.

Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 tests/functional/qemu_test/cmd.py | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/tests/functional/qemu_test/cmd.py b/tests/functional/qemu_test/cmd.py
index cbabb1ceed3c..5bca29d1d721 100644
--- a/tests/functional/qemu_test/cmd.py
+++ b/tests/functional/qemu_test/cmd.py
@@ -12,6 +12,7 @@
 # later.  See the COPYING file in the top-level directory.
 
 import logging
+import re
 import os
 import os.path
 import subprocess
@@ -78,6 +79,23 @@ def run_cmd(args):
 def is_readable_executable_file(path):
     return os.path.isfile(path) and os.access(path, os.R_OK | os.X_OK)
 
+def _console_read(vm, expect):
+    console_logger = logging.getLogger('console')
+    output = ""
+    while True:
+        data = vm.console_socket.recv(1)
+        if not data:
+            break
+        output += data.decode("latin1")
+        if expect in output:
+            break
+        if "\r" in output or "\n" in output:
+            lines = re.split("[\r\n]", output)
+            if lines[0]:
+                console_logger.debug(lines[0])
+            output = lines.pop()
+    return output
+
 def _console_interaction(test, success_message, failure_message,
                          send_string, keep_sending=False, vm=None):
     assert not keep_sending or send_string
@@ -98,12 +116,12 @@ def _console_interaction(test, success_message, failure_message,
             continue
 
         try:
-            msg = console.readline().decode().strip()
+            msg = _console_read(vm, success_message)
         except UnicodeDecodeError:
             msg = None
         if not msg:
             continue
-        console_logger.debug(msg)
+        console_logger.debug('found "%s"', msg)
         if success_message is None or success_message in msg:
             break
         if failure_message and failure_message in msg:
-- 
2.47.0

