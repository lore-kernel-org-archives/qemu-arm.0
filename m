Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1345222lfb;
        Thu, 14 May 2020 05:55:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtrBpHMzetiJYM7bXRQU8gjuLnUp5S1MYoKZwSWH/BOGNmeZBTTNJw5vGukwYCeLMw8lLM
X-Received: by 2002:a17:906:19d2:: with SMTP id h18mr3864839ejd.147.1589460908539;
        Thu, 14 May 2020 05:55:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589460908; cv=none;
        d=google.com; s=arc-20160816;
        b=MFA3Uf3ICTVfrk3s65jzsLt13sb4ENcuHtMYoGOkBymD0qdlfsnKltZxqmn78Bv5N7
         XBpLmv07W8jJKDxdooJs+sNtSjZkjhGNLY1wLKKSFgZh6Z6j5cYePQhCXsTUkacKQqL5
         kQHUhT1cTe+OM3gqLdUydf1lM5xAGTHN9Lyl7yopwXvK/SxWhKzrRn012z6aOm2f0nsT
         HwwMrm1oRz9u9fjoVK2DNIGGlZzROl9wkmDiQzGdD5/KNLNcHWpciUCGGYYgRe3E+Bcf
         /w+amVzszniJ6HfHf509Wsn00rhshea6HGWw8IPlTtbPD9DxI3xjhyS2g2Nm0n/FWZ26
         HhlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pgtt5Vf9zWMqvz7dLR73SNJzPhJc8IatImZjfB7FsGU=;
        b=T8VxQCqMRpw3g6SfC49aWEN3m5iIuObT6f6ow0mSCmjjk+4YWW6qbIlT/RSSvPf/Uv
         GHOi+ovSHK583fYQj524R5OaDOSc83iQYHnwdwZYLd1gUsseGXRoCXB3viIOPrdzQ5+4
         r+ak70loHr8A/yVfnGrTaAI0oR8eEwiMYreI1DPChMN07/XwGPLy+zP2xTZwFJj4DLSp
         oeoolDkhoNCsIHgt9Dpo307pf5G1lYmSKQlzX2cIzQ2lqiVV/W9UjLtsLHF8mvTTmVHj
         v3+qNiDj6048LPDLBJvt9DmMUYmlNmoFxYrOCoSNXbeNr11Pzk+XSFeoFB2JBttXkFsj
         zpQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dggdq2I5;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id z93si1526791ede.208.2020.05.14.05.55.08;
        Thu, 14 May 2020 05:55:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dggdq2I5;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726304AbgENMzG (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Thu, 14 May 2020 08:55:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726117AbgENMzG (ORCPT
        <rfc822;kvm@vger.kernel.org>); Thu, 14 May 2020 08:55:06 -0400
Received: from mail-oo1-xc43.google.com (mail-oo1-xc43.google.com [IPv6:2607:f8b0:4864:20::c43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED8DDC061A0C
        for <kvm@vger.kernel.org>; Thu, 14 May 2020 05:55:05 -0700 (PDT)
Received: by mail-oo1-xc43.google.com with SMTP id v6so688712oou.4
        for <kvm@vger.kernel.org>; Thu, 14 May 2020 05:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pgtt5Vf9zWMqvz7dLR73SNJzPhJc8IatImZjfB7FsGU=;
        b=dggdq2I5kB1qHEbRhH2y9FUFYmA+BcYOSxAv16sQgM+lRq4O3JlNWCeSnTddckGwwE
         yEDtiE9UluJTDFoixXn2SdrNmfMmAIULxwH32X7pNSLbbfTBIV6oeOkQchO+ofon9WO/
         zr9FSOej+NjMsr3VaLJP5wBrbH5nyxH6LBwWmkeTf5AxSc6rfPluyFKBqqtT+A0Z7Fb1
         C+1vu9hM5aBRZYmMcwDF/OkzUMfkhcv9UEXD/YYu9as+fTDejbQN8YIkTMG4C3mRBBjn
         JX3P7h3vgte08GxfIcc4ZtZEyKKUvGEJ63bpm2O/yIi2WtCyCiHcrM0hEiZ1y0VK/PEw
         BeFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pgtt5Vf9zWMqvz7dLR73SNJzPhJc8IatImZjfB7FsGU=;
        b=P29mOzDGaeu13dhrMwAEfex3HSpNGP/is2QDY9ODDg82UKKsXjI5nV67VMnAJt+uJ0
         XEmqglLnIpsnxQsah7xYVsrXjEWq2e8Kpl8yobbXucdfGQarxyfiZGzSqjjEl8IuLEev
         T65X9v9s3Oydvmn9tGDLKv4DE1aJdm+NBeNgLVbd+MRzqgD4eawyP/RpGbcJqMLlqXUb
         JzPl0N/U2kYGId8/gUArxhF0Y/2q1cIa5qgO7q6rEbXHZ5mnhzLZlElQj0CG4Eguok1k
         C5Aynh+WC1loWq81QYyEcrTv5jXy2x6/fyW2sLe+cD9w6awlPDQ6F4Zj+vKzGPUWifLx
         nIaw==
X-Gm-Message-State: AOAM531hA2d+FPQ4Nxfj93lpp0oz4npb9ECwxAH24NdibpjEAmtk3KJ6
        Oposixko6uy1H0SzM7OIoysL6iciQOI6W3XCuTKcxA==
X-Received: by 2002:a4a:d136:: with SMTP id n22mr3413007oor.85.1589460905312;
 Thu, 14 May 2020 05:55:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200512030609.19593-1-gengdongjiu@huawei.com>
In-Reply-To: <20200512030609.19593-1-gengdongjiu@huawei.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Thu, 14 May 2020 13:54:54 +0100
Message-ID: <CAFEAcA-=pVwNXR0mqCBX1MRkzTOzxOFF_caxYSsCbiA_bq4OQA@mail.gmail.com>
Subject: Re: [PATCH v27 00/10] Add ARMv8 RAS virtualization support in QEMU
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
        =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
        Zheng Xiang <zhengxiang9@huawei.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Linuxarm <linuxarm@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: Z7Cn0Wq3/Fqi

On Tue, 12 May 2020 at 04:03, Dongjiu Geng <gengdongjiu@huawei.com> wrote:
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



Applied to target-arm.next, thanks.

-- PMM
