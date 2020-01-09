Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2263798lff;
        Thu, 9 Jan 2020 07:22:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqyx87deCCVPTPVXYgxDhV1MWYog8rRnmrXsHBtSrbdcL7NWikw6LWxDMdky5nK0R1IfbVSo
X-Received: by 2002:a05:6808:1c5:: with SMTP id x5mr3580059oic.57.1578583340452;
        Thu, 09 Jan 2020 07:22:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578583340; cv=none;
        d=google.com; s=arc-20160816;
        b=EPhci5W/nvMHkzeaSImggWzBx2IOlpecBdqoyUYrnsqGmNX0hh3wSK1QZXmhiaqHZX
         mKqG1UIYh9vG8c+E8VuXaDrQDTFKwRUx+2Ca7xNsbSPOUCEUKx5u6mBGCb9yqJNpz+1G
         utTMeY4vNVM3b+kAQ7DJKO9pO8gBOpvc/54Zju3B2TaD3JUy6k3KvDhT0KNn/Yq2M5Af
         duHRA+DmMvBOCuYpv7i2vKvGGVjfmfb0Bgp8kwb3Kh2hu7rP5y9dZ2chHnVMBN9BB6SZ
         iq1XCLj7uLWyix1jY6Q1xZgNF5xZ3yplMtXchKBk4+tHp0/euVKaENeesfBNVNgDDX7t
         S4mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=pTyK0RkH4Fh+lVVih8pnoyvDLJN5sQWece676cWX4f0=;
        b=VCz+fsD77OxWr/4406JHg1tIr0qsx3McuUoGdCL/7aKO/zQfNfx1AfdZKovXmNCRvw
         F4ts3l7FdjDRdeYdF+WezP+eaEuSTT29khwQWBvuFfkskGT1BY9e07MNH7uh2+YxeQJ+
         08RNpLvw9za1Y8Kj6XItovGLa3qKVtyJ6oMFbozLppAMnKsblnbT9lhp6LIKKx4lUE9B
         0nkQAxcSEaChOnDxrILVuANv/8LwxabzTOPoOjcD9aG/v0oMEmC493GwFv7F9KiDPWpj
         1/e95lHBw6kWvNCcAUzNt4gCdicC67emRBM70vo3v5L+wYQkpZGYaXp//DP0jrvSOY8p
         y2BQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=M1OEzjgK;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id s3si3502134oic.108.2020.01.09.07.22.20;
        Thu, 09 Jan 2020 07:22:20 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=M1OEzjgK;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732324AbgAIPWT (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Thu, 9 Jan 2020 10:22:19 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:30165 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1730877AbgAIPWT (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 9 Jan 2020 10:22:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578583338;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pTyK0RkH4Fh+lVVih8pnoyvDLJN5sQWece676cWX4f0=;
        b=M1OEzjgK1zzSPcNHc47HEPHVuRFuFirmGv5jWu7XmvdZTvflw/52wk8OqQck6mtl/gFe7d
        hs95+d4ZLyFf9mw0fI80wgttVJ+KtSFZd0QIOjp64UblflQE2ao87jNaSzNthDIqGgO0B8
        /OshY6KXBrnVRwwkpSEzdadiNJc6Xeg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-D1AieJqTN1iFHthYdYV9Lg-1; Thu, 09 Jan 2020 10:22:14 -0500
X-MC-Unique: D1AieJqTN1iFHthYdYV9Lg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21BF4107AD4F;
        Thu,  9 Jan 2020 15:22:13 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-180.brq.redhat.com [10.40.204.180])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 056111CB;
        Thu,  9 Jan 2020 15:22:06 +0000 (UTC)
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
Subject: [PATCH 03/15] hw/ppc/spapr_rtas: Access MachineState via SpaprMachineState argument
Date:   Thu,  9 Jan 2020 16:21:21 +0100
Message-Id: <20200109152133.23649-4-philmd@redhat.com>
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
X-TUID: ZVmi8pRbu9bO

We received a SpaprMachineState argument. Since SpaprMachineState
inherits of MachineState, use it instead of calling qdev_get_machine.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/ppc/spapr_rtas.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
index e88bb1930e..6f06e9d7fe 100644
--- a/hw/ppc/spapr_rtas.c
+++ b/hw/ppc/spapr_rtas.c
@@ -267,7 +267,7 @@ static void rtas_ibm_get_system_parameter(PowerPCCPU =
*cpu,
                                           uint32_t nret, target_ulong re=
ts)
 {
     PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cpu);
-    MachineState *ms =3D MACHINE(qdev_get_machine());
+    MachineState *ms =3D MACHINE(spapr);
     unsigned int max_cpus =3D ms->smp.max_cpus;
     target_ulong parameter =3D rtas_ld(args, 0);
     target_ulong buffer =3D rtas_ld(args, 1);
--=20
2.21.1
