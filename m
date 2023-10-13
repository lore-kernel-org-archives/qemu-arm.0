Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1722679ejc;
        Fri, 13 Oct 2023 12:10:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFI+tr5zZ8otq57VjSqwWalWXlh3W7g7GLUVeXXtLj4ysLa09NABe7pEWxk+lCr0hE3UM8D
X-Received: by 2002:a05:6214:4b0b:b0:65b:220d:72a5 with SMTP id pj11-20020a0562144b0b00b0065b220d72a5mr30699348qvb.51.1697224216753;
        Fri, 13 Oct 2023 12:10:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697224216; cv=none;
        d=google.com; s=arc-20160816;
        b=W01XD/N2lts7vaTKNPTCZ0bbEEwrYzInApcgLlBcKa/GG682e0LVoW3+rs9NTx4wnj
         qeuaynKCV9pKtsGrAYD32DpgbURA2KMQASBr/xtwRZisqmxXBsIzrIAEZIBakM7Blx5M
         dA65sgM6kdNKiFWgAqovktlnyS/nvM5Gli2oQPxCUfJBYhj+I4zSRE96jCTvlHsLi3py
         ZCnlf6D38T2mzpRpAdvk8dhyq/e6rtSXqvVSkDJ6JMFgK5H7lk73p6FaazcubI8p/ZAM
         wcYHGcCTitp5kKq/6knVSqiwKvxnnCvtT/hxmItAKzjS6UNE9i6nJBaehjDieW0LXVVE
         zuyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=fRbQdUoUUQhlqnazahcRbiRmsy6tNXpHFEKPBYJkfGM=;
        fh=D6q9Zl84lh9f35IkUo72nHtoK2p7pHS0kVOpFtZg6qI=;
        b=LHNjA9BrxjHccfp6Uz1YBwEZPPYVIaPn29aHLH/9LprQa4VrVCPYe8/56rIzhR+I4a
         C2tr4TbVcPFpaKwcuW6pmmIM4n5HoO9BXPUfNZtYhjoOKjhP1bq33hG483haP2Mbzp5D
         oW91//J7zYE930YPx4u1yhUti7TI+X7acpXdy2lepflnT1QMetcIzRp4w6GlwSCnxd3j
         ZyVjTmNb3k19hxoYKrr1At26NzFIqCs5NcxtQ/ImFieUueHr6632J1DRNM5HYC+cHZF7
         StlUArkII/sbzgK3QXHt3ZN9BXuM95t+XEs51ScwRIyAD/bhHHJ2cZ3O6lT4fyU/RMtj
         jAtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="FI2nI/Ym";
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id t16-20020a056214155000b0066d32666a24si561990qvw.495.2023.10.13.12.10.16
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 12:10:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="FI2nI/Ym";
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697224216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fRbQdUoUUQhlqnazahcRbiRmsy6tNXpHFEKPBYJkfGM=;
	b=FI2nI/YmhpXORW61O/q2yR5JXgO3zBwtHOijFeQfF5kVC9mKENkuqu+9MoF55TEF5pFKzK
	Jw5a78AJNTpoLkkf07ycKxipcCVra/J1TU/BWOH3+Vre8Bvtwya2AHfJcCc3kWjrCW7mti
	MoqZ1TznTRnMdHBHB1ISjcCwLLqBXV4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-138-rH71-VLmP0inEv2-a89V9w-1; Fri, 13 Oct 2023 15:10:09 -0400
X-MC-Unique: rH71-VLmP0inEv2-a89V9w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F1AB85A5BA;
	Fri, 13 Oct 2023 19:10:08 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.32.124])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D495040C6CA0;
	Fri, 13 Oct 2023 19:10:06 +0000 (UTC)
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
Subject: [PULL 19/25] iotests: refactor some common qmp result checks into generic pattern
Date: Fri, 13 Oct 2023 15:09:34 -0400
Message-ID: <20231013190941.3699288-20-jsnow@redhat.com>
In-Reply-To: <20231013190941.3699288-1-jsnow@redhat.com>
References: <20231013190941.3699288-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-TUID: WOvxsaC51fhV

From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

To simplify further conversion.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-id: 20231006154125.1068348-10-vsementsov@yandex-team.ru
Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/040 | 3 ++-
 tests/qemu-iotests/147 | 3 ++-
 tests/qemu-iotests/155 | 4 ++--
 tests/qemu-iotests/218 | 4 ++--
 tests/qemu-iotests/296 | 3 ++-
 5 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/tests/qemu-iotests/040 b/tests/qemu-iotests/040
index 5601a4873c..e61e7f2433 100755
--- a/tests/qemu-iotests/040
+++ b/tests/qemu-iotests/040
@@ -62,9 +62,10 @@ class ImageCommitTestCase(iotests.QMPTestCase):
         self.assert_no_active_block_jobs()
         if node_names:
             result = self.vm.qmp('block-commit', device='drive0', top_node=top, base_node=base)
+            self.assert_qmp(result, 'return', {})
         else:
             result = self.vm.qmp('block-commit', device='drive0', top=top, base=base)
-        self.assert_qmp(result, 'return', {})
+            self.assert_qmp(result, 'return', {})
         self.wait_for_complete(need_ready)
 
     def run_default_commit_test(self):
diff --git a/tests/qemu-iotests/147 b/tests/qemu-iotests/147
index 47dfa62e6b..770b73e2f4 100755
--- a/tests/qemu-iotests/147
+++ b/tests/qemu-iotests/147
@@ -159,10 +159,11 @@ class BuiltinNBD(NBDBlockdevAddBase):
 
         if export_name is None:
             result = self.server.qmp('nbd-server-add', device='nbd-export')
+            self.assert_qmp(result, 'return', {})
         else:
             result = self.server.qmp('nbd-server-add', device='nbd-export',
                                      name=export_name)
-        self.assert_qmp(result, 'return', {})
+            self.assert_qmp(result, 'return', {})
 
         if export_name2 is not None:
             result = self.server.qmp('nbd-server-add', device='nbd-export',
diff --git a/tests/qemu-iotests/155 b/tests/qemu-iotests/155
index eadda52615..d3e1b7401e 100755
--- a/tests/qemu-iotests/155
+++ b/tests/qemu-iotests/155
@@ -181,6 +181,7 @@ class MirrorBaseClass(BaseClass):
             result = self.vm.qmp(self.cmd, job_id='mirror-job', device='source',
                                  sync=sync, target='target',
                                  auto_finalize=False)
+            self.assert_qmp(result, 'return', {})
         else:
             if self.existing:
                 mode = 'existing'
@@ -190,8 +191,7 @@ class MirrorBaseClass(BaseClass):
                                  sync=sync, target=target_img,
                                  format=iotests.imgfmt, mode=mode,
                                  node_name='target', auto_finalize=False)
-
-        self.assert_qmp(result, 'return', {})
+            self.assert_qmp(result, 'return', {})
 
         self.vm.run_job('mirror-job', auto_finalize=False,
                         pre_finalize=self.openBacking, auto_dismiss=True)
diff --git a/tests/qemu-iotests/218 b/tests/qemu-iotests/218
index 6320c4cb56..5e74c55b6a 100755
--- a/tests/qemu-iotests/218
+++ b/tests/qemu-iotests/218
@@ -61,14 +61,14 @@ def start_mirror(vm, speed=None, buf_size=None):
                          sync='full',
                          speed=speed,
                          buf_size=buf_size)
+        assert ret['return'] == {}
     else:
         ret = vm.qmp('blockdev-mirror',
                          job_id='mirror',
                          device='source',
                          target='target',
                          sync='full')
-
-    assert ret['return'] == {}
+        assert ret['return'] == {}
 
 
 log('')
diff --git a/tests/qemu-iotests/296 b/tests/qemu-iotests/296
index 0d21b740a7..19a674c5ae 100755
--- a/tests/qemu-iotests/296
+++ b/tests/qemu-iotests/296
@@ -133,9 +133,10 @@ class EncryptionSetupTestCase(iotests.QMPTestCase):
 
         if reOpen:
             result = vm.qmp(command, options=[opts])
+            self.assert_qmp(result, 'return', {})
         else:
             result = vm.qmp(command, **opts)
-        self.assert_qmp(result, 'return', {})
+            self.assert_qmp(result, 'return', {})
 
 
     ###########################################################################
-- 
2.41.0
