Received: by 2002:a0c:fe44:0:0:0:0:0 with SMTP id u4csp1027786qvs;
        Tue, 13 Jul 2021 14:22:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxnNY4JuxSon1XNH9uLnUkckZ5drDzR8AXJV48+d9yThWLtOa9jkmw2niklQ9yq0LmQdgUK
X-Received: by 2002:a05:6402:406:: with SMTP id q6mr8369876edv.149.1626211321513;
        Tue, 13 Jul 2021 14:22:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626211321; cv=none;
        d=google.com; s=arc-20160816;
        b=sZwie81Sm+5nSd+RwHsJB3ZziVcZ02daHVXSHzSK3oU0oYV6+8LqoVIfTggTD1ktvk
         C1qioXNgOzrkbUTjClmXqRV9FXNxLn3hC9VkOH08VI8oYGjR2/xYDgNmy4nBjRDj8fEw
         ZHLW5Rbovph/fCH7PxKOFdmjvMYIhbAozxcDinuUGPhMn6JZYparOsgcNLYq1uqteps4
         3rq9VHxFeEvtJYmx9jsi4OWLDG7bAL5hGcbaszFdlQ7qRMJafw/zrfzAJ8L9LReWlcpu
         QjUBxk2dM/BpYn++OlyCRxc4SyDuCupyY91uho4PTQr6C7PhgIWvJ6Nxz3ZvqI8fbFYz
         TiRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=EL0S1BsutMs8Xb80zGucKtSMGZAlWUUZ9gPC25goyNY=;
        b=n7HX9xGKSwtp82RmoahvI4VcOK/J7bis7nsx1iTZMTXGUFtqBy57wXMCzq+KY+QXm9
         1pss78PtLc7aICjV0nIuAcIVUWh7cLNrCaS4AeCLhFstirzYWxY/4cvBGly/Ipl0arQ/
         wO+SwnKN4dvuAQqOlDx7oWviknIcRzXG9IdLJh5fn3NuMguegl98ZQ2rwiUhSL2lt6Ms
         ZHNrqhqAhZmqYBs/moVF6vpA/i7m612QAkyp8SVs5dQ1Ru+cod6Cd+HbXXB55gao0bPx
         bsbj6H/JTk/SuUIhQfAlQAp6OoEhXVBxMVXKzarHzQ8qxWt2cIFsdC7MsKwv3TS/9aTO
         +rVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CSBgz1cu;
       spf=pass (google.com: domain of crosa@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id s20si8565957edr.223.2021.07.13.14.22.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Jul 2021 14:22:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CSBgz1cu;
       spf=pass (google.com: domain of crosa@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626211320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EL0S1BsutMs8Xb80zGucKtSMGZAlWUUZ9gPC25goyNY=;
	b=CSBgz1cuvXIsFrpRW6FwqKYPNt7ZFn68xvt2dICpycugAHvg9PyAaEPyqAnq0qgSTyognR
	Z7XPp6v8LqopihXVsThJ/xiPxzOda8f4UdqLZ5FdhgiXcIgYLRuS6JbHm8C7Q8tpKhv5Sp
	smZNi6HhX37wBU6Bko6HJSoTRjLlwA0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-aeqxeJ0BO8e2eOMEhP_WMA-1; Tue, 13 Jul 2021 17:21:58 -0400
X-MC-Unique: aeqxeJ0BO8e2eOMEhP_WMA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D663B100B3AD;
	Tue, 13 Jul 2021 21:21:55 +0000 (UTC)
Received: from p50.localhost.net (ovpn-117-22.rdu2.redhat.com [10.10.117.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FC4A19C44;
	Tue, 13 Jul 2021 21:21:53 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Ryo ONODERA <ryoon@netbsd.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Willian Rampazzo <willianr@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	John Snow <jsnow@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Willian Rampazzo <wrampazz@redhat.com>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Beraldo Leal <bleal@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	qemu-arm@nongnu.org,
	Eric Auger <eric.auger@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-ppc@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>,
	Thomas Huth <thuth@redhat.com>,
	Kamil Rytarowski <kamil@netbsd.org>,
	Cleber Rosa <crosa@redhat.com>
Subject: [PULL 18/23] tests/acceptance: Add set_vm_arg() to the Test class
Date: Tue, 13 Jul 2021 17:19:18 -0400
Message-Id: <20210713211923.3809241-19-crosa@redhat.com>
In-Reply-To: <20210713211923.3809241-1-crosa@redhat.com>
References: <20210713211923.3809241-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
X-TUID: k8grIED2AfS4

From: Wainer dos Santos Moschetta <wainersm@redhat.com>

The set_vm_arg method is added to avocado_qemu.Test class on this
change. Use that method to set (or replace) an argument to the list of
arguments given to the QEMU binary.

Suggested-by: Cleber Rosa <crosa@redhat.com>
Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20210430133414.39905-7-wainersm@redhat.com>
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/avocado_qemu/__init__.py | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index 3a218057b3..2c4fef3e14 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -251,6 +251,27 @@ def get_vm(self, *args, name=None):
                 self._vms[name].set_machine(self.machine)
         return self._vms[name]
 
+    def set_vm_arg(self, arg, value):
+        """
+        Set an argument to list of extra arguments to be given to the QEMU
+        binary. If the argument already exists then its value is replaced.
+
+        :param arg: the QEMU argument, such as "-cpu" in "-cpu host"
+        :type arg: str
+        :param value: the argument value, such as "host" in "-cpu host"
+        :type value: str
+        """
+        if not arg or not value:
+            return
+        if arg not in self.vm.args:
+            self.vm.args.extend([arg, value])
+        else:
+            idx = self.vm.args.index(arg) + 1
+            if idx < len(self.vm.args):
+                self.vm.args[idx] = value
+            else:
+                self.vm.args.append(value)
+
     def tearDown(self):
         for vm in self._vms.values():
             vm.shutdown()
-- 
2.31.1
