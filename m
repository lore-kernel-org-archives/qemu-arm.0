Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp6438878wrd;
        Tue, 28 Aug 2018 06:50:57 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdaELgDKNHJVQAZOZzcY4FzFox6wgHjT+T7xz1BAa7azYVk47yKNpJEZJisZPnPiZTB0Z1FC
X-Received: by 2002:a62:9042:: with SMTP id a63-v6mr1732704pfe.52.1535464257881;
        Tue, 28 Aug 2018 06:50:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535464257; cv=none;
        d=google.com; s=arc-20160816;
        b=wvlWE0Ga8CipxoBa0YuYDUa5IhaLi3YaGwumBqM0ABVbX8vX1j7wVsMimZoPv9ByZp
         tru2PLDlW5qhQEcj/OlSThd5j+MiVv7nCyHvvqjoai7Xu/uRDQEN4+Hab/FgNunh6UfI
         hZ1C97l/sYEkuONdG9xniWCpJ2qar7kfq7C3xKBMDF4/LmecTZl2rjpWLEDZL8N1EW2m
         3MLmXZzlvgTdUVjMIO6+FOnEPayuZU6FsGCOQZNEB9p4le/QhO33NcVa/YN9gh6542P0
         aB7mkCTOVWmEZCriXenNhU0srW74EPHVCVgquJK5OegBbjpizkNNUv9iCdhGfrpeCTRS
         Tdpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:message-id:date:subject:to
         :from:arc-authentication-results;
        bh=dBJr3/SY9OLTjfA1fC4+NKPErBenO/g54t1X5IxDhD4=;
        b=ShXf6upwmvg6oynqh2ydGj3fg3dtLNkcywqBVilc77sTyihCpqUYmqbRVrjKIk45+4
         g07HSB3TVyiDUQQxGWOGQak+paf2qb+BwJ1D99mqzoPjspxEGFNKa2UV6V9rxsSzCnbh
         SkXQgTAqay4xhXxfW8chkH/iQ3SD3fKIDF1YOoi3/c1/9w1f+ts69l97KTiEl9esqySF
         lBqwqgWTs2JZnfUHZB4FIbs3BHXERAbfDvg1Qv4UZRKCD3ldrGLgxL8lckozS8tXaTtr
         hfimb1c+LkIgcM+nku7+00/it5scI7xZI1DRtJyHiO15BZ3y2AjcYwEe/lelpGb8dxQT
         WJ9g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id g10-v6si1004613plt.468.2018.08.28.06.50.57;
        Tue, 28 Aug 2018 06:50:57 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727973AbeH1Rml (ORCPT <rfc822;francois.ozog@linaro.org>
        + 4 others); Tue, 28 Aug 2018 13:42:41 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:11609 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727725AbeH1Rml (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 28 Aug 2018 13:42:41 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 67E48EB291712;
        Tue, 28 Aug 2018 21:50:51 +0800 (CST)
Received: from SHA150392835-N.china.huawei.com (10.45.52.187) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.399.0; Tue, 28 Aug 2018 21:50:44 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <peter.maydell@linaro.org>, <pbonzini@redhat.com>,
        <kvm@vger.kernel.org>, <qemu-devel@nongnu.org>,
        <qemu-arm@nongnu.org>, <gengdongjiu@huawei.com>
Subject: [PATCH v8 0/2] add support for VCPU event states
Date:   Tue, 28 Aug 2018 21:49:13 +0800
Message-ID: <20180828134915.8744-1-gengdongjiu@huawei.com>
X-Mailer: git-send-email 2.11.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.45.52.187]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: wvrFO4VJndPt

Support for KVM_GET/SET_VCPU_EVENTS to get/set the SError exception
state, and support the state migration.

Now the VCPU event only includes the SError exception status, it can be
extended if needed. When do migration, If source machine has serror pending, 
the target machine is also needed to pend this serror regardless of whether
target machine can support to set the serror syndrome.

Dongjiu Geng (2):
  linux-headers: Update to kernel mainline commit 815f0ddb3
  target: arm: Add support for VCPU event states

 include/standard-headers/linux/input.h |  9 +++--
 linux-headers/asm-arm/kvm.h            | 13 +++++++
 linux-headers/asm-arm64/kvm.h          | 13 +++++++
 linux-headers/linux/kvm.h              |  1 +
 target/arm/cpu.h                       |  7 ++++
 target/arm/kvm64.c                     | 69 ++++++++++++++++++++++++++++++++++
 target/arm/machine.c                   | 22 +++++++++++
 7 files changed, 130 insertions(+), 4 deletions(-)

-- 
1.9.1

