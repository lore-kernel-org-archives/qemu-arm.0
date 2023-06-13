Received: by 2002:a17:906:ae84:b0:982:368b:d395 with SMTP id md4csp597575ejb;
        Tue, 13 Jun 2023 08:05:57 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7KbZmdFq6Cni+VAv+Qj8XpiINiNngdyBcz/nfFlV/YRJQvzJDTb4mX3yzrzrtniUJU+YE1
X-Received: by 2002:a05:6214:c81:b0:62d:f2ef:93cb with SMTP id r1-20020a0562140c8100b0062df2ef93cbmr3960996qvr.58.1686668757317;
        Tue, 13 Jun 2023 08:05:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686668757; cv=none;
        d=google.com; s=arc-20160816;
        b=qXomPI0RnxdLTco3zIQTy3CGUq8rkkczL0FtP7bOuv1fLnY+Ri219nY7nOkBq0JvjK
         kPz+FlEUgMB+lUPiiWwCU88IZOjG4gFBU7g5As5zEKQHx9pEYPg17UuuoD/EzBksVUV4
         LjGAKu/6zlaJRx7Cp5b/dTfbRAYZlofEQctuceTjkmqdPzjytPeSdaWxUyO+QZilpBgq
         ao8KRD0riTQGqn5Mfej2WYobWZkr2zaYueohAEYp4EDreK8NI9MEh7ga43rImPqb4vsY
         Mql3h9XFJNPdFaeoTlCo+GeL7pfqwsITgu1eZJaINMDr7/wxhB7A0V5H8hDrRb78ClPT
         FDmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=MbKL8R57A8XduGpsnGtnH5IBUyxfFBZo2a9+yyyQ9Ic=;
        b=kLdJAlGYLmzoDuPkpgZ87E5wBSGJcDmo7Wj7ALybqjII9YvzDa0igiUBT0IbEzL1q3
         6Mb+XxPtEg1RUYsjpkMBWGom3EuWcN06qwpwXD+r/P0P+JuVQd5p2LmFvgn/W7tYdnuQ
         ruDE5MhYJ5NDQnj3SK+DCrLZgaMAknHTfGPPNhdV1WRawDK0i5CTACW3eKBXYRJsCrb+
         Xbr+1gmajCwq4b2nOYgiSVOFx64vTfuNeEyYeqzLUP0c37owvuBoLHknfzyOlsp4Tkhv
         M+GamQbbL4T+TyoAsVvDm5JfsPglBGG3aqtSmqo2F1vw7ZfRnm5KwjXeusodI6Lv+2Du
         90ew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="eGZS6D/J";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o5-20020ad45c85000000b006236b1ac5c3si7984156qvh.265.2023.06.13.08.05.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Jun 2023 08:05:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="eGZS6D/J";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q95ZJ-00064S-S3; Tue, 13 Jun 2023 11:04:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1q95Y5-0003wk-5Z
 for qemu-arm@nongnu.org; Tue, 13 Jun 2023 11:03:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1q95XZ-0008Sq-Sz
 for qemu-arm@nongnu.org; Tue, 13 Jun 2023 11:02:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686668549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=MbKL8R57A8XduGpsnGtnH5IBUyxfFBZo2a9+yyyQ9Ic=;
 b=eGZS6D/JMQ6o8Qa75p2eH/SPXHJRBoFy+dKOA6NG/n/qOquDiSRctcm0D0EfT6ZFJ4Dcoj
 kq9hXSPvpKaR5fWwkMuhWlLn57wY5DeAH3/VdQSJ4Obw0nhUkWidZkXqEVmH0yMmY568M5
 fCLNftI5I7Xfsc714G1Yn6+zijoL8mI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-TmdI9uz0NBSmsRjY9eRUNQ-1; Tue, 13 Jun 2023 11:02:26 -0400
X-MC-Unique: TmdI9uz0NBSmsRjY9eRUNQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ABE383C0F42C;
 Tue, 13 Jun 2023 15:02:12 +0000 (UTC)
Received: from t480s.fritz.box (unknown [10.39.192.249])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E121A40C20F5;
 Tue, 13 Jun 2023 15:02:10 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
 Gavin Shan <gshan@redhat.com>
Subject: [PATCH v1 0/5] virtio-mem: Device unplug support
Date: Tue, 13 Jun 2023 17:02:05 +0200
Message-Id: <20230613150210.449406-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: lnsAB/+u88aY

One limitation of virtio-mem is that we cannot currently unplug virtio-mem
devices that have all memory unplugged from the VM.

Let's properly handle forced unplug (as can be triggered by the VM) and
add support for ordinary unplug (requests) of virtio-mem devices that are
in a compatible state (no legacy mode, no plugged memory, no plug request).

Briefly tested on both, x86_64 and aarch64.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Eduardo Habkost <eduardo@habkost.net>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-arm@nongnu.org
Cc: Gavin Shan <gshan@redhat.com>

David Hildenbrand (5):
  pc: Properly handle unplug of virtio based memory devices
  arm/virt: Properly handle unplug of virtio based memory devices
  virtio-mem: Prepare for unplug support of virtio-mem-pci devices
  pc: Support unplug of virtio-mem-pci devices
  arm/virt: Support unplug of virtio-mem-pci devices

 hw/arm/virt.c                  | 60 +++++++++++++++++++++++++++++--
 hw/i386/pc.c                   | 66 ++++++++++++++++++++++++++++++----
 hw/virtio/virtio-mem-pci.c     | 42 ++++++++++++++++++++--
 hw/virtio/virtio-mem-pci.h     |  2 ++
 hw/virtio/virtio-mem.c         | 24 +++++++++++++
 include/hw/virtio/virtio-mem.h |  2 ++
 6 files changed, 183 insertions(+), 13 deletions(-)

-- 
2.40.1

