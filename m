Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2037659ejb;
        Tue, 24 Oct 2023 06:14:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEaWFWVEU6Dd8IhWCC/QGtjcfCPmfNjVlL3h1Dzv/Js7lX961+BLGhsSvBLc73KauBAmqJL
X-Received: by 2002:a0c:b252:0:b0:66d:65a9:8a17 with SMTP id k18-20020a0cb252000000b0066d65a98a17mr10327446qve.2.1698153241626;
        Tue, 24 Oct 2023 06:14:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698153241; cv=none;
        d=google.com; s=arc-20160816;
        b=hZhQP1z0uTii4nJvTYSiKKto4BQ3nz3xIe/U9Ft7PcpbDUHdkiYZYSyZFiVDE53HY5
         8WA0GmJ+3VCNMst+jNSARe8wesm4SL89pue58MduSznhgGxn0oqxd006qRDt2uuxYIZJ
         tP8BhFSyj5RSpGKyCcMfCT2H1xmmTlp1rpEzzndpjB+NTY7W2YkKv872J5gOO+txMDEe
         kpvutBPEblxZ+4GWV3s3ZOZPXEhmE7AYcq+NWOFxh22LfvBLDpm8CZRdfytk6HvfAPn8
         FlPedm9YXbRd9JsgPURuNCn+V5cDCmp+N4SasCwf6ANwIr/d7LFrGLzIswTus5i1D4zF
         L8Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=VM08G+LHFsIqxiXEmkhxqOFMNoBjDlLFnd3SYaD5rAM=;
        fh=e9feSw8SSOtT/dgZZLe6uilVOFwjb0itHlOwuVUfZns=;
        b=WEJuq2GBC8OqT3ofCYCYCvIaLrJ8DeeG5dg5an+fHkmzSg4ua7/W9e1jk4uhdUGkie
         FyEwKypxbP7LvshAUt45jzav4WGHiWaF2fazVLO34mnuU+f+T1iB61FgxNx9STFpnzs0
         x2dZlpk26ROtxFwT070PmSzp6OJk7ZHbhPeFsQ1LKpFVxVcizUDUy0vXAZUeTXRdaKvK
         NdSqYpLKtzHKRpbnigvh4pviDBMavHl9q4mug9oK88D0I3YtUWLijGMe9duapnhsMdJu
         VJNkR/K7i00lptwznfxYG85KLlonKj+hcV5A2/ktGROs5ad6nBuFO6RtHZy2WY3DxjEk
         ViFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LIsuE04d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n5-20020ac85a05000000b00418053cd7f6si6635433qta.48.2023.10.24.06.14.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Oct 2023 06:14:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LIsuE04d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvHDw-0003c8-Fx; Tue, 24 Oct 2023 09:13:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qvHDv-0003bQ-Jv
 for qemu-arm@nongnu.org; Tue, 24 Oct 2023 09:13:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qvHDt-0000yG-4L
 for qemu-arm@nongnu.org; Tue, 24 Oct 2023 09:13:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698153208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VM08G+LHFsIqxiXEmkhxqOFMNoBjDlLFnd3SYaD5rAM=;
 b=LIsuE04dfR6H+so/ER8NchW58Tb5nQkC3Dl7q4UOxd5QydtG5NZWe9CDR64vk9QhmjCkMP
 iV/Kh6roEPAJsbgSEVe8ac2Hq3ajLQkjwvJXwmAv6qirMKsyT+uo54pHpe0RK1uPBWf/hs
 2DkiNMp+fxPOiqN79CriEGa2PD8pu4E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675-5vnQS3TePh2cMMkDVAUESw-1; Tue, 24 Oct 2023 09:13:22 -0400
X-MC-Unique: 5vnQS3TePh2cMMkDVAUESw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 82286857C25;
 Tue, 24 Oct 2023 13:13:20 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 519D81C060AE;
 Tue, 24 Oct 2023 13:13:14 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Corey Minyard <minyard@acm.org>, Li Zhijian <lizhijian@fujitsu.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Corey Minyard <cminyard@mvista.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Kevin Wolf <kwolf@redhat.com>, qemu-s390x@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 libvir-list@redhat.com, Stefan Weil <sw@weilnetz.de>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Xu <peterx@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Fam Zheng <fam@euphon.net>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Eric Farman <farman@linux.ibm.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-ppc@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org
Subject: [PULL 01/39] migration/doc: Add contents
Date: Tue, 24 Oct 2023 15:12:27 +0200
Message-ID: <20231024131305.87468-2-quintela@redhat.com>
In-Reply-To: <20231024131305.87468-1-quintela@redhat.com>
References: <20231024131305.87468-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: opvDBunIqLTR

Reviewed-by: Fabiano Rosas <farosas@suse.de>
Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-ID: <20231018112827.1325-2-quintela@redhat.com>
---
 docs/devel/migration.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/docs/devel/migration.rst b/docs/devel/migration.rst
index c3e1400c0c..4d6a98ae58 100644
--- a/docs/devel/migration.rst
+++ b/docs/devel/migration.rst
@@ -28,6 +28,8 @@ the guest to be stopped.  Typically the time that the guest is
 unresponsive during live migration is the low hundred of milliseconds
 (notice that this depends on a lot of things).
 
+.. contents::
+
 Transports
 ==========
 
-- 
2.41.0

