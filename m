Received: by 10.223.159.74 with SMTP id f10csp5389731wrg;
        Wed, 13 Dec 2017 10:12:27 -0800 (PST)
X-Google-Smtp-Source: ACJfBovsl1bIwEsznVQ2AMr0Ulru+mOFli/eVgvURL2SLZs8nTzpRHOHarXzon2hKMeJ/PQ2RZ0F
X-Received: by 10.101.96.138 with SMTP id t10mr6191672pgu.335.1513188747650;
        Wed, 13 Dec 2017 10:12:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513188747; cv=none;
        d=google.com; s=arc-20160816;
        b=v7F3Dlszon+01MAAkc/Dqd0eKH4oNvzWrOP0W9kPeh8gL0v7OTqf2duZPzybk+Lm9z
         SB95CuMXMhmGiVTcVyEwa7YZozlsdbYnpqf7k7ffLcsCU1FrRPm6aYO193LGRs8uKPuV
         a9duZDjei9STKuO+3XiajkbNG47rhompiqpYjhGVw76jwYQ4KLmWBzDDwcg46Uk7r+kK
         lP6IQz3/EhWqSkYI4JwNMb4dIYwFM5yG+hwqmlONz4bkPBBeeVFWnA2YjibgYKxgRtmY
         Hs1zKmMSytFXTJQHDUT98D6DUuaVj9etWbJhlyls5fTiWprFeryn56xOuiANu78nlrKx
         H5zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=1Vu4sVj73OMJonS7t5gnFWkCQxhqUi+61rtB3rceV08=;
        b=M6N9Y+m+NGG07k0QsScT2au9DoGialTET5gfvPVOHIVtgOgDKWLwYah8aL8Alrh5Uz
         BRw3UWe5PcigA6CV1/oZZqKoTCE8GAinNXPhFxN/x62DODcm9KVxtPrwxviTKgkNhnAk
         X2UwZ6xsbK27e86VQ3ar18U82L4tdpb8Ij6e5/aqvqfFYB0c4NvgwxT5Vuknp2NLQyGO
         kHqzgR78CR78TfxYRGsL/N0PReGAvWD1g5EMpEup1aL7Gk/93HCMUoAmJJusWs5S5cDT
         ftitwvezJnIeWhH8/cwGdFqEkuJWkqPItoXW7uO2zwXskTPvqZFQtD2yA6+ofpHJiHK3
         JkQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ez4lzNT0;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id f1si1712550plb.751.2017.12.13.10.12.27;
        Wed, 13 Dec 2017 10:12:27 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ez4lzNT0;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753130AbdLMSMZ (ORCPT <rfc822;francois.ozog@linaro.org>
        + 5 others); Wed, 13 Dec 2017 13:12:25 -0500
Received: from mail-oi0-f68.google.com ([209.85.218.68]:38749 "EHLO
        mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752175AbdLMSMY (ORCPT <rfc822;kvm@vger.kernel.org>);
        Wed, 13 Dec 2017 13:12:24 -0500
Received: by mail-oi0-f68.google.com with SMTP id s9so2167917oie.5
        for <kvm@vger.kernel.org>; Wed, 13 Dec 2017 10:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=1Vu4sVj73OMJonS7t5gnFWkCQxhqUi+61rtB3rceV08=;
        b=ez4lzNT03A3TdPQuAclQ9GoMI/FnayyD3W1dOMdWJXs7PjCpxWSwjJISB7hktDbPd6
         W2l+1Ba4q3mqReD8ROUNppWJ/J63ApB4IGlep7Xo4KJVNlfDZyFIyMEjvV/5Z/RoeSsT
         0LKPYD5MG9ZXc5JS9AVRz37U5uQfaPcWIz3ak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=1Vu4sVj73OMJonS7t5gnFWkCQxhqUi+61rtB3rceV08=;
        b=QE8NFec49KYarDcdzB7u6P7wUsgBE8UaNezOjpoBGnCA7Eyd4hClfyT8fN+gb9cNwR
         0JdQQWZD3E9ouiUGCrfco02qZS6LPFNO0bMHdM4sgT/867yMsHh5JoFPfJ7YVQVRGOho
         4b4BwCkuFbhDqFXpE7FW09BpY8/uWwjIYBXXiq0rJty9zKWkb3ShjedUHGs52mQseE0l
         jzMwmpGwbRVDKCvJ5DTcy7OGHARE7tX+1Bb8fxFGsNnSAyqO8m6ftdc6xKwBFObW4nlz
         7nG7jYJqSSyfyS00BKMPy9sBs2CUs4cXn3a+vtNy7SGboJ/VcfvLNGqIeBGZtx4NXEyU
         DiDw==
X-Gm-Message-State: AKGB3mJ2NhnUplZivWjrxyymdetfjUlNAJGtWgvUfLlP/5QwTMMEVAs/
        XcbAkeGv4QwAkE+JoAWfJdyWasCC7Vrul+bA+U62YQ==
X-Received: by 10.202.216.137 with SMTP id p131mr599166oig.256.1513188744017;
 Wed, 13 Dec 2017 10:12:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Wed, 13 Dec 2017 10:12:03 -0800 (PST)
In-Reply-To: <e36ec13c-e597-caae-4ae8-81b320e8f461@huawei.com>
References: <1511807966-23936-1-git-send-email-gengdongjiu@huawei.com>
 <470c9df5-f2e8-974b-b37f-eff84a6f3d71@huawei.com> <18906953-f464-d9f4-23b4-fd7118d45e2f@huawei.com>
 <20171211143220.7a359462@redhat.com> <e36ec13c-e597-caae-4ae8-81b320e8f461@huawei.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Wed, 13 Dec 2017 18:12:03 +0000
Message-ID: <CAFEAcA-JmbR3RUMWrH2j5OrSitczu+KskE-NJyhsWrHbJCH_ZA@mail.gmail.com>
Subject: Re: [PATCH v13 00/12] Add ARMv8 RAS virtualization support in QEMU
To:     gengdongjiu <gengdongjiu@huawei.com>
Cc:     Igor Mammedov <imammedo@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Shannon Zhao <zhaoshenglong@huawei.com>,
        James Morse <james.morse@arm.com>,
        Laszlo Ersek <lersek@redhat.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@linaro.org>,
        Richard Henderson <rth@twiddle.net>,
        Eduardo Habkost <ehabkost@redhat.com>,
        QEMU Developers <qemu-devel@nongnu.org>,
        qemu-arm <qemu-arm@nongnu.org>,
        "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Linuxarm <linuxarm@huawei.com>, xuwei5@hisilicon.com
Content-Type: text/plain; charset="UTF-8"
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: v/P9Pw0SloQ9

On 13 December 2017 at 03:59, gengdongjiu <gengdongjiu@huawei.com> wrote:
> Hi Peter,
>
> On 2017/12/11 21:32, Igor Mammedov wrote:
>> On Mon, 11 Dec 2017 19:31:14 +0800
>> gengdongjiu <gengdongjiu@huawei.com> wrote:
>>
>>> Hi maintainer,
>>>
>>>   This patch set seems pending about one month, could you help review for them?  Thanks.
>> I'm going to look at ACPI side of it this week.
>
> Hi Peter/shannon,
>    Igor will review the ACPI part code,
>    could you review below five patches? which does not depend on OS kernel patch and have received the agreement with others about the solution.
>    Thanks very much.
>
> [v13,08/12] target-arm: kvm64: inject synchronous External Abort
> [v13,09/12] Move related hwpoison page function to accel/kvm/ folder
> [v13,10/12] ARM: ACPI: Add _E04 for hardware error device
> [v13,11/12] hw/arm/virt: Add RAS platform version for migration
> [v13,12/12] target-arm: kvm64: handle SIGBUS signal from kernel or KVM

Hi; unfortunately I only have one more working day this year, which
isn't really enough to get up to speed sufficiently with RAS to
review this patchset, so the earliest I'm likely to get to it is
the week beginning 9th Jan.

Hopefully somebody who understands RAS better than me will
be able to review it before then.

thanks
-- PMM
