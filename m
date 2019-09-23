Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp2858554wrp;
        Mon, 23 Sep 2019 09:26:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw9rJL93ubMKvdjBZcl+sdBP7I7PEiHHJubaBZn6EmvMcvuYq89PlchuVmqkBv/kXJUq5eK
X-Received: by 2002:a17:906:6d53:: with SMTP id a19mr683176ejt.144.1569255980063;
        Mon, 23 Sep 2019 09:26:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569255980; cv=none;
        d=google.com; s=arc-20160816;
        b=gM7ZlAP2IbN2lBGYIZzgTIbIqslByNO5J5AYUivkeUCrQf9pIME8XFfz1H9ed1UhnU
         vnZ2LV7/uzjXalnLVdaoZO8yj+BGHjetV3ZnChLNA0BDHxSnwFPi6imeEV4pzZcDKbI4
         ahoKNqZNRNcOiN68IdnDETUi2+ISqxRlSAvbg8BGfer165doPjGWhlDgIoh01A6UFjUZ
         TpnR05t89nth1HSh2SCTlhyQSH50GJubaLYmV6rzDXh35vX41lzgb95yBNmJ6q425mkG
         znyvBNyf+XkmphNjrOH0Xv1sRJ2jxjpWIhHbQjBl2/Oxhwp6kH/BJGudZ8SetntACa23
         4QXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=MsTdZG/Yg96YLd7lmg/NBSzXXDYNP3Eo/MYvIJukNYY=;
        b=cWDFose3znmAK/bqcMX678XdjCNK0w7FdaXvKUVFyvk/igdFGlzfl5KGkIejSao1gn
         gpRRHVg1XpkTQqIWQIKSvGr8YF5VBWgNKaGJZJa7wvg4z4JQxYiTNb3q3bTa15x9JQeQ
         S0OfHGciYh7Zo8jW0LNM35Inlp7IR371fZdiul0ZkgOPw/G8cwatgotGIEKSkSoGDjg5
         zEu+raLHMAFrbZ/EBaB/q8jpWIBuh6k2bSgdW5rAu/YASAf6erYLQDHknvqJTtqiyXYj
         npifxCiQEIUksQmTBcMMRPwrW/0uVs0R42t5WcaiXWFGjoFzKLZQh0sQnGSSjHSTJP5I
         IE0w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=virtuozzo.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c14si7789143eda.8.2019.09.23.09.26.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Sep 2019 09:26:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=virtuozzo.com
Received: from localhost ([::1]:59318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iCRAH-0002ft-8C
	for alex.bennee@linaro.org; Mon, 23 Sep 2019 12:26:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57305)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iCQxX-0002ZO-4v
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 12:13:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iCQxV-0003rZ-IY
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 12:13:06 -0400
Received: from relay.sw.ru ([185.231.240.75]:39492)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iCQxM-0003a5-F2; Mon, 23 Sep 2019 12:12:56 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iCQwz-0001Fp-Os; Mon, 23 Sep 2019 19:12:33 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [RFC v2 4/9] hw/core/loader-fit: fix freeing errp in fit_load_fdt
Date: Mon, 23 Sep 2019 19:12:26 +0300
Message-Id: <20190923161231.22028-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190923161231.22028-1-vsementsov@virtuozzo.com>
References: <20190923161231.22028-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
X-Mailman-Approved-At: Mon, 23 Sep 2019 12:25:24 -0400
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
Cc: stefanha@redhat.com, codyprime@gmail.com, jan.kiszka@siemens.com,
 eblake@redhat.com, berto@igalia.com, zhang.zhanghailiang@huawei.com,
 qemu-block@nongnu.org, arikalo@wavecomp.com, pasic@linux.ibm.com,
 hpoussin@reactos.org, anthony.perard@citrix.com, samuel.thibault@ens-lyon.org,
 philmd@redhat.com, green@moxielogic.com, lvivier@redhat.com,
 ehabkost@redhat.com, xiechanglong.d@gmail.com, pl@kamp.de, dgilbert@redhat.com,
 b.galvani@gmail.com, eric.auger@redhat.com, alex.williamson@redhat.com,
 ronniesahlberg@gmail.com, jsnow@redhat.com, rth@twiddle.net, kwolf@redhat.com,
 vsementsov@virtuozzo.com, andrew@aj.id.au, crwulff@gmail.com,
 sundeep.lkml@gmail.com, michael@walle.cc, qemu-ppc@nongnu.org,
 kbastian@mail.uni-paderborn.de, imammedo@redhat.com, fam@euphon.net,
 peter.maydell@linaro.org, sheepdog@lists.wpkg.org, david@redhat.com,
 palmer@sifive.com, thuth@redhat.com, jcmvbkbc@gmail.com, den@openvz.org,
 hare@suse.com, sstabellini@kernel.org, arei.gonglei@huawei.com,
 marcel.apfelbaum@gmail.com, namei.unix@gmail.com, atar4qemu@gmail.com,
 farman@linux.ibm.com, amit@kernel.org, sw@weilnetz.de, groug@kaod.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, peter.chubb@nicta.com.au,
 clg@kaod.org, shorne@gmail.com, qemu-riscv@nongnu.org, cohuck@redhat.com,
 amarkovic@wavecomp.com, aurelien@aurel32.net, pburton@wavecomp.com,
 sagark@eecs.berkeley.edu, jasowang@redhat.com, kraxel@redhat.com,
 gxt@mprc.pku.edu.cn, ari@tuxera.com, quintela@redhat.com,
 mdroth@linux.vnet.ibm.com, lersek@redhat.com, borntraeger@de.ibm.com,
 antonynpavlov@gmail.com, dillaman@redhat.com, joel@jms.id.au,
 xen-devel@lists.xenproject.org, integration@gluster.org, balrogg@gmail.com,
 rjones@redhat.com, Andrew.Baumann@microsoft.com, mreitz@redhat.com,
 walling@linux.ibm.com, mst@redhat.com, mark.cave-ayland@ilande.co.uk,
 v.maffione@gmail.com, marex@denx.de, armbru@redhat.com,
 marcandre.lureau@redhat.com, alistair@alistair23.me, paul.durrant@citrix.com,
 pavel.dovgaluk@ispras.ru, g.lettieri@iet.unipi.it, rizzo@iet.unipi.it,
 david@gibson.dropbear.id.au, akrowiak@linux.ibm.com, berrange@redhat.com,
 xiaoguangrong.eric@gmail.com, pmorel@linux.ibm.com, wencongyang2@huawei.com,
 jcd@tribudubois.net, pbonzini@redhat.com, stefanb@linux.ibm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MflU8Cf8EAs8

fit_load_fdt forget to zero errp. Fix it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 hw/core/loader-fit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/loader-fit.c b/hw/core/loader-fit.c
index 953b16bc82..fe5bcc6700 100644
--- a/hw/core/loader-fit.c
+++ b/hw/core/loader-fit.c
@@ -200,7 +200,7 @@ static int fit_load_fdt(const struct fit_loader *ldr, const void *itb,
     err = fit_image_addr(itb, img_off, "load", &load_addr, errp);
     if (err == -ENOENT) {
         load_addr = ROUND_UP(kernel_end, 64 * KiB) + (10 * MiB);
-        error_free(*errp);
+        error_free_errp(errp);
     } else if (err) {
         error_prepend(errp, "unable to read FDT load address from FIT: ");
         ret = err;
-- 
2.21.0

