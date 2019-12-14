Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2316293lff;
        Sat, 14 Dec 2019 07:57:27 -0800 (PST)
X-Google-Smtp-Source: APXvYqyEsgLkhlFXTKzCylEvWohTbg6rgN5N19ufZaWakt3kw3Y8DtQTuvMakpKGqgze9VbBNsEN
X-Received: by 2002:a9d:730e:: with SMTP id e14mr20214469otk.62.1576339047107;
        Sat, 14 Dec 2019 07:57:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576339047; cv=none;
        d=google.com; s=arc-20160816;
        b=Z05uJOPOKuTpefjXLSpgfI7GhmJlRucw3MhkvM8b77Yyqv7DQFtX4RgZF0COy3Cu5S
         7avJQm5pD6gwJ56JwS0pJ5/x4AQQiV39mQ9QSNSc0GKaR4cMc0xFRBQ7Goy2dZhCHghv
         SKuDqfSIlT+vSdp3kSz2aLdW1gY8bqex5CPxWlq0Bs5E3kzkjzMnk80vPV6U/v8J1xHw
         jWuQ9FlpVGp23xwyDiVHSYnUmC6Q4QSmR9boawUjw7JtUdLWSnaePr8hmxiPK7HvpJLr
         Nr21KILhrJumRxOfw6VKN7a33yB8aeYOOzwb0jDgwOoJKdcyL1l9fx5dZiX7H3Ke9fie
         kVLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=MiLtQtAFIR7WooqjFNP7RA7pxFuVPXkVzD1becE3SHU=;
        b=BXqajcLIE+sNMuIjQC/FBWTMtHYOsAPkk9wCleHQbg+cDGcBwTB3XKRYk2VyDN15Qh
         Z0s5cD3FAkyF8q3aMHlNIuuEhKnRoh3W1qxpzW3M38V1xFBeEjgLUhz+KVwmpi6HOz3E
         HEIjn7hVguKDwQOFlQ9L7NnO38y3HUwy+5PNh/MIMeo+uz6mFeTOh+ZdzxaAspoTCVvP
         o3LVe6qe3y96nNC+3nW0PfGFwZXQ4LcPAvLnAo0/TvwWZF2ulNGt9NsoklAOhXHXvStR
         8VboV6WjnKY7oEK6hY8SrlfDmnGZxKgOo2lZ7pDzWnvlmkSrTxrEqr2U9/eIB46ospTt
         h8cg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ll43n+D1;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id a205si7330504oii.95.2019.12.14.07.57.26;
        Sat, 14 Dec 2019 07:57:27 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ll43n+D1;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbfLNP50 (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Sat, 14 Dec 2019 10:57:26 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:48655 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726757AbfLNP5Z (ORCPT
        <rfc822;kvm@vger.kernel.org>); Sat, 14 Dec 2019 10:57:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1576339045;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MiLtQtAFIR7WooqjFNP7RA7pxFuVPXkVzD1becE3SHU=;
        b=Ll43n+D1FitT+k9IpwIm5jGEFts9W5C5JtNFhj1exmAuN+weshRSKK0942a+hyW2/55DHk
        xovQdD15XPluA7I55lBUNRTfnUkzS8kAiVipe1nKkWCnzwO8aY2R6gesiL0lC7z7+LsGqn
        BJ3w0qyou8NDiPUvK09m1IU3O5WTFSY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-95-GUjV9-9vPW2uksM1tC2tFw-1; Sat, 14 Dec 2019 10:57:21 -0500
X-MC-Unique: GUjV9-9vPW2uksM1tC2tFw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B6CA801E53;
        Sat, 14 Dec 2019 15:57:19 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-147.brq.redhat.com [10.40.205.147])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F5D75D6A7;
        Sat, 14 Dec 2019 15:57:09 +0000 (UTC)
From:   =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To:     qemu-devel@nongnu.org
Cc:     Peter Maydell <peter.maydell@linaro.org>,
        Andrew Baumann <Andrew.Baumann@microsoft.com>,
        Aurelien Jarno <aurelien@aurel32.net>, kvm@vger.kernel.org,
        Alex Williamson <alex.williamson@redhat.com>,
        Aleksandar Markovic <amarkovic@wavecomp.com>,
        Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Alistair Francis <alistair@alistair23.me>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Richard Henderson <rth@twiddle.net>,
        Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
        Paul Burton <pburton@wavecomp.com>,
        Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 3/8] hw/arm/xlnx-versal: Use memory_region_add_subregion() when priority is 0
Date:   Sat, 14 Dec 2019 16:56:09 +0100
Message-Id: <20191214155614.19004-4-philmd@redhat.com>
In-Reply-To: <20191214155614.19004-1-philmd@redhat.com>
References: <20191214155614.19004-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: U6oXunuar4EW

It is pointless to overlap a memory subregion with priority 0.
Use the simpler memory_region_add_subregion() function.

This patch was produced with the following spatch script:

    @@
    expression region;
    expression offset;
    expression subregion;
    @@
    -memory_region_add_subregion_overlap(region, offset, subregion, 0)
    +memory_region_add_subregion(region, offset, subregion)

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/xlnx-versal-virt.c | 3 +--
 hw/arm/xlnx-versal.c      | 4 ++--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index 462493c467..901e9ed86c 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -437,8 +437,7 @@ static void versal_virt_init(MachineState *machine)
=20
     /* Make the APU cpu address space visible to virtio and other
      * modules unaware of muliple address-spaces.  */
-    memory_region_add_subregion_overlap(get_system_memory(),
-                                        0, &s->soc.fpd.apu.mr, 0);
+    memory_region_add_subregion(get_system_memory(), 0, &s->soc.fpd.apu.=
mr);
=20
     s->binfo.ram_size =3D machine->ram_size;
     s->binfo.loader_start =3D 0x0;
diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
index 8b3d8d85b8..538d907f8a 100644
--- a/hw/arm/xlnx-versal.c
+++ b/hw/arm/xlnx-versal.c
@@ -281,8 +281,8 @@ static void versal_realize(DeviceState *dev, Error **=
errp)
     memory_region_init_ram(&s->lpd.mr_ocm, OBJECT(s), "ocm",
                            MM_OCM_SIZE, &error_fatal);
=20
-    memory_region_add_subregion_overlap(&s->mr_ps, MM_OCM, &s->lpd.mr_oc=
m, 0);
-    memory_region_add_subregion_overlap(&s->fpd.apu.mr, 0, &s->mr_ps, 0)=
;
+    memory_region_add_subregion(&s->mr_ps, MM_OCM, &s->lpd.mr_ocm);
+    memory_region_add_subregion(&s->fpd.apu.mr, 0, &s->mr_ps);
 }
=20
 static void versal_init(Object *obj)
--=20
2.21.0
