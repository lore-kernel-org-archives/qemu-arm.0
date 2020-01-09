Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2265420lff;
        Thu, 9 Jan 2020 07:23:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqw7TDN9Jf4ZtqZdPBDRy0HSkmhuZL9yXWHrfj1RPpx8tmkxsQUjmM8A5bR3Oae1CSU50LyQ
X-Received: by 2002:a9d:73d9:: with SMTP id m25mr9051337otk.350.1578583424027;
        Thu, 09 Jan 2020 07:23:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578583424; cv=none;
        d=google.com; s=arc-20160816;
        b=hY7hefvBBjbUv5LONIPyP60tcCeSDQAITdmB4w6Vt9zHL+j4A3bmiPiNjvHNHGeFWi
         Dpj+ct+AiWUCfJGHa5UjVrymKHThBjVv6yEqIgefEoF2w/CYZgrFJIT3B8iSZhkMdmy6
         2dlqx4pTAuNHUkOJh8GbaLGoenw1tndcIPK3bOKB5eQtWr4+y0UcF0a27ZJyttgmzsc6
         Gtaf0cf/OgNPOjMrN9UEdlfxKlNCpOv1LxRBAFeFJjSwVWw4uw8J2wxg/tI7SjPiTNjW
         7ydqO02WYpTGosl94I7xDZLWtGTAktRX2hV8qNJzL+JQj++GSaJDWqr9ErW8BGT+mYRZ
         sKpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=vNApPi1X+zRXACouBoiVidpyff+gUxoQCsbtOGpF3sA=;
        b=c9XISAIr3W2Bh04iXsrnmIO61UqegX5dCOLTG2TNtIToQ6Zc5AQzJnkWo6z+zBGyWA
         l//7/0JO4l7rD5y5w4yO3Kobpu9d8vSEMOBlv9lz5cRerT1M164qCrAHkC7RaQmWnFHs
         MVrGuuCPwdXQWJ0JQAVwOjlRDyFQUvAlDPZNzupOTcxYfpjHIhLampvQXBrVC2EUgz5O
         XKHvddYN3Xzdy7rxCXxHM6jGCbZf7OQrNmoSurg2z+ktYl1iR0ND2l3L221zrSUvkvz8
         NW79qDCkJICOdk3G2OGJKZUStc7Fd7QpnrxevJqq82a3bZwwtu700NB9rGo/8dhyoiAc
         rqOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gwNh8iYR;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id e24si4308779oti.247.2020.01.09.07.23.43;
        Thu, 09 Jan 2020 07:23:44 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gwNh8iYR;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732387AbgAIPXm (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Thu, 9 Jan 2020 10:23:42 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:34595 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732382AbgAIPXm (ORCPT
        <rfc822;kvm@vger.kernel.org>); Thu, 9 Jan 2020 10:23:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578583421;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vNApPi1X+zRXACouBoiVidpyff+gUxoQCsbtOGpF3sA=;
        b=gwNh8iYRfNmQxJftqIx4be9cPMJ18IZdMRGUfzLrNqUetGnnQacLbeUkYujHB190pBiNdn
        7KRvlmKS93z3tnrCcPVWOuv7k4Ko55RyA8GzTGU9I42pwNycuCzV2jBP6yTPspsvKZUFc8
        8+LkbdbW31m3veb8URKxynzMa6Rp8/0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-okIuNwqmOrWMJxTPVr8mUw-1; Thu, 09 Jan 2020 10:23:37 -0500
X-MC-Unique: okIuNwqmOrWMJxTPVr8mUw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41CB0DB20;
        Thu,  9 Jan 2020 15:23:36 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-180.brq.redhat.com [10.40.204.180])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BA467FB5C;
        Thu,  9 Jan 2020 15:23:27 +0000 (UTC)
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
Subject: [PATCH 14/15] accel/accel: Replace current_machine by qdev_get_machine()
Date:   Thu,  9 Jan 2020 16:21:32 +0100
Message-Id: <20200109152133.23649-15-philmd@redhat.com>
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
X-TUID: 1ahVQOLeFc6R

As we want to remove the global current_machine,
replace 'current_machine' by MACHINE(qdev_get_machine()).

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 accel/accel.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/accel/accel.c b/accel/accel.c
index cb555e3b06..777d6ba119 100644
--- a/accel/accel.c
+++ b/accel/accel.c
@@ -65,7 +65,9 @@ int accel_init_machine(AccelState *accel, MachineState =
*ms)
=20
 AccelState *current_accel(void)
 {
-    return current_machine->accelerator;
+    MachineState *ms =3D MACHINE(qdev_get_machine());
+
+    return ms->accelerator;
 }
=20
 void accel_setup_post(MachineState *ms)
--=20
2.21.1
