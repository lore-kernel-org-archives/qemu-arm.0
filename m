Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp3459298ejb;
        Mon, 19 Dec 2022 05:02:19 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4q+KiuPxRzrCXtmqH8izXV5CzYwD2dvN6fu3Uk3eN139+j7FKQGe1ly3iQKMIAq+ybQSg9
X-Received: by 2002:a05:6871:4481:b0:148:4e20:c531 with SMTP id ne1-20020a056871448100b001484e20c531mr12587631oab.28.1671454939587;
        Mon, 19 Dec 2022 05:02:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671454939; cv=none;
        d=google.com; s=arc-20160816;
        b=P18Y62r19VRU8kPGKcQkyfvHV8EnfVJtdOuU2jMZQrJHlas/8Ux0RbB4ZiGpDrCWDX
         7rbUBLHiXp4jPjH9sEKXgDD2MKKhimIOWJXJiQlWAmlENhteG8WZC2Fm2JlGVQBZXeZ9
         ZrvVTBCteZMZusbN57MK4Fb2dyXmtS6psPKcFcEh36/5WgyX5IF4RViLN9DAr7ESuxmR
         H1NUMv/bjZgVsYIz7MqKx/QGmnt3bJii9mRzxW3ouQE8ly+CGGMCXipbPkqLTEq7tqEs
         nNOOgg+fwCAruOCu2bMFJevx4rH4hueKfdUdZJMsrgwbcSbngxWClbFKwwtKureKRYsc
         /zrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=lZcczZS+N+vA1eZ+A79wIe+fnTT7PirYzB1gzQ8wivc=;
        b=nBEq1KJ6MRPZsKcfIuti6iH5P3zaxZi7hNS7jxrnyD/8fUXrse9SX/4tRIyL/acMHK
         lzBH4CQggSYf7e6wnGve8fw8xVwK+aQk3TOq/GrqkbDhXLxWFmGhMOn7aVYihqndquLu
         LwsjsfoxGTCr93dIHOyXPZ4iU4GVPnKRogdLthDyXTiKpfvxg783Azffnkxzw1qblsgr
         mrAHJnTQm8GB4RLANSOcUJvqZ7jvAFk6XDj3YlTcFOi9FoHBTkY4lPbgj+yeB8Z0RDAw
         ToaqxY2CxDZMQnPBBCgNihmpTaBnYSqkuICMVVISw5VVPSMhQeGPmzhri1NhJ2z0/mau
         1jMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EmIPUKtQ;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id l18-20020ac848d2000000b003a4f294f6a9si3713585qtr.745.2022.12.19.05.02.19
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Dec 2022 05:02:19 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EmIPUKtQ;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671454939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lZcczZS+N+vA1eZ+A79wIe+fnTT7PirYzB1gzQ8wivc=;
	b=EmIPUKtQ1X9UBU/D2vPuZ3nL5SqEZ0ZG6DPWvl1a41d4/QkBg5Z5FSG1RKpj1qbjSeEexh
	cj4rlntDUIMyqtQ3UGhSTfurDlW/COyMXAMwMKOwo9I4Mwm3KsLQRpN9c2MhHHALUqqv/G
	xxr6bFI2TP6RVk/n2x5ucFSFFZ8Zl9c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-486-Nb6M1rL5PvikIs1MYPlhQQ-1; Mon, 19 Dec 2022 08:02:15 -0500
X-MC-Unique: Nb6M1rL5PvikIs1MYPlhQQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A806780D0F2;
	Mon, 19 Dec 2022 13:02:07 +0000 (UTC)
Received: from virtlab420.virt.lab.eng.bos.redhat.com (virtlab420.virt.lab.eng.bos.redhat.com [10.19.152.148])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 098F214171B7;
	Mon, 19 Dec 2022 13:02:07 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-ppc@nongnu.org,
	xen-devel@lists.xenproject.org,
	Laurent Vivier <lvivier@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	virtio-fs@redhat.com,
	Michael Roth <michael.roth@amd.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-block@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	Paul Durrant <paul@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	John Snow <jsnow@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Greg Kurz <groug@kaod.org>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 1/6] disas: add G_GNUC_PRINTF to gstring_printf
Date: Mon, 19 Dec 2022 08:02:00 -0500
Message-Id: <20221219130205.687815-2-berrange@redhat.com>
In-Reply-To: <20221219130205.687815-1-berrange@redhat.com>
References: <20221219130205.687815-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-TUID: mixCyruaQzKx

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 disas.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/disas.c b/disas.c
index 94d3b45042..31df8f5b89 100644
--- a/disas.c
+++ b/disas.c
@@ -239,6 +239,7 @@ void target_disas(FILE *out, CPUState *cpu, target_ulong code,
     }
 }
 
+G_GNUC_PRINTF(2, 3)
 static int gstring_printf(FILE *stream, const char *fmt, ...)
 {
     /* We abuse the FILE parameter to pass a GString. */
-- 
2.38.1
