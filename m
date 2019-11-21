Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp3277668lfc;
        Thu, 21 Nov 2019 02:18:17 -0800 (PST)
X-Google-Smtp-Source: APXvYqz1UboFn/pXaT1F03VwSBLYsnDp3+666jn0vfM9Pob2biYixvRaSaFqjHNOdvlZaoaGLDRF
X-Received: by 2002:a0c:9a43:: with SMTP id q3mr7501327qvd.101.1574331497318;
        Thu, 21 Nov 2019 02:18:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574331497; cv=none;
        d=google.com; s=arc-20160816;
        b=vmoZ2nTMrR0VBcnBFsuJMvXEVwcegGj2hACATMlgkk+IzlZU+z7ZU6EXzjBpVMQYwA
         S381SkP5hbb9BwWS4t8RU2KIvBcFNd4aWEJ9RgMQpm+Lk4KjBqunGt1m+hWOV4ArAnna
         TU1x9sjsbRuMAaOXFnmPdCMVWl2nuf8xrQ9vslLkddi4+9m6/ghrzLwofTnZORe4dNCY
         cdYh2gWYcSG51pf1yglgAcu3r1yq0bbr/UhmflsGVE0wZh53civImZB7WqklGeXzMcG9
         EzyZZo/D28t5K+hlqjs8B9jlwSPp5ZmePcWLCqoN3nZq1xjFi5DM0zB/pQ1GIILopkz4
         zB/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=AlBLTUfmNbmfVPJn2njrpT5+GfbBLtiHY4uB+NBxM4I=;
        b=CWdTwEh9Qu4/1ipeXM8P0A8dlTm0s1ofW6zeuK1juARTJQUC0T4kEbCS9DfxOOEeN3
         A2F9qqKf2VdwUID7C3YE1owbIk2PacIjHn/6KNpQSVbbrSRau/Ix6pwVngAKJ9R3sedn
         qch5bfbHz6SEaXJGpELqD/TJvo8+1kY5UhVWxePXhWsQ+kutyYH8ushQv6bUZMope1vl
         sbxPOYYv0IsfKp2cgipdis7TYh4VJhJ060bZz6VGWcElZjqgoTWUNhHjIHCdK9C/Z+jw
         /S8Bb5IT0T5WjedV9wNZNpDo/8AVY0CGQhCvFo2EVzs/011+IuWui6m7W9yLeyvQx5Q2
         r4dA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IE30K6vU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b41si1357749qvh.37.2019.11.21.02.18.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Nov 2019 02:18:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IE30K6vU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iXjXU-0007Gi-Gv
	for alex.bennee@linaro.org; Thu, 21 Nov 2019 05:18:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42251)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1iXjVl-0007Bm-Hn
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 05:16:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1iXjVk-0007Vj-GW
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 05:16:29 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:36197
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1iXjVk-0007V1-CD
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 05:16:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574331387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AlBLTUfmNbmfVPJn2njrpT5+GfbBLtiHY4uB+NBxM4I=;
 b=IE30K6vUqxYEWJIoEm3MxrPJe3ccnw1bl8FunKeEflqcPOV9bdGNpt7a9mEmkAaooUHOrX
 aZ75MA+DoJOcuY05wbr8Z3/TCiEYzXecvlBaxddlvXbHNEHie4LRTZM1GIZ4BYi/UtBUYL
 p4oFV+pmkts41V9om8W8cUmlaPO9kDc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-74-yrZ0f6DNNLe4rc9OJdIPWA-1; Thu, 21 Nov 2019 05:16:24 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04213107ACC4;
 Thu, 21 Nov 2019 10:16:23 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-67.ams2.redhat.com
 [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 89A2452FC5;
 Thu, 21 Nov 2019 10:16:19 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 93FC317536; Thu, 21 Nov 2019 11:16:18 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/3] display: xlnx_dp: Provide sufficient bytes for silent
 audio channel
Date: Thu, 21 Nov 2019 11:16:17 +0100
Message-Id: <20191121101618.29289-3-kraxel@redhat.com>
In-Reply-To: <20191121101618.29289-1-kraxel@redhat.com>
References: <20191121101618.29289-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: yrZ0f6DNNLe4rc9OJdIPWA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dsLtAvJKB0+G

From: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>

Fill the audio channel with required number of bytes to cover the
elapsed time. This prevents rate control reset, and avoids debug prints
like below

log:
=09Resetting rate control (65692 samples)
=09...
=09Resetting rate control (65721 samples)
=09...

Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 1573833408-2388-1-git-send-email-sai.pavan.boddu@xilinx.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/xlnx_dp.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
index fde3b21ea5f4..705844379794 100644
--- a/hw/display/xlnx_dp.c
+++ b/hw/display/xlnx_dp.c
@@ -394,13 +394,18 @@ static void xlnx_dp_audio_callback(void *opaque, int =
avail)
             written =3D AUD_write(s->amixer_output_stream,
                                 &s->out_buffer[s->data_ptr], s->byte_left)=
;
         } else {
+             int len_to_copy;
             /*
              * There is nothing to play.. We don't have any data! Fill the
              * buffer with zero's and send it.
              */
             written =3D 0;
-            memset(s->out_buffer, 0, 1024);
-            AUD_write(s->amixer_output_stream, s->out_buffer, 1024);
+            while (avail) {
+                len_to_copy =3D MIN(AUD_CHBUF_MAX_DEPTH, avail);
+                memset(s->out_buffer, 0, len_to_copy);
+                avail -=3D AUD_write(s->amixer_output_stream, s->out_buffe=
r,
+                                   len_to_copy);
+            }
         }
     } else {
         written =3D AUD_write(s->amixer_output_stream,
--=20
2.18.1

