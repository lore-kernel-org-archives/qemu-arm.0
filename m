Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp403535lfj;
        Thu, 12 May 2022 06:12:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKJbSKB1FbbxxGe0osklss3RM6+/7gjFFLvRftLPj6deUyqaCVz5rDzq8rDCo5vqnMiN0v
X-Received: by 2002:a17:907:3f02:b0:6f3:5c42:321a with SMTP id hq2-20020a1709073f0200b006f35c42321amr30211831ejc.521.1652361134893;
        Thu, 12 May 2022 06:12:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652361134; cv=none;
        d=google.com; s=arc-20160816;
        b=z3oCdfFg4FrsJjTl60bGJRBoHdXbu29K5dcXQy1bLj2wY+ckZ9QUpkPuzYnCsZkYaW
         OjIRlZFp5XHhE8D2YrZL6z5TM/SETLKDi6tTgK9Nxvly70u/pxxARAHjmnFKL/LFMBlk
         fUqpmi8662rIrgxDY39nIAV7Lp2iGuWh8D9i2E9aoBaWJ0x3m46ilpzohjYeyWLJr0cW
         cQ4xXGgqWtAsZQ9tvq8XBzp2UAiDI6lyRv8YSRkYO8G38ruZ6V9cxJ6feid5B6uU6A9v
         LgexFQZq/hC77IsvdxWfWk2Wou4uw+P57Sc6UTjJnrD7bDywV4r+korb16vtkAjZA3aN
         Wh3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:mime-version
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=6ZUtkKT1gSa7cSHlEzhqRgqVdUguIg1mvdLamXJLJ1g=;
        b=qdBcudSmfeoXCk5Lq+6D5EGClC4CId0i2/XHeVNxFHcM1nkBto8u5ZcSHj46zw8p8l
         QkRyBOYUhf4zBrzUCq2WJlAWDkk1EqXHmYNEFy5XYMe/zDmOWgNk04cCyf4L3yoGqx17
         su+Xw524EF+47rqDkK0DeUp+smHNpgIWflL7QdDxKvZ/K4W4px01KVPyy2AjOaiJHUuy
         Bg3wXHnm5PdMRpIlIlSRiXzkid7M+HpHpnvGnbotDNIPMOqWgpbnR0LsG6Zr2U0rlNGO
         aDdlPbdl1rCn3xNwqbtEZpuTNFDdoZuHrAXoxXGEYmk/B6267z12roQfA2DoEf+iQUxY
         Wtgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KDGyaoL6;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id cm15-20020a0564020c8f00b00425cd11d846si5679560edb.112.2022.05.12.06.12.14;
        Thu, 12 May 2022 06:12:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KDGyaoL6;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354222AbiELNMN (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 3 others); Thu, 12 May 2022 09:12:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354262AbiELNMI (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 12 May 2022 09:12:08 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A7756BA98A
        for <kvm@vger.kernel.org>; Thu, 12 May 2022 06:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1652361117;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=6ZUtkKT1gSa7cSHlEzhqRgqVdUguIg1mvdLamXJLJ1g=;
        b=KDGyaoL6xpdY+VL4yrVJ4GuHc8ZV7XB8UlMHGzqUvJJRSgWYCrPUQ+186EnkfYnTgO1fsm
        v0L1x39xmkVOK1t59tGQshOfVQrRQSwXblxSMykKa+s/8YWrlKXvHlJT+gLqMrMt6d9zyo
        9oAjCXhSpwAdnq6EsYxJlOhyIu32bME=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-464-Ex3kEOImN-OAAexJZa3SSw-1; Thu, 12 May 2022 09:11:53 -0400
X-MC-Unique: Ex3kEOImN-OAAexJZa3SSw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 477521C08968;
        Thu, 12 May 2022 13:11:53 +0000 (UTC)
Received: from gondolin.fritz.box (unknown [10.39.193.157])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5D1A37AF2;
        Thu, 12 May 2022 13:11:50 +0000 (UTC)
From:   Cornelia Huck <cohuck@redhat.com>
To:     Peter Maydell <peter.maydell@linaro.org>,
        Thomas Huth <thuth@redhat.com>,
        Laurent Vivier <lvivier@redhat.com>
Cc:     Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org,
        qemu-devel@nongnu.org, kvm@vger.kernel.org,
        Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH RFC 0/2] arm: enable MTE for QEMU + kvm
Date:   Thu, 12 May 2022 15:11:44 +0200
Message-Id: <20220512131146.78457-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: G1VJ2gDC0nTP

This series enables MTE for kvm guests, if the kernel supports it.
Lightly tested while running under the simulator (the arm64/mte/
kselftests pass... if you wait patiently :)

A new cpu property "mte" (defaulting to on if possible) is introduced;
for tcg, you still need to enable mte at the machine as well.

I've hacked up some very basic qtests; not entirely sure if I'm going
about it the right way.

Some things to look out for:
- Migration is not (yet) supported. I added a migration blocker if we
  enable mte in the kvm case. AFAIK, there isn't any hardware available
  yet that allows mte + kvm to be used (I think the latest Gravitons
  implement mte, but no bare metal instances seem to be available), so
  that should not have any impact on real world usage.
- I'm not at all sure about the interaction between the virt machine 'mte'
  prop and the cpu 'mte' prop. To keep things working with tcg as before,
  a not-specified mte for the cpu should simply give us a guest without
  mte if it wasn't specified for the machine. However, mte on the cpu
  without mte on the machine should probably generate an error, but I'm not
  sure how to detect that without breaking the silent downgrade to preserve
  existing behaviour.
- As I'm still new to arm, please don't assume that I know what I'm doing :)


Cornelia Huck (2):
  arm/kvm: enable MTE if available
  qtests/arm: add some mte tests

 target/arm/cpu.c               | 18 +++-----
 target/arm/cpu.h               |  4 ++
 target/arm/cpu64.c             | 78 ++++++++++++++++++++++++++++++++++
 target/arm/kvm64.c             |  5 +++
 target/arm/kvm_arm.h           | 12 ++++++
 target/arm/monitor.c           |  1 +
 tests/qtest/arm-cpu-features.c | 31 ++++++++++++++
 7 files changed, 137 insertions(+), 12 deletions(-)

-- 
2.34.3
