Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp322864lfp;
        Wed, 19 Feb 2020 02:25:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqyl9z8hFnJ3XXQOD1wHDN8blqHT4pFji7KCCM3s7aczEF5bKG3XklTVjXJ6BOVPJ59UuS5e
X-Received: by 2002:a05:6214:8cb:: with SMTP id da11mr19333528qvb.228.1582107920165;
        Wed, 19 Feb 2020 02:25:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582107920; cv=none;
        d=google.com; s=arc-20160816;
        b=G5YkyC6BncBV3XGnGH+L0Qf4yznVWvwJDZ4lGhofRvAASl0eer52piUJq19Ci13Uda
         yzmK4bPfMnMOx679FBOQkSdn5FzzmaWtdnNJViXTs1CS24lNkPQENkKqx6Ke0IkB576y
         ayjUZn4okrxznUf0MzXvFMX8AJQgqyT9aDqntG6wbWBRwi0srk6o7UapMiOhLSuq9WLV
         +onpOQ/NW5D2nCI6Ja46nmb32fcKUjWGCP5BpVYqgQTbn8tJ9JFsx44brDHupT69XHQQ
         i2uYEsvbHvFFaAhHjCqtzTZ7XylEaqwPnN9+Zrzu4KC5Y2zN5tQaOB5hCESFj5xVLcE8
         lqug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=o6ZQygL7rZRvU6igUhT0IEE245hUZJhNdnWXsSFW+mk=;
        b=QhlL2AtS2aLBu6r/z3rSOjASzwk3JoXa57pSegfOfktsAfd4zIW2YQg4LsIjG26OIx
         yXcjHaoV1bH1POXeUJL2584NCC8zw7LHsB/F9Vv5ifhe6huW4yzfIUur5/QpJWyISimF
         T49xGagXjp3uj80j7CdzZhrkH70wbeeFo/ttjEltPBxDw3Us3EnHYEXKI8DUYwq83Y0Y
         o+H1RzyRzrUm04RV9gfWOaXHEMP5gsllxVDUREz333d7f1lEln96zvYNSJtzepF4OXpT
         FhRYApEOXA4SZq0MgF6brRUO/emB1sCY/O3ViRV94yrv4vBlM8r2kL6bIyiHPVeMSC3G
         FYug==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k19si736050qtf.272.2020.02.19.02.25.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Feb 2020 02:25:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j4MXf-0003EW-Iv
	for alex.bennee@linaro.org; Wed, 19 Feb 2020 05:25:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53544)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1j4MPu-0003i2-KX
 for qemu-arm@nongnu.org; Wed, 19 Feb 2020 05:17:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1j4MPt-0005Va-F9
 for qemu-arm@nongnu.org; Wed, 19 Feb 2020 05:17:18 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:37233)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1j4MPr-0005QD-OV; Wed, 19 Feb 2020 05:17:17 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Ma1D8-1iyzBS13pM-00VyXT; Wed, 19 Feb 2020 11:16:46 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 14/17] hw/block/pflash_cfi02: Remove unneeded variable
 assignment
Date: Wed, 19 Feb 2020 11:16:09 +0100
Message-Id: <20200219101612.1033925-15-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219101612.1033925-1-laurent@vivier.eu>
References: <20200219101612.1033925-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Dxie9fE4aO1Ap0NisYSSBxy1S8tUWdf5yk3MyaM9JfKjnFxYqoq
 2hD7PVg0NFuZgkpFhsQ9yGop0OcjPSh799HgFs4FOxnuh0lSPSJreYzn6ekmaS0kbqjljfp
 zZh6jYCAP8ux/OM0pZ0rXy3/PzwOTJmRdz8QQZvyyfaGXgK7RhUnUovQX2suG4JQjIx8eIt
 yHeNWFbU3BHEJAXoCNrUw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:B3IAv8Co/H8=:HPzUeOqRPMojhWZUq0apTr
 YQj3hqnC0QXlquy3P7xVyk+XN2A81PY+iAL1ItvyyccFCa2sy+WQzd6RV83py4i42HNdGEWxv
 WudIrRWKMgrHsEEe8K3Gyi5UIxypp9eNZ5vkeKqpTjJsjzPScH6jQG/tDKHID/dmWYIkIZjTw
 Og3dtMHQ2xjjvBhZ/REFQ2vgWg/AX/28uurrrQjl4lQopYyDOhdOgIKtmPCq7hvNeTod0YOJj
 CyxRg0Qr95YUmgGSnO10N4zFe0Ixp4vkykIDZYip/HrAcpMgGTN2V/MOnFd1qYQeDWyX9/af4
 2d4GO/G1TCSspasET1Q3sKYDHSntz7Rc4t7x0pwEDkp1VWbeW7wN5qCJatoX54w6Q85CwCqWe
 M2M208JGIs364I25O2fqlY37ytmg7alT4r7M3s/yAOn4e1j3IqfpUI2xbSmHifZ8uc+n6d7ez
 Eq+ynJaMJ963Xz/3kL3k50NRiu5GGCgSNqy90+LrmOhFOddXhNM8hicyK5fMMoxUXz/Qfd7jT
 NeDOdZGtCGSNcS7FKPfxUUo3cgPBPiDEwh+GAMSxqm/sTduM6l0ZV5n26xphaSCXXxvlcody3
 aQSmicRXnnf1vAM1LwiSdqcZaTY3coZ/1cQoVvJVLbu9ccAYsG5/l4vp4iSiS2rnITiG5mtIr
 T7EDFWvbG+dWclZF4o8me0fL4sILFLmYHCf3EerGMdhGdpvmlNXJaruLxpIIUEZjMl7qftILS
 Z8xpX6fhLSOH2r01xG//IEcDWHqIRT2WfjkFWd9cxFy/bwM7h0QVK7T8+75RRRgC0JSvOEz7c
 bdAIhZSJ4G7Xkxo9SBOuzsE7XySRoPxkmNJUeJTRdHX5kMpf7KvTiWTb0ck1KxwUzC+HMbt
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.75
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
X-TUID: xg6RlTxF4xcQ

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Fix warning reported by Clang static code analyzer:

    CC      hw/block/pflash_cfi02.o
  hw/block/pflash_cfi02.c:311:5: warning: Value stored to 'ret' is never read
      ret = -1;
      ^     ~~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20200215161557.4077-4-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/block/pflash_cfi02.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 7c4744c020c1..12f18d401a85 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -308,7 +308,6 @@ static uint64_t pflash_read(void *opaque, hwaddr offset, unsigned int width)
     hwaddr boff;
     uint64_t ret;
 
-    ret = -1;
     /* Lazy reset to ROMD mode after a certain amount of read accesses */
     if (!pfl->rom_mode && pfl->wcycle == 0 &&
         ++pfl->read_counter > PFLASH_LAZY_ROMD_THRESHOLD) {
-- 
2.24.1

