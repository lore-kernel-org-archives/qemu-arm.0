Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp1677881ejc;
        Tue, 12 Mar 2024 01:32:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXszcKqLVIECV4b9jLSvlcfAqrbl8dh70mx9ZEbi2S5OYN42zPWpvDqOE6zmM2cAF/1etEZOFPBdZzp5Gav1DfcdTo8LJDc
X-Google-Smtp-Source: AGHT+IGhiZswgrLJKbSQqRb9Nv8x03c4cKsK42AszI0hC0Aj6nJAdHkz9L5Vy1E3QgoVeu37yR4R
X-Received: by 2002:ad4:44a7:0:b0:690:f620:94f1 with SMTP id n7-20020ad444a7000000b00690f62094f1mr459187qvt.8.1710232356185;
        Tue, 12 Mar 2024 01:32:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710232356; cv=none;
        d=google.com; s=arc-20160816;
        b=RY2xNcwZgg7Oc61796f9lY6H0VRdM6ZIQbqbbMo0N94Qolh6kl3KWEb2eL1nSte0Uk
         R42ESj/P3T3qiyBXUfuoyKJc4DeGwknLLh7ESSEMA1q8QxY+yj5WkLERwPXkc5hsQ37O
         BEmzQRiWUg9+Y49XW0wJrGRsFcm/tJuavmWTOwNRJfCLwWO82lKW+Thg0L+Hrs/GECYR
         EVlg2gnwfyf9EqnYjqIXhSQEenDpu4xiXdk/+L/e5PVSpjEEobifce0LvBYwO90i/Um5
         llBiY1cHUSTBs2jcWgHtn4zOarSjWcHvLqx/r+5JdMNRdka74akHeXSXdG4oTa3diRC0
         Nszg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=PnF8OLXE4RE6E4PT990KNuA5e0DBBBiKrBh+QIEuDC0=;
        fh=wmM0NAoeKt5fL6F1FJEgD5CF+sXm7q3Q0YiqZP09Rok=;
        b=B8F3x0yL3pGZpFkK/uXOpJgU49hFciuy5ZCz5/c5ZPJWP5D9/Xc0Duqo8fhjYC2o06
         xr5AiQTAxfmPxJQwGpSSrlouzwjztPMfJFzZfLXUQrkPY35ULYiY+v49rpjCc7K2NWiA
         fHqgVVWytmWXq3cBooGBBMwi1yW94juIzP7CI/T3lGyvS+6UNFxZR0BGQWswoUf4mHPc
         j4WZyuJd5CsJ6kJIWpPlhM3JPlzTW6faLFsEcJdC133F81iXpyRf2re6VK6f3wWUNzV8
         FVZJaHl4tIXUS4VlCEhoGA1Obh/Ya9X83Z9cAy+vztjD7sx548aqN0R6rynmwjb2Dbzv
         iXRQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ks4-20020a056214310400b00690b0d90effsi7002360qvb.135.2024.03.12.01.32.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Mar 2024 01:32:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rjxYc-0002x6-Gg; Tue, 12 Mar 2024 04:32:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiongyining1480@phytium.com.cn>)
 id 1rjxYb-0002wZ-9c; Tue, 12 Mar 2024 04:32:21 -0400
Received: from sgoci-sdnproxy-4.icoremail.net ([129.150.39.64])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <xiongyining1480@phytium.com.cn>)
 id 1rjxYY-0002iF-Nl; Tue, 12 Mar 2024 04:32:21 -0400
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
 by hzbj-icmmx-6 (Coremail) with SMTP id AQAAfwAHDwsKE_BlgM6GBg--.36585S2;
 Tue, 12 Mar 2024 16:32:10 +0800 (CST)
Received: from phytium.com.cn (unknown [218.76.62.144])
 by mail (Coremail) with SMTP id AQAAfwCXjPAEE_BlkXMAAA--.584S4;
 Tue, 12 Mar 2024 16:32:05 +0800 (CST)
From: Xiong Yining <xiongyining1480@phytium.com.cn>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: rad@semihalf.com, peter.maydell@linaro.org, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org, chenbaozi@phytium.com.cn,
 xiongyining1480 <xiongyining1480@phytium.com.cn>
Subject: [PATCH v2 1/2] hw/arm/sbsa-ref:Enable CPU cluster on ARM sbsa machine
Date: Tue, 12 Mar 2024 08:30:48 +0000
Message-Id: <20240312083049.3412522-2-xiongyining1480@phytium.com.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240312083049.3412522-1-xiongyining1480@phytium.com.cn>
References: <20240312083049.3412522-1-xiongyining1480@phytium.com.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAfwCXjPAEE_BlkXMAAA--.584S4
X-CM-SenderInfo: x0lr0wp1lqx0bjrumio6sk53xlxphulrpou0/1tbiAQACBmXvXPYDKAAAsO
Authentication-Results: hzbj-icmmx-6; spf=neutral smtp.mail=xiongyinin
 g1480@phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjvdXoWrZr1kXr4UKF15uw1fKF4UJwb_yoWDWwc_Jw
 1xXwnxWF1UKwnF9ryYyF4fAryrKw4UKFsrKrn7uFyrJw1jgF1UG3Z8JrZ7Xw18Za15Za4S
 kF4UZF45uwnxGjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrnU
 Uv73VFW2AGmfu7jjvjm3AaLaJ3UjIYCTnIWjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUUUUU
 UUUU=
Received-SPF: pass client-ip=129.150.39.64;
 envelope-from=xiongyining1480@phytium.com.cn;
 helo=sgoci-sdnproxy-4.icoremail.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 64wzWcLQz5R9

From: xiongyining1480 <xiongyining1480@phytium.com.cn>

Enable the CPU cluster on ARM sbsa machine, so user can configure the
cluster hierarchy.

Signed-off-by: Xiong Yining <xiongyining1480@phytium.com.cn>
Signed-off-by: Chen Baozi <chenbaozi@phytium.com.cn>
Tested-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 hw/arm/sbsa-ref.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index f5709d6c14..fde7dd528f 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -886,6 +886,7 @@ static void sbsa_ref_class_init(ObjectClass *oc, void *data)
     mc->default_ram_size = 1 * GiB;
     mc->default_ram_id = "sbsa-ref.ram";
     mc->default_cpus = 4;
+    mc->smp_props.clusters_supported = true;
     mc->possible_cpu_arch_ids = sbsa_ref_possible_cpu_arch_ids;
     mc->cpu_index_to_instance_props = sbsa_ref_cpu_index_to_props;
     mc->get_default_cpu_node_id = sbsa_ref_get_default_cpu_node_id;
-- 
2.34.1

