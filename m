Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp564121lfk;
        Fri, 28 Jan 2022 11:03:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz3vuWX7rzYP5T9LDwTC7DwE07YvYvlK9zRbPkbrks1+VFzYwZ4BiWCIqAthFfmNvVQEswL
X-Received: by 2002:a05:620a:150b:: with SMTP id i11mr6904685qkk.183.1643396594064;
        Fri, 28 Jan 2022 11:03:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643396594; cv=none;
        d=google.com; s=arc-20160816;
        b=QPykE3yKnveMqCmDFTqWtR9l6fZed1tCza6KXzRt2oY4lk67kV2aWJ+XpUSJURbpiO
         P4fdnhRFMT0aKZOkE8/vdym4STL1XDaZUlK7n7ibGk1U9g8YQ3NllwlP1IliNI75C5Lm
         nMp1ILRGVT5RhYK824Z9/BpE6lYfTQ4N7dj8Bgji4+RA0SjaUNvxpNKzRvM0I9+uoCrU
         Qkzf9p2B74fcKjde3AaHMgG2CMtsOKq7crBx+GQx2hI6vI1D13n3hjZhTxi6kB8YY4Ln
         nAiP5gU8VmrVYm8V+0+bkSGWBDaYpUWk5mX+CMugDzMYK/sCeZn1q0csk9uBXPIzoO3U
         r+8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=gTuNu9HO4jPGub59vmHdns8TqyGd7V+63Di/4oQVtOQ=;
        b=x5sR0RyHStTWAsdiW9taZ0gILtzlNqbIPcKorhek8R+sH5swfGeHbmPx0XM1wJc0tm
         t93BPRF6ibeKrF4SVID0uqn3C2SHlta/1DyT4TGd56zvGfIZNGUN4Ys0YyPa2q+rpm9X
         nx4/6w8GxAf2upSE3I7bBX9u9rFXp+9fTEitbYMjnwPXG2TfFgKqe+RSV2uLYy7Qp/+a
         /r/8QHQzHP2vNdjdSob+xyCa3YCyipuGLYRH6vtlRRY6F6yQAz/scGS2Lf0HTFIKqxp6
         BN9ey0q+W3SLrLZugjPRjvyPp+uSTbV0wOg6mzu3Lp2TGQ326DG3MeUmqzZyeQX5pN3i
         n4dg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KBFghhJh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fv15si2692283qvb.488.2022.01.28.11.03.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Jan 2022 11:03:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KBFghhJh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nDWWe-0007rF-TX
	for alex.bennee@linaro.org; Fri, 28 Jan 2022 14:03:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nDW5C-000671-9m
 for qemu-arm@nongnu.org; Fri, 28 Jan 2022 13:34:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nDW59-000139-Pa
 for qemu-arm@nongnu.org; Fri, 28 Jan 2022 13:34:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643394884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gTuNu9HO4jPGub59vmHdns8TqyGd7V+63Di/4oQVtOQ=;
 b=KBFghhJhbrikm4yK1t2RylcJ2c2k8Sww/cSi0LADIr4gTDq02Pa/EiBKpQVNSzyvnwF8xU
 jW0TurW34a9tCdSI91bGruBOkXbE9K66Vub8Sev2e7TJgv6zXbPAEQ7N/IOBJfk8PneP59
 NJkr4B5qeWMKIxYGI6wJnW5DHtjA37g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-74-cg4pu1jpNEGZwPsMc3yHnA-1; Fri, 28 Jan 2022 13:34:41 -0500
X-MC-Unique: cg4pu1jpNEGZwPsMc3yHnA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CE1C8145E0;
 Fri, 28 Jan 2022 18:34:38 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8D62177456;
 Fri, 28 Jan 2022 18:34:31 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/36] migration: simplify do_compress_ram_page
Date: Fri, 28 Jan 2022 19:30:02 +0100
Message-Id: <20220128183033.31998-6-quintela@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Igor Mammedov <imammedo@redhat.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Laurent Vivier <laurent@vivier.eu>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /+N9ovbsLDPG

The goto is not needed at all.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/ram.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index fa49d22e69..422c6bce28 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1341,12 +1341,11 @@ static bool do_compress_ram_page(QEMUFile *f, z_stream *stream, RAMBlock *block,
 {
     RAMState *rs = ram_state;
     uint8_t *p = block->host + offset;
-    bool zero_page = false;
     int ret;
 
     if (save_zero_page_to_file(rs, f, block, offset)) {
-        zero_page = true;
-        goto exit;
+        ram_release_page(block->idstr, offset);
+        return true;
     }
 
     save_page_header(rs, f, block, offset | RAM_SAVE_FLAG_COMPRESS_PAGE);
@@ -1361,12 +1360,8 @@ static bool do_compress_ram_page(QEMUFile *f, z_stream *stream, RAMBlock *block,
     if (ret < 0) {
         qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
         error_report("compressed data failed!");
-        return false;
     }
-
-exit:
-    ram_release_page(block->idstr, offset);
-    return zero_page;
+    return false;
 }
 
 static void
-- 
2.34.1

