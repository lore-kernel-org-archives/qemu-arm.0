Received: by 2002:a17:906:2484:b0:98d:b2f5:1316 with SMTP id e4csp8097ejb;
        Tue, 25 Jul 2023 11:04:36 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFYGnm6MTxmAcuck7fX3v4XY1SC9Rbd5D++xa9FsaKOoFgsJuCw6lXDKn6CThzMMYFeaexC
X-Received: by 2002:a05:6808:1719:b0:3a3:53a0:9d2 with SMTP id bc25-20020a056808171900b003a353a009d2mr15966550oib.28.1690308276328;
        Tue, 25 Jul 2023 11:04:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690308276; cv=none;
        d=google.com; s=arc-20160816;
        b=UJX1ZJBUZvLGiiPkMvw7lGwKOgsMIEm5GmGaBGYi2xZZnbnhwiFzdcFG+A4y64yIoR
         RmW9l6HRkT8DJZnBV9tNzqdktoT5Lp7FbIRYo4JdeaaW7KHwHiz1rK32a5mMONypKQSF
         hLPihNzWq28em0JVNoGWneSDaI32hffCAkux/1Br4cs1hwAy/CJoOzVjWwYZtiNeH2UX
         6eHHDBvN9HuGtZfUItbrcePG+lmsuUskBaM3V8z0SLZ9A2KSmoMRB+cWDFaZ+V+6Nt/L
         yHXKH1+djUVF40sTfo8A8bsgO6pWwAAMpLXlVA9d3MzImsq7ridbrL+8wZcLhlWtR4IT
         /v6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=73xGUTo0c+CFrR+eQPfzhiurmcItqlpOVDJXDCWMDfY=;
        fh=VIjqXItD7ovqYEXpyxuqPkaQsOkVw6zkSP5vf471ryI=;
        b=c01G8SoIXzX5etfnb1C9wEO9CNSf8dJDa6HoUtg1M9rS2Djehc+VZODq5UlfN0ZgH3
         YR0+BoxsTpB7xhZMcQbPrER5t4U4KuBkqrI2yltfbF383GWwgAAnj0uL6fSyUqQLK+oa
         VkHsu6QdSQDCZ8K9MorN+iVsAA14d2TxULbZI/Rzm+9GwscS4P/XRXV6DSdgyMnbdGMR
         pT+zvonRkpVufinFlaj3COGLw/cYVKuZB6ZSIcQ8NpmPpwj3jYmbW+9nTklgceM2ivNB
         uDMO/oaezxgv7E4tlE4KZ2VhvMyf4Du9AMQMnxKyft/MMjR0wafVQg4E2ZUFcgPQEopK
         4Mpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MLBJUu8g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x22-20020a0cb216000000b0063020a21b9csi6867278qvd.271.2023.07.25.11.04.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jul 2023 11:04:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MLBJUu8g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qOMNy-0002i2-AC; Tue, 25 Jul 2023 14:03:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1qOMNw-0002gS-SY
 for qemu-arm@nongnu.org; Tue, 25 Jul 2023 14:03:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1qOMNt-00013Y-R8
 for qemu-arm@nongnu.org; Tue, 25 Jul 2023 14:03:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690308225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=73xGUTo0c+CFrR+eQPfzhiurmcItqlpOVDJXDCWMDfY=;
 b=MLBJUu8gRmevEFsGBri6fVn79tB4PxrYTrgySLZUHJ3iGxMVppQotJrkEHa757M0zebVn4
 3ynr0kDNwBGF4QOkdM1qLbNRaZNKYLSTuzc7aaKrcLI83tzFXVZ7H2RH3vlcx+RWRT9NAo
 TMBmzcryZisFrqd5DRawKlBDBii09KU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-249-26lMDEY0MN2ChhVuVYL3LQ-1; Tue, 25 Jul 2023 14:03:40 -0400
X-MC-Unique: 26lMDEY0MN2ChhVuVYL3LQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 24290856F66;
 Tue, 25 Jul 2023 18:03:40 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.8.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 825BC1454153;
 Tue, 25 Jul 2023 18:03:39 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Hanna Reitz <hreitz@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, John Snow <jsnow@redhat.com>
Subject: [PATCH v2 2/6] python/machine: close sock_pair in cleanup path
Date: Tue, 25 Jul 2023 14:03:33 -0400
Message-ID: <20230725180337.2937292-3-jsnow@redhat.com>
In-Reply-To: <20230725180337.2937292-1-jsnow@redhat.com>
References: <20230725180337.2937292-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: jYkgDbdGM5rk

If everything has gone smoothly, we'll already have closed the socket we
gave to the child during post_launch. The other half of the pair that we
gave to the QMP connection should, likewise, be definitively closed by
now.

However, in the cleanup path, it's possible we've created the socketpair
but flubbed the launch and need to clean up resources. These resources
*would* be handled by the garbage collector, but that can happen at
unpredictable times. Nicer to just clean them up synchronously on the
exit path, here.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine/machine.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index 8be0f684fe..26f0fb8a81 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -395,6 +395,11 @@ def _post_shutdown(self) -> None:
         finally:
             assert self._qmp_connection is None
 
+        if self._sock_pair:
+            self._sock_pair[0].close()
+            self._sock_pair[1].close()
+            self._sock_pair = None
+
         self._close_qemu_log_file()
 
         self._load_io_log()
-- 
2.41.0

