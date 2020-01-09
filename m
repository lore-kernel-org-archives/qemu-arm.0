Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2263371lff;
        Thu, 9 Jan 2020 07:22:05 -0800 (PST)
X-Google-Smtp-Source: APXvYqx6CMXHfb/t8Xr6Uitn6DNhhM9hVPNLZ+ZluPtl53Ah/z7PzOplIs+iJxLpmRIXA5mVqgrd
X-Received: by 2002:aca:c74e:: with SMTP id x75mr3615736oif.140.1578583325458;
        Thu, 09 Jan 2020 07:22:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578583325; cv=none;
        d=google.com; s=arc-20160816;
        b=nWdl3SKn3GBQseaj8vVWpYjtiuncx7qWuqEL2byk7ha36Xg42fYDOLLFX241h6unoB
         um78jTch4KWuEp3i8WJ2tdDLtnbvrUP2m6KijrJJgB2BdruqLUCmBLsfJlKwNpdcPnm2
         0y+rc8UxsqHwn+imPd5wuocqLF6AY0y1zJQVbTAaSlivJAr1V+J5dTDfaQwqXCxxQAXf
         jwSEHNw6jnsfY92ZqjVwGeESy6zbqi/v8MVZkwL1CacF9NGe1VVKIyA2cdGn4RC+jEOX
         0Rx4IlYmlJHClEaDRm5VpsUTPs/VhQVGRNpZ8FRMHCYyV37blTFBjrO+IxQTdzwwYDD+
         C+oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=GkPqCUD4XkIHW5a1LsjZ+v2acwoaiMCCGZAUZ9gBdJI=;
        b=QVtXQkIWQD20rjAQSj2jU4/f+v4n+3DDR9NBxzTZZODgHQgeB0fAARM7CaawECZaIo
         njo2SDp1EuqYUzwnFHxTTz1+biMhBkUWywhNfKxIzUb2CyPP8MkazzP2Fob2VigWUPXy
         aDMEYLL3hc3IBQ+D+jwHq1ahQfW6imq3ig8QvvGXed87W9Whi/xJuvjMdaheuuhUGQQ+
         fuupDHcBfcHE/0L03IuGlXZC65iiVIUqnZrPQr2O+domlFNbxi7E0VU1cRQwCeHW0cLc
         n3s1V+9BtX3TIiRu8tm5+VDpSdKsRJrdmn2FqXSBbFpLQLAVf415ADjoijWFhal97nXC
         cm7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZqIs0MvK;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id s3si3502134oic.108.2020.01.09.07.22.05;
        Thu, 09 Jan 2020 07:22:05 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZqIs0MvK;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732318AbgAIPWE (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Thu, 9 Jan 2020 10:22:04 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:35072 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732315AbgAIPWE (ORCPT
        <rfc822;kvm@vger.kernel.org>); Thu, 9 Jan 2020 10:22:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578583323;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GkPqCUD4XkIHW5a1LsjZ+v2acwoaiMCCGZAUZ9gBdJI=;
        b=ZqIs0MvKBp3Jw6mqFNsuF4jFd0gLAmShCZq6B89inz9D1linMFjfSCGVJ/rRPx7c1tVJkn
        aJhhjfNArdgXWVvGSZJ/pJ5G5AXrRBUJkwkurgDsVLxxhQxgDQizzlcpRjSWD9uHLIxM2d
        ZTWtWLi9FBSOf23BMa3QbuIfH07EQv8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-Gscak5j0MSqJfyybuFHsGw-1; Thu, 09 Jan 2020 10:21:59 -0500
X-MC-Unique: Gscak5j0MSqJfyybuFHsGw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CAC11804910;
        Thu,  9 Jan 2020 15:21:57 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-180.brq.redhat.com [10.40.204.180])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 44F1180608;
        Thu,  9 Jan 2020 15:21:45 +0000 (UTC)
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
Subject: [PATCH 01/15] target/arm/kvm: Use CPUState::kvm_state in kvm_arm_pmu_supported()
Date:   Thu,  9 Jan 2020 16:21:19 +0100
Message-Id: <20200109152133.23649-2-philmd@redhat.com>
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
X-TUID: h1gWGF8TZsiE

KVMState is already accessible via CPUState::kvm_state, use it.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 target/arm/kvm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index b87b59a02a..8d82889150 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -181,9 +181,7 @@ void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
=20
 bool kvm_arm_pmu_supported(CPUState *cpu)
 {
-    KVMState *s =3D KVM_STATE(current_machine->accelerator);
-
-    return kvm_check_extension(s, KVM_CAP_ARM_PMU_V3);
+    return kvm_check_extension(cpu->kvm_state, KVM_CAP_ARM_PMU_V3);
 }
=20
 int kvm_arm_get_max_vm_ipa_size(MachineState *ms)
--=20
2.21.1
