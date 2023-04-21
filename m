Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp1064524ejm;
        Fri, 21 Apr 2023 04:04:35 -0700 (PDT)
X-Google-Smtp-Source: AKy350YxTTQe1dQzXyPqSnFZyJZb73F/fOlvsdousksDYpJcJsvG4Z9hZbDnNitKYeuoNfu8q04l
X-Received: by 2002:a05:622a:594:b0:3e3:882d:4b47 with SMTP id c20-20020a05622a059400b003e3882d4b47mr6482489qtb.26.1682075075014;
        Fri, 21 Apr 2023 04:04:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682075074; cv=none;
        d=google.com; s=arc-20160816;
        b=os0WhAHOx5+od6sCdyGq9jX5IBLdCNZ+/Wj5x8LWSL9l8SjzmfI+nev9wp8tezZSc9
         cwWbPMGNXhPPb29DpvdzD+clEyl0JJdBPGPBYYjBr1V2G/KyZ67hOc2XN3LFCGmhv8jQ
         Rlw7DQHpKbGNjROC86iqsnbO6n5wBxiFvT+sgqsdnFdVkS0XMVt44dwYmOxAKsbGZv5d
         MRirt0NDy8Ubs8YAZDBRaHh1NzRYBTeBsI6AJTjQb1x/xoUXyJK454izRHmXEnj7dYDY
         M2OM8ycNnwC+1VN1q40EbMW5et77QDxCgUYcUiPzZzxiMxhpfQxRydoPbyB5iN5jtlmW
         K9Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=k8GSMAcAtfIgVplRQ8BE8CkGy5MZ+ee90Z3OpPfv63w=;
        b=KH6kfH8ysKq0zKpjyFZOPtMzkYclSd9wfDn69Q5wegvcn6Xh5Rf+B6toHVRpcL3eIi
         bXvVM4XpZZ/w8+JdZsnqpUt7EKgCgtYx6iejFAR9UJI4qhpm/MD6sSR37DXtpi1SEHEJ
         KPvhpobKqSNfNaaRDu5RVHaY5MPHEBHnLGew50GC5BXsmpnFyJdjmWmHvM77cfuO6j6z
         bvq7XU57RWlsGiRwykJXRGBnP7kybOgK2/v51bgUY8DsMCUXYsoUSfF496K0byOOZrYr
         APAGTGVsjiQ35uapk37C0mM47eyHoidVp+CqYBVLX7U79kr91JuWoWBnVbqB3FcNz65/
         9+oA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CE7nGOll;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q12-20020a37430c000000b0074df8a4a65dsi2584597qka.639.2023.04.21.04.04.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Apr 2023 04:04:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CE7nGOll;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ppoYe-0002gc-QJ; Fri, 21 Apr 2023 07:04:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppoYc-0002fX-SP
 for qemu-arm@nongnu.org; Fri, 21 Apr 2023 07:04:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppoYb-0002I1-HZ
 for qemu-arm@nongnu.org; Fri, 21 Apr 2023 07:04:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682075041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k8GSMAcAtfIgVplRQ8BE8CkGy5MZ+ee90Z3OpPfv63w=;
 b=CE7nGOllnxYcFkQ7fjRBRV0bPWWZfim3xAL08v5yiyg8aR+X7UTmtYOpD9/JPxjACh1qcL
 wXh0WLwA/8C2l9el/V0Ix2zPz9CWHC2nQZREmD2tCL8IsxaWrW2qy8zJglmRxmgipNgsXD
 r6mp54rNXSM8IPzyP+ehlTlVXiJlMZ4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-402-TpJ3npceMtOGyEuY8nLYQQ-1; Fri, 21 Apr 2023 07:03:55 -0400
X-MC-Unique: TpJ3npceMtOGyEuY8nLYQQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B1B229AA2EA;
 Fri, 21 Apr 2023 11:03:55 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B30E6140EBF4;
 Fri, 21 Apr 2023 11:03:53 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org
Subject: [PATCH 3/3] MAINTAINERS: Cover tests/avocado/machine_aspeed.py
Date: Fri, 21 Apr 2023 13:03:45 +0200
Message-Id: <20230421110345.1294131-4-thuth@redhat.com>
In-Reply-To: <20230421110345.1294131-1-thuth@redhat.com>
References: <20230421110345.1294131-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: uEcYSv5pdQBy

tests/avocado/machine_aspeed.py should belong to the ASPEED section
in the maintainers file. Improve the wildcards here a little bit,
so that it is covered, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2c2068ea5c..6d8bf42d13 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1111,7 +1111,7 @@ F: include/hw/misc/pca9552*.h
 F: hw/net/ftgmac100.c
 F: include/hw/net/ftgmac100.h
 F: docs/system/arm/aspeed.rst
-F: tests/qtest/*aspeed*
+F: tests/*/*aspeed*
 F: hw/arm/fby35.c
 
 NRF51
-- 
2.31.1

