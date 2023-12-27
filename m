Received: by 2002:a17:907:c9e:b0:a27:13b6:eed5 with SMTP id gi30csp986967ejc;
        Wed, 27 Dec 2023 07:07:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF5xNu80VPcNLEij8TzFad/d+m32uFsp5JUSFvh/CLB+An8gByQlbbQgV0YSv4JIGLMKfgU
X-Received: by 2002:a05:6102:508d:b0:467:37ae:669d with SMTP id bl13-20020a056102508d00b0046737ae669dmr402439vsb.18.1703689646034;
        Wed, 27 Dec 2023 07:07:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703689646; cv=none;
        d=google.com; s=arc-20160816;
        b=Y+rKmWacv4HcNiJJ1ms2AcBQ868wb2epKQqD7fafirMVQnIRx2cinx2EisLVxjvNpC
         kIwCkNvN265tCtwYfRCXpt/AY4uRRN19WxkamUzR0MgH3itd2++jg0bQVjUrK0+8tFLI
         hFahL2e4bFe85YavYZIbqtLBkuJ6OZHe75fx/zPZHDc82Q2lusUJN/XVSjkfjoA5jP6t
         KhUSXMRTAEXP13CBQ5T0TfPWUEVkaEHf46HZzZfIQ2rFYIyYH7h4c8ozeraUe4i76kI0
         1BsU2d7EfxdzihvDgFoJY97Qc7Uzz0l8bHmlM25mHht0FvxMIft8vrbiBwNPvwYYYlEi
         O9Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=9rgpKIW2IG0Kcf8d4C9ZgdGehLpCbwt7anbd2QCYgVE=;
        fh=iM4eT6SjkA5S3V4viqiCHRKuUn9O1etLzvxf9PuHi+o=;
        b=LIKrA6F/bdSLCuQKRylIPsFBmOzEIB6M+hc/O1QaqF4tStxvx/EcqTxXt8/m5wtzF7
         87w+s4mDErO2QiDvqAyRSB6u4onIgepJAoMq6eoupYaxMP/zLCaQRGWkkoL/5Rn/1DXY
         UeM8DEeMVgUD9zQqptY+syFy8tylGuO/t/n9610BUUu5zQher9i03NNm6f0s6M50cT+g
         kiCaiwi+BNTsOtHLSJghPEPBKuaNBp2Mm7kNakJ8d2aO7l2JUfYT4KBOhC0mqHt0dOqC
         RkuPVGOw/yfsV2FlZnCRzXXMVtXIiBIL7yrd1SU2UbsvKc/eu8r++WfhDgrNqnXG6ri6
         Is1A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jg11-20020a056102180b00b00466ed65d0aesi959697vsb.336.2023.12.27.07.07.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Dec 2023 07:07:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rIVUd-0007Xb-Le; Wed, 27 Dec 2023 10:06:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiongyining1480@phytium.com.cn>)
 id 1rIShh-0002Ht-P0; Wed, 27 Dec 2023 07:08:06 -0500
Received: from sgoci-sdnproxy-4.icoremail.net ([129.150.39.64])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <xiongyining1480@phytium.com.cn>)
 id 1rIShe-0006Pf-Dr; Wed, 27 Dec 2023 07:08:05 -0500
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
 by hzbj-icmmx-6 (Coremail) with SMTP id AQAAfwA3LEOWE4xlxb1lAg--.19516S2;
 Wed, 27 Dec 2023 20:07:50 +0800 (CST)
Received: from phytium.com.cn (unknown [218.76.62.144])
 by mail (Coremail) with SMTP id AQAAfwDX+OWSE4xldrYAAA--.2783S4;
 Wed, 27 Dec 2023 20:07:47 +0800 (CST)
From: Xiong Yining <xiongyining1480@phytium.com.cn>
To: rad@semihalf.com, peter.maydell@linaro.org, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, chenbaozi@phytium.com.cn,
 xiongyining1480 <xiongyining1480@phytium.com.cn>
Subject: [PATCH 1/2] hw/arm/sbsa-ref:Enable CPU cluster on ARM sbsa machine
Date: Wed, 27 Dec 2023 12:07:21 +0000
Message-Id: <20231227120722.1683361-2-xiongyining1480@phytium.com.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231227120722.1683361-1-xiongyining1480@phytium.com.cn>
References: <20231227120722.1683361-1-xiongyining1480@phytium.com.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAfwDX+OWSE4xldrYAAA--.2783S4
X-CM-SenderInfo: x0lr0wp1lqx0bjrumio6sk53xlxphulrpou0/1tbiAQAGBmWLKugHewAAsR
Authentication-Results: hzbj-icmmx-6; spf=neutral smtp.mail=xiongyinin
 g1480@phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjvdXoWrZr1kXr4UKF15uw1fKF4UJwb_yoWftrc_Jw
 n7Zw43WF15KwnF9ryYya1SyryrKw4UGFsrKFn7uFyrJw1UKF1UG3Z8JrZ7Xr18ua13XFWS
 ya1UZFZxuwnxWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrnU
 Uv73VFW2AGmfu7jjvjm3AaLaJ3UjIYCTnIWjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUUUUU
 UUUU=
Received-SPF: pass client-ip=129.150.39.64;
 envelope-from=xiongyining1480@phytium.com.cn;
 helo=sgoci-sdnproxy-4.icoremail.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 27 Dec 2023 10:06:43 -0500
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
X-TUID: sD3rJqYcfAKc

From: xiongyining1480 <xiongyining1480@phytium.com.cn>

Enable the CPU cluster on ARM sbsa machine, so user can configure the
cluster hierarchy.

Signed-off-by: Xiong Yining <xiongyining1480@phytium.com.cn>
Signed-off-by: Chen Baozi <chenbaozi@phytium.com.cn>
---
 hw/arm/sbsa-ref.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index f3c9704693..e6cd612bc5 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -911,6 +911,7 @@ static void sbsa_ref_class_init(ObjectClass *oc, void *data)
     mc->default_ram_size = 1 * GiB;
     mc->default_ram_id = "sbsa-ref.ram";
     mc->default_cpus = 4;
+    mc->smp_props.clusters_supported = true;
     mc->possible_cpu_arch_ids = sbsa_ref_possible_cpu_arch_ids;
     mc->cpu_index_to_instance_props = sbsa_ref_cpu_index_to_props;
     mc->get_default_cpu_node_id = sbsa_ref_get_default_cpu_node_id;
-- 
2.34.1

