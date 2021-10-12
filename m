Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp1484843lfc;
        Mon, 11 Oct 2021 23:36:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSHDUSIGGVa7WTa7Tu8IdX9w3lGFK/2GzHU3XKZ5mQR3Q6RlLO8wB+F+bHvgk1tIpzqeho
X-Received: by 2002:ac8:7458:: with SMTP id h24mr20384909qtr.355.1634020617778;
        Mon, 11 Oct 2021 23:36:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634020617; cv=none;
        d=google.com; s=arc-20160816;
        b=yXFwSxZsWNRznLrWRJw3N+VfFcybNj8fkFK7JvUZAQX0rzZ6MYljyW/bexDNDJLihd
         whMJvLVdkz4PCRMMc0i1A4eWPwBhbNFD5CQ+l7600XRanQdqfmlsU5ohBEzuCKa9zkWa
         3T75k+ehBvA8Cc/hLEeTqhuOXutxtrhbDwLL63l/NqiErb2UVZILbiPn14g6ekxXsskq
         QRygMcDML7BmdETT3iQOyXXAbRWjRL/zO0qm8COmGyAZdU0LiHHFreOoFRAzuPJ6owp9
         Xj7abPVH7UVUFeqXMWGo2Elq8F/EiNf66BXwEuN48qpG4rBPdAAJghqYEM5kuLBx3+g3
         QJNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=xRtFjr5yM8iXF/vmuH13uvAvq28duefBPf8si63UWm0=;
        b=J/76e4GL9g2gOwN8PDQBkEc4a0nmPoSlnQeOz+mtmduebLHUdq3ARcNqXnF3+qzgNc
         w6IPIlWe2zfwfBlXWrYVZOqwQIvpUYE+NZFZC9I5JxpUDfs1S8dTLcaDgcGUgV1WFEva
         oMMVfNZrwxNVa9E+lrC3OPYqOWcDMfFnA9HHB4h2hJvrTNyQZagyDy0jYEnlx3rQ+wmT
         4c/kHJ+zQZphESMj1AOTJWDPAaaWK3NKOxk8PTTjivQnplgqse6D91JUUakaGIFN8e75
         1//ONrc6t3el6lo1zM5V1JtZxz0FVBVi2EXb7Nyt5pExkcHcUiWk/3ne58qw+LBohpXH
         FCQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=DD2gp4NI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e15si9427310qvd.125.2021.10.11.23.36.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Oct 2021 23:36:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=DD2gp4NI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1maBPF-0003Qg-3c
	for alex.bennee@linaro.org; Tue, 12 Oct 2021 02:36:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1maBOj-0003QP-MS
 for qemu-arm@nongnu.org; Tue, 12 Oct 2021 02:36:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1maBOg-0007Xy-Rl
 for qemu-arm@nongnu.org; Tue, 12 Oct 2021 02:36:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634020580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xRtFjr5yM8iXF/vmuH13uvAvq28duefBPf8si63UWm0=;
 b=DD2gp4NImSIE0IluF9dRWRzEKL47te3hjuQWwpRbTRVvqS9lBTKvme2L4ubEHIcNE/5ilW
 r/Ql37zZlw6M2ZIfnax8Q1/et5RxpAIhEBVwphZ9fCjnbZoUyK7IC7AAuQ35xd8SOrpRww
 68rS1RI9xfF5c0WFWjpfUUuocuLervA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-KDB05qdbNruYlUwKx0CBLw-1; Tue, 12 Oct 2021 02:36:17 -0400
X-MC-Unique: KDB05qdbNruYlUwKx0CBLw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1D351808308;
 Tue, 12 Oct 2021 06:36:15 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-56.bne.redhat.com [10.64.54.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 84CE419C79;
 Tue, 12 Oct 2021 06:36:12 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v2 0/2] hw/arm/virt: Fix qemu booting failure on device-tree
Date: Tue, 12 Oct 2021 14:36:01 +0800
Message-Id: <20211012063603.166255-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: d/E4/7bQ0Gaz

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

Changelog
=========
v2:
   * Amend PATCH[01/02]'s changelog to explain why we needn't
     switch to disable generating the default distance map        (Drew)

Gavin Shan (2):
  numa: Set default distance map if needed
  hw/arm/virt: Don't create device-tree node for empty NUMA node

 hw/arm/boot.c  |  4 ++++
 hw/core/numa.c | 13 +++++++++++--
 2 files changed, 15 insertions(+), 2 deletions(-)

-- 
2.23.0

