Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1395053lfg;
        Tue, 25 Feb 2020 00:54:24 -0800 (PST)
X-Google-Smtp-Source: APXvYqxoZ7UGcRsWEOT+zXRlbq/JLrzeOTm8erONLvXV3xgEyD0exoHJRLGhe7Hhg0TM7wl0gOgF
X-Received: by 2002:a9d:6653:: with SMTP id q19mr44710924otm.94.1582620863931;
        Tue, 25 Feb 2020 00:54:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582620863; cv=none;
        d=google.com; s=arc-20160816;
        b=KJBSQqippN1RsJ0jUUhb+QcdpBbkgHZB1jjzxv8lYpACEVoP1B2KQu0vBo3Mwxro61
         JSynp02WG+LupfUmibeTOgcJU/KRRzutxSCbEbeDle4g0QvKDSlZDozLvKBlJr1WZWYJ
         qHIXh85lGvzH7TrSaultMyteRPdtFit90Z/hI7El2z1INvyCxiXlulmC1VEnNkUNN+os
         Ag877uajtQy1A6IWlnHPIwtTH3KvdpG8zrWGNBxklixI6/wxmypsh3EqgDNx+LlQOEh2
         80jVwe04M9grtKb7TXhQQsiQZhva2iXUmJlxyN6LfDSWwegyWxA6LJQ/MgwyUFe1EfTC
         lWyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dqnKylF5HFciLFPtzz1NDtnvwRMuPol2Wp3vrExVO8g=;
        b=nsSw9XCXdC0J3pnrZGRMPn8skGZS0fhsuiVsXyS6MbyGVl2AASKNwP4smFaouAcQ0r
         E1hzWKSgA5LqERFWzSSWJXOfwu0G6Oyu036SliwNYD+q3jhsRrsC3HIgG0aAfTvgbl9a
         cZtSXvdgKt7Qnjw4yy9M9W9Jma20xEkeTvdnzGoz/7iUs70q5N5C7t/fIQ6nZqSBp9JO
         6vV3q/JNG4pchea+Yb1IY3gHwQEZvz8o0p0IcD9p+CyId/Dt9BsIJrMYSmYS3yaGUT7i
         m9+LXjQ64Eh4XXAxBadcAJOOQp/N/s5PMQjg1APK8b3WxZgqtV/sbWiQ1qQigj13BzhV
         utCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="r/7xbz4a";
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id h16si7632366otk.193.2020.02.25.00.54.23;
        Tue, 25 Feb 2020 00:54:23 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="r/7xbz4a";
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729825AbgBYIyW (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Tue, 25 Feb 2020 03:54:22 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:39490 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729153AbgBYIyU (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 25 Feb 2020 03:54:20 -0500
Received: by mail-oi1-f195.google.com with SMTP id 18so8871300oij.6
        for <kvm@vger.kernel.org>; Tue, 25 Feb 2020 00:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dqnKylF5HFciLFPtzz1NDtnvwRMuPol2Wp3vrExVO8g=;
        b=r/7xbz4aNyNr6RwlvL1OOZ+M+zLNU9Cc+UexnSCQaVAj4vHZSufgfP+s8331MkLPSJ
         l84ei7nkwF35uRylrZJ2oRvbhoiqGrrbjTMnOlW4BawnB/99ZJdaDyBVllJAt5gw+XTf
         6LIhJnlf845GVqJ9gPYy2drqFQWq+Yjho3O//FMro753kBrwTpevhEQ0KdGwrh2GMqOf
         aW6HQWTpXqECuqBr/SRKdV7QPCFPFZiQVR9SOmkvGL63QkdSO200bd+Wy2SMBislYrN1
         e3x7+uLfaiEAJa0zBmnBBwq/rILbX1mtC/KuIY88Gs+SZTzlSSCjgxBnLnbFL9I7fbig
         tGIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dqnKylF5HFciLFPtzz1NDtnvwRMuPol2Wp3vrExVO8g=;
        b=p83DSMnilOAKlki/0H2mBnZteC2YYY/n0S0KqpJ38yWYAvdsgfAo0If1JSKqyb4a/d
         9ycgJBsjA565980L4KGnNB7X9dnby/WR91wPFAJw2z36lhACQPUk752o7/GXufbeb5xt
         RFxRxXMQbD/ghl4NfDtK3sTeNY4ayrA0DQIk1e2+uW6bU2o6j0Jdh0r4BA4E/76E1Xn7
         V3qceIV3f8fVacLsOLN1KaZ9eYWGBA+TvFJs4ax1idngJdNLfJS+OWqIlK8KLXVEm84J
         sxlew+4GnOWK0FT3pqcm58GfdZt7Le3K8U3S5y8ra0utgQgtqnSP4SIn6m6UEFlBNXw8
         kR8A==
X-Gm-Message-State: APjAAAWeCnM7aZSs5pcr0OWiwwhCet7vGjTqniaFqmilA+GQbCu8ABgJ
        n3GDvR0ZG/GIKnqVU/tWQxe76wdYrESF9yChGTGDwQ==
X-Received: by 2002:a05:6808:289:: with SMTP id z9mr2579495oic.48.1582620859074;
 Tue, 25 Feb 2020 00:54:19 -0800 (PST)
MIME-Version: 1.0
References: <20200217131248.28273-1-gengdongjiu@huawei.com>
 <20200217131248.28273-3-gengdongjiu@huawei.com> <20200225093404.0ee40224@redhat.com>
In-Reply-To: <20200225093404.0ee40224@redhat.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Tue, 25 Feb 2020 08:54:07 +0000
Message-ID: <CAFEAcA9zjoa48Mth5aaOnhjDyY_qyrg9Nz5=0YEa2aE_aFcCug@mail.gmail.com>
Subject: Re: [PATCH v24 02/10] hw/arm/virt: Introduce a RAS machine option
To:     Igor Mammedov <imammedo@redhat.com>
Cc:     Dongjiu Geng <gengdongjiu@huawei.com>,
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
        James Morse <james.morse@arm.com>,
        Laszlo Ersek <lersek@redhat.com>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Shameerali Kolothum Thodi 
        <shameerali.kolothum.thodi@huawei.com>,
        Zheng Xiang <zhengxiang9@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 1QvFoBrsPoga

On Tue, 25 Feb 2020 at 08:34, Igor Mammedov <imammedo@redhat.com> wrote:
>
> On Mon, 17 Feb 2020 21:12:40 +0800
> Dongjiu Geng <gengdongjiu@huawei.com> wrote:
>
> > RAS Virtualization feature is not supported now, so add a RAS machine
>
> > option and disable it by default.
>              ^^^^
>
> this doesn't match the patch.

Hmm? It seems right to me -- the patch adds a machine option
and makes it disabled-by-default, doesn't it?

thanks
-- PMM
