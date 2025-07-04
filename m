Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1249622dyc;
        Fri, 4 Jul 2025 07:22:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWgQABKPt3qEhLjwUPEllWVDI3rxgCi9JfLBzHy01BjmIWxhltAf9CHGVKHDmSUJinjGKt/OiXj0630Bw==@linaro.org
X-Google-Smtp-Source: AGHT+IEy4xtk2e7Easr0BkG65HCSFuKPu7BW9ZuM2kCxTFj2YXjLFv088jYKQ5GgM3vO2YgEyqVg
X-Received: by 2002:ac8:7f49:0:b0:494:5805:c2b9 with SMTP id d75a77b69052e-4a996854acfmr43239711cf.31.1751638936756;
        Fri, 04 Jul 2025 07:22:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751638936; cv=none;
        d=google.com; s=arc-20240605;
        b=J3wqKFIYVVGIJbE6FsWq51HuSQ/FhSFGuBlB92Ex2JzpmcwY/4JuR2gKwCt9TOeLt9
         OCrAwxQEHlqbDpm9MWvgHO4ebIAGgREN0pereQTCvfwMy+Ne9SRtTZbQ2adDAXefB4pi
         MNonXElVzSLDqKOUBqmf1zXKlfceoOYRnUYqxvOSkuVkILlDdN5ijlw/XezzLGqCV+QP
         74dRFDQzsKJXxUBZkg7wmrKjzgUqQ88PYzJnev8N1aaC4W4KXOMA2/6V/GLRuGRCWZQF
         RUidxrrMjqibt3JAnnHv1AqovhMRKVMQPgyJvCcGnobuUKs33xaENB/97QKa9nu15Rex
         tD7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=BXq/TWo0J4bekJDCOo3hKeCjbVUNwgGjqkUO0Euh61U=;
        fh=47nbNcdFoHdx4vFkcZle5phKNunXZjbcCr/4dP29blM=;
        b=GT3FvoZTOCTPTdJn8X4V2rYg4H9a4N9TXHltnz/tGTfjsueOxHiuqy5a/hngfxVs8y
         oWQUk4fRsJRjqeGG/l9CxbE3O+pEUaDWU5oS3wLXXufCXgBDZq3tErnfunsoBzZu+Zi1
         r2SCDz78x09qUF7QKAwRKXQsBkyzAgakDK/326wskJyZmK0vd0RpX4Uthw59NyRSyq0w
         G8RbzCH9TJFNKDynSmBQwZJs3kbV1h6nVLYcO2mUU1P7GO7cNf7SaFvU8diMQbACPGz1
         UHDBa0lrN8J/9f6f/C7NN6oyR4aN195gok0wqnNb7y0nSgXFPIwi7S1qUkKO1GJ54BCU
         RHZw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AoC8ojSH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a9949f3b07si22076111cf.82.2025.07.04.07.22.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:22:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AoC8ojSH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXhGt-0003aF-29; Fri, 04 Jul 2025 10:20:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1uXhGa-0003Ut-6A
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:19:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1uXhGY-0003PO-2I
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:19:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751638789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BXq/TWo0J4bekJDCOo3hKeCjbVUNwgGjqkUO0Euh61U=;
 b=AoC8ojSH95zUSVO8+JGzt/2Suy9rBlqvT5RPwVIuX7/6+d9QMT4XlmR9iwG02J0Mzz0+hx
 92hUDPsXibFlkwl4WZdZzwTQIz7PsdG6/MhYmsbo3fGlwGHbIH2ZSDETQFEMTcUIyyfchh
 bRkEuG4SHeYBtC6bX2LV/FlhCVwqnNo=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-350-DMT8h4TGPOyKAjfy8f4MAg-1; Fri,
 04 Jul 2025 10:19:48 -0400
X-MC-Unique: DMT8h4TGPOyKAjfy8f4MAg-1
X-Mimecast-MFC-AGG-ID: DMT8h4TGPOyKAjfy8f4MAg_1751638787
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 16BD019560A1; Fri,  4 Jul 2025 14:19:47 +0000 (UTC)
Received: from gondolin.redhat.com (unknown [10.44.34.37])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id F360A195608F; Fri,  4 Jul 2025 14:19:44 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Eric Auger <eric.auger@redhat.com>, Sebastian Ott <sebott@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH 5/5] arm/kvm: shorten one overly long line
Date: Fri,  4 Jul 2025 16:19:27 +0200
Message-ID: <20250704141927.38963-6-cohuck@redhat.com>
In-Reply-To: <20250704141927.38963-1-cohuck@redhat.com>
References: <20250704141927.38963-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 15
X-Spam_score: 1.5
X-Spam_bar: +
X-Spam_report: (1.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.218,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: JAqUtLEpiqt9

Fixes: 804cfc7eedb7 ("arm/cpu: Store aa64isar0/aa64zfr0 into the idregs arrays")
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/arm/kvm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 426f8b159e82..8ab0d692d36a 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -230,7 +230,8 @@ static uint64_t idregs_sysreg_to_kvm_reg(ARMSysRegs sysreg)
 }
 
 /* read a sysreg value and store it in the idregs */
-static int get_host_cpu_reg(int fd, ARMHostCPUFeatures *ahcf, ARMIDRegisterIdx index)
+static int get_host_cpu_reg(int fd, ARMHostCPUFeatures *ahcf,
+                            ARMIDRegisterIdx index)
 {
     uint64_t *reg;
     int ret;
-- 
2.50.0

