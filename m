Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4045292njc;
        Mon, 26 May 2025 01:05:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUDIX8aHkWrv4/kQwlkDZaIvK0JuuVHRxlsOW9API68gqYD8wHIZtsBtQ8vIdavxkdFUx01IWfi8ZuAdw==@linaro.org
X-Google-Smtp-Source: AGHT+IFsvdEh2wCnTBmyOufgmp/hxFjFFaVphhpxDlsU5n8bF/rUkyzmEvbWO/LNgjs/U1QDf3cn
X-Received: by 2002:a05:6214:f09:b0:6fa:a5bf:2595 with SMTP id 6a1803df08f44-6faa5bf281dmr66477906d6.16.1748246756667;
        Mon, 26 May 2025 01:05:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748246756; cv=none;
        d=google.com; s=arc-20240605;
        b=Or+ESFwv713/Z7SfMl3O7aMRktVjhyxqDzgwlofXsPUAz4LIOJyqvkrZOi9YZIIqky
         7d1aAdao5ZCqyAzYmsoqm3lEnS7lk44SFJxUvM3e01TjuUEyQBhxErQcJNAKaX3mVC1F
         z+CXVoVDsRSyum66RtdA6tl0/rrtQ5MzWYwRgsjiAkRyswvLd8A6e9hvA35pVUtuhFZc
         54vPlUV03FHyqVg2ONtUZF90VQdYuQ0jzaHsEops/1uCiTTc1r4g6GYol+4ALAafXc1W
         GpryY27B/0AC2tzYfJ1rr6N/q52pdfu/J+P/WgaWfZxznIUlML58Xa+FIiNomxel3fVP
         oFWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=U8wbDJ8yda7uj8AxAY9rhQrqaZEU32vlgZE0hXp0yqM=;
        fh=ZD8YHngjvGW9wSgATtRL0aXmwaHxlEe9h4LGKhsxyvk=;
        b=AihJ3mMkMyKN+roBGkXmmdHnsaZLp36Do4IcFoszldc2rfKtIh+mBR3AmBWh3tFpVa
         E7zFnmROPpIaig9Ggp0Fysp4E2Gin+dWbUEvwpVek89ZHgQWF3tclaUdxrcx94uZEYNP
         oD44RfrLR+tocOiczTHFJPTE2XhM57MW2FRxRER+TyLcaP9ydIIQt1YEi+vB11KJmCcf
         gP5S+9K8MBl/fmJy6U3WklXmznjo0bP+f9j+dEKz/TtDXk2cG48Vdzfb/hXjgmz6GbCi
         Bx93bV/W7C+v+ZeMRonLq/ZfOMzE44GAmA8djzyC7yx/9a1qdDe8QP30HTZSdpCf72ZL
         cI/g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=W9Zy5JeX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f8b08a0a69si237292296d6.42.2025.05.26.01.05.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 May 2025 01:05:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=W9Zy5JeX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uJSqF-0004Is-Ja; Mon, 26 May 2025 04:05:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uJSq1-0004GM-1r
 for qemu-arm@nongnu.org; Mon, 26 May 2025 04:05:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uJSpz-0002EL-AO
 for qemu-arm@nongnu.org; Mon, 26 May 2025 04:05:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748246734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U8wbDJ8yda7uj8AxAY9rhQrqaZEU32vlgZE0hXp0yqM=;
 b=W9Zy5JeXrk79zKEZyAWciZcM2VgHgymGOx96FfySJ6vjTapldKHAX5agZ+u50RKK1B28AN
 VQKGmYy8Awf1wePg1VB06vVt11D3A2cplnAM05lM3hva1GgcHL4oHeqazPc4ZWlYhsiDys
 LCYmzwNaSt9Os/cia1194XvzzgyIMiM=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-128-Jbe_LLg6PxmgwDCNaFZ5NQ-1; Mon,
 26 May 2025 04:05:23 -0400
X-MC-Unique: Jbe_LLg6PxmgwDCNaFZ5NQ-1
X-Mimecast-MFC-AGG-ID: Jbe_LLg6PxmgwDCNaFZ5NQ_1748246723
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D50D81945109; Mon, 26 May 2025 08:05:21 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.45.224.49])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 0499A18003FD; Mon, 26 May 2025 08:05:18 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@suse.de>, Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 01/39] tests/qtest/ast2700-smc-test: Fix leak
Date: Mon, 26 May 2025 10:04:34 +0200
Message-ID: <20250526080512.1697528-2-clg@redhat.com>
In-Reply-To: <20250526080512.1697528-1-clg@redhat.com>
References: <20250526080512.1697528-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.904,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: MLJYjma6SrXG

From: Fabiano Rosas <farosas@suse.de>

ASAN spotted a leak of the memory used to hold the tmp_path:

Direct leak of 35 byte(s) in 1 object(s) allocated from:
    #0 0x55e29aa96da9 in malloc ../projects/compiler-rt/lib/asan/asan_malloc_linux.cpp:69:3
    #1 0x7fe0cfb26518 in g_malloc ../glib/gmem.c:106
    #2 0x7fe0cfb4146e in g_strconcat ../glib/gstrfuncs.c:629
    #3 0x7fe0cfb0a78f in g_get_tmp_name ../glib/gfileutils.c:1742
    #4 0x7fe0cfb0b00b in g_file_open_tmp ../glib/gfileutils.c:1802
    #5 0x55e29ab53961 in test_ast2700_evb ../tests/qtest/ast2700-smc-test.c:20:10
    #6 0x55e29ab53803 in main ../tests/qtest/ast2700-smc-test.c:65:5
    #7 0x7fe0cf7bd24c in __libc_start_main ../csu/libc-start.c:308
    #8 0x55e29a9f7759 in _start ../sysdeps/x86_64/start.S:120

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Jamin Lin <jamin_lin@aspeedtech.com>
Message-ID: <20250509175047.26066-1-farosas@suse.de>
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 tests/qtest/ast2700-smc-test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/ast2700-smc-test.c b/tests/qtest/ast2700-smc-test.c
index d1c485630744..62d538d8a3a7 100644
--- a/tests/qtest/ast2700-smc-test.c
+++ b/tests/qtest/ast2700-smc-test.c
@@ -67,5 +67,6 @@ int main(int argc, char **argv)
 
     qtest_quit(ast2700_evb_data.s);
     unlink(ast2700_evb_data.tmp_path);
+    g_free(ast2700_evb_data.tmp_path);
     return ret;
 }
-- 
2.49.0

