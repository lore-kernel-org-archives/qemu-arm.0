Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp145306lfp;
        Wed, 6 Oct 2021 03:23:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7K4WhcLrtfWzvpV1IA/OkhhYmHQnbOrafEWECdpADirOauvDMr+Db4l288WXzFlJy+xiR
X-Received: by 2002:a25:cbc8:: with SMTP id b191mr27817967ybg.1.1633515791083;
        Wed, 06 Oct 2021 03:23:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633515791; cv=none;
        d=google.com; s=arc-20160816;
        b=mxSoj/tztq/ob8doZmYO1tw3zZcyHVHX+HE2IzfSM6XmCW2Ot3GMsKTSX7ByJZMeO8
         c8yWd8cf7S6ixF6duEZCoh5Nz8ntCjWljbXHqLdmqzvL1+ui2igK8DWpP+ylCZIGsQxz
         0QEqg5M2CVCxBwNhQD/Gh0eXwL4Ba5Gb9dPXC6lV25/7o69daN09B/BdWetSQI9VHHTX
         lOZiAO0hFek4lWUn3PGsrWlXZM3LNRJhI/rau6ywttUH7t7pnc2LZVrSGzW4mVoLkWUv
         upFop/CmzE0JjyEwXyuoXIzQAS/3S/Any3wcmCExY6SZgl3aFfq3HLT5QCVC9XJi+mCq
         aqtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=B0vBSGChmHKe1wOo+CVL00T3EAY7zH420jEmbQDXdO8=;
        b=GdDdI/JXfDdVNdKUCtMNyPRZ9y754Nze3xTVUUNJ4dfGXvHbkC+D8jFTjElKwCtAyv
         k5iOVpX0NHvrYtWkWdaGDAYcrQwROQRa5c+WvIxFl7560O81ozMv9aRLm30mu84/7gC0
         OqeWzNA3izIHfTNXly8N/T75++m6mYveWGRNGtDwOnZ+O+n41XTc1B+J/e4KJAqUIrVI
         WJuLvN6Aw2NAAoe7g5oGiMtjbNw8u8Zb4Wc4SqaiC+cW7Roi/UbeoAX123ZnAaD5+tVd
         NYpIn56qNTU34uPNURx92jL60sL5Q1dWFujYUavABtchHUtUWIYtQwar0seacaf4NKL0
         f9Dg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fQxLdvRO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s13si14608077ybk.102.2021.10.06.03.23.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Oct 2021 03:23:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fQxLdvRO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mY44s-0004JI-Dg
	for alex.bennee@linaro.org; Wed, 06 Oct 2021 06:23:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1mY44k-0004J9-JD
 for qemu-arm@nongnu.org; Wed, 06 Oct 2021 06:23:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1mY44f-00040A-Kh
 for qemu-arm@nongnu.org; Wed, 06 Oct 2021 06:23:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633515775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=B0vBSGChmHKe1wOo+CVL00T3EAY7zH420jEmbQDXdO8=;
 b=fQxLdvROBVTjCpQYSxIKN+EUx2SLbunnAE+CchStgTogTk6G/HojDfpY7jqSosV09HyVAY
 wG80gnKvzVTV6jn0UsSfqk7RZ3KdelccFjUCXOSjceoE+o8BiIhwl8a4DTjy1oaDauE3Le
 9MqkSqajRU5KHIt4JkB1AGDcQszlsiE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-WuqxfxX9Pty9DKZVUbdEcg-1; Wed, 06 Oct 2021 06:22:52 -0400
X-MC-Unique: WuqxfxX9Pty9DKZVUbdEcg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5114810247BB;
 Wed,  6 Oct 2021 10:22:51 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-56.bne.redhat.com [10.64.54.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D35795F4E7;
 Wed,  6 Oct 2021 10:22:44 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH 0/2] hw/arm/virt: Fix qemu booting failure on device-tree
Date: Wed,  6 Oct 2021 18:22:07 +0800
Message-Id: <20211006102209.6989-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) DKIMWL_WL_HIGH=-0.066, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, marcel.apfelbaum@gmail.com,
 qemu-devel@nongnu.org, shan.gavin@gmail.com, ehabkost@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5s97PbfqaqEx

The empty NUMA nodes, where no memory resides, are allowed on ARM64 virt
platform. However, QEMU fails to boot because the device-tree can't be
populated due to the conflicting device-tree node names of these empty
NUMA nodes. For example, QEMU fails to boot and the following error
message reported when below command line is used.

  /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64 \
  -accel kvm -machine virt,gic-version=host               \
  -cpu host -smp 4,sockets=2,cores=2,threads=1            \
  -m 1024M,slots=16,maxmem=64G                            \
  -object memory-backend-ram,id=mem0,size=512M            \
  -object memory-backend-ram,id=mem1,size=512M            \
  -numa node,nodeid=0,cpus=0-1,memdev=mem0                \
  -numa node,nodeid=1,cpus=2-3,memdev=mem1                \
  -numa node,nodeid=2                                     \
  -numa node,nodeid=3                                     \
    :
  qemu-system-aarch64: FDT: Failed to create subnode /memory@80000000: FDT_ERR_EXISTS

The lastest device-tree specification doesn't indicate how the device-tree
nodes should be populated for these empty NUMA nodes. The proposed way
to handle this is documented in linux kernel. The linux kernel patches
have been acknoledged and merged to upstream pretty soon.
  
  https://lkml.org/lkml/2021/9/27/31

This series follows the suggestion, which is included in linux kernel
patches, to resolve the QEMU boot failure issue: The corresponding
device-tree nodes aren't created for the empty NUMA nodes, but their
NUMA IDs and distance map matrix should be included in the distance-map
device-tree node.

Gavin Shan (2):
  numa: Set default distance map if needed
  hw/arm/virt: Don't create device-tree node for empty NUMA node

 hw/arm/boot.c  |  4 ++++
 hw/core/numa.c | 13 +++++++++++--
 2 files changed, 15 insertions(+), 2 deletions(-)

-- 
2.23.0

