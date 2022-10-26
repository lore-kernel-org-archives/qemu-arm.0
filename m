Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp659735ejn;
        Wed, 26 Oct 2022 09:05:28 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7AdwM8KHc5EZpebGEQU2kalAdmeSyFaOM5I5cChFpOXELGvHRjZzgWu8DAyz6d2+V7OIcH
X-Received: by 2002:aa7:db01:0:b0:461:4dc9:74e with SMTP id t1-20020aa7db01000000b004614dc9074emr26648561eds.139.1666800328409;
        Wed, 26 Oct 2022 09:05:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666800328; cv=none;
        d=google.com; s=arc-20160816;
        b=Yzst5JmFBFqk6+fZWuzHIVzghOBR47RbyrXTG2ymQX4trQdhHX4ImIw9Czu4JT0Lmq
         Vt4wng7hYVbFsjmFC2uqS3VGx4pKuxRH77t8dDa9wPO4kNHfrzqUrCI1+lAwHN//NwZx
         Xh6ydEjKu5NXOqo0DY1wrO3lzC0FgZQX2azjeY8Ut28u8i0Q934SaW+biLfHXdvJPHt1
         Q4wLKl3AWefuYh25e3+zvN9jadYMUHdQGATrGy3Nf60p7N7sGAtrbZWIFNg1opasG641
         5z1bezzsjZH5tsdeYNyp0KJX1adiAK98yJ+5Qg7+abZADn5MR15I0BJ74B9v3pGv/44D
         5e/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:mime-version
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=2ztBP1qMYf+hyScyFNcfBG006wJpY+Pb7WIehybbH0k=;
        b=CGkDmYELPfe2yRhruxVjRiTpKMYon7Zn3+GEOfl7lCpTR/yuwJltMYMGDoUyZ8yllE
         Mx0qV9EUGbe4ievEBbNHJDvhcAQt9Usj5bNxbqzUqrz419+Lh3nPNj7hSX0rUlXXaJur
         7RjYXL50hAonr9XOGs1bBPVb4liwWrw7wAmBXkB0EbnKL3k580NKrNbReMhUSWWV0lCe
         Jp//jGspGWl5sg1MTVDmXnVAj2sIap8a9ZxcEp+S0wLYKBU2VNwtXWDZlUPjqK1svuJc
         72ZaQ1BUF2haAV5Au0FFY7lSjdSXeQz9ZRw3aOtYzez/AhDjGRTjyI5eQ3p35uV4EnPJ
         VI6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PrAaoE8o;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id dy16-20020a05640231f000b004619e210510si3319704edb.150.2022.10.26.09.05.28;
        Wed, 26 Oct 2022 09:05:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PrAaoE8o;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234415AbiJZQF0 (ORCPT <rfc822;mathieu.poirier@linaro.org>
        + 3 others); Wed, 26 Oct 2022 12:05:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234389AbiJZQFW (ORCPT <rfc822;kvm@vger.kernel.org>);
        Wed, 26 Oct 2022 12:05:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC7604360D
        for <kvm@vger.kernel.org>; Wed, 26 Oct 2022 09:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666800320;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=2ztBP1qMYf+hyScyFNcfBG006wJpY+Pb7WIehybbH0k=;
        b=PrAaoE8okQb7FGQw5xA8Ka8DHqWTOZd3C1SiWlR+ixwSUnewDoihoWt6SMu0/gtq/EkPn3
        XMSv4Z3aXGBtfG7JECp7TloCReYw3ebCNiixXy+F/7CHWBs+5RM9pfWIh/CPf2ckPK2NSQ
        tePlgGwkjcwUvcqpqk49abT8bwQAf4c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-531-wWIqcFAwMfC_Tl7LnY9hrg-1; Wed, 26 Oct 2022 12:05:17 -0400
X-MC-Unique: wWIqcFAwMfC_Tl7LnY9hrg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BB2CC87B2A5;
        Wed, 26 Oct 2022 16:05:16 +0000 (UTC)
Received: from gondolin.redhat.com (unknown [10.39.193.29])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 2FDC1C15BAB;
        Wed, 26 Oct 2022 16:05:14 +0000 (UTC)
From:   Cornelia Huck <cohuck@redhat.com>
To:     Peter Maydell <peter.maydell@linaro.org>,
        Thomas Huth <thuth@redhat.com>,
        Laurent Vivier <lvivier@redhat.com>
Cc:     qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
        Eric Auger <eauger@redhat.com>,
        "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
        Juan Quintela <quintela@redhat.com>,
        Gavin Shan <gshan@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v3 0/2] arm: enable MTE for QEMU + kvm
Date:   Wed, 26 Oct 2022 18:05:09 +0200
Message-Id: <20221026160511.37162-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: rSK3y5VD8HlY

After wayyy too long (last version was sent in *July*), a respin of my
kvm/mte series. Still no migration support. I've been hacking around on
a device for transferring tags while stopped, but don't really have anything
to show, probably because I get distra- <ohh, what's that?>

...I guess you get the point :(

Anyway, I wanted to post this as non-RFC; likely too late for 7.2, but maybe
for 8.0 (and I'd get a chance to make at least pre-copy migration work; I'm open
to suggestions for that. Support for post-copy needs kernel-side changes.) Tested
on the FVP models; qtests only on a non-MTE KVM host.

Changes v2->v3:
- rebase to current master
- drop some parts of the qtests that didn't actually work
- really minor stuff
- drop RFC

Cornelia Huck (2):
  arm/kvm: add support for MTE
  qtests/arm: add some mte tests

 docs/system/arm/cpu-features.rst |  21 +++++
 target/arm/cpu.c                 |  18 ++---
 target/arm/cpu.h                 |   1 +
 target/arm/cpu64.c               | 133 +++++++++++++++++++++++++++++++
 target/arm/internals.h           |   1 +
 target/arm/kvm64.c               |   5 ++
 target/arm/kvm_arm.h             |  12 +++
 target/arm/monitor.c             |   1 +
 tests/qtest/arm-cpu-features.c   |  76 ++++++++++++++++++
 9 files changed, 256 insertions(+), 12 deletions(-)

-- 
2.37.3
