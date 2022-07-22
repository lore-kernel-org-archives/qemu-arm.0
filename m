Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp232144lfp;
        Fri, 22 Jul 2022 05:06:20 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t9j0sPYsZvLgzAs6H6lyrTUkKVaeQZSMNgkgjga3w/zeotWmYCfs5rT3D1AHDrcvPliU8S
X-Received: by 2002:a05:620a:290a:b0:6b6:218b:72dd with SMTP id m10-20020a05620a290a00b006b6218b72ddmr244053qkp.153.1658491580319;
        Fri, 22 Jul 2022 05:06:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658491580; cv=none;
        d=google.com; s=arc-20160816;
        b=oxeIj8m16HTxx6PKvOoEvOEl9K82z9ZnyQ2Yu7gVJG1Mcw5w3FLE0tpT0PM1gKsiDR
         VdW+m2OOdn8CiogfYNMazezyJtPSWo4dEVsZyyaylNlCGvSGj73ZNxZhqW0+71FHcOlK
         1RAC91PP58B1TVJppPDLZHEkxTuTpx7YAYU0MhDbKzKiR1NP+PKp6h2DI66BICvl1L1Q
         oNu/Qzl92C6hyJgXSTNdTLEDJVmVBKKHZObxc25TAj2ntadYa0ZqABpA3ABgWB9+mprr
         jk6PBzU4DS7WOsAO6+UNjx93BIRdysn47D6XhEitUfZRAgEsBETBn1NICvy8YzcXt3JV
         oEEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=5plUTj3W6URKiDXw4zyraz6gdfc5Jjz2aZBFO0prHIw=;
        b=Kp5E/sq2tUz9F6uoNlHh/nPE46avSel/y++Lq8pPzfUsEjG3aO2oemgPV1va71fRTk
         hFsS/gDRWlq7ZDgMVNXAya1Mqnb9cYN5CfguZ24OyB7e5FvEwAlC/zvzEMe18dp6gYzY
         sYnLKpDOJiQBJIsCdKOshR00EnQI1VGUL7qjCfUvFBFTE4+8iRgsMMRlp2oZmtqyUyG+
         17SWeOBuw/nslP7NTYMtMiqox0QNvjFVEq4OZ0ERjmWOeypssu7EjFq3OVJd5k+XJ7PZ
         bGuso47FxafKKhL3hZbtLtmfBThzQ+VqBype/G11PjKxf1ZGTK+kJT3a8XKELoY6efeq
         iW0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=e7gAhEVR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fd10-20020a05622a4d0a00b0031e7aa198dbsi3058449qtb.217.2022.07.22.05.06.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Jul 2022 05:06:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=e7gAhEVR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oErQB-0004x8-EU
	for alex.bennee@linaro.org; Fri, 22 Jul 2022 08:06:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oErMb-0008OJ-Dd
 for qemu-arm@nongnu.org; Fri, 22 Jul 2022 08:02:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oErMX-0006GM-V0
 for qemu-arm@nongnu.org; Fri, 22 Jul 2022 08:02:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658491353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5plUTj3W6URKiDXw4zyraz6gdfc5Jjz2aZBFO0prHIw=;
 b=e7gAhEVRCwn1ctsGZyJ/w05vXTF9MfuFxrALFctBM58E3RWi7ZU8UJpqPRasXXKc2IqM0+
 cFMufDIkfWYgdJpJvPJvtsmcBgJohM4ikzC96iRQTQcEfG1OQjLLWOXkQJt3q23U2LYbtu
 zX8n8gsGztAaJDqAxoVOI2jF920FpSg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-606-YO-C78BdPCCBYzDyR6iX6w-1; Fri, 22 Jul 2022 08:02:28 -0400
X-MC-Unique: YO-C78BdPCCBYzDyR6iX6w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 74BAF85A584;
 Fri, 22 Jul 2022 12:02:28 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 396A11121314;
 Fri, 22 Jul 2022 12:02:27 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-arm@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 1/3] target/i386: display deprecation status in '-cpu help'
Date: Fri, 22 Jul 2022 13:02:22 +0100
Message-Id: <20220722120224.2311982-2-berrange@redhat.com>
In-Reply-To: <20220722120224.2311982-1-berrange@redhat.com>
References: <20220722120224.2311982-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XTIEbv07L3aE

When the user queries CPU models via QMP there is a 'deprecated' flag
present, however, this is not done for the CLI '-cpu help' command.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 target/i386/cpu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 6a57ef13af..70f78340e1 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -4837,6 +4837,11 @@ static void x86_cpu_list_entry(gpointer data, gpointer user_data)
         desc = g_strdup_printf("%s", model_id);
     }
 
+    if (cc->model && cc->model->cpudef->deprecation_note) {
+        g_autofree char *olddesc = desc;
+        desc = g_strdup_printf("%s (deprecated)", olddesc);
+    }
+
     qemu_printf("x86 %-20s  %s\n", name, desc);
 }
 
-- 
2.36.1

