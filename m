Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2967471ejb;
        Wed, 25 Oct 2023 12:09:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHatrKaY+5OGcx0ozzMJY1llZy4usN1JUsMWpl5SO6K+njCmEnM0WUkdIzv0iA5+JXMbv/W
X-Received: by 2002:a5d:410c:0:b0:32d:b7e3:c1b6 with SMTP id l12-20020a5d410c000000b0032db7e3c1b6mr12130044wrp.13.1698260983395;
        Wed, 25 Oct 2023 12:09:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698260983; cv=none;
        d=google.com; s=arc-20160816;
        b=Dahiuq1XI28OlSNLoPqRyZ2ivns9OYvPN2xqq6mD1K8+BCJzdigeEsfbG4WmELaJdT
         JGcf7i+bD0KPSmfXE3+vLH/soeMBwokSfVN7ilPLIf8po50wzn5u8iymofDltpaB0Ta/
         tEX93hKdZHNsH3YpECWU0PSGxyOjyhRpkPZlYYG8+uKWHcKb92WhpFVQhzsjiluaVhqX
         Qo8ECARCo2WTdJFmehgyh/7N74a+GAwtmW4NCe76q6fB/j7fZKZXja7xQac9t86zsWcn
         qf38Z4TTv56t4xJiZ/aipESS6bLpIVNAusiv0C2TSMdIgJ8mu3Zk0RyuDsBRMoA8Aq3Q
         brBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=sIO5QRCE31iBzGTr3ZeklZwn4Itg9W3wBYV5HekWBCc=;
        fh=xhblChOHn/9ohxmBdExAv8vV4InD5nB0dX6yBSUq53Q=;
        b=LceuPwPEqDkPbdVyxaOUyM9Z/VM1OCmLmuR9+52HlVxcWjJB+5EGY44HNwiHqkQuVK
         bM+qhWLvK8H29+1yIEaSPW+Lq72aMlm0L58sTuZSEjJiKI8xI0Ec6U0K4ak6qUSTcbSG
         Og37xoYZDywhD8cNI3jROcdF7T8+aebxM8lgDDTbXLRbijToorX+AwvP8cZgLJvF8j23
         NO2tMSREcbGimVnVXHtUjTGfCccWqy43kClFBQy+CtBNA56fzp2SE/7QeCjr1nhNoshI
         hxIc/+BE0YgfXl5KvJTWroR+VfZHR18ZkOgUmJvI6GGr9/nBoMMbNbOZhkU0J1K80s23
         W0WA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WKwwW533;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j6-20020a5d4486000000b0032dda1b7287si8004925wrq.923.2023.10.25.12.09.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Oct 2023 12:09:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WKwwW533;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvjFM-0004gj-LE; Wed, 25 Oct 2023 15:08:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qvjFL-0004fy-DM
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 15:08:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qvjFI-0000JJ-TZ
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 15:08:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698260928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sIO5QRCE31iBzGTr3ZeklZwn4Itg9W3wBYV5HekWBCc=;
 b=WKwwW533Qx1PH11/mkqhgjw4RMG2ptPtVONp0za1qnMahCvff5A8hBmAHjtugLc4BXsu3F
 Ngu6VfZYt25/rQsH+ePLqv5jGwuEtMI4ypnvtdUgYpVDSDhRtQv724fiIF+tWNv+O5iPt2
 tH3Y+lfxSSVwA2wtpfkF+Z28i2yxzOM=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-112-9Cbo3tjkN6O2VCt5JaS0BA-1; Wed,
 25 Oct 2023 15:08:45 -0400
X-MC-Unique: 9Cbo3tjkN6O2VCt5JaS0BA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 72C5528004F4;
 Wed, 25 Oct 2023 19:08:44 +0000 (UTC)
Received: from localhost (unknown [10.39.208.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B78262166B26;
 Wed, 25 Oct 2023 19:08:43 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 Eric Blake <eblake@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v6 05/23] vl: drop needless -spice checks
Date: Wed, 25 Oct 2023 23:07:59 +0400
Message-ID: <20231025190818.3278423-6-marcandre.lureau@redhat.com>
In-Reply-To: <20231025190818.3278423-1-marcandre.lureau@redhat.com>
References: <20231025190818.3278423-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 0GYGktNcBqMt

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Since commit 5324e3e958e ("qemu-options: define -spice only #ifdef
CONFIG_SPICE"), it is unnecessary to check at runtime for "-spice"
option.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 system/vl.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/system/vl.c b/system/vl.c
index 92d29bf521..3be1a78a9d 100644
--- a/system/vl.c
+++ b/system/vl.c
@@ -3475,12 +3475,7 @@ void qemu_init(int argc, char **argv)
                 break;
 #ifdef CONFIG_SPICE
             case QEMU_OPTION_spice:
-                olist = qemu_find_opts_err("spice", NULL);
-                if (!olist) {
-                    error_report("spice support is disabled");
-                    exit(1);
-                }
-                opts = qemu_opts_parse_noisily(olist, optarg, false);
+                opts = qemu_opts_parse_noisily(qemu_find_opts("spice"), optarg, false);
                 if (!opts) {
                     exit(1);
                 }
-- 
2.41.0

