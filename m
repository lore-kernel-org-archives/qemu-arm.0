Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1722674ejc;
        Fri, 13 Oct 2023 12:10:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElplPkKAKZHFDPApHrhCRYfgdn//yxaWM8GFHbH3MT/6CknCQnfPuCRf8JAJBDlUHBq2kF
X-Received: by 2002:a05:620a:2547:b0:76f:39:4180 with SMTP id s7-20020a05620a254700b0076f00394180mr31765941qko.15.1697224216540;
        Fri, 13 Oct 2023 12:10:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697224216; cv=none;
        d=google.com; s=arc-20160816;
        b=Tt8e3zTZ1zRfu8aj8szLfgF1SrTaE05cbwyfZ+f40Ez0eu3QKcM0JTCuY/7LxcJ8MB
         RruXfFCS/vEXa3y0BlFX1EOW6ebVhWALAtkEblfMkN/B5kGabDH+IJC6V7fpZpEW8DXx
         dMPOp4AuI/Inu1Rdv8jJ/EI/PKwGmKVb8yqH0bC/LxOY5otuw49XHQsfZFqor6Au83lQ
         BDjsYV2noIii4eEhiTS1w3cwdJ26U8RNaO+zC8w2k9efYSvcrgBvAqCy1+tMBa9I8Ol7
         vgR5llWr4WEIcEiuWxzNvyZa8B51N8F//PQsUKcLD7ldAzCjUZOc3lxfLFaIZ9nLATsM
         rLqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=53951AoCRNqJfPwSZJq6G6UHINEJn70d5VTn2T0IpB0=;
        fh=D6q9Zl84lh9f35IkUo72nHtoK2p7pHS0kVOpFtZg6qI=;
        b=DfU+jzyxX+8p8fm0kTQT7LXAfnexBiWfbWSyCdW9AaKwxGaU6se0bCSjUSJxNVNd46
         /vhKpxuctOXkk9IweqZibzxMBZqoMPnMM9dkkrhstbZCNRIXHn8mh5rlXsqte7ABBbg3
         EQCV7qV6CkTL1IVX1GI7fOn0v2ej5NntAc+sACavLuf6sR20m9Jvll7ZyfDU5/ceHAj8
         QZ4h+a2l/SLU9c3yNC8FMF4inJ9XGS0w+AynzershY4w7Vp9N63ZPjzinsyl6EDs0BP2
         FO3eN68/QtpppDTRYfQwwtFLQR/iuRSASi6Dnt43WODEPkHk1btDSbDMOXt1OtFGKezZ
         /a1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BVWPend0;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id u7-20020a05620a0c4700b00776f2642d26si1779061qki.729.2023.10.13.12.10.16
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 12:10:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BVWPend0;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697224216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=53951AoCRNqJfPwSZJq6G6UHINEJn70d5VTn2T0IpB0=;
	b=BVWPend0P85sCpLyilJwWo8RgQEnmw+25CkX2gpiS/UZtiLWdwGJf0y3FBmQJOABlJU5dD
	UCE2+kYd9bUluwsbo7YYgXoQfnb5xz8C+zBw6X0jzqqKmKq3ywj7z/eeKF66ouEArj4eE8
	wJkAbTNJaAtgnpeTtlHS7bEcwGGFhLQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-6CwphJhfNxugoiuqchw5fA-1; Fri, 13 Oct 2023 15:10:10 -0400
X-MC-Unique: 6CwphJhfNxugoiuqchw5fA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 568571029F40;
	Fri, 13 Oct 2023 19:10:09 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.32.124])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2285F40C6F79;
	Fri, 13 Oct 2023 19:10:08 +0000 (UTC)
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
Subject: [PULL 20/25] iotests: drop some extra semicolons
Date: Fri, 13 Oct 2023 15:09:35 -0400
Message-ID: <20231013190941.3699288-21-jsnow@redhat.com>
In-Reply-To: <20231013190941.3699288-1-jsnow@redhat.com>
References: <20231013190941.3699288-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-TUID: 7rZHij+sHgoa

From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-id: 20231006154125.1068348-11-vsementsov@yandex-team.ru
Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/041 | 2 +-
 tests/qemu-iotests/196 | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/041 b/tests/qemu-iotests/041
index 4d7a829b65..550e4dc391 100755
--- a/tests/qemu-iotests/041
+++ b/tests/qemu-iotests/041
@@ -1086,7 +1086,7 @@ class TestRepairQuorum(iotests.QMPTestCase):
     def test_after_a_quorum_snapshot(self):
         result = self.vm.qmp('blockdev-snapshot-sync', node_name='img1',
                              snapshot_file=quorum_snapshot_file,
-                             snapshot_node_name="snap1");
+                             snapshot_node_name="snap1")
         self.assert_qmp(result, 'return', {})
 
         result = self.vm.qmp('drive-mirror', job_id='job0', device='quorum0',
diff --git a/tests/qemu-iotests/196 b/tests/qemu-iotests/196
index 76509a5ad1..27c1629be3 100755
--- a/tests/qemu-iotests/196
+++ b/tests/qemu-iotests/196
@@ -46,7 +46,7 @@ class TestInvalidateAutoclear(iotests.QMPTestCase):
 
     def test_migration(self):
         result = self.vm_a.qmp('migrate', uri='exec:cat>' + migfile)
-        self.assert_qmp(result, 'return', {});
+        self.assert_qmp(result, 'return', {})
         self.assertNotEqual(self.vm_a.event_wait("STOP"), None)
 
         with open(disk, 'r+b') as f:
-- 
2.41.0
