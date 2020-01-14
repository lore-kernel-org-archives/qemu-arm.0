Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5472848lff;
        Tue, 14 Jan 2020 04:59:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqwtzAVOQEn0agymDQP75dDEGqwBbqLLnUzzMWjl0FxGo1eDx6vv2RNa3q1dBK7/ZO752HcN
X-Received: by 2002:a05:620a:138d:: with SMTP id k13mr16167305qki.239.1579006780775;
        Tue, 14 Jan 2020 04:59:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579006780; cv=none;
        d=google.com; s=arc-20160816;
        b=VWwmLJfRiVwUVZmnKKbH+rhsrKRWn7MZs+NP6grYAbjrt6/iRAM5nazWYuxX1O7sXM
         QSSONriOmpRXfGKJlpCk1Z5mX6DxRrIv8J6UNwWXbE72u6sV+Lca6LMIuMixfVM0D82M
         pNdaieyLnFPoK1i/scUdQaVNJGsfuXR3cLhmBx+dfq9rHmniyejRXJP51TZKIHtUXHCv
         dETe9oYdAFK5Man+tx/ciYcRcjfR/uYK922M4Gan9sfj+TEMczkQUT7Ck+/s0b+9shv1
         hq/a4PxMppK/bG9OBk1nhHHVYsQ91Vyf8SJwlXjBpYx4jlo/KUdld74LzsOfJ0Xvj2nv
         upAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=2p0QKCeBS4+LZOVYBokhIHTSESXgTmLYzL/BOFYcXF4=;
        b=bRzUQL8M4ZTrjgMmpddIoC9+qIFMYgjgk/ZABhYXiXHXOQwlbOO+OD2mSGpKlm1usb
         W7eHpCxSoKVxwH59/O8nZVlIfI4SgwrcIxAaG9N2od2bdZVlz94tAMCL6KzJ2+oFtQJ1
         OrO/EvOQsR/jVJWOewpkrO3EhxoZStNcFRFeffgKs6fR47tMBItAAsiN2H4BLPXHX/SP
         Mhn1IxuOH1AXHBDDKvSPTDMsjPk9MVWnFLJppvHfx3DuDNCcjgQZjqglIUpXKf4wHPPA
         V0qfkSBdpM31r41hoMaxPGTGCMMhhB9Gfyj5JmCrvd+yIuv7ofhVK48EdC75CV+P6Mtl
         yc6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZsUGgav3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h9si7987968qtr.392.2020.01.14.04.59.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 04:59:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZsUGgav3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irLnH-0008Vq-OQ
	for alex.bennee@linaro.org; Tue, 14 Jan 2020 07:59:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41053)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1irLii-0002Yu-Kc
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 07:55:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1irLie-0001ho-La
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 07:54:56 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:35985
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1irLie-0001h6-Hx
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 07:54:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579006492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2p0QKCeBS4+LZOVYBokhIHTSESXgTmLYzL/BOFYcXF4=;
 b=ZsUGgav3Le0PgSzl/5ZEt8x9yEKC1I6ZiO5ij1Jl6IsEyfpZO/YM3uWGxD+MpscXBuYwE7
 yJkp/v+Uuh9jDOT6VTqCj/cMF4Wo+bEOTZOwo+iGbQy/rtlu5vgsw9ELhB3x7Nm6do2rWs
 oY0Y2tcZNeIH0IIVVfYeKVAhvdWMVWw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-yW1AwKWMN0CH7NG-r7Y-GQ-1; Tue, 14 Jan 2020 07:54:50 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89D901800D78;
 Tue, 14 Jan 2020 12:54:48 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 11E235D9E5;
 Tue, 14 Jan 2020 12:54:43 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/30] misc: use QEMU_IS_ALIGNED
Date: Tue, 14 Jan 2020 13:52:36 +0100
Message-Id: <20200114125254.4515-13-quintela@redhat.com>
In-Reply-To: <20200114125254.4515-1-quintela@redhat.com>
References: <20200114125254.4515-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: yW1AwKWMN0CH7NG-r7Y-GQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Andrzej Zaborowski <balrogg@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hj/EVtlH7+Tp

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 exec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/exec.c b/exec.c
index d4b769d0d4..1feda49ca1 100644
--- a/exec.c
+++ b/exec.c
@@ -3895,7 +3895,7 @@ int ram_block_discard_range(RAMBlock *rb, uint64_t st=
art, size_t length)
=20
     uint8_t *host_startaddr =3D rb->host + start;
=20
-    if ((uintptr_t)host_startaddr & (rb->page_size - 1)) {
+    if (!QEMU_PTR_IS_ALIGNED(host_startaddr, rb->page_size)) {
         error_report("ram_block_discard_range: Unaligned start address: %p=
",
                      host_startaddr);
         goto err;
@@ -3903,7 +3903,7 @@ int ram_block_discard_range(RAMBlock *rb, uint64_t st=
art, size_t length)
=20
     if ((start + length) <=3D rb->used_length) {
         bool need_madvise, need_fallocate;
-        if (length & (rb->page_size - 1)) {
+        if (!QEMU_IS_ALIGNED(length, rb->page_size)) {
             error_report("ram_block_discard_range: Unaligned length: %zx",
                          length);
             goto err;
--=20
2.24.1

