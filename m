Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp459229lfc;
        Tue, 9 Jun 2020 05:54:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbB0LwJylEp0cqtRoRAWy8OYYNjbaKi1ryTrzJ7mPsU+1tQKUg9X/zRbHkdp0IJ/qASxJQ
X-Received: by 2002:ab0:6012:: with SMTP id j18mr2658455ual.69.1591707293382;
        Tue, 09 Jun 2020 05:54:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591707293; cv=none;
        d=google.com; s=arc-20160816;
        b=fYfB/SwXqIWmcASM9aGEcCcDMd/2k7zcwltNWJfdZxIh2NAdH2Ydi2gelR+PoPEyxa
         xKeQ2IyyqfLpkVS74rnQiuehgfH6JiieBJqOiDiHkfuJYsk+v8eZPb354cVne+HtO59t
         NY0qyFW52Arm2YLEobRCwAr23kVu2nZ4kljGYyBC8cFZ7IHzcAe6qDXysWbfXc74tnwu
         yFHL5NXXVoHPOSV2DAzVfWTXEzSnuyYubN/Iz94Fk1vslSEuX7ZQVAvm0vBZcHiu+Fc5
         RlQHzOInss/Jsyc9ZMVfb8aCgP5p+dGILltQm0kj4SIWxULWi3J8UvJUqw0D/IEg+ApV
         6sOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=pQIInajLKjAFvcPsxH+g0EcKAOquzfuEHlh5H2Ofj7U=;
        b=IS7TB1VqpXu78WxScYW32n0REhAPhXPIaHZwCuEGF9TvWsZR3Y2b5wAQEziuHWycBk
         k9joGoMT/I+mV5EMiXWOrQAtemDu5CidvLIMvUz3IK8wDRLqCwuyWtIK64XAfaMsFl9Q
         MfR08t3HZxZha1RiIWMNppMVg5v0FhW5fshY2JbehgBoMkmyhLLVkZP3Q/4Mhx91AgMO
         kubHoMyoyU9A8xTprOtJF7hTSIWCQ0RlQUgG+UWRqjw4RKUre5kPwl1+kD4hECbC4N0V
         wa2jQ92Yegvn8aaGZ+ocoTpTnH20LHWAFWUjYu58b6Py9ucJt+1qrQLSxx9VfDBqJS+A
         JF9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="IvHh/eAs";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 188si300668vsr.213.2020.06.09.05.54.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jun 2020 05:54:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="IvHh/eAs";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jidmG-0003cW-Nt
	for alex.bennee@linaro.org; Tue, 09 Jun 2020 08:54:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jidm2-0003bo-DW
 for qemu-arm@nongnu.org; Tue, 09 Jun 2020 08:54:38 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:45433
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jidm1-00027i-3r
 for qemu-arm@nongnu.org; Tue, 09 Jun 2020 08:54:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591707275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pQIInajLKjAFvcPsxH+g0EcKAOquzfuEHlh5H2Ofj7U=;
 b=IvHh/eAsOe18PKy02IkIJiUn3E1MOeIkOYcXGYlrM06K5uX1lWc2q8F49m/HlScNM2M3hw
 Aqq15vEN7Ppi7KtRyedbD21FCdpUBVuYH6R6Tf+OSysplGL2FIeXtbbO2Az4D4PgLYRr3n
 Xgan0Mh6GSdUiA7q37sYwzeYvHjRuSg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-qLMgosAENH6BQJV9UqkMHg-1; Tue, 09 Jun 2020 08:54:33 -0400
X-MC-Unique: qLMgosAENH6BQJV9UqkMHg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86C75107ACF2;
 Tue,  9 Jun 2020 12:54:32 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 09D345C557;
 Tue,  9 Jun 2020 12:54:26 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, stefanb@linux.ibm.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 mst@redhat.com, shannon.zhaosl@gmail.com, imammedo@redhat.com
Subject: [PATCH v2 1/5] test/tpm-emu: include sockets and channel headers in
 tpm-emu header
Date: Tue,  9 Jun 2020 14:54:05 +0200
Message-Id: <20200609125409.24179-2-eric.auger@redhat.com>
In-Reply-To: <20200609125409.24179-1-eric.auger@redhat.com>
References: <20200609125409.24179-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 02:41:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: marcandre.lureau@redhat.com, drjones@redhat.com, lersek@redhat.com,
 ardb@kernel.org, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mlkaE/9kemNM

Include sockets and channel headers to that the header is
self-contained.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
---
 tests/qtest/tpm-emu.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/qtest/tpm-emu.h b/tests/qtest/tpm-emu.h
index a4f1d64226..73f3bed0c4 100644
--- a/tests/qtest/tpm-emu.h
+++ b/tests/qtest/tpm-emu.h
@@ -16,6 +16,9 @@
 #define TPM_RC_FAILURE 0x101
 #define TPM2_ST_NO_SESSIONS 0x8001
 
+#include "qemu/sockets.h"
+#include "io/channel.h"
+
 struct tpm_hdr {
     uint16_t tag;
     uint32_t len;
-- 
2.20.1

