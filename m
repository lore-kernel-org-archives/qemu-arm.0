Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp646755lfm;
        Wed, 22 Apr 2020 06:39:24 -0700 (PDT)
X-Google-Smtp-Source: APiQypLLXkZywCVzANNIvB4/wPZ+bdm4pBcsccFyhIxaUfLDoELbkYsG5fPtV/wAk3f1vxNfn6XQ
X-Received: by 2002:a0c:a98f:: with SMTP id a15mr15508886qvb.105.1587562764750;
        Wed, 22 Apr 2020 06:39:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587562764; cv=none;
        d=google.com; s=arc-20160816;
        b=Vm7QxJTgld5hKT5F6F3CquUfcjtZypBZUdTXBwzNmB3Xl9MiqWx9niVt0FGFnOJ3Fy
         +ruwASrJJ2dr7B/BoJH3ODVYDikJH4jmtoV1BxbhLcNrnPLFabZqauTurDF7mDAfl4kb
         qxOyHP8SXvUo6eP5iSj83Pa/NPz7UlVkYzI3lRjfQXkSHdLgo47pkU2OSUj/T2vchqep
         FlnytD3C0mxnBsHxE1wgbeGlrqRucuG5nsd+CPKz59qC7EEtgDHNk42VWWgagmEymO6r
         InE1LOxgdYBba4qXO+nW272w26F+QgW3ihkUMr+kZn9oqNJ2AY0N/qAPUV+qnPhvOmug
         Wcpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=0kil7rh5PLCfhjtcevVysxbFfatlucuUN8GB4YOzVHM=;
        b=c4o0RWBPMykvlRrv1/wDl3AXJyaihaYF+KVL/+aC8SXtoZXjBmp2bD6chzRiMa84hc
         AYaSqoqmfM+VdmzjAdWFhPcyh5pdwXpcQLmUkhzsce2Cgn3hQOs7A3h8hqu48rvpSGIm
         YBL4aKt2IO17aM8oVZZtdmZotlbkyviyz97GA68gKBqjjBTV3ndvkOEOS5nF7oQzOF06
         746o5vJNz7X/DlMv3iN1t9JFfZEL+JR1lo6AyOtbKTZQheREuyAyc7Fhea5Ji4/oylEd
         VtFyzPnvYWGr9Gxa0F4o/8puN6JXnhsI1wUZkoUlSHotXiJziSUWJBAH8SCN38TS/GBY
         gHZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=H0vLJ5d2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k20si2984613qtu.383.2020.04.22.06.39.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Apr 2020 06:39:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=H0vLJ5d2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jRFb2-00006t-6n
	for alex.bennee@linaro.org; Wed, 22 Apr 2020 09:39:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59600)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jRFUc-0006w1-Eu
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 09:32:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jRFUa-0003w2-Gd
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 09:32:46 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:28269
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jRFUY-0003nq-Vf
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 09:32:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587562362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0kil7rh5PLCfhjtcevVysxbFfatlucuUN8GB4YOzVHM=;
 b=H0vLJ5d2YEnKS/TS154KBCk7ai+9qSk/0Sl2N4t9qBud8ocmsy4MrDsw2sXq4dtDKCqpED
 S3ugYeSKc/e/bNH74Kl+MY2iAbrbxmRy2r+X3PdCGw/v8XDMQpviuBgLFdwwSZXsAdqLnM
 wOcs3sQtq8wNuQt1TF7QsRHankYcakY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-qglXYJT-Mh2T67zQ2J5T_A-1; Wed, 22 Apr 2020 09:32:41 -0400
X-MC-Unique: qglXYJT-Mh2T67zQ2J5T_A-1
Received: by mail-wr1-f71.google.com with SMTP id j16so1028794wrw.20
 for <qemu-devel@nongnu.org>; Wed, 22 Apr 2020 06:32:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vNxCN6M06rXiAjKleOKzOmRwlxNeGgf99J9DO/nchhk=;
 b=SorS14jm2m0/bhrFkHnd6uN3Wpblel0HyuuUPl0mrUb88IMcgZdepTT4AC9aCS0cAi
 njGZlGWKd+PPNYeTP2dghULMYsIOSCS36VN8ld6cu8ro0ymT9b93Xg7aHz5YtK88Snhl
 1S3m2xjKRD4bE84P2ifzvnkYk7/8XUOtb/eRjpYX32V9evtpXWs9bOBjCgNavw7mOSiF
 y4mnzMdAl/Y8f+SK71vhFBeVqQBzqNm3NMQyFquQJQ7wusmPvLIDIx3PAXMohW2kJY1q
 EP2AdmTwq4C5l7zOy2UwLsrFgoGe0/UDt6zioL9Z2jFse7BKJDTz2RwtGDWWRPF8qVlT
 otNw==
X-Gm-Message-State: AGi0PuZjaeVpzOXVhoa4Rzxd9vkdSy1MbIayFJWQvbzvj/1cg7S0f1DC
 Npq00jhuDveLuCGnxLRkxPAOh8meVLqk8mi7Ve+fvPVEDhKbfettzzSSamE1Fl+0JT7J02jqynB
 S+WGDLYzB4en4W0k=
X-Received: by 2002:adf:ea44:: with SMTP id j4mr32086535wrn.38.1587562359420; 
 Wed, 22 Apr 2020 06:32:39 -0700 (PDT)
X-Received: by 2002:adf:ea44:: with SMTP id j4mr32086518wrn.38.1587562359264; 
 Wed, 22 Apr 2020 06:32:39 -0700 (PDT)
Received: from x1w.redhat.com (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id 19sm7525564wmo.3.2020.04.22.06.32.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2020 06:32:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 9/9] hw/timer/pxa2xx_timer: Add assertion to silent static
 analyzer warning
Date: Wed, 22 Apr 2020 15:31:52 +0200
Message-Id: <20200422133152.16770-10-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200422133152.16770-1-philmd@redhat.com>
References: <20200422133152.16770-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/22 02:57:52
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
 "open list:PXA2XX" <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hD8nUN2365BO

pxa2xx_timer_tick4() takes an opaque pointer, then calls
pxa2xx_timer_update4(), so the static analyzer can not
verify that the 'n < 8':

  425 static void pxa2xx_timer_tick4(void *opaque)
  426 {
  427     PXA2xxTimer4 *t =3D (PXA2xxTimer4 *) opaque;
  428     PXA2xxTimerInfo *i =3D (PXA2xxTimerInfo *) t->tm.info;
  429
  430     pxa2xx_timer_tick(&t->tm);
  433     if (t->control & (1 << 6))
  434         pxa2xx_timer_update4(i, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL)=
, t->tm.num - 4);

  135 static void pxa2xx_timer_update4(void *opaque, uint64_t now_qemu, int=
 n)
  136 {
  137     PXA2xxTimerInfo *s =3D (PXA2xxTimerInfo *) opaque;
  140     static const int counters[8] =3D { 0, 0, 0, 0, 4, 4, 6, 6 };
  142
  143     if (s->tm4[n].control & (1 << 7))
  144         counter =3D n;
  145     else
  146         counter =3D counters[n];

Add an assert() to give the static analyzer a hint, this fixes a
warning reported by Clang static code analyzer:

    CC      hw/timer/pxa2xx_timer.o
  hw/timer/pxa2xx_timer.c:146:17: warning: Assigned value is garbage or und=
efined
          counter =3D counters[n];
                  ^ ~~~~~~~~~~~

Reported-by: Clang Static Analyzer
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/timer/pxa2xx_timer.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/timer/pxa2xx_timer.c b/hw/timer/pxa2xx_timer.c
index cd172cc1e9..944c165889 100644
--- a/hw/timer/pxa2xx_timer.c
+++ b/hw/timer/pxa2xx_timer.c
@@ -140,6 +140,7 @@ static void pxa2xx_timer_update4(void *opaque, uint64_t=
 now_qemu, int n)
     static const int counters[8] =3D { 0, 0, 0, 0, 4, 4, 6, 6 };
     int counter;
=20
+    assert(n < ARRAY_SIZE(counters));
     if (s->tm4[n].control & (1 << 7))
         counter =3D n;
     else
--=20
2.21.1

