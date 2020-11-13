Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1226921lfb;
        Fri, 13 Nov 2020 02:18:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyCuTRmayGWw7kEXRKB0KYY02Q+PWubPyGDRBjPz3xymvVN+23j0aGg1woRqxIlnb031xFM
X-Received: by 2002:a25:d215:: with SMTP id j21mr1758054ybg.279.1605262695844;
        Fri, 13 Nov 2020 02:18:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605262695; cv=none;
        d=google.com; s=arc-20160816;
        b=S5q71o2CZjnO9KeS/VovaZ/hPT3rs4zQIu6DQFua1TjiGkN/krG1UiW2COEKfp4LqV
         oDJYrQ6d8HaUJ56WeO5PrwEuLuW/5WamvPcB8GoKA2iHwvNE/8Z5oleYyAajvD7pyARz
         e7lhr5FDx28X3lTAZqESxGbVwZMIWRLTjws0wVKagk84PKvzvswn3q6UVO/G4i3x6eqP
         VczFrgfN+c9wV5VyPsaFdBZ8mIDFHx/PKhBul6BjB0UyzHIQDEsJcfElcky3EUthMdWS
         2YQ2v0LOY8KkOBHjLXDYjYxydduwDhU+fPgb3IFZC7TqJWSFpJc5/gDow3WZ37Psjthi
         PIZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=6sRkjmVhOwL6CdZ5aAVqczXmeSGgoS0sSd1QAioNC4c=;
        b=II8aPH0AjZAj6C5VSXtx8p6kkrN3yC+YktSXdvPCbELRJMxAQkkCdW9WQZ63MqkCnU
         H5r+OE7Y7Cv1DPSLbmVkZMLIqLf745euF4LYeNiSl6+9CBEo78hu+rqj/fAg/cR7kIIo
         ledgTkPyqeyrbN3+9nG2aJ4AKMTQt3CvddqXotbGOxNepRvqpQN+rJEjUghR04y/AR6R
         ngAvHIqaCgK7QZ5hBwjqmLg79tITW8a7YOKmTZqD8I030nte5rBm/AChHwna63sCP4EB
         zzjMad+4GGJelhBX8JG4A4dew9efngZcw1NAf3i26GP4zJeRXvo3IsNsM3N8lrWJY7kz
         GMUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fUN5VBDd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u12si2276381ybk.352.2020.11.13.02.18.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Nov 2020 02:18:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fUN5VBDd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kdW9n-0000Ut-7C
	for alex.bennee@linaro.org; Fri, 13 Nov 2020 05:18:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kdW8m-0007kR-V8
 for qemu-arm@nongnu.org; Fri, 13 Nov 2020 05:17:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kdW8k-0003ol-Ie
 for qemu-arm@nongnu.org; Fri, 13 Nov 2020 05:17:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605262629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6sRkjmVhOwL6CdZ5aAVqczXmeSGgoS0sSd1QAioNC4c=;
 b=fUN5VBDdEIaRow1qwuAqHQaoTQ33qDb56o6NWum75equbvB+fFQmTGWAB7JdKRXXo2a4V2
 x5/t/XY4s57c34p4CYU5COYZJLNOtIZ7rQUhT2wAdSk5mONX4LXsybno49cyQqAvcuWnAb
 0uviEwynA3FKtxo2W9obT060oVMma/M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-a0KpuTCzPcmg1Isflp5Ypw-1; Fri, 13 Nov 2020 05:17:07 -0500
X-MC-Unique: a0KpuTCzPcmg1Isflp5Ypw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A71BF64157;
 Fri, 13 Nov 2020 10:17:06 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 463305578C;
 Fri, 13 Nov 2020 10:17:06 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 003/122] cris: do not use ram_size global
Date: Fri, 13 Nov 2020 05:15:05 -0500
Message-Id: <20201113101704.1438368-3-pbonzini@redhat.com>
In-Reply-To: <20201113101704.1438368-1-pbonzini@redhat.com>
References: <20201113101704.1438368-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nQsHO1+q6EW5

Use the machine properties instead.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/cris/axis_dev88.c | 1 +
 hw/cris/boot.c       | 2 +-
 hw/cris/boot.h       | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/cris/axis_dev88.c b/hw/cris/axis_dev88.c
index dab7423c73..b0cb6d84af 100644
--- a/hw/cris/axis_dev88.c
+++ b/hw/cris/axis_dev88.c
@@ -333,6 +333,7 @@ void axisdev88_init(MachineState *machine)
     if (kernel_filename) {
         li.image_filename = kernel_filename;
         li.cmdline = kernel_cmdline;
+        li.ram_size = machine->ram_size;
         cris_load_image(cpu, &li);
     } else if (!qtest_enabled()) {
         fprintf(stderr, "Kernel image must be specified\n");
diff --git a/hw/cris/boot.c b/hw/cris/boot.c
index aa8d2756d6..9fa09cfd83 100644
--- a/hw/cris/boot.c
+++ b/hw/cris/boot.c
@@ -81,7 +81,7 @@ void cris_load_image(CRISCPU *cpu, struct cris_load_info *li)
     if (image_size < 0) {
         /* Takes a kimage from the axis devboard SDK.  */
         image_size = load_image_targphys(li->image_filename, 0x40004000,
-                                         ram_size);
+                                         li->ram_size);
         li->entry = 0x40004000;
     }
 
diff --git a/hw/cris/boot.h b/hw/cris/boot.h
index 218854e5d1..9f1e0e340c 100644
--- a/hw/cris/boot.h
+++ b/hw/cris/boot.h
@@ -6,6 +6,7 @@ struct cris_load_info
     const char *image_filename;
     const char *cmdline;
     int image_size;
+    ram_addr_t ram_size;
 
     hwaddr entry;
 };
-- 
2.26.2

