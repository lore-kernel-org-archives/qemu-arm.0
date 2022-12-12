Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp3418379ejb;
        Mon, 12 Dec 2022 07:22:18 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6kkZC+ZFEykylhQnc2+KKgd/f4Fq6gqHSrW1QO60VtXVrdf+/loefaXO1gBEjsjI60yxk7
X-Received: by 2002:a0c:e549:0:b0:4c6:ed83:9f7b with SMTP id n9-20020a0ce549000000b004c6ed839f7bmr25932684qvm.30.1670858537953;
        Mon, 12 Dec 2022 07:22:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670858537; cv=none;
        d=google.com; s=arc-20160816;
        b=Hxl/Zg6AfTaU3YqqxVFpdH7i/SAL8K8DeD47kOy3n1oqiN8rg5AdtltWFLKnvaeERb
         TEPeeCVRxCSvOEKuuE8+LlW9EbntgYMkI9uksR2xbZ34LdZPiurmqs9+ygYamNdUbnJx
         Z+fwfD1KZyFWuOsfsTS3BUKhdnp/nPPrMkJsFr74OsjXap8GWGuU6bPP3fUFDFVz2PJo
         4HixYHOk7JmRpKliQLec2x79wo8qQW5Q5K262+xNPbyvTGW0bIFsQvlQWU+B1QcuRz+9
         xYIAIjEkEJwrLG9bAyKETtG7k7XwXERjyyr7EipM9UoClfoGEROiU9LFb6u/fmTxgF1W
         OBQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=leoGlx7hdgS+89JgiqQkBMFvCZUEpErYcAE/remdook=;
        b=Y3ZpVxW13Wc/wvKQZYcvPPFntsOtymyDvCjDo4TqlxKL8bOZdr9u2wNSi3QQaAVaeM
         HtK+HDB4UtwJS+EKA1FSSA8Ni6mtimMx3Q6Njx1jau/6XZ9pAaRa5AJKTM8c/bGrPBL9
         rF+h/l149xnu5RPq2E8MvWyUBSBr3r+5Hs4RvpsK8bWtLzcFrx2uHovF6lhTjhDC7GHa
         GOWDXSz04bv1g1bvp23PSbiE+8iTU6ZPiy9YJvzeJYifLOo5c8REJIXdWPsxhmn7CAmy
         676e2gCIkBxqKvmPM54V/gvq6RAcsp89jHLjqlaS1+KRIkmpyrsZQOvtvRxcO1wrbGpA
         X09A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BkuiWl8E;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v15-20020ad4528f000000b004c756036993si4886949qvr.61.2022.12.12.07.22.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Dec 2022 07:22:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BkuiWl8E;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4kd0-000807-G9; Mon, 12 Dec 2022 10:22:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1p4kcy-0007zb-PD
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 10:22:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1p4kcx-0006zM-8u
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 10:22:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670858518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=leoGlx7hdgS+89JgiqQkBMFvCZUEpErYcAE/remdook=;
 b=BkuiWl8EYudMzOiZ3qYhV4iv0JoIkdzABA1Nd8baWTLeTfwTZigG5aP68zHYrv2AP2E4Zb
 GpGdbvIGj+qURmv+zjTq0AZkXCEEoGEvG49zPssCx9I3opMBOR2gl9oIsuNJtoSpxWln4o
 BY/MAdfYSZ21/+wBpCIgKtGnTH9TAoA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-2MRL0Zl4PESshDbcWu1euw-1; Mon, 12 Dec 2022 10:21:56 -0500
X-MC-Unique: 2MRL0Zl4PESshDbcWu1euw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 55F06101A54E;
 Mon, 12 Dec 2022 15:21:55 +0000 (UTC)
Received: from gondolin.redhat.com (unknown [10.39.195.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 53B4D2026D68;
 Mon, 12 Dec 2022 15:21:51 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH for-8.0 v2 0/2] compat machines for 8.0
Date: Mon, 12 Dec 2022 16:21:43 +0100
Message-Id: <20221212152145.124317-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: eerECuxfkwuN

In addition to adding the compat machines for 8.0, let's clean up the pc
ones as well, as suggested by Thomas.

v1->v2:
- add missing blank in patch 1
- add r-bs for patch 1
- add patch 2

Cornelia Huck (2):
  hw: Add compat machines for 8.0
  pc: clean up compat machines

 hw/arm/virt.c              |  9 ++++++++-
 hw/core/machine.c          |  3 +++
 hw/i386/pc.c               |  3 +++
 hw/i386/pc_piix.c          | 41 +++++++++++++-------------------------
 hw/i386/pc_q35.c           | 29 ++++++++++++---------------
 hw/m68k/virt.c             |  9 ++++++++-
 hw/ppc/spapr.c             | 15 ++++++++++++--
 hw/s390x/s390-virtio-ccw.c | 14 ++++++++++++-
 include/hw/boards.h        |  3 +++
 include/hw/i386/pc.h       |  3 +++
 10 files changed, 81 insertions(+), 48 deletions(-)

-- 
2.38.1

