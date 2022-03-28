Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp6344412lfb;
        Mon, 28 Mar 2022 01:50:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWQx5/i9qDzKnymexWjtEMxd9/5jbWkF0lwTtdap95oB8l0vpFo7WYlQrnnrDCZKk/h0Iy
X-Received: by 2002:a05:6214:27e1:b0:441:8577:e0c9 with SMTP id jt1-20020a05621427e100b004418577e0c9mr12411202qvb.22.1648457413446;
        Mon, 28 Mar 2022 01:50:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648457413; cv=none;
        d=google.com; s=arc-20160816;
        b=o9z/0PnHJBW3x4vRIDtYrAMh6eViZ9u+Ia7T99a+JrVX1cN3v8mafDoup5BmhAOsI0
         c5gQvq05w7Vlt3VF2Fu8ZL6ZA3SiDULWaIfFjy1gyV+9j/WYPwWOQKxlmiHy1lh7lu8w
         5T9uTdKB+g5SD/+ocWhY6O2P+xAwtImj4pmW95fehQKQCUY5LfbJgMf2XE6SNilOG+aN
         kFnC4n9a+nI007ZG5KkGUW5kYGQkLYOmowwBQT0ezn+2G67W6QmjTyGKqpYa1L5zWwTW
         9GBTdvwIL15Nnb7ll5DWdUQmExTmUcpwRlMRmd/+lmfiLIjXKsW/1mgzZSFj4fe6X5JS
         PwZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=NNOAqmZ0Io3dxVmDHD7HGmIeEHwTMyIABLHjeEanwlw=;
        b=R+2HBdLkxks3ijZGcf62eElL3H6sDyDbC1mEgD0eUguCNtuIsHyzgI3OVTXvFwOFZN
         EeU4UPZAYYzDIKf5MVbchISh4BOvBQLWRBYgZ/hZCPXvVAtgwzxPN+7bYt77eWBna/1p
         3J9bJPizL4BvWck+x/8aRfWTW1YDdJnshJtq+kxztMlknvTgla0+MP5XSwCWjfnJJun1
         yinmsNtBv4NGwYcST4/zqbh81lfOokm3t2xiCisHlta8kGzYEyl7rdoTt0gqUGIOd+JJ
         V3mEa1YeXBmMND+6ADzLQXdi7XayUNOQTt9CemR2/2J6JbJIuf6Huzr/6foOE/AzvVnP
         nm7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SjErLMkV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g17-20020a05621402d100b00441070e4808si5956263qvu.50.2022.03.28.01.50.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Mar 2022 01:50:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SjErLMkV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nYl4m-0007Jr-RZ
	for alex.bennee@linaro.org; Mon, 28 Mar 2022 04:50:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nYl2Z-0004ap-6d
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 04:47:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nYl2X-00039o-Lp
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 04:47:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648457271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NNOAqmZ0Io3dxVmDHD7HGmIeEHwTMyIABLHjeEanwlw=;
 b=SjErLMkV8J4K0YHWWdByP6a8kvcgVtc8QL+3tL2IvejUDewpiqpuiX8KfcYITW7Z9aXezq
 eLVWdKiT3/Fe91tWp2Xm5n87g4xHIMpqF6YGHw4Ii4xAI75DCnGS5NuOSUZT3devhoauAA
 S8EJFtuAZ9q2mn3ljPFfPK2tv/CYDq0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-172-tJ8w74EIM0WnrF5eQnrNWA-1; Mon, 28 Mar 2022 04:47:48 -0400
X-MC-Unique: tJ8w74EIM0WnrF5eQnrNWA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9DEFE85A5A8;
 Mon, 28 Mar 2022 08:47:47 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5D6F340C1257;
 Mon, 28 Mar 2022 08:47:46 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 2/5] arm/digic: fix format-truncation warning
Date: Mon, 28 Mar 2022 12:47:14 +0400
Message-Id: <20220328084717.367993-3-marcandre.lureau@redhat.com>
In-Reply-To: <20220328084717.367993-1-marcandre.lureau@redhat.com>
References: <20220328084717.367993-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Antony Pavlov <antonynpavlov@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uZpBZpjzucX8

From: Marc-André Lureau <marcandre.lureau@redhat.com>

../hw/arm/digic.c: In function ‘digic_init’:
../hw/arm/digic.c:45:54: error: ‘%d’ directive output may be truncated writing between 1 and 11 bytes into a region of size 5 [-Werror=format-truncation=]
   45 |         snprintf(name, DIGIC_TIMER_NAME_MLEN, "timer[%d]", i);
      |                                                      ^~

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 hw/arm/digic.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/hw/arm/digic.c b/hw/arm/digic.c
index 614232165cdc..6df554797734 100644
--- a/hw/arm/digic.c
+++ b/hw/arm/digic.c
@@ -39,10 +39,7 @@ static void digic_init(Object *obj)
     object_initialize_child(obj, "cpu", &s->cpu, ARM_CPU_TYPE_NAME("arm946"));
 
     for (i = 0; i < DIGIC4_NB_TIMERS; i++) {
-#define DIGIC_TIMER_NAME_MLEN    11
-        char name[DIGIC_TIMER_NAME_MLEN];
-
-        snprintf(name, DIGIC_TIMER_NAME_MLEN, "timer[%d]", i);
+        g_autofree char *name = g_strdup_printf("timer[%d]", i);
         object_initialize_child(obj, name, &s->timer[i], TYPE_DIGIC_TIMER);
     }
 
-- 
2.35.1.273.ge6ebfd0e8cbb

