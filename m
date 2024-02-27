Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2755969ejf;
        Tue, 27 Feb 2024 07:49:44 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWC1QSXfl3mkOl+cnbVezAN7k3C1N81KiO//ssJ6szOh/cpwgBXw2MHTFBvZgcg1v4YeCg7JRorb8WFVAFHlYmMSLqFwOwd
X-Google-Smtp-Source: AGHT+IEZAZMnEt+Qp8GdZFo8tpmiW+1b0xOXVnzPP+n/O07co0Cw0iJwRpXOFtQvhyW0rltGr8lf
X-Received: by 2002:a05:622a:1706:b0:42e:980f:41ef with SMTP id h6-20020a05622a170600b0042e980f41efmr3227183qtk.29.1709048984667;
        Tue, 27 Feb 2024 07:49:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709048984; cv=none;
        d=google.com; s=arc-20160816;
        b=QF0R327is1NXeErgMWkyBcq2+CSNijqpBm7sBypOVssShCk09LT8oMWaMV4ogcF5m/
         BBLPK3wvRaTNwPtwYEXYcW6JRiBaDoBAjA8MQLR+65O1vnUcuQR5truG8KQH95vaX9V1
         ceBlFJgWvmcgmI4ORvNIDn6hWzexO4Ob1jc+25ODR3YlZAauMtpQKRgSkWARgdlLU9Rt
         lAgBelNxMQrKxTNSAKuugyQSGyH86ddY4B5qGKnpZRWd3o7SYWNhgV+p7UrchDNYGqlG
         xHgasaecfk1+ER/jx6WAAYhWJ1rfOMaXDJkYsr/VIcfIw15vkwTlsivJ7hMsepZAksrA
         elVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=r468GTQtC4d5jJd7SLd6NPQuY4QdLHJvhhXe2YaCRMA=;
        fh=cWYLLp2xiaCPawONafvmArBA+kFDFtOI7kkn8ypnRsk=;
        b=U24cLaVnzLEQi8XNj6nzCMlzyMU8y6fi2g/u6NQ+Mb9fHa6kAZSb0rCno9AmDyI7TB
         z4W7DvdoZ/Mgi244l1KnDVxxSFmDQxQ1/Yi/X1B9SwxgVRCdQtVLCCnzxlnYQR2KGbh3
         /G5HjMm0RpqJvud/4BdrpLwj9j/oZDBYZkrE5N/NknhbY4D95//BEIcf7W6VobfKHLT7
         vbOyCmYCJ3TeTo4mJag/nLksN/WYceOGOyckGccJ1EtqTlDmzgcznnzNub4yv53A1ji8
         veDo/EeMZuMv0pmaYMBdJl14UYrJa09cebx0oIgNVw7D+DH+PRvuEtVdyTGqGazIMKrA
         m22A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RNMK0fOj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a2-20020ac87202000000b0042e06aa4704si7490768qtp.12.2024.02.27.07.49.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Feb 2024 07:49:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RNMK0fOj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rezh9-0005jn-Td; Tue, 27 Feb 2024 10:48:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1rezh7-0005j0-L6
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 10:48:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1rezh6-0008TM-C6
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 10:48:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709048915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r468GTQtC4d5jJd7SLd6NPQuY4QdLHJvhhXe2YaCRMA=;
 b=RNMK0fOjn7l8FKtOhIdRplfv529hdEYbjiZt5EgVRMkrBpySXsrjbSo3mw27o1lZGVknLt
 mqaIopuIReUSBaO0Z2xBSYYhYR9Y0wyHiTUh5b6V7BSNk3XDBiH6DaQ4Ch+wJbHDIuJ50c
 8pebm1a0VZ/tnYDiO+aUx5TKNgXMBUk=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-250-Ev7Hl-_nOdm7n51HnuaERw-1; Tue,
 27 Feb 2024 10:48:32 -0500
X-MC-Unique: Ev7Hl-_nOdm7n51HnuaERw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 77B523C1E9D0;
 Tue, 27 Feb 2024 15:48:31 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE27D2166B33;
 Tue, 27 Feb 2024 15:48:28 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, pbonzini@redhat.com, mst@redhat.com,
 gaosong@loongson.cn, alistair.francis@wdc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, imammedo@redhat.com, anisinha@redhat.com,
 philmd@linaro.org, wangyanan55@huawei.com, eblake@redhat.com,
 armbru@redhat.com, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 f.ebner@proxmox.com
Subject: [PATCH 13/19] smbios: extend smbios-entry-point-type with 'auto' value
Date: Tue, 27 Feb 2024 16:47:43 +0100
Message-Id: <20240227154749.1818189-14-imammedo@redhat.com>
In-Reply-To: <20240227154749.1818189-1-imammedo@redhat.com>
References: <20240227154749.1818189-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: DGuXYLlWmSeY

later patches will use it to pick SMBIOS version at runtime
depending on configuration.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 qapi/machine.json | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/qapi/machine.json b/qapi/machine.json
index 93b4677286..4c68528507 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1802,10 +1802,13 @@
 #
 # @64: SMBIOS version 3.0 (64-bit) Entry Point
 #
+# @auto: Either 2.x or 3.x SMBIOS version, 2.x if configuration can be described
+#        by it and 3.x otherwise (since: 9.0)
+#
 # Since: 7.0
 ##
 { 'enum': 'SmbiosEntryPointType',
-  'data': [ '32', '64' ] }
+  'data': [ '32', '64', 'auto' ] }
 
 ##
 # @MemorySizeConfiguration:
-- 
2.39.3

