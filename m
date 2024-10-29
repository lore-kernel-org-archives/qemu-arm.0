Received: by 2002:a17:504:82cc:b0:1be9:327d:8ee3 with SMTP id m12csp109197njj;
        Tue, 29 Oct 2024 02:25:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXGsJxQ2qUI6nanIr5+ye3zIurN3CNsGI/KBWbuVVfvcDxpHamTAcISO5NIjdWqLPHnOWkxqK65bUV1Hw==@linaro.org
X-Google-Smtp-Source: AGHT+IFHYboyEIr3ZU0ssQZlwXumxKMiZ8aetQRChsVmpnBfhbuGKT7PP49uEoV60oSAMrEtGeBf
X-Received: by 2002:a05:622a:1210:b0:461:66fa:b797 with SMTP id d75a77b69052e-46166fac255mr21146581cf.31.1730193932065;
        Tue, 29 Oct 2024 02:25:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730193932; cv=none;
        d=google.com; s=arc-20240605;
        b=PXSK4qiVn1QtKAmNvc/vb8PJtQypb5pC5Iy1S33RZ5iMdGX4rP9VF3S380pQpgdFdU
         TuPUE8GhGmLKwusyl7V2zbA9F9sEU0FGRRV7HrYG/L1tmrjZvOzLtxxVcg2DnJbcvLi8
         f0JkvctwyhI3cGebu9noxBdyfgMheP2Nbh5dU5/oHQ+PKUXam0XLTSsT+R3rSXs3uxqH
         wfri4pa81Sbm6GktaorSjpx5T9GGW5Vq7BqkRfSJI+ioxVoCSxgw+z2Y7IgIk5ueNEPG
         MFaw4pr18IPSM3RlGL+8WdvOyxpGv9ojb8kibG1hIO+7T4m4Xmf7pg0jOjiFyd/Uw0Fg
         8sGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=pDqm5tGJHLI99NCJhRksDoPlTzxjaCsSqC+s9KVgds8=;
        fh=sLwJpr9zFNPMTVqghFofPq456L0wMmw/gsLoh5/5P6o=;
        b=CusMJCa2gX+xj3+CKIURSMAR746FE3dEnHoazA3D6hCYAvPGZUcKKTLuysC+M/1t8g
         fl+oXVeI8fhXubQLpg7CPuru3+2/JQyPSb+rXunzlO3pmfbQNS8KeedHSk3uy0L/qjwO
         VRkLg03EJyBOl2ti5gE3vD29OhVS+SR3pd+RszWAIcv7FM0SythicxiSfQcR0sNIEyaU
         JnJTTcq/f04A8C1EkKrJ34EC5rUv4QjtSe2CZQzoMLHvdX/yZlObaPnX4slwE4hSEsHP
         YjDY+y7BDTABDOoB7HnZuboWdxYWoiK31bZ8n7bTLI/9v1mgsnFEbT+n0kPaEPK1hPob
         K94Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N1ROIMVN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4613235de57si100523021cf.372.2024.10.29.02.25.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Oct 2024 02:25:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N1ROIMVN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t5iTP-0007Up-F8; Tue, 29 Oct 2024 05:25:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1t5iTF-0007UV-Ar
 for qemu-devel@nongnu.org; Tue, 29 Oct 2024 05:25:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1t5iTD-00041u-Jv
 for qemu-devel@nongnu.org; Tue, 29 Oct 2024 05:25:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1730193897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=pDqm5tGJHLI99NCJhRksDoPlTzxjaCsSqC+s9KVgds8=;
 b=N1ROIMVNykxVlwkL0W2u9RGRP8yyrjkdByVoTIbhymF0NiEBUT7grC5psUZyl1s4ru1IVM
 nUOMYzp/Ufw/iHKHQ1az0KYtZuDF4Mgt9WoimF6Owap8eYH9fIA+0x8PFjHj2eZ4bdrDhg
 Fuhpa1Ek3izFA+fJS/Y5pNvwLO+gG3s=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-60-oLQzv7XfMcu8y0K0TE0Jkw-1; Tue,
 29 Oct 2024 05:24:50 -0400
X-MC-Unique: oLQzv7XfMcu8y0K0TE0Jkw-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 01D171955EA5; Tue, 29 Oct 2024 09:24:47 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.192.191])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id CB61719560AA; Tue, 29 Oct 2024 09:24:42 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Joel Stanley <joel@jms.id.au>
Subject: [PATCH 0/2] Convert the BananaPi and OrangePi Avacodo tests
Date: Tue, 29 Oct 2024 10:24:38 +0100
Message-ID: <20241029092440.25021-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: cZmPunm0TAxm

Some of the URLs in the Avocado tests stopped working since the
original assets have been removed from the servers or moved location,
see:

 https://lore.kernel.org/qemu-devel/CACPK8Xc=jsz5iT_WR7s-rcu1cRzryiK+-0o=6vUK_D_qMMrP3A@mail.gmail.com/

Since we are currently in progress of converting the Avocado tests
to the new functional framework, this is a good opportunity to convert
these tests and adjust the URLs (and hashsums) along the way to make
these tests work again.

Thomas Huth (2):
  tests/functional: Convert BananaPi tests to the functional framework
  tests/functional: Convert the OrangePi tests to the functional
    framework

 MAINTAINERS                           |   1 +
 tests/avocado/boot_linux_console.py   | 411 --------------------------
 tests/functional/meson.build          |   4 +
 tests/functional/qemu_test/utils.py   |  21 ++
 tests/functional/test_arm_bpim2u.py   | 206 +++++++++++++
 tests/functional/test_arm_orangepi.py | 270 +++++++++++++++++
 6 files changed, 502 insertions(+), 411 deletions(-)
 create mode 100755 tests/functional/test_arm_bpim2u.py
 create mode 100755 tests/functional/test_arm_orangepi.py

-- 
2.47.0

