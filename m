Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2264801lff;
        Thu, 9 Jan 2020 07:23:08 -0800 (PST)
X-Google-Smtp-Source: APXvYqwuFVlmSDx4ggQZwLv/TFRURVPcFv2vOxIJ6wrsoBr6qruDufn5dOr97AqaCAXsLWW55kWA
X-Received: by 2002:a9d:7984:: with SMTP id h4mr9022237otm.297.1578583388720;
        Thu, 09 Jan 2020 07:23:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578583388; cv=none;
        d=google.com; s=arc-20160816;
        b=dbdqIy+04ripDpJadUOhO/HLWIrr75mT9IVe0ihitwzY4AzGZOfXNXOU6FErwMU44T
         xyXRMhwXzAlobqHWnXgpUCalo2/lOonAfO0AMV0bQ7kt6UVbtrVWrCAqPX5Q3BViZx8A
         fKkeqOxkXu59WCenCB6DOL6fmVOgsyjh+cMJpyTOXUB6oBJ5jU1phiWmpmhYaXRZ07ep
         w4Z8YX238BxBXIp7fScv3os2JuxBxhulqsDaYdM1MsPnLPlBHG/xu/OhHsomD5cg6daw
         7gEXoyNhOS1Swx6CGyYXvlkpjoYEVhEQM9GhGUfpiYgvfFdQuxW9xy3bSsNvf+zWApk9
         gOLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=ZEMOGD26t+fMYjJ4LobtAf8vZNWvIS3QswsuquGMzqE=;
        b=G3+XFMngWe/ZcNjnJ+HY9k3ubTRntBM8e2R7zv+CAyHkgHbMr1poTus2xF85+tvRdP
         /TuanbUBXDGWt3Mycx9E2HwCBsHgjN9VqJIN16BcU4KjdGmFtBOFb+Es///YPV62girS
         Ivyvj0r13o3betd6NTRGegtxBDJ/keSE+W+z+Utt1WC6/qRLUurkcV45ywegWMxnEvVq
         hxjNTNn0oyvelmTOnWvIxMQ6FK8X39fC5kz8n05PDX6rUezes1KW1jVgkj0pcNge/2MU
         dxAExf9yDNjAtpzq2Tn3VdxEGkcnsPedlculUQzhN5eIH0COZE4mCLWeBg9MhNScUOZQ
         k5kg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XUPBzeEr;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id s3si3502134oic.108.2020.01.09.07.23.08;
        Thu, 09 Jan 2020 07:23:08 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XUPBzeEr;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732347AbgAIPXH (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Thu, 9 Jan 2020 10:23:07 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:37125 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732344AbgAIPXH (ORCPT
        <rfc822;kvm@vger.kernel.org>); Thu, 9 Jan 2020 10:23:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578583386;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZEMOGD26t+fMYjJ4LobtAf8vZNWvIS3QswsuquGMzqE=;
        b=XUPBzeErMU4voED02hCBgbSNJbEX5rPbNJdT3z+AgyeVO84x5TvQciFuNx61X2TxPArZcf
        No6DIR1wlg5Jnn+yXA0snHobfINsnKxvZ6EqHPlpFOf3JGakg7sOgSOKaswc8N8tkAnmXE
        NlreojCh8ndelr5G0iFedjeM9ZNriyM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-wgHZV1PxPwGTHcuUwuI7bA-1; Thu, 09 Jan 2020 10:23:05 -0500
X-MC-Unique: wgHZV1PxPwGTHcuUwuI7bA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6C531005513;
        Thu,  9 Jan 2020 15:23:03 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-180.brq.redhat.com [10.40.204.180])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 9CF5F1CB;
        Thu,  9 Jan 2020 15:22:58 +0000 (UTC)
From:   =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To:     qemu-devel@nongnu.org
Cc:     Marcelo Tosatti <mtosatti@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
        Eduardo Habkost <ehabkost@redhat.com>,
        Juan Quintela <quintela@redhat.com>, kvm@vger.kernel.org,
        Paolo Bonzini <pbonzini@redhat.com>,
        Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        Alistair Francis <alistair.francis@wdc.com>,
        qemu-ppc@nongnu.org,
        "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
        Richard Henderson <rth@twiddle.net>,
        David Gibson <david@gibson.dropbear.id.au>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 10/15] memory: Replace current_machine by qdev_get_machine()
Date:   Thu,  9 Jan 2020 16:21:28 +0100
Message-Id: <20200109152133.23649-11-philmd@redhat.com>
In-Reply-To: <20200109152133.23649-1-philmd@redhat.com>
References: <20200109152133.23649-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: PRhFVrLH3qzc

As we want to remove the global current_machine,
replace 'current_machine' by MACHINE(qdev_get_machine()).

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 memory.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/memory.c b/memory.c
index d7b9bb6951..57e38b1f50 100644
--- a/memory.c
+++ b/memory.c
@@ -3004,6 +3004,7 @@ static void mtree_print_flatview(gpointer key, gpoi=
nter value,
     int n =3D view->nr;
     int i;
     AddressSpace *as;
+    MachineState *ms;
=20
     qemu_printf("FlatView #%d\n", fvi->counter);
     ++fvi->counter;
@@ -3026,6 +3027,7 @@ static void mtree_print_flatview(gpointer key, gpoi=
nter value,
         return;
     }
=20
+    ms =3D MACHINE(qdev_get_machine());
     while (n--) {
         mr =3D range->mr;
         if (range->offset_in_region) {
@@ -3057,7 +3059,7 @@ static void mtree_print_flatview(gpointer key, gpoi=
nter value,
         if (fvi->ac) {
             for (i =3D 0; i < fv_address_spaces->len; ++i) {
                 as =3D g_array_index(fv_address_spaces, AddressSpace*, i=
);
-                if (fvi->ac->has_memory(current_machine, as,
+                if (fvi->ac->has_memory(ms, as,
                                         int128_get64(range->addr.start),
                                         MR_SIZE(range->addr.size) + 1)) =
{
                     qemu_printf(" %s", fvi->ac->name);
--=20
2.21.1
