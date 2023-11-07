Received: by 2002:a17:906:4a55:b0:9d0:bf65:29fa with SMTP id a21csp212394ejv;
        Tue, 7 Nov 2023 02:21:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFQ2vWj2/Wrc85d9Z0WETBFAXQ25+yLvODCBM40LAArrhWU5O8QBzfLcsX0+n2k8OhbFzBd
X-Received: by 2002:a05:622a:1309:b0:41c:c2ad:6810 with SMTP id v9-20020a05622a130900b0041cc2ad6810mr34599191qtk.2.1699352471327;
        Tue, 07 Nov 2023 02:21:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699352471; cv=none;
        d=google.com; s=arc-20160816;
        b=aanqQaeLar8r206U01W1VOUELbAx3hWZLqomp25zTOEQkPpejYMKENhCJ+07suSRSM
         ARPNRMp1UMKStv4EnnsWkxsQXxtng3Mo00W6gp5ZvipaD5SkDnb3rBOeiFjZe77ReXUJ
         ZkB710yzVBAu2Qe2hfTKDKdJI5dtx9I00gea1+8q2fNIHeDY7adxW3PTW/Kz7u2KJcre
         bfbwWZpjeKjhwkpM+BMnSMVyVcv9aKciKRG/BR+80+ALtUUQys6RMVTeJD8HP/23YW22
         CXKOqMaZuMi/I9BzIRpqbhx0GIbShBrs5aRpS/xeDaPo0Krqf4lbf9H+G4mrihOsG0ct
         C6CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=RRmpjNw+PiVBGCQWh71HBbTOJcRS+W1+fGnNlEvtcDw=;
        fh=jCWr8o4gKfVryjAlDChV7jmMrIfhOWUhS6ngY+scWJ0=;
        b=D3OorisPa+DDDqIzpRlRi0cLyq03O/WlbmtaA1msN+xH3+9D0yzB6K6HmK79M/zXXt
         zdsU1NS1kRbCggCyg0BjbgFAGHjsXdakWRshbMW+TWH5w9Fnylhdns2s3mlsGbR7umuU
         1x7b0+KndLi+G4K8nDDrO0NC2VW9qGYO6j9O/ODhj3YicZTCGmygrsjFHHRhqWd+Zg1d
         H6LiBMKAQA04zT7+Umh3+sXp980aYNg5FFhEH94pJjG3lTwVfSVzLkvMTwbX5rE2X1/M
         K2oMOZGvzmnkUpXgrFlfwohLQvIGUsPk1emHkkoVUb32ZAfitmB/2WoBdQ5KIdq9w2NC
         kVuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=G7lnymCP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z20-20020ac87f94000000b004035dadf9f5si6905259qtj.700.2023.11.07.02.21.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Nov 2023 02:21:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=G7lnymCP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r0J9A-0005mM-Iq; Tue, 07 Nov 2023 05:17:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1r0J94-0005J1-NP
 for qemu-arm@nongnu.org; Tue, 07 Nov 2023 05:17:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1r0J91-0003hV-IK
 for qemu-arm@nongnu.org; Tue, 07 Nov 2023 05:17:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699352233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RRmpjNw+PiVBGCQWh71HBbTOJcRS+W1+fGnNlEvtcDw=;
 b=G7lnymCPY0Ii7GFoS6BC5V7NEy8xC653h+7OZtcNCvXKl70awEoDJ7fbr1upm/5Y6WOUhY
 S4cYEREKH+IGZJUHVzLISN7+ShJASpRZnDXxmYk3vnj2ZnDu9fjtV9DePhyHt2lKEiicy/
 YQgFD8M7woSgENSYedh2DJXL30jQ1Co=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-685-2kHOEsl2NEa0UWrWTb573g-1; Tue,
 07 Nov 2023 05:16:53 -0500
X-MC-Unique: 2kHOEsl2NEa0UWrWTb573g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D159382156E;
 Tue,  7 Nov 2023 10:16:53 +0000 (UTC)
Received: from localhost (unknown [10.39.208.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5482A25C0;
 Tue,  7 Nov 2023 10:16:52 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: stefanha@gmail.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PULL v3 21/25] hw/arm: XLNX_VERSAL depends on XLNX_CSU_DMA
Date: Tue,  7 Nov 2023 14:15:19 +0400
Message-ID: <20231107101524.2993389-22-marcandre.lureau@redhat.com>
In-Reply-To: <20231107101524.2993389-1-marcandre.lureau@redhat.com>
References: <20231107101524.2993389-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: IjwYvoJcDM94

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Fixes: 868d968004 ("hw/arm/xlnx-versal: Connect OSPI flash controller")
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index d215a2c729..8b3dc160cd 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -484,6 +484,7 @@ config XLNX_VERSAL
     select XLNX_EFUSE_VERSAL
     select XLNX_USB_SUBSYS
     select XLNX_VERSAL_TRNG
+    select XLNX_CSU_DMA
 
 config NPCM7XX
     bool
-- 
2.41.0

