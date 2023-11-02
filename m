Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp320955eja;
        Thu, 2 Nov 2023 04:43:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdrrjelZQEG2g8U+wQZVhueWG7yZR415K9qKvjlWVY4JTNN2hxK/IBzUd+rfIw0nkaoyay
X-Received: by 2002:ac8:7f12:0:b0:41e:29ac:1300 with SMTP id f18-20020ac87f12000000b0041e29ac1300mr23754836qtk.27.1698925382536;
        Thu, 02 Nov 2023 04:43:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698925382; cv=none;
        d=google.com; s=arc-20160816;
        b=MNqlHXnoWN0/lEn7JhGsTzjSl5+bLGkMGzdzIeRyrFDsxUURtpf/++wXa8zKRNiiB9
         URl+U8R/IDnQ29PKMweTFHO2ehZTuW87HDg7EsqICw23H2cstQtYy4g5oZ4QRlt6HUQL
         ljcRKMdv0z6u6Y/jhjxZiFr0wmvK6kMW99Yj2eHPMamQQpeBqqol/8vxKFEVIk61DVGW
         t9LrDbRAQzCXI15HSt3o8SPneHejAKCioFPTrTqYvtwL/D9+WfCn3cw0vXZt23p5Saj2
         8w0h2Rt8PShZxZY9xawvxNyc+vYK9ABOy+gMZuCt0OlfIWVBk56mTUCkc2Ud1yPiokvv
         inWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=XdFHJUBuMGnAWFqd7hEgg2x2gUonHhaiV5RCE6MlQuA=;
        fh=9XEyySFYRp6Olqe53+AU8I52EufRgt7BknvnnkPQpGA=;
        b=R/hEuhatPRu6FMQsrohdtJE9c5ugUSG2XKek2u5e4BvbhzTf0GlGP5uiH+ujqp2Vaf
         PJRu0Y6OMF0wlBkAccGVFL55MnXtl7Kg0FlaF/gi/NrlDClctYmWI5PoumYrGCgkSDMd
         FQvGBgy1A07VRHcepWQcbOo3uNhqiJdnXHdtQwnYLH1T6kuREm88ira1kXELsAAIHCd/
         m3PHsnax1amCjf5TS9Q99pxrG5qL1dyWO+YXA6eT9rA5ust4OnzXfa0ZEnQnUcLylZ0G
         CoWRJt3o+z9czADAzN9sEv3GiuiGHXAgaRHDuKTdkoL57z759VknaP+6JL4Kishbir/T
         L33w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=c0oqMVgE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f2-20020a05622a104200b0041cbeb04d29si4174216qte.437.2023.11.02.04.43.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Nov 2023 04:43:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=c0oqMVgE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qyW5C-0002Td-MB; Thu, 02 Nov 2023 07:41:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qyW5A-0002Nx-Pt
 for qemu-devel@nongnu.org; Thu, 02 Nov 2023 07:41:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qyW58-0004It-Bf
 for qemu-devel@nongnu.org; Thu, 02 Nov 2023 07:41:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698925309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XdFHJUBuMGnAWFqd7hEgg2x2gUonHhaiV5RCE6MlQuA=;
 b=c0oqMVgEUf++Cguu+QcbwA7dN9oWJJ9eFcS+Id10kpOh6+I+s95ko4o75a+veMjAbI41Xm
 bEVTtL1Qroq3wysFxk/Mh2Q4dCh2BPKr2PATJkQsTcDSYyIqZYVwA1nkyN6TC99oNtTtoN
 a+v3hTrDu9JXE8niZ1Scc5R3FcjWOvA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-264-iTrQHR-5NQ67VMAxITjLEw-1; Thu, 02 Nov 2023 07:41:44 -0400
X-MC-Unique: iTrQHR-5NQ67VMAxITjLEw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F3C04811E8E;
 Thu,  2 Nov 2023 11:41:41 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.195.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 962532026D4C;
 Thu,  2 Nov 2023 11:41:34 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Farman <farman@linux.ibm.com>, Laurent Vivier <lvivier@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, David Hildenbrand <david@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Leonardo Bras <leobras@redhat.com>, Corey Minyard <cminyard@mvista.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-ppc@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Li Zhijian <lizhijian@fujitsu.com>, Eric Blake <eblake@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>, Hanna Reitz <hreitz@redhat.com>,
 Fabiano Rosas <farosas@suse.de>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-arm@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Corey Minyard <minyard@acm.org>,
 John Snow <jsnow@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Peter Xu <peterx@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Juan Quintela <quintela@redhat.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fam Zheng <fam@euphon.net>, Stefan Berger <stefanb@linux.ibm.com>
Subject: [PULL 05/40] migration: Create vmstate_register_any()
Date: Thu,  2 Nov 2023 12:40:19 +0100
Message-ID: <20231102114054.44360-6-quintela@redhat.com>
In-Reply-To: <20231102114054.44360-1-quintela@redhat.com>
References: <20231102114054.44360-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: vSnd8i98yItF

We have lots of cases where we are using an instance_id==0 when we
should be using VMSTATE_INSTANCE_ID_ANY (-1).  Basically everything
that can have more than one needs to have a proper instance_id or -1
and the system will take one for it.

vmstate_register_any(): We register with -1.

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-ID: <20231020090731.28701-2-quintela@redhat.com>
---
 include/migration/vmstate.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
index 1af181877c..1ea97ccf2d 100644
--- a/include/migration/vmstate.h
+++ b/include/migration/vmstate.h
@@ -1230,6 +1230,23 @@ static inline int vmstate_register(VMStateIf *obj, int instance_id,
                                           opaque, -1, 0, NULL);
 }
 
+/**
+ * vmstate_register_any() - legacy function to register state
+ * serialisation description and let the function choose the id
+ *
+ * New code shouldn't be using this function as QOM-ified devices have
+ * dc->vmsd to store the serialisation description.
+ *
+ * Returns: 0 on success, -1 on failure
+ */
+static inline int vmstate_register_any(VMStateIf *obj,
+                                       const VMStateDescription *vmsd,
+                                       void *opaque)
+{
+    return vmstate_register_with_alias_id(obj, VMSTATE_INSTANCE_ID_ANY, vmsd,
+                                          opaque, -1, 0, NULL);
+}
+
 void vmstate_unregister(VMStateIf *obj, const VMStateDescription *vmsd,
                         void *opaque);
 
-- 
2.41.0

