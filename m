Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5400723lff;
        Tue, 14 Jan 2020 03:48:09 -0800 (PST)
X-Google-Smtp-Source: APXvYqzk9U0UP1lDW7lSsrDx/NhGveisINr/Ius5T6F1t/4KW52cF5Ta1u/ycQ1XlgfaeZluMIbg
X-Received: by 2002:a37:2751:: with SMTP id n78mr21771193qkn.177.1579002489670;
        Tue, 14 Jan 2020 03:48:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579002489; cv=none;
        d=google.com; s=arc-20160816;
        b=uXpeTt4BX4CWiHhdf/M0pKUDNiFnJpCSbFC5cfsO0iMUS82OSUEHg39aoPWHVzvcRb
         TC51s9JwUf395WhJQZDN1/IZ93tvpA+yeL+joX7+0wNj2KOtr8q6+PFXvLGQm4Euc7tF
         h+4/Dtnisz2kM2iY3bmpNUffD2vxmXgCvHlrA4+Du4qmf6AN3Y6qLpQ4QQjyXeLRTUyE
         0LVA9dB+yqIPzwpN0Wyp2UIpgVI0XZOMCp2Cdwjcs5xlQzsepkx9M/QvMztFpVHek8Vc
         IApL6lTPj2hjjjacPYGZFL6Xju0v0zqSGVrBwQ27UEewuXM91Hz41r52huxuuaDUtmrf
         K13g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=2p0QKCeBS4+LZOVYBokhIHTSESXgTmLYzL/BOFYcXF4=;
        b=yJjIa7M2pPHJUtOtzJViuvGYXg2XXK65y3CGGOleK+08my4JXGutYbCyItd7LLBy1V
         nTeZSMATHz/aDw9hHjEKKtcOBP/wjzwJTv4n0uGZYi7CjwFpn/v9jL2yWkiBDLWv9Yd4
         qPH0s0u62VExO6QhWLrW2kmCCN/FjkfgLkrIlQOQrDwfwpeaI5HAhwUh3HpoTv/C2tMk
         gGAjIeVdPayL8TjHCz3E9FrihtQ/dmTKD4OjLdwf2GePHnwU3uc4A0YrEoLEnOfiRPz0
         p00w1S/aCuz6S8aukvC+K9+G8ZbG0g/z2yRrxhYVnkCj2BxXQ4Y8y48yRO3tZKS4iwqi
         YDnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hmjz9ymp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f8si8095779qkg.353.2020.01.14.03.48.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 03:48:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hmjz9ymp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irKg4-0005Wn-8K
	for alex.bennee@linaro.org; Tue, 14 Jan 2020 06:48:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55871)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1irKZK-00062N-OV
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 06:41:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1irKZG-0003K3-RB
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 06:41:10 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:25998
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1irKZG-0003Jn-NR
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 06:41:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579002066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2p0QKCeBS4+LZOVYBokhIHTSESXgTmLYzL/BOFYcXF4=;
 b=hmjz9ympJRJFfhbsNBI9g4vSDcwz6xv0YnuP2lo3O1VrppJGLIPIMpjmbUc68rU6Z1ZWCh
 CceYtUUuKBKuuiog1xthEcINndwclV5TuRmOAH4RswLq1qKxRvHJRzNlM2FgP/tTpFmTJ9
 b0hqm4PkgPUUPWqilzCJ5BxvSbHPw6c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-ntt8jjWmMDWoeiEGC3oXjA-1; Tue, 14 Jan 2020 06:41:04 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B7D551800D48;
 Tue, 14 Jan 2020 11:41:00 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 41C0E5DA70;
 Tue, 14 Jan 2020 11:40:56 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/30] misc: use QEMU_IS_ALIGNED
Date: Tue, 14 Jan 2020 12:39:07 +0100
Message-Id: <20200114113926.3556-12-quintela@redhat.com>
In-Reply-To: <20200114113926.3556-1-quintela@redhat.com>
References: <20200114113926.3556-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: ntt8jjWmMDWoeiEGC3oXjA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Richard Henderson <rth@twiddle.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Jason Wang <jasowang@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QwiAomp2QXuM

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

