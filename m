Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp5608109lft;
        Thu, 7 Jul 2022 09:17:21 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uaNO+lp7WcMOo0VSrMaAZLbLepIi9kPhMBuMLN7g84wZ9IBP1hGr69n6gA2yUaCnsu6hM1
X-Received: by 2002:a17:907:2ccc:b0:72b:2f1:f157 with SMTP id hg12-20020a1709072ccc00b0072b02f1f157mr6681221ejc.265.1657210636439;
        Thu, 07 Jul 2022 09:17:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657210636; cv=none;
        d=google.com; s=arc-20160816;
        b=dO0y2OVHohRgAjRMUiHyZnYNfVvU0cc0N5MZSSgo2RW48akhOROe+HDjnqnoMFIxKl
         qjO+Di6XPLLfCWlB3tA5MV8hEdhcPUxHfA7RJ7/LvMWYbxNTY+DhrRWL0oGLVTofMb5M
         Eg/Rj5lu2c9Wt8zT5aE2l5c0fKqRbKXS+eF561+nYoZScDaiJoo9MqK1nJJPuxT6gKNl
         yCkk2pi8No1dStAOXCCI5Wm/bLYr2YQEMd3buYjHnzG16/ifGoJtpElBCtFyljrvOr46
         tl+p7x+moJIyh3jaEcIfDhxaPF7gwrJHAv/n9N+raaFykXVVMuZsCoyGoK8PKpGPrwFn
         h1fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:mime-version
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=M6NGapFf616x3lfviLPQ8wkMqYW0tIq1LqqAGJqP98E=;
        b=cDhQervblzeRHfrWtRdl69zW30jUjlZRCTqwvYMZ45Hg45BN8dVDh1BojBYtN5raAz
         PZ7QDL/IhZ02hSC2uVn+/4St3D5l/IH/Ng4T2KgxzhF9ytkpo9o7lEBtf/2Da7KaWJrX
         acJiGGDS/YvuFla3yyyxoekvIt+oXrL1eyV38WcaLP0gGNN+lyaslejLDp4CIhh12UnP
         V9VYrFJ7zFRuIugtSPk4yLpYI/fE5TVFI2BDxUhVXYwiXRIrKtXnzuWQx5YLExiCJPbw
         p6UiF8LTLkIvkENE5wJMNPk+yz9LnVr8bwAaywzb32TWQKBHWRWj/oiAr8W7J5wp8IrC
         3xWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=K14O0KS0;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id p11-20020a056402500b00b00439eafe046bsi21267941eda.171.2022.07.07.09.17.16;
        Thu, 07 Jul 2022 09:17:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=K14O0KS0;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235872AbiGGQRO (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 3 others); Thu, 7 Jul 2022 12:17:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235824AbiGGQRL (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 7 Jul 2022 12:17:11 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A5523BE13
        for <kvm@vger.kernel.org>; Thu,  7 Jul 2022 09:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1657210629;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=M6NGapFf616x3lfviLPQ8wkMqYW0tIq1LqqAGJqP98E=;
        b=K14O0KS0RoN4qRMOp/wg81bedUXpYcHARR9Gjkp+a1Noy7lA324VkqGByY4kkdFO4xBcuA
        NrYg2w6bM/DdbpRM+8Ca6IacxuhBGXgOS4QxwVporDfPUQ13tfb6u8BUak3OhG5WliuOuc
        FvmDjyusHh3DOEuWvInD02GvYg3lE5s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-14-94AUJYg1PYS4INxmbSI57w-1; Thu, 07 Jul 2022 12:17:02 -0400
X-MC-Unique: 94AUJYg1PYS4INxmbSI57w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F36D31019C8E;
        Thu,  7 Jul 2022 16:17:01 +0000 (UTC)
Received: from gondolin.fritz.box (unknown [10.39.192.81])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 661572166B26;
        Thu,  7 Jul 2022 16:17:00 +0000 (UTC)
From:   Cornelia Huck <cohuck@redhat.com>
To:     Peter Maydell <peter.maydell@linaro.org>,
        Thomas Huth <thuth@redhat.com>,
        Laurent Vivier <lvivier@redhat.com>
Cc:     Eric Auger <eauger@redhat.com>,
        "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
        Juan Quintela <quintela@redhat.com>, qemu-arm@nongnu.org,
        qemu-devel@nongnu.org, kvm@vger.kernel.org,
        Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH RFC v2 0/2] arm: enable MTE for QEMU + kvm
Date:   Thu,  7 Jul 2022 18:16:54 +0200
Message-Id: <20220707161656.41664-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: qrVyNv0SE0uh

This series makes it possible to enable MTE for kvm guests, if the kernel
supports it. Again, tested on the simulator via patiently waiting for the
arm64/mte kselftests to finish successfully.

For tcg, turning on mte on the machine level (to get tag memory) stays a
requirement. If the new mte cpu feature is not explicitly specified, a tcg
vm will get mte depending on the presence of tag memory (just as today).

For kvm, mte stays off by default; this is because migration is not yet
supported (postcopy will need an extension of the kernel interface, possibly
an extension of the userfaultfd interface), and turning on mte will add a
migration blocker.

My biggest question going forward is actually concerning migration; I gather
that we should not bother adding something unless postcopy is working as well?
If I'm not misunderstanding things, we need a way to fault in a page together
with the tag; doing that in one go is probably the only way that we can be
sure that this is race-free on the QEMU side. Comments welcome :)

Changes v1->v2: [Thanks to Eric for the feedback!]
- add documentation
- switch the mte prop to OnOffAuto; this improves the interaction with the
  existing mte machine prop
- leave mte off for kvm by default
- improve tests; the poking in QDicts feels a bit ugly, but seems to work

Cornelia Huck (2):
  arm/kvm: add support for MTE
  qtests/arm: add some mte tests

 docs/system/arm/cpu-features.rst |  21 +++++
 target/arm/cpu.c                 |  18 ++---
 target/arm/cpu.h                 |   1 +
 target/arm/cpu64.c               | 132 +++++++++++++++++++++++++++++++
 target/arm/internals.h           |   1 +
 target/arm/kvm64.c               |   5 ++
 target/arm/kvm_arm.h             |  12 +++
 target/arm/monitor.c             |   1 +
 tests/qtest/arm-cpu-features.c   |  77 ++++++++++++++++++
 9 files changed, 256 insertions(+), 12 deletions(-)

-- 
2.35.3
