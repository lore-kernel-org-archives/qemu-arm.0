Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp2393144ejb;
        Sun, 3 Dec 2023 16:51:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFMJVyVX++K9KZzIAJoEEUTHHA/4hxwCiFfGK3rKJVhs913qRKZeO0spoSQNx/thCXRUfIv
X-Received: by 2002:a05:6214:d81:b0:67a:a6e6:ab6 with SMTP id e1-20020a0562140d8100b0067aa6e60ab6mr4990670qve.3.1701651069231;
        Sun, 03 Dec 2023 16:51:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701651069; cv=none;
        d=google.com; s=arc-20160816;
        b=ByNZQBR+dic2/2/4aYzpzZrHjlA/ay+NBrIPnT3JHyBM+waJZvCUKBG3vf15HAcqaC
         I/dsKvi2VepwEo4084xq7hi4Jo0zk8+nLZJYujNCP2daLbmFg6N5ORlkgaY+Lxn3w3/B
         3CTKsw7w6XL607q/95GOZKJl7Pyf1E1pg4zWD/8yAg4fkzFZ1s/HlSTHm/JwrbxzE6KV
         0YsrxOthF96fAh4Xy+0T0LanvuqsDU3wrh5n+tVt9c+3fovCAVPtlbvCulaprgcJk8c4
         lzkeBpnAIXKmBsBg7yZbE+CChxqrRubQM6BybDxu1OUwosgPfg1OOnAJZw7XpkXlfLCe
         K20A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:dkim-signature;
        bh=W+sBfUbkBu8GbdgecjTf7+hqFuVu0mmAyZFP7UyKFg4=;
        fh=iuLTZZ1fjCI8LjSgJoBa8MYZ2BtgjMRkSSF1C0uH4/8=;
        b=L1GcHZQWXRrNo/L82Neud7ZS55+iGh6dVsc6hiLicN9d4kc0esyMYa3rFwHQTuW/7i
         0dh/AmPMo1yLrQaC7RMM/PyBEWKKpF5VP/5kGT843Kre8/FGudumASo01OE6wfSn4rq2
         Rv2+KFgefCPuOm4kLSFlG+jYvGpSlHaf0+zjWEekozrAzMamgKzM2l9naxlQm3vi2weG
         UxeozOLWmEj5grkCmDCLWLpobApqTzGxhjbyKVIpDftV9Cxe78/3cbwzlcXfIydkAzk6
         ymVg7bVNBR31ycB9NbToNjCgHSEqGM3tGzx+c9alo7VRPNyhqsROh5I/Re62O7YLtiwZ
         IDZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Yz43JpFp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a25-20020a0ca999000000b0067a956d98d7si6855628qvb.358.2023.12.03.16.51.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Dec 2023 16:51:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Yz43JpFp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r9x8R-0004o2-Bd; Sun, 03 Dec 2023 19:48:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r9x8J-0004lC-52
 for qemu-devel@nongnu.org; Sun, 03 Dec 2023 19:48:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r9x8H-0001ba-63
 for qemu-devel@nongnu.org; Sun, 03 Dec 2023 19:48:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701650900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:mime-version: content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W+sBfUbkBu8GbdgecjTf7+hqFuVu0mmAyZFP7UyKFg4=;
 b=Yz43JpFpbR8+rqafW9VRJNhcYTANWuD7vTsD8Mnd7AxoLi2LKul7+l8KfG9y3bPKcQtI3f
 D+6y5HJxT/mTmOT55l5UrE/TWHzWuqL0SBrLoTwV0ROCNBx7E5QsBXeArFFhPaIl1pmTEC
 Cd2/rfLRl2Zr6stj4zo+XUEztVY5kSg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-378-wjT2K2WkO3Wz5g1HrKdYmQ-1; Sun, 03 Dec 2023 19:48:15 -0500
X-MC-Unique: wjT2K2WkO3Wz5g1HrKdYmQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C4265811E7B;
 Mon,  4 Dec 2023 00:48:13 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7793C492BE0;
 Mon,  4 Dec 2023 00:48:06 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 b.galvani@gmail.com, strahinja.p.jankovic@gmail.com, imammedo@redhat.com,
 kfting@nuvoton.com, wuhaotsh@google.com, nieklinnenbank@gmail.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 armbru@redhat.com, wangyanan55@huawei.com, vijai@behindbytes.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, shan.gavin@gmail.com
Subject: [PATCH v9 3/9] machine: Improve is_cpu_type_supported()
Date: Mon,  4 Dec 2023 10:47:20 +1000
Message-ID: <20231204004726.483558-4-gshan@redhat.com>
In-Reply-To: <20231204004726.483558-1-gshan@redhat.com>
References: <20231204004726.483558-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
X-TUID: DsiExyt6cdqQ

It's no sense to check the CPU type when mc->valid_cpu_types[0] is
NULL, which is a program error. Raise an assert on this.

A precise hint for the error message is given when mc->valid_cpu_types[0]
is the only valid entry. Besides, enumeration on mc->valid_cpu_types[0]
when we have mutiple valid entries there is avoided to increase the code
readability, as suggested by Philippe Mathieu-Daudé.

Besides, @cc comes from machine->cpu_type or mc->default_cpu_type. For
the later case, it can be NULL and it's also a program error. We should
use assert() in this case.

Signed-off-by: Gavin Shan <gshan@redhat.com>
v9: assert(mc->valid_cpu_types[0] != NULL)                   (Phil)
    assert(cc != NULL);                                      (Phil)
---
 hw/core/machine.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 1797e002f9..4ae9aaee8e 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1400,6 +1400,7 @@ static bool is_cpu_type_supported(const MachineState *machine, Error **errp)
      * type is provided through '-cpu' option.
      */
     if (mc->valid_cpu_types && machine->cpu_type) {
+        assert(mc->valid_cpu_types[0] != NULL);
         for (i = 0; mc->valid_cpu_types[i]; i++) {
             if (object_class_dynamic_cast(oc, mc->valid_cpu_types[i])) {
                 break;
@@ -1409,20 +1410,27 @@ static bool is_cpu_type_supported(const MachineState *machine, Error **errp)
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
 
     /* Check if CPU type is deprecated and warn if so */
     cc = CPU_CLASS(oc);
-    if (cc && cc->deprecation_note) {
+    assert(cc != NULL);
+    if (cc->deprecation_note) {
         warn_report("CPU model %s is deprecated -- %s",
                     machine->cpu_type, cc->deprecation_note);
     }
-- 
2.42.0

