Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2907523lfy;
        Mon, 24 Aug 2020 15:01:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxFZIEXG33VMyf4oWV+AvSuvzDKR8cKETar7v6ogduhrEq+F112gnscY8i7a1UHP6G4gHH
X-Received: by 2002:a25:9742:: with SMTP id h2mr9956037ybo.430.1598306510434;
        Mon, 24 Aug 2020 15:01:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598306510; cv=none;
        d=google.com; s=arc-20160816;
        b=aYcs0TUfo/h8DPSbPU7bQe6uEHmYkSbWKFHR+r0hiwobAdYB3WNeRZb119Bqc/pooR
         GlMkiyR4+oSILgi0AQn27OY51UbTs0Fypi8fH/YgkP/e3mF363v/ZKZu2kc2SVdVJ0t4
         8kM5/u01uqG2dPwEXo98SkHVER2NkVwOJ3rLjCKa0WybuuPsUD3WihnwIcZZYrv+cX9q
         4CRkIsnfF2nwX2eVSGwdDuz1siRV/r6/uYnr9bO6h+Hchat8Q+zOrIscH8ax5oN/dNJV
         ohCXtoXz70NgRwrNUxSwwZc3R0g9sN/76Meu3vE3hx8XotVZ0uobltDPVYetAOCQ/ahh
         S6TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=0Pfp5SgTprd9ND/vlJyUCkJYT0AokfxhaHpSGIsVaF4=;
        b=T0iQDkvhvTQ5P7whNByz95RO9QfrtNsNibasRMjjUTazqVzunza/QxkOSXsOCghngR
         G8TbKmTx1CRetWN/39JazGSYXKhkLiLMf8kwP0kbfzmtxRbtbo/ft+OkyHJqB5Q1fopH
         aOrmtJIfKe2Z+EU1mXENt3uBismegL5yVu3Te2RpNPZUKCPp0D3xB8BD9pFJaxQ8IZtY
         d7zMt61IPj7P5QyegjhROcP4N1dZdzgH9Njpv9GqEWmO2Pfwd+eyKNIC2S08kCVkZiM2
         BojS2jMJajLPqZcvR9HGu1mtajE/OMu82bri4EL3Sad0YkOQL0+ks/ywHL170AnbdmJr
         dkSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="I/OU2gqs";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u13si13041711ybd.405.2020.08.24.15.01.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Aug 2020 15:01:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="I/OU2gqs";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAKXF-0007G4-Ka
	for alex.bennee@linaro.org; Mon, 24 Aug 2020 18:01:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kAKVh-0006kb-N3
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 18:00:13 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:56276
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kAKVf-0008K6-Qr
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 18:00:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598306411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Pfp5SgTprd9ND/vlJyUCkJYT0AokfxhaHpSGIsVaF4=;
 b=I/OU2gqskVcCxkn0tj2y7qezDBmSnmAkd3eSQl+u3JL32AmqNH1jv3q94oOKLV8griNlKN
 2gGB6cgJ8yRaWvWVZpX7PBTYsSQ8YpeORTDUHfa/90/MXJLOcJdg2LbNNbgYwPqHT9oQSh
 W8UZtEFJuMbdF1F652iSJOWe554Ddkg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-YppF9kHHMEKX287uCwS7xA-1; Mon, 24 Aug 2020 18:00:09 -0400
X-MC-Unique: YppF9kHHMEKX287uCwS7xA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 384991DDEB;
 Mon, 24 Aug 2020 22:00:08 +0000 (UTC)
Received: from localhost (unknown [10.10.67.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 73184100AE52;
 Mon, 24 Aug 2020 21:59:57 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/6] lpc_ich9: Use typedef name for instance_size
Date: Mon, 24 Aug 2020 17:59:33 -0400
Message-Id: <20200824215936.2961951-4-ehabkost@redhat.com>
In-Reply-To: <20200824215936.2961951-1-ehabkost@redhat.com>
References: <20200824215936.2961951-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/24 17:57:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.956,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MKZwaNs5P9pI

This makes the code consistent with the rest of QOM code in QEMU,
and will make automated conversion to type declaration macros
simpler.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: qemu-devel@nongnu.org
---
 hw/isa/lpc_ich9.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index cd6e169d47..3303d2eab6 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -792,7 +792,7 @@ static void ich9_lpc_class_init(ObjectClass *klass, void *data)
 static const TypeInfo ich9_lpc_info = {
     .name       = TYPE_ICH9_LPC_DEVICE,
     .parent     = TYPE_PCI_DEVICE,
-    .instance_size = sizeof(struct ICH9LPCState),
+    .instance_size = sizeof(ICH9LPCState),
     .instance_init = ich9_lpc_initfn,
     .class_init  = ich9_lpc_class_init,
     .interfaces = (InterfaceInfo[]) {
-- 
2.26.2

