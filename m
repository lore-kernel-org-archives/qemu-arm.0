Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp4176712lfk;
        Thu, 27 Jan 2022 07:33:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzFqbHo545F/KDa/JX7H89bPzXuZrHsx7c8xuNkl/4fL82XlDwCnEe7Ex0oz9ZtauWZ8KSy
X-Received: by 2002:a25:d3d4:: with SMTP id e203mr6547633ybf.152.1643297629969;
        Thu, 27 Jan 2022 07:33:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643297629; cv=none;
        d=google.com; s=arc-20160816;
        b=iZ4hYQjMFrUxUDGY+6NwB2TjKypW/BbqwhW4SlPUT5fvJWojc4v5DLztc7w76Dxw6F
         lsiE0v7adIHea5k3Z2KGeWEud1yrUr+s7t3yzzvrV7UtXqiWLB3nlx2CLtjwMge2MP1L
         nSPW4NcEUQCobaXipFd7qeKjZTWeGCw40GAgn7tlUaGtspnRn+qtz2rnuobueZprYJkE
         j47ybkUxDGcm17GaHCwYobeprbwg7DnRRw59mn5YLzmBDI0zsqxsfioe2XbrQJu0m+1B
         PiIud8ItIap0OHSOcTO8wMTeH5O3/9n/nph8sSwo4cGATzxem0E/QzBOOo+E5rPJZWVd
         KB2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ne+AnRV+/8FiQY8PQ0j8bn06mRqfAQEOP3LFhuiF/pQ=;
        b=BIwLD7wpEMUkEW9S8ieF9ASR/EvqF62EJj8KdARnTHX+GeXfkoC3YxV32offI1fv4L
         3MxJoUldoZZHG+KYcgOgtl1WzJ66EPxUfDMFCst7TmGSyJ0eb5gUERK5tGsqlJCTbaBW
         0Fri083Jdpqz/P7D0cijV+fK48yy0wxHZoj76r41f/3T2epbpzL9sMGv7p+tlS/uhl+S
         8CQgWWEjvWqjNPWq+YIS1BU4wVLlrQIC/Po6dc8oXpfgDs129DMYmWy/v1FSYJtNLOR2
         AJ2O0wGIiw35cnDR9NrLF4zkwQ0H2e8fDDKvkIEhCO2qjGP0e0YAXP51VUMHv1Gnvb5F
         noSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OuQ0z1i5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s15si27086743ybu.396.2022.01.27.07.33.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jan 2022 07:33:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OuQ0z1i5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nD6mT-0006O3-55
	for alex.bennee@linaro.org; Thu, 27 Jan 2022 10:33:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6Qf-0002Ui-Lq
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:11:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6Qc-0002CA-Sd
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:11:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643296235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ne+AnRV+/8FiQY8PQ0j8bn06mRqfAQEOP3LFhuiF/pQ=;
 b=OuQ0z1i5kMG3eFEajSjDmlq2Es5FU2CAl3ZeRXtjTWWv6b7niDkADGEhN0oW6LxnKxE/2b
 PNM+dh6niqP55kncJlkmR/R41lYb/m8IFGtHHHcipnWtbeeKI8XIhwQkrMY0Ujle8hY1kY
 M1pArfxWWOarnjzUHqeC3RayZ5mMv28=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-278-EaRU7PtEMmGXl9309N3GIw-1; Thu, 27 Jan 2022 10:10:32 -0500
X-MC-Unique: EaRU7PtEMmGXl9309N3GIw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE8C186A060;
 Thu, 27 Jan 2022 15:10:29 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F00970D49;
 Thu, 27 Jan 2022 15:09:51 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/38] multifd: Make zstd use iov's
Date: Thu, 27 Jan 2022 16:05:20 +0100
Message-Id: <20220127150548.20595-11-quintela@redhat.com>
In-Reply-To: <20220127150548.20595-1-quintela@redhat.com>
References: <20220127150548.20595-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Laurent Vivier <laurent@vivier.eu>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Nu/+rKK4Gp/j

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/multifd-zstd.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/migration/multifd-zstd.c b/migration/multifd-zstd.c
index 97c08367d0..bd393aee0d 100644
--- a/migration/multifd-zstd.c
+++ b/migration/multifd-zstd.c
@@ -154,6 +154,9 @@ static int zstd_send_prepare(MultiFDSendParams *p, Error **errp)
             return -1;
         }
     }
+    p->iov[p->iovs_num].iov_base = z->zbuff;
+    p->iov[p->iovs_num].iov_len = z->out.pos;
+    p->iovs_num++;
     p->next_packet_size = z->out.pos;
     p->flags |= MULTIFD_FLAG_ZSTD;
 
@@ -173,10 +176,7 @@ static int zstd_send_prepare(MultiFDSendParams *p, Error **errp)
  */
 static int zstd_send_write(MultiFDSendParams *p, uint32_t used, Error **errp)
 {
-    struct zstd_data *z = p->data;
-
-    return qio_channel_write_all(p->c, (void *)z->zbuff, p->next_packet_size,
-                                 errp);
+    return qio_channel_writev_all(p->c, p->iov, p->iovs_num, errp);
 }
 
 /**
-- 
2.34.1

