Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp182814lfp;
        Thu, 23 Sep 2021 06:32:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIewD1h6LqOS2pNkQfJmUAij7wDqN9yjk6GrFAPCEJyP9QEN6wqwkvVIdDpsJ/b/aYle9Z
X-Received: by 2002:ad4:498a:: with SMTP id t10mr4349256qvx.65.1632403924564;
        Thu, 23 Sep 2021 06:32:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632403924; cv=none;
        d=google.com; s=arc-20160816;
        b=GIEJ75oci40Le5vmrH4jpH05Zz7BZXSha8cUjhwRyTUqR2G75sXAt/2F7zAEQevIdu
         R2CibwCehnfgbWxE7W6Jt+KV1HTs4j8V9ivjF6K3+yFbQHPuUYVK58qs4sglUpt3l2iY
         BqhLUpl1Zc1JtDVTNiGmDW/h+vmOUA/jgYGnkyrmlsrZ6yWJdm5ddQYWTtdkxh6ZguwY
         c0tsGvIXK5Xvpz+CRJWQ15qj0lvcmQo4WisXlZNW87z/p37ivMZYBWY+ar6P9zlHHO8U
         VqAW2FPmornXSZBP3/YXGfMKZpyYm4EP0utFtBmwoKvvB0V+cBofxSTjdoOq2DbkmKNx
         TBoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R72pwKKDq67KLf6mWS3a33RQNqgLdbVmda+g++lW8Po=;
        b=ykld3oqzCQOtsEFsW39FDc3YbssMq74RJA71N0Qw0UuPex3H82T0ypVjnL6QzSmrHz
         X5cQJC88eY8eDIrjnpwdFapLcdJhwSH/vBAAh5WPwVO+8Ajv1FyW88TnmEi/XCScbpwl
         8Bds1r3c35oNr43pkGH4I3d8v/1gValwZSqMU3rZbqkXRQfGJt+tBIoiYwy/I6+XVfbz
         G6uZhGgIjJt68Gc3DyVzKCpbhxDQ7HcdhcsQg4csvSTroHPbEzZlR9jDMw/oEpTQdSrm
         KzBGAuPlGBjGZu86wgBX3zA0YCqqy5Cz+woc0Ex7CNOBRNgG9nRXPloMc3jn802+QyRV
         O7Ew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vKxFaJqM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 12si2817489qty.273.2021.09.23.06.32.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Sep 2021 06:32:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vKxFaJqM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mTOpX-0002MP-R2
	for alex.bennee@linaro.org; Thu, 23 Sep 2021 09:32:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mTOoJ-0002LQ-W1
 for qemu-arm@nongnu.org; Thu, 23 Sep 2021 09:30:48 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:37868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mTOoG-0006D2-RU
 for qemu-arm@nongnu.org; Thu, 23 Sep 2021 09:30:47 -0400
Received: by mail-wr1-x435.google.com with SMTP id t8so17284574wrq.4
 for <qemu-arm@nongnu.org>; Thu, 23 Sep 2021 06:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R72pwKKDq67KLf6mWS3a33RQNqgLdbVmda+g++lW8Po=;
 b=vKxFaJqMjcs2u5m/gk+GTFvrWoUztnpvMGhUW0Gs9qpysDPfK/oNba2P7nUDSChtSc
 gns58B4985wfiS+os8kSvebeLFXfDkRDLhEISZbMhHW4KqqtSp7OROzX77AgYhQQflat
 0riwYTJCz0kYyWgYJ86A1vGd7FCrEMNjfbitajkSHlwbwGseBDLsKXajvC/WqHBzYhKk
 4eYjW6ErJw5lLKVomgNF6fYJHTMjDqFj2lFvmAbW+Mnuw93Y/40b287bwgd2wSuD4m8J
 ddccJadCsCvXIJwsILu4NAAvno9xBSmTbu+hnemBBp5HXIRU0ClRSmrhhZiJ2wm5kXnK
 MQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R72pwKKDq67KLf6mWS3a33RQNqgLdbVmda+g++lW8Po=;
 b=1I22VX8zfT15ksfl94AtVcoYyNELALJYSiVGifVOHt7gebBD/m5m4rOvWIP4dQVLRG
 UxrLQSin500nZ3NdOQQK3NbZXS1mUEVxuECwgVe4wVDaAivla0YMhZmH2aa9q9YxZ7oG
 3iLct63TZZOsRlY0FYOjEJ8x0XAMNxGESsesvxHFSGZJLqEbHyZqnCI2zk65z+i2BFnq
 tLJ7RmljrmUxv9sQl6hG06wcNa450RJIGOisM3cn+UaPCadHhRxcLV+W7BkNxouPstNV
 c5Te4bMIHfUYh8OuSnqhLWAOmGAOfCvShI5hd/tglZKcjJ09SFfDuSBuTelt9ML90wym
 icAw==
X-Gm-Message-State: AOAM531LWKSH+kxwydkQkk2zHs0VWd0gEMIUyBzbsHnrfxh4DSFyJqDB
 L0zdtxZufaRoUQSllKc9GGf2bL0stfKKXImHqlGZLw==
X-Received: by 2002:a5d:6b07:: with SMTP id v7mr5026142wrw.376.1632403843302; 
 Thu, 23 Sep 2021 06:30:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210920122535.269988-1-eric.auger@redhat.com>
In-Reply-To: <20210920122535.269988-1-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Sep 2021 14:29:50 +0100
Message-ID: <CAFEAcA-8497+XS0PU3RAkGsrf7PGVm=oGymuHznE3iuopMHbKg@mail.gmail.com>
Subject: Re: [PATCH v2] hw/rtc/pl031: Send RTC_CHANGE QMP event
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>, Gavin Shan <gshan@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YIx1YdmWktAG

On Mon, 20 Sept 2021 at 13:25, Eric Auger <eric.auger@redhat.com> wrote:
>
> The PL031 currently is not able to report guest RTC change to the QMP
> monitor as opposed to mc146818 or spapr RTCs. This patch adds the call
> to qapi_event_send_rtc_change() when the Load Register is written. The
> value which is reported corresponds to the difference between the guest
> reference time and the reference time kept in softmmu/rtc.c.
>
> For instance adding 20s to the guest RTC value will report 20. Adding
> an extra 20s to the guest RTC value will report 20 + 20 = 40.
>
> The inclusion of qapi/qapi-types-misc-target.h in hw/rtl/pl031.c
> require to compile the PL031 with specific_ss.add() to avoid
> ./qapi/qapi-types-misc-target.h:18:13: error: attempt to use poisoned
> "TARGET_<ARCH>".
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Thanks. This looks plausible to me (well, it would ;-)) but
I would appreciate review from Paolo or somebody else who
understands the rtc_change feature and handling.

> ---
>
> v1 -> v2:
> - Use Peter's implementation and remove subsection
>
> Tested with the following script run on guest:
>
>   #!/bin/sh
>   old=$(hwclock --show | cut -f1-7 -d' ')
>   oldabs=$(date +%s -d "$old")
>   newabs=$(expr $oldabs + $1)
>   new=$(date -d @"$newabs")
>   echo Old: $oldabs $old
>   echo New: $newabs $new
>   hwclock --set --date "$new"
>
> and compared with x86 behavior.
> ---
>  hw/rtc/meson.build |  2 +-
>  hw/rtc/pl031.c     | 10 +++++++++-
>  2 files changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/hw/rtc/meson.build b/hw/rtc/meson.build
> index 7cecdee5ddb..8fd8d8f9a71 100644
> --- a/hw/rtc/meson.build
> +++ b/hw/rtc/meson.build
> @@ -2,7 +2,7 @@
>  softmmu_ss.add(when: 'CONFIG_DS1338', if_true: files('ds1338.c'))
>  softmmu_ss.add(when: 'CONFIG_M41T80', if_true: files('m41t80.c'))
>  softmmu_ss.add(when: 'CONFIG_M48T59', if_true: files('m48t59.c'))
> -softmmu_ss.add(when: 'CONFIG_PL031', if_true: files('pl031.c'))
> +specific_ss.add(when: 'CONFIG_PL031', if_true: files('pl031.c'))
>  softmmu_ss.add(when: 'CONFIG_TWL92230', if_true: files('twl92230.c'))
>  softmmu_ss.add(when: ['CONFIG_ISA_BUS', 'CONFIG_M48T59'], if_true: files('m48t59-isa.c'))
>  softmmu_ss.add(when: 'CONFIG_XLNX_ZYNQMP', if_true: files('xlnx-zynqmp-rtc.c'))
> diff --git a/hw/rtc/pl031.c b/hw/rtc/pl031.c
> index 2bbb2062ac8..e7ced90b025 100644
> --- a/hw/rtc/pl031.c
> +++ b/hw/rtc/pl031.c
> @@ -24,6 +24,7 @@
>  #include "qemu/log.h"
>  #include "qemu/module.h"
>  #include "trace.h"
> +#include "qapi/qapi-events-misc-target.h"
>
>  #define RTC_DR      0x00    /* Data read register */
>  #define RTC_MR      0x04    /* Match register */
> @@ -136,10 +137,17 @@ static void pl031_write(void * opaque, hwaddr offset,
>      trace_pl031_write(offset, value);
>
>      switch (offset) {
> -    case RTC_LR:
> +    case RTC_LR: {
> +        struct tm tm;
> +
>          s->tick_offset += value - pl031_get_count(s);
> +
> +        qemu_get_timedate(&tm, s->tick_offset);
> +        qapi_event_send_rtc_change(qemu_timedate_diff(&tm));
> +
>          pl031_set_alarm(s);
>          break;
> +    }
>      case RTC_MR:
>          s->mr = value;
>          pl031_set_alarm(s);

-- PMM
