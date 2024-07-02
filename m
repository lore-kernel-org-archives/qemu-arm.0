Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1802947njm;
        Tue, 2 Jul 2024 01:01:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCURPDgK5Cc1B9sZc1Sf19kh2j/7uQq257Mzgq4qKk0vF0yalvxZ6oncpirdzgGADc9Okvp7/CyqHso3m4Qa3Ir3PS7rKeEa
X-Google-Smtp-Source: AGHT+IEtPCuy9r8vs80NIN4n7/ARrNvRZbNALcLDU7L1JynwOJf6ffuodTW+631gWD0+9qQyAr/J
X-Received: by 2002:a05:622a:13d3:b0:446:82d6:93ad with SMTP id d75a77b69052e-44682d695c7mr16539311cf.35.1719907305929;
        Tue, 02 Jul 2024 01:01:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719907305; cv=none;
        d=google.com; s=arc-20160816;
        b=GgPLEEK1ohrpaJ/4Dg+9iIuswkGiMVnQbCjSzhAxg+NY5Zfsv88vBpXskkVpi/V6hM
         WgXWEV2LU/h7ibXvsLiPetTTfvBZhIr5t22rN2+tsym5PXl6m8I18pisJ6ImS5gt010U
         vs618Dd2e96k+8fMoymFifnACjvvIk/jMPon8nGHv72lzGvHXL/e56sZMxot41PihcyZ
         5Q3sT9ZkIhaG1ta58ULQHd+j8R5PnQ1rIYAshqXzj+jPtnjcVtjFlibsx4ZbUYY/wsF2
         59Nb+pWAefVddNgHjrshpaN+Ac5Nsc/fehaE82iUIItAmGraeOdQuhWiJeMTEOb+92T5
         niOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=dpz55RukxWF/oU5g3DqWQvn2hOPVYOn+hFtppDfqFXo=;
        fh=//RUmME8FDhHHOy0et2Cqja/I65gKN6UBnwN7MzepaQ=;
        b=OgEIpld8F7H1iQnxWyLo89eabjKFL70yUv2LPuQl5TRBKBvsxETcAXb6mzohKj9xKd
         JKxrxKAdWucigTkzY12L7jiZNZhKbJR8owNphufoVBQAfxRQqydBnBeaKuquJFofgMOT
         x+uweltVfBGHsHeBmg/PYxhVONtXFaGBalieHyrduxOITf8V/lLrNHP8ctCyAqmDkZDA
         JL06naxTdW1exdlXXkbK/J9LAJus2LmCuOjUZeB5yxfnH4yK3CJiNfJb684p31ElqoOZ
         QylG2cT1Rrd7Se/MqkcwjEDNnvxsaEDL+bgC02gA24xSs27zvwewyvqqNcxJw6s5zkjY
         SgbQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VTPtTN75;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-446512cc9c2si96734331cf.149.2024.07.02.01.01.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jul 2024 01:01:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VTPtTN75;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sOYRe-0006Jz-Te; Tue, 02 Jul 2024 04:00:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sOYRd-0006Jl-Bp
 for qemu-devel@nongnu.org; Tue, 02 Jul 2024 04:00:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sOYRa-0005OK-97
 for qemu-devel@nongnu.org; Tue, 02 Jul 2024 04:00:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719907252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dpz55RukxWF/oU5g3DqWQvn2hOPVYOn+hFtppDfqFXo=;
 b=VTPtTN756v8xhVwnJdHzjBbxv2WIL6KRMP5gYj+sjzQo5BwKb/zRzxdmyP/qV3RdWZ28iP
 Wx6zIJZl2W13EqVRJRxDoysKmDup63PNvnwR2InqgJ+SJhO1o9pzv/H6tTXzb47EHZOkoo
 ZWaz9TZaNc9KhXy5cfRmRtU+ZUpf0Wg=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-656-UWU5FdcVNPK9VC_yBluCqA-1; Tue,
 02 Jul 2024 04:00:51 -0400
X-MC-Unique: UWU5FdcVNPK9VC_yBluCqA-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 1FD20194511F; Tue,  2 Jul 2024 08:00:50 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.90])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 7B2871955D92; Tue,  2 Jul 2024 08:00:48 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 0/6] aspeed queue
Date: Tue,  2 Jul 2024 10:00:36 +0200
Message-ID: <20240702080042.464220-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
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
X-TUID: Q0uNmRdm+oAH

The following changes since commit c80a339587fe4148292c260716482dd2f86d4476:

  Merge tag 'pull-target-arm-20240701' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2024-07-01 10:41:45 -0700)

are available in the Git repository at:

  https://github.com/legoater/qemu/ tags/pull-aspeed-20240702

for you to fetch changes up to 5b0961f7ad6790f473623703834351b6e43fbaa6:

  hw/net:ftgmac100: fix coding style (2024-07-02 07:53:53 +0200)

----------------------------------------------------------------
aspeed queue:

* Coverity fixes
* Deprecation of tacoma-bmc machine
* Buffer overflow fix in GPIO model
* Minor cleanup

----------------------------------------------------------------
Cédric Le Goater (2):
      aspeed: Deprecate the tacoma-bmc machine
      aspeed/sdmc: Check RAM size value at realize time

Jamin Lin (3):
      aspeed/soc: Fix possible divide by zero
      aspeed/sdmc: Remove extra R_MAIN_STATUS case
      hw/net:ftgmac100: fix coding style

Zheyu Ma (1):
      hw/gpio/aspeed: Add reg_table_count to AspeedGPIOClass

 docs/about/deprecated.rst     |  8 ++++++++
 include/hw/gpio/aspeed_gpio.h |  1 +
 hw/arm/aspeed.c               |  2 ++
 hw/arm/aspeed_ast27x0.c       |  2 ++
 hw/gpio/aspeed_gpio.c         | 17 +++++++++++++++++
 hw/misc/aspeed_sdmc.c         |  7 ++++++-
 hw/net/ftgmac100.c            | 12 ++++++++----
 7 files changed, 44 insertions(+), 5 deletions(-)

