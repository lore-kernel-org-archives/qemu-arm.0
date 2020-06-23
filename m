Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3923169lfm;
        Tue, 23 Jun 2020 02:06:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyt4keHywuHQVLGmNlCSqreN/XCLV+fM/qAQq/zgLFwWvt74sEtcfVX6mZAgoYmriZYYgH1
X-Received: by 2002:a50:cc8a:: with SMTP id q10mr15467881edi.257.1592903193030;
        Tue, 23 Jun 2020 02:06:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592903193; cv=none;
        d=google.com; s=arc-20160816;
        b=mMCfh7HVeTVW0YHxTuBgSA2XAHmgYs0f5Oa/LHKzFNZRNsRNXw0B/L0xrWTefTpdIc
         Rnot674b5NqEdPH78mgbR2ADJ1XApj4LMPdMQoBMvB6YydZ9nFIidX9w1gPGuNTL130v
         dkiLYMC0GfLV246oc9Xi8qBrHnPIMjofvvYc3LAfpBUm+q1p0ERGgn2te2DgBOHXW9Aj
         nGfEUg8wMCmx7xiRcsDINS6YGu3oxyYG0HeWmUBuG1gUz40Lhi2tOH3Xec0lmN+PgxcO
         HM6uMqe7JFv3AeXueqsNI1UsQmZokMMSat5IvfTy5KzjdVVLXO/iB49LCL+1NmIdeWyF
         sTXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=2m2t021fPmocAk1w7rK7jsWgzV0rCiGfOdB2/ye3op0=;
        b=hR8z7blhEp0bZmArde1zcC/NnQUdX2vrK8KKDsaxb+AEk41LCxh8gNJZEYnOV0+8kB
         uWCqs7tOpBXDfIqfwKywYSUW1tjomM/K8YtjqevzFcTQgcpdG/34Q4N6wfZYRAMVXh47
         CJ7FRGkjDtkbMhlX+cBpemJwgvFNI711rX637Wantd2PJtQRCrRBsRCeN9qN3TRnR/mx
         ed7F4hOvcs/O5dERuSyvBZsGhWwtEeuiA7xzPFTKYxW6+5vrKbyxafXYjvnCnVVlZlgm
         t7Oq0fNvvB663aQPyqRzurazjTqgWDeLdyIFQEoe2dvkkICcepypkf3T9GJ3KLhpJMF7
         wN9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Z3WPbkWa;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id sa14si10616674ejb.297.2020.06.23.02.06.32;
        Tue, 23 Jun 2020 02:06:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Z3WPbkWa;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731887AbgFWJGb (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Tue, 23 Jun 2020 05:06:31 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:41875 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1731853AbgFWJGb (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 23 Jun 2020 05:06:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1592903190;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:  content-type:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=2m2t021fPmocAk1w7rK7jsWgzV0rCiGfOdB2/ye3op0=;
        b=Z3WPbkWa0GYOkXZrKU+fTLtQfh/G+LQZweUSyTp/qomHywbrBC5UrxLh2cqApqwAMBV/3h
        NyYKDvU2mcQeuj1RzKHmqeSw6vaYrclqUcSyTs07KeiAgsUXso55j+Cyhe1hIZOes5kByT
        y/Gfy5npXwqTLlG0m+Dz//8YqcwOVuE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-T0zFWbBlPtu4sQnB7G7MKA-1; Tue, 23 Jun 2020 05:06:26 -0400
X-MC-Unique: T0zFWbBlPtu4sQnB7G7MKA-1
Received: by mail-wr1-f71.google.com with SMTP id y13so1388798wrp.13
        for <kvm@vger.kernel.org>; Tue, 23 Jun 2020 02:06:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2m2t021fPmocAk1w7rK7jsWgzV0rCiGfOdB2/ye3op0=;
        b=Kxzq9TFWi9lUTNr8UdZE58C02WmGuerKUur6+ncKHZIa6nYNBDL7pOYOT0iFH2qm4Z
         ZGwZC4HWKuQgsSBM1OHHHulXNgFNNKSdR1DuL8+WUUd7wb/Z9RXdZhxARb3JfYYBzVMj
         qTE/XzxRCL3F9JKj/RNFyZcbBzzzGbD6KAwutDltAzhnjx3OOEYxUULFfxozK8jWEdn1
         0Qp+w9MxZBVNPzrg9ZEqS8qPZcG2QKKkCWud+vASlYIZAY4yFHUtHlREATHQky7RPqCA
         6iHpqTEXt6OJJ/oP0gx6HBpQ5FpWSQXo0RP37mRnjNqGgS0aInMxvp5v2eUgIzrhOFjN
         BpMw==
X-Gm-Message-State: AOAM532ykM8i+dRaJ623t7FOFphSyBOLT2Ubkhfchou7zT+N1HGPZ2eB
        W/Wkn6iVtCXYd/ux6kBYCPZk8cgxvDccMxgDN/X9/D44+YN2A0Yc5ikJXPwj7WbPPXW2MjS/rFs
        cpNNpb8D1WX4y
X-Received: by 2002:a05:6000:100c:: with SMTP id a12mr11437348wrx.81.1592903185144;
        Tue, 23 Jun 2020 02:06:25 -0700 (PDT)
X-Received: by 2002:a05:6000:100c:: with SMTP id a12mr11437320wrx.81.1592903184970;
        Tue, 23 Jun 2020 02:06:24 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net. [83.51.162.1])
        by smtp.gmail.com with ESMTPSA id b19sm2951554wmj.0.2020.06.23.02.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 02:06:24 -0700 (PDT)
From:   =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To:     qemu-devel@nongnu.org
Cc:     qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
        Andrew Jones <drjones@redhat.com>,
        Laurent Vivier <lvivier@redhat.com>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v3 0/2] target/arm: Fix using pmu=on on KVM
Date:   Tue, 23 Jun 2020 11:06:20 +0200
Message-Id: <20200623090622.30365-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: +gfPuS9W0aZR

Since v2:
- include Drew test fix (addressed Peter review comments)
- addressed Drew review comments
- collected R-b/A-b

Andrew Jones (1):
  tests/qtest/arm-cpu-features: Add feature setting tests

Philippe Mathieu-Daudé (1):
  target/arm: Check supported KVM features globally (not per vCPU)

 target/arm/kvm_arm.h           | 21 ++++++++-----------
 target/arm/cpu.c               |  2 +-
 target/arm/cpu64.c             | 10 ++++-----
 target/arm/kvm.c               |  4 ++--
 target/arm/kvm64.c             | 14 +++++--------
 tests/qtest/arm-cpu-features.c | 38 ++++++++++++++++++++++++++++++----
 6 files changed, 56 insertions(+), 33 deletions(-)

-- 
2.21.3
