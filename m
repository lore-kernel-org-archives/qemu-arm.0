Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp3159851lfc;
        Mon, 1 Jun 2020 07:34:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXV5os4V4SKx3w9nn3yUBIOzEweATx3k4xaLuqKIDRq6sd8d3LHYqDsJ3lnINpEpRavHqD
X-Received: by 2002:a25:9ac4:: with SMTP id t4mr11597937ybo.356.1591022074421;
        Mon, 01 Jun 2020 07:34:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591022074; cv=none;
        d=google.com; s=arc-20160816;
        b=SehaWJtwzknkTfO5VQ8dI9Jnzj211lnIDTstyDHan3nOj5sohk7uYKYovbiBsQuB2u
         k8nCetIF2oXnC4IoAukj7hKcxUyZncBjN9fGPaV7Bvpsvq41wb+O7cMGnEHLhOLjsVfa
         WFb7a4b1fvg1QdnlCkfmp1rrs6LFNY3Gd1UMi/vrhFdiDrH8BAt2a122yQmmEfjZBnD8
         tWFNJB2cwDTtzrMZuCXH9l0k2k6+x41hJ1p07xkQIx6X+HzdpLzMDatwa8x9Ge8f1BpH
         N8I4owfaODhU6d38oq6CMQ7FwXhQ1Awb/g8cAS5DJRVmfXEMAcOBMZSCIiO62TLcx9LM
         6ZCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=vBrOLTqq31ej2e44mSMA9447regWRi/096me+XUNWFc=;
        b=I6pxneifeAzc663kE4EQ8qjH+2LDY/Q6ygvff8U9Fw8+MIq+Fg1s9e23IPdxPvO7pH
         NtCqTXEJMajsdiSIVPV5dGjqrdFtrmbHy3Onjq/oDmrbNClXfauxThiQyfDMgfiohOXc
         VoCkuDlifOy2WCGrWPMgHD2DhSpBypTbGKZtRiifTrCIORUZ1GW/EOKk20PTovEFMib2
         /8KvZmkwScWYjx5TOiPk4xbQqsDyvXsjZRZfkIERyT0OFSgDOeWqF4FzjZQG3wBuNS/S
         nv5h+HnzuA22L+0U1goVYa3uPlYh7SqzkGfOFzrJru86Kcjcaim5JKzvnXzYXXbNtDyD
         m/+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aYp6jMcb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q4si6826488ybk.222.2020.06.01.07.34.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jun 2020 07:34:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aYp6jMcb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:54764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jflWL-0000C8-NG
	for alex.bennee@linaro.org; Mon, 01 Jun 2020 10:34:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jflRb-0002Nt-7f; Mon, 01 Jun 2020 10:29:39 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:36049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jflRa-0002ag-GM; Mon, 01 Jun 2020 10:29:38 -0400
Received: by mail-wm1-x343.google.com with SMTP id d128so11621861wmc.1;
 Mon, 01 Jun 2020 07:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vBrOLTqq31ej2e44mSMA9447regWRi/096me+XUNWFc=;
 b=aYp6jMcbZt1EvSCtzGVSDvw0LjOVZN9U9J6IPOWER7nZTfo2AJX9+2u9BbzugNhsHn
 Y37qYszwgtSp5Vi9meiZMPRCBrru/b392x/XySILcHH864UsCPa7D4edh2DtjgMpgeQF
 KB7IfsR9l+RvEZ41vlpb8yOXOfnby9TjY8pU9epCl8a2EIRP3GOpubRy0xq+tjioH92Q
 ZdZKA/fD+8ONkO9XePvj6FRtCYXyfnGwh41bJX2ZwRt55t3Wk2i7NgF8TKRcQ/D5WHp8
 c0MPNHyco0u+zIe2mvXsvW8NO9B/YVxgKM1DhZ0+Xu714KN+vQ5Tl3CCM4/snBRMzpJh
 MyCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vBrOLTqq31ej2e44mSMA9447regWRi/096me+XUNWFc=;
 b=fGsNop/JAoY1oQuDeZLT983YOe3/ZvOQcfH7JF2pJ0qZ6LWspR/VF9OUd/3WGRKMio
 ZEyr80F0EnnZQF3d9ysXoES4joSoCPzr13a/9VU89RC8+HqPEzow1Zq4DMl7iQoqbydN
 /vaF2Tfm5WWjTrt87B+qWDl/6T119ixmHXReiYzRZD9E26KxDb1HdPxky7ijnHZmZ0d9
 AWd8DI7vnnN7yYUMt7HWkZ293feaQw2ltCu6Ss42SV6OY7nHb5EXtnkl/bXuUgBkiE95
 Gp36UQGv1nDnhFVVQyO+MhZsnyo4Ta7PqtC3FWcXqwSo1hOUADfbOFK02McJMFbT7Q+j
 cmxQ==
X-Gm-Message-State: AOAM533jUn3SSDbiDS18Bh9vGbDRXWpOZyVTB1RnYlcWHKa8X236fmS+
 DlKUgSsNUH8YHoBbiKlTDMQ/p2ol
X-Received: by 2002:a1c:814c:: with SMTP id c73mr21234151wmd.140.1591021775955; 
 Mon, 01 Jun 2020 07:29:35 -0700 (PDT)
Received: from localhost.localdomain (43.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.43])
 by smtp.gmail.com with ESMTPSA id u12sm6824954wrq.90.2020.06.01.07.29.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 07:29:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/8] hw/pci-host/prep: Correct RAVEN bus bridge memory
 region size
Date: Mon,  1 Jun 2020 16:29:24 +0200
Message-Id: <20200601142930.29408-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200601142930.29408-1-f4bug@amsat.org>
References: <20200601142930.29408-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Helge Deller <deller@gmx.de>,
 Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Richard Henderson <rth@twiddle.net>, qemu-ppc@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UK0WsTW2fj8f

memory_region_set_size() handle the 16 Exabytes limit by
special-casing the UINT64_MAX value. This is not a problem
for the 32-bit maximum, 4 GiB.
By using the UINT32_MAX value, the bm-raven MemoryRegion
ends up missing 1 byte:

  $ qemu-system-ppc -M prep -S -monitor stdio -usb
  memory-region: bm-raven
    0000000000000000-00000000fffffffe (prio 0, i/o): bm-raven
      0000000000000000-000000003effffff (prio 0, i/o): alias bm-pci-memory @pci-memory 0000000000000000-000000003effffff
      0000000080000000-00000000ffffffff (prio 0, i/o): alias bm-system @system 0000000000000000-000000007fffffff

Fix by using the correct value. We now have:

  memory-region: bm-raven
    0000000000000000-00000000ffffffff (prio 0, i/o): bm-raven
      0000000000000000-000000003effffff (prio 0, i/o): alias bm-pci-memory @pci-memory 0000000000000000-000000003effffff
      0000000080000000-00000000ffffffff (prio 0, i/o): alias bm-system @system 0000000000000000-000000007fffffff

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pci-host/prep.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/pci-host/prep.c b/hw/pci-host/prep.c
index 1a02e9a670..88e2fc66a9 100644
--- a/hw/pci-host/prep.c
+++ b/hw/pci-host/prep.c
@@ -294,7 +294,7 @@ static void raven_pcihost_initfn(Object *obj)
                              &s->pci_memory, &s->pci_io, 0, TYPE_PCI_BUS);
 
     /* Bus master address space */
-    memory_region_init(&s->bm, obj, "bm-raven", UINT32_MAX);
+    memory_region_init(&s->bm, obj, "bm-raven", 4 * GiB);
     memory_region_init_alias(&s->bm_pci_memory_alias, obj, "bm-pci-memory",
                              &s->pci_memory, 0,
                              memory_region_size(&s->pci_memory));
-- 
2.21.3

