Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2264985lff;
        Thu, 9 Jan 2020 07:23:19 -0800 (PST)
X-Google-Smtp-Source: APXvYqxgn9nigjLaUqLBqk+QttmjAf13HFPzdRqWtLpOonDrC33ZyEcM+3jvCmnntZsdew2rM+zc
X-Received: by 2002:a05:6808:486:: with SMTP id z6mr3609296oid.117.1578583399234;
        Thu, 09 Jan 2020 07:23:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578583399; cv=none;
        d=google.com; s=arc-20160816;
        b=BgRYBzNR1u+0XgCUjI6/it/K8nbyJk5IHES1ZBJ3HaZfQL+zkMXhBVMRZPyCmYRjtt
         /6IjFVu9o5ahstQl1sYrO6NVsEbSTFfwDuGk2TzvZsBTwE508A1oejcCf43iDNRIRRqx
         lDgQT00QoAuM/ophI9WxVxN4x8Wmug2Co/j9IvYSYhbVkloDKcYS3ZaiJ16aPkSA6QlR
         q8xbiTfC0ME2OyEgCVsOiKpXghNlEOSq5d1oN8DUvgadQnwhRN4v/9yOB2RsR5bLd9gp
         2kzGwf2sdXrO3yW7+EqolxROV1Sldh6o6vMJRNdPoSuh9wBLG9TM3WtM3d9cvNN/Ji3o
         BRgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=BOe6/URSftxgo5ESkRc2DJBElz4tXj5Z8utyHCtsD8A=;
        b=nIdSHWYFsNe9z/PHXWNf7lgtkmao4JHarQpUCKKsApkhsMvM3bjJq0YU7NHeD3mAVM
         6wLWpAIGxjZhL+HlVtiE8SxNAb72vdrweVVUNS4u5squbQE5/y8BqYP0zvaP7L0DHg0w
         oa9JKx0PZc1o4PFz94BsySJkUQd+fytAe8VLrDmdvegJMZHTuhHy/J2A4zlWFU30Fv4m
         k/fyMgSEkgqcOdA1nlLMORNpGaDfXcKfmjIO60V/y1qbkTmFU1wDGAg0jXBpxidLCSb+
         4JewfRKgjL4KUbOcTcqYe7r7aGjOqv7lnQMp1gsL80w63VI3PTYoOi5QInjM7PLLkNuh
         hI3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RQKdjH2v;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id c10si4241517otr.88.2020.01.09.07.23.19;
        Thu, 09 Jan 2020 07:23:19 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RQKdjH2v;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732360AbgAIPXS (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Thu, 9 Jan 2020 10:23:18 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:53402 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1732358AbgAIPXR (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 9 Jan 2020 10:23:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578583396;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BOe6/URSftxgo5ESkRc2DJBElz4tXj5Z8utyHCtsD8A=;
        b=RQKdjH2vFMBWkXFR1vH8Px3wLfPEeyCAYVOlECXZhwA0wI4TBxNB4aUHU7JqAlnKz+/fu/
        /6fVSoQBRFPcava8nOAfZocHjZcpqmQa2yHP5ITONMAhx5GkPTytlLnmlTk8C6Fmg858kW
        00uOnRGOZucuHRXL7rDd+S/4jZbkJN4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-QJIASVVyPyuGiKmHhZaWnw-1; Thu, 09 Jan 2020 10:23:15 -0500
X-MC-Unique: QJIASVVyPyuGiKmHhZaWnw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B137DB20;
        Thu,  9 Jan 2020 15:23:14 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-180.brq.redhat.com [10.40.204.180])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C5AC80618;
        Thu,  9 Jan 2020 15:23:04 +0000 (UTC)
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
Subject: [PATCH 11/15] exec: Replace current_machine by qdev_get_machine()
Date:   Thu,  9 Jan 2020 16:21:29 +0100
Message-Id: <20200109152133.23649-12-philmd@redhat.com>
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
X-TUID: R6HA2jSgKXcO

As we want to remove the global current_machine,
replace 'current_machine' by MACHINE(qdev_get_machine()).

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 exec.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/exec.c b/exec.c
index d4b769d0d4..98f5b049ca 100644
--- a/exec.c
+++ b/exec.c
@@ -1984,11 +1984,11 @@ static unsigned long last_ram_page(void)
=20
 static void qemu_ram_setup_dump(void *addr, ram_addr_t size)
 {
-    int ret;
+    MachineState *ms =3D MACHINE(qdev_get_machine());
=20
     /* Use MADV_DONTDUMP, if user doesn't want the guest memory in the c=
ore */
-    if (!machine_dump_guest_core(current_machine)) {
-        ret =3D qemu_madvise(addr, size, QEMU_MADV_DONTDUMP);
+    if (!machine_dump_guest_core(ms)) {
+        int ret =3D qemu_madvise(addr, size, QEMU_MADV_DONTDUMP);
         if (ret) {
             perror("qemu_madvise");
             fprintf(stderr, "madvise doesn't support MADV_DONTDUMP, "
@@ -2108,7 +2108,9 @@ size_t qemu_ram_pagesize_largest(void)
=20
 static int memory_try_enable_merging(void *addr, size_t len)
 {
-    if (!machine_mem_merge(current_machine)) {
+    MachineState *ms =3D MACHINE(qdev_get_machine());
+
+    if (!machine_mem_merge(ms)) {
         /* disabled by the user */
         return 0;
     }
--=20
2.21.1
