Received: by 2002:a0c:cd0f:0:0:0:0:0 with SMTP id b15csp2727198qvm;
        Mon, 20 Jan 2020 02:37:07 -0800 (PST)
X-Google-Smtp-Source: APXvYqx7iyovwZ0IWU4J1ZYXyvcrfLfE59Y3VjG7yXpm/BkRaw5oaim+pBEveFYFFTVb1kd+P976
X-Received: by 2002:ac8:7097:: with SMTP id y23mr20041561qto.114.1579516627686;
        Mon, 20 Jan 2020 02:37:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579516627; cv=none;
        d=google.com; s=arc-20160816;
        b=p55xP2CxmaiCbs5xfQaF24OrF/LU66fFzJF9BgUQjfy1Um9FBRM7LHJw5AVcKZsnai
         D/0Ty44HteSQGF6C4UkjI4CnUt3fvIG6pR802Co/LHxm8YTXAg1myq/9A+f4ZDIKb3t1
         Sh+f8oYtr82k7MTsGbSA+7vy+jlS8MfSZqJ/WewyISAvNJQUS/rFhZzAB20Lj+uhUNE9
         Eny4ZfXhSOqJJXGEhVC9LNTNtmk2VGOZowTrlFBShvEC9CO1xbKv0fK6Hk4iP1Dgcz2s
         xjOAMdBR/SstitjQFvKlt+Ue2sdq7zlWRDzEwNTsGv4suaV/o76Oab2HHwBkIJQmj2MM
         9xmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=c7WNsWxyp42yO9QERGARx6XOOlE/u8t3t0eSsw+Cvvk=;
        b=SCNScDjauIC18bMWUF4WWjG8/HNA/06wu95JmdWFf91dTtyhV2dOtOHCSCmplIYoe4
         1Lach9jx7nPlmHNplg6L6uKAMSeR804FyUOCVaQZgV1X5CJPAnP04sA5yXPXlCOsMH9r
         i+qgp9H7wY7uqqTYN/V+glCM1UNvVJtiUJgTOojJhFArLObq1VDZBa7VT2MM/AGwWFrf
         cSlt2lChSpTuJZFIFOle95DUbhlwMxB82SOxUPjtyPx0FtUn3g04XhLd40fJJESc0J1I
         HfZGQK6+Mer9g0xonWJ3AAjIAbMr8Hb4n3y4HHXGIxBjAeveZk15e878C4JPX/cEMLf1
         aSAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AMTRJw8K;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v3si20518646qkc.268.2020.01.20.02.37.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jan 2020 02:37:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AMTRJw8K;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1itUQc-0006Rg-QB
	for alex.bennee@linaro.org; Mon, 20 Jan 2020 05:37:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36961)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1itUNd-0003g1-LO
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 05:34:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1itUNb-0001HV-AN
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 05:34:01 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:55378
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1itUNb-0001H8-6V
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 05:33:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579516438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c7WNsWxyp42yO9QERGARx6XOOlE/u8t3t0eSsw+Cvvk=;
 b=AMTRJw8KRrO7KltBCUIXn9WEIe+d9Ghy3U7hFqDE8A1IpaMjSMy1jrDzNTiIVvFvjOCucg
 N5Hk6oBa85DzE2GG4tGFoAjcbbPD/+sP4gTEc73eTeQqt5fsVAB+CO2oJcqa61kSE6UzPD
 qzUutsLVldHcSC08SN4Q7j5caYZTfWo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-TPmqE7IWOduu1zZXx8QFCg-1; Mon, 20 Jan 2020 05:33:57 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B8A218A8C80;
 Mon, 20 Jan 2020 10:33:55 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 23AB71BC6D;
 Mon, 20 Jan 2020 10:33:50 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/29] multifd: Initialize local variable
Date: Mon, 20 Jan 2020 11:33:12 +0100
Message-Id: <20200120103340.25118-2-quintela@redhat.com>
In-Reply-To: <20200120103340.25118-1-quintela@redhat.com>
References: <20200120103340.25118-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: TPmqE7IWOduu1zZXx8QFCg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: Laurent Vivier <lvivier@redhat.com>, Corey Minyard <cminyard@mvista.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: q7lT/e6OZh4t

Fill everything with zero, so the padding fields are also initialized.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
---
 migration/ram.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/ram.c b/migration/ram.c
index 96feb4062c..b9147bcca3 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -703,7 +703,7 @@ typedef struct {
=20
 static int multifd_send_initial_packet(MultiFDSendParams *p, Error **errp)
 {
-    MultiFDInit_t msg;
+    MultiFDInit_t msg =3D {};
     int ret;
=20
     msg.magic =3D cpu_to_be32(MULTIFD_MAGIC);
--=20
2.24.1

