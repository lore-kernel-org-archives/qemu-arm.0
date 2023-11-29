Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp2384228ejt;
        Tue, 28 Nov 2023 20:21:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFgzqFhVff63W3soEHr/wrd10xEMZ5VLcPvLmWbh2+h1RoppF1OJkn/Ln6+TYuoWVxYwFr4
X-Received: by 2002:ac8:7d56:0:b0:423:6fc5:9650 with SMTP id h22-20020ac87d56000000b004236fc59650mr20418423qtb.18.1701231700833;
        Tue, 28 Nov 2023 20:21:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701231700; cv=none;
        d=google.com; s=arc-20160816;
        b=XW9z5lwa1rkcv7Irjhiv7vZ4RDYNgpbksl2AIo9O3TPvVEoGNAFxXI5oxF8M8m25Wd
         kgGBu2NhM6p014WGH5anI/D4+Y8cuwtyZipsEpyWLyNsx/jY0o1n7fZkade57m0y/kzw
         VsaXKHuEMtQbn+LaZ3PYALL36tP6cw7+N6oJH+Ak3WqCEtv0ndJ4TOxJMppykgO0MoOE
         Oun1NesIB+qeUKYfVzq03LjYNb7FNZiUHnYC2ZjHLp3VJgXopUgI7GI8xLIzJkSZ2/aQ
         4LeG9UT8uta8D94kvWt0mj0NuOznmWZkHT7f/xFhMCbHZXU4lU5BPgsKPuW3qv+W3ogU
         AGtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:dkim-signature;
        bh=rr2m9uLY9gv8gvMR4JCOjuGK7rtk1pBD/3lJjahEE0A=;
        fh=dYswejlzixW+/pN5BDGaZGk2aL8UDmDK4StoDp2TZgs=;
        b=VOrKrp9v4TOI0E4hne5LGHakwAm8DIfbpjJFUUknSuNnLxMtOKqO7DG9h3GdLEYoYe
         omfdLBVTVDQeW+jORh9zxf/6DYx+0RpgiWF1TvA9J2Pl7HcYr3lmeRgP0tPbFLWigLy9
         eEa3/LTADncpCNOpivDWtJE/aJn65o7pOmm3IB2F5nmONZ4Sz1m0Hj9CeUvFyG5wvRTV
         KreAuOjWxtIOM602ssENpOCfJ9YOx6hIziDWblTS78iQ3hOkzTeHxjGJRFwQyhic5Wa7
         cXih/HEzoG++VXVjtiYz5E9mHs1fA7gNnx9TTFBM9zXlK1KOpWpfPHdbHeyVAp413XqZ
         5gWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eukkE18f;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c10-20020ac87dca000000b0042384d73c82si12903265qte.301.2023.11.28.20.21.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Nov 2023 20:21:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eukkE18f;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r8C4f-0001pZ-Cb; Tue, 28 Nov 2023 23:21:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r8C4d-0001mA-GM
 for qemu-devel@nongnu.org; Tue, 28 Nov 2023 23:21:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r8C4Z-0007Ls-H9
 for qemu-devel@nongnu.org; Tue, 28 Nov 2023 23:21:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701231667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:mime-version: content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rr2m9uLY9gv8gvMR4JCOjuGK7rtk1pBD/3lJjahEE0A=;
 b=eukkE18f31G18MmoxvTs70H6T6yiVaPSUEUrIV4Wqp00H8xUZOLSY6Kq67u1I1JxvvwdX8
 62kXM+KkIoiHPk9DO+34c0m3Fe7ecw3nV80iQKyQVwxMti9eTChdwl8zF65809qmRNxbAV
 f7oihIbMchMBy6sjK6sLuLdXm21hrFA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-ogIs5iOOPOCjXSBTxEl1Ag-1; Tue, 28 Nov 2023 23:21:02 -0500
X-MC-Unique: ogIs5iOOPOCjXSBTxEl1Ag-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5165180C347;
 Wed, 29 Nov 2023 04:21:01 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 14B5D492BE0;
 Wed, 29 Nov 2023 04:20:52 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 imammedo@redhat.com, b.galvani@gmail.com, strahinja.p.jankovic@gmail.com,
 sundeep.lkml@gmail.com, kfting@nuvoton.com, wuhaotsh@google.com,
 nieklinnenbank@gmail.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 vijai@behindbytes.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, shan.gavin@gmail.com
Subject: [PATCH v8 3/9] machine: Improve is_cpu_type_supported()
Date: Wed, 29 Nov 2023 14:20:06 +1000
Message-ID: <20231129042012.277831-4-gshan@redhat.com>
In-Reply-To: <20231129042012.277831-1-gshan@redhat.com>
References: <20231129042012.277831-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: WSrL3nLJmE/Q

It's no sense to check the CPU type when mc->valid_cpu_types[0] is
NULL. So the check is skipped for this particular case. The constraint
has been taken when the error messags are appended.

A precise hint for the error message is given when mc->valid_cpu_types[0]
is the only valid entry. Besides, enumeration on mc->valid_cpu_types[0]
when we have mutiple valid entries there is avoided to increase the code
readability, as suggested by Philippe Mathieu-Daudé.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/core/machine.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 1797e002f9..c58c84abf5 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1399,7 +1399,7 @@ static bool is_cpu_type_supported(const MachineState *machine, Error **errp)
      * CPU types have been determined. Note that the user specified CPU
      * type is provided through '-cpu' option.
      */
-    if (mc->valid_cpu_types && machine->cpu_type) {
+    if (machine->cpu_type && mc->valid_cpu_types && mc->valid_cpu_types[0]) {
         for (i = 0; mc->valid_cpu_types[i]; i++) {
             if (object_class_dynamic_cast(oc, mc->valid_cpu_types[i])) {
                 break;
@@ -1409,13 +1409,19 @@ static bool is_cpu_type_supported(const MachineState *machine, Error **errp)
         /* The user specified CPU type isn't valid */
         if (!mc->valid_cpu_types[i]) {
             error_setg(errp, "Invalid CPU type: %s", machine->cpu_type);
-            error_append_hint(errp, "The valid types are: %s",
-                              mc->valid_cpu_types[0]);
-            for (i = 1; mc->valid_cpu_types[i]; i++) {
-                error_append_hint(errp, ", %s", mc->valid_cpu_types[i]);
+            if (!mc->valid_cpu_types[1]) {
+                error_append_hint(errp, "The only valid type is: %s\n",
+                                  mc->valid_cpu_types[0]);
+            } else {
+                error_append_hint(errp, "The valid types are: ");
+                for (i = 0; mc->valid_cpu_types[i]; i++) {
+                    error_append_hint(errp, "%s%s",
+                                      mc->valid_cpu_types[i],
+                                      mc->valid_cpu_types[i + 1] ? ", " : "");
+                }
+                error_append_hint(errp, "\n");
             }
 
-            error_append_hint(errp, "\n");
             return false;
         }
     }
-- 
2.42.0

