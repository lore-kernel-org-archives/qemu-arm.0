Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp2000849lfg;
        Mon, 23 Aug 2021 09:07:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz72ahGWjZ/j0iHJkGDeHaWL2GZoSxD0NGSYPYfuuwsfyxWv/i2+kwDx0Qv6VmNVmH5ZVqh
X-Received: by 2002:adf:dc0b:: with SMTP id t11mr14064201wri.259.1629734846445;
        Mon, 23 Aug 2021 09:07:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629734846; cv=none;
        d=google.com; s=arc-20160816;
        b=gLn+r2Uun8MN3TdpMaqGXO0SkJySNhCfWscwULhI5F0/lB2iSe4aADaD4dMK22ug+2
         NPUPVMfJDaHnyw4DLkoxaILRxArCmJh3WQVsF6PzxDZ0HeJLqx2zMs2zriZfBssFc8ZS
         sdG3SCQv4sc31HR1j0vKDxAUq5WdWBbtr4zvlHyHFrDVbZPaHAw805WQa4ft/yl4ASH0
         0N/aa5M33NUpcuR69Nwhn1vMn5V/cnLJqljIKNLyOXumv+R7/bkE8uwsH3ZkPPSjldSA
         unZMJKnzn/X5R9b06mCR1RCBCtxodVNhxKuxGlW7gu9UYwOlhaj+Vgx/X0uk9LGu8W2C
         NuCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=VTxvA1H6X6WGEH/c1mFFnPlMd4K7+50QX0Z8QtbZhp8=;
        b=efA3ARiMfH7TpQVbRiAY9/jnSqIdAJJBBognd/3pZo0jCckWv4lo1/eZP1kOIjRqwF
         j3kRFV9WPK/TZZfat0Ds015t4PvFB0bseY4W8i7SP2cYp9Io45+5qzvvLGx5ZgF19my4
         xmJnxlpOVL0cmzCG3grg/LyTssqTrl9bsgH5b47HwF/IWZgvwk4JKZfjt7/20yWj87R0
         N0uCBhp3kPmGMmPen8c3/3OXG9suWYgko9bEij7GZlHWWjlE898Y61cZiNqHVeQ8I6gH
         tGHB5RItjv9aPtZrq5NojnD5i85bDpBrmSgTGO7LjcH0CV+up5t460QVSlmAQ3uJNuun
         hHog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GZ9opvnK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qf39si8437934ejc.644.2021.08.23.09.07.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Aug 2021 09:07:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GZ9opvnK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mICTt-0007jG-HQ
	for alex.bennee@linaro.org; Mon, 23 Aug 2021 12:07:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mICTT-0007iH-Gy
 for qemu-arm@nongnu.org; Mon, 23 Aug 2021 12:07:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mICTR-0000ED-OB
 for qemu-arm@nongnu.org; Mon, 23 Aug 2021 12:06:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629734817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VTxvA1H6X6WGEH/c1mFFnPlMd4K7+50QX0Z8QtbZhp8=;
 b=GZ9opvnKtxAO2+reHniVOWJS9IYrGjLN782YmiWTcgx5Yhm5YTWb3VRpQSHCIwc7lU4lzi
 nD4mH5swUnb6f8cN5Ax/iDePUASOtbkMmXE/Cp8jY1oepnbn3gdbStExT8rKVJUcbYbtjI
 jSkZ6243iJloHdrxg4QaMQddpLU0SMU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-603-zpIKNfNmNgSsmY_d2y7kLg-1; Mon, 23 Aug 2021 12:06:53 -0400
X-MC-Unique: zpIKNfNmNgSsmY_d2y7kLg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9EEB28799EB;
 Mon, 23 Aug 2021 16:06:52 +0000 (UTC)
Received: from gator.redhat.com (unknown [10.40.194.250])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D249F60C82;
 Mon, 23 Aug 2021 16:06:50 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 1/4] target/arm/cpu: Introduce sve_vq_supported bitmap
Date: Mon, 23 Aug 2021 18:06:44 +0200
Message-Id: <20210823160647.34028-2-drjones@redhat.com>
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
X-TUID: bqFPLxoMqn/e

Allow CPUs that support SVE to specify which SVE vector lengths they
support by setting them in this bitmap. Currently only the 'max' and
'host' CPU types supports SVE and 'host' requires KVM which obtains
its supported bitmap from the host. So, we only need to initialize the
bitmap for 'max' with TCG. And, since 'max' should support all SVE
vector lengths we simply fill the bitmap. Future CPU types may have
less trivial maps though.

Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
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

