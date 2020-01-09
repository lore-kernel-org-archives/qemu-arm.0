Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2263961lff;
        Thu, 9 Jan 2020 07:22:26 -0800 (PST)
X-Google-Smtp-Source: APXvYqzfuFZqAah7Z63uc8fkdQAM/QKazQBBbpaoejSmlcgtILM4kLy34NE+zbHYeyU3sWP6yvcs
X-Received: by 2002:aca:f1d4:: with SMTP id p203mr3430326oih.116.1578583346788;
        Thu, 09 Jan 2020 07:22:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578583346; cv=none;
        d=google.com; s=arc-20160816;
        b=U2+owC/SVh2cSsgBsIc4/0C5ILM9olmdb5Ypw122Lxd6YKfKgnGNtJQHYiYBrvDNRe
         7uPfMGlZWmyW+Vo/5Leeh8X9bBWYM/h2XHlpH2H5iUx+/nlHsYh1QdM4h2++11wQPOwk
         VqgSdQWXWrXeVsDd3xOqaBTft5wCATYZupstVlJ/lfLT3ntArhilU9hbNVtUZGPodUhO
         4lQRJHjQd9fFqvi71g2fUYGj4m+Ku0pNsiB5+CtuGYlV1bFxtbf0jpGmzOfvaphHYMdc
         BAJM3BJcqUxX/BcfbdHcGgM/b8i2Xze/y3GZ9OGUdQeU5k6t8Qi/rXLnaFGqZlqOlGdN
         V9BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=rw8jmxMoDMD+mDmAS1YaT70WlRmZEqpVqIIhKc3uSz0=;
        b=KSt3jYBTy2sR4B5wPduDEBkvrlGIr4AzTiWyXaCEM7low4A8FUFW1wGyNp/IPzHUqE
         3tdgxHxSFLouXsR6nm4ivWfcLWvN06Ws9cNUgKHIg20gXtBv8d/Chptku2sX3GykIo2O
         4QME02nEPcnwfw4G3ncQpG2UYMxP63g7v6lZhrQNoFXLP0Ib9VP3UzvImTCoyQZ0QsY3
         zyo0ARC1rCiYACh3kKjP0wLCjmE9P5vSXkwXsNcoY/R6Qr/+cW7cLg2L3z86e833SfNd
         X8GjTx3CZQBQtAsiriBXnSw42o2ubHhXTPSdV9Qp6m+IImwsFF7jw2gzQn+r5V7VC8Dh
         MzUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NsuRFMXw;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id s3si3502134oic.108.2020.01.09.07.22.26;
        Thu, 09 Jan 2020 07:22:26 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NsuRFMXw;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732326AbgAIPWZ (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Thu, 9 Jan 2020 10:22:25 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:45380 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1732321AbgAIPWZ (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 9 Jan 2020 10:22:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578583344;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rw8jmxMoDMD+mDmAS1YaT70WlRmZEqpVqIIhKc3uSz0=;
        b=NsuRFMXw10c27DpYwdMjuaE75U4GUzN8t4rl2J/5J/TVusKNblW9i1/iH2uRF3jOpSM56d
        3cJysVQFCK2CtWzhdnhN1KAOfTazUYxyAF6U0YSSZMhoddf5NmfIyuQMb3I2eA1QEby7DX
        hY2C+30sT8hLEH5Kb8dSXMb4kogupaI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-7u9vL7X1MXy5Q1TcHaePyA-1; Thu, 09 Jan 2020 10:22:21 -0500
X-MC-Unique: 7u9vL7X1MXy5Q1TcHaePyA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE915477;
        Thu,  9 Jan 2020 15:22:19 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-180.brq.redhat.com [10.40.204.180])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id E5EAA1CB;
        Thu,  9 Jan 2020 15:22:13 +0000 (UTC)
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
Subject: [PATCH 04/15] hw/ppc/spapr_rtas: Restrict variables scope to single switch case
Date:   Thu,  9 Jan 2020 16:21:22 +0100
Message-Id: <20200109152133.23649-5-philmd@redhat.com>
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
X-TUID: tv+wXcyflz3h

We only access these variables in RTAS_SYSPARM_SPLPAR_CHARACTERISTICS
case, restrict their scope to avoid unnecessary initialization.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/ppc/spapr_rtas.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
index 6f06e9d7fe..7237e5ebf2 100644
--- a/hw/ppc/spapr_rtas.c
+++ b/hw/ppc/spapr_rtas.c
@@ -267,8 +267,6 @@ static void rtas_ibm_get_system_parameter(PowerPCCPU =
*cpu,
                                           uint32_t nret, target_ulong re=
ts)
 {
     PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cpu);
-    MachineState *ms =3D MACHINE(spapr);
-    unsigned int max_cpus =3D ms->smp.max_cpus;
     target_ulong parameter =3D rtas_ld(args, 0);
     target_ulong buffer =3D rtas_ld(args, 1);
     target_ulong length =3D rtas_ld(args, 2);
@@ -276,6 +274,8 @@ static void rtas_ibm_get_system_parameter(PowerPCCPU =
*cpu,
=20
     switch (parameter) {
     case RTAS_SYSPARM_SPLPAR_CHARACTERISTICS: {
+        MachineState *ms =3D MACHINE(spapr);
+        unsigned int max_cpus =3D ms->smp.max_cpus;
         char *param_val =3D g_strdup_printf("MaxEntCap=3D%d,"
                                           "DesMem=3D%" PRIu64 ","
                                           "DesProcs=3D%d,"
--=20
2.21.1
