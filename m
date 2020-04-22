Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp641957lfm;
        Wed, 22 Apr 2020 06:34:48 -0700 (PDT)
X-Google-Smtp-Source: APiQypKv9nEBkwvsJ/IT4KM4aa6ko88/JXTHUMfUUWN3aIMCmELSP51i1v9rrmaz0fUspvqZXTLe
X-Received: by 2002:a0c:aa8f:: with SMTP id f15mr1200912qvb.240.1587562487908;
        Wed, 22 Apr 2020 06:34:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587562487; cv=none;
        d=google.com; s=arc-20160816;
        b=jlE59nGeQR32H3z0WpWXBNzZcpU6cvES8/nU9JQacm/HGMNJDZ9Q3dftRGfoG4czi9
         DoaHeW8B8USyKLbA8jzs/IfRijRtsUZ1DyXXVvOqa9V6ez6qup38zEJZGBEmkOLIFfGg
         uiEeCOByN14TatGhpq/X6CSkqVjE1dkIC6GZy0v2voIgG8VdQjV/TdVopnlUXKfqO7P7
         J4PFtRJdcQleppg8xhscGQGyTt0Ne5OpG/tVI8nCVR9Q+EWVnYg3LnJIw7skbGqik9gB
         CWgQtCubUM145D0Il9jBxS0eovgI+mpKlEvGMhvEMarc36xNmfJkc+NgG3XOzwYB/+ea
         ApaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=OeM0cBach7mM1Er+F+BdNF9X8Ccb7WYWiy4rdEvvNOc=;
        b=AV5aL0nwUyWNntVFwVMaeSfKypqgbQFxtlm4CvFFYJfL9PT5lxCwNyYejUT2ZUx3ap
         a3U81XrgR+ey5io+KawU+U2tdVbZDKUwf0qed5lacTuw8E4hJEFogs2ylLZbuDZgpdvz
         M0CsHHXW2Si382IgOYGmb2w3D+5Ndt/xY3pffOv+xfnYuXi/fmCOQy5wMU5rHy0AnN4r
         m1bn5Um4RNaZOqEkCvGuE6f4swERzT8WIDKVIwAwePwP24MTx4B8jYBOecY13OD/6TIN
         qVnSsglUD6t06wDp5RQUcQ1CLKc4ff2opCwTSt0lOV6nvNCF1zTdl10Um3QNtQLa/pzn
         NaEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fhwXBZYY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o16si3117409qvr.218.2020.04.22.06.34.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Apr 2020 06:34:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fhwXBZYY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jRFWZ-0000Ka-6j
	for alex.bennee@linaro.org; Wed, 22 Apr 2020 09:34:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59444)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jRFUS-0006aW-FW
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 09:32:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jRFUQ-0003JC-Sl
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 09:32:35 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:28887
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jRFUQ-0003Bj-DF
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 09:32:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587562352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OeM0cBach7mM1Er+F+BdNF9X8Ccb7WYWiy4rdEvvNOc=;
 b=fhwXBZYYHAaORZhy3KrTdCLre+3U7SdFr54J5qyq8YEuTBMUOFLmv8PoTggTasErViO/IR
 1aUu6e50LJh6azFRcOOG8w7UxE/oBIxtA18cNVeZzwEmRYUCSeshPyTzWU5wpxqCnv7nQy
 UwrJmi51O/ypmwcqloEmdIIIsaqdjqA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-SUqi1fXZO-eFEuGd0RIbXQ-1; Wed, 22 Apr 2020 09:32:31 -0400
X-MC-Unique: SUqi1fXZO-eFEuGd0RIbXQ-1
Received: by mail-wm1-f70.google.com with SMTP id q5so793036wmc.9
 for <qemu-devel@nongnu.org>; Wed, 22 Apr 2020 06:32:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vqpHgk+Qg3xtVikhp88gaWQSBTFh1RmAeJyt0Yb24RI=;
 b=CQKVG5Fmm00sxEXkqJO/6kVF2cFqvv03QXCDmx63Jq8BIA66rFxZLZ8J4vJJKvk5aW
 lbk2K2TZGLSbVE+VkCrICcGQj4L6q6kkC4+xhIGO6Ky1la5bOmGS5cEnS6cGl1/5woYt
 AAXW2NU8szi21TMlIj6Tnt0vhOTLegds6dDmlwL1YdvZAEoKcekbThRorVd4LxDEU1LZ
 CjP0e5d25isJipF6f6M9p19CVofW+Ht6R8fPGHb+Ltnje1zujxlsJcjVA0WaKIuKrlwt
 B+996JrGIX+02i6fLTZRfbU/CBupX8n02GvBPEK6YrxauYE45QLh2+i0VlOH2n0y2a0U
 ztHw==
X-Gm-Message-State: AGi0PuYdQPuo7/RvcP6OOHPUTVcVJULUpQN8u4wW1wg4QiRgdJh4GIeB
 sWRm43KYjNrWTKRU9FxsimdrW55n5GJZIxaSHlhUilmyh5uLDBmyiIVPC4JhJvEk7ugdYkydSB7
 YfDDUYpwtOqFxhS0=
X-Received: by 2002:adf:f2c5:: with SMTP id d5mr15624567wrp.285.1587562349781; 
 Wed, 22 Apr 2020 06:32:29 -0700 (PDT)
X-Received: by 2002:adf:f2c5:: with SMTP id d5mr15624548wrp.285.1587562349602; 
 Wed, 22 Apr 2020 06:32:29 -0700 (PDT)
Received: from x1w.redhat.com (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id h2sm8578677wro.9.2020.04.22.06.32.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2020 06:32:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 7/9] hw/gpio/aspeed_gpio: Remove dead assignment
Date: Wed, 22 Apr 2020 15:31:50 +0200
Message-Id: <20200422133152.16770-8-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200422133152.16770-1-philmd@redhat.com>
References: <20200422133152.16770-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/22 02:12:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.81
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Andrew Jeffery <andrew@aj.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2fZim5+AvCt/

Fix warning reported by Clang static code analyzer:

  hw/gpio/aspeed_gpio.c:717:18: warning: Value stored to 'g_idx' during its=
 initialization is never read
      int set_idx, g_idx =3D *group_idx;
                   ^~~~~   ~~~~~~~~~~

Reported-by: Clang Static Analyzer
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/gpio/aspeed_gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
index 41e11ea9b0..bd19db31f4 100644
--- a/hw/gpio/aspeed_gpio.c
+++ b/hw/gpio/aspeed_gpio.c
@@ -714,7 +714,7 @@ static void aspeed_gpio_write(void *opaque, hwaddr offs=
et, uint64_t data,
 static int get_set_idx(AspeedGPIOState *s, const char *group, int *group_i=
dx)
 {
     AspeedGPIOClass *agc =3D ASPEED_GPIO_GET_CLASS(s);
-    int set_idx, g_idx =3D *group_idx;
+    int set_idx, g_idx;
=20
     for (set_idx =3D 0; set_idx < agc->nr_gpio_sets; set_idx++) {
         const GPIOSetProperties *set_props =3D &agc->props[set_idx];
--=20
2.21.1

