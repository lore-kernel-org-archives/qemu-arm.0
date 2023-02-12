Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp3883482ejb;
        Sun, 12 Feb 2023 12:50:45 -0800 (PST)
X-Google-Smtp-Source: AK7set83KJEl7oIyslWos1yuIFMlG5nsqBzilddNgCDjsxSrW8Ot+vYlPrDOiiEnprjCf7/erIpn
X-Received: by 2002:ac8:5cca:0:b0:3ab:ceb9:10fd with SMTP id s10-20020ac85cca000000b003abceb910fdmr39994948qta.25.1676235044959;
        Sun, 12 Feb 2023 12:50:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676235044; cv=none;
        d=google.com; s=arc-20160816;
        b=nRasl44Iy0JmCokR5cKxCzBa6cBCmSHmM8yzhUzVwTShgHNH6N6ucJ4mwWr/Q6BBSz
         Ffigd7aN5mhngZBMNRp3lI1EtVWJ2inN/pSKcG09oGzC/oTWwwBgbmECjaHtXLdtCm/R
         SA1bPDQI8zK5z+wc/3DIEpZf2q7q+s6wcCcd6FsnSzmIUpdigtNUmk202eFKiZ9M2XFe
         7yEsbd9eEff2m0mttr3lyYLwZ9bmoffWQu6D/jmj4nSYhC/RHVAWTTRmnSFLSPzbDb6y
         gSAegiUo+TRofPnTQr2VKygZ7xqVFX5FOZIIsKFnVs2aK34B/oiokrc8mKllPaktC/sX
         meNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8kckJW6NrYERj2YRX4n2tekh9JIbkIXzts4lGY/hhGI=;
        b=dJ9ctlXcNjLwjz+60psW8f1I72L/ONHC/DaL/x4RQH2RaLRoNUTR70Pdl9r/FQkzz8
         1BmW/g2bY/m07PsnN4LH0r2WtD94HAIK+kjyQ/QRFR62BORbs1XzmWsoJsv+dPHa9Yq1
         5YnbXFphkiBTLePIjYbVz1zhvGZDaqsKKl3XcZN1RQUcunJOz8Zo9wULKwSk/GvPTyae
         0hweO/95jvQgarN9ELadrBV8v0qcWR/M/it+lU73Nt/Mp2dwGyVM7BViO0i7ImoGUZCK
         IWS3zc3lfJuS+abhbupDJXwYNV7AoPNLjOa0irFTdiswMYe1awhL0RJislog4KETTeSn
         3lsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gKR6X03y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m14-20020ac85b0e000000b003b856c85a75si8080450qtw.203.2023.02.12.12.50.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Feb 2023 12:50:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gKR6X03y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pRJJ1-0004zr-WE; Sun, 12 Feb 2023 15:50:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pRJIM-0004Qo-MZ
 for qemu-arm@nongnu.org; Sun, 12 Feb 2023 15:50:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pRJIL-0001w8-Dl
 for qemu-arm@nongnu.org; Sun, 12 Feb 2023 15:49:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676234996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8kckJW6NrYERj2YRX4n2tekh9JIbkIXzts4lGY/hhGI=;
 b=gKR6X03yGkvvrn6gWWa0HkbECUn9WHHFXISyhVbG824An4O3u8Eb2MX4yia4jGUg0znTH2
 jmzqgICWAtc/5/X5pva9Uv+3O7oOvFySmnNvcIam7E8ppRjUVGx9B+REMq7efBXOVKoLH4
 DTYdkg/EwmGMaou9FJFniqFDpbWekJA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-210-NRwRLrDyM9q4UeJoDGdNtw-1; Sun, 12 Feb 2023 15:49:53 -0500
X-MC-Unique: NRwRLrDyM9q4UeJoDGdNtw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 79A53380673B;
 Sun, 12 Feb 2023 20:49:51 +0000 (UTC)
Received: from localhost (unknown [10.39.208.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 93B8C492B04;
 Sun, 12 Feb 2023 20:49:50 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 1/4] tests: use closesocket()
Date: Mon, 13 Feb 2023 00:49:39 +0400
Message-Id: <20230212204942.1905959-2-marcandre.lureau@redhat.com>
In-Reply-To: <20230212204942.1905959-1-marcandre.lureau@redhat.com>
References: <20230212204942.1905959-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: xNjHh+ym94la

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Because they are actually sockets...

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 tests/unit/socket-helpers.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/unit/socket-helpers.c b/tests/unit/socket-helpers.c
index eecadf3a3c..914b3aa0cf 100644
--- a/tests/unit/socket-helpers.c
+++ b/tests/unit/socket-helpers.c
@@ -117,13 +117,13 @@ static int socket_can_bind_connect(const char *hostname, int family)
 
  cleanup:
     if (afd != -1) {
-        close(afd);
+        closesocket(afd);
     }
     if (cfd != -1) {
-        close(cfd);
+        closesocket(cfd);
     }
     if (lfd != -1) {
-        close(lfd);
+        closesocket(lfd);
     }
     if (res) {
         freeaddrinfo(res);
-- 
2.39.1

