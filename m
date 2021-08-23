Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp2001120lfg;
        Mon, 23 Aug 2021 09:07:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9PO6x8RhH39SGZ1wtgnJ+4R3cO/RMvbKEtGhNuDFtkxp0cGsM9JBYIVBSNCAp82q8s3rC
X-Received: by 2002:a17:906:ff41:: with SMTP id zo1mr6029095ejb.525.1629734863419;
        Mon, 23 Aug 2021 09:07:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629734863; cv=none;
        d=google.com; s=arc-20160816;
        b=ZDZkTHlvvTO5BlfN3U+NpDlQgowxxY/dsJnhqZHgZNJG4i2HSXD1LVQeHAdzlCf/0R
         uXqsz7v8Ttjk9O+xG/OuqQLkkwTZerWr8DNr7vpTrKZLmBXXq0j8+W+2itjWoQi1Y50c
         /ijMTiv+tn9fxRR6xsr4flOZmTxVzBqmc/Lbp6x3ZYp1VM3ZHd27x4E8SdPPdCdXOJ8d
         SvK56p4nZXy9R0ZSz6ark/5/aPyiZV4xuMwWE17qj+JQ6GV9CiMpMRoiLY6FaqMO4Gnh
         Kub6rFVWLNnK/z/Spxnm7V4mGFnTzkAqPL5tg0wQ8tZ4g55nTXQdp6lfuAP25ZaDq1pm
         xguw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ZK4ROJZ0pGE5cDcdV6LxkQKwph4f2pa5k450CDwBwwE=;
        b=Q8DLlY3xM1cobEiEgM1m7dQxQRnktIEvX2TAUC7NkmoQFf2OUrLo9MOBD+/lrWo2x5
         FPYVJJZiCQ4ked+zdOIadczTkFQBHEEMrKIRicbj7bcgUUci9CgPrQigeiMU23MHZacV
         tgXAgXrJS3i88hyKXHRySytUwG83lAtK94RTTKvgbVXFVW9iQEJ/wEjIWiaOFJVa0sK/
         9uTyIilQlL3q/SaJUcatD6ijo+NctHxIS4pCJXrpsU5uYlzLdIRI9Gi6tbfPzY044k22
         Lh1Do4+TxOVkMY6tVKi4Nn1vqaAgdeyM9H21q2zuXMfRz3Xyf0+RoNg5E5Cb58qOCQHq
         yYHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=i1B0owpD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k5si1105664edq.72.2021.08.23.09.07.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Aug 2021 09:07:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=i1B0owpD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mICUA-0008W0-ER
	for alex.bennee@linaro.org; Mon, 23 Aug 2021 12:07:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mICTV-0007ii-2e
 for qemu-arm@nongnu.org; Mon, 23 Aug 2021 12:07:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mICTT-0000FI-RR
 for qemu-arm@nongnu.org; Mon, 23 Aug 2021 12:07:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629734819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZK4ROJZ0pGE5cDcdV6LxkQKwph4f2pa5k450CDwBwwE=;
 b=i1B0owpDX9PicDd6fCLq6/RBJwrxbBlMI9n1hPKWWi/REZStKgdTXutuU4+xA79HZ6r+6p
 o4e0CK3R8VG9JuThw2aUm3e8KjYwMtpdc9c8XTzvf3N0DEmtQxsrBC0SbfOBFAr+yQ3Enw
 qz4brjoQwBPEZVaOWjm7HtU3Iuzbhc4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-583-wOBMuMJaNi-g4nDqXGRi6A-1; Mon, 23 Aug 2021 12:06:56 -0400
X-MC-Unique: wOBMuMJaNi-g4nDqXGRi6A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 020A03E741;
 Mon, 23 Aug 2021 16:06:55 +0000 (UTC)
Received: from gator.redhat.com (unknown [10.40.194.250])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 08F7560CC9;
 Mon, 23 Aug 2021 16:06:52 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 2/4] target/arm/kvm64: Ensure sve vls map is completely
 clear
Date: Mon, 23 Aug 2021 18:06:45 +0200
Message-Id: <20210823160647.34028-3-drjones@redhat.com>
In-Reply-To: <20210823160647.34028-1-drjones@redhat.com>
References: <20210823160647.34028-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 ishii.shuuichir@fujitsu.com, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: axkhhLi3Ga/R

bitmap_clear() only clears the given range. While the given
range should be sufficient in this case we might as well be
100% sure all bits are zeroed by using bitmap_zero().

Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/arm/kvm64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 59982d470d37..e790d6c9a573 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -740,7 +740,7 @@ void kvm_arm_sve_get_vls(CPUState *cs, unsigned long *map)
     uint32_t vq = 0;
     int i, j;
 
-    bitmap_clear(map, 0, ARM_MAX_VQ);
+    bitmap_zero(map, ARM_MAX_VQ);
 
     /*
      * KVM ensures all host CPUs support the same set of vector lengths.
-- 
2.31.1

