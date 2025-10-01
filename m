Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16003CAC5BB
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Oct 2025 08:23:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3s6N-0000dK-MK; Wed, 01 Oct 2025 04:22:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3s6L-0000c1-Ca
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 04:22:17 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3s63-0005TT-DX
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 04:22:17 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-46e61ebddd6so6465545e9.0
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 01:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759306911; x=1759911711; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eFKaDNxEC0b5kIZOWsLuJtJEztvf4NT+IrhHLczSREU=;
 b=n4b/vTmGXzs91ems6wB6mUFZ2uX1YMnDlNEEhEH7QtQ06wF0j8xdT6t/PsDnmVFRRq
 R2Wws9QeByVhHFdcnzg6yTnAPCYfvYXslkQeb0VDWiEjTinOIAjZ7zOyjned3+QdhchR
 D2BynukI9VRseE73axpXpP9Z6SeMhCOo/wAkffU2LklOESUEto1o2azlD91TdSuTKMmf
 wBeoAjmDnIkT9VMhu3lEll991UcDLd40z/SaSkHJBjqrLJ+lhlITNHQ1fipjKQQee1pU
 Wi1ftV/vYOfzUkrAGfe/MGAhFUNAAsBm5byHbSAFyJDuhpjRLgPbzm3imTYZMPJetZNt
 +ezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759306911; x=1759911711;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eFKaDNxEC0b5kIZOWsLuJtJEztvf4NT+IrhHLczSREU=;
 b=nNdk6LeSVeV5rU/RXGIBwhqvLERTjAvHSsSnj25r0HiDwQODfaLa1LshkNIJO09sj8
 RIxUgyOp40tpPPe7OVvi+ZE8M/KHgqQuFyzXG6lgkpT5C4QXBFI5vnB3CWSEnaoheo8q
 zhr3HkpT4lhieDB1P74z0MXmajNn2/cpmKAG7b4Db1is+nV62gHF7O4ucIWMOnovI58A
 eBvEsM8AtocRgaiNjrQhYj3lvsfQYRM0IP3HJBKRP/o9Jt3b6euR1EwYfXu4A3trgBZO
 qqadZu7r3Z9Z4pxCL16WwCt80yQxS+cRwpNuww/KwLHhBgl0A+tFJbnZw2zxLeKomnn5
 81dQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXl69S7e27ybb/fTE1BflY+JENdpNl+7+Su8jIxF9MK89Q6KPtgHrObssD5mmG8xNBTsCm1Og43GA==@nongnu.org
X-Gm-Message-State: AOJu0YwQYECXUqtJa4I3z+nkGGrEG97e6iJ9EK88G2LjGOF+Eyz1Wtq0
 4OrOUdgctIyJDtfoTnZYaWs+v97QN5b465ObTOy5zMywYUX87X4DIQ5c/0fuXlorFxY=
X-Gm-Gg: ASbGnctNApZj9jaXU0vgfcvNtn+S2tz/W6RYUkl12ho7zEL/3pfvK0oRprxpyttaO7t
 1G4wwmsrzpC0Sg91CzR5LWIrm9XxXw//9T7WcQdki5KzqMI29/TpCofN2Od/wPFNOFhFOQ3/STX
 PQJlh5j1W8POmdWpFrn+lHwSpPt6352emtHZ5sIagfhsCPu/9W64DA1yzSsB5OZSel1pc5PL5T7
 SzEe5G65Aa5FZCYwhAU58XFeM4077RbQLRkdQRAbmFQESX3yC+qdSflBsWOTET16hmGsQLgNk41
 4XWGNL1aZ9w0h+npZEAKQD4GzqSycV9XiuCXVaWV7v4Hvq96h80I4CJ+/p5N94lbe7bee0fRQeq
 8y6zg4BtvZMiIKM4R3qVnxYU+P6pJ7wINEZ2wFX+w8oF9o1yMqJ7JCyi/ioFfjo1RmekeTwS4Lo
 i4IudboFZPwX9dTORVgNVw
X-Google-Smtp-Source: AGHT+IHvU9S2+68kk4bIY6XJSt3ALbLJOqHjRhsYuYgNMt/px6MtVCMOZuGrkrVlzP+KGctR6OsILg==
X-Received: by 2002:a05:600d:41d0:b0:46e:394b:4991 with SMTP id
 5b1f17b1804b1-46e6127a4f2mr19980725e9.11.1759306911312; 
 Wed, 01 Oct 2025 01:21:51 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e619c3a58sm27485035e9.6.2025.10.01.01.21.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Oct 2025 01:21:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, qemu-arm@nongnu.org,
 Jagannathan Raman <jag.raman@oracle.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 kvm@vger.kernel.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Fabiano Rosas <farosas@suse.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Peter Xu <peterx@redhat.com>
Subject: [PATCH 04/25] hw/vfio/listener: Include missing 'exec/target_page.h'
 header
Date: Wed,  1 Oct 2025 10:21:04 +0200
Message-ID: <20251001082127.65741-5-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001082127.65741-1-philmd@linaro.org>
References: <20251001082127.65741-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

The "exec/target_page.h" header is indirectly pulled from
"system/ram_addr.h". Include it explicitly, in order to
avoid unrelated issues when refactoring "system/ram_addr.h":

  hw/vfio/listener.c: In function ‘vfio_ram_discard_register_listener’:
  hw/vfio/listener.c:258:28: error: implicit declaration of function ‘qemu_target_page_size’; did you mean ‘qemu_ram_pagesize’?
    258 |     int target_page_size = qemu_target_page_size();
        |                            ^~~~~~~~~~~~~~~~~~~~~
        |                            qemu_ram_pagesize

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/vfio/listener.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/vfio/listener.c b/hw/vfio/listener.c
index a2c19a3cec1..b5cefc9395c 100644
--- a/hw/vfio/listener.c
+++ b/hw/vfio/listener.c
@@ -25,6 +25,7 @@
 #endif
 #include <linux/vfio.h>
 
+#include "exec/target_page.h"
 #include "hw/vfio/vfio-device.h"
 #include "hw/vfio/pci.h"
 #include "system/address-spaces.h"
-- 
2.51.0


