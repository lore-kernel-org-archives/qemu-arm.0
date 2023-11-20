Received: by 2002:a17:907:1006:b0:9d0:bf65:29fa with SMTP id ox6csp1858872ejb;
        Sun, 19 Nov 2023 16:29:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEpBtLgieZAyRxDuKfSrp1BljyE2d8uxzlnnyNZ+u2zFFw1sOD6CKdHMzy9Jv4/YTQInH7R
X-Received: by 2002:a05:6214:529c:b0:66d:5020:ef67 with SMTP id kj28-20020a056214529c00b0066d5020ef67mr6234138qvb.36.1700440147277;
        Sun, 19 Nov 2023 16:29:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700440147; cv=none;
        d=google.com; s=arc-20160816;
        b=PoO7qRXRsOwJPHzrfEzkMAGvKjwthBhINKNmiAhKqAQHKz1moX7688oyiA+8JbJJNG
         LF/MeWNgsFl58KTgtkWhzKl33GAdPSplNJS6XOgmxAD0MpX3u+Q0W4d2ESYjnqKFjLak
         vFQi9hiNZSYVPnIGaq2XRzosjSx87tKUdT4IaZAeSVXpl0nEgKUe8SkKloXmVKPYg85F
         +HcaS8xiyQLCcUpMbkzxiOJhmKM9WC2vhklOi9fEdzgQzGZ6OAP3+0p91VhSmXJ15fpd
         Oj97Gh7ZLkjiXv8dgbM0g9Z8mxVF5cUcBsTCVaoaWXacEVRPZvGjoOcI/3b5/EQguyHR
         +dkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=0Qk6/QajLgnGyyzUHhMPIDBeq8Pe5C9hI3Ifb+WIAuI=;
        fh=eprYT8whwr4stGFQLeeZHwk74gIWGMhzJm3THIcsCHI=;
        b=XHqDwYAl55Qfmfo4+FCt7Iz9ujkdEzIAHqu37mOyh4l9jZFD+Eup1oPiULLgjHkXm3
         AwbqLXaaljx0Q3lDkD6rdA1O42wK1fhOxS0KRRB+mRFdXnF3GaiRiQoAmSWW5OZL9OHs
         uj2aU/V06xKpFWHGwxcX57EQfCpIS+Bm3UPI82AhO6yuknZd2F6iBSYYViIsk8WbRRcD
         mm4/kde5s1r0LAQh6QVl0u37rkSPPP6agBaTx8fo6MJLb/dB50UxjN30A1GyVsVDDNEQ
         NvLgM21tueYVmsmXEtLVSEqwBmYxKmhSXydMwYT5XuDNaubaqQxeH6rJ58c58CZWDuBY
         YDNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Iaci0wII;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id de29-20020a05620a371d00b0076729db5823si6680584qkb.240.2023.11.19.16.29.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 19 Nov 2023 16:29:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Iaci0wII;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r4s9i-0005QY-9c; Sun, 19 Nov 2023 19:28:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r4s9g-0005Q0-Np
 for qemu-arm@nongnu.org; Sun, 19 Nov 2023 19:28:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r4s9f-0001FM-9F
 for qemu-arm@nongnu.org; Sun, 19 Nov 2023 19:28:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700440126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Qk6/QajLgnGyyzUHhMPIDBeq8Pe5C9hI3Ifb+WIAuI=;
 b=Iaci0wIINyAmP8vUenKoeUGdRsqErflaK+9G2lWj2eYWx3k6BeE9h9lVUtnuNqMrFLDNdO
 G5zeVk3C0CJ5K2HkktZbtzq4tCVr1ggF6L+d2yT4+GuAGzHk5UjD/wZE8y45Hp9x4/V27Y
 hPE5R2nAb7klATOCpOkqCpP9rw8x9I4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-491-AftiCdGgOAWGqHEpeCoQIg-1; Sun, 19 Nov 2023 19:28:40 -0500
X-MC-Unique: AftiCdGgOAWGqHEpeCoQIg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1D0B1101A529;
 Mon, 20 Nov 2023 00:28:39 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.87])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 89CE540C6EB9;
 Mon, 20 Nov 2023 00:28:31 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, imammedo@redhat.com, b.galvani@gmail.com,
 strahinja.p.jankovic@gmail.com, kfting@nuvoton.com, wuhaotsh@google.com,
 nieklinnenbank@gmail.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 vijai@behindbytes.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, shan.gavin@gmail.com
Subject: [PATCH v6 4/8] hw/arm/virt: Hide host CPU model for tcg
Date: Mon, 20 Nov 2023 10:27:20 +1000
Message-ID: <20231120002724.986326-5-gshan@redhat.com>
In-Reply-To: <20231120002724.986326-1-gshan@redhat.com>
References: <20231120002724.986326-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Uht3m/33G1/Y

The 'host' CPU model isn't available until KVM or HVF is enabled.
For example, the following error messages are seen when the guest
is started with option '-cpu cortex-a8' on tcg after the next commit
is applied to check the CPU type in machine_run_board_init().

  ERROR:../hw/core/machine.c:1423:is_cpu_type_supported: \
  assertion failed: (model != NULL)
  Bail out! ERROR:../hw/core/machine.c:1423:is_cpu_type_supported: \
  assertion failed: (model != NULL)
  Aborted (core dumped)

Hide 'host' CPU model until KVM or HVF is enabled. With this applied,
the valid CPU models can be shown.

  qemu-system-aarch64: Invalid CPU type: cortex-a8
  The valid types are: cortex-a7, cortex-a15, cortex-a35, \
  cortex-a55, cortex-a72, cortex-a76, cortex-a710, a64fx, \
  neoverse-n1, neoverse-v1, neoverse-n2, cortex-a53,      \
  cortex-a57, max

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/arm/virt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index be2856c018..668c0d3194 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -220,7 +220,9 @@ static const char *valid_cpus[] = {
 #endif
     ARM_CPU_TYPE_NAME("cortex-a53"),
     ARM_CPU_TYPE_NAME("cortex-a57"),
+#if defined(CONFIG_KVM) || defined(CONFIG_HVF)
     ARM_CPU_TYPE_NAME("host"),
+#endif
     ARM_CPU_TYPE_NAME("max"),
 };
 
-- 
2.41.0

