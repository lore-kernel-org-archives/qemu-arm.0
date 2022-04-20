Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp3169207lfk;
        Wed, 20 Apr 2022 07:16:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztUtETQwz78RTDmyfhvAaXsx8VsVw6ThU5xg9xeK4/hgKY0SIL9uAcOhl+LPg7CrU6/8rv
X-Received: by 2002:a5b:a0c:0:b0:633:6489:7e3a with SMTP id k12-20020a5b0a0c000000b0063364897e3amr20885866ybq.71.1650464217779;
        Wed, 20 Apr 2022 07:16:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650464217; cv=none;
        d=google.com; s=arc-20160816;
        b=aI179o45x34aZTCw72FwZQvxcFj/OFMmEirAPOvcRCW4nIJXy0CmTjG/rJH9xVFAoK
         17jCuX0kzg5+qBy0t35TLn9MivWAPOMzvQXhybjPz/jhNQv5aMbPpgTpet7uLpPLEpZY
         bwHfvQepc4jzlMJqscdWHXkvd01PxFrYdJNRWzg0zifMaVvQUo1WzRPfzcok1So2Z409
         oa6/i0usmYhQ0rcohq36yONyduRCZcw2yLKNHzjpiCwQbBnojCFC7ABaw8s9loA6X3BA
         C8Oic/Tso4eh6PRVLgG0tFUgMFt4TXBzq0CTwf0EjMpuwqKDoJtXVLKnmJruhdwivmrP
         liWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=daKpfsoUimB+0q0dX/2olCtCyHxN3IQ4vwY4w7zTlQg=;
        b=PVOc+58N9WmaRNOvtkr2aYbMWro9UL6PG816Nkx7ZpG4mCMlOFy0YzmvEwyQoGA0J4
         wl3Z0WuEmuzfkXlfM3Qm3L9qtoBzMEXJYaOOHprYWm3wf1hMPnSL8Yr32VshaKj1eNDG
         DzNybO/VgO9UB5jj3ozgzATKL1FH7Www5HO75jdI/SZPDWYHfXD4NOa9XJkREguVu5zT
         NbCLRcdVdXaey5tTZXMbc0D+fdyqTpdB/CTZDetllR46u6H1wEOIwTIZgDeUel0lL7X4
         +Qr60EcLs/O7hysTYTKc+oPkZwEi20iRj9iYJulcrztZiV9KJRNfItBVhBp2/2YkiIhy
         vjPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=esptOUXB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d20-20020a811d14000000b002f1c9e07835si1477387ywd.144.2022.04.20.07.16.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Apr 2022 07:16:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=esptOUXB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nhB8a-00045J-Np
	for alex.bennee@linaro.org; Wed, 20 Apr 2022 10:16:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhAMt-0006NZ-Tt
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 09:27:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhAMs-0004XV-G1
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 09:27:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650461258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=daKpfsoUimB+0q0dX/2olCtCyHxN3IQ4vwY4w7zTlQg=;
 b=esptOUXBG89WeUJw5gwQQb7zIQx1l9H+7AIm23n0nxWOsr/O0bXXbYvPn2bKmm9/6UH1WP
 453MAT+MFd2LKeLh+6nBjMGJbN+5NBnuDtVqEfqpiRJc20xfqxRn0wOTrygjCUj4zfSHoP
 BGCSI1qWnL+W6xsaI0QH4F/Pu6L1CC4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-107-m0SmlyUKPn2f6w4dOWQ71w-1; Wed, 20 Apr 2022 09:27:34 -0400
X-MC-Unique: m0SmlyUKPn2f6w4dOWQ71w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 55BFC3806739;
 Wed, 20 Apr 2022 13:27:34 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7C5A5C3598B;
 Wed, 20 Apr 2022 13:27:33 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 14/41] arm/allwinner-a10: replace snprintf() with
 g_strdup_printf()
Date: Wed, 20 Apr 2022 17:25:57 +0400
Message-Id: <20220420132624.2439741-15-marcandre.lureau@redhat.com>
In-Reply-To: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "open list:Allwinner-a10" <qemu-arm@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +TfMw8VCuiwl

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Also fixes a GCC 12.0.1 false-positive:
../hw/arm/allwinner-a10.c: In function ‘aw_a10_realize’:
../hw/arm/allwinner-a10.c:135:35: error: ‘%d’ directive writing between 1 and 11 bytes into a region of size 8 [-Werror=format-overflow=]
  135 |             sprintf(bus, "usb-bus.%d", i);
      |                                   ^~

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/allwinner-a10.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
index 05e84728cb34..79082289ea5b 100644
--- a/hw/arm/allwinner-a10.c
+++ b/hw/arm/allwinner-a10.c
@@ -130,9 +130,7 @@ static void aw_a10_realize(DeviceState *dev, Error **errp)
         int i;
 
         for (i = 0; i < AW_A10_NUM_USB; i++) {
-            char bus[16];
-
-            sprintf(bus, "usb-bus.%d", i);
+            g_autofree char *bus = g_strdup_printf("usb-bus.%d", i);
 
             object_property_set_bool(OBJECT(&s->ehci[i]), "companion-enable",
                                      true, &error_fatal);
-- 
2.35.1.693.g805e0a68082a

