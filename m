Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2265984lff;
        Thu, 9 Jan 2020 07:24:14 -0800 (PST)
X-Google-Smtp-Source: APXvYqyN3wCCuAlb5KYpQXKTV6lLNypjCjt6ybgWaIWWM/pcIii2mjLOuQArJqeZUYnfK51AZt8c
X-Received: by 2002:a05:6830:151a:: with SMTP id k26mr9392709otp.74.1578583454582;
        Thu, 09 Jan 2020 07:24:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578583454; cv=none;
        d=google.com; s=arc-20160816;
        b=iXRFYXqVB4BK5w2sU2j7v8tYK4T+U1Dtv1yblvPSaxI+t6hHna7JXwaoDCMEXPEKIc
         U9NghIktofeDGU8xNo44mAQ6b4QrIGa16icLbw4r3B7IPmKbzFu3KdgxGKT1Plr7yxtY
         wV79HpUqAXqL09WNysB0j8hV/VqD9nuUv4YpPq61C1+S43oVOdHSdEhJ/l7ayK5gCEkB
         WgWdav3FQOtvJkHnrjuMeE1VABG24uAzmZ+Aiv+k0BSB91sdvZNNoEAXZk9qP5yey3gK
         5OyC4aUFzmJXP7D3k/8yRb7smbB8LJheTx8S5zfONZOE90MXXKB52C7n6ZPoFPNN4HI0
         UIDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=4kUKKeAf2s8djmV5zny/Aq4FrGtcS96wgzcVBqpzxsI=;
        b=lTHNs17WphyfME32UrK0qfbBt4Zlb4m0tJ9hyUjcoal0t60JNIex3oPucGrhJhTrh3
         AlwI/XP0W+GvDnL4i3ZPR2vqehTbmODUyGeZ4Ik3SMmKBEWdruIWgVtHFL2kaGv9VHGd
         ofpNVO9P4FszYTxoAYTT4ichNkTbstqwFT/b2i4wvSdM7l9YGq95KxmrRNEGXZfxQnos
         1OsCVUS79gHEQHnBKCnjQ22Y7CBwGCnxJCIG0Z9F1i+VeJJPizGhBYyHiVIsihoLpwlc
         UUrPatAsj8Yr8YqYjIOVlK6J+AIgACa1AaxDqqrywa+ENQjVICs0OHg5lRhBcqcJcjld
         I9EA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=awADI+23;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id m17si4406200otr.17.2020.01.09.07.24.14;
        Thu, 09 Jan 2020 07:24:14 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=awADI+23;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732397AbgAIPYN (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Thu, 9 Jan 2020 10:24:13 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:39566 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1732359AbgAIPYN (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 9 Jan 2020 10:24:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578583452;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4kUKKeAf2s8djmV5zny/Aq4FrGtcS96wgzcVBqpzxsI=;
        b=awADI+23+mRuH3DuMavjWTmLx4Rsz9WqVlveitTGbOnsJZd2ZgGekd6zbLvrfW0zkpq6jE
        pHXHCqMZjAJGluzZoZTmcyfR6jrr9/1gGIm02vO+cbJ8zfx/tAlzfcFfFRx3Uv0XvCTom3
        GckhdnhRiS2ulFYp2UKvgIatTXeRZsY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105--h2u7_6uOF6RjR-my6orjA-1; Thu, 09 Jan 2020 10:23:45 -0500
X-MC-Unique: -h2u7_6uOF6RjR-my6orjA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E57231800D4E;
        Thu,  9 Jan 2020 15:23:43 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-180.brq.redhat.com [10.40.204.180])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id EE46980608;
        Thu,  9 Jan 2020 15:23:36 +0000 (UTC)
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
Subject: [PATCH 15/15] vl: Make current_machine a local variable
Date:   Thu,  9 Jan 2020 16:21:33 +0100
Message-Id: <20200109152133.23649-16-philmd@redhat.com>
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
X-TUID: iTHgngha9iqx

Since we now only use current_machine in vl.c, stop exporting
it as a global variable in "hw/board.h", and make it static
to vl.c.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 include/hw/boards.h | 2 --
 vl.c                | 4 ++--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 61f8bb8e5a..b0c0d4376d 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -59,8 +59,6 @@ void memory_region_allocate_system_memory(MemoryRegion =
*mr, Object *owner,
 #define MACHINE_CLASS(klass) \
     OBJECT_CLASS_CHECK(MachineClass, (klass), TYPE_MACHINE)
=20
-extern MachineState *current_machine;
-
 void machine_run_board_init(MachineState *machine);
 bool machine_usb(MachineState *machine);
 int machine_phandle_start(MachineState *machine);
diff --git a/vl.c b/vl.c
index 3ff3548183..7a69af4bef 100644
--- a/vl.c
+++ b/vl.c
@@ -214,6 +214,8 @@ static int default_sdcard =3D 1;
 static int default_vga =3D 1;
 static int default_net =3D 1;
=20
+static MachineState *current_machine;
+
 static struct {
     const char *driver;
     int *flag;
@@ -1164,8 +1166,6 @@ static int usb_parse(const char *cmdline)
 /***********************************************************/
 /* machine registration */
=20
-MachineState *current_machine;
-
 static MachineClass *find_machine(const char *name, GSList *machines)
 {
     GSList *el;
--=20
2.21.1
