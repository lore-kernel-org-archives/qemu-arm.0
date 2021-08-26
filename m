Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp854763lfb;
        Thu, 26 Aug 2021 11:18:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy56WvtGqBZHHOdQrKeH8BNTDxHMWRY+8HxNuNnTm86zai/pnY0haqSrBcQ7h4eiAfp+w/z
X-Received: by 2002:a37:e307:: with SMTP id y7mr5108954qki.211.1630001893294;
        Thu, 26 Aug 2021 11:18:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630001893; cv=none;
        d=google.com; s=arc-20160816;
        b=lmTS7krwu9Tjv//fJgSeDE2bArqeY9UMyBaGDlu2VPHbg7O3105upFSkFe1t8qG28T
         XloLulB/L1xP9DwlyBkRifaeJ372L/xG1xtQ/LEhTVi5iHITJRrnLgrG5/nL40umaJKT
         Gw6tvzYbk31HYEN3ruwvWxuvKpjjJkEefqIREWdyqgKt61svFSC9pzVULHLFXVOZMQ0N
         TbAgZ4lFSdGxOOtcXLX6YkJG3SUY4xOkx/LT2aByUfT68K7kdSnNiTMNhKD554/dZ9ir
         bF5+svtypZFDI9xxsSgHRshrxxJl4Ev8xwTp7eZKjbAUG/HcrluFBDdU+u8YgclLFFGZ
         /UZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=33VXL4U1qbRTuU/5QwhrCQZylW9kwLggVtsgtFcLNRc=;
        b=CgC/ZyDRJpCTNV+VmrtDHNBXV2tF3x3tVIqcvw97VBHnuBMveBKPHozIwUwCX9+845
         LTljV33AP9aJCiZ2s2HuoUJ6urBSSuGZSeF3dZvvWpB/vb2jiJk7qlpoeTS2dNk6y1XG
         RbUAMmpp3mH8xDyBiCtFCYBEbXAZZxCCn0vlm+2sXkGarTvn5NYROWkp4WpOzQmQj9cV
         WhwhU06lYAy0bXgrEHQoWU1LBw3bF549wbaYwfQ0ETYboLal/znYv5oEbvCwOwy3Pm4b
         k0gwJewYq7eWD/aE/pjsX5x8N9F8OCuf5L5nOH6X4C+vkzOfLxAk2uWkLhco+7VAHZZY
         0OYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="aNG7y/6y";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y29si1278211vsi.341.2021.08.26.11.18.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Aug 2021 11:18:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="aNG7y/6y";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mJJx6-0000PZ-MR
	for alex.bennee@linaro.org; Thu, 26 Aug 2021 14:18:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJJmT-00037g-OM
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 14:07:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJJmP-0000LH-On
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 14:07:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630001228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=33VXL4U1qbRTuU/5QwhrCQZylW9kwLggVtsgtFcLNRc=;
 b=aNG7y/6yDsXrmqo+vPS8gUsjBz9njfugjnPcCUIwet0E+cPQlIrZeZHEVP/Plnzz8mzIcj
 N7DIMnCISjL+gS4KYsPhcmb/TYTK2rVP1S2r6y6DDRGGZ1hoMnn3TH1MIeYNWaiTIPX3uw
 b6LtRE1TqzIAhJnFHP/KEgkzXd27STA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-nIHb-Dj7NbaAl4T41Pd5Qw-1; Thu, 26 Aug 2021 14:07:07 -0400
X-MC-Unique: nIHb-Dj7NbaAl4T41Pd5Qw-1
Received: by mail-wm1-f72.google.com with SMTP id
 c2-20020a7bc8420000b0290238db573ab7so4657903wml.5
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 11:07:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GB0xfRVEKlq5JbrRPqkV0PavmfY69/bsAfF6w8cRM50=;
 b=fqb91djuuJI4OeymD9cvNQBiN/dT5L0hGLBw29uTcVmojBZ2DTs4at0iwnWCIYXuy2
 wzTiG4f0Wqb5RLv/HEIE+Yu2wD3Or7V+9wdx0U2j4VZUiIU+QL45qOPuU9ab7exkYM+D
 IACXKZxUx2KMBD4OAWf6v9vdJvArVnQNRuPzvU1Jj8nmfa3cWdTKgJ5LqUy8PVlGr2ms
 MertcY+zrvtS2wB1aTFyQ+H+mfQaTmoMSzvD1YoPKbzoq3w9OUT3/kHf/KjL/lZ1Vsxd
 v7YzETIi4/N5HHRFmDx8UKeVAmDApx3QzdZih0Ztev4CNaaSjmgiW31VyrCm0xqGXbJc
 uTTg==
X-Gm-Message-State: AOAM5321+2eJS4zd2oemf2lEu3NTnMaLQZjLyQlLzolgG/JjmF0peV2I
 yY1oJrYnPsyB+yHePkq7eN3Ry0VjOCroq+g5tCH9V3zGSWHKv6zTM/l8cZyR1KElHJthKZvmmSr
 eK2JTM+cbnZ0AkAFeDzNZsCGpZ3SC7272sDzKI1yunL8Na5cbPtSdkD9kxHGFdiKd
X-Received: by 2002:a05:600c:2215:: with SMTP id
 z21mr10035291wml.47.1630001225822; 
 Thu, 26 Aug 2021 11:07:05 -0700 (PDT)
X-Received: by 2002:a05:600c:2215:: with SMTP id
 z21mr10035275wml.47.1630001225644; 
 Thu, 26 Aug 2021 11:07:05 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 j17sm3803394wrh.67.2021.08.26.11.07.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 11:07:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] hw/intc/arm_gicv3: Replace mis-used MEMTX_* constants by
 booleans
Date: Thu, 26 Aug 2021 20:07:02 +0200
Message-Id: <20210826180704.2131949-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9B8zTQ+OpesQ

Minor cleanups on the GICv3 distributor common accessors to=0D
have the overall codebase better use the MEMTX_* constants.=0D
=0D
No logical code change intended.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  hw/intc/arm_gicv3_dist: Rename 64-bit accessors with 'q' suffix=0D
  hw/intc/arm_gicv3: Replace mis-used MEMTX_* constants by booleans=0D
=0D
 hw/intc/arm_gicv3_dist.c | 205 +++++++++++++++++++++------------------=0D
 1 file changed, 108 insertions(+), 97 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D

