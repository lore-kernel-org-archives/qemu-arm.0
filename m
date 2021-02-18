Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp8181836lfc;
        Thu, 18 Feb 2021 06:03:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyNydfrQeZpkegl1cjL/pI1RfbvLACbQ+pwQmAGfU9jpsxhksCNNX3jTq9YHdXdnHRZ5KFh
X-Received: by 2002:a25:8b8b:: with SMTP id j11mr7044797ybl.305.1613657023882;
        Thu, 18 Feb 2021 06:03:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613657023; cv=none;
        d=google.com; s=arc-20160816;
        b=pxr71q2htYaNAJargU9dOOIEb2Dop4CHqsqndrYJA2ELV4Ap/Cf1HeccE5Z9RgycRp
         1U3ziMWHFB1YeVu1g0XOoUwGN2AdJB8a5zyJMTNUhwXniHzcmwTgZXzgJnB946zKzo4o
         yI1POQJln6GJVibTTR9QzpID3W7AoakZssdR8my5jGYdaLThJgc68SALXNdFiEYutHj3
         9zJY0lErFv4NlzmaNN/z1VzmEgzlN1UY7ojsd4mRe5NiBHvquy6/zjnV5Pum6sgy9TQM
         9Gj9exaquKT5TuZ+5ezenqar6HCUJA59oYRBgXjQLHKY5rqlN5vDMwtjYlLXe1Plu3uN
         fcYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=eQoB4JdCWE/58if4YAWhxug8mHFFCdyMbcJG5hlQA4w=;
        b=g7xszn0rJ+cZlY88w8r1KwxkHEKK47FwfB8aAyeMRP/96QFFB5r9/thhJthjGG8X0N
         PsE9YLIkrBXaKirlFO0NVBTGup3HJ1HZd2PsieR698bdj+FOWsBx3CYrTO5T46IBKdxJ
         gsWctXkeKDLQ0X3qdGgJKDCAaR9RVuoCuciTS5i8qXgziy+rBaSE3NSFU/74klUGtKxA
         SqdBGlJQUpr6g8IyY8KPfhLOqgs4ZIJYcNEMMQP1qLP5dIYQheGzIGKANqQ3MqXOIsW1
         5DNewaxoj8eWLoeIiE35B6/nN5wrz3Wqep/vr1/wRBxMiBHthUp+Rg+20YGroxLXs3/z
         1gvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CiZtixdh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d14si5367278ybn.431.2021.02.18.06.03.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Feb 2021 06:03:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CiZtixdh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lCjuA-0001Bv-PQ
	for alex.bennee@linaro.org; Thu, 18 Feb 2021 09:03:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lCjtC-00017y-JO
 for qemu-arm@nongnu.org; Thu, 18 Feb 2021 09:02:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lCjt4-0002hy-B7
 for qemu-arm@nongnu.org; Thu, 18 Feb 2021 09:02:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613656952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=eQoB4JdCWE/58if4YAWhxug8mHFFCdyMbcJG5hlQA4w=;
 b=CiZtixdhx3lPNaipWax7r1PQGbwpkJeG8Y95rnbzzqaOw4YHwwPUOVefKwP2e9mVFxXAvJ
 nyboGz2OksFXCTq/K/QdrkWBrO7LjBpKxe13Adj6ZmcoNpDDr2MpdEmH8pMqaRxSiGe6u2
 rGUZAm/U7GK0SdR5Ap/zrEkB4P/rx7k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-FdSk9Sq6N2OzSxtye8U3Ag-1; Thu, 18 Feb 2021 09:02:30 -0500
X-MC-Unique: FdSk9Sq6N2OzSxtye8U3Ag-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D7AA801979;
 Thu, 18 Feb 2021 14:02:29 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-114-34.ams2.redhat.com [10.36.114.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5EEF25D9C6;
 Thu, 18 Feb 2021 14:02:21 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Subject: [PATCH 0/3] Some SMMUv3 bug fixes
Date: Thu, 18 Feb 2021 15:02:16 +0100
Message-Id: <20210218140219.423983-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: jasowang@redhat.com, jiangkunkun@huawei.com, peterx@redhat.com,
 shameerali.kolothum.thodi@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bpxmCzyrd1eG

Hi,

This series fixes three issues:

- top SID computation overflow when handling SMMU_CMD_CFGI_ALL
- internal IOTLB handling (changes related to range invalidation)
  - smmu_iotlb_inv_iova with asid = -1
  - non power of 2 invalidation range handling.

Best Regards

Eric

This series can be found at:
https://github.com/eauger/qemu/tree/viommu_fixes_for_6


Eric Auger (3):
  hw/arm/smmu-common: Fix smmu_iotlb_inv_iova when asid is not set
  hw/arm/smmuv3: Enforce invalidation on a power of two range
  hw/arm/smmuv3: Fix SMMU_CMD_CFGI_STE_RANGE handling

 hw/arm/smmu-common.c   | 32 ++++++++++++++----------
 hw/arm/smmu-internal.h |  5 ++++
 hw/arm/smmuv3.c        | 56 ++++++++++++++++++++++++++++--------------
 3 files changed, 62 insertions(+), 31 deletions(-)

-- 
2.26.2

