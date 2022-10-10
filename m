Received: by 2002:ac9:4144:0:0:0:0:0 with SMTP id u4csp2623121ocg;
        Mon, 10 Oct 2022 11:17:36 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5JdRLtyTFhFty9ndh6xmBnDC+yUF+Pebb5jAZJScwTGRwLm4s64ouB0/6VAG4u5ndoUMzm
X-Received: by 2002:ac8:5802:0:b0:35c:c650:b8fa with SMTP id g2-20020ac85802000000b0035cc650b8famr15937321qtg.593.1665425856790;
        Mon, 10 Oct 2022 11:17:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665425856; cv=none;
        d=google.com; s=arc-20160816;
        b=cT0hQ9IXvhLritZKvN8WQEevYlMzt/tl8UNxUoVTGHHfiZTO7ZupzuwCkFxqGzOZXM
         8MvuM7vMV8mJI3+/IqukqgxYUptdNTQy55hCfUUD8K3JryL6rRh/ACQoO3mwzfzfLMGe
         BuS/7RX1harCyhdj/Ze+Iodrr+dHMUf0RPOofdNiCLTsrAMteWg/p4BowW2zwhuWxMNH
         ZxxcoHUl5yBLAVuJEgHHy4Ygi5e9s5G1MwnHojSopXtnllR91IBrc/I/5e+ho/gSPYMT
         BpHm0rjwmmr7FeG3lWKqOXTI0CEzyEhAT9sTFcOyT8nbu09cvKUMX4ogj0LVg3Tn4O95
         2Low==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=fI6ZJ92NuB3HBfu3OEClBbAYK125pIR2pAh01+BJJqs=;
        b=N5HTpNJC58tqQa2h2q20Sef7qiWP/kV9eEl6y8ECxZ+yjLaSmTILsYC52+R3z63SZB
         IMbgA5m1D3mtFpfeA5ltFq/hmGc0gikXptlBkQb+rpGdRNA+Q5SgGk/q6A0vFJfduegh
         ODBET0c1ONC5nzJaS5xnf7ZhCfkx+DYvgJpp+Mkt9VA/vEC6k8NTVMdjx326GbwGbElb
         6A5VP3qHW8J2KGcKJN1u6AJTr+8r5na4Q8bFeICRbjigUVbOgNApVzTIWCcjy2MLQREU
         hzzsxDjLtopyIcSa3NV3vAsfKMgn5rH88qdT94xDgdzhB8jgqaD1VpPQI1YEVjAmEBRz
         0MyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Lbf4RDjl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iv11-20020ad45ceb000000b00491391a786fsi5703871qvb.221.2022.10.10.11.17.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Oct 2022 11:17:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Lbf4RDjl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ohxLH-0005Bd-48
	for alex.bennee@linaro.org; Mon, 10 Oct 2022 14:17:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwc1-0002uc-GG
 for qemu-arm@nongnu.org; Mon, 10 Oct 2022 13:30:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwbw-00073R-0d
 for qemu-arm@nongnu.org; Mon, 10 Oct 2022 13:30:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665423039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fI6ZJ92NuB3HBfu3OEClBbAYK125pIR2pAh01+BJJqs=;
 b=Lbf4RDjlfsehUzL6b2PCRdgr9P0oaVU1yF7mfkXQ7x1+OxVwhkhwYvOLjd+a10G+YdfSOL
 EjnQUrYFEAycoJtLNJ9q1DvARC1yDTBdVXbKnPaO9i0ds+Pb4NBXP+9MIMgPQV9LrBfQJu
 J8C9/vgUjFwKIZu6B/FIbiKCP44aq8Q=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-615-bzGf_aJHP8m3bHXVS0tjNA-1; Mon, 10 Oct 2022 13:30:38 -0400
X-MC-Unique: bzGf_aJHP8m3bHXVS0tjNA-1
Received: by mail-wr1-f72.google.com with SMTP id
 s4-20020adfbc04000000b0022e03fc10a9so2955853wrg.15
 for <qemu-arm@nongnu.org>; Mon, 10 Oct 2022 10:30:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fI6ZJ92NuB3HBfu3OEClBbAYK125pIR2pAh01+BJJqs=;
 b=lRhzaMleuk+bFSFuVBOnKECbrbp5oWOhXfoCu/84aCbjMsIScZlGJ4r9Rk8m/gonws
 5rggc4lq9xotYkhpu0uGDOC3I3jt0cvGUsSbGmc+wX8fw0vfs9Z5sarQ7WFs6sgjU2Op
 MGIp9lFyBzCB5E5fXqzHbv3vBqmoMjaXWoweiPxTH/OQeUEBzthwwTAP2q17t4NkVa/Q
 0Tio6K3JAwok7hxCKEDrRMwC22qaFwYG9P/msG9+BNceo8+9E3zKTvDrPv99NXRSiRO5
 K7lV9MZnWvbaMpZpNZW40hTGjsORGE1983RKmzCEd+FsFaXdrTt53M+NXmG9yMHUW3hg
 oScQ==
X-Gm-Message-State: ACrzQf3jcWWMDxcw1ujpEohbSrtCd8SDhSfONZQ9C5m4QMhc08xwqbqe
 X7R9HRQILzNI0q4KZQa5RblcO8E1mJ/6HZbFwX+MRhk9bdwgaTlyu2LhSOPqCWRIea/dju7fa6s
 1VWlF+LrQte8a
X-Received: by 2002:a5d:4082:0:b0:22f:6ad7:53e with SMTP id
 o2-20020a5d4082000000b0022f6ad7053emr7735857wrp.389.1665423037388; 
 Mon, 10 Oct 2022 10:30:37 -0700 (PDT)
X-Received: by 2002:a5d:4082:0:b0:22f:6ad7:53e with SMTP id
 o2-20020a5d4082000000b0022f6ad7053emr7735840wrp.389.1665423037181; 
 Mon, 10 Oct 2022 10:30:37 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 g14-20020a056000118e00b0022cc3e67fc5sm9536077wrx.65.2022.10.10.10.30.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 10:30:36 -0700 (PDT)
Date: Mon, 10 Oct 2022 13:30:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Miguel Luis <miguel.luis@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org
Subject: [PULL 26/55] acpi: arm/virt: build_gtdt: fix invalid 64-bit physical
 addresses
Message-ID: <20221010172813.204597-27-mst@redhat.com>
References: <20221010172813.204597-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20221010172813.204597-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tiHBrwL5WtCS

From: Miguel Luis <miguel.luis@oracle.com>

Per the ACPI 6.5 specification, on the GTDT Table Structure, the Counter Control
Block Address and Counter Read Block Address fields of the GTDT table should be
set to 0xFFFFFFFFFFFFFFFF if not provided, rather than 0x0.

Fixes: 41041e57085 ("acpi: arm/virt: build_gtdt: use acpi_table_begin()/acpi_table_end() instead of build_header()")

Signed-off-by: Miguel Luis <miguel.luis@oracle.com>
Message-Id: <20220920162137.75239-3-miguel.luis@oracle.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
---
 hw/arm/virt-acpi-build.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 9b3aee01bf..13c6e3e468 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -592,8 +592,7 @@ build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     acpi_table_begin(&table, table_data);
 
     /* CntControlBase Physical Address */
-    /* FIXME: invalid value, should be 0xFFFFFFFFFFFFFFFF if not impl. ? */
-    build_append_int_noprefix(table_data, 0, 8);
+    build_append_int_noprefix(table_data, 0xFFFFFFFFFFFFFFFF, 8);
     build_append_int_noprefix(table_data, 0, 4); /* Reserved */
     /*
      * FIXME: clarify comment:
@@ -618,7 +617,7 @@ build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     /* Non-Secure EL2 timer Flags */
     build_append_int_noprefix(table_data, irqflags, 4);
     /* CntReadBase Physical address */
-    build_append_int_noprefix(table_data, 0, 8);
+    build_append_int_noprefix(table_data, 0xFFFFFFFFFFFFFFFF, 8);
     /* Platform Timer Count */
     build_append_int_noprefix(table_data, 0, 4);
     /* Platform Timer Offset */
-- 
MST

