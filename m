Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3377743ejx;
        Mon, 5 Dec 2022 01:52:53 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5fwX54EBzsBrFo7hCwIVL0eHLApqvO7bNNOVzv1WsvXPGgXJsDsCqjyOKldjDIEAW6Bvrt
X-Received: by 2002:a17:906:fa11:b0:7c0:d94c:f9f with SMTP id lo17-20020a170906fa1100b007c0d94c0f9fmr6816069ejb.542.1670233973462;
        Mon, 05 Dec 2022 01:52:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670233973; cv=none;
        d=google.com; s=arc-20160816;
        b=F8wdQ188tRMtquaPcl4C1nC6kh31PnMqGxs+zhivr2V1IzrYBJv9f8609MXi54V2i6
         D+6b3yaeTjU4JVQf1GT2+hZlutNmcBrGnQ+t4nMCJpXoZa0wOYmDenZ2w3MIyNvUS3Kn
         GUP21oyy9xF+PBe3aC92ulGOG8hygwRi92fN1WM1mJkSe1SoXOvRo1YCfij6C67Zsve9
         +s4LAlWAl1aleRmN17q6RZf2QoF7w/BwsT9YH18zRIho6lAu9XwRqaEYEM13RLlX0UFD
         lfQD582K+x9KhX5oMPJkY/hcrppU8oUP+hxUy22uo0PvXi+3BaSR8i2M2Eebt9HYOpiU
         MohQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=VH97Na66andw4PozP6BhVAqLMDNlmpGHKEqMqLw6BXM=;
        b=vG+R5dzIXGl//XgY1Ecl4sLxdGy5RFzcdEF4YxZgC0wAtI6/NgZPyOJlDimWJ3EwYS
         1JAPdGIKgzUOME6GhvrtT6lQ0lwIFL0TU3abwAELhO9JLN85N+DBOTYIfi1aFVWpBEkB
         SfA8oB/s0CUPRcvofQ2+ZzQnkWy9DTBxh0D++FDA4tQJMA5FoBoWFS6Jv0ZPIU+fn5Ki
         liyDBkQQYqk12hdPP7H9aZqG7UPV+4jXmdb0iS6l4XqeMc4FyaE06MB3or6WcvyQvQtH
         g3Uq8Osynp5QEu77Sc92JrVdK2koP+pRJ/GRChQaRqZH6TXtsbuJFGnaUZdD2jmCbKkl
         RkWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ddgkc7pd;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <quintela@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id s17-20020aa7c551000000b0046cc68a5eb9si1351204edr.617.2022.12.05.01.52.53
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 01:52:53 -0800 (PST)
Received-SPF: pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ddgkc7pd;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670233972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VH97Na66andw4PozP6BhVAqLMDNlmpGHKEqMqLw6BXM=;
	b=Ddgkc7pdsO/lLam1K9a7gkps9/M9vmmSyeu66gdnstJo9KpMYEJ2qHVyqZksySdPZW6TKd
	/z2BQdOJk86Vewb+aXfpNsHGuPh1yyJ6PLf7PwTRU1Tbd4WqmWo+xp8T1RkXUEEiJint4E
	evIl0TvICqHYqV6Ogfc2GTo/+GE1srs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-16-bQ9mUBvZPYWbolGBp1cgAw-1; Mon, 05 Dec 2022 04:52:49 -0500
X-MC-Unique: bQ9mUBvZPYWbolGBp1cgAw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 449368339C5;
	Mon,  5 Dec 2022 09:52:48 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 23C332166B2A;
	Mon,  5 Dec 2022 09:52:40 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>,
	Thomas Huth <huth@tuxfamily.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Kevin Wolf <kwolf@redhat.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Eric Blake <eblake@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Raphael Norwitz <raphael.norwitz@nutanix.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	virtio-fs@redhat.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	"Gonglei (Arei)" <arei.gonglei@huawei.com>,
	qemu-block@nongnu.org,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	Thomas Huth <thuth@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Gerd Hoffmann <kraxel@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Eric Farman <farman@linux.ibm.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Jason Wang <jasowang@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Song Gao <gaosong@loongson.cn>,
	qemu-s390x@nongnu.org,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Klaus Jensen <its@irrelevant.dk>,
	John Snow <jsnow@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Keith Busch <kbusch@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	qemu-trivial@nongnu.org,
	Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH v2 01/51] update seabios source from 1.16.0 to 1.16.1
Date: Mon,  5 Dec 2022 10:51:38 +0100
Message-Id: <20221205095228.1314-2-quintela@redhat.com>
In-Reply-To: <20221205095228.1314-1-quintela@redhat.com>
References: <20221205095228.1314-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-TUID: 2kUSIB4i77gq

From: Gerd Hoffmann <kraxel@redhat.com>

git shortlog rel-1.16.0..rel-1.16.1
===================================

Gerd Hoffmann (3):
      malloc: use variable for ZoneHigh size
      malloc: use large ZoneHigh when there is enough memory
      virtio-blk: use larger default request size

Igor Mammedov (1):
      acpi: parse Alias object

Volker Rümelin (2):
      pci: refactor the pci_config_*() functions
      reset: force standard PCI configuration access

Xiaofei Lee (1):
      virtio-blk: Fix incorrect type conversion in virtio_blk_op()

Xuan Zhuo (2):
      virtio-mmio: read/write the hi 32 features for mmio
      virtio: finalize features before using device

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 roms/seabios | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/roms/seabios b/roms/seabios
index d239552ce7..3208b098f5 160000
--- a/roms/seabios
+++ b/roms/seabios
@@ -1 +1 @@
-Subproject commit d239552ce7220e448ae81f41515138f7b9e3c4db
+Subproject commit 3208b098f51a9ef96d0dfa71d5ec3a3eaec88f0a
-- 
2.38.1
