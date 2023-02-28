Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5844883ejc;
        Tue, 28 Feb 2023 07:03:03 -0800 (PST)
X-Google-Smtp-Source: AK7set+LxcDgpf+GBWpf1fIyi+E9jv4NW+ur4t724WlsmUlb4b34eyeQScKe/09kOMKO0lOM5jlg
X-Received: by 2002:a05:7500:648c:b0:f6:67d4:4ab with SMTP id jk12-20020a057500648c00b000f667d404abmr68642gab.4.1677596582708;
        Tue, 28 Feb 2023 07:03:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677596582; cv=none;
        d=google.com; s=arc-20160816;
        b=WN1SFRs4BpUBlK+cMWF/Rf1N55CAzo1UU0YWKVhkVOJdPcdxupM4OVRarw5DsNXuh9
         pJ5XwIuQzUyHH+WMXC63gZr18a1MxuQGt48petw19scstGSWIWai/eUtmR2rg9WdtHh9
         zZZKT12OteTMbVLEhZLbqYGym7YgHnKzG6+iWjn2V+ho3lcRS/2Jr8a7U+dxg5YPu+1B
         E7koKIkjDfDfZEYNAJuJaIpQLIhyXtbnANW+8T7WTpXOQlgclFet3EnER710YEv0Raa3
         ka7FwGajb9sqgTyNEt399deVhvYaUmtcA753SqNHJeFrP9RX7Mc/Try8lFpvn6vymnQV
         ssRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=5AsD+lSBqsPncK5WAfJthLdvOGLMn8lKJcrsX+/oOvo=;
        b=Vq8icy0c1fXfea7urKb83pl0FFpvEKS08ZGGA0M9Djp7cdzng1zytEOJ6ryyyTJxta
         yt9CoGQeYqK79cpEcWP4I+T8nyKMcU6O5sIH2ny5B9nbyTHzBqo9dmewcURLBGdS7xY8
         bQx9vWvc8mNxpIbA1x9u0CdnbLrtKu4AjfWFw82gAMFOT/Vr2E7y2OrKftPXtGza44D9
         QagCJumjVMhK6bzKEqn3p1XFcKlI6m4g++KN7WloDZVLuNmGfotTDNfUVbOMx5NyeWsz
         zWpU7hAde+En90UwXMbGX6LCITFDzhUvNT3a7u0fA6Iobd+mw52aeo9y5a0QRxccBq+Q
         pXzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QrJ+krBt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g26-20020a056102081a00b0041207e62af8si3255774vsb.279.2023.02.28.07.03.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Feb 2023 07:03:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QrJ+krBt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pX1VH-0002cB-Dl; Tue, 28 Feb 2023 10:02:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pX1V2-0002WP-L1
 for qemu-arm@nongnu.org; Tue, 28 Feb 2023 10:02:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pX1V0-0003YU-A3
 for qemu-arm@nongnu.org; Tue, 28 Feb 2023 10:02:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677596556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5AsD+lSBqsPncK5WAfJthLdvOGLMn8lKJcrsX+/oOvo=;
 b=QrJ+krBtEknnAtsT4i+X27mreasE07xETjRgFIY4rlP66DjNFevrD3WplQ6lAaWLa7BZEQ
 mBljksoXX5RevorTHGVbQXBip1PAF/hmqa6RqeCYCWRnKACYMuNiIC/cZxTKOEh6axZLzA
 +K7zof59wgA5cHr6aEDfeSHT/F/AUME=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86--z1MfU-dMQCHm3g_lUhFKg-1; Tue, 28 Feb 2023 10:02:34 -0500
X-MC-Unique: -z1MfU-dMQCHm3g_lUhFKg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 869A785CBE2;
 Tue, 28 Feb 2023 15:02:33 +0000 (UTC)
Received: from gondolin.redhat.com (unknown [10.39.193.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE170492B0E;
 Tue, 28 Feb 2023 15:02:31 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
 Eric Auger <eauger@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Gavin Shan <gshan@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v6 0/2] arm: enable MTE for QEMU + kvm
Date: Tue, 28 Feb 2023 16:02:14 +0100
Message-Id: <20230228150216.77912-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: rZh/Wmfgamub

Another respin of my kvm mte series; again, tested via check + check-tcg
and on FVP.

Changes v5->v6:
- "arm/virt: don't try to spell out the accelerator" has been merged
- some more reordering of the enable_mte logic
- added more explanations
- rebase to current master

Cornelia Huck (2):
  arm/kvm: add support for MTE
  qtests/arm: add some mte tests

 docs/system/arm/cpu-features.rst |  21 ++++++
 hw/arm/virt.c                    |   2 +-
 target/arm/cpu.c                 |  18 ++---
 target/arm/cpu.h                 |   1 +
 target/arm/cpu64.c               | 110 +++++++++++++++++++++++++++++++
 target/arm/internals.h           |   1 +
 target/arm/kvm.c                 |  29 ++++++++
 target/arm/kvm64.c               |   5 ++
 target/arm/kvm_arm.h             |  19 ++++++
 target/arm/monitor.c             |   1 +
 tests/qtest/arm-cpu-features.c   |  80 ++++++++++++++++++++++
 11 files changed, 274 insertions(+), 13 deletions(-)

-- 
2.39.2

