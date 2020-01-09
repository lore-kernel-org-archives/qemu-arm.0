Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2263566lff;
        Thu, 9 Jan 2020 07:22:12 -0800 (PST)
X-Google-Smtp-Source: APXvYqwevM4pv/l1agsOLLPQI0JyRr6IsLFNl7pAOP0GpNe121n6t/582yBFOur1QMeyVz0O1x8H
X-Received: by 2002:aca:1b01:: with SMTP id b1mr3298005oib.6.1578583331849;
        Thu, 09 Jan 2020 07:22:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578583331; cv=none;
        d=google.com; s=arc-20160816;
        b=AZI01F9zqtzM1rZR4JnLtXT/GelRd2KXTxo5pRp+TWewILGNLo5SrzxNcfzrqJY60j
         0KK6orjIimU5J++HOZ4rTB2TftS/nUf+Zx+b/bIIl5riK0xlHZjjq/SZZ4JSV8/A15sF
         Cr2+Ynugvj2DwKfxI9kvx95izOas2o717bzFVNvWXn9RBrMnsjsi198NkDohDjun0ZEb
         uMlik4hTSwQN+LNuNNSz66NTI7JZQmEk6TPgY7p61PmIT4G/0yPTVMAIw4AxGd1GDqtJ
         +AFdNGf7aD9cxFX8y0UldD69bOl3ArcBMIXSUF57TWpcJ1kTrI1kfsi9w+clGNqJ0SMf
         qBfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=PFxwKx/EwWB9jWEmX25bQbJoh6dZfyi7mRbJMrwlqJg=;
        b=lqkv/dKVjoS0DjD0kVOS3Rwn0CEFACRoYf5Obnfu6mtOm6VPA2qTkE42PFLrQsXMb4
         a5bDM/vf4U846m0n7OUaM+bS303Y4L5X5FVdSuoasjP/XWnFcZuJTgKn7AfvvrYM0scu
         ASPrgbqGMI21HG2az8mNkBUmJayJ+RNLYi4ppy5fm0SWROwUrPr2VFvh1j4LBKUnBONr
         DK5c2zcGbZP3VIjh6QfJPNANuKxC1yWMDzUAivO+1LJBmLpc/5gJSgeFPT+BRlIPDcEr
         blYSrxdXSQRRgthnr50wfQDNAZi2x6sHUAmYdQl/2wltNhZXWJnqip6/2eY5wHxg1hfx
         gBuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="aL/ASJTl";
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id s3si3502134oic.108.2020.01.09.07.22.11;
        Thu, 09 Jan 2020 07:22:11 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="aL/ASJTl";
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732319AbgAIPWK (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Thu, 9 Jan 2020 10:22:10 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:31099 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730877AbgAIPWK (ORCPT
        <rfc822;kvm@vger.kernel.org>); Thu, 9 Jan 2020 10:22:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578583329;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PFxwKx/EwWB9jWEmX25bQbJoh6dZfyi7mRbJMrwlqJg=;
        b=aL/ASJTlYVVycmt7uIsgyJ0EqCN0BwdCoHjAA1N9qxJerG+WaxcDCCD8e1SCg8o/aN6fGo
        myXFD75FiCtnESRjwF0VaX79iSUHwia4rounKKsfms8yWyqvky4keIjda+Odhdeq21F58l
        VymrkYCoECYyzPx04y8F0SdjDb/yY8A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-ZZvT6K0CM--HmXa-1GHyTQ-1; Thu, 09 Jan 2020 10:22:08 -0500
X-MC-Unique: ZZvT6K0CM--HmXa-1GHyTQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 677F3184B1F1;
        Thu,  9 Jan 2020 15:22:06 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-180.brq.redhat.com [10.40.204.180])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 586DE1CB;
        Thu,  9 Jan 2020 15:21:58 +0000 (UTC)
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
Subject: [PATCH 02/15] hw/ppc/spapr_rtas: Use local MachineState variable
Date:   Thu,  9 Jan 2020 16:21:20 +0100
Message-Id: <20200109152133.23649-3-philmd@redhat.com>
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
X-TUID: 1idQYdjtf/g/

Since we have the MachineState already available locally,
ues it instead of the global current_machine.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/ppc/spapr_rtas.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
index 8d8d8cdfcb..e88bb1930e 100644
--- a/hw/ppc/spapr_rtas.c
+++ b/hw/ppc/spapr_rtas.c
@@ -281,7 +281,7 @@ static void rtas_ibm_get_system_parameter(PowerPCCPU =
*cpu,
                                           "DesProcs=3D%d,"
                                           "MaxPlatProcs=3D%d",
                                           max_cpus,
-                                          current_machine->ram_size / Mi=
B,
+                                          ms->ram_size / MiB,
                                           ms->smp.cpus,
                                           max_cpus);
         if (pcc->n_host_threads > 0) {
--=20
2.21.1
