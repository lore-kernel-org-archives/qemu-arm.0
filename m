Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp320615lfp;
        Wed, 19 Feb 2020 02:22:14 -0800 (PST)
X-Google-Smtp-Source: APXvYqwcG6wpT+/earHCxUm/dXJuXBc58PyfSuUVpqwDxVlQYXrTFIPKpsG60QCY0Twx4GC3TfRY
X-Received: by 2002:a05:6214:6aa:: with SMTP id s10mr20710230qvz.138.1582107734277;
        Wed, 19 Feb 2020 02:22:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582107734; cv=none;
        d=google.com; s=arc-20160816;
        b=afpS0hDq82/3/eYYwUIYyUMNE4BDA9rAw5nlBF3soaLN/KsbCA3e/PmEvhT0kTTuV+
         KNRXQNFQm1Kb+ViC/5QuniYEuRESEJqGWUj7kgosThiU3tfJ98ehdr1c+Jy4yFYuC50e
         hVfk5CQXh8Xn9hAPnhON2sz9Bq4Ab+h+uv8VRRt7SOt3SlKwRkAdQ1hWaxNQH0jVEsxp
         l8Z75UvFBhpjr+HfKAN95w/i94710c52po4V4PwsuXS8qfjb/CxsQkaDVPHj/7fwpo81
         IxxjqeO2s9mF2Ln7LDPxkr/mDGfvyAc4OFpm2KHdACH7xxbZ3lnM1EngR3EoBNuOvNBk
         UlAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=BMzmXteKHDALC5Ej5QBCcSZ3ZPkh7thToZw45YNLqcM=;
        b=xXZCoSLp94+wtPzCN/rSUQy6EbhgVOANq5jtp9KtaOflzi4N6Wbbv9JjKOMp5OWpqO
         iKg8uGo6MGNbPIquQzN9hfHGR0mpgi1vgYdS7NXhLLSlFE8Z9tovJwYvWhhiWkso9sq8
         ySQYIsLKjddb60+2JE2DN6aGOosCyJE95LcctlYYSvW3eVe0ocXusirVKlENyyUiET6x
         1Yo1sfAqovDE9xpIeJCGpXLeV2XLJloA8Qe2WvF64fefi1IbXo/MD64ab+yf9WZmR5HT
         qqU+paXZqcXiSO8dm4pZwnd+BsnlI1J6R+KDG+QxQ4IvI2CthOKPRfyHdmuoD8N7JoE2
         zGxA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t1si671971qkh.202.2020.02.19.02.22.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Feb 2020 02:22:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j4MUf-0004h4-NG
	for alex.bennee@linaro.org; Wed, 19 Feb 2020 05:22:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53489)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1j4MPt-0003hO-B4
 for qemu-arm@nongnu.org; Wed, 19 Feb 2020 05:17:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1j4MPq-0005Px-SJ
 for qemu-arm@nongnu.org; Wed, 19 Feb 2020 05:17:15 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:53445)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1j4MPg-00058H-Mq; Wed, 19 Feb 2020 05:17:06 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MgNxZ-1jf54V1bP5-00htd2; Wed, 19 Feb 2020 11:16:44 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 13/17] hw/display/qxl: Remove unneeded variable assignment
Date: Wed, 19 Feb 2020 11:16:08 +0100
Message-Id: <20200219101612.1033925-14-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219101612.1033925-1-laurent@vivier.eu>
References: <20200219101612.1033925-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:xmLVze4fF2jn6gChYFmBkC8c3RIbPEY5H4J7Y5UtgnxBWgF54AD
 Ag+q0XW/9deubnLuPJBpDdoCAX6siUjw26WVfuE9L3m9B5PbLPCZ6zUXmhCZy6neiMYW3vw
 97AZdpCVPLOwz0axZF79dSOpgOu+iRs+yVSUpeQ+TOztIzY0JMz6SgbKCYGM1UTlLcy47gH
 Ga05RO73lqgiGlq6ez7bg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:D8XpsZO1UK8=:OIz4CJMjqrC+YhdCUvi4EU
 wRh1hONtNA3tWUsqmkvPhVk4IqAC2jW7SAbZxSXeTCrZyoGg9TpK8hSPa6MHGkiQDnMHv9Dkr
 to9LU0Sdza4sxyIAvx+IJYdfmuuKMZltaI7xtiOLbxjFjz3kLiB6Ly0NG3TwrJwP+c/1ziT8c
 5Ph/d8cc2Z3cffAPTIBzc29NEbn78Sjv6zFF+JfhgRG/BUTYA51OmMpAQ7xQl3VoeQWO/QcNI
 mwhG3bXAJxtGKfqPUDJKKLC8ryhlt+rrpvaEEnz8bQkw96Zvq4GnaN+vdRVYDt5kxHnwMo8Rv
 DR7f5fiov5m1NU46nH7vh8piupQNWIVlIlMhsUUon1TUKbPnBdLZTVxaHGfHZ06uqK2OnM9GO
 pu4fYTV2uHgNWljCeKCJz/x3x/q1cWRd+IWxbMPLXG+aKbg0J4Qds8szTat/34jiXN2DLKrkR
 dxbIDw9KJrFSxfOsajRByGEwqNcPzgGi4+BCgQxyzkYqj0fPAHuGMUd4Kxh8cYfyJSpuYOpGr
 WScn+8yAbtm/tgCINF4WJbw609cuMiEPYmsLSpNCEUd+zfVCu2AcgJXmb2mpnYyx+GFqrUhTy
 jT0bW5KqrpD/D8aYjcu9LQ7muGIuLi7NMEAqsdkMsbYTMpQjMr9L1hiPBksrEIJ0AWqP2lcsd
 iY1uNT0Fbr81OnsvAcElMtEMba/tCGb55F8CdzyCZXJmCfieybKUbWbDKcTXkP90xgonfoni6
 LJxU0aw7OFS75n2E7D52tlGj3jxF9vzgGZ7eQXDcQ9SGKTjDfySF6/Yi1nhBSwzg6/t8w6EqT
 nIxwqZX1SWyatARb+OFh80FtKS6YdPpQ3TPn76Mh2lbWW5Rn7Zz3WwtDIJjZmQAMlLWdWNl
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.74
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Marek Vasut <marex@denx.de>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jiri Pirko <jiri@resnulli.us>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>, Chris Wulff <crwulff@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wxESjjLybEIR

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Fix warning reported by Clang static code analyzer:

  hw/display/qxl.c:1634:14: warning: Value stored to 'orig_io_port' during its initialization is never read
      uint32_t orig_io_port = io_port;
               ^~~~~~~~~~~~   ~~~~~~~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20200215161557.4077-3-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/display/qxl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index 64884da70857..21a43a1d5ec2 100644
--- a/hw/display/qxl.c
+++ b/hw/display/qxl.c
@@ -1631,7 +1631,7 @@ static void ioport_write(void *opaque, hwaddr addr,
     PCIQXLDevice *d = opaque;
     uint32_t io_port = addr;
     qxl_async_io async = QXL_SYNC;
-    uint32_t orig_io_port = io_port;
+    uint32_t orig_io_port;
 
     if (d->guest_bug && io_port != QXL_IO_RESET) {
         return;
-- 
2.24.1

