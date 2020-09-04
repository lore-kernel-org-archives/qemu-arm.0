Received: by 2002:a0c:f381:0:0:0:0:0 with SMTP id i1csp2335456qvk;
        Fri, 4 Sep 2020 08:50:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyk+5d34HGvZXXY7h1kjBEk5u7sw6L/X85NgIBsvc2POgG8VBMJX/wGfJDcolfWogNFG9gy
X-Received: by 2002:a25:6b0e:: with SMTP id g14mr10646482ybc.429.1599234644431;
        Fri, 04 Sep 2020 08:50:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599234644; cv=none;
        d=google.com; s=arc-20160816;
        b=hSUFF3NZE+j3fVN2ETw4P5xoc0r43i60hjFrGkiK6qgV2ELuH3TkU4ZiwAU6pa9fjo
         lASnhf8oH/ulmTXZ5kwd2XejZZiELyuVCKPM+Sl/6Vd+m+g9VRp61Ak5WxgApl6YrLvh
         M89xiZQu8Bihyi6m0NICIiftj0L/QP7b/gq/5J0eEjiRScv5tdhMZaxv43EwsHnm2i+N
         m89o6iGqVwl95qp7V8F9XxfF7qKcCBlQzsA4aKxIsiQwgxk9mLY8NdIIRLBonFJh2Kky
         im5uLg2zug6Z9lhoax/0MkoPCjlPxFWVbk8U03UkM3fU2t6KRipbQBFYncIhDilSMDe3
         8mbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=QoQLqcCGXTEq/TAmIUw2m4awB0M5QrT2MRC6GDSSjNM=;
        b=Ji8v/FiHS/lb4wNOe028KcoI0llsYAUIexo03tkTBrO/QpseA4SnCfDTdQWuRdbKFx
         kkE2yIgioJ1JOb8vGkX1MobE8G10J5lxjIrVc7uXhQyr2fZxlWZx3bEvxsSCg7qO3rPS
         0aGJeSxvDVEFkuZ9s2OCcanUjIP+T3KHH7bH7PmAjYpfVvxrIt3YqvKBJMRQVPIOTB41
         K/UrrjeFSIAo0Jja42A9g1pNOrvH97zPIW7n+Hl2soU9P7R4NjwCX76cRYP0NZIIa3TD
         gHaFaW+FiofO05xF4UwFZ9BX3AbIKxujld7sgzvm6IDG37G3kFGdiyLlCGjeCKwxtmEU
         qNvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a5si6289270ybp.156.2020.09.04.08.50.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Sep 2020 08:50:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kEDz9-0001pg-Ub
	for alex.bennee@linaro.org; Fri, 04 Sep 2020 11:50:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kEDtb-0000nh-SK
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 11:44:59 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:34835
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kEDtZ-0007Q1-BF
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 11:44:59 -0400
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-rscFQFtPOS6JQl7WZuvTpg-1; Fri, 04 Sep 2020 11:44:55 -0400
X-MC-Unique: rscFQFtPOS6JQl7WZuvTpg-1
Received: by mail-wr1-f70.google.com with SMTP id b7so2458247wrn.6
 for <qemu-devel@nongnu.org>; Fri, 04 Sep 2020 08:44:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QoQLqcCGXTEq/TAmIUw2m4awB0M5QrT2MRC6GDSSjNM=;
 b=rb5dVcfZ2HQrg+h2qbiTDhUx0PrgEkS36FFfcY4hdgK+rsPKoK7nDhmwfuWnwJY5J6
 uFbX0/aMD+ErkULPkugvqSPMRv+QmcLHI0pmMIqBYAPXWPXplIcWHu/lAAP14Hv3rCWk
 nrlHrYsgxsSxJJBhwt0/dDL+iHD8vJLA3O7cT2GZhMIPNkZOWbHxGmeXO/NlRFD8wlS1
 mlg+nxYIN6IXi+lwtwAIoIOD/0PgG0fmAJ/VQ0Doa6wsHbaHpa+Qdh6bYgDgAlrOrK7q
 MV53EEJjN3OhIUKqv0qr1UZhvOUTtAOYA0CNJcFqi6y65SUDHnQg+usqOatNBJ+HMMr9
 bTPw==
X-Gm-Message-State: AOAM530AIiVYb1Jaby4m2VkBdCL7U2X7Uu1HWyg1rmsOIWhN2Wto6sBp
 A9LFfs5hokoSj8giF/9Ui/AD878qvGjEdOh0QgprhC1B+xgGYP/In5v0xM6fOecrBAo8esnimvh
 L0zIUtC2g5Y0S1T0=
X-Received: by 2002:a05:600c:2182:: with SMTP id
 e2mr8345376wme.102.1599234294309; 
 Fri, 04 Sep 2020 08:44:54 -0700 (PDT)
X-Received: by 2002:a05:600c:2182:: with SMTP id
 e2mr8345340wme.102.1599234294134; 
 Fri, 04 Sep 2020 08:44:54 -0700 (PDT)
Received: from localhost.localdomain (50.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.50])
 by smtp.gmail.com with ESMTPSA id n8sm12759448wra.32.2020.09.04.08.44.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 08:44:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 02/13] docs/devel/loads-stores: Add regexp for DMA functions
Date: Fri,  4 Sep 2020 17:44:28 +0200
Message-Id: <20200904154439.643272-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200904154439.643272-1-philmd@redhat.com>
References: <20200904154439.643272-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/04 01:57:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-block@nongnu.org,
 Joel Stanley <joel@jms.id.au>, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Andrew Jeffery <andrew@aj.id.au>, Laszlo Ersek <lersek@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xsdPp7BwXi9g

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 docs/devel/loads-stores.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/docs/devel/loads-stores.rst b/docs/devel/loads-stores.rst
index 9a944ef1af6..5b20f907e4d 100644
--- a/docs/devel/loads-stores.rst
+++ b/docs/devel/loads-stores.rst
@@ -477,6 +477,8 @@ make sure our existing code is doing things correctly.
 
 Regexes for git grep
  - ``\<dma_memory_\(read\|write\|rw\)\>``
+ - ``\<ldu\?[bwlq]\(_[bl]e\)\?_dma\>``
+ - ``\<st[bwlq]\(_[bl]e\)\?_dma\>``
 
 ``pci_dma_*`` and ``{ld,st}*_pci_dma``
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- 
2.26.2

