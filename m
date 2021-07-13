Received: by 2002:a0c:fe44:0:0:0:0:0 with SMTP id u4csp1027533qvs;
        Tue, 13 Jul 2021 14:21:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyOKJA/ZqJt72kXGs0awTFI6Vd72hvZAOiSnWvmA7zW1MySlBDduzETWx4EYOEjYSyvPsDr
X-Received: by 2002:a17:906:109d:: with SMTP id u29mr286166eju.489.1626211296858;
        Tue, 13 Jul 2021 14:21:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626211296; cv=none;
        d=google.com; s=arc-20160816;
        b=sBJ+DmPlq28FqhdxsXM8sit10YSAt15YiwqkHK57SzFtPDbDdVZlqqBF0oMNhCa+S+
         ECDzoaSvys73lZCU/K1thDcKNXtpeNngPuv9RaMt77lcHC66lVN1P76GWDTuueJ0fw/i
         eOwE1UuJcy6kl7tO5ykinYR/QVf5BSXbxpEEvLs/1QdMnx9gK4j7N5qVdtF8XGXIKVsl
         cWJkcrk18VZfItaQB43RNswrxtQoOsVvOeYM2UeNLkJyWw6kvgKfJqw6gV5DDsClY4dH
         antiKmr2VBW5aMhKRhsaRl5a16CI+ZgxzxVRiBwTjsrR34V5LtIIJJjDo69wUTIUwf40
         9dGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=UhXgC4zJbg4b1kov60jazcjIPEWd3z4BiZLh6vYghKM=;
        b=WoATS0kQr7pcx2k2shB5F3iKlrJLUVFyN8qlvEYUtootIQmRIUdYwCBv5Yoxfdfqa/
         8N85Eh/1h/j9UtRTKkg8K3KEe9FgrYICneg7EHfDMxcTCSWb0NybdjcOKlQx9/1ytESt
         ttQHbXlLYfiYUnPYh7DRcBr4cA2aLWHfPnU67PDz4bhVRmBoqKCgr4p/1c942qxxdZ6T
         v4AWyVyVUxWtFaBHW52zE4Vt38/CcB9eZAPqPUDOxeayMFNg5wL4hDoN4XNVp19J9VJ8
         oa4KtLkzw6+FmPN0xc65gVJjtRkaEDDxs5M1HwaJhoCnASw16KU2htpNwIbg2oGf359K
         g0QQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Yn8a9cp5;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id ds7si27250416ejc.304.2021.07.13.14.21.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Jul 2021 14:21:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Yn8a9cp5;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626211295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UhXgC4zJbg4b1kov60jazcjIPEWd3z4BiZLh6vYghKM=;
	b=Yn8a9cp5vwJ1GfkVz7GKrWtZ24g/EgO2uZneEuQ28y8eUAgVT8vlrTTtmB/BBsMigvk68U
	YHkIhnGx3bE0B/KUKiKH/NL5uaawLNDbljfs/8HuXo2J63PzzNWQmJbdkpOVn2OZYmy7/w
	7Yzt/N62pWZvWlGilDtvKBLd5XyE7mQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-1_lTN5I8N8WcwGseGd1A_A-1; Tue, 13 Jul 2021 17:21:34 -0400
X-MC-Unique: 1_lTN5I8N8WcwGseGd1A_A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08C5418414A0;
	Tue, 13 Jul 2021 21:21:32 +0000 (UTC)
Received: from p50.localhost.net (ovpn-117-22.rdu2.redhat.com [10.10.117.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0EBF019C44;
	Tue, 13 Jul 2021 21:21:18 +0000 (UTC)
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
Subject: [PULL 13/23] tests/acceptance: Automatic set -cpu to the test vm
Date: Tue, 13 Jul 2021 17:19:13 -0400
Message-Id: <20210713211923.3809241-14-crosa@redhat.com>
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
X-TUID: tviAGVBxs74A

From: Wainer dos Santos Moschetta <wainersm@redhat.com>

This introduces a new feature to the functional tests: automatic setting of
the '-cpu VALUE' option to the created vm if the test is tagged with
'cpu:VALUE'. The 'cpu' property is made available to the test object as well.

For example, for a simple test as:

    def test(self):
        """
        :avocado: tags=cpu:host
        """
        self.assertEqual(self.cpu, "host")
        self.vm.launch()

The resulting QEMU evocation will be like:

    qemu-system-x86_64 -display none -vga none \
        -chardev socket,id=mon,path=/var/tmp/avo_qemu_sock_pdgzbgd_/qemu-1135557-monitor.sock \
        -mon chardev=mon,mode=control -cpu host

Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20210430133414.39905-2-wainersm@redhat.com>
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 docs/devel/testing.rst                    | 17 +++++++++++++++++
 tests/acceptance/avocado_qemu/__init__.py |  5 +++++
 2 files changed, 22 insertions(+)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 19cbf532ae..8f572255d3 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -904,6 +904,17 @@ name.  If one is not given explicitly, it will either be set to
 ``None``, or, if the test is tagged with one (and only one)
 ``:avocado: tags=arch:VALUE`` tag, it will be set to ``VALUE``.
 
+cpu
+~~~
+
+The cpu model that will be set to all QEMUMachine instances created
+by the test.
+
+The ``cpu`` attribute will be set to the test parameter of the same
+name. If one is not given explicitly, it will either be set to
+``None ``, or, if the test is tagged with one (and only one)
+``:avocado: tags=cpu:VALUE`` tag, it will be set to ``VALUE``.
+
 machine
 ~~~~~~~
 
@@ -983,6 +994,12 @@ architecture of a kernel or disk image to boot a VM with.
 This parameter has a direct relation with the ``arch`` attribute.  If
 not given, it will default to None.
 
+cpu
+~~~
+
+The cpu model that will be set to all QEMUMachine instances created
+by the test.
+
 machine
 ~~~~~~~
 
diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index 1de1edce0d..3a218057b3 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -213,6 +213,9 @@ def setUp(self):
         self.arch = self.params.get('arch',
                                     default=self._get_unique_tag_val('arch'))
 
+        self.cpu = self.params.get('cpu',
+                                   default=self._get_unique_tag_val('cpu'))
+
         self.machine = self.params.get('machine',
                                        default=self._get_unique_tag_val('machine'))
 
@@ -242,6 +245,8 @@ def get_vm(self, *args, name=None):
             name = str(uuid.uuid4())
         if self._vms.get(name) is None:
             self._vms[name] = self._new_vm(name, *args)
+            if self.cpu is not None:
+                self._vms[name].add_args('-cpu', self.cpu)
             if self.machine is not None:
                 self._vms[name].set_machine(self.machine)
         return self._vms[name]
-- 
2.31.1
