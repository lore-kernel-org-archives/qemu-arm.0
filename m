Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1009777ejb;
        Thu, 19 Oct 2023 23:10:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFt4X6xSEKT0Uov5wICVJTZG5eJkEXWFLIZE9sJM7hr+ex6Klh8URo8apYNyxzbFXCsSEHa
X-Received: by 2002:a1f:1d51:0:b0:495:cac2:253b with SMTP id d78-20020a1f1d51000000b00495cac2253bmr753066vkd.0.1697782237911;
        Thu, 19 Oct 2023 23:10:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697782237; cv=none;
        d=google.com; s=arc-20160816;
        b=Kvqm+Gr5QB3Eo2vKs2hLycK6ULuWT7x2lLueVuGEtymKemj9A7GzGxtUOU+3X+3lYK
         qcOPI62rDi84v9Xwq8rvmHKiIknMShVLSZXHBWELc0hhSU0MZ5G4mNj4cBjQMh5XiIFR
         +l61iGCq7jRtzzIOUEHMS4HkUHT9C8mjOGbYMXScrR4+MATutXR9c/9zWZ6hczyZjBsf
         KXPLLcRjyDLkBaA2EtbBHF1FAtFvqtkx71DLyNYKKdS3AlUlRKdvATODalkSTspqqdJF
         2q7P7i7SKJ25bG9FNAZHEdq5K81+MQeYpLMtbYPcW94dooYZao1vji6d3FsRqKQyHJ/r
         ngHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4u5rPdgoe0Maggzyn3Vyfu1+xNnhSdwZrDSW9swMIyM=;
        fh=X3JeOFj4ztx2Lx+Yzj58ZbPbimbM/VvtLuGPbdfaUEg=;
        b=RdaE5xIe0QFAhZD97759hnkH5Izb03CMsnYocSZ4XZ5+fqYJeORszhaas96r78D19H
         zfdEU8J9XlGY/dgWapULW2C37CUQj1B1iDxF3NGFJjw4YXVld66CDczbwP4jyVP2XxMS
         F5R7vSHqTshF1z9asiRRremhZ8BQCZNT/ergc9qb4CnNm7IeRMyh9Vb0PI1TL0FJ/1Qo
         k7fY0RurhjMm9gk6GtdoDH/6Wcgm6C/r4lqBz9wVYsiTBbP3T87N89tmdZdZAiGfOwEs
         rUnTeE3E7nICwo6Y1u8Q35aubcAQijqKQlH/fGq3hax7vt4usFcv9N9z0IZmC8oA18mb
         cPrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=C1+nOinK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w16-20020ac857d0000000b0041817f7086asi796059qta.452.2023.10.19.23.10.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 23:10:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=C1+nOinK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtihm-0003l0-Vv; Fri, 20 Oct 2023 02:09:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qtihl-0003jw-D9
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 02:09:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qtihk-0003uO-1I
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 02:09:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697782191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4u5rPdgoe0Maggzyn3Vyfu1+xNnhSdwZrDSW9swMIyM=;
 b=C1+nOinKsl668qv/oXx3V+fKhGQ/vgn8Prf7wvsT5mZ/ATmnI07n0enGHgDBuf3DgvnEHP
 vlvFko2tPUB6v1fbnzKM0REmG6Qdum8zPbekcGhtN5Tp/iHwfTM7tC1yzKonLSIu0kTPAB
 vu/L0/M5o9PKMrEXV3MkOW95p/UPG2M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-346-q3gUOMPDPzSJDpfIGzAT7w-1; Fri, 20 Oct 2023 02:09:43 -0400
X-MC-Unique: q3gUOMPDPzSJDpfIGzAT7w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D023857D0C;
 Fri, 20 Oct 2023 06:09:43 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.192.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A66E40C6F7B;
 Fri, 20 Oct 2023 06:09:42 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 4/4] MAINTAINERS: Extend the Stellaris section
Date: Fri, 20 Oct 2023 08:09:36 +0200
Message-ID: <20231020060936.524988-5-thuth@redhat.com>
In-Reply-To: <20231020060936.524988-1-thuth@redhat.com>
References: <20231020060936.524988-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: yHyd1TuSRhBv

This header include/hw/timer/stellaris-gptm.h obviously belongs to the
Stellaris machines, so let's add it to the corresponding section.

And hw/display/ssd0303.c and hw/display/ssd0323.c are only used
by hw/arm/stellaris.c, so add them to the corresponding section
in the MAINTAINERS file, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4a7339130e..a110a0c7a4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -991,7 +991,9 @@ M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/*/stellaris*
+F: hw/display/ssd03*
 F: include/hw/input/gamepad.h
+F: include/hw/timer/stellaris-gptm.h
 F: docs/system/arm/stellaris.rst
 
 STM32VLDISCOVERY
-- 
2.41.0

