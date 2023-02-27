Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4810058ejc;
        Mon, 27 Feb 2023 08:38:39 -0800 (PST)
X-Google-Smtp-Source: AK7set+LgkI4qubIfAOFqWp0hgLUsUx0twpbqrk95EY3F6Z0TAuHNpJinjTACJMxVw+e9Fj+xLNd
X-Received: by 2002:a05:6214:cc3:b0:53b:d514:724 with SMTP id 3-20020a0562140cc300b0053bd5140724mr109600qvx.26.1677515919347;
        Mon, 27 Feb 2023 08:38:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677515919; cv=none;
        d=google.com; s=arc-20160816;
        b=MAZKB+/yYifhi/Xpn1XZiCeoYlbICyQsd9abW7kjfykOeuoyOPzW7yailHw+GCCJ3g
         ossgRIjuUzTXtWYSy5c0SJbjgtaoOiThS+SYAu/h3oDIAMipTCTyKfQCpoQmeofTwc49
         u6n5FDnN0gvjok29RnC9mJOf2hb98VtD+KNHzq61/3sCvkthJW01iR0ZfZwq3HNWtChC
         h25cSoF0b3qaubDigXJCkl8lHkq+exUcWIiM/vvbe28RUbX5mGjc+jbFNbJkJWEHWJVw
         NNyXV0TyS6/r8z6mHxmUU0piACgIOKENov2FdZ2tmf5IUFrdz+J/pMJfJkj7fn4YAjTr
         xK2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=DPCvqMvPGr7V9CaopBQymsI4DUZJ7DMryFxJNSsGiN0=;
        b=ljXvKnFHzaT8Iy7LJQttV2iVBgKwpPjWj7PonwphRqipHj36u+MLqBz9wdEcZgjUQT
         PWBQaJjE67J++b9H51GrG/JQ4d0z5XPbY9lUjdQ1vaC4GXIyLYeYEnniD2dGp4T+KEsS
         PsxUFvP/ncKReSyp910GlIp9IXwHn49ObVjRPemkYrUiqCKiR3rRRDM+QBhwI2laEdLH
         yKcAPjkkxWTVFNhC5or65JGMB7apaZQSXoitrsB2JCdLSt2etRlyjOAIZ1s98Jhu6UbX
         nNYk+r8q26Mhx6O7WU9a4x7Q9OeCzx3jikCEztVCy/dnzDDiMHbUXBhBMxIh3KPhEToF
         rDhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@oracle.com header.s=corp-2022-7-12 header.b=n5YvX+Gd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g8-20020a0ce4c8000000b005517fd5c54csi6712567qvm.516.2023.02.27.08.38.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Feb 2023 08:38:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@oracle.com header.s=corp-2022-7-12 header.b=n5YvX+Gd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWgVa-0003MJ-Kj; Mon, 27 Feb 2023 11:37:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1pWgVX-00030J-GU; Mon, 27 Feb 2023 11:37:47 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1pWgVU-00063V-2t; Mon, 27 Feb 2023 11:37:47 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31RFwvTH017935; Mon, 27 Feb 2023 16:37:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2022-7-12;
 bh=DPCvqMvPGr7V9CaopBQymsI4DUZJ7DMryFxJNSsGiN0=;
 b=n5YvX+GdQ97oigmnQY1fuJ+/VI/mN28paW/eg77ToGDuPhZLcIVNrvbL+1N9nX4JOUMc
 4Fxi2Rek5Q3CW6M7Aj2qNgG6od19/B5au4R543FvcmzOrsU/qqd9QGLZXQ4oW69EHK42
 3bf/0LGi44K+TiUt0G5VqLDBHe24MC3snGZEEZvmOtQjVTiS/wYlEyjMnf+zySJJhtFS
 IbD8BVX+gRCo8Mg/9CITNKzfZSzjn80Yn4SOIyXYNH6OQa2T3+9239VJWg31IiDzMaE4
 4y55sVgOvPAKf/6BrikQ/XTCIIB9667WhRlc5F//B8Ui2/RIemZxmWc8WhTClchkPJ74 Pw== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nybakm2q8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Feb 2023 16:37:40 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31RFvTXR015935; Mon, 27 Feb 2023 16:37:40 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3ny8s5sy6e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Feb 2023 16:37:39 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31RGbMkO006629;
 Mon, 27 Feb 2023 16:37:39 GMT
Received: from mlluis-mac.uk.oracle.com (dhcp-10-175-167-110.vpn.oracle.com
 [10.175.167.110])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 3ny8s5sxr5-6; Mon, 27 Feb 2023 16:37:38 +0000
From: Miguel Luis <miguel.luis@oracle.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Haibo Xu <haibo.xu@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Marc Zyngier <maz@kernel.org>
Cc: Miguel Luis <miguel.luis@oracle.com>
Subject: [RFC PATCH 5/5] arm/virt: provide virtualization extensions to the
 guest
Date: Mon, 27 Feb 2023 15:37:18 -0100
Message-Id: <20230227163718.62003-6-miguel.luis@oracle.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230227163718.62003-1-miguel.luis@oracle.com>
References: <20230227163718.62003-1-miguel.luis@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-27_13,2023-02-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302270129
X-Proofpoint-GUID: uYuUIqgWuiwxsgj6NLYdHGKFxoaKAUku
X-Proofpoint-ORIG-GUID: uYuUIqgWuiwxsgj6NLYdHGKFxoaKAUku
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=miguel.luis@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: gAMErKUvnf0d

From: Haibo Xu <haibo.xu@linaro.org>

VHE enablement if host supports EL2.

Ref: https://lore.kernel.org/qemu-devel/b7c2626e6c720ccc43e57197dff3dac72d613640.1616052890.git.haibo.xu@linaro.org/

Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
Signed-off-by: Miguel Luis <miguel.luis@oracle.com>
---
 hw/arm/virt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 377181e009..7103aecf3f 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2093,7 +2093,8 @@ static void machvirt_init(MachineState *machine)
         exit(1);
     }
 
-    if (vms->virt && (kvm_enabled() || hvf_enabled())) {
+    if (vms->virt && (kvm_enabled() || hvf_enabled())
+        && !kvm_arm_el2_supported()) {
         error_report("mach-virt: %s does not support providing "
                      "Virtualization extensions to the guest CPU",
                      kvm_enabled() ? "KVM" : "HVF");
-- 
2.39.2

