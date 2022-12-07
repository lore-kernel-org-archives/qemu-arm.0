Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp493429ejx;
        Wed, 7 Dec 2022 05:37:49 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7iQ+xkpCzzQWL4TbMwUKOEPRzQNBD4RfMd+cG74PdGYiQmDabcqJl/+Nru1rcxctKoe82g
X-Received: by 2002:a05:6214:5504:b0:4c6:9399:9335 with SMTP id mb4-20020a056214550400b004c693999335mr76665387qvb.12.1670420269321;
        Wed, 07 Dec 2022 05:37:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670420269; cv=none;
        d=google.com; s=arc-20160816;
        b=Rzry2S+Y7vEuDcWgoc/YS2ihTGcxGOdIdpLINH/AnXwsU+zypg0+sOURwRudqqZ41F
         Arf1oF+vamIiR2yJT99RAFE1TgTUnYfhgwddwAUk8ZZ7+9KlvgWibA7CjwwgT4HdFAWS
         bXkW8cBfkaKH+E6pnoKyh7rzCno+xm2n/iQLy4Xi+/HpfZQhLTRXiVmQFiWCG/1N2RtN
         +M1Rs7ClDnNxnxjen0ooTTvaQDb12LHWqgHQRx6L8cjK8kFDTEnpTTAp0kRTpzmsz6ZY
         8toW9oNPa/csgAfNgOezrwO4k4wyBKeQAqditKSh9vEyLdiwlVkZvtMzumXMKiZKgpZp
         mCAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=2U1bxkG5vZ1DxwO17TfCBOTH9pqliPNUEvobAjKM57U=;
        b=lUPSPjjmAZNvZZZl2kvapWYZ6ST8D0iHBEBtI34kptq6cLqwtF0RMmg5/JyrSQr31H
         uBoPO0fyyO/WOrtI1BG9QsRv5HQZEFb785FkimBpiMA6Tes0doHwp1qOdwzST+pOlaOo
         eGb7ng+WVBzhRA4roRtn1TVzVBtSCJXeHK0zwXRX3FARBbBWXUtlxnkiurNk0CEtPP68
         X5CWx0NmGdCO1CVelmMGuE8rbtE8h7tZyEYxAvAFYhq16DtkSO8GngnUHU0swwgQCN3p
         JH2VCZ8D0bGC62h/09O2YeHCndw9gsFGfRpgBqepZU+uRXthUI6v3Or6yLott4l49W7l
         pzEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Q2IsICcP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bq13-20020a05620a468d00b006fc9e8d0cccsi10676609qkb.279.2022.12.07.05.37.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Dec 2022 05:37:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Q2IsICcP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p2ubq-0002F0-M4; Wed, 07 Dec 2022 08:37:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1p2ubk-0002CO-0p
 for qemu-arm@nongnu.org; Wed, 07 Dec 2022 08:37:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1p2ube-0006RL-R2
 for qemu-arm@nongnu.org; Wed, 07 Dec 2022 08:37:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670420221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=2U1bxkG5vZ1DxwO17TfCBOTH9pqliPNUEvobAjKM57U=;
 b=Q2IsICcPGqB9T3UaKcrQOXV26Qnl7+g79h/e1Uk+6ywp7haLzbscHxcH5pDPlulZC9UCld
 p9XCSmqYA766hGadTpANncu5dU0KWrl8L/zzJTOThxIjAw68eR19mRSVd5bty8uVc3jJMV
 hkLtssfDKuuTfEmZOG0SIqZ8u2bZbUk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-606-BSpz7N_rM-SfQTr91EMFNA-1; Wed, 07 Dec 2022 08:36:58 -0500
X-MC-Unique: BSpz7N_rM-SfQTr91EMFNA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6A634185A7A9;
 Wed,  7 Dec 2022 13:36:58 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.86])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 82C5423177;
 Wed,  7 Dec 2022 13:36:56 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, mst@redhat.com,
 peterx@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 jean-philippe@linaro.org, bharat.bhushan@nxp.com,
 alex.williamson@redhat.com
Subject: [PATCH for 8.0 0/2] virtio-iommu: Fix Replay
Date: Wed,  7 Dec 2022 14:36:44 +0100
Message-Id: <20221207133646.635760-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: WtnX0H4/PEzF

When assigning VFIO devices protected by a virtio-iommu we need to replay
the mappings when adding a new IOMMU MR and when attaching a device to
a domain. While we do a "remap" we currently fail to first unmap the
existing IOVA mapping and just map the new one. With some device/group
topology this can lead to errors in VFIO when trying to DMA_MAP IOVA
ranges onto existing ones.

Eric Auger (2):
  virtio-iommu: Add unmap on virtio_iommu_remap()
  virtio-iommu: Fix replay on device attach

 hw/virtio/virtio-iommu.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

-- 
2.37.3

