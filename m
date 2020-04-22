Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp645583lfm;
        Wed, 22 Apr 2020 06:38:15 -0700 (PDT)
X-Google-Smtp-Source: APiQypInQGc5nGgsyArwCABVwEazhm2kjBvQ5C8iingd83UnCg99shvC61xvYX871EwfE/4bjfJ6
X-Received: by 2002:a05:6214:17ca:: with SMTP id cu10mr19630367qvb.166.1587562695295;
        Wed, 22 Apr 2020 06:38:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587562695; cv=none;
        d=google.com; s=arc-20160816;
        b=jtQhIGAZ315it6007C6PeReNTsd/sB7uVLJh4vGGn6wdolxUH5w9Qv54P/VRlD7ufH
         BCofdGi5uyg2nnth2lVyWPbZd28e3Zv8xPKP5taAhbi0qvEzXsYhAxg+oinDLantmm4g
         fIKMtynT8a/B3l+zPycg8d77JJtW96VoFGOenESTR4m7OvGXXtRJlUpk1oQ8TZuwDJO0
         1YZX2slJMiX6CAW7yDY0EcG3hlCaMivr20LDHlEXtuK4VGnfJO5ObYjVHL3mZORpdZIO
         ikG4SzopC9ZqaXGOn9oDgjC0OsAEHIymcKWNg/894tdUcz9awQmehBuqaT7jS3QScn8d
         nE6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=2C4mjVc4GupZqidy/jN6Lg6n+I2oMBFVaLfmcbIurl0=;
        b=q6U1Zcitv3wYV5opUrj6+MKGh0cYyQJd/F7qn7Q8HZQOUZBFReWw9qK743xs7JzL4P
         y0zpM4Ga8OEBfwcWeOOUJwgap+iQ3GSProXVI2M7NWCMn4DzBzNjiNjykemsTxuQbzUs
         yQWwTs2pOBV3Wj8wpjjYWVRvMQXW1PD1EtH1O214p0c3f3fwhPrNQGF2ARyKOsAQ95iG
         J9N0EgR0Hlhd/5jrGPruzKBYbwYnVrsh399i11eh6CNgxI3VgGb5DZ0LmNx3KfvvDVtd
         UikT8dW0UWbt4a1/BmGw5/9vDhnCyp86ng8jvnVsN/rq1k+ZjPvE5CnjQGQQ6swObLYn
         qecw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Gf+80bbn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r19si3088366qtb.25.2020.04.22.06.38.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Apr 2020 06:38:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Gf+80bbn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jRFZu-0006jh-Nc
	for alex.bennee@linaro.org; Wed, 22 Apr 2020 09:38:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59476)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jRFUV-0006gx-0a
 for qemu-arm@nongnu.org; Wed, 22 Apr 2020 09:32:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jRFUU-0003XG-Eb
 for qemu-arm@nongnu.org; Wed, 22 Apr 2020 09:32:38 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:25739
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jRFUT-0003R2-W4
 for qemu-arm@nongnu.org; Wed, 22 Apr 2020 09:32:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587562357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2C4mjVc4GupZqidy/jN6Lg6n+I2oMBFVaLfmcbIurl0=;
 b=Gf+80bbnZkPvcbufQhEQdBJ7zYPNmK/5fYf3Q7jUJcZLcBFvMddxjpTChD7oB9mr+MHks6
 5cGvi4L+rCfpErz2IRuYZfqEOpis9SlrgAxn7WC+JQtDUDs1QcqJfB+MXWzj7g64AaIhaG
 AnTIKPIlrn3izv6ZbGLP8XPdhYot2fg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-6Q3gs9iEOlyI-t3W-JuiWA-1; Wed, 22 Apr 2020 09:32:35 -0400
X-MC-Unique: 6Q3gs9iEOlyI-t3W-JuiWA-1
Received: by mail-wr1-f72.google.com with SMTP id i10so1045939wrq.8
 for <qemu-arm@nongnu.org>; Wed, 22 Apr 2020 06:32:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dq75PFzgynrFGY6/YI8kQB8GRBvNE4I9mXbmGtzIHFo=;
 b=XBeTaaHTp4Up2RTWmMny7d2kC1U78sYQp/RiJxtSMDwZkImKdKbdthtvakfj78FSgE
 1bwclpbsFDIEVvNVvkZk7G98dTqbk6hMaHKbYxcytMr704A5bScmgokkkCep82J17+ej
 WuwyTlZzJSQKcJnx1KKM5koujhv5M+lVALPauqcsrDOe2zQmGhwcnKlEmfm46nLW5Fa7
 0W4FlaNc9RMlptLVMtZRO1PDEv+My8z8T0VxpXoOSD55oePVQx6KeEnEL/d5CkYvOSAm
 +W3m5f815HV9prGIFSKpsVi21TBWm7E7IU1M2BdigKgg7SiLPa8Q4owiRxexItkyXfV4
 r2vw==
X-Gm-Message-State: AGi0PuZ1gnjbnOuITUj4RkAKdZ+Pn8RiM/N7373xdoo6SsSJ/SeVDWZy
 nNt0RCCDb1Rf+0ilRt/LrRLm4yyMtbPd8vhGF3uQo2r3qgpBYxq0L0Gm9BzYOMpyoHGwbfTVCHc
 zagnRb55yctzU
X-Received: by 2002:a05:6000:1001:: with SMTP id
 a1mr31239575wrx.9.1587562354686; 
 Wed, 22 Apr 2020 06:32:34 -0700 (PDT)
X-Received: by 2002:a05:6000:1001:: with SMTP id
 a1mr31239557wrx.9.1587562354470; 
 Wed, 22 Apr 2020 06:32:34 -0700 (PDT)
Received: from x1w.redhat.com (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id h5sm8860641wrp.97.2020.04.22.06.32.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2020 06:32:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 8/9] hw/timer/stm32f2xx_timer: Remove dead assignment
Date: Wed, 22 Apr 2020 15:31:51 +0200
Message-Id: <20200422133152.16770-9-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200422133152.16770-1-philmd@redhat.com>
References: <20200422133152.16770-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/22 04:15:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Alistair Francis <alistair@alistair23.me>,
 "open list:STM32F205" <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0PTCrkQrJBSl

Fix warning reported by Clang static code analyzer:

    CC      hw/timer/stm32f2xx_timer.o
  hw/timer/stm32f2xx_timer.c:225:9: warning: Value stored to 'value' is nev=
er read
          value =3D timer_val;
          ^       ~~~~~~~~~

Reported-by: Clang Static Analyzer
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/timer/stm32f2xx_timer.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/timer/stm32f2xx_timer.c b/hw/timer/stm32f2xx_timer.c
index 06ec8a02c2..ba8694dcd3 100644
--- a/hw/timer/stm32f2xx_timer.c
+++ b/hw/timer/stm32f2xx_timer.c
@@ -222,7 +222,6 @@ static void stm32f2xx_timer_write(void *opaque, hwaddr =
offset,
     case TIM_PSC:
         timer_val =3D stm32f2xx_ns_to_ticks(s, now) - s->tick_offset;
         s->tim_psc =3D value & 0xFFFF;
-        value =3D timer_val;
         break;
     case TIM_CNT:
         timer_val =3D value;
--=20
2.21.1

