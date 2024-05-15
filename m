Received: by 2002:a17:907:2723:b0:a5a:9152:cbdc with SMTP id d3csp683823ejl;
        Wed, 15 May 2024 07:18:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVB5iUvWVKW9AU15SXEsu+ehGrnbD7GIkRaWfSje4d38I2E98J8cbVIpLODbzxdQKo0hTEEgsIaGKFWqtg/NTRi0eSZ7Ova
X-Google-Smtp-Source: AGHT+IH9lDPG5i+zI3gMVuKnludhDFgiCCsrxawHhrqMSShA5exzNj7YBHJozL85V77zqICBF0f8
X-Received: by 2002:a05:6102:4e:b0:47b:d70c:ca9d with SMTP id ada2fe7eead31-48077e5b4abmr14622311137.29.1715782685620;
        Wed, 15 May 2024 07:18:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715782685; cv=none;
        d=google.com; s=arc-20160816;
        b=fG8CgE5lZD9Fjn7NnbiQAPyiEElGVwRbUOq2ZFfxcdjvV6XoMMW2EO41/G2LTUzhYd
         g+NJ3TVs1yf8LYy5DxZHJBDnvz13GHWzkKvuTW4XbZao96fhP3TFR3NxdLh1pWbSoATk
         5l1SEpkNkX+ia3PM3//kwHPzQodX/ZOrb6oftRWgc8US66TtKcorr5r+tDIeJIJS9qpz
         r5yTAEO4/aqrDP7zrPbQ3tLNlz4O1V0a+MOrIbHD6DZiexK8JUVwJiLeq5cuPMkagSAC
         /O4hW91kYAiV/cc35b/h0HTwTBu3PAvz+a7xHP9GA1H9Yg/LHKRabNRu6Jl2CPIC3HAS
         p3GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1PcuMKW29yFzoduNcsAS4/Md/zEt1gtogNDC0FaryjY=;
        fh=dv7M3Vyx/D9iF5hjzj0SFl7wXFXIDctWrq9i0V0YiQI=;
        b=HCrHOQJjLd1X2qUH8cWvGmmf2O4y28vuFPeF6aN3S2Pcmla5NkOj+xCBSPJpXXYLUl
         X4kd/nOJ1E6s1/AkYsvehrC7/KmpEf2UGLMxVpgHpwWMGV4gZstSKDqqZbFutVaZeWrN
         Dl4Yq5sich3UPw6kCS9AYb7QTaeMyidAylcpjCJApsKdWp/VEpNB4Prn6dxyyFOjjaP/
         fXi1xi920AZ2HJ+dkwni4TYs3gWVURYhOBgFvEEmY34ngeIYZS+u0q/R1i6DWIBqhfH2
         QO3Mn47fWkuPHuJpBKB4vEJLEfED7c3fLHl5xsPBL0sHK7rT4/jFFvLpyRNvEGc9OG6/
         Qb7Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Xy6lCQNc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4806cc92d28si2458549137.663.2024.05.15.07.18.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 May 2024 07:18:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Xy6lCQNc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1s7FRE-0004fp-KN; Wed, 15 May 2024 10:17:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1s7FQu-0004WB-S9
 for qemu-devel@nongnu.org; Wed, 15 May 2024 10:16:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1s7FQn-0005qs-MV
 for qemu-devel@nongnu.org; Wed, 15 May 2024 10:16:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1715782590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1PcuMKW29yFzoduNcsAS4/Md/zEt1gtogNDC0FaryjY=;
 b=Xy6lCQNcK6NAAxhc0atrbcmjgDoREDymwlXtlSfbO8MOgH8/2yMpHsAjTpcODAKKF1ZCtc
 6stSd4StsqB9X8iyAdDyyWwv1VBD3H/EeRLv69q1kbdSQd1QgK5hLhoBQBzfCe5sQRrI3l
 wJwXPxYTVlqYCn8n8huuLr1EJGhgQRI=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-42-Qko-yTIOPJianokE1ukgMg-1; Wed,
 15 May 2024 10:16:15 -0400
X-MC-Unique: Qko-yTIOPJianokE1ukgMg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4E5903C0E654;
 Wed, 15 May 2024 14:16:11 +0000 (UTC)
Received: from localhost (unknown [10.39.208.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9D192123CAE0;
 Wed, 15 May 2024 14:16:09 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Fiona Ebner <f.ebner@proxmox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas <farosas@suse.de>,
 Gerd Hoffmann <kraxel@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v3 2/5] migration: fix a typo
Date: Wed, 15 May 2024 18:15:53 +0400
Message-ID: <20240515141557.1277999-3-marcandre.lureau@redhat.com>
In-Reply-To: <20240515141557.1277999-1-marcandre.lureau@redhat.com>
References: <20240515141557.1277999-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.935,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: kqhW7QS40RY4

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Fabiano Rosas <farosas@suse.de>
---
 migration/vmstate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/vmstate.c b/migration/vmstate.c
index b51212a75b..ff5d589a6d 100644
--- a/migration/vmstate.c
+++ b/migration/vmstate.c
@@ -479,7 +479,7 @@ static int vmstate_subsection_load(QEMUFile *f, const VMStateDescription *vmsd,
 
         len = qemu_peek_byte(f, 1);
         if (len < strlen(vmsd->name) + 1) {
-            /* subsection name has be be "section_name/a" */
+            /* subsection name has to be "section_name/a" */
             trace_vmstate_subsection_load_bad(vmsd->name, "(short)", "");
             return 0;
         }
-- 
2.41.0.28.gd7d8841f67

