Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp7134585njc;
        Mon, 11 Nov 2024 22:30:15 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU8NqRaYu45YeXRDyBKewTr4G8vGI6v7vIfK2EvBLKA9UlBWpaMS2SBMZVb65GlIjgDX9928N0lyVvQ0Q==@linaro.org
X-Google-Smtp-Source: AGHT+IE6ZMCn52OwaLPLrLLYIvt6q34iSKrj6WMeGghP6Riirg5jLJ4mvvPr+e7ImxCiK8axx5iV
X-Received: by 2002:a05:620a:4515:b0:7ae:d2d0:190d with SMTP id af79cd13be357-7b331eaff0cmr2173742185a.32.1731393015115;
        Mon, 11 Nov 2024 22:30:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731393015; cv=none;
        d=google.com; s=arc-20240605;
        b=HyyCfEoFaj+itFYHqRA6OhPFUwQqYs2GFQt5TAMJEsWRmKzXviQYB0KxMC/53OGfWV
         q98/i42HTWtzxihWIgaCdS682D//uFBu8XH0+vwgNSfujs4L50YGiJ26u1as57P8uLO/
         YNK5g9OpGbseCGBT2Ek6AzKcWR2tX8lXLioKXvAqdZ2rTzChJYrNJoh4nCqN/WDv8e+O
         5pjNWJxIRVrH4Kn5CK+N+H/zzqn2C5PalVbwRQELL+J9nDHeQXZTOJhMxaahmdfOgzfZ
         Ml5JLIZe3S0oduj3yF6MMonBuNMGY9CNwA10gcc50gj1Rk6cMEoCXj/4gLMBO/Ieujpm
         C29Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=yiEkK0E5ZM57bTAzyHJpe0naiW1rkBr5pbkC8SvKZD0=;
        fh=36XeOeSnsB5LbZUpSpyTPSVUP6DQSW+xMm0rZH0YiK4=;
        b=VmZ4GNaeurV6t7bxbwrS3GkzNokKQWq5CEDyc7GqRDo3ZFx7/Ytv/CoC6w3MLq+/mc
         M2EHkRVM/DnLU5azHqNCPvgLbsIb2cBGsITR6qt/S9TqGw6xrWc4DF1Rg7uclrdRpQ+b
         8qcg4YIrrz2hJFLTfxxYBaihB+obb1Z3JHFZBNPIquei7HAMV/QZBhrlE7uydHZbkURt
         6v2SWPLc0lJfYFiHnEXlvrDMLE6wtlG1pDeOxiZlRauGAWHziZ4pIKRV4i04NlHxxbfL
         d4zgXxTkr7jwMT7Z0P9TNim7RzFVhwM2BERFKSFnXkf3K5R/2C76HwOkEvbZG70KEB7N
         WuTg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZqAcCpsi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b32ad0d2f7si1314646385a.541.2024.11.11.22.30.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Nov 2024 22:30:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZqAcCpsi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tAkOI-0005wU-CK; Tue, 12 Nov 2024 01:28:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tAkOH-0005vz-Ck
 for qemu-arm@nongnu.org; Tue, 12 Nov 2024 01:28:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tAkOB-0001z8-Fs
 for qemu-arm@nongnu.org; Tue, 12 Nov 2024 01:28:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731392910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yiEkK0E5ZM57bTAzyHJpe0naiW1rkBr5pbkC8SvKZD0=;
 b=ZqAcCpsiXmO5WpPrQMT0XpISM9Oj91WWfJZS0DMXby4O51FxHwLfK+r6Ei0hBXns6e6Avx
 V/QsPijFu5MXwBEqTiZAIyCLY+NImNxzYs8zNv5GaD43ix1DfHjJlOdS3cSwXTaSd/cHVn
 wOsr2il12DIe+/qTgvXmMManr+EUDIE=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-492-v930_hrZMlunki56qgH77A-1; Tue,
 12 Nov 2024 01:28:26 -0500
X-MC-Unique: v930_hrZMlunki56qgH77A-1
X-Mimecast-MFC-AGG-ID: v930_hrZMlunki56qgH77A
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 9282A19540F0; Tue, 12 Nov 2024 06:28:23 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.193.48])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 54165195E480; Tue, 12 Nov 2024 06:28:19 +0000 (UTC)
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
Subject: [PATCH v1 1/4] tests/functional: Introduce _console_read()
Date: Tue, 12 Nov 2024 07:28:03 +0100
Message-ID: <20241112062806.838717-2-clg@redhat.com>
In-Reply-To: <20241112062806.838717-1-clg@redhat.com>
References: <20241112062806.838717-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.122,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: UxXASLLy+mLu

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
 tests/functional/qemu_test/cmd.py | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/tests/functional/qemu_test/cmd.py b/tests/functional/qemu_test/cmd.py
index cbabb1ceed3c..bb39857e6cae 100644
--- a/tests/functional/qemu_test/cmd.py
+++ b/tests/functional/qemu_test/cmd.py
@@ -12,6 +12,7 @@
 # later.  See the COPYING file in the top-level directory.
 
 import logging
+import re
 import os
 import os.path
 import subprocess
@@ -78,6 +79,20 @@ def run_cmd(args):
 def is_readable_executable_file(path):
     return os.path.isfile(path) and os.access(path, os.R_OK | os.X_OK)
 
+def _console_read(vm, expect, expectalt = None):
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
+            output = lines.pop()
+    return output
+
 def _console_interaction(test, success_message, failure_message,
                          send_string, keep_sending=False, vm=None):
     assert not keep_sending or send_string
@@ -98,7 +113,7 @@ def _console_interaction(test, success_message, failure_message,
             continue
 
         try:
-            msg = console.readline().decode().strip()
+            msg = _console_read(vm, success_message)
         except UnicodeDecodeError:
             msg = None
         if not msg:
-- 
2.47.0

