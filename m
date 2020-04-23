Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1813405lfm;
        Thu, 23 Apr 2020 05:11:55 -0700 (PDT)
X-Google-Smtp-Source: APiQypIXzQvX9gxpOtRmAvgZQPJ8recb/TFfraZwMqmzS2eYge2rVzdssyXjfrSYOYB+Z/RSPo3j
X-Received: by 2002:a37:ac10:: with SMTP id e16mr2962929qkm.97.1587643915517;
        Thu, 23 Apr 2020 05:11:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587643915; cv=none;
        d=google.com; s=arc-20160816;
        b=DaPTBagciosQtUTtVirX69tsxgR1ZiP+jSECIKytnvaTsxOulnDVwXkENTimIBH0UD
         iW4TscF6eNQY8mxbXkFsrXa6wZ7D+cV9egxIpYb6YFbgXL3Zg9s9bVvmwkovkJmRmH7a
         jemIjoynOdiCdixIqClLF50HOiHgxtrv4MIsnpCM5Jkawgz1ZoufnTwgNOh2UgGjwgPL
         wreC/r44ESZM5+egHGnV9oR5cMn++0QplFdaFj93VAYRZe346L+tDO4/JAjns00LrKZh
         dGRyae4C0CXB2P3IXVfZBBMsv0KVVKDIqlyjW0Z3DpK65dt5LK++8D0Vi2MYdj9JxgB4
         4OaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ZzALLD5JjgtTBfQ7kca+0KHNMa+Pi21VHypSM0MfNpQ=;
        b=YUH/shbMzArJp0+our72GnD9YbSx6QlhpU6bqqUxrWf7Pk2Dp/WZWIdPdXJxqy+M3F
         ZuVzYI1scw2aXQS2XwoVqEYuYZqfHKz7WvriOjMofah7YdQlErWvGEKUkl881WdJXzza
         pX2xPbfxa5ke+TNRVv6xzXLNRzHhxrDEffeylMdcUaCg0mcXl1yFpYzv8/DjR9moJe1u
         aUdMfZGpZ+OnhsZhw32d/sq1Lu8JMmR2UhDD6lVoycepq2622TTJueeHOrClmKPblhfB
         3iHhdQTJa1R7INKDeCuJ2TcVBVNPsIpIrAF4wKyVmHZ1WKeqSrMx+lLEfQwUU4SVj1DD
         wsCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pmL89yyf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s5si1215640qtb.246.2020.04.23.05.11.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Apr 2020 05:11:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pmL89yyf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jRahu-0002dX-SY
	for alex.bennee@linaro.org; Thu, 23 Apr 2020 08:11:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52034)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <edgar.iglesias@gmail.com>) id 1jRahP-00026M-Ij
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 08:11:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <edgar.iglesias@gmail.com>) id 1jRahP-00088i-36
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 08:11:23 -0400
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:38113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jRahN-00085Y-KW; Thu, 23 Apr 2020 08:11:21 -0400
Received: by mail-lf1-x143.google.com with SMTP id l11so4551603lfc.5;
 Thu, 23 Apr 2020 05:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZzALLD5JjgtTBfQ7kca+0KHNMa+Pi21VHypSM0MfNpQ=;
 b=pmL89yyfWHWglmE3kQKcGQ8tGr905N32Yd47/kpbYIy6W8zaGQXS5rnA7JAjukvLqI
 1dmOamjnoFfAAAU2lrmYNw9KUN3Gjjyrsu4edSAAgz/jsopzrdX31PUQIgPeECJlKRGd
 3GklfZyl7kk5bvbbi0kluRaaYMnwfXtYGAUFMQAWaSa0yqyNe70EKote4E3f+4e9TGX5
 aBOo8x4HARGo9btgFRptCSn5zYUN9KAru5CIp5F+NhUJ7AGs5KfXQ/ri/img+PGShWwp
 BAMAx/VaeZjvoEgl6QvxocLr+r4Q95VqWrAgp5sjVCKpk3SsWmE1uwhrHEVIG8mZ6Yrx
 H9nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZzALLD5JjgtTBfQ7kca+0KHNMa+Pi21VHypSM0MfNpQ=;
 b=iKArPlPGbsX8/zbobyLWiAgEL7Y29+iLi2liEnwRym/3FQ+KUQiiEru8pNcAfLc6Kq
 kcSUGHxDvJy1SeB48V5PrVYGDhKmQVw0Ip2Fb+FltfSzej81lWHespfUjneycnoX3ztu
 ViogbvTUnfilvpJUW78RqIaAcfA2aqntG2Vc4eibUFk5v4X5x4YG5g/AD2Iqxy00yI/d
 3Au5Qr3xPhmGEnKHewFiRaKp6zeLvQFMn1lGOi85VRU6T322/EvPX1fsmzPqQz1Sh7zk
 nRQS8lnFyynM0TS15KFPnb32rFpapZlhuctzEpPUQe22XuBlvR1wh65pdJHk4CTWNxMT
 aatQ==
X-Gm-Message-State: AGi0PuZDuceEJWFVwrkbz2PzTYfi47WNaRdIE2AxGMhrFyen9dlahJLO
 31Ic0H+CMAEMhL7S3Oi4yF4nyoUhUvQ=
X-Received: by 2002:a05:6512:52c:: with SMTP id
 o12mr2161976lfc.217.1587643879397; 
 Thu, 23 Apr 2020 05:11:19 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id c2sm1739088ljk.97.2020.04.23.05.11.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2020 05:11:18 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/4] hw/arm: xlnx-zcu102: Move arm_boot_info into XlnxZCU102
Date: Thu, 23 Apr 2020 14:11:13 +0200
Message-Id: <20200423121114.4274-4-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200423121114.4274-1-edgar.iglesias@gmail.com>
References: <20200423121114.4274-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::143;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x143.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::143
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, frederic.konrad@adacore.com, qemu-arm@nongnu.org,
 philmd@redhat.com, luc.michel@greensocs.com, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XOX0C2fvf5uT

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Move arm_boot_info into XlnxZCU102.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/arm/xlnx-zcu102.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
index bd645ad818..4eb117c755 100644
--- a/hw/arm/xlnx-zcu102.c
+++ b/hw/arm/xlnx-zcu102.c
@@ -31,13 +31,14 @@ typedef struct XlnxZCU102 {
 
     bool secure;
     bool virt;
+
+    struct arm_boot_info binfo;
 } XlnxZCU102;
 
 #define TYPE_ZCU102_MACHINE   MACHINE_TYPE_NAME("xlnx-zcu102")
 #define ZCU102_MACHINE(obj) \
     OBJECT_CHECK(XlnxZCU102, (obj), TYPE_ZCU102_MACHINE)
 
-static struct arm_boot_info xlnx_zcu102_binfo;
 
 static bool zcu102_get_secure(Object *obj, Error **errp)
 {
@@ -166,9 +167,9 @@ static void xlnx_zcu102_init(MachineState *machine)
 
     /* TODO create and connect IDE devices for ide_drive_get() */
 
-    xlnx_zcu102_binfo.ram_size = ram_size;
-    xlnx_zcu102_binfo.loader_start = 0;
-    arm_load_kernel(s->soc.boot_cpu_ptr, machine, &xlnx_zcu102_binfo);
+    s->binfo.ram_size = ram_size;
+    s->binfo.loader_start = 0;
+    arm_load_kernel(s->soc.boot_cpu_ptr, machine, &s->binfo);
 }
 
 static void xlnx_zcu102_machine_instance_init(Object *obj)
-- 
2.20.1

