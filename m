Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp504413lfr;
        Thu, 15 Apr 2021 06:03:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxaEUI6kFVlJgzax0IWGA1lnoN5w7a8vINe6nIuA9zhVmlVvp7Tv9ZaCLCnR360cZ6vnr3
X-Received: by 2002:a05:6000:1813:: with SMTP id m19mr3458926wrh.122.1618491817773;
        Thu, 15 Apr 2021 06:03:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618491817; cv=none;
        d=google.com; s=arc-20160816;
        b=qE9q5IqaH23SBWaqZYOoJJeNSCHKlLKvb1zfQlRvU0Q27HSHgvTfAdSo7UgqXLI+YX
         9PV75hBm5X2m4bOcrtjZe2mjdcw0kA8f4MCVJ37zCWbnwntfeMba8yip0qrx9aS3XJVx
         cAdGfvxHs/mQOf6uo4AwAG2r819wdfbl9H98J6y4I5Dc83kcGWolcHhGw7HXH4+FjXIa
         oLXbwmDv+utgsfqW2w32GtIhi77GylpIv1dQbD4f3dFX+nYGZllXy0pcOlHGGbpES2Iz
         0cZUyDLdTQ/fMhHRfXPArSK7U75eV0Ta1g60x5e4fQZCj6aYe/JnABoEUDgBbAOmIdHk
         RouQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=UBTlRC9OTcPVKm7FJntznC4sA/TysO3weRQeCkv1c6s=;
        b=Lg6ojzPvIt+1wcaMV9v8irvPN9F2MTecPDvklo6xYadd5Y/YbcY4ocpldsSU5kz3iy
         MlEDJpvQqtNFKSQTP5Be88YtVI3cXEUT4F71d9fU2kQBdtEQpYHM6A/U+5epsEjwmKv2
         pCbuF7DJd0JWWkKxCQhyzUS+qYxYQysnTsk8RcDkDsocos6AVno39+5NqPNpFajzspXG
         J4rAEoCEwDbZEsCKQE7CUcM0Jyzv5C2U3gFExvjRIT0f3N6gLFrcTKtUq2B9ElLp1m1Z
         E4SnIeRqS/z8XEPh8jDCr9qcEUTwLVt7p7azHf25c9ftPE0UMOhMCYA33vpumzYCTCtX
         q41Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LT1FIwfI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j7si2850980wrm.370.2021.04.15.06.03.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Apr 2021 06:03:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LT1FIwfI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lX1ei-0005ec-Pg
	for alex.bennee@linaro.org; Thu, 15 Apr 2021 09:03:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lX1d9-0004zb-08
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 09:01:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lX1d5-0000SH-3q
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 09:01:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618491713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UBTlRC9OTcPVKm7FJntznC4sA/TysO3weRQeCkv1c6s=;
 b=LT1FIwfIh3XWYpSsAt9VOLAJ21GmQtDmQcKjJLlEopq79TKF8sxMH/5yR6FnzTYpd6fn0e
 iJzN9Ud9hOUGoX9X2VuKddASyLtJ2x5TdpZNg1WbDPGRoMCpp/Ou8jonu0QOa8ggYK4z0S
 7i9M0seKSO47RgUCXqjYlmOmL9C3Jko=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-fjfHIxcjMMihJ3XgF7XM3A-1; Thu, 15 Apr 2021 09:01:52 -0400
X-MC-Unique: fjfHIxcjMMihJ3XgF7XM3A-1
Received: by mail-wm1-f69.google.com with SMTP id
 j3-20020a1c55030000b029012e7c06101aso1238409wmb.5
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 06:01:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UBTlRC9OTcPVKm7FJntznC4sA/TysO3weRQeCkv1c6s=;
 b=g38MSwMJR1BwDR5EGuTTG1p0YnDsoxauVm0wzESvP8dxaf2GrsOTGvHTnJR532mmF6
 LeCd5H0aKt9Zxne8MdvftopyOTqZ7yTdwjx0Zwc+MuHfFHnF5dl+hxbOnjHNMFrMlG6P
 tG4v58eQOxeDmb64/WupC4l1hwCKzVtLTXoCz+zot4nv8jcm7xcAypreVp55jLtZcVAS
 3P96bJxmdtfRi+/AM5+FsWkOwVpHZEI9Yi2LupsuC2SXhRWEKgeu9sYugnYJgw+MHkLz
 QIb4OFPgRoOMnYwumQoE39qDpw6ggo50MpSr0dwDeo0VIiQaGsO2NTK8c4tXyZx3Gsq2
 /rCQ==
X-Gm-Message-State: AOAM530pof2KluXKhlMIxg3SKbd076sdx2dOSe82B26Yygz9lGCivPa+
 wJBB/YPK6V0fT6apZIK5qMpZq/CqPFfvUovJyWtnrU8f2Xo8czD7HLaCon3AsjK56ooHR86dKAn
 LJb2xUX8b3Tnx5jfbMcncQURjcW2SUQ0Wyo0UN/yP0JlGSpC/QIxl1DQ/zueMFt9S
X-Received: by 2002:adf:f3c1:: with SMTP id g1mr3456157wrp.344.1618491711007; 
 Thu, 15 Apr 2021 06:01:51 -0700 (PDT)
X-Received: by 2002:adf:f3c1:: with SMTP id g1mr3456129wrp.344.1618491710820; 
 Thu, 15 Apr 2021 06:01:50 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id a4sm2655556wmm.12.2021.04.15.06.01.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 06:01:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] MAINTAINERS: Add qtest/arm-cpu-features.c to ARM TCG CPUs
 section
Date: Thu, 15 Apr 2021 15:01:48 +0200
Message-Id: <20210415130148.4066310-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2H+7mUCZDj2P

We want the ARM maintainers and the qemu-arm@ list to be
notified when this file is modified. Add an entry to the
'ARM TCG CPUs' section in the MAINTAINERS file.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 36055f14c59..d5df4ba7891 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -156,6 +156,7 @@ S: Maintained
 F: target/arm/
 F: tests/tcg/arm/
 F: tests/tcg/aarch64/
+F: tests/qtest/arm-cpu-features.c
 F: hw/arm/
 F: hw/cpu/a*mpcore.c
 F: include/hw/cpu/a*mpcore.h
-- 
2.26.3

