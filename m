Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp1428396lfq;
        Mon, 11 Apr 2022 00:06:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMeq88wWpApwKB4CTBkeVwGRSCI4P9CVNSfqtTWNz2pjZ3HyUEvfq1YOeS63AwS+YJ2fD+
X-Received: by 2002:ac8:44b2:0:b0:2ee:aada:bc30 with SMTP id a18-20020ac844b2000000b002eeaadabc30mr1819213qto.589.1649660761584;
        Mon, 11 Apr 2022 00:06:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649660761; cv=none;
        d=google.com; s=arc-20160816;
        b=rcSuACkLU4sahBGYYsZ76RKfhcOwdisQD2kIyjG/oXVGIGNje5G5WXOU7LtfB5UDhG
         UocghGeWIWRRVFihh7uKWLT5Pn2iaoXl8BN5SCDQKq9JfM0Z+GhCGDHF94adzoFpd2nV
         lIOjl8zqEOcEOVZv7FaVIt2XVHb20Ad/N2M/jPd0MXTCrQF39DsE/n4g4EjY7TOk4RiW
         5ApSFeo0jFGIamuQz+noajbyE1tnOmTArCH7bU1QO0Usq3GgI1Q6lLNQxh43a43arHV0
         ZEs4HTs/CMUIpFlwN0JpYkitjAFF3Q7B5AeRLcA2VFNRQMRlZMk7HY9EjyhoudOuXyhI
         GlqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=XuiPtqiNp70l6k/9Wj2s6RLZomeeJIdiwy3C1lzF84A=;
        b=yqN9otWOxVXs2ypiAuu5x9PUpNX+XBZXg76W5s/zsp3a6D0xAzvMs2aZywxGvO09NI
         op6fHXO7P6HGYES1HZhJ7rJ/PFiuuo2V6pHA30juDzPEbMGHaBwH5bX0bDZ9fGiXgugM
         S0uMegUenxMDg8UDdt+G30inj32A5ehBvlzEyC/0UEsGASe/qgTPlci1IjhFr7sx3K77
         Shyu/0Ljki0pz0Kj9jWx7/Cyi1Kk4+zxGVywV9eou61SX09QZkWjUbB6MUmkOcP513W/
         dVIBa7e+RK4bjF599mc/ogs3LKL9wbAhq2PFJUdzKqPWBRo6NJgA/AyYqjLtelhLCrsv
         AqFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fGDh0Chz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g20-20020ac87d14000000b002e1fbf3be3fsi4963015qtb.48.2022.04.11.00.06.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Apr 2022 00:06:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fGDh0Chz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndo7c-0004Vo-SB
	for alex.bennee@linaro.org; Mon, 11 Apr 2022 03:06:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ndo0r-0007xe-3I
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 02:59:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ndo0p-00075v-CX
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 02:59:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649660338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XuiPtqiNp70l6k/9Wj2s6RLZomeeJIdiwy3C1lzF84A=;
 b=fGDh0ChzO2BoxVvdp1mqs4xRxeJzTfWKUkZx/BWkbG3e6bRBKSZkeR+VzvZ0X1fsoh+C3a
 eJ0AfXIC/aXQ2CloDKZtnc8EycD7YeEvqXvbF3lfANDBc0siNpzQv4re1Y2KpftKVXY22i
 mo0rUYQi+TAUaZchqsxKHNEcG9DKw1U=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-497-ln_GFj8cNhCUH5xDJ2iGQw-1; Mon, 11 Apr 2022 02:58:55 -0400
X-MC-Unique: ln_GFj8cNhCUH5xDJ2iGQw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 11D513C14104;
 Mon, 11 Apr 2022 06:58:55 +0000 (UTC)
Received: from gshan.redhat.com (ovpn-12-73.pek2.redhat.com [10.72.12.73])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8FB0A4029AD;
 Mon, 11 Apr 2022 06:58:50 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH 0/5] target/arm: Support variable sized coprocessor registers
Date: Mon, 11 Apr 2022 14:58:37 +0800
Message-Id: <20220411065842.63880-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, eric.auger@redhat.com, agraf@csgraf.de,
 shan.gavin@gmail.com, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J8V4GUnbS//r

There are two arrays for each CPU, to store the indexes and values of the
coprocessor registers. Currently, 8 bytes fixed storage space is reserved
for each coprocessor register. However, larger coprocessor registers have
been defined and exposed by KVM. Except SVE registers, no coprocessor
register exceeds 8 bytes in size. It doesn't mean large coprocessor registers
won't be exploited in future. For example, I'm looking into SDEI virtualization
support, which isn't merged into Linux upstream yet. I have plan to add
several coprocessor ("firmware pseudo") registers to assist the migration.

This series adds one more array, to track the position or location in the
storage array (@cpreg_values) for the corresponding coprocessor register.
The storage space for one particular coprocessor register is always to
8 bytes so that we needn't worry about the alignment issue. In this way,
the coprocessor register size can be variable.

I had some internal discussion with Eric and Drew. They suggested to
send one mail to qemu-arm@nongnu.org, asking if there is any challenges
to support variable sized coprocessor registers. So another intention
of this series is to invoke the discussion.

PATCH[1-3] adds one more array (@cpreg_value_indexes) to track the location
in the storage array (@cpreg_values) for coprocessor registers. The storage
space for one particular coprocessor register is determined by the additional
array, which is named as indirect addressing mode. Each coprocessor register
is still having 8 bytes fixed storage space, so that thd old mechanism
(direct addressing mode) and indirect address mode can co-exist, event in
migration circumstance. PATCH[4] migrates the additional array. PATCH[5]
initializes @cpreg_value_indexes for KVM.

Gavin Shan (5):
  target/arm/tcg: Indirect addressing for coprocessor register storage
  target/arm/hvf: Indirect addressing for coprocessor register storage
  target/arm/kvm: Indirect addressing for coprocessor register storage
  target/arm: Migrate coprocessor register indirect addressing
    information
  target/arm/kvm: Support coprocessor register with variable size

 target/arm/cpu.h     | 12 +++++--
 target/arm/helper.c  | 27 +++++++++-----
 target/arm/hvf/hvf.c | 20 +++++++++--
 target/arm/kvm.c     | 85 ++++++++++++++++++++++++++++++++++++++------
 target/arm/machine.c | 30 ++++++++++++----
 5 files changed, 145 insertions(+), 29 deletions(-)

-- 
2.23.0

