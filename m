Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1722624ejc;
        Fri, 13 Oct 2023 12:10:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkPKKN6Qm1RDw701V6LMQO4AHxDZFpRjyc14D+3efJFhdvqCuTXBenIzKQKZg4y0vqVxkk
X-Received: by 2002:a1f:e3c4:0:b0:49a:b0be:3a00 with SMTP id a187-20020a1fe3c4000000b0049ab0be3a00mr22503965vkh.8.1697224212368;
        Fri, 13 Oct 2023 12:10:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697224212; cv=none;
        d=google.com; s=arc-20160816;
        b=0nxMFn22MiRNPXiHop4mZ/xmacVsO3y1eCJX7e+08pym1JebRkmF8eDYd3eKifri3T
         Xm+5T3/kC91WgjnRKIPDZWhmB2xANenGFaFVRHJTd488WSQIwlLv3G0XzchFKGSzOZ5D
         qh/WDD0WVpFnsP6MHt179PGFZ7QRN/YErb72yLUfmNdxDxEKCKASLkOfQ8HIf8zKvV+J
         D/b5cugUOdVD2kZ+Se6ODI5q6S4feizVh6FGVXfEQylszjT8WqB+s+4OuIntVYfrIeZe
         WDu7BhuCABf/9kVZjZVSwkyO1GkR0g5MzwMxIyq8pY1qd9T0Xkk4d3RC6JPgvNPd1gLP
         FTOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=TtNimDUsefImovHXVp8syBkyrwupdL7YbGpeWdTSkQQ=;
        fh=D6q9Zl84lh9f35IkUo72nHtoK2p7pHS0kVOpFtZg6qI=;
        b=Lt1VVcp5rHA0hPfs4BGFmBBcYu6Ug7LR6Luuhbp22b5MQqYw4jpETrfAAQLt8e9HA4
         5cM3d3cV++/yS2ZdCTWy+873pZ+kyRDcq8k0hbQJYUNrvbz/seA1n8a6IvCnpz/CzPhF
         K7G6rsq2wXOiwOFRctqUbpxdY2zmwBVGrRKBmjCnwhN5/e7J79xfJJvURoKg5I0yOel3
         vwWDp4y7+/xSBcqjXDSkYjcg6dMr60JWESaMYSpmLmBbTFQ+QZNvjIHRg+Yn7HaAYTPf
         TOlPahyyrwgbMw2IlDqwZfz7ncWuUA0Nbhd6s2BMwlaI4/scZSNvP92fq/aYY/wtpkHb
         HzYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fBZZATxy;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id ff22-20020a05622a4d9600b004181c4dcb6csi1579903qtb.184.2023.10.13.12.10.12
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 12:10:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fBZZATxy;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697224212;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TtNimDUsefImovHXVp8syBkyrwupdL7YbGpeWdTSkQQ=;
	b=fBZZATxyz1H6dqSjMFMreA9wohS0BhTwjYxCMDJ/sWtYfRsKJEzv98PW6cyi+fw4B5d/e1
	eUsjJRXXJK8M2A8VVkg7b94lxvNCsh5iG96whiiR+DzZc59jMPRWgTxKZ7s2XAxHxxvHK8
	bZGf7ICk8gLM2ujE427lqZvWjSIxiB8=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-18-agokJHyGOXWSNSIbC45TNw-1; Fri, 13 Oct 2023 15:10:07 -0400
X-MC-Unique: agokJHyGOXWSNSIbC45TNw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C69063813BE3;
	Fri, 13 Oct 2023 19:10:06 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.32.124])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 955AF40C6CA0;
	Fri, 13 Oct 2023 19:10:05 +0000 (UTC)
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
Subject: [PULL 18/25] iotests: add some missed checks of qmp result
Date: Fri, 13 Oct 2023 15:09:33 -0400
Message-ID: <20231013190941.3699288-19-jsnow@redhat.com>
In-Reply-To: <20231013190941.3699288-1-jsnow@redhat.com>
References: <20231013190941.3699288-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-TUID: tmA3I0vWKIdQ

From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-id: 20231006154125.1068348-9-vsementsov@yandex-team.ru
Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/041                        | 1 +
 tests/qemu-iotests/151                        | 1 +
 tests/qemu-iotests/152                        | 2 ++
 tests/qemu-iotests/tests/migrate-bitmaps-test | 2 ++
 4 files changed, 6 insertions(+)

diff --git a/tests/qemu-iotests/041 b/tests/qemu-iotests/041
index 8429958bf0..4d7a829b65 100755
--- a/tests/qemu-iotests/041
+++ b/tests/qemu-iotests/041
@@ -1087,6 +1087,7 @@ class TestRepairQuorum(iotests.QMPTestCase):
         result = self.vm.qmp('blockdev-snapshot-sync', node_name='img1',
                              snapshot_file=quorum_snapshot_file,
                              snapshot_node_name="snap1");
+        self.assert_qmp(result, 'return', {})
 
         result = self.vm.qmp('drive-mirror', job_id='job0', device='quorum0',
                              sync='full', node_name='repair0', replaces="img1",
diff --git a/tests/qemu-iotests/151 b/tests/qemu-iotests/151
index b4d1bc2553..668d0c1e9c 100755
--- a/tests/qemu-iotests/151
+++ b/tests/qemu-iotests/151
@@ -159,6 +159,7 @@ class TestActiveMirror(iotests.QMPTestCase):
                              sync='full',
                              copy_mode='write-blocking',
                              speed=1)
+        self.assert_qmp(result, 'return', {})
 
         self.vm.hmp_qemu_io('source', 'break write_aio A')
         self.vm.hmp_qemu_io('source', 'aio_write 0 1M')  # 1
diff --git a/tests/qemu-iotests/152 b/tests/qemu-iotests/152
index 4e179c340f..b73a0d08a2 100755
--- a/tests/qemu-iotests/152
+++ b/tests/qemu-iotests/152
@@ -43,6 +43,7 @@ class TestUnaligned(iotests.QMPTestCase):
     def test_unaligned(self):
         result = self.vm.qmp('drive-mirror', device='drive0', sync='full',
                              granularity=65536, target=target_img)
+        self.assert_qmp(result, 'return', {})
         self.complete_and_wait()
         self.vm.shutdown()
         self.assertEqual(iotests.image_size(test_img), iotests.image_size(target_img),
@@ -51,6 +52,7 @@ class TestUnaligned(iotests.QMPTestCase):
     def test_unaligned_with_update(self):
         result = self.vm.qmp('drive-mirror', device='drive0', sync='full',
                              granularity=65536, target=target_img)
+        self.assert_qmp(result, 'return', {})
         self.wait_ready()
         self.vm.hmp_qemu_io('drive0', 'write 0 512')
         self.complete_and_wait(wait_ready=False)
diff --git a/tests/qemu-iotests/tests/migrate-bitmaps-test b/tests/qemu-iotests/tests/migrate-bitmaps-test
index 59f3357580..8668caae1e 100755
--- a/tests/qemu-iotests/tests/migrate-bitmaps-test
+++ b/tests/qemu-iotests/tests/migrate-bitmaps-test
@@ -101,6 +101,7 @@ class TestDirtyBitmapMigration(iotests.QMPTestCase):
         sha256 = get_bitmap_hash(self.vm_a)
 
         result = self.vm_a.qmp('migrate', uri=mig_cmd)
+        self.assert_qmp(result, 'return', {})
         while True:
             event = self.vm_a.event_wait('MIGRATION')
             if event['data']['status'] == 'completed':
@@ -176,6 +177,7 @@ class TestDirtyBitmapMigration(iotests.QMPTestCase):
         self.assert_qmp(result, 'return', {})
 
         result = self.vm_a.qmp('migrate', uri=mig_cmd)
+        self.assert_qmp(result, 'return', {})
         while True:
             event = self.vm_a.event_wait('MIGRATION')
             if event['data']['status'] == 'completed':
-- 
2.41.0
