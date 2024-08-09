Received: by 2002:a05:7022:d82:b0:85:21:bd5b with SMTP id ec2csp1364858dlb;
        Thu, 8 Aug 2024 20:52:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXIQUiQmbGtajFQRTOiC58kO04ujuErqdpbCWUPFZ30fKJ6oRAHzFiNX9WCbOvpLdZooeYsjFDsIIapTVunKYOgVGAQPrKA
X-Google-Smtp-Source: AGHT+IEMbz/e7m2CtSzn8xRbJdvJskTPpUUGYvGi+n8Gl3RH/xlalU/vQhgLQHFQIQAcmebPbiQT
X-Received: by 2002:a05:620a:2906:b0:79d:7506:f194 with SMTP id af79cd13be357-7a4c182c8a2mr29241185a.48.1723175566065;
        Thu, 08 Aug 2024 20:52:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723175566; cv=none;
        d=google.com; s=arc-20160816;
        b=uUbTzQ+KtR1/H0e9m4m7R7yObkNBO23jBDLTRDftEnIf4izQV9bABqO0PuAlgpbJyN
         pdySUSe3TaG5Ai0/9r2wMiX6koubQOn7I6VuBUgaxcTiEg5mrZJ161oHkz4QnRfA1mil
         VJO5XsBBElhNfMFdc3uzCtDQw2YGo2v72lcTaYzF4nqKmaczCcP2yLZURAQ0xg3v66EM
         6Rc9Jfiz5v4pPOv0yHGWXGA9bMiQK7zSeU+fGf6l5RA4Zg0hTKzK/jI62bzo9l9kcZKN
         7hh4PsJLEUT4fSpoRb00n/uvqo7yWBTRVrL6RuvLywEio9Gn+bt/8yPYlDKMF3VI8cX7
         pQlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/c6EqP/YoqNulAdFCGy0hvA3w3OnVqkAzw2ekzsC/HA=;
        fh=XX+dgkgF1NhCVN+iBAG+rOLypjsAs0LmRKXD2YPrEGE=;
        b=ffelBm5sPEsBbS5thFg/V62tCaMStTvQus5fRP0+ATvhvPtdE9/VWZHa+aIbI/hrrh
         ou/hwseKnSboOLECqzD92trrdyHHl5ZwgSewOc7lLWo1pDQL0ZT5zG83Ftxfk75vsm0l
         5uiHt/xPHw0sgCBbo15qQ1jhK0VEs5ZwxvAZt195lCkfLzAOS9a0qMdNnqXjHUvhLrYV
         xkPiUCEJSzUykMEkr+0M1oo8KsYv7r2JXeeyiozhDP7Metq9rKHhM/lHih8O0+J86y6K
         cpFVvFm91p/7RA+gtvPKufo8zmzE4v/eYVNeD5d8//e7Rmo16jJZVh/AvT8fqMX+t9+z
         nZTA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hAKiwNak;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a3788727b2si580662885a.720.2024.08.08.20.52.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Aug 2024 20:52:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hAKiwNak;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1scGfo-00004u-O2; Thu, 08 Aug 2024 23:52:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1scGfn-0008R9-Ey
 for qemu-arm@nongnu.org; Thu, 08 Aug 2024 23:52:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1scGfl-0008N8-Vp
 for qemu-arm@nongnu.org; Thu, 08 Aug 2024 23:52:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723175532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/c6EqP/YoqNulAdFCGy0hvA3w3OnVqkAzw2ekzsC/HA=;
 b=hAKiwNaklBDFJC3Iy4ZBmrzNt0P29RlS5LLxoUVd7x0zXaF/6ei/LrC2ritBaQoODrf6ZI
 GXppKmTUmM89OVMOrpb/k30STQKnih6Gzl/L6UoW0SFUlqjVkcgjJXg0EuhXgn6tc7myMW
 vTtZ1akqC74deqfm/UY7GJp5Rl9n8n4=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-571-zm1sdnNlM-6PbUX1ItSeAA-1; Thu,
 08 Aug 2024 23:52:08 -0400
X-MC-Unique: zm1sdnNlM-6PbUX1ItSeAA-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id BF44D1955D8E; Fri,  9 Aug 2024 03:52:07 +0000 (UTC)
Received: from gshan-thinkpadx1nanogen2.remote.csb (unknown [10.64.136.133])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 6D621195917D; Fri,  9 Aug 2024 03:52:04 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, pbonzini@redhat.com,
 philmd@linaro.org, richard.henderson@linaro.org, shan.gavin@gmail.com
Subject: [PATCH 2/4] hw/arm/virt: Avoid multiple lines of comments in
 virt_kvm_type()
Date: Fri,  9 Aug 2024 13:51:31 +1000
Message-ID: <20240809035134.699830-3-gshan@redhat.com>
In-Reply-To: <20240809035134.699830-1-gshan@redhat.com>
References: <20240809035134.699830-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.141,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: buonyYCuomjk

The comment needn't to span multiple lines and can be merged to
one line perfectly.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/arm/virt.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 83be57db37..09b7a158a9 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3005,9 +3005,7 @@ static int virt_kvm_type(MachineState *ms, const char *type_str)
 
     requested_pa_size = 64 - clz64(vms->highest_gpa);
 
-    /*
-     * KVM requires the IPA size to be at least 32 bits.
-     */
+    /* KVM requires the IPA size to be at least 32 bits */
     if (requested_pa_size < 32) {
         requested_pa_size = 32;
     }
-- 
2.45.2

