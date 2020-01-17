Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp9654195lff;
        Fri, 17 Jan 2020 03:09:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqxDRPGWvAd4nEV3kqELmHbhgCD+wvo3Q/anTOCgZIwv9DbTekzxZZ1Fi3lJ1RNTxT17h8fT
X-Received: by 2002:a05:6830:1198:: with SMTP id u24mr5501368otq.215.1579259361648;
        Fri, 17 Jan 2020 03:09:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579259361; cv=none;
        d=google.com; s=arc-20160816;
        b=snM5OqgI4/wKd5Amb5/nQfF2e+seJAW4ZC7lfagDySVAnMapw8DAw4Hv9Qm/9uUIh+
         rsEp1Ph9u4caBcRmgunxigXXJmncp6bA8YFkH487wT4Q/tWbondlBOsudMyTyR6RVREb
         XMi2XRj6DZ57yIqDn2viq6B5n8V3Urn/fyDLShz+BVvDW3ayr3J8T/JPh2Em1+AvlmDB
         NAGTh2OG8N8GBkZKxAlz8Y+xEiDZajW29DgSCzMqD2Sfm9qiPHZ6kGDrZ/MeQz0q5pxW
         sRmJzHTiJRzbLpHTSOmYPnFJrHJ3IRXKVZ3SxB2pEddKPGv/CjltaBt0xkdx5Stvp42h
         icOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:cc:to:subject
         :message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=gbXB0P9QCutfJwh5bxSt0gaR/2MQOgUW3YIPDErTpMs=;
        b=NUltHu6YkbTQPZRr8vKHdEoeiXYIeT2OpEiVRMVHuqg9QwsErTGVlSRqcXWDj6JFzl
         vW71PHsPm4z5WgO7mzWi14/nc3YZtWS9c11b1ZqdcUkXEu88w41XXtgBZocWzAcF0xmY
         vqEksfffJUXiQJvwMDfg9qHAZf8tHiFQXS4SWTBxBa4s7FbSZtdTrXvuJVukj2LI2huK
         ciOXtmcZUGZXsOdtJGSbp4Nn5r7OVd9BEPrpN5cJXuuONLNHybcV5GcnvzX2ISswRfyY
         p3FKsjkQzq/vHY90YhhjEnehd+GP6f4+3wQo9hi10yhNxHohyGw9vhy7N5i61gudo7il
         A1Fw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="i/hObo2C";
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id x26si13386370oie.73.2020.01.17.03.09.20;
        Fri, 17 Jan 2020 03:09:21 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="i/hObo2C";
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726897AbgAQLJT (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Fri, 17 Jan 2020 06:09:19 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:45345 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726343AbgAQLJT (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 17 Jan 2020 06:09:19 -0500
Received: by mail-ot1-f65.google.com with SMTP id 59so22192292otp.12
        for <kvm@vger.kernel.org>; Fri, 17 Jan 2020 03:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gbXB0P9QCutfJwh5bxSt0gaR/2MQOgUW3YIPDErTpMs=;
        b=i/hObo2Coyw6R1RMzadNOZCcC7uqZBLv1tLHojzXwWVXlWPg+lHfFAI3SjUrXNVGim
         mJcvP8AhEsxcr10M0xVv5oz5X5aeohzpyQUiOSKQH09p58UclcGBmqjw/BMU0ib5GmBR
         Gk9ytDH+R1SxqVrtsl53fW9GeRFbfrPxN0Bfs9tYuTRkNwfi+hXTAk1sv//ISPzmzRJB
         mR3TzsTH7nY0pc8TbkP0t/M9dusljyONZG+hWSyve2mcj1WWXfEYzusZQQ1a5uLxgW2G
         UfHU99CjEap0U7FxFGEj38TEv5DzS4Qp1dvTHkCuhNUrl9HLAuNGM7vX9stXAtGtrPdp
         eZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gbXB0P9QCutfJwh5bxSt0gaR/2MQOgUW3YIPDErTpMs=;
        b=K5ikI6TLyrMZUiN1Mw7nJ3Y+TBAtQBm8D+yWIoIHFJsKZW9an3XZl6ruVB1PZ+oZNH
         hU+nga58Z4yqSS+oQBsm8xx1ARBU/D48l0QDGV8AdaabKigWOAeguYMDcz+JahefFUuF
         kWRaJ0laWbFpoE6sLhcqHEsgnexkdOx62pdS8C5khTk8F6j7Zo5uqxZwmJl2tlnF8vLg
         sU8/Y/YosaQ3CuvLTVTf5JlBQcfOG3XuYf8mJ4NJ41nqYBERzp1ANoGUjpjqvRGY6QpR
         75BzO3ImyzxxRaiTIr8oGqMWp73sNWZeXTUNm36Z9Rbl558d5jaGtc4IqF8FBVsCVRzX
         xwdg==
X-Gm-Message-State: APjAAAWemiAmgbSaTFoGD1r7/4ZJB0CPW72uEgi7zz3esQFlwNz0D15m
        apkFmPq3cOorbgyVX2ODQfKL8IcnOOE2TgTWldusWA==
X-Received: by 2002:a05:6830:4a4:: with SMTP id l4mr5710541otd.91.1579259358567;
 Fri, 17 Jan 2020 03:09:18 -0800 (PST)
MIME-Version: 1.0
References: <1578483143-14905-1-git-send-email-gengdongjiu@huawei.com>
 <1578483143-14905-10-git-send-email-gengdongjiu@huawei.com>
 <CAFEAcA-mLgD8rQ211ep44nd8oxTKSnxc7YmY+nPtADpKZk5asA@mail.gmail.com> <1c45a8b4-1ea4-ddfd-cce3-c42699d2b3b9@redhat.com>
In-Reply-To: <1c45a8b4-1ea4-ddfd-cce3-c42699d2b3b9@redhat.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Fri, 17 Jan 2020 11:09:07 +0000
Message-ID: <CAFEAcA_QO1t10EJySQ5tbOHNuXgzQnJrN28n7fmZt_7aP=hvzA@mail.gmail.com>
Subject: Re: [PATCH v22 9/9] MAINTAINERS: Add ACPI/HEST/GHES entries
To:     =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc:     Dongjiu Geng <gengdongjiu@huawei.com>, Fam Zheng <fam@euphon.net>,
        Eduardo Habkost <ehabkost@redhat.com>,
        kvm-devel <kvm@vger.kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        QEMU Developers <qemu-devel@nongnu.org>,
        Linuxarm <linuxarm@huawei.com>,
        Shannon Zhao <shannon.zhaosl@gmail.com>,
        Zheng Xiang <zhengxiang9@huawei.com>,
        qemu-arm <qemu-arm@nongnu.org>,
        James Morse <james.morse@arm.com>,
        "xuwei (O)" <xuwei5@huawei.com>,
        Igor Mammedov <imammedo@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: To8jDaBnkdo5

On Fri, 17 Jan 2020 at 07:22, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Hi Peter,
>
> On 1/16/20 5:46 PM, Peter Maydell wrote:
> > On Wed, 8 Jan 2020 at 11:32, Dongjiu Geng <gengdongjiu@huawei.com> wrot=
e:
> >>
> >> I and Xiang are willing to review the APEI-related patches and
> >> volunteer as the reviewers for the HEST/GHES part.
> >>
> >> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
> >> Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
> >> ---
> >>   MAINTAINERS | 9 +++++++++
> >>   1 file changed, 9 insertions(+)
> >>
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> index 387879a..5af70a5 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -1423,6 +1423,15 @@ F: tests/bios-tables-test.c
> >>   F: tests/acpi-utils.[hc]
> >>   F: tests/data/acpi/
> >>
> >> +ACPI/HEST/GHES
> >> +R: Dongjiu Geng <gengdongjiu@huawei.com>
> >> +R: Xiang Zheng <zhengxiang9@huawei.com>
> >> +L: qemu-arm@nongnu.org
> >> +S: Maintained
> >> +F: hw/acpi/ghes.c
> >> +F: include/hw/acpi/ghes.h
> >> +F: docs/specs/acpi_hest_ghes.rst
> >> +
> >>   ppc4xx
> >>   M: David Gibson <david@gibson.dropbear.id.au>
> >>   L: qemu-ppc@nongnu.org
> >> --
> >
> > Michael, Igor: since this new MAINTAINERS section is
> > moving files out of the 'ACPI/SMBIOS' section that you're
> > currently responsible for, do you want to provide an
> > acked-by: that you think this division of files makes sense?
>
> The files are not 'moved out', Michael and Igor are still the
> maintainers of the supported ACPI/SMBIOS subsystem:

Does get_maintainer.pl print the answers for all matching
sections, rather than just the most specific, then?

In any case, I'd still like an acked-by from them.

thanks
-- PMM
