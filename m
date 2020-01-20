Received: by 2002:a0c:cd0f:0:0:0:0:0 with SMTP id b15csp2728193qvm;
        Mon, 20 Jan 2020 02:38:19 -0800 (PST)
X-Google-Smtp-Source: APXvYqyD5UmJSzcpGIIV+x1mli4URxpk9vJP8aQlj0vLAg1VYYddDd7GgHJcTJeVRKnOW52kGKjc
X-Received: by 2002:a50:f70c:: with SMTP id g12mr16638980edn.142.1579516699758;
        Mon, 20 Jan 2020 02:38:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579516699; cv=none;
        d=google.com; s=arc-20160816;
        b=xeOqJElGiczYDNa3YHyZOOjAGnr/6ZxJ2R79lLKq85rcOdTLt7aNX70CK7B0NL4h7T
         F/AIDGMtq5PYHPtj+R8TqeCXQG7YKuJm8+xDnef2FsgTkhZijnaaKYBF5iB4jSetdZc+
         stvcapnqTp2ylgE3B1clkzmT5jxTTkIPHCdEzHQd0X9xe3juzMoBcN/8ayfw5bi4phxO
         V7PoTM+bfDwcUpIx5bAX/GTmK7MTKE2VIdhGaHj/AvNSvjHgckUhCNJcWj4XtQp7SuG1
         dmB5y4gGKQpnAupdKcXTytRGpz5pLKRYybwfZto0UX23cwL1dl6M9mGOrPlXFy0LDEgI
         EWlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Gth6HgeBtm9m3j/RQs1vFvXMgMZzag5+vNo4Gw77A4E=;
        b=DNhNZ+bpVFCPg7s36NsQwWnoL7H1oXToBFWJEtXfD+XdETD4DrqStVHNcFk4W9xhZo
         P88SHy7DrNl9Aa0vVZdv0yyNfRjCOy6TTr82M81Cv+8ubitSGwjYq4HirBNP4PSnYKel
         wD4CbZRGSGE7oxPoRK0gSynej97lMwxaxKd1Nzkvz4CVuZA+m5tnIdcmrPTVl0QMZcA0
         Yml/G7cGwliB5m/pBbnTXwp7xL4h5C8OL4sYKyB07A5Bhg/MK4Bh1Addb2gsdjw6lIg1
         cP7+PC96DUAQgXQpugo/cqGVKL8rg3xoDXBkV/b1CjlAjNBo+FZ3z1DvrPQAW89KLM2L
         rxog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=V0Hj69Co;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g1si19965096ejk.19.2020.01.20.02.38.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jan 2020 02:38:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=V0Hj69Co;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1itURm-0008Be-8T
	for alex.bennee@linaro.org; Mon, 20 Jan 2020 05:38:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37069)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1itUNv-00047C-AX
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 05:34:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1itUNr-0001Pb-8f
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 05:34:19 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:28802
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1itUNr-0001PA-3j
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 05:34:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579516454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gth6HgeBtm9m3j/RQs1vFvXMgMZzag5+vNo4Gw77A4E=;
 b=V0Hj69CoVL/NawgDdkrJ5x2stiUBnYZrHXMrMMBDRp6XJNN8oNjXf+Kuea/S4RicYMs/yC
 9HUJPl8hbCW/mnY//UKs6zXMRG5Se7yISoR40WOg5dENrx3nbGaS5RiHpwGxtkQGGu++4H
 n53Kwt771rfrsk43v9hEpg7dI1ZYAoI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-E_D3WvT9PfSL_MmnulwhFA-1; Mon, 20 Jan 2020 05:34:13 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E8F391083E83;
 Mon, 20 Jan 2020 10:34:11 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A3DA5860E5;
 Mon, 20 Jan 2020 10:34:00 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/29] migration: Make sure that we don't call write() in case
 of error
Date: Mon, 20 Jan 2020 11:33:14 +0100
Message-Id: <20200120103340.25118-4-quintela@redhat.com>
In-Reply-To: <20200120103340.25118-1-quintela@redhat.com>
References: <20200120103340.25118-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: E_D3WvT9PfSL_MmnulwhFA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: Laurent Vivier <lvivier@redhat.com>, Corey Minyard <cminyard@mvista.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vlfyP6a4/3Vi

If we are exiting due to an error/finish/.... Just don't try to even
touch the channel with one IO operation.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/migration/ram.c b/migration/ram.c
index b9147bcca3..f946282adb 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -900,6 +900,12 @@ struct {
     uint64_t packet_num;
     /* send channels ready */
     QemuSemaphore channels_ready;
+    /*
+     * Have we already run terminate threads.  There is a race when it
+     * happens that we got one error while we are exiting.
+     * We will use atomic operations.  Only valid values are 0 and 1.
+     */
+    int exiting;
 } *multifd_send_state;
=20
 /*
@@ -928,6 +934,10 @@ static int multifd_send_pages(RAMState *rs)
     MultiFDPages_t *pages =3D multifd_send_state->pages;
     uint64_t transferred;
=20
+    if (atomic_read(&multifd_send_state->exiting)) {
+        return -1;
+    }
+
     qemu_sem_wait(&multifd_send_state->channels_ready);
     for (i =3D next_channel;; i =3D (i + 1) % migrate_multifd_channels()) =
{
         p =3D &multifd_send_state->params[i];
@@ -1009,6 +1019,16 @@ static void multifd_send_terminate_threads(Error *er=
r)
         }
     }
=20
+    /*
+     * We don't want to exit each threads twice.  Depending on where
+     * we get the error, or if there are two independent errors in two
+     * threads at the same time, we can end calling this function
+     * twice.
+     */
+    if (atomic_xchg(&multifd_send_state->exiting, 1)) {
+        return;
+    }
+
     for (i =3D 0; i < migrate_multifd_channels(); i++) {
         MultiFDSendParams *p =3D &multifd_send_state->params[i];
=20
@@ -1118,6 +1138,10 @@ static void *multifd_send_thread(void *opaque)
=20
     while (true) {
         qemu_sem_wait(&p->sem);
+
+        if (atomic_read(&multifd_send_state->exiting)) {
+            break;
+        }
         qemu_mutex_lock(&p->mutex);
=20
         if (p->pending_job) {
@@ -1224,6 +1248,7 @@ int multifd_save_setup(void)
     multifd_send_state->params =3D g_new0(MultiFDSendParams, thread_count)=
;
     multifd_send_state->pages =3D multifd_pages_init(page_count);
     qemu_sem_init(&multifd_send_state->channels_ready, 0);
+    atomic_set(&multifd_send_state->exiting, 0);
=20
     for (i =3D 0; i < thread_count; i++) {
         MultiFDSendParams *p =3D &multifd_send_state->params[i];
--=20
2.24.1

