Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp5367251njc;
        Wed, 28 May 2025 03:02:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX62LXrGOyJ+Kl+JF5KfAZ3sYBTyOBdxbU7UdmRuxaZJSbB4Bj7KTK0GZ+Lim4mNGkO1vTagsaAlmL6lQ==@linaro.org
X-Google-Smtp-Source: AGHT+IG+bG6yz3rU6dztJBDkMiqdiwGfbL7UXoBYtml6XGhIsL0uiD+9yn2YdAnB/P3zkg7GJDRP
X-Received: by 2002:a05:6102:3046:b0:4e2:872a:857a with SMTP id ada2fe7eead31-4e42406aa53mr12609897137.1.1748426541256;
        Wed, 28 May 2025 03:02:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748426541; cv=none;
        d=google.com; s=arc-20240605;
        b=PLb9mj2pM15zTua/wI0jM+3vFkHSCGoW0fwbsouehFPUs8GSKfF5q0oADGnbYplJ7z
         jZwmV9caJ+K+HOH6PkTb7YcRsbwJCD8uSFDDXPHNodzx6G9oOv8gAdBZQyxVJRdGccYJ
         tzMbOVzq0UPZXXxIxZZf/SEld2t+dFAvo85/xBEmmrHeRr1EuGx2eJUvZasmTvqkzmfc
         XYXyU6kxeGORV8IOCN5v3M0AViY9m6Et3DM0zh1xahtAwTL4/bQ114evt1SZ7K+0h/5E
         iUQPKYaxoVc0jV2w7z1aXcj2Tjb27jjkT7qKI1Fzfvkul5yFEV18Ow0oPXR5l2z5onqy
         6dTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=IKS720o6LaVSFba8mr/Z9NGBLNLXtNlFvNJUbpX6Di4=;
        fh=fWw9l+Tqx6SppQIssOIDge+vOObRQF8eTjVKG6g5YgE=;
        b=Cw90fI4rwUPDbJYgbn/oaGgLd4wl6ROclCNxzX0Y0WHZy39Y88H2D4pIvJeO85Y/a/
         VvDxG7cHezrRpK0TsVA1zgTm2RjQYd1dBK6dzkT+w37bKdnI99JajQtPax+/DRLA3gMI
         KRQq3eHkgJw7U1QN2U0aeUjxAXam5gRF1P3McqtbWVEW6D8bNTE3MkcidrIRYZBsjkM1
         uZop+XtT1mLdlVGp0GdfdPD1nI7jP9cxXGTqsl8Y4yMedX7IJqERxqnDUjm460DNYOHt
         ZYNuV8Vv4t6c+yJXp80hAig4PglCZVZkjjfF/HhIT9WZZK3fnEUXvaytd+YVvoN+yQxu
         CUfQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=e1pX2btH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4e5a081a2a9si171504137.640.2025.05.28.03.02.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 May 2025 03:02:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=e1pX2btH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uKDbR-0007dc-Pu; Wed, 28 May 2025 06:01:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1uKDaj-0007TE-JS
 for qemu-arm@nongnu.org; Wed, 28 May 2025 06:01:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1uKDah-0006Px-U1
 for qemu-arm@nongnu.org; Wed, 28 May 2025 06:00:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748426453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=IKS720o6LaVSFba8mr/Z9NGBLNLXtNlFvNJUbpX6Di4=;
 b=e1pX2btHJ07Cb4TIL0oEuD8wvvmIiPiOGbBVyTeYhQ8E4B91L0nGg+6lcxY4oOfmUF959n
 HuwKk+sibeMqf6f8sWecjctAXdg5etvtyCXdrQi02h1Wtq2E5pVlBIfos/4upEkS7ycKv6
 hnnpGbFWrewkJdpAwMcgjVVYFmcXDc4=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-663-2GrdDLOqPCyKFeIdbKlBrA-1; Wed,
 28 May 2025 06:00:50 -0400
X-MC-Unique: 2GrdDLOqPCyKFeIdbKlBrA-1
X-Mimecast-MFC-AGG-ID: 2GrdDLOqPCyKFeIdbKlBrA_1748426449
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E6755180034A; Wed, 28 May 2025 10:00:48 +0000 (UTC)
Received: from gshan-thinkpadx1nanogen2.rmtau.csb (unknown [10.64.136.65])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8FEC419560AF; Wed, 28 May 2025 10:00:43 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Jonathan.Cameron@huawei.com,
 mchehab+huawei@kernel.org, mst@redhat.com, imammedo@redhat.com,
 anisinha@redhat.com, gengdongjiu1@gmail.com, peter.maydell@linaro.org,
 pbonzini@redhat.com, shan.gavin@gmail.com
Subject: [PATCH v2 0/3] target/arm/kvm: Improve memory error handling
Date: Wed, 28 May 2025 20:00:30 +1000
Message-ID: <20250528100033.159576-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) DKIMWL_WL_HIGH=-2.907, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: HzqHXQGY6fr9

Currently, there is only one CPER buffer (entry) can be delivered and
acknoledged at once. This conflicts to the scenario where the host and
guest has 64KB and 4KB page size. In this specific scenario, a problematic
host page can affect 16x guest pages, resulting in 16x memory errors
in the worst case. Unfortunately, qemu runs to core dump at (a) because
the previous error isn't acknoledged and current error is no way to be
delivered, shown in the following call trace

  kvm_vcpu_thread_fn
    kvm_cpu_exec
      kvm_arch_on_sigbus_vcpu
        kvm_cpu_synchronize_state
        acpi_ghes_memory_errors         (a)
        kvm_inject_arm_sea | abort

Fix the issue by sending 16x consecutive memory CPER entries for this
specific case in one shot. With the series applied on top of Mauro's
(v9) series [1], no qemu core dump is observed in the test where guest
memory access is triggered by 'victimd' and the recoverable memory error
is injected from the host.

[1] [PATCH v9 00/20] Change ghes to use HEST-based offsets and add support for error inject
    (https://lists.nongnu.org/archive/html/qemu-arm/2025-05/msg01104.html)

Changelog
=========
v2:
  * v1: https://lists.nongnu.org/archive/html/qemu-arm/2025-02/msg00897.html
  * Send 16x memory errors for the specific case                 (Jonathan)

Gavin Shan (3):
  acpi/ghes: Extend acpi_ghes_memory_errors() to support multiple CPERs
  kvm/arm/kvm: Introduce helper push_ghes_memory_errors()
  target/arm/kvm: Support multiple memory CPERs injection

 hw/acpi/ghes-stub.c    |  2 +-
 hw/acpi/ghes.c         | 29 ++++++++--------
 include/hw/acpi/ghes.h |  2 +-
 target/arm/kvm.c       | 77 +++++++++++++++++++++++++++++++++++++-----
 4 files changed, 86 insertions(+), 24 deletions(-)

-- 
2.49.0

