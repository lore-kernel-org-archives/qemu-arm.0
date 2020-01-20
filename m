Received: by 2002:a0c:cd0f:0:0:0:0:0 with SMTP id b15csp2728811qvm;
        Mon, 20 Jan 2020 02:39:08 -0800 (PST)
X-Google-Smtp-Source: APXvYqyicZUdNu/lyma7FKwBQ0cV/gBBlymC6D9LNeG2fT+vZ/FTbhfdYDAPgSDooX0/2y4ONkWo
X-Received: by 2002:a05:6402:c08:: with SMTP id co8mr17260961edb.197.1579516748898;
        Mon, 20 Jan 2020 02:39:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579516748; cv=none;
        d=google.com; s=arc-20160816;
        b=XLcqB12VDp3yW9jJluhbz4LeDQO1770gThZYKY9aJezv3i3/r8kqiXinXoSWWO91Jo
         dIo8Y2jF5TsZmpHYPt6H9wSEmxPF7pDMxDG7qxA3UzhsUYqyO3PczxrR2MTdn5Lqdu12
         q+PUCaPdTckwG+ZsFZhd0huzfxuIg7d78um0BeNcNHwAZ3PdXQvhWc3SmN/Admnau2aQ
         2edJtOchagIkoDSbkiO4RMbAgA8tj6snWn8gMa5FOxAg5hzF3nhSyqXR0qDKN8+skz6r
         3D1ivEY3f53tzCGQSVSs+3uVjYWrMJFv1o/tZla3qVrFK1XiZBign8rPN05UbWqkLPhY
         9Huw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=/YoKMG17GrqYtkuc78YXbVehm34fwjEw8DbFqXGYYW0=;
        b=tKfOOf2CTNY9VNsPg+oU8FuKJ+F/keWrv82HZ1o0SHymohPt6SUlIMKGoXDp5j8IVq
         bUdoFnmDQs6PCY/juvDmFiy3al73N9mNDRPOro6VnNEDioS4kU/Xci6/+reL99JnQmao
         9xvjEN+JVD8HYUFr31KaGn3WglF4ldtQr2QKX2dVjKgDTzEa7sXIOKYtJaAlg7ejAAOj
         HV7oaUdP+kLpTmzUL9voXDGluk+s9Pv5+cBCsd8NpLqe0MF1Z9+sZJf1/QRU0jpJn0gz
         URbO/vF5s7ML6kQ4MQRQtGr16Waj7wCuBKc4gqi9oACiLLEobKShDPZ9Y18eV+WzRL4u
         Mvaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Tncd2rkB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id de9si24319860edb.507.2020.01.20.02.39.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jan 2020 02:39:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Tncd2rkB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1itUSZ-0001sT-Cm
	for alex.bennee@linaro.org; Mon, 20 Jan 2020 05:39:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37483)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1itUOv-00054R-Vw
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 05:35:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1itUOu-0002Bj-Pu
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 05:35:21 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:45769
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1itUOu-0002BE-Kf
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 05:35:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579516520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/YoKMG17GrqYtkuc78YXbVehm34fwjEw8DbFqXGYYW0=;
 b=Tncd2rkBxBm1yruTSqkoxp2SpdLPMTGLWmtoIFD6oFcbkDjL8sx3UjslbJToFVXptNcKpj
 5OQlF/3Sm5rSDVzwFm35SqxTZUUvOncbfmApRa8leTp6q7r+JSVXKRKauCEN1wsQWelUlA
 wur3Mp0sKQA7+HEBbKbmIlwAFsGnZio=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-MQFIOKZrMcehRLWu7otHJA-1; Mon, 20 Jan 2020 05:35:18 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18C43800D4E;
 Mon, 20 Jan 2020 10:35:17 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 340F0860ED;
 Mon, 20 Jan 2020 10:35:02 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/29] misc: use QEMU_IS_ALIGNED
Date: Mon, 20 Jan 2020 11:33:21 +0100
Message-Id: <20200120103340.25118-11-quintela@redhat.com>
In-Reply-To: <20200120103340.25118-1-quintela@redhat.com>
References: <20200120103340.25118-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: MQFIOKZrMcehRLWu7otHJA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Laurent Vivier <lvivier@redhat.com>, Corey Minyard <cminyard@mvista.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Andrzej Zaborowski <balrogg@gmail.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: paCRTNc+Y3K3

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
index 0f6b087f57..67e520d18e 100644
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

