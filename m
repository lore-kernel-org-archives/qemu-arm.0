Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp742579ejc;
        Fri, 26 Jan 2024 00:40:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH5LbP4hGPniSbHFvDYH9GEGcKvK5LT8T09H4Ukwx1TJhpngLJpK+jkbm1YC6W2lefxVUgR
X-Received: by 2002:a05:6808:1910:b0:3bd:e002:bbf3 with SMTP id bf16-20020a056808191000b003bde002bbf3mr1190711oib.105.1706258433078;
        Fri, 26 Jan 2024 00:40:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706258433; cv=none;
        d=google.com; s=arc-20160816;
        b=HUYK8B8hXYKgPEoouNyoMW8C/e0OrmD7rNK9jFf7Fts2wjOiJn3LnqB1BWugENZbry
         6gRo5Bgs8DBatFygVj68IAit5rk191vJQUE321Fw/sB9n+7gv9xjxAuOQ6rJY7dPuLFR
         EsPwsNdFCBiJeHP78wBUnhcIwDqJ1PrPICCgxwm5utQC9Ctci75dyTlskekZpTesxmqH
         zJ+tiWruiHYIf2DGbrz6ZFXYKUjMUjHhpgJx3LRDNmB5C2QKeu97U8h55T7neoJYGMi2
         fjUQDfri/+1re1+rI8m3lQRSH4uPwIHE0JTv4SY64x35FCOte2qqj1CGjrovNVoY0TvA
         o96w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=FUNbVaBu/SiP5r0/ed6gLwfPO+g3hM0qy/lnk4SkiUY=;
        fh=4MFjWk99T14cOfrd/QAZZe1F8g1v4KV8Ub1F9CwTKmk=;
        b=HASLEZ7EbdgqbIG5UKo1jAm1di0YuisxuvT/k7lLUJsrJI2M2QH/XrAFcAc65Ra+6d
         XrkhCZz7Uxy4Iw2/gdDxtkd8L/a1Egr+1D9xrdgrzjqsaKf/PeLSCSpwx6jBXAmm7hEr
         IrdQfIln+7MTMw8rdP38/PjXsNORbakyHA0TsbC7WkR6OQPQJcnRTyCiNHWneGC2VgVj
         7X3v/qEdj6NPT/Vshnh2+otDlvEnxrsk+AkBSbQVZ2iRIcsXEbA4eNnIXhlyvilhGvrN
         47dNyAgEn1RyoU0YRCdAzCq+dmjSEEXXer3arpjxBzrTtbBYejI+1Xtn1FRSpEpQ/6oB
         Wmkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BPnPBO4p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1-20020a05620a02e100b0078331431074si838765qko.673.2024.01.26.00.40.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jan 2024 00:40:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BPnPBO4p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rTHl9-00007J-0B; Fri, 26 Jan 2024 03:40:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rTHl2-0008F1-LE
 for qemu-arm@nongnu.org; Fri, 26 Jan 2024 03:40:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rTHl0-0002SH-Bb
 for qemu-arm@nongnu.org; Fri, 26 Jan 2024 03:40:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706258412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FUNbVaBu/SiP5r0/ed6gLwfPO+g3hM0qy/lnk4SkiUY=;
 b=BPnPBO4ptAgbq6+y3kCajxzbMiysaG9/HHIY/I5OoG+skbebthMW/VPhQ/FYfFHVdd/jfC
 RCWDPFUY2QYnou68/FeOA/fBu4I8BH9FlkiF7Fq/fGZlcAtHr1Fp8RmazmR7yXpYbD8gPz
 CRSoB4nQVAxOUtTt3rCeHXo13GvqPA0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-352-z1ypT6w7MxSWQIlaV5mW1A-1; Fri, 26 Jan 2024 03:40:09 -0500
X-MC-Unique: z1ypT6w7MxSWQIlaV5mW1A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3CF86185A780;
 Fri, 26 Jan 2024 08:40:09 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.193.161])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E5810492BFA;
 Fri, 26 Jan 2024 08:40:07 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/3] target/arm/Kconfig: Stop requiring CONFIG_ARM_V7M
Date: Fri, 26 Jan 2024 09:40:01 +0100
Message-ID: <20240126084001.879548-4-thuth@redhat.com>
In-Reply-To: <20240126084001.879548-1-thuth@redhat.com>
References: <20240126084001.879548-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.5,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: tpwaGgIqhBkA

Now that we made sure that ARM_V7M code only gets compiled if really
needed, we can drop the hard requirement for CONFIG_ARM_V7M in the
Kconfig file.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/arm/Kconfig | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/target/arm/Kconfig b/target/arm/Kconfig
index bf57d739cd..3fffdcb61b 100644
--- a/target/arm/Kconfig
+++ b/target/arm/Kconfig
@@ -2,10 +2,6 @@ config ARM
     bool
     select ARM_COMPATIBLE_SEMIHOSTING if TCG
 
-    # We need to select this until we move m_helper.c and the
-    # translate.c v7m helpers under ARM_V7M.
-    select ARM_V7M if TCG
-
 config AARCH64
     bool
     select ARM
-- 
2.43.0

