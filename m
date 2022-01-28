Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp557641lfk;
        Fri, 28 Jan 2022 10:51:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyDtMZgHKiQV6tGiswNpdLlr2ZsPnelmrh02L1yxuYtWQf3ECAH1u+U2RXZuj2Llw1OGjHa
X-Received: by 2002:a05:6902:1082:: with SMTP id v2mr15596756ybu.333.1643395879218;
        Fri, 28 Jan 2022 10:51:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643395879; cv=none;
        d=google.com; s=arc-20160816;
        b=KGAk+IhiIE7h9vSJAdv/7ac7F/mOk2KmP8vFpFCPUxOID7cbAciDG2brsMACuf0icV
         vcxHTPOh9jnxvdDM0Ns5wA8KaUncZr/ug15bOUJMfDqpkxt5cytOu7Ee4EP/x9h8AuA2
         ONVGPLcMaKDuFRhp3afiSQn3qxHNxRZu/CVdAHFeCREcJCtT2kJbWim/6a+BCq9O6MYe
         ckJEl7VM7BQ3Pj83DI8WytbQXfbWzosIlbBGEKTmURA2JpMqjxrkte4S3EliOYk7/a5s
         qAwZDuU2/ZLrqlCCaAhvCsFSoBwAFx1w0/Xm3AvWGvTyz6mrqbiCS54NlUNz1ItUL9ee
         a7Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=0hmgBIgw2vpYhvjWSpFcJn/+tADW2pBvjmWQdqRJQYc=;
        b=WgjUT1oIrSmEBSU7wY4PLbzy0H5YA0iL6/fxucw8d5ojVeGpYsXYCUhbOoQ+dN9rPW
         5Dpql3SeyJoUWJLlvsaZbaDkE8LPlCBUcBIihNB/kP1m2QcH3hh2SxPnT4g723Fqzj9N
         ti5FXeeTbD5oW7Apt27zepRpeHnfWbyIAaiYHdjVXXBo/2BeJsqgMDBXC+g1rsohREj2
         PTas4WxRowFKauyTc2IXp/O5E+UcvEnpEmPEvzkFkJhilyX3iMZoxcGWZOvzNMjE5uwl
         LV2xDnMik5RYxVvgAVlj5+QnDOU+Y97ajMvKdmhrhPq7UCRc2Un9DJV9vN1yRgp7Tgbz
         LT4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GBZPL0Vl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p192si26058624yba.198.2022.01.28.10.51.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Jan 2022 10:51:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GBZPL0Vl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nDWL8-0005Vj-EF
	for alex.bennee@linaro.org; Fri, 28 Jan 2022 13:51:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nDW6W-0007OH-R5
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 13:36:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nDW6P-0001Qn-36
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 13:36:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643394962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0hmgBIgw2vpYhvjWSpFcJn/+tADW2pBvjmWQdqRJQYc=;
 b=GBZPL0VldlK2wal1VWyBCEpmjBomtloe1ZRQz6jf2CCl34a4Dmwpk7r+m3DjhulEhcWYm4
 549aQPU/joIAF8DLi6mMSiLgo4yGSQ1kkpxE66woIXMV/OnAhjdizRsHDJXmxWffx49qcY
 hXZ7RDH6Dwti9eT9NTjVk/VlfCDleco=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-261-5QGOKKp_NP-nqvjZclypwg-1; Fri, 28 Jan 2022 13:35:58 -0500
X-MC-Unique: 5QGOKKp_NP-nqvjZclypwg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1D3085B6C8;
 Fri, 28 Jan 2022 18:35:54 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F7E477456;
 Fri, 28 Jan 2022 18:35:29 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/36] multifd: Unfold "used" variable by its value
Date: Fri, 28 Jan 2022 19:30:10 +0100
Message-Id: <20220128183033.31998-14-quintela@redhat.com>
In-Reply-To: <20220128183033.31998-1-quintela@redhat.com>
References: <20220128183033.31998-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) DKIMWL_WL_HIGH=-0.167, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Eric Blake <eblake@redhat.com>,
 Hannes Reinecke <hare@suse.com>, Vikram Garhwal <fnu.vikram@xilinx.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>, Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Igor Mammedov <imammedo@redhat.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Laurent Vivier <laurent@vivier.eu>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1scrSJjX+TmQ

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/multifd.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index 1d4885e1a0..e5b1fa5015 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -1062,7 +1062,6 @@ static void *multifd_recv_thread(void *opaque)
     rcu_register_thread();
 
     while (true) {
-        uint32_t used;
         uint32_t flags;
 
         if (p->quit) {
@@ -1085,17 +1084,16 @@ static void *multifd_recv_thread(void *opaque)
             break;
         }
 
-        used = p->pages->num;
         flags = p->flags;
         /* recv methods don't know how to handle the SYNC flag */
         p->flags &= ~MULTIFD_FLAG_SYNC;
-        trace_multifd_recv(p->id, p->packet_num, used, flags,
+        trace_multifd_recv(p->id, p->packet_num, p->pages->num, flags,
                            p->next_packet_size);
         p->num_packets++;
-        p->num_pages += used;
+        p->num_pages += p->pages->num;
         qemu_mutex_unlock(&p->mutex);
 
-        if (used) {
+        if (p->pages->num) {
             ret = multifd_recv_state->ops->recv_pages(p, &local_err);
             if (ret != 0) {
                 break;
-- 
2.34.1

