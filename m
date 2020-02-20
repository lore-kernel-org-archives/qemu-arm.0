Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp543965lfg;
        Thu, 20 Feb 2020 05:06:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqxs7T9y5HgYB3kAb2GTzEkoVbRaeSw6xeUnLZ7kdL4Gwgq16grzPHW+Sv6ofVi2MBn5gylk
X-Received: by 2002:aca:4f8e:: with SMTP id d136mr1830170oib.61.1582204016427;
        Thu, 20 Feb 2020 05:06:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582204016; cv=none;
        d=google.com; s=arc-20160816;
        b=mj6GO+YI0M46UGMq8XK2hsQDHvSbGNjqtR2dTJqHD0YYs4gkDDF1Pt0kcqfpurhyuG
         FAYZC2esIUcSRmNXqvsdXTUsVNl5ps/iPGN93lT+V8kbgTL8eB8dGloWSsUP82FsOyJh
         6OJRBx8rya2cGOWywHFHJDueIE/2cYX6nCXD9GIMmO5btZgd2QIqPvk/w3QgJN++x4mm
         bdfsXz0climRjIGntqQtrpaVl3ikVWiwiKE2QoRB/MJL2u95G3Qislm6U+1U4YgxBG7e
         Vv+BIrNjT3Lw7YTCUFPRLVvl+n7lGrIgCIKASiEXjQNZWH8/jYcQ2lm6eRgmanx2w5gj
         f4hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=U6IlttQWg5GixafQJKz3fjDa/v6plglwkRJYH67W75E=;
        b=SWovuPujzbAmsKY2ASh979Mgxse7xxH7aYKEc3m942VSmqqSaiFVcGS19wurXm0uHs
         0YzAmjCVRoCz8TrRQKVI9K7qxldT4dGe9Bcgcc3JbumqTKBWQkt65dNFESsgsR96IeKM
         BJUidK9K65dzsHyPzGk8NktJNO0i+n5J5ItBNj+Xxy02GwwpwjSDZJm0tGpqvYUrmRoP
         cL7dnzjjplztZoLlejJN2NdRXIqji/MrTtEwBQErJM2Hu4HkZKfQDC3vV6haERuDav+P
         NaM/yp9Lyo32v3ee6pkAdeW8Jimd5brZ2mCbA9XnRIBz8ltK96JDDCbshyXzuPU2TzAF
         DwUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DTEZOrRB;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id b2si1957201ots.284.2020.02.20.05.06.56;
        Thu, 20 Feb 2020 05:06:56 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DTEZOrRB;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728219AbgBTNGz (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Thu, 20 Feb 2020 08:06:55 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:36393 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728214AbgBTNGz (ORCPT
        <rfc822;kvm@vger.kernel.org>); Thu, 20 Feb 2020 08:06:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1582204013;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:  content-type:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=U6IlttQWg5GixafQJKz3fjDa/v6plglwkRJYH67W75E=;
        b=DTEZOrRBrMpSxM5rvwKDb7ENfDgZJyRYkUrciLoyMgW1TABiR6DbMEIL7Of2aICC1+b8TF
        MRdqcw7PO3gW4apjpT69pA70w64Re4VWH/NPjg/mN6W3jlCA6pa8HG8HSn8nCBc3utLzZX
        gdtUgox8zO7B2HL6He0PjBwAZfahNtA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-WbnwfNiSPeOcvi4GOdiR_A-1; Thu, 20 Feb 2020 08:06:51 -0500
X-MC-Unique: WbnwfNiSPeOcvi4GOdiR_A-1
Received: by mail-wr1-f71.google.com with SMTP id 90so1712288wrq.6
        for <kvm@vger.kernel.org>; Thu, 20 Feb 2020 05:06:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U6IlttQWg5GixafQJKz3fjDa/v6plglwkRJYH67W75E=;
        b=fR8zBBi/awUuF+JZuBvUizEeu2YYummwd3RQaU88qsBEtxWDZ2QR4X2Z48acGzNmPG
         0ffutIYZLWUt60K6CjHrngw66iHJ/GDlPw4SZd2657/Eg3SaWwEumCzRh2OmV76nntso
         6E8zhKb93C7OYLggossljDV0ZX0sh63TlMFaPqcpog67tCqJWAW+VbR9nqCX+VAOJe5s
         9b8zsjTneSbB4DUDN2KiOJtdS+PyXY5EYKxoMgwu8k0AGQsBOZPc//jn6unoyY0U8Lxc
         9jkzTL1gvcmZkQgVKiZboxvowf8XffIbVSg8goAdzy4p/73iymhVP+iCjELiwAkJN2BV
         iHcg==
X-Gm-Message-State: APjAAAVSNXIzlpGZecL6wFImf0/kWrLKidLwaP+pQzqrVE/RBZ+KtQ7m
        y1tChaFxjs7Qqc1rcHWTrX/qfXwEQl7l5ha7AADr2cmMIt0TiJYlZsBNUyMAx5ajL3nKX+CSBsx
        lEIvn5RjHAr/L
X-Received: by 2002:adf:cd92:: with SMTP id q18mr41684755wrj.261.1582204010378;
        Thu, 20 Feb 2020 05:06:50 -0800 (PST)
X-Received: by 2002:adf:cd92:: with SMTP id q18mr41684732wrj.261.1582204010138;
        Thu, 20 Feb 2020 05:06:50 -0800 (PST)
Received: from localhost.localdomain (78.red-88-21-202.staticip.rima-tde.net. [88.21.202.78])
        by smtp.gmail.com with ESMTPSA id b67sm4594690wmc.38.2020.02.20.05.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2020 05:06:49 -0800 (PST)
From:   =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To:     Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc:     "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Anthony Perard <anthony.perard@citrix.com>,
        Fam Zheng <fam@euphon.net>,
        =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
        kvm@vger.kernel.org, Laurent Vivier <lvivier@redhat.com>,
        Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
        Eric Auger <eric.auger@redhat.com>,
        Halil Pasic <pasic@linux.ibm.com>,
        Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        qemu-s390x@nongnu.org,
        Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
        David Gibson <david@gibson.dropbear.id.au>,
        Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
        Gerd Hoffmann <kraxel@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>, qemu-arm@nongnu.org,
        Alistair Francis <alistair@alistair23.me>,
        qemu-block@nongnu.org,
        =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
        Jason Wang <jasowang@redhat.com>,
        xen-devel@lists.xenproject.org,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Dmitry Fleytman <dmitry.fleytman@gmail.com>,
        Matthew Rosato <mjrosato@linux.ibm.com>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        David Hildenbrand <david@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Igor Mitsyanko <i.mitsyanko@gmail.com>,
        Paul Durrant <paul@xen.org>,
        Richard Henderson <rth@twiddle.net>,
        John Snow <jsnow@redhat.com>
Subject: [PATCH v3 15/20] exec: Let address_space_unmap() use a boolean 'is_write' argument
Date:   Thu, 20 Feb 2020 14:05:43 +0100
Message-Id: <20200220130548.29974-16-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200220130548.29974-1-philmd@redhat.com>
References: <20200220130548.29974-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: zmFsrIPf/tVt

The 'is_write' argument is either 0 or 1.
Convert it to a boolean type.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/exec/memory.h | 2 +-
 exec.c                | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index afee185eae..1614d9a02c 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -2329,7 +2329,7 @@ void *address_space_map(AddressSpace *as, hwaddr addr,
  * @is_write: indicates the transfer direction
  */
 void address_space_unmap(AddressSpace *as, void *buffer, hwaddr len,
-                         int is_write, hwaddr access_len);
+                         bool is_write, hwaddr access_len);
 
 
 /* Internal functions, part of the implementation of address_space_read.  */
diff --git a/exec.c b/exec.c
index 01437be691..16974d4f4b 100644
--- a/exec.c
+++ b/exec.c
@@ -3598,11 +3598,11 @@ void *address_space_map(AddressSpace *as,
 }
 
 /* Unmaps a memory region previously mapped by address_space_map().
- * Will also mark the memory as dirty if is_write == 1.  access_len gives
+ * Will also mark the memory as dirty if is_write is true.  access_len gives
  * the amount of memory that was actually read or written by the caller.
  */
 void address_space_unmap(AddressSpace *as, void *buffer, hwaddr len,
-                         int is_write, hwaddr access_len)
+                         bool is_write, hwaddr access_len)
 {
     if (buffer != bounce.buffer) {
         MemoryRegion *mr;
-- 
2.21.1
