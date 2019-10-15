Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp5889497wrm;
        Tue, 15 Oct 2019 08:08:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxjgydQFNeOUIQ6f2tSTfNz4M5zVfWz28DjUgV6BZU4/A6AVZLOvAWno6kKtpxAelJZ5/ur
X-Received: by 2002:a05:6402:323:: with SMTP id q3mr7318953edw.166.1571152116972;
        Tue, 15 Oct 2019 08:08:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571152116; cv=none;
        d=google.com; s=arc-20160816;
        b=RceUt2eDxhVoolvy6tvp+yrlkfFU9JC3XnvSKUy03MB/S0mR42ZjIj3BcBppSg5fnU
         pzt0LOuhlySv9zV6WJ9s035E9WhNQ0v+uXKRX88stX/f7Edp5hXbIwTD+nSdjITRKnuo
         igg9wkA2BKz/bFd8q5qBLbQ00k/+HrvXxvykEEDzQT+cqVyFgulgBLb6zKVKNMDdKh3C
         ntIcod2pQHliLD2iuh9lYAMUruLneuP4VaUoCNGQFky1kBEd6T0EzDsZetM3TuE1xVYw
         Z6fx0DebAGYWcyjfAK5/k68S8OiwcoRiMxc/G7bX17vf/B+D2dSvBiUBMN0SZL0Nan9r
         L8mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MzYo/CIcGV3aU6Kf1OQCSICiwmWdTBweMCA+KcylprU=;
        b=rTVO6RTzsEfnRZS5DmDS9EXanQL8AT5ZZ7UVe8ibHLM/4sX5wTiYGDl5sLuB6nR+px
         fsdZM+5aCd8ytCwGFCTCkecw3yIZKRc0UCBqWhVAtszeERsdkVFqRqADl5IkHSKZsLpA
         0sUXPVfd5UA2TzHRb1lYi3Sa1E42gvY/SYlFuT5ZubYhlaNzXRkbsM7fKm52l5/rE6wC
         YNT0tgsQYHsrJ1e3NToeb1mb5NgnDxQ364ZwjI2T6t2Cl60pFhYVXmeai+mqVsI03MN4
         Iz7dfXi4AmnyPDNKKJuJnFxg90sq27sJLYMSwiLmi6dnGoO3+oRPh6E3qujzvFs1oaTX
         cIew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NYclxQmT;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id r1si12508390ejp.287.2019.10.15.08.08.36;
        Tue, 15 Oct 2019 08:08:36 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NYclxQmT;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732594AbfJOPIe (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Tue, 15 Oct 2019 11:08:34 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:40414 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726523AbfJOPId (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 15 Oct 2019 11:08:33 -0400
Received: by mail-ot1-f68.google.com with SMTP id y39so17208148ota.7
        for <kvm@vger.kernel.org>; Tue, 15 Oct 2019 08:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MzYo/CIcGV3aU6Kf1OQCSICiwmWdTBweMCA+KcylprU=;
        b=NYclxQmTl1IyDoZqqXfMdmVihjwEkpPVJw+gY/ha8app0F850AxAqAFEFB2Q0HkAoT
         4xdsNeoHL8NToAr3OUHXENRbXmvmuTKozC1dRXHLI3galc1LeXmavfHM6YqUoXqj1VGy
         F08vnxs2vfLOzJQuea82ynGOCSJfrK0OXQ8Ywd0omOSy0kie6f2lvE20hFC0WuRR7wyI
         1bghDEh2897zChqA5MH81TvbFsa2eW6bvJJt83MUS3ebjYx1HOg3ShOkvqOLEPo2YNrl
         CDgNlh01JXX5CnwgHG0OL6ngGEL/sco+pfH4xvAB7DdzOXfG+2i/myJD/wKTDgV0d88C
         YH/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MzYo/CIcGV3aU6Kf1OQCSICiwmWdTBweMCA+KcylprU=;
        b=Iwtfig45gopqnHh9ulHpxmSRu/G6Y22OZh0vBGw1sZgvp59B8IzQ5hySegnK3Y/9Qb
         V9ZXtQveLGC+/UPPQK9qoeocAteJWST0xDRwLkR+j2ZI73+74Zbc78fu3fX6F+pNGWnN
         jPe2ANQwmU7zS+5J5c0l9BiemFbdRa1r44o9zQLnpewnSVVumX9CQtAI48k3i/p6cSFD
         4qUob9YFsf0A6nDujlBnVa409PDvcEC7lF2h5B3yoIjGGbKmu2HaTnl0wo/LpQ3GUyUR
         3YH7vXmA/+AYO7pidUXtqd2FiTzbTXP+uFeUEW0pP0Ah1Jjc9pZ2T3z3QLnGKEVScnx8
         NfHg==
X-Gm-Message-State: APjAAAUg7PVRIumCEDU/QpLxFm2d6wjmfdVkltLs+7trBaT2WQLNyWbH
        7z5B2Pw1DzNXpyOvP5QHP9HaNTuRe9Ue9CkTbCgoRg==
X-Received: by 2002:a05:6830:ca:: with SMTP id x10mr2434112oto.221.1571152112080;
 Tue, 15 Oct 2019 08:08:32 -0700 (PDT)
MIME-Version: 1.0
References: <20191015140140.34748-1-zhengxiang9@huawei.com> <20191015140140.34748-3-zhengxiang9@huawei.com>
In-Reply-To: <20191015140140.34748-3-zhengxiang9@huawei.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Tue, 15 Oct 2019 16:08:20 +0100
Message-ID: <CAFEAcA85gZUXnL+Qy=Wdg-MVbb1PqiKWCi72XvRnX8pZsgVr_A@mail.gmail.com>
Subject: Re: [PATCH v19 2/5] docs: APEI GHES generation and CPER record description
To:     Xiang Zheng <zhengxiang9@huawei.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Igor Mammedov <imammedo@redhat.com>,
        Shannon Zhao <shannon.zhaosl@gmail.com>,
        Laszlo Ersek <lersek@redhat.com>,
        James Morse <james.morse@arm.com>,
        gengdongjiu <gengdongjiu@huawei.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Richard Henderson <rth@twiddle.net>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        "xuwei (O)" <xuwei5@huawei.com>, kvm-devel <kvm@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>,
        qemu-arm <qemu-arm@nongnu.org>, Linuxarm <linuxarm@huawei.com>,
        wanghaibin.wang@huawei.com
Content-Type: text/plain; charset="UTF-8"
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: /wyEDZltpZkM

On Tue, 15 Oct 2019 at 15:02, Xiang Zheng <zhengxiang9@huawei.com> wrote:
>
> From: Dongjiu Geng <gengdongjiu@huawei.com>
>
> Add APEI/GHES detailed design document
>
> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
> Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
> ---
>  docs/specs/acpi_hest_ghes.rst | 94 +++++++++++++++++++++++++++++++++++++++++++
>  docs/specs/index.rst          |  1 +
>  2 files changed, 95 insertions(+)
>  create mode 100644 docs/specs/acpi_hest_ghes.rst
>
> diff --git a/docs/specs/acpi_hest_ghes.rst b/docs/specs/acpi_hest_ghes.rst
> new file mode 100644
> index 0000000..905b6d1
> --- /dev/null
> +++ b/docs/specs/acpi_hest_ghes.rst
> @@ -0,0 +1,94 @@
> +APEI tables generating and CPER record
> +======================================
> +
> +Copyright (c) 2019 HUAWEI TECHNOLOGIES CO., LTD.
> +
> +This work is licensed under the terms of the GNU GPL, version 2 or later.
> +See the COPYING file in the top-level directory.

This puts the copyright/license statement into the HTML rendered
docs seen by the user. We generally put them into an RST comment,
so they're in the source .rst but not the rendered views, like this:

diff --git a/docs/specs/acpi_hest_ghes.rst b/docs/specs/acpi_hest_ghes.rst
index 5b43e4b0da2..348825f9d3e 100644
--- a/docs/specs/acpi_hest_ghes.rst
+++ b/docs/specs/acpi_hest_ghes.rst
@@ -1,10 +1,11 @@
 APEI tables generating and CPER record
 ======================================

-Copyright (c) 2019 HUAWEI TECHNOLOGIES CO., LTD.
+..
+   Copyright (c) 2019 HUAWEI TECHNOLOGIES CO., LTD.

-This work is licensed under the terms of the GNU GPL, version 2 or later.
-See the COPYING file in the top-level directory.
+   This work is licensed under the terms of the GNU GPL, version 2 or later.
+   See the COPYING file in the top-level directory.


> +(9) When QEMU gets a SIGBUS from the kernel, QEMU formats the CPER right into
> +    guest memory, and then injects platform specific interrupt (in case of
> +    arm/virt machine it's Synchronous External Abort) as a notification which
> +    is necessary for notifying the guest.
> +
> +(10) This notification (in virtual hardware) will be handled by the guest
> +    kernel, guest APEI driver will read the CPER which is recorded by QEMU and
> +    do the recovery.

Sphinx thinks the indentation here is not syntactically valid:

  SPHINX  docs/specs

Warning, treated as error:
/home/petmay01/linaro/qemu-from-laptop/qemu/docs/specs/acpi_hest_ghes.rst:93:Enumerated
list ends without a blank line; unexpected unindent.
Makefile:997: recipe for target 'docs/specs/index.html' failed

That's because for an enumerated list all the lines in the paragraph need to
start at the same column. Moving in the two following lines in the (10) item
fixes this:

--- a/docs/specs/acpi_hest_ghes.rst
+++ b/docs/specs/acpi_hest_ghes.rst
@@ -90,5 +90,5 @@ Design Details
     is necessary for notifying the guest.

 (10) This notification (in virtual hardware) will be handled by the guest
-    kernel, guest APEI driver will read the CPER which is recorded by QEMU and
-    do the recovery.
+     kernel, guest APEI driver will read the CPER which is recorded by QEMU and
+     do the recovery.

thanks
-- PMM
