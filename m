Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp5211594lfc;
        Mon, 8 Jun 2020 09:11:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4AzbSKTVbQfbyzQ3XICB/KmFUBqcZ13q0Tjkop9/j6QZyrkvkVZEhNVq++5V+KQQh7v8G
X-Received: by 2002:a25:4e0a:: with SMTP id c10mr36600086ybb.346.1591632703227;
        Mon, 08 Jun 2020 09:11:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591632703; cv=none;
        d=google.com; s=arc-20160816;
        b=AegIPsCFr9oM42QxuPCcl0VgC13qDXFOqzDbzqgOrZ+ESah7JdAVbFijQ92N2Qcb/5
         TLcd0kyH2btMIJoTu+Y8gEOovVoxiN4RZnjvpiQgQQlBAJy7bTyPp+8odXFEl9vVgRc3
         1Ga5xW5A1yTbbVtmTWiHsmhDEW5uT7MXLWzBL2+D4Ikxs+I8e7VJReuXwDlIkGXT2m40
         c5LQc0ANCJBSTYkGy/0LWRjALPocJtq5Rk+ZjttLCoSoTZ0nAfzRrlvQoBTCtkcrn9x2
         Gkl9cvYapg9B6pxdJE9l9G35kFkrlEjmHGOmgofIuv5Os7EdpU9MqgFondrl1nC1VZAr
         vomg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=jOyQYXnEE/P1L9M062K4OG7LDuRa+UfsKXeI8IczatQ=;
        b=MMqDyYt7h3rlmNJlpa5X/AT5b6GMitlJh4bC30Pnx8F5x6U9baohGR1JtNcDOSH+GA
         fLa29A7vxOzpfkDqdv1I5jbHovXD5lZ+hoqQA3JTWQjgk+VyXqtQ/2hJPT4ap0JdSo0l
         gybUnpznM/1nkWUDVi/1gifgNb6qBAVv3tsjGi2JAUIa/gl8e/wBfSpvLy8NA2vvFDB/
         1wskQvYGr/u6j+Ud0u7UpRoiizEYcafhii0hSSPkP+/c0xYcyRPFWnO5rtYjA56LZQbe
         x8P0y1fyaFqAZkBSRYWpkHlgVkI6ZxG9VMBxKnDtxWV1qB6u3QR6tnDNvZ71xkoltqI3
         4cSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="fefb/B0s";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m64si46530ybm.304.2020.06.08.09.11.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jun 2020 09:11:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="fefb/B0s";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jiKNC-0002TL-HA
	for alex.bennee@linaro.org; Mon, 08 Jun 2020 12:11:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKE7-0006if-Rv
 for qemu-arm@nongnu.org; Mon, 08 Jun 2020 12:02:19 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:34448
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKE6-0007qn-KZ
 for qemu-arm@nongnu.org; Mon, 08 Jun 2020 12:02:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jOyQYXnEE/P1L9M062K4OG7LDuRa+UfsKXeI8IczatQ=;
 b=fefb/B0sEevutDY78MH/2UWOO1i+K3MTugRIojbNgaC0LB3ka6Od5kXlv2cFhVWzBordYC
 eAm5dOgPRh237pcCnOZMDQeM0dkczuLjQDMKXws10lrLJp31LXmSOhbVNmZM8LSWXBZy7Q
 ShFTX6ewNBX5+gNJpFhxAGvcnhBJ+Ho=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-N58IN7thODaWkNU0M3mLoQ-1; Mon, 08 Jun 2020 12:02:13 -0400
X-MC-Unique: N58IN7thODaWkNU0M3mLoQ-1
Received: by mail-wr1-f69.google.com with SMTP id h6so7395989wrx.4
 for <qemu-arm@nongnu.org>; Mon, 08 Jun 2020 09:02:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jOyQYXnEE/P1L9M062K4OG7LDuRa+UfsKXeI8IczatQ=;
 b=sdnPxAJC/wX9PhTcjMOLsRbZ9GFoJGyOpUciekvcTgjrCFloI1Ls28fFs/MHfg0IFI
 tZG04ntdyrGNzE4MWz4OhI8lfE/TLNi5FHGObx9eFBLKzHzPG0q2oxmfTPdjFmbbtKaq
 Iw8fGcN+YKcRI/Fss0JhtK1Y46nfnO0UWjqSOis015xC7U339IcdcKOx3s/BK85ETaLC
 43tdqLkhP+XMcs1+AoNEeUefB18FTdFS2nb/Pcp3+aSQ0eMl473KJ9JCQXmiGtec8yL4
 V0NXPYzl3a/HWg+WOYcRxuqKQG3ACXEGF+ATZmkwvg6TrGKUwu0jyf+Qf9dshRGB65us
 vdbg==
X-Gm-Message-State: AOAM532IcELFoegPpnEkHUGgWFu1lW0U2hmSszhFegffmIfVSsfRKpjg
 867RSo8WGwBpAf0wYIHIWjWOjJ8duuJ/EI2Gn4xzIQHBylsXRUiXb9E/59JFNIJfQCGhRIPKCYt
 S4pGzoQb9Swks
X-Received: by 2002:a05:600c:2256:: with SMTP id
 a22mr82485wmm.18.1591632132283; 
 Mon, 08 Jun 2020 09:02:12 -0700 (PDT)
X-Received: by 2002:a05:600c:2256:: with SMTP id
 a22mr82438wmm.18.1591632132052; 
 Mon, 08 Jun 2020 09:02:12 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id z25sm31297wmf.10.2020.06.08.09.02.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:02:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 15/35] hw/i386/xen/xen-hvm: Emit warning when old code is
 used
Date: Mon,  8 Jun 2020 18:00:24 +0200
Message-Id: <20200608160044.15531-16-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200608160044.15531-1-philmd@redhat.com>
References: <20200608160044.15531-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 05:40:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>, Magnus Damm <magnus.damm@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Andrzej Zaborowski <balrogg@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org,
 Stafford Horne <shorne@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <rth@twiddle.net>,
 "Daniel P . Berrange" <berrange@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hq9vyZ88q9N6

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/i386/xen/xen-hvm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index 82ece6b9e7..a1163b1529 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -31,7 +31,7 @@
 #include "sysemu/xen-mapcache.h"
 #include "trace.h"
 #include "exec/address-spaces.h"
-
+#include "hw/qdev-deprecated.h"
 #include <xen/hvm/ioreq.h>
 #include <xen/hvm/e820.h>
 
@@ -1401,6 +1401,8 @@ void xen_hvm_init(PCMachineState *pcms, MemoryRegion **ram_memory)
     xen_pfn_t ioreq_pfn;
     XenIOState *state;
 
+    qdev_warn_deprecated_function_used();
+
     state = g_malloc0(sizeof (XenIOState));
 
     state->xce_handle = xenevtchn_open(NULL, 0);
-- 
2.21.3

