Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp3459325ejb;
        Mon, 19 Dec 2022 05:02:20 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5Bjh/4cZcdgDO+7mX0KClHOoizEZu2Jldh6uSl+dTooohFpCSwlWBw33S9AlsPF3/ZTbkd
X-Received: by 2002:a05:7500:4c4:b0:ea:68e6:fb47 with SMTP id b4-20020a05750004c400b000ea68e6fb47mr4706941gac.60.1671454940658;
        Mon, 19 Dec 2022 05:02:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671454940; cv=none;
        d=google.com; s=arc-20160816;
        b=pSHLGeLk5E+wDD8Kr0JLK3RwHf/Qj3rCGv7UPz/bJgwb2nCbSfQ5ZUG7rhfIMTd/Gz
         nDboTEFGH3gSXF+ZChaNIRCHKRrlUgKQ7I2SQFyT4q6mA5E5DT6PLyhffw1XvYeMXKnz
         F4/F7pLNh27XQy0mwgOpAgu/ZD6VstQcE3/a3vATs76IGjMTW07MFISso/twT+SFo+hy
         WFFjucUV2VJj4wFuUZpjInVaiLEaNJH7aNAKI8kIUIDKFU+n3K+8gHsRGLZdHWkAcDb9
         Uu7oDWIyrCB81FhnjUHZRIgVikOuMsUgE8V68UqMSkAHvxReBu1/qy7pOihnYBz+EVYx
         awWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=3uNZWGWuQwUgGmH+7L3OtwPhlC39/K0HmCAU4bDa1hs=;
        b=mjmjI9jvzt8IeAqvqk7St+z1fvTHtOD5CHOOcTZgUNlnnIXdI6Bzqx3cwLCMWJL1mE
         Jw8cRpZtdxWMZKj/osXdH1bXGBaGKPLjcmXO5Il72jBaPV7hgIsWMucW+BENJLaXLZY+
         bTcMYCX9Zap6GW07SUHoOjJW20DeqKxQ2fMuVxFYsykYh/FJVjYAFxkWpYXFtLVTLyA3
         E2BH9whNYIm3YW4p1iIlr3JAYYOKc4caudKM9qjKp3XWJCuBDQs+qzXI8K/JIuvUIT/A
         tbzyRNY9Wyx/M+LvrOe7+hZvnr4zbnRPG9JesQkCKt96O9QEbnEXDgokcSVCzP7xC3mI
         6PVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NJI+IOV7;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id y5-20020a05620a25c500b006fc962a83b8si3969463qko.716.2022.12.19.05.02.20
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Dec 2022 05:02:20 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NJI+IOV7;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671454940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3uNZWGWuQwUgGmH+7L3OtwPhlC39/K0HmCAU4bDa1hs=;
	b=NJI+IOV7ZfM+5Qy7i37q29sW2f6oDUjTZY09pLbnLRdlC+6Bx20JILQHPcDcM6OgZogdJu
	9VKymtvsor9EfQdDPhCG15+0pIDTg7q9hqpMkRhZKG7x5vP2OouaQUIO8/hRH8h6QRbqB1
	YW/nBmsCx2NR+P6rQ4Y7Upem2uDIWN8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-511-DcjDLQb1Pqev8Hw37c1HFA-1; Mon, 19 Dec 2022 08:02:16 -0500
X-MC-Unique: DcjDLQb1Pqev8Hw37c1HFA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 201E580D11E;
	Mon, 19 Dec 2022 13:02:11 +0000 (UTC)
Received: from virtlab420.virt.lab.eng.bos.redhat.com (virtlab420.virt.lab.eng.bos.redhat.com [10.19.152.148])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 78B9B14171B8;
	Mon, 19 Dec 2022 13:02:10 +0000 (UTC)
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
Subject: [PATCH 6/6] enforce use of G_GNUC_PRINTF attributes
Date: Mon, 19 Dec 2022 08:02:05 -0500
Message-Id: <20221219130205.687815-7-berrange@redhat.com>
In-Reply-To: <20221219130205.687815-1-berrange@redhat.com>
References: <20221219130205.687815-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-TUID: gRJzyzykYA2D

We've been very gradually adding G_GNUC_PRINTF annotations
to functions over years. This has been useful in detecting
certain malformed printf strings, or cases where we pass
user data as the printf format which is a potential security
flaw.

Given the inherant memory corruption danger in use of format
strings vs mis-matched variadic arguments, it is worth applying
G_GNUC_PRINTF to all functions using printf, even if we know
they are safe.

The compilers can reasonably reliably identify such places
with the -Wsuggest-attribute=format / -Wmissing-format-attribute
flags.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 configure | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configure b/configure
index 26c7bc5154..b9abe19e16 100755
--- a/configure
+++ b/configure
@@ -1208,6 +1208,8 @@ add_to warn_flags -Wnested-externs
 add_to warn_flags -Wendif-labels
 add_to warn_flags -Wexpansion-to-defined
 add_to warn_flags -Wimplicit-fallthrough=2
+add_to warn_flags -Wsuggest-attribute=format
+add_to warn_flags -Wmissing-format-attribute
 
 nowarn_flags=
 add_to nowarn_flags -Wno-initializer-overrides
-- 
2.38.1
