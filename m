Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2646068ejb;
        Mon, 20 Feb 2023 13:51:19 -0800 (PST)
X-Google-Smtp-Source: AK7set/ZCnAvYYyCKDJ6PONhJEA+KdSLgUf2SKx4HQrp8AGFP7PiTE0wFDZv5LPGZNS0+0joSgAt
X-Received: by 2002:a05:622a:1348:b0:3b8:2dac:b5e1 with SMTP id w8-20020a05622a134800b003b82dacb5e1mr2378410qtk.37.1676929879583;
        Mon, 20 Feb 2023 13:51:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676929879; cv=none;
        d=google.com; s=arc-20160816;
        b=ZP/VxCferRKYOpXTE59M3m5aih5TxcoBIRXXBfISbosK1U3FxsZHU0hAx+y0oU1WVD
         hUJ79AHD11JfuzsgiCMgLyGI1NQdlplHr5EeIJ5fBxsAkK3GFVNEE5Vbgfef4/6VHMrB
         g9czCHHUBJyAoHAmeb4COGQpY9y0xes/4+BLpZFY3B67fLaA3BQ3klwXRga7sWzIk2mg
         c6XokoHIsJw5O73+QNvtE3fXNmb58qNmc/IoCMbE5yXjOiq64RoCZ3riN6p9ZH+Dllfv
         Xha7PIexXxeqEsqCjFw7SKzFp1fnN6Vqv83Z8FJ9BvNzF/X66I+iBrwByrHovMrhgY+p
         Okfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1G1S/PVHl5irg4XwiYXHVjXzxapom3TbmLZaO3CHDHE=;
        b=h2SVczrlP6+fnQrl4x+nD+Rf7Cpao/Usan0hOCQ5a6F7oT807sIKBsx9PiQO71WWy5
         p9dFYS5GzU1M8xGdiL7lUPFh/v4dUDlntskE/iOVvuIOCCw0TCa7bInESfsZ7FPNZ2F5
         O+wtgvpOigbMfBlaDQEazywywQpI5cj78fA3A4u5sQLsowV4oufR98MXJfsakmSpWADH
         DNQ53pYHlZr0tSL4d4dUhNyLu6riMxkajsgko9zfOtOP2P1gmMVyLBVR4vXFCX6H4HGe
         Di032j8dDytb4INhdUb1yeg9CzP2lOrf2etgUofpjaFwR36OiMPgGEKYmsdKibt3efLx
         4Shw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TxYGjNqa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f62-20020a37d241000000b00738d7b3a1cfsi9455392qkj.111.2023.02.20.13.51.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 13:51:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TxYGjNqa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUE37-0003wt-51; Mon, 20 Feb 2023 16:50:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pUE2y-0003lF-CM
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 16:50:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pUE2w-0008EY-A6
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 16:50:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676929805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1G1S/PVHl5irg4XwiYXHVjXzxapom3TbmLZaO3CHDHE=;
 b=TxYGjNqaEHbpVHb2bO8HdRXA3Ep0rflbNMYYm3UrT1jyBo68Sxp9PaEKTsBLJSQsL7KJXV
 WcvcLGr4c7IOhNeH97s7YVX5pbQoR2xTaUJC4kg9C9cRINKcohRTfMoUTcboVHF9tmejF2
 J6NKAtQGZvvKSsemwBiARUyHtmkFV7o=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-387-jee_rDl4PEq_oIc6oyJfzw-1; Mon, 20 Feb 2023 16:50:02 -0500
X-MC-Unique: jee_rDl4PEq_oIc6oyJfzw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A76793810B09;
 Mon, 20 Feb 2023 21:50:01 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2301B492B04;
 Mon, 20 Feb 2023 21:49:59 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Joel Stanley <joel@jms.id.au>, Jason Wang <jasowang@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Stefan Weil <sw@weilnetz.de>, Fam Zheng <fam@euphon.net>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2 14/15] os-posix: remove useless ioctlsocket() define
Date: Tue, 21 Feb 2023 01:48:58 +0400
Message-Id: <20230220214859.3792171-15-marcandre.lureau@redhat.com>
In-Reply-To: <20230220214859.3792171-1-marcandre.lureau@redhat.com>
References: <20230220214859.3792171-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124;
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
X-TUID: C2ebEPvhWAoa

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The API is specific to win32.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/sysemu/os-posix.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/sysemu/os-posix.h b/include/sysemu/os-posix.h
index 58de7c994d..378213fc86 100644
--- a/include/sysemu/os-posix.h
+++ b/include/sysemu/os-posix.h
@@ -52,7 +52,6 @@ void os_setup_post(void);
 int os_mlock(void);
 
 #define closesocket(s) close(s)
-#define ioctlsocket(s, r, v) ioctl(s, r, v)
 
 int os_set_daemonize(bool d);
 bool is_daemonized(void);
-- 
2.39.1

