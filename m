Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp540577lfg;
        Wed, 10 Mar 2021 05:52:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxzgObC9Xo7fVobm+j+pg8JN93EPb+GPHeBX2vQcHgkVdC4hgJb3NxmhVxm1LQGNKP9GDVk
X-Received: by 2002:a05:620a:16b6:: with SMTP id s22mr2659926qkj.240.1615384367935;
        Wed, 10 Mar 2021 05:52:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615384367; cv=none;
        d=google.com; s=arc-20160816;
        b=xNj/H9onbi0CdLJhUnY4Kr3Ah5x2V69m12Oh6I1kohJRPRaQYQIisHa64VK2Y/lDKK
         edI74LZbODa5OJXGf1Lo7VzL6r/ELrBqaVaabtJDkfn+FmLP2asuvl1VE0V1kHrzcLFo
         mRbyBJhO+e6K7Z/Zto+8v3CCslApi4vSY5Bj92eb4PeLFydg07F4ignElQAik5tL+lYb
         bxwxKRhvre4trpD1muvhTzpHx0CKQi0d3yB/+eia6x6aTgoFzMbmTYWGaiOzKhopdHYY
         kZT0o+NRC/ZIr8uAYQJv/ON3Zf19H2ogU2TK6htX83WSo1PE07qNejHf99943Llv2Q7m
         mC5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=StBt226Kt7fXTeWANdGhuB8KhWOl5RPU656yhTVb7mc=;
        b=znsS+yrZopU2xHNna61MLrewg5PJcHggK4J2PJhHNhAHYNkWYIichwLYpxuG+Yisi1
         zGggHVmGrFHfCSfpTsBC2GoKmWWHrSidxwsCZAePVdWYDy/GhWx4ib3pmN0rzggjtI5R
         ALeVrkrp01VA7RB0WhVV78WRfzeRpzxm0wAU8354go314hgx+REHyv4a0MBkvNTMEofx
         6O4+cce2OLQDQISmc89e0V73Z+rv1oCqsnQF7sCdqR+dHcnBlC+7EgYvPJWcJwyuSGqR
         VGL8sxecgRTqQnTnpA2ch7nawNjbw4cAlBO1XSwR2uauXijc9Sa62/dxB9i/TEwEWFZL
         FeeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cMclypYL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n15si4015172qtr.307.2021.03.10.05.52.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Mar 2021 05:52:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cMclypYL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lJzGZ-0001Ez-85
	for alex.bennee@linaro.org; Wed, 10 Mar 2021 08:52:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lJzGJ-0001Dd-Q9
 for qemu-arm@nongnu.org; Wed, 10 Mar 2021 08:52:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lJzGG-00041I-DK
 for qemu-arm@nongnu.org; Wed, 10 Mar 2021 08:52:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615384347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=StBt226Kt7fXTeWANdGhuB8KhWOl5RPU656yhTVb7mc=;
 b=cMclypYLGhqn9PsQ98X8OzG0L1BZMOZL/9G1Vy5a+yM/SpV84dYQjmXENM9LFUxEDL5qtm
 b4H0Ok3FS0HYtMBXtGri/3U/JYnJpD7jMD2jkMrgvz+Ju4fwBDJsV4OKz16/vC0FPe4kVc
 q3s9Dv7gxMq7YuJwTm9bYTGMOOv+HBU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-gWoV6iRzNS28rZho9sG_ag-1; Wed, 10 Mar 2021 08:52:25 -0500
X-MC-Unique: gWoV6iRzNS28rZho9sG_ag-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C62D91005D54;
 Wed, 10 Mar 2021 13:52:24 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.193.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BAC8160C13;
 Wed, 10 Mar 2021 13:52:19 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 0/2] hw/arm/virt: KVM: Set IPA limit when possible
Date: Wed, 10 Mar 2021 14:52:16 +0100
Message-Id: <20210310135218.255205-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: pbonzini@redhat.com, maz@kernel.org, eric.auger@redhat.com,
 peter.maydell@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XpxKznB4nAgm

This series fixes IPA limit setting for mach-virt KVM guests. The
first patch restores the setting of IPA limits for values greater
than 40 (the default) when necessary. The second patch ensures values
less than 40 may also be used. The default KVM type=0 (which means
an IPA limit of 40) is still used for legacy KVM, since it must be.

I tested this with a KVM that supports KVM_CAP_ARM_VM_IPA_SIZE and
with a KVM that does not. mach-virt's memory map didn't allow me
to test with less than 40 on the KVM_CAP_ARM_VM_IPA_SIZE supporting
host, but a quick VM fd opening test seemed to prove KVM would be
happy with that. Testing was done with a typical Linux guest and also
with kvm-unit-tests.

I caught the bug that the first patch fixes by instrumenting QEMU
to observe which IPA limit was getting selected, and then seeing
that QEMU wasn't actually running mach-virt's kvm_type method at
all!

Thanks,
drew


Andrew Jones (2):
  accel: kvm: Fix kvm_type invocation
  hw/arm/virt: KVM: The IPA lower bound is 32

 accel/kvm/kvm-all.c  |  2 ++
 hw/arm/virt.c        | 23 ++++++++++++++++-------
 include/hw/boards.h  |  1 +
 target/arm/kvm.c     |  4 +++-
 target/arm/kvm_arm.h |  6 ++++--
 5 files changed, 26 insertions(+), 10 deletions(-)

-- 
2.26.2

