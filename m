Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp2540720lfc;
        Tue, 12 Oct 2021 21:58:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUz29Csg5YIu7mQdUFp2LsfqhpFXB4/SS32qsiLgBB2HNH6YKOwme8pcdUiPBUIEiwZWWv
X-Received: by 2002:a25:ae66:: with SMTP id g38mr31426185ybe.536.1634101120398;
        Tue, 12 Oct 2021 21:58:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634101120; cv=none;
        d=google.com; s=arc-20160816;
        b=n1Usm5emGF0Ges1ilkKm3h7CmEO/YrZpYVUgzyh7KwhKZi+DYxMfXhQjOMpFwW229g
         DR/lhZU6xSroHaA/AYjYfrY2DRaSrZWNkvmS/oIOLWCl5L/7lMBRAZTm+mVg+yZsX+EA
         CG786IAgggsWTJCY8gtnv8JCokIOBzrPBWCJyQXWhiwtSZCOAo0Hqu1bK0Q+SeUpH8eM
         FnxUaDgNhi5ayKW0zrciqYBCEDFrC0Y6l0IVauuHaRPfj05a9c7SeqDXvSXVCoy0ODVJ
         Ux9sYQepu1N3O8qQ/91N++wjq3SNvhXWRDlnFT174DS3dYN3kktQHqhFTgGz9toRQ2Fj
         DHMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=qnSLuY2lflgjwZuZwik2uOYIB3j3gAfJ/I+UIsnpFww=;
        b=tav6zVxhGAMJg7Me5ogL2LePBHthiHL+c1cMbadolSgj0n7B95xBeosh0kjpFOfnU3
         8urhtsxUdVkG2mw1uxKi7kqqyFuPKGrFh62Vk618yMQbqeFR+cBp3y5uQkKekuCw8HY9
         tzFSO6IUEqFg9CJ+++z7yTSwDYpaoXcYofC+6PgLb7Nkl3iEmRwzmGtiVgPET1naM3tc
         drznu1bIj6wNKZKfFbPQxqQ7Fu5h6ZKNd4fJmu1WrdyqhaxXdHAS7uqqHYJ8R4NmLoP4
         HmUQPi33snD0VPYT6KIVjFKNpXzW+3+L1+dO0utmza+CVSaFO+ZMLZ+te6Ka/DXUqUWN
         cI1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IFw1de5D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d126si14863689ybh.22.2021.10.12.21.58.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Oct 2021 21:58:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IFw1de5D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1maWLf-0002NB-QQ
	for alex.bennee@linaro.org; Wed, 13 Oct 2021 00:58:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1maWLU-0002Mn-C2
 for qemu-arm@nongnu.org; Wed, 13 Oct 2021 00:58:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1maWLQ-0004gp-Sq
 for qemu-arm@nongnu.org; Wed, 13 Oct 2021 00:58:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634101104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qnSLuY2lflgjwZuZwik2uOYIB3j3gAfJ/I+UIsnpFww=;
 b=IFw1de5DTNB6fsIddDSDApSr4SoydAVTTZHMwzLz2Tf86hRgOIMjZ6LfyYyfkdKDe19tDw
 AiEA9P9+JRkUcOJDKCSn2QZZMTxpe5xDOPX9AyiRlSTlq2Npk8dFMVqp5zry9voV8dKd24
 O8FWKdR9Vzz/Vb2MeY+EeV+BpUxMjlk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-ZQ3WVVLYPkWNla4e8VxHBQ-1; Wed, 13 Oct 2021 00:58:21 -0400
X-MC-Unique: ZQ3WVVLYPkWNla4e8VxHBQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D24B01006AA3;
 Wed, 13 Oct 2021 04:58:19 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-56.bne.redhat.com [10.64.54.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 104985D9C6;
 Wed, 13 Oct 2021 04:58:13 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v3 0/2] hw/arm/virt: Fix qemu booting failure on device-tree
Date: Wed, 13 Oct 2021 12:58:03 +0800
Message-Id: <20211013045805.192165-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: robh@kernel.org, drjones@redhat.com, ehabkost@redhat.com,
 peter.maydell@linaro.org, qemu-devel@nongnu.org, shan.gavin@gmail.com,
 imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cdFB+7M4geZu

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
distance map matrix should be provided by users so that the empty
NUMA node IDs can be parsed properly.

Changelog
=========
v3:
   * Require users to provide distance map matrix when empty
     NUMA node is included. The default distance map won't
     be generated any more                                        (Igor/Drew)
v2:
   * Amend PATCH[01/02]'s changelog to explain why we needn't
     switch to disable generating the default distance map        (Drew)

Gavin Shan (2):
  numa: Require distance map when empty node exists
  hw/arm/virt: Don't create device-tree node for empty NUMA node

 hw/arm/boot.c         |  4 ++++
 hw/core/machine.c     |  4 ++++
 hw/core/numa.c        | 24 ++++++++++++++++++++++++
 include/sysemu/numa.h |  1 +
 4 files changed, 33 insertions(+)

-- 
2.23.0

