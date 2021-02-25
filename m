Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp184677lfg;
        Thu, 25 Feb 2021 01:15:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxOnEngGz85+kwmewSHJwiQo91BDXvcHAc0gLzTJIGlV4DYxIEKOCX0WIvaHVLTrMaQTa7q
X-Received: by 2002:a5d:9e42:: with SMTP id i2mr1969024ioi.193.1614244533378;
        Thu, 25 Feb 2021 01:15:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614244533; cv=none;
        d=google.com; s=arc-20160816;
        b=FY8e5QgXJMguEdGk/pRoGhOqN+fA9f4MEb1GkIueE3sScx5wMnAetIWkGV78f+lVOn
         loW4wfyFZ7/866HcNrkvYJPZ8Wr2m+9jeDy+J9vwTj7CSKO9hq+XxNvPFxAB4wyG+Pon
         WRK21nnKvglehWUSskymQ/aBhuunXlTPNiA2W5e99HfYkl3HoPTLfRa0LDqi1dB0JOc8
         asp//5vPdQ9fn8OlF4P4/8FG0kNOElleDfcFxrlsS8YBp4L1WIUeLM3qXCEUIuZPD2Ca
         QDzmKX6n3OFC24fGz6LBYNbMduq+oIGjFVqxGfJJcpNIAbYbpB3kqT7yBJ+MH7+Svjwg
         ZOcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=jVKKWvVoOg+XYg6v0Z6BnfNXsvRHogwcr1q+jcDS2Rw=;
        b=wQRU6C8WOGUkah1ewjPz7ViZf74v+vnyJdzoTS9MDWI389uadIzXtuWLTvml0aBhCc
         DIECHRzRzsB5MJIQJOKt/UGK6zkROw59hQUUZxCvUfjg/Y/q50/UQp0eTBfoxNgRShsU
         +u0BT/pkFwTnewE0Frr3TPhL9J5A9c5pljbNm1y0iVPvv2SB/OUFhC5PXYW2GYCTEtgB
         lh7VXrOqbUdeR/V8tPUE6I9ibtmc7DYgcO/qdnH9ilCyVk+FrIak8rtu8z/kw+K7xFDb
         55155FY2BTbdYlPd3qOzB+diBglIL3E8UrbcE10U4hcEQ40Tf3q2Rn8Lr5HgGitdXKaP
         5kbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UGWoH33s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t14si4564325ilg.7.2021.02.25.01.15.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Feb 2021 01:15:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UGWoH33s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lFCk8-0003Ik-JZ
	for alex.bennee@linaro.org; Thu, 25 Feb 2021 04:15:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lFCjd-0003Eh-HK
 for qemu-arm@nongnu.org; Thu, 25 Feb 2021 04:15:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lFCjb-00061X-RG
 for qemu-arm@nongnu.org; Thu, 25 Feb 2021 04:15:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614244499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jVKKWvVoOg+XYg6v0Z6BnfNXsvRHogwcr1q+jcDS2Rw=;
 b=UGWoH33sddropG9e3lt8IqlmQ2W3Vn79CERKlTXGGcVADww7gIXPdniohIFQFTMYxcTDu+
 xLzQVJFEml70NP4cynH4iOUhg2cQMyUouaUbLf81AVUrHSUj0DHrKtRBWS+j2F2i+Gghdi
 HxUVCkWuUnu2JKSoUAEFj5sCUNxtCdk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-tV2MiKr6N9erAjz57tsb9Q-1; Thu, 25 Feb 2021 04:14:55 -0500
X-MC-Unique: tV2MiKr6N9erAjz57tsb9Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 12A12814301;
 Thu, 25 Feb 2021 09:14:54 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-114-34.ams2.redhat.com [10.36.114.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4842963623;
 Thu, 25 Feb 2021 09:14:51 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, jean-philippe@linaro.org,
 peterx@redhat.com, jasowang@redhat.com, pbonzini@redhat.com
Subject: [PATCH v2 1/7] intel_iommu: Fix mask may be uninitialized in
 vtd_context_device_invalidate
Date: Thu, 25 Feb 2021 10:14:29 +0100
Message-Id: <20210225091435.644762-2-eric.auger@redhat.com>
In-Reply-To: <20210225091435.644762-1-eric.auger@redhat.com>
References: <20210225091435.644762-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: vivek.gautam@arm.com, shameerali.kolothum.thodi@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C4/aQh73KnXX

With -Werror=maybe-uninitialized configuration we get
../hw/i386/intel_iommu.c: In function ‘vtd_context_device_invalidate’:
../hw/i386/intel_iommu.c:1888:10: error: ‘mask’ may be used
uninitialized in this function [-Werror=maybe-uninitialized]
 1888 |     mask = ~mask;
      |     ~~~~~^~~~~~~

Add a g_assert_not_reached() to avoid the error.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/i386/intel_iommu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index b4f5094259..3206f379f8 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -1884,6 +1884,8 @@ static void vtd_context_device_invalidate(IntelIOMMUState *s,
     case 3:
         mask = 7;   /* Mask bit 2:0 in the SID field */
         break;
+    default:
+        g_assert_not_reached();
     }
     mask = ~mask;
 
-- 
2.26.2

