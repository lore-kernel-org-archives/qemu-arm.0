Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1009785ejb;
        Thu, 19 Oct 2023 23:10:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpe0DbvZ7PW05QkOAQEvoW90j5uNvfQURuxK1efeDxLPeSRYebmyNOf1UDxC5emYIcDtCw
X-Received: by 2002:a05:620a:3887:b0:775:95c0:af5b with SMTP id qp7-20020a05620a388700b0077595c0af5bmr850190qkn.73.1697782238620;
        Thu, 19 Oct 2023 23:10:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697782238; cv=none;
        d=google.com; s=arc-20160816;
        b=vHU8NXZwPKhfZDJ1lZtKOQlBVzpawIHWsPlNcqvMoSL6jQv1Z6bwJ8CYEYd3cs1UOi
         BimDSfsnGuS4yLl5VoMdLFsZ2dzUIww4ovO7gsMRllqQMolKD0D1MDoyBtr1pt6Z9hO+
         oHN/ve7YQbecCyhR6o4cf4WikqH+Xu4b+NsiS2Gilr0mEZ1UMq8BGR2FX7WrQSOEKqGk
         OTBUpzKVaPifByk03rmFmauJKCccpOMC4tj88tD2WjhYxomc6udSXK4rOLnSBVSvf66a
         G4lUrSunbozJDDGT/l0cf1zHdWdSdCYliIK7EfjY+cQ/0vdeJqUvvLkh9CFaX5vCASGo
         EQwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=2ZdGX6g5mzYaBicF2Vri7W1knqjlSMFtG8HJ/ovYaHQ=;
        fh=X3JeOFj4ztx2Lx+Yzj58ZbPbimbM/VvtLuGPbdfaUEg=;
        b=bXfB885OJl5Y6Tqsj4ePDLfyy4/1gp6zV1/XOF7mBu1vJtny0cY6vaxHdJOEH3vUXF
         AoLnfoBDFeJWH5i1BNiLvTafunc3HBfXs4mJsYvlSFMbDOx/PklVafWn1QlmTgk+pY+Y
         nZRZeFquVlB3QU6hD9zt9wbUV2n0rYLbB4ImAXJYUv/YmoZfIdlAq02CdU1I/1PHK9Z8
         JmVtQhoQWg2H9hluXB00otnvOHg1cjzlFDTKa4TOrQMn0JQjsknagHB6scH3o/Gp6L8a
         eTP10+hTBG6lMLrzUNLpG4A4VfIXkntd7M9J+AEnHUq7DuobJvi9zpnu1245U2jWKq2C
         dLJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IqiLSBHY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g11-20020a05620a40cb00b00775a64a819bsi855217qko.132.2023.10.19.23.10.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 23:10:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IqiLSBHY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qtihg-0003VI-MP; Fri, 20 Oct 2023 02:09:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qtihf-0003RR-3j
 for qemu-devel@nongnu.org; Fri, 20 Oct 2023 02:09:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qtihc-0003hk-Pz
 for qemu-devel@nongnu.org; Fri, 20 Oct 2023 02:09:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697782184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2ZdGX6g5mzYaBicF2Vri7W1knqjlSMFtG8HJ/ovYaHQ=;
 b=IqiLSBHYq91lWQ2ZYz0vOmGruO/CVUnaHqup7RlXO+PFuWaPSnzvP29HPAmhscFoV0QKtv
 cWop/lkCx8cvKeo/AMlnTQVLLnwLSS6Iex3OqyGkJGvILW/8syud4ju0pLTZGrnQVCTlSb
 /4YEqW8Y/Q3V/WZBJTZNVRvlWoNmc4U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-483-B--wm3tgMFSU8HQYSSpPsw-1; Fri, 20 Oct 2023 02:09:42 -0400
X-MC-Unique: B--wm3tgMFSU8HQYSSpPsw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC58B10119E1;
 Fri, 20 Oct 2023 06:09:41 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.192.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C11740C6F7B;
 Fri, 20 Oct 2023 06:09:40 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/4] MAINTAINERS: Add hw/display/sii9022.c to the Versatile
 Express section
Date: Fri, 20 Oct 2023 08:09:35 +0200
Message-ID: <20231020060936.524988-4-thuth@redhat.com>
In-Reply-To: <20231020060936.524988-1-thuth@redhat.com>
References: <20231020060936.524988-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: jFaR3qYxN7uL

This graphics adapter is only used by the Versatile Express machine,
so add it to the corresonding section in MAINTAINERS.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 34f9036df8..4a7339130e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1006,6 +1006,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/arm/vexpress.c
+F: hw/display/sii9022.c
 F: docs/system/arm/vexpress.rst
 
 Versatile PB
-- 
2.41.0

