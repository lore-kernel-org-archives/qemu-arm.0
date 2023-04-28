Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp984067ejm;
        Fri, 28 Apr 2023 02:56:26 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4G6Lh9dYD/A5m+kNynmfFuRFNZtDec8vGGglkbEsGv3GcPPyIjseJiAQ1fM9ywLIPCvP0r
X-Received: by 2002:a05:6214:e67:b0:5ef:5033:f37b with SMTP id jz7-20020a0562140e6700b005ef5033f37bmr6250913qvb.41.1682675786324;
        Fri, 28 Apr 2023 02:56:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682675786; cv=none;
        d=google.com; s=arc-20160816;
        b=0neoQKmmGOYOhxluvoOaJoxijlAkbgEaDLOp7WtAogdzC7ilvJAmqcS4dBptzo8Zx+
         5Ff6AvbQOcrsvsYa5mgaEV+iJpdX2vHeL82WFDyFKYAlj+5WBZxYn9BAFLrMdhEA8dHV
         R7ZJ/RjCZtCvHTeICsH3qpm/jf2ZNZbyuXxypPEzZyFh/FZ4K5ilsCdUvPL+BLwmTAUh
         9xq5HoCXL5Cn8ld1pExx0jyq4RU/sFPOUq2zgXS00wVU14AOSzFNvRZ225d8x629UTeQ
         3PJdn93aYFCHAo8o3EpmMOKq61PYeBa+aHcfIkcLVAJ0XiF3ERFJqXjTl3W8lliR5Vs2
         hIDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=beGSlsM1YO7VmD2gFWs75nRL02r/305Ahmeskyo8oHQ=;
        b=CtKW9CHO/YS8iH1nq5WYjgiMNRsTPC0oh/XqREuOCKJjHAFYEmzhPqfmSQKFoeDxVS
         0pCU2taaoL+msrWAexrdPMO+8U+6+MKfGDnvwX5yjpfUP8Ri51TW73DFHRXgaMeJKIRv
         hwJ9tn3fCVyvDU0OQKnbsonINwnJCHbgwKAhlEt2My51BElFbx+mSoCJIsyc1yszbbJm
         +hKZ6tPh50b50SIHVtgfELzk+q5FWD41AKwyREMG3o4WLG4XMfSMYAtNYjIthpsT+ST3
         /WXbtahwu0YXyS943ZIE7k8ymm+2AKWvgkpeBQlmRNw/hzvyNd2awAnvnK/JWD6gY9ds
         WwUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GZMFmm1E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q4-20020ad45ca4000000b005e93ae81070si13570714qvh.77.2023.04.28.02.56.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Apr 2023 02:56:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GZMFmm1E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1psKpP-0006ZJ-0g; Fri, 28 Apr 2023 05:55:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1psKpO-0006ZB-II
 for qemu-arm@nongnu.org; Fri, 28 Apr 2023 05:55:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1psKpM-0001ai-S2
 for qemu-arm@nongnu.org; Fri, 28 Apr 2023 05:55:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682675742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=beGSlsM1YO7VmD2gFWs75nRL02r/305Ahmeskyo8oHQ=;
 b=GZMFmm1E52WuMYsXWl2O44lSGv1M/vXOZ0pABNthM/cN9hRqYi07QxjFPHsKYVZirGgScT
 KyTKz/uUqepl5vatt3UqBCz2uEcozpnLmTEZlPKhOtXdhokLWRIWi7GMl4zaPJMJ7l54Nc
 uG5BIKlCmyBSNzAYHT5ULpnaylVxvO4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-ZZNYkKpRNiuMLttegxqNmw-1; Fri, 28 Apr 2023 05:55:39 -0400
X-MC-Unique: ZZNYkKpRNiuMLttegxqNmw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 054CA1C0754D;
 Fri, 28 Apr 2023 09:55:39 +0000 (UTC)
Received: from gondolin.redhat.com (unknown [10.39.193.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 178FB1121314;
 Fri, 28 Apr 2023 09:55:36 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
 Eric Auger <eauger@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Gavin Shan <gshan@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Andrea Bolognani <abologna@redhat.com>, Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v7 0/1] arm: enable MTE for QEMU + kvm
Date: Fri, 28 Apr 2023 11:55:32 +0200
Message-Id: <20230428095533.21747-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: eZ7EJ6Y1YxBC

v7 takes a different approach to wiring up MTE, so I still include a cover
letter where I can explain things better, even though it is now only a
single patch :)

Previous versions used a cpu property to control MTE enablement, while
keeping the same semantics for the virt machine "mte" property as used with
tcg. This version now uses the machine property for kvm as well; while it
continues to control allocation of tag memory for tcg, it now also controls
enablement of the kvm capability. Since the cpu prop is now gone, so is the
testing via the arm cpu props test; I don't have a good idea for testing
mte on kvm automatically, since it has a hard dependency on host support.
(Should I tack some futher documentation somewhere? I'm not seeing an
obvious place.)

A kvm guest with mte enabled still cannot be migrated (we need some uffd
interface enhancements before we can support postcopy), so it is still off
per default.

Another open problem is mte vs mte3: tcg emulates mte3, kvm gives the guest
whatever the host supports. Without migration support, this is not too much
of a problem yet, but for compatibility handling, we'll need a way to keep
QEMU from handing out mte3 for guests that might be migrated to a mte3-less
host. We could tack this unto the mte property (specifying the version or
max supported), or we could handle this via cpu properties if we go with
handling compatibility via cpu models (sorting this out for kvm is probably
going to be interesting in general.) In any case, I think we'll need a way
to inform kvm of it.

Tested with kvm selftests on FVP (as I still don't have any hardware with
MTE...) and some make check(-tcg) incantations. Hopefully, I haven't (re)-
introduced too many issues.

Cornelia Huck (1):
  arm/kvm: add support for MTE

 hw/arm/virt.c        | 69 +++++++++++++++++++++++++-------------------
 target/arm/cpu.c     |  9 +++---
 target/arm/cpu.h     |  4 +++
 target/arm/kvm.c     | 35 ++++++++++++++++++++++
 target/arm/kvm64.c   |  5 ++++
 target/arm/kvm_arm.h | 19 ++++++++++++
 6 files changed, 107 insertions(+), 34 deletions(-)

-- 
2.40.0

