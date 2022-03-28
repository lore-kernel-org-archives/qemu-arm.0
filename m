Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp6346729lfb;
        Mon, 28 Mar 2022 01:54:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzhal1z40rJe6z5WZy8jsw6KqTZWDOZug2NxKvGaeq6etkWzvT70HdHZsf6/Gz3yQKCPnB
X-Received: by 2002:ad4:4f2b:0:b0:441:4092:c422 with SMTP id fc11-20020ad44f2b000000b004414092c422mr19280523qvb.126.1648457697848;
        Mon, 28 Mar 2022 01:54:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648457697; cv=none;
        d=google.com; s=arc-20160816;
        b=xoGhBQMXVT3gHLNK+lW8a8IW0GYAn67YEXgD9sLLmeBdp//xuhVa8U8RHbMsBVMSS2
         OL+M31BwTG135l9wTXqv7bQmv2UtfejV9+NlpySLdDqkFhz11eZ3/sun6dlWho9PgDjZ
         lhcuUzd6Sozj70DyXzz/wRxR7YWPSyzlAHgUCRu6elRRslwz1dhotStwzTsQbtwATRWa
         I0WS2NFm60SMmK7+uQreIJepH318jUUDHa51tOl63mkPY6p7fmweWY6uNlciK2qSEVf6
         ArDUKGzZYLOMPOLir5Krj9QnqzzoRA053r3mdX0s9mXu5chheR8F6RlUBRjE+hbsaiQz
         aYHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=k1dBkz5PO1GKxZIB7ifoqfPQz5LPGgsfXEfad76DQn0=;
        b=yPirdC/2HorMIzb0ivmLs6ygonStlfBwEW5cIy5V9zXw70mvssp/zfSD2B1AYhep7B
         rVTjUTiMRuJQoDH8dB1c9U+oz+BeoAvA6Id/I2y8LO5j8lXjub683tmsziofLWXuPYWl
         Esi5jyhNcbcPO/phPUFvMU7rQ4WMgD5khM7CJw/kakHdeEgftJpFa8mkW5rU3RdyRkS/
         AcT6k31ldoQT5zTrLOZ3FyAxNwa9tyv7hPbBkAGBx6mKve1w+gb26/PryMpkLJg0HeJC
         Z9V4bKVCoH9vrs7k3heowHh941cSXlblqmQYSvk/mEffejdk0nruUX+WkxzqD4Qe6zXy
         XdxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TH+vl29b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v5-20020a05620a440500b0067e4be23939si8122515qkp.382.2022.03.28.01.54.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Mar 2022 01:54:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TH+vl29b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nYl9N-000647-6H
	for alex.bennee@linaro.org; Mon, 28 Mar 2022 04:54:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nYl3H-0005uv-GV
 for qemu-arm@nongnu.org; Mon, 28 Mar 2022 04:48:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nYl3E-0003Dv-LY
 for qemu-arm@nongnu.org; Mon, 28 Mar 2022 04:48:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648457316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k1dBkz5PO1GKxZIB7ifoqfPQz5LPGgsfXEfad76DQn0=;
 b=TH+vl29bPxk5Tkpya7BABNfKK+Q7JaqxTTuBO7fkqfkx2LKwCC2zlYp1ELAXtiSM6iqwF1
 D9MWwJ7v+WacwQk9TQv5pkG/lqPFhME2Txh1wrg7pUu59275E95sp/FVMFW8ez2t+xpsg7
 Pptxouc1GAs5Y1FrWHp7bFDm5vXPfgQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-509-BZGaXVmZOWqHaBl3YozJXg-1; Mon, 28 Mar 2022 04:48:32 -0400
X-MC-Unique: BZGaXVmZOWqHaBl3YozJXg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D8173C11A05;
 Mon, 28 Mar 2022 08:48:32 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 59923426344;
 Mon, 28 Mar 2022 08:48:31 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 5/5] s390x/tcg: fix format-truncation warning
Date: Mon, 28 Mar 2022 12:47:17 +0400
Message-Id: <20220328084717.367993-6-marcandre.lureau@redhat.com>
In-Reply-To: <20220328084717.367993-1-marcandre.lureau@redhat.com>
References: <20220328084717.367993-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Antony Pavlov <antonynpavlov@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /h54eDIrv52s

From: Marc-André Lureau <marcandre.lureau@redhat.com>

../target/s390x/tcg/translate.c: In function ‘s390x_translate_init’:
../target/s390x/tcg/translate.c:224:64: error: ‘%d’ directive output may be truncated writing between 1 and 11 bytes into a region of size 3 [-Werror=format-truncation=]
  224 |         snprintf(cpu_reg_names[i], sizeof(cpu_reg_names[0]), "r%d", i);
      |                                                                ^~

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 target/s390x/tcg/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 5acfc0ff9b4e..a082342a0424 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -199,7 +199,7 @@ static TCGv_i64 regs[16];
 
 void s390x_translate_init(void)
 {
-    int i;
+    size_t i;
 
     psw_addr = tcg_global_mem_new_i64(cpu_env,
                                       offsetof(CPUS390XState, psw.addr),
@@ -221,7 +221,7 @@ void s390x_translate_init(void)
                                    "cc_vr");
 
     for (i = 0; i < 16; i++) {
-        snprintf(cpu_reg_names[i], sizeof(cpu_reg_names[0]), "r%d", i);
+        snprintf(cpu_reg_names[i], sizeof(cpu_reg_names[0]), "r%zu", i);
         regs[i] = tcg_global_mem_new(cpu_env,
                                      offsetof(CPUS390XState, regs[i]),
                                      cpu_reg_names[i]);
-- 
2.35.1.273.ge6ebfd0e8cbb

