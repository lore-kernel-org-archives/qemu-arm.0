Received: by 2002:a17:906:4a51:b0:a52:fc6:5c40 with SMTP id a17csp375271ejv;
        Thu, 11 Apr 2024 23:21:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWq4Lc3zWxYx1nKuPirtWyrOLNea/B1/q5l3dSKqinjAowlmhyytvPINseQ7NMpLWJtQ/vyM/pqHS5LHcwmLFIiF+hHPHBR
X-Google-Smtp-Source: AGHT+IGgjKkwwsP5SEgqN29iGu9wJJaehAxPSQltkQRncHM70/ATtwGftfFc906nzz6S5qrzGGkv
X-Received: by 2002:a05:620a:cf2:b0:78e:cb97:9ffd with SMTP id c18-20020a05620a0cf200b0078ecb979ffdmr1138437qkj.46.1712902906912;
        Thu, 11 Apr 2024 23:21:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712902906; cv=none;
        d=google.com; s=arc-20160816;
        b=YiqmhDL1tXlrlviizIa1pEYJwM3O3MOHprn2Y9FMa+vuscRZUos9b4UbcYUsJdt7Vy
         cGjylTC6rcUBYHn1aUGaTA1n8P8AbHiEKs1cm9FuaPsHbHQHHcYvqiTmBiUEmR2jyIfV
         cdHGsKG5u3Q2J7RrZh7ZWbOQfpyxkpZHQexFlCRQn/xCBu75Dqrxi3YoEirb6PiaXhI1
         Kp7byXqF8WVg48IUWB/wU3RZPGCbRrxcjJbmV74Cofuuxu1rzaSFWlkEs0kOb6rtufVq
         DfO77NOl9wRsliZfkYB+z9IAen+ayFYAQQg/idDwdUoRkTtubqM+gZNQ6os8bA2H/Wis
         H3zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=hUDf9Fimhp4rPTt41kgYrt+DYUY2YS0XTg8OEUjGDjc=;
        fh=FgpzUiSKNMTtMHyk5kkuAaa5ueEJtER2oT+Q/1wxShc=;
        b=lyq0FL7RTDZEPY4bjdQWv/8av3wsHAFLFseQPA22TtSfRvua01gWCOpEwL9A+wG2bE
         OH3tr6Zboo1hRtSpE5wj3zCTIJ3Jy6WITHWAI2DQwsqF2U867h0UFuJR09aH5HS259vz
         fDLND0EuGi7hNxgya5ymDJIjYGtK9yaNCm0E6Hmd6VDvr7Zc8uXvBAa/u0I5Uj5Cvm7j
         P9QAjK1CJ45vuFvZyNfIT60aogEdaTG0nE75YzVNRcfl3+dN7PHhlLrpu7WKHNnLc7p/
         +jewK1CfHFHxk+U2GFf9LNe3R1jItt7CkApSbU1kWZ+Cqz8h/qh3Vfe46zJ+5dFJWUq+
         sb+Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="T/VTQ8RE";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id vu28-20020a05620a561c00b0078ecd26acb5si466315qkn.715.2024.04.11.23.21.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2024 23:21:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="T/VTQ8RE";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rvAHS-00080C-23; Fri, 12 Apr 2024 02:20:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rvAHQ-0007zN-OZ
 for qemu-arm@nongnu.org; Fri, 12 Apr 2024 02:20:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rvAHP-0003vQ-8G
 for qemu-arm@nongnu.org; Fri, 12 Apr 2024 02:20:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1712902854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=hUDf9Fimhp4rPTt41kgYrt+DYUY2YS0XTg8OEUjGDjc=;
 b=T/VTQ8REB6uFUfDzHDFuUzaRBzqBTe5tyPALnjwux9jqU6HXHw1jDVDQAHMe4r9YlOTALA
 EN4XqTaaHum0f2D8iFnKKifc2ULSqJxv9sZ+1J+uhwqpa8x/oU9TJwWTCzIUdD7/EPJDzh
 k3oDnOITMFX+AImm6/LzhJ3qAN06Y+k=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-621-OPxBJaK_OgiLsw76B0fA-A-1; Fri,
 12 Apr 2024 02:20:51 -0400
X-MC-Unique: OPxBJaK_OgiLsw76B0fA-A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 67F713C1E9CF;
 Fri, 12 Apr 2024 06:20:50 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.192.215])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D99551121306;
 Fri, 12 Apr 2024 06:20:47 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 0/2] Improvements for switches in hw/cpu/Kconfig
Date: Fri, 12 Apr 2024 08:20:40 +0200
Message-ID: <20240412062042.105174-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.49,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: aYTCjVADN3PS

First patch fixes the problem that the file hw/cpu/Kconfig is
currently ignored and the switches there are duplicated in hw/arm/.

The second patch introduces a proper config switch for the cpu-cluster
device.

Thomas Huth (2):
  hw: Fix problem with the A*MPCORE switches in the Kconfig files
  hw: Add a Kconfig switch for the TYPE_CPU_CLUSTER device

 hw/Kconfig         |  1 +
 hw/arm/Kconfig     | 18 +++---------------
 hw/cpu/Kconfig     | 15 ++++++++++++---
 hw/cpu/meson.build |  2 +-
 hw/riscv/Kconfig   |  2 ++
 5 files changed, 19 insertions(+), 19 deletions(-)

-- 
2.44.0

