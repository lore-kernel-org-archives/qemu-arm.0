Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp2393000ejb;
        Sun, 3 Dec 2023 16:50:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE8I19LiD/b0bnI4LMXu+C+1LyXxw9acIoqzUDLNFJuy4dcvvPRcsGQeOOwy7Y66bst9may
X-Received: by 2002:a05:620a:3993:b0:77d:bf8d:3b3b with SMTP id ro19-20020a05620a399300b0077dbf8d3b3bmr2995950qkn.66.1701651045115;
        Sun, 03 Dec 2023 16:50:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701651045; cv=none;
        d=google.com; s=arc-20160816;
        b=i1ypeGObY7fRtYQfcVmJNdPjjWvsnCuC+xtw0MVvQKFH15FPuZdF4rrG7E4MCkN2h3
         gBx+lQeERssxYfAn0V1kKli36lVZX70Msq1Y008ygc53QyiAcG4ohVBPUO2l+fOYo2B/
         OW8Mgsy6wswdizaFEGPIISW6q5XLbPjAuDd5NetdCC07J1Gu4mIUf6IIR5ma7MKxItn7
         fV06dwb3rYWMnYR9Rgib+6lq1GvAKW+Ks0nLkvFnp8O60skmLpf1bqGvE8VFv3KMAFCI
         Lcg7DdxmB02Cy0DOf9o4oEz8gEFLl8w9+aqvyBXNCRhvVkzLcGzRp3BVlXoeiCUclKHu
         Yw0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:dkim-signature;
        bh=gpbV82qGBKd5oIHMbMKLl4F0HFwfyL0yOGTqandIxRk=;
        fh=iuLTZZ1fjCI8LjSgJoBa8MYZ2BtgjMRkSSF1C0uH4/8=;
        b=Fu5HFpi1MeBBpBcjf5Gn12UQIBGnhnNmWPjaC9OLuswGjrlTsrlTQTTMoenfa2l4mW
         HGOmX6Knc4yKyB3XklsfCV11vHIpqJpU2oP5tmuuhfr55+NXFTr1MSL97lalEskvR1Fd
         wP2iuBL/XuQSoDVF/LMiXaqh0g/J6/WKt2y9yvJc+XvKOGyb7jx0rQAtdA+KRlaqrWUJ
         C98qKPnAE0IMbgaaOFyRsiYwmCUjK1Q4OJ4xYnQsW0I2bXvzuxGjFyGJC0yKi9Ulp3ip
         3yjWVRgFwk2NOFon8GVlQkelkwblWpdKteIdxDrVUPfTPXZ9fNU+5BUPFhR7gMC9hXKK
         vaJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZzM5AjLx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qs10-20020a05620a394a00b0077dc67bca0csi8495834qkn.343.2023.12.03.16.50.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Dec 2023 16:50:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZzM5AjLx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r9x8V-0004rk-0V; Sun, 03 Dec 2023 19:48:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r9x8S-0004oJ-E0
 for qemu-arm@nongnu.org; Sun, 03 Dec 2023 19:48:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r9x8Q-0001oN-3h
 for qemu-arm@nongnu.org; Sun, 03 Dec 2023 19:48:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701650909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:mime-version: content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gpbV82qGBKd5oIHMbMKLl4F0HFwfyL0yOGTqandIxRk=;
 b=ZzM5AjLxrN4mdR0sX1nBNgmfLKlYUWrVEKkY5wsRFzQwETS5alhOebl11g6tersZxYAQjL
 Pr7coVNKWHs46ll58ZItivgA4ln6+02ktVCe1GJRYCTN/v7FK1jLtZQkV2DPFrrBl8CnEO
 tMnHh+cYLzSLi75g2Tf4hgZJiGyMSWc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-524-3_JiSl4pNEqPU4ewERfprA-1; Sun, 03 Dec 2023 19:48:23 -0500
X-MC-Unique: 3_JiSl4pNEqPU4ewERfprA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 17B3A185A780;
 Mon,  4 Dec 2023 00:48:22 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C624492BE0;
 Mon,  4 Dec 2023 00:48:14 +0000 (UTC)
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
Subject: [PATCH v9 4/9] machine: Print CPU model name instead of CPU type
Date: Mon,  4 Dec 2023 10:47:21 +1000
Message-ID: <20231204004726.483558-5-gshan@redhat.com>
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: UMoGkgFa6DSk

The names of supported CPU models instead of CPU types should be
printed when the user specified CPU type isn't supported, to be
consistent with the output from '-cpu ?'.

Correct the error messages to print CPU model names instead of CPU
type names.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/core/machine.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 4ae9aaee8e..bc9c3e7dcd 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1409,15 +1409,19 @@ static bool is_cpu_type_supported(const MachineState *machine, Error **errp)
 
         /* The user specified CPU type isn't valid */
         if (!mc->valid_cpu_types[i]) {
-            error_setg(errp, "Invalid CPU type: %s", machine->cpu_type);
+            g_autofree char *requested = cpu_model_from_type(machine->cpu_type);
+            error_setg(errp, "Invalid CPU model: %s", requested);
             if (!mc->valid_cpu_types[1]) {
-                error_append_hint(errp, "The only valid type is: %s\n",
-                                  mc->valid_cpu_types[0]);
+                g_autofree char *model = cpu_model_from_type(
+                                                 mc->valid_cpu_types[0]);
+                error_append_hint(errp, "The only valid type is: %s\n", model);
             } else {
-                error_append_hint(errp, "The valid types are: ");
+                error_append_hint(errp, "The valid models are: ");
                 for (i = 0; mc->valid_cpu_types[i]; i++) {
+                    g_autofree char *model = cpu_model_from_type(
+                                                 mc->valid_cpu_types[i]);
                     error_append_hint(errp, "%s%s",
-                                      mc->valid_cpu_types[i],
+                                      model,
                                       mc->valid_cpu_types[i + 1] ? ", " : "");
                 }
                 error_append_hint(errp, "\n");
-- 
2.42.0

