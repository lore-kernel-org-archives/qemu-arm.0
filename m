Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp4201625lfk;
        Thu, 27 Jan 2022 08:12:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzP9rc8g/pF1Vpchkg3r2KdL3IqXMgJ15FNGKO6uMyLTfLbPA88l/aO4fdvYYgpBPaDALa6
X-Received: by 2002:a25:cb55:: with SMTP id b82mr6510522ybg.471.1643299975097;
        Thu, 27 Jan 2022 08:12:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643299975; cv=none;
        d=google.com; s=arc-20160816;
        b=zaepUYovAScqpbWt36Aq4cZGpA9bzIqaED9x5p2fkl5e/AQzjta9JlDh0ocJdQa/ZV
         FfTRdjrwxbV49W4Qn/v7KKPTY6o6OUvGsg4kROED2qpADDpN45X+gA/FqJ2i1soO4J1M
         z9kwt2Z/tHFuMTEdS+vzExk0a1iFbUB6E+X4W5h28IaIqLq37bZtNKbvBbFg/WDLETUX
         WRuezS6SzcMmK3yqKCydVxkEPNwlab7iG9RVLuccUzWAtBvU7X7WEhOnL1e20zOcg9Ci
         PQ2lNEs8LOjjtQ+mYQ4dQGg16Tm5AqhcibBbccI29RQtnkK2O/Ck/8C5CKCU/RN0LFsx
         9Ovw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=DUtLJ3E/Ba4f1f0VyVY15aJnRzdGGlTSP4JV0rpYGRw=;
        b=CPY2/HI5DDmGdNSrzwdBl/MvhwqYviF8LYiCGUCaMNPPS+VlZKcLFjMIxnlpgVqNWv
         ZIiGka6UmYiJJ1kcw+puxCSIfT8aUZKxLYmwsxmvtm1bgf2Yabg4Q62dSBFygHiT+bjU
         jFc5Yxlg1kohn01+ILiFYL63mY4XPN2P7Hkfvx8rPq/ex/+9glvO9qXnRSSfzddQt2S8
         UtM5P1CQNgSdIdbg+1ZDQhCJldHS5yGW2DLkj6MYMUik2FmwEgLoKs6SuOGlcsdi2M9R
         8Sqv0eZyOmXeGLVoAX9OLMw+ozF8cTkzMYvBf6HXNUOa+rUkyTocWetq/eviO0N+VFf5
         mjNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="UVvFn/RG";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m63si19708351ybf.184.2022.01.27.08.12.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jan 2022 08:12:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="UVvFn/RG";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nD7OI-00056B-Be
	for alex.bennee@linaro.org; Thu, 27 Jan 2022 11:12:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6V6-0007VH-Pe
 for qemu-arm@nongnu.org; Thu, 27 Jan 2022 10:15:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6Uo-00036e-PI
 for qemu-arm@nongnu.org; Thu, 27 Jan 2022 10:15:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643296526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DUtLJ3E/Ba4f1f0VyVY15aJnRzdGGlTSP4JV0rpYGRw=;
 b=UVvFn/RGWeMj/JIGv49eo8rsRO7BJpS/hofT24oZmGAQJWCu51o/HUUTe4CjkMaVNE4RkW
 FUdP6KHSP+k6WrFOq/OnXm4B7SRalOJRO4oDDYHjfH7rtATzfOL9BfD1jedKnGpDxHmZIz
 9Xf26Eo2P50IXCici9YTlKYcGVrWrbg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-Zc4DnpovO1WhC5eyv4Nvyg-1; Thu, 27 Jan 2022 10:15:24 -0500
X-MC-Unique: Zc4DnpovO1WhC5eyv4Nvyg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7051492500;
 Thu, 27 Jan 2022 15:15:21 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1F2AA70D4A;
 Thu, 27 Jan 2022 15:15:13 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 22/38] migration: Report the error returned when
 save_live_iterate fails
Date: Thu, 27 Jan 2022 16:05:32 +0100
Message-Id: <20220127150548.20595-23-quintela@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eric Blake <eblake@redhat.com>, Hannes Reinecke <hare@suse.com>,
 Vikram Garhwal <fnu.vikram@xilinx.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 David Edmondson <david.edmondson@oracle.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Laurent Vivier <laurent@vivier.eu>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +p3hJLy3kd3B

From: David Edmondson <david.edmondson@oracle.com>

Should qemu_savevm_state_iterate() encounter a failure when calling a
particular save_live_iterate function, report the error code returned
by the function.

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/savevm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 0bef031acb..1599b02fbc 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1298,8 +1298,9 @@ int qemu_savevm_state_iterate(QEMUFile *f, bool postcopy)
         save_section_footer(f, se);
 
         if (ret < 0) {
-            error_report("failed to save SaveStateEntry with id(name): %d(%s)",
-                         se->section_id, se->idstr);
+            error_report("failed to save SaveStateEntry with id(name): "
+                         "%d(%s): %d",
+                         se->section_id, se->idstr, ret);
             qemu_file_set_error(f, ret);
         }
         if (ret <= 0) {
-- 
2.34.1

