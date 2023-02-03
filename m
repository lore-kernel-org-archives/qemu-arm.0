Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1403297ejb;
        Fri, 3 Feb 2023 05:45:40 -0800 (PST)
X-Google-Smtp-Source: AK7set+hx2Ws/qTJ1ey+h66dtpi0y+DFxADg4fLGfFA/mzYWOUn3OMKDzPIk2wIJgacdI6CpPIWr
X-Received: by 2002:a17:902:ecc1:b0:196:11c2:2fb3 with SMTP id a1-20020a170902ecc100b0019611c22fb3mr12350218plh.36.1675431939750;
        Fri, 03 Feb 2023 05:45:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675431939; cv=none;
        d=google.com; s=arc-20160816;
        b=jTulBQLiRVFlNc8QeMi6ruNTPPB7rgeolhpqHUXJHKIitEKtrb54AtzQ/uAmmD95ul
         97VbPZJbWOLQjbaARrOkyxkp7Dou5rB4yWTljBkcr/tTngS4QEb/9mq4ORZmZ/KhCIPb
         4vRvHqyKmT2AOmAD55x7BQZcPfRqMbS5W0fWKZSg6yi06tTt+NWJcfbiSzw69WIKoiTu
         pmfjr7shDjP+DbeJ2GVYd4ht7l4f0zI9pjLuFNRCtSwniMdL26oopro41UL7voyCL+AN
         9vvLUzEhuvRUj5eKfsCkWy3m9nVqG9aW6AccqbbYLlsOlFDHcBmDsgi7bML3byG4LTBu
         3cyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:mime-version
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=YP1epws1dmAHUdSLmHbMg7KBxFHOC2nJ+3d3zmIg2ds=;
        b=kgGDuJ47iYxU0+/A5Am/CH79k4N0D/s8ujrr2vCNxGjYKYYXSZ/AVo3mGQL54BQit0
         Mde7ztIxUa1Lz1qu2b9XPcBj5D9mtGRUqOueVgr3A957jOCR4AIip9nkbBhwbvc7I1jD
         kdIkTrArg1qaD3U0cxrR13QA2X7FLolWIxkvqGWRkEhZk+FGEbmpovUf9ynAfEW9sfvP
         ZtlXje/9n/mC8m8m2D/hD5VJGAubO5rJUFvyZAnSs3RSujyaDR1FwGhJoOFGH32pKrbE
         HgOTAqmBElZ42l6bgGNqfOCCKReqUlUDQOh8j4/jDQePdJIwA3y8LFONhuZOyr4SUeEm
         QuBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HaEz+Ly9;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id f12-20020a63754c000000b004d81d4a54eesi2642135pgn.327.2023.02.03.05.45.39;
        Fri, 03 Feb 2023 05:45:39 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HaEz+Ly9;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232815AbjBCNpi (ORCPT <rfc822;mathieu.poirier@linaro.org>
        + 3 others); Fri, 3 Feb 2023 08:45:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231493AbjBCNpg (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 3 Feb 2023 08:45:36 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 569838D622
        for <kvm@vger.kernel.org>; Fri,  3 Feb 2023 05:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675431887;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=YP1epws1dmAHUdSLmHbMg7KBxFHOC2nJ+3d3zmIg2ds=;
        b=HaEz+Ly9ZBJiiSm4MjbiPTQEkEX1LT7HEs8mY+SVGYcph2y5zqGDIeIsrvAnusUqp+L0bH
        qt93Yz149PA4A0b/cDNqWbMVV+tEYcXUXAJslbJT1eD1d6Q2Wgy4kRZWD/3YCiUhopwtOB
        bsoIYdF6+Idv4MRewKxQWi3u42slgUk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-13CC1gKhM_-9RqJgVuNiiw-1; Fri, 03 Feb 2023 08:44:44 -0500
X-MC-Unique: 13CC1gKhM_-9RqJgVuNiiw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DAFE62A5956C;
        Fri,  3 Feb 2023 13:44:43 +0000 (UTC)
Received: from gondolin.redhat.com (unknown [10.39.192.149])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E4C95410B1AD;
        Fri,  3 Feb 2023 13:44:41 +0000 (UTC)
From:   Cornelia Huck <cohuck@redhat.com>
To:     Peter Maydell <peter.maydell@linaro.org>,
        Thomas Huth <thuth@redhat.com>,
        Laurent Vivier <lvivier@redhat.com>
Cc:     qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
        Eric Auger <eauger@redhat.com>,
        "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
        Juan Quintela <quintela@redhat.com>,
        Gavin Shan <gshan@redhat.com>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
        Richard Henderson <richard.henderson@linaro.org>,
        Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v5 0/3] arm: enable MTE for QEMU + kvm
Date:   Fri,  3 Feb 2023 14:44:30 +0100
Message-Id: <20230203134433.31513-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 2kgoUA21ZVOv

Respin of my kvm mte series; tested via check + check-tcg and on FVP.

Changes v4->v5:
- new patch: "arm/virt: don't try to spell out the accelerator"
- some refactoring in the kvm enablement code
- fixes suggested by various people
- rebase to current master

Cornelia Huck (3):
  arm/virt: don't try to spell out the accelerator
  arm/kvm: add support for MTE
  qtests/arm: add some mte tests

 docs/system/arm/cpu-features.rst |  21 ++++++
 hw/arm/virt.c                    |   8 +--
 target/arm/cpu.c                 |  18 ++---
 target/arm/cpu.h                 |   1 +
 target/arm/cpu64.c               | 114 +++++++++++++++++++++++++++++++
 target/arm/internals.h           |   1 +
 target/arm/kvm.c                 |  29 ++++++++
 target/arm/kvm64.c               |   5 ++
 target/arm/kvm_arm.h             |  19 ++++++
 target/arm/monitor.c             |   1 +
 tests/qtest/arm-cpu-features.c   |  75 ++++++++++++++++++++
 11 files changed, 276 insertions(+), 16 deletions(-)

-- 
2.39.1
