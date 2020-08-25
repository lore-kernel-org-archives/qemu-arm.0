Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp131882lfc;
        Tue, 25 Aug 2020 12:43:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyViRUW3oEcRpvybV4ggoj+fJAAdBMk/gzfmp/9cCNXI5ZvgMwdiFStiIUm9fe9q3Hba7Hn
X-Received: by 2002:a25:bc50:: with SMTP id d16mr15377673ybk.230.1598384587108;
        Tue, 25 Aug 2020 12:43:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598384587; cv=none;
        d=google.com; s=arc-20160816;
        b=JhbhjVrO0wSI/a97clLoLlWRxWH1z1K+RoTXuXX7XtkHg+BH5ftGduyg/ibmGDSfjD
         wRy7U3esjeWZdwp/rYH3II42cDePvI3AQRLSop2E/WcTqtYPF4SZVBIpGxb4+a8GvrCl
         kR3AHgu+UDUge37sjjkzfjSXy0iVJmKhICZ5rPbcffuvzkFuf1n3JFAyMDF6Y4sQ5xPo
         LwQmDYlrxg6ZXzQwKe5QhgLSggnEgKY6wz86r/XrNmXZg4/ab2Oi58rCmkTPFIDe1TZT
         CavQNNNvSUoxsdxEBMzZ5Qv1Sugmj/5lFljUjcgZIozKoqDfCZtbVvm/lz2MNcOqjh+V
         rISQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=TV5KD0IcI0qUOaTJTfo8j0r+7GyHMo5nJpePfWRM09U=;
        b=zZJdgmc2V9OgMg5tgUkzQCPI8kTQz2pJizK9xUFEPEwfZ4UodLGX0GYiCCUd1skgfv
         oXiTb8/70jGsbSpQjYSx+q/Tpkd1rWDhmBr3I66R5L+mIXFDWV+3s4oawoWMvenbqW2a
         GyJHcSbaJ9x5w5yfGAz8QP0hpAnL2e7eNoyDtEpMtc1HJDilRUjYbDrGgs73bP49poxp
         5xykZJKi+KI4CpYc58jW+48hbGhe3p51m/uyhnJPsKMbZkaFO/Ljq+cNP1rX/UnTy1PH
         nLdkam42baY42nZtBa+B3U7CkhfsdA+77aHmi+mxeLjDO3CB4+uNe8jY2p0PD+VD/zzK
         E+IA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XjWV01U2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c7si14321623ybs.32.2020.08.25.12.43.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Aug 2020 12:43:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XjWV01U2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAeqY-0001QM-Ek
	for alex.bennee@linaro.org; Tue, 25 Aug 2020 15:43:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kAeXK-0002TZ-Fr
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 15:23:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kAeXI-0006LG-SR
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 15:23:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598383392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TV5KD0IcI0qUOaTJTfo8j0r+7GyHMo5nJpePfWRM09U=;
 b=XjWV01U2XSyXTdVl4yVLjO43y6NwGWGjVlKTpn2Ue/qQjNzF0hYOQp9kWkrSt3i7NcWd3J
 O87t6aa2Qn3DuO+hWdTuiK90UOeGJk8kSW9q+U1doO/AdJobTs46QbYqVqceaMB7LJ5ftt
 J9mu0bD3V2Hxfd5BT9cmmR0WCGVA7cY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-PrPkt6ytONCjrah-2j9iFA-1; Tue, 25 Aug 2020 15:23:08 -0400
X-MC-Unique: PrPkt6ytONCjrah-2j9iFA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 411458799F0;
 Tue, 25 Aug 2020 19:23:07 +0000 (UTC)
Received: from localhost (unknown [10.10.67.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E2EA519C4F;
 Tue, 25 Aug 2020 19:23:06 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 51/74] arm: Fix typo in AARCH64_CPU_GET_CLASS definition
Date: Tue, 25 Aug 2020 15:20:47 -0400
Message-Id: <20200825192110.3528606-52-ehabkost@redhat.com>
In-Reply-To: <20200825192110.3528606-1-ehabkost@redhat.com>
References: <20200825192110.3528606-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/25 06:38:59
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.958,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AjGSgqONyPFa

There's a typo in the type name of AARCH64_CPU_GET_CLASS.  This
was never detected because the macro is not used by any code.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Changes series v2 -> v3: new patch added to series v3

---
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
---
 target/arm/cpu-qom.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
index 56395b87f6..fdef05cacf 100644
--- a/target/arm/cpu-qom.h
+++ b/target/arm/cpu-qom.h
@@ -67,7 +67,7 @@ typedef struct ARMCPU ARMCPU;
 #define AARCH64_CPU_CLASS(klass) \
     OBJECT_CLASS_CHECK(AArch64CPUClass, (klass), TYPE_AARCH64_CPU)
 #define AARCH64_CPU_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(AArch64CPUClass, (obj), TYPE_AArch64_CPU)
+    OBJECT_GET_CLASS(AArch64CPUClass, (obj), TYPE_AARCH64_CPU)
 
 typedef struct AArch64CPUClass {
     /*< private >*/
-- 
2.26.2

