Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1722595ejc;
        Fri, 13 Oct 2023 12:10:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGajuddCAjWr5enUtkwtFLSsHh/koXEm2MxWbPEKlBD5m61odU8EuMTCN5VIQgwMHiumJc1
X-Received: by 2002:a05:620a:4086:b0:76d:95d0:c80a with SMTP id f6-20020a05620a408600b0076d95d0c80amr32172549qko.3.1697224210322;
        Fri, 13 Oct 2023 12:10:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697224210; cv=none;
        d=google.com; s=arc-20160816;
        b=r370NwYH055qFc0Y4q6bsiGZUesxwQVC6gY///cy1rm5E8nJ/VJve1HLOLvB91KwNs
         qIsmvcW2ojlfvHTr4AiPD4ogAfvEpfJYT3oFDd58jFcFb9B18QA0YFONlLHX0CmPl68b
         K+TGgiOCWIyz9G2/NYm0cFj4XRcHiFV337UZinXFhhtYxpvNpDiq50W7XuB+JL1S9ARc
         R70ZDHbRzxRwI39WVfSKKXWr0eEwCqlx96yQ/LkxJnn2Z2iOIV0H30+YTYb0LBMXPC3Q
         NVmTv4a+tjBUwJtrs/1n3bZBui+vmQLUmAHVx5T5BSyGqEv9AKXh1OoyUcpheZ7kGsEQ
         zhCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=fMibcf1WJOst7WqdTUuAwHMJI3PCzA21uGEzA6VguR4=;
        fh=D6q9Zl84lh9f35IkUo72nHtoK2p7pHS0kVOpFtZg6qI=;
        b=IfQW2vX8Wde+gC1bkEEpEG0IU5N7q7Ok3A5G6JxuJ7MBAwINyBQdV2DrfgEOHZ+KRy
         jVwwikTYmF/qYbpWMD+gd7+qSf157OJii4vuMOdutimOdzDJ4ZjG6N1enpS/hMR0JP3o
         xHSZHjSoUkGFazwz0UJg4r/XqO0FqMVi1imF521rrKseXATyrP7NTAAQ59uW3eVlo1He
         AZJgOwtBBe4afealcp7rrnVraZhvSy0AWz0VMD+RKY6nybZMybueDC9nRGVHmqYVQWl5
         9PojCIuWplsWU8SMICUzy04lmMRufO/l7bNdRnArKc80+bwForGI5Wp1dM6wmly7i/VP
         F4nw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Sze5SwIJ;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id bs11-20020a05620a470b00b0077055f2ec4dsi1763227qkb.250.2023.10.13.12.10.10
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 12:10:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Sze5SwIJ;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697224209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fMibcf1WJOst7WqdTUuAwHMJI3PCzA21uGEzA6VguR4=;
	b=Sze5SwIJ8PDxDHz5NP1umYmA0MF6enh9wqOiqOwZ/TcX5yH5stBSkaFKMxS+WTfQBf1CrT
	WjqghGjTuW9n1RooSXi0oFKvr15U0NXTKsL/Pmim+At3r83DtTJTbkJO0hT1aZof5duw5L
	bfaUXKqtL8w6JjeEUPUBuXlbngHLX8k=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-634-HmZhD6_JNOCSufd1RPs1Tg-1; Fri, 13 Oct 2023 15:10:01 -0400
X-MC-Unique: HmZhD6_JNOCSufd1RPs1Tg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5161329A9D2A;
	Fri, 13 Oct 2023 19:10:00 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.32.124])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 14A1D40C6CA0;
	Fri, 13 Oct 2023 19:09:59 +0000 (UTC)
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
Subject: [PULL 13/25] scripts/cpu-x86-uarch-abi.py: use .command() instead of .cmd()
Date: Fri, 13 Oct 2023 15:09:28 -0400
Message-ID: <20231013190941.3699288-14-jsnow@redhat.com>
In-Reply-To: <20231013190941.3699288-1-jsnow@redhat.com>
References: <20231013190941.3699288-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-TUID: 2jS/WicoERwN

From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

Here we don't expect a failure. In case of failure we'll crash on
trying to access ['return']. Better is to use .command() that clearly
raises on failure.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-id: 20231006154125.1068348-4-vsementsov@yandex-team.ru
Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/cpu-x86-uarch-abi.py | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/cpu-x86-uarch-abi.py b/scripts/cpu-x86-uarch-abi.py
index 82ff07582f..893afd1b35 100644
--- a/scripts/cpu-x86-uarch-abi.py
+++ b/scripts/cpu-x86-uarch-abi.py
@@ -69,7 +69,7 @@
 shell = QEMUMonitorProtocol(sock)
 shell.connect()
 
-models = shell.cmd("query-cpu-definitions")
+models = shell.command("query-cpu-definitions")
 
 # These QMP props don't correspond to CPUID fatures
 # so ignore them
@@ -85,7 +85,7 @@
 
 names = []
 
-for model in models["return"]:
+for model in models:
     if "alias-of" in model:
         continue
     names.append(model["name"])
@@ -93,12 +93,12 @@
 models = {}
 
 for name in sorted(names):
-    cpu = shell.cmd("query-cpu-model-expansion",
-                     { "type": "static",
-                       "model": { "name": name }})
+    cpu = shell.command("query-cpu-model-expansion",
+                        { "type": "static",
+                          "model": { "name": name }})
 
     got = {}
-    for (feature, present) in cpu["return"]["model"]["props"].items():
+    for (feature, present) in cpu["model"]["props"].items():
         if present and feature not in skip:
             got[feature] = True
 
-- 
2.41.0
