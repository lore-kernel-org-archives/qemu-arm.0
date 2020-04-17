Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp479055lfm;
        Fri, 17 Apr 2020 06:32:42 -0700 (PDT)
X-Google-Smtp-Source: APiQypIL4bRgQPwnzwIKERpyEGFjO7xcsxOkrnZ76m/3KLXcBYV+ZcYZivY0aGkAM5L3tsmUdDzj
X-Received: by 2002:a05:6402:129a:: with SMTP id w26mr2928141edv.254.1587130362302;
        Fri, 17 Apr 2020 06:32:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587130362; cv=none;
        d=google.com; s=arc-20160816;
        b=YvxppBXgm4Y0ORotBQ2Uf8JLeiHbSs37CNNLigjPWEFVaVGQuVepV07Lj2sHprJmC9
         UEkbPGRAWk8fuwWg7bJq3WbLo+4U3uY+4T4Gm5jyw8cjBBwKnKyElWfEo1xUcRXRITtZ
         TAUCN4ilu+41IKW2bwhmhhaggjnMRq3iGJcKqHZGK4+V6sD7Y+vT9KAAAbuVqT6dEf4s
         9O1AezHYDYS6wmKaZ/EKGa3OdyG+nhv0A1a9RCvMQwFtzs9EMgpwkQmuhwvo3gzW+x8y
         PgvrtWU+AgW+G9iCB/yMudy55pUR6tnWiVhsSvQw7grl7BXjv2GJ0qT0bRO4dtiRX2bE
         jtAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fwc+6Mwwqh7DLXhvjwR3QXK3J1CjVqSulYYfvjFl8X4=;
        b=HluggYO70P+G4yEhEMrs4LlI+dWPYY1lQXu0Vt6XJs5DVZaAGdPwj/kGi+HQn1XH3i
         euLQHPKFtd0Fz/yfAobVPDYSiCGnlpBoTqzREUF/MMdkorQKVbfrz0prABi5bi+83p5g
         9K8UiJQBkQ/Uh6/mMeZwV2mgqYpC7+EgY+YwvLjBXclcfaxDiN4F2RxkOjDJRm4DbPMM
         U/8q5oCukI9whYqpHq7YgSIamQYIpeGhiZ++vDz+pmuq+uxiGGR2Kp2aOhjueyow7MjS
         tDloxCKddOewOpZSN16KUbRoPM/1xoJCJs/nr+Gnpyk/OutfY/ufV+NeUPDVfmWOJIjy
         Hg6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XC7Yj10K;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id p5si14713170edd.220.2020.04.17.06.32.41;
        Fri, 17 Apr 2020 06:32:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XC7Yj10K;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730693AbgDQNcl (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Fri, 17 Apr 2020 09:32:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730351AbgDQNck (ORCPT
        <rfc822;kvm@vger.kernel.org>); Fri, 17 Apr 2020 09:32:40 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67AD1C061A0C
        for <kvm@vger.kernel.org>; Fri, 17 Apr 2020 06:32:39 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id i27so1399478ota.7
        for <kvm@vger.kernel.org>; Fri, 17 Apr 2020 06:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Fwc+6Mwwqh7DLXhvjwR3QXK3J1CjVqSulYYfvjFl8X4=;
        b=XC7Yj10K2YbNqP0Op42aczXxU2SVnP+I7j8RdrbXcaV5FrlnBhYCcPR0Sh738Wvr5G
         tX+0dH039S9FzwTiVSAsytcPCgzUcYYm76hyTG7zlmnv6059MBXCWiSawyE613uFITUK
         ZjhDl5JN181/yMQnE3hRDxqu0FTU8O/CDjX7fWz9SWilP1NDaMfgOeUgjWSZEmSP3dMw
         Q9TRLPFoewDvArnMtORImP9bSQsuGI99WIpd7zmv4XR6st2uUAKY8ji0FcfLFxqW/VKA
         wA5BW8HHlVZciS8/OWB8pkWP1SPZK7hKLzZQXE5RaM4lD6B0zmaViU50kAkIbzOlT7rU
         4zgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Fwc+6Mwwqh7DLXhvjwR3QXK3J1CjVqSulYYfvjFl8X4=;
        b=QwkNuHzjP+lxFKFxdz85y9S5K4C8I/tLoiIyOt6P8tHc0tOLayUx64ao7j1Fh8jAXO
         0+rpQeLA2oaMIJ17VV+6bvSU3rPun+hgD8KijFEKiEFXGe6XqcPnkl0r3NsQJ34dERXC
         HzwIA16Otgj84irlnKYx7q1f0/ix3KOv1gMOXTHVsnWahQVMrK9A2THmPDwMgYWLqe+n
         ihhq0jBm20H543O/xjY8J2uS8vKNtx6vabdZCOpgwPPs4dv3dCCEYgK69s0inKb5O+1X
         63BGvtzXagUL72p7OhpUGa1KFQ84ePzmEUn92b2zisIzIuV+dYrX+yXDDNXrV2+I7NO8
         sw+w==
X-Gm-Message-State: AGi0PubYIoSNP1e7CTXGdJth1f2lxZbVPeKFpsw9TByhNNoMcOcQ1vPj
        ofTDH06rbNNwK9dZx0/Is3kJzdlTCe5NS2S35wDiMA==
X-Received: by 2002:a05:6830:1e4e:: with SMTP id e14mr2492560otj.91.1587130358818;
 Fri, 17 Apr 2020 06:32:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200410114639.32844-1-gengdongjiu@huawei.com>
In-Reply-To: <20200410114639.32844-1-gengdongjiu@huawei.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Fri, 17 Apr 2020 14:32:27 +0100
Message-ID: <CAFEAcA9oNuDf=bdSSE8mZWrB23+FegD5NeSAmu8dGWhB=adBQg@mail.gmail.com>
Subject: Re: [PATCH v25 00/10] Add ARMv8 RAS virtualization support in QEMU
To:     Dongjiu Geng <gengdongjiu@huawei.com>
Cc:     Igor Mammedov <imammedo@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
        Shannon Zhao <shannon.zhaosl@gmail.com>,
        Fam Zheng <fam@euphon.net>,
        Richard Henderson <rth@twiddle.net>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        QEMU Developers <qemu-devel@nongnu.org>,
        kvm-devel <kvm@vger.kernel.org>, qemu-arm <qemu-arm@nongnu.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Zheng Xiang <zhengxiang9@huawei.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Linuxarm <linuxarm@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: mIoxej+/H4u6

On Fri, 10 Apr 2020 at 12:46, Dongjiu Geng <gengdongjiu@huawei.com> wrote:
>
> In the ARMv8 platform, the CPU error types includes synchronous external abort(SEA)
> and SError Interrupt (SEI). If exception happens in guest, host does not know the detailed
> information of guest, so it is expected that guest can do the recovery. For example, if an
> exception happens in a guest user-space application, host does not know which application
> encounters errors, only guest knows it.
>
> For the ARMv8 SEA/SEI, KVM or host kernel delivers SIGBUS to notify userspace.
> After user space gets the notification, it will record the CPER into guest GHES
> buffer and inject an exception or IRQ to guest.
>
> In the current implementation, if the type of SIGBUS is BUS_MCEERR_AR, we will
> treat it as a synchronous exception, and notify guest with ARMv8 SEA
> notification type after recording CPER into guest.

Hi. I left a comment on patch 1. The other 3 patches unreviewed
are 5, 6 and 8, which are all ACPI core code, so that's for
MST, Igor or Shannon to review.

Once those have been reviewed, please ping me if you want this
to go via target-arm.next.

thanks
-- PMM
