Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp619410lfg;
        Thu, 19 Aug 2021 12:39:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwgoU012NZGqudJ0W7X+q1K332vAonXzOLSQczjuqyynAPpjjS0zQ8W9+Lopg32xqI0fUML
X-Received: by 2002:a5e:c609:: with SMTP id f9mr12398006iok.127.1629401978331;
        Thu, 19 Aug 2021 12:39:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629401978; cv=none;
        d=google.com; s=arc-20160816;
        b=k5XbSmfv462fpFdOtRPBK6pnLlUb1RmshAyM4e7YppmMtNuUeueiDKhhcqZofj9PnM
         EZiBzzVsNS/vXBEBm87VO1g7N9GXJAboIcuWy7HYuaVE1KmzXzUpV8WzpSRb3S1MvBwp
         quhgzdTbPDPo6TiWgG++shPEe9LJ+PKse6hGa2J5IorTmZscbFdhFApEAdk1vpjkA7JO
         F1z7fCItBzs++bSpNx4CpzdG4UVT53mmUyX6TuqEhZYsJHZTmf/C9RmY3d+u4Xk/JixK
         AUicqmhsvMleftJ4mrUBKM0EPlWtFHuWopD6fW5H/glhRBg1yWKlr2LjEf111/4wyB8V
         mCPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=9Rk7/xTGZ7djunwLJc/15OTqO11oRSr01FC8jEET9V8=;
        b=dsLfkLvfn2mOfNIGsQWzrz5xdQt6ThL9EdxoeYK7XDT2ULDPx9t+tTprAHELLL33Vg
         Udb8M3xLlpyYghG720QOa0uwu/mIKQp9rnEoneYevOxcluZPji4Sr8ZAAEqIZGRF7/Hu
         gExTDoIvxx50b6x7PEpCSSoRIEtGBjDMs02aziyx0wg3nkIiLDE8uHp70EBOjPaCtOUG
         EsLsCqWxkngpdbU/zik7zXPpcTpc+HEpzG3nL754pq7b7LhMDCzCmurdan49ffYs7L48
         2qIppDEl2ymcygeXtwXDNeXssXQYbQ3DVKGUIVaGoSDl3ctcRlqyNmq2+w1mCONI8tM3
         cHvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Aam7zYTI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r10si3990433jap.64.2021.08.19.12.39.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Aug 2021 12:39:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Aam7zYTI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mGnt3-0003D4-N8
	for alex.bennee@linaro.org; Thu, 19 Aug 2021 15:39:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mGnrd-0000os-Ip
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 15:38:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mGnrc-00005b-0T
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 15:38:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629401887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Rk7/xTGZ7djunwLJc/15OTqO11oRSr01FC8jEET9V8=;
 b=Aam7zYTII+yYDac8reo2i8IsZnZ+dknCS6l6YBFnp+9oxQQ6iuNcl2O8opJD7EcpnNcHRH
 X1TOJ0I8x+NhWUEDPFe1oCPEf7UrSqepgBDEbGdtPBjHwBLhonFI9iPNfkj/sxPs/gT4nq
 JBSvritN6wmwHeT9Ovm/GSRV+y9xgSg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-fFVEGjUGOgG0q2LqVLSORg-1; Thu, 19 Aug 2021 15:38:04 -0400
X-MC-Unique: fFVEGjUGOgG0q2LqVLSORg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10963107ACF5;
 Thu, 19 Aug 2021 19:38:03 +0000 (UTC)
Received: from gator.home (unknown [10.40.192.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8CDEE1970F;
 Thu, 19 Aug 2021 19:38:01 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH 1/4] target/arm/cpu: Introduce sve_vq_supported bitmap
Date: Thu, 19 Aug 2021 21:37:55 +0200
Message-Id: <20210819193758.149660-2-drjones@redhat.com>
In-Reply-To: <20210819193758.149660-1-drjones@redhat.com>
References: <20210819193758.149660-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 ishii.shuuichir@fujitsu.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qIXOjrV4GaXi

Allow CPUs that support SVE to specify which SVE vector lengths they
support by setting them in this bitmap. Currently only the 'max' and
'host' CPU types supports SVE and 'host' requires KVM which obtains
its supported bitmap from the host. So, we only need to initialize the
bitmap for 'max' with TCG. And, since 'max' should support all SVE
vector lengths we simply fill the bitmap. Future CPU types may have
less trivial maps though.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 target/arm/cpu.h   | 4 ++++
 target/arm/cpu64.c | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 9f0a5f84d503..cc645b57421f 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1019,9 +1019,13 @@ struct ARMCPU {
      * While processing properties during initialization, corresponding
      * sve_vq_init bits are set for bits in sve_vq_map that have been
      * set by properties.
+     *
+     * Bits set in sve_vq_supported represent valid vector lengths for
+     * the CPU type.
      */
     DECLARE_BITMAP(sve_vq_map, ARM_MAX_VQ);
     DECLARE_BITMAP(sve_vq_init, ARM_MAX_VQ);
+    DECLARE_BITMAP(sve_vq_supported, ARM_MAX_VQ);
 
     /* Generic timer counter frequency, in Hz */
     uint64_t gt_cntfrq_hz;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index c690318a9b63..eb9318c83b74 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -840,6 +840,8 @@ static void aarch64_max_initfn(Object *obj)
         /* Default to PAUTH on, with the architected algorithm. */
         qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_property);
         qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_impdef_property);
+
+        bitmap_fill(cpu->sve_vq_supported, ARM_MAX_VQ);
     }
 
     aarch64_add_sve_properties(obj);
-- 
2.31.1

