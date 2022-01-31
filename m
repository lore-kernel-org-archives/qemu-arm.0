Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp2331060lfk;
        Mon, 31 Jan 2022 07:48:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzT2S5UouugZt7p+6QGIXE2DaacfpdOdll/QAy/DUgWt1QalZtgTB6Cy6rL+db43HcW95FN
X-Received: by 2002:a02:7754:: with SMTP id g81mr10274795jac.73.1643644095908;
        Mon, 31 Jan 2022 07:48:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643644095; cv=none;
        d=google.com; s=arc-20160816;
        b=q+/op7DE+e+Rs6HbPfrFloklExQqNNGhO9wAG0d/qSeIiOYQB2F5SS3hL+5T5QGYL4
         axszlNvrBCczSldM80ymr76e5LhR2sv7wp01JH2mEGAXCisNRGWKELYe1amUpKLdFSNu
         aw45ntl04U/9LBHHiKhDeFAEGdMiTnSIm28r2FlKg8CpbYG6POakBd+Uo0rfEdlQsAgy
         yFuzB/98DVTcEvN5qV2p7XoLSrkhOl1rf1KVNm2YlYLlajpM0Jlb3YpO0fMur5PAKlSJ
         +YPhti7C9m4nPPbPWujqltIUc/kWqjc1DX3VDJphTZbF0ARQUsOqgy2KwFqCc5QN9Fux
         l4Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=qzMYUhqqXcT2W/6cvbgOyKGD7EbmZl9Cl7a91MJiUfE=;
        b=pkQIhkan7nJ1JAhSnB7LDhMTYncJWKWRrZ7MXy9KRmO5hzZxlPa+IHlC5wgaZHKsrN
         HZOp9basfBUloaA8GyNjFvHLDlmTcyvunfRiLqLmhrXS+v8G+YBJe5LW5gaE8y7wAlVR
         zLRgCvJcQcLmXRll0Ex4SMisLBMJwjGRo6ajsskwdGTbyLjOMKsX6FX9BxIkpmlWPPZZ
         jUXEwY7I+spUKJe+/bCU4wZDlan5MAs9rUIDdcgCJJvfKKTgsMtim3/tlz78BfvS4U1S
         RDvhxek995y7wQxt1A2Nlf38Q2N/qS9Q4wsv8eYBvcAqTxxpJ3xAP/8QETpO6dr3FFmi
         wAGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=h9zOVRH5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h21si11354678jav.38.2022.01.31.07.48.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Jan 2022 07:48:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=h9zOVRH5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nEYud-0000oo-AZ
	for alex.bennee@linaro.org; Mon, 31 Jan 2022 10:48:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nEYsD-0000lz-9L
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 10:45:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nEYsB-00022T-QH
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 10:45:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643643943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qzMYUhqqXcT2W/6cvbgOyKGD7EbmZl9Cl7a91MJiUfE=;
 b=h9zOVRH5OdThi89xZE7vEb3ua424DfAqRQl9Cw4pVL77kiH+48Ya/JxX7IQmF4QnC+ilVI
 JhNk9KuOhv3HWZx/E5EnuHH72uU+tlMcOWSJLPV/+7yh6eMdRixUBta6lDmyFONUUr1Qhy
 SVMlSc96R42tMp+jFWbaycKnLIhf2do=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-142-USywE_HHMmml_Skd9D9glw-1; Mon, 31 Jan 2022 10:45:42 -0500
X-MC-Unique: USywE_HHMmml_Skd9D9glw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD0BD94EE4;
 Mon, 31 Jan 2022 15:45:40 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 796037B9ED;
 Mon, 31 Jan 2022 15:45:38 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, thuth@redhat.com,
 lvivier@redhat.com, peter.maydell@linaro.org, drjones@redhat.com,
 f4bug@amsat.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 pbonzini@redhat.com
Subject: [PATCH 2/2] tests/qtest: Special case sbsa-ref and xlnx-versal-virt
 if !CONFIG_ARM_GIC_TCG
Date: Mon, 31 Jan 2022 16:45:31 +0100
Message-Id: <20220131154531.429533-3-eric.auger@redhat.com>
In-Reply-To: <20220131154531.429533-1-eric.auger@redhat.com>
References: <20220131154531.429533-1-eric.auger@redhat.com>
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
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6aIQj8/c1Y0s

qom-test and test-hmp shall not run tests on sbsa-ref and
xlnx-versal-virt if CONFIG_ARM_GIC_TCG is unset as those machines
always instantiate GICv3.

Otherwise the tests fail with
ERROR:../qom/object.c:715:object_new_with_type: assertion failed: (type != NULL)

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Fixes: a8a5546798c3 ("hw/intc/arm_gicv3: Introduce CONFIG_ARM_GIC_TCG Kconfig selector")
---
 tests/qtest/libqtest.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 41f4da4e54..f53983a28e 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -1394,6 +1394,12 @@ void qtest_cb_for_every_machine(void (*cb)(const char *machine),
             g_str_equal("xenpv", machines[i].name)) {
             continue;
         }
+#ifndef CONFIG_ARM_GIC_TCG
+        if (!strncmp("sbsa-ref", machines[i].name, 8) ||
+            !strncmp("xlnx-versal-virt", machines[i].name, 16)) {
+            continue;
+        }
+#endif
         if (!skip_old_versioned ||
             !qtest_is_old_versioned_machine(machines[i].name)) {
             cb(machines[i].name);
-- 
2.26.3

