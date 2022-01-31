Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp2335767lfk;
        Mon, 31 Jan 2022 07:55:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw6eonDy2DSdMC1w0QrEFSxR0dB3p/o8UYDqov8kN+eGi95TTx0GAEGuz+yX/rv15iiHhDa
X-Received: by 2002:a05:6638:358b:: with SMTP id v11mr8232327jal.224.1643644520878;
        Mon, 31 Jan 2022 07:55:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643644520; cv=none;
        d=google.com; s=arc-20160816;
        b=wOCeqTUHhAsnZRV+h+soYDnzJcuYhYmRD8qdIHwtXNPTEBV4uMx9Lo6m7M6IQByWMw
         RZgt2vNNCb7CiKBUcd21MiOD5T74bia7DEYQSXSlik5RIJSAAhq1b+DydR813gFTGawf
         dBFzjxtAnSTO2l1TpdZyfe9hCi8IiSzTu1BNoYbJJjKd9l8DlQNbXrm4zyzUprBXc691
         LmJmWERNlWeSnJIYmWr+HEiWrKDkQKichbAF/NmzyXNmt9+PEKmbC+WGpenoa39oef2r
         JkpgnTK3z12WglxutOzv/d7elO6FPG8DTnbEAcYIN8MmejDYOb39w/GR+P5+FKcEtUib
         nYPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=bUNLEpFN+Ec9RUm+VjP9HI2fYZlpa9GA9vJvyz9yYmU=;
        b=XgyRkPMyMbwKVR/5+W1TgjWXAF5/mENJhejiOBVd9ZhB9xK8lyuZRjTD+hmuzG119H
         6mpboJWJLGCGxUv/fFQ0Xm32wiYlA16Rcpj+Jq82M5m4360BwqHZja+/SKcfT0QdDV64
         RsBmrziII56sOCorfx+w6csCvWBKRibdAWxvsM/4gpNIe2t5LnRuhxO2RcyfFH2wjN3J
         LXyRCbNOUN6SpLMyoDLm5BYIi1MeHyBh1hlWwnc1GNmSyAkIb3Rcvt1J7VxhrKisUueE
         YEFFBX7kU15ymF0Qa1TrpgTiXKBFsQ40oWpi/60TruMrOxWxJHWpxRSMgOhtmETtIbV0
         rnzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bgr9KBsL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c7si8319593ile.23.2022.01.31.07.55.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Jan 2022 07:55:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bgr9KBsL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nEZ1U-0000bw-7l
	for alex.bennee@linaro.org; Mon, 31 Jan 2022 10:55:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nEYsC-0000ll-8F
 for qemu-arm@nongnu.org; Mon, 31 Jan 2022 10:45:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nEYsA-00021k-Hw
 for qemu-arm@nongnu.org; Mon, 31 Jan 2022 10:45:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643643941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bUNLEpFN+Ec9RUm+VjP9HI2fYZlpa9GA9vJvyz9yYmU=;
 b=bgr9KBsLw8HPSM/7Vr3K20lc2BojjKaIiFcHKUW7GNs+wM3mc25PE6DlO0wayp13rExuLB
 Ck8NQcCNDcnrK2Mob3IG7HEtajhxpiImTxK0YQKz9X9KkoY7kBjRI751jgcSt652cgvx4J
 V4kOSUEJD8OzggRdusZQaifTjoTFFtg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-250-1ImHaqE1MAaOH6j2sKsLhg-1; Mon, 31 Jan 2022 10:45:36 -0500
X-MC-Unique: 1ImHaqE1MAaOH6j2sKsLhg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3DF381083F60;
 Mon, 31 Jan 2022 15:45:35 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD2F67B9D1;
 Mon, 31 Jan 2022 15:45:32 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, thuth@redhat.com,
 lvivier@redhat.com, peter.maydell@linaro.org, drjones@redhat.com,
 f4bug@amsat.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 pbonzini@redhat.com
Subject: [PATCH 0/2] hw/arm/virt,
 qtests: Fix make check-qtest-aarch64 when CONFIG_ARM_GIC_TCG is unset
Date: Mon, 31 Jan 2022 16:45:29 +0100
Message-Id: <20220131154531.429533-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dmjy+/aDX+1L

When CONFIG_ARM_GIC_TCG is unset, qtests fail with
ERROR:../qom/object.c:715:object_new_with_type: assertion failed: (type != NULL)

This is due to the fact a bunch of tests currently depend on GICv3
availability. qom-test and test-hmp try to launch sbsa-ref
and xlnx-versal-virt which only support GICv3. Also a bunch of
tests use gic-version=max which currectly selects GICv3,
ignoring the fact this latter has been disabled.

This series proposes to ignore sbsa-ref and xlnx-versal-virt during
qos-test and test-hmp execution if CONFIG_ARM_GIC_TCG is unset.
Also it selects GICv2 if gic-version=max and CONFIG_ARM_GIC_TCG is
unset, in TCG mode. With those fixes make check passes.

Best Regards

Eric

This series can be found at:
https://github.com/eauger/qemu/tree/config_arm_gic_tcg_v1

Eric Auger (2):
  hw/arm/virt: Fix gic-version=max when CONFIG_ARM_GIC_TCG is unset
  tests/qtest: Special case sbsa-ref and xlnx-versal-virt if
    !CONFIG_ARM_GIC_TCG

 hw/arm/virt.c          | 4 ++++
 tests/qtest/libqtest.c | 6 ++++++
 2 files changed, 10 insertions(+)

-- 
2.26.3

