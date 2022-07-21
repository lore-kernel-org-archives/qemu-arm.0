Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp3216542lfp;
        Thu, 21 Jul 2022 03:43:42 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vIRrgIH4IoRQKpkML4CIMWUCi0rxphwUYASbzI6u18YL+LBt9sKVN8LUc6flhk2bB2+7ze
X-Received: by 2002:a05:620a:408a:b0:6b6:1aa6:21ec with SMTP id f10-20020a05620a408a00b006b61aa621ecmr3221390qko.735.1658400222257;
        Thu, 21 Jul 2022 03:43:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658400222; cv=none;
        d=google.com; s=arc-20160816;
        b=jWxlJyn62zDX8LEUWPs74fzdJtFJfhdwD3Ch688Z8aAQZbsnAUPr3ALh/sZbZ9Nl0J
         kMEzO6ZM8HbaL+RMtYPMmGkk+aI0TDGczzhTmXR6smrnYC0ejRWl90NlbJhjdspobKqF
         1hrLo6UrOYYsYNTubvBUxFaXs9TAmJtzXU719+EIg40HRD3bmms3vlGd7zMWQhZ4OVa9
         QTw5Eaudc0KuXI96NaB92jff+riAMA7YbT83L2teoT6dPwCxNXonqgyOyXITQuHZiigB
         zMJucqx/eVQ12X8LWwwAGJzlqP3CZvC6jOSmS83m/4HJL+0I1edNHs9DrtE06PbJQfL8
         LNzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=mJla11C/YUhbyIXvvPW1AMlljngUuLC31UEURiw75uE=;
        b=N+Dl1ZZU14RjrC1tF4BLkb1ghDRUCRPPNo4nDbLExbNqFEfCJT1lE1anMxlhOhIpSv
         py8DZRx2vA4fo5bFcems18jF7ydx/87ZUoygPivt/tJ8BlQzOQ8BAM8tJEnRvyDhaFEM
         KDX28/wOyF5Nz6PgKUhB+y6Nn8WL/VKCePBD84vfDAeeenDcFH6P+n+eKcDp8pEUWkfC
         Y+AOKJ+uxlBFeEMYkl7rcJthcV1LbXcvws6I/YUiv1Hc3hAGhlAbH8zA7W2BY5Uj5SGY
         siIr19kWJVRvh1ql9m8GmNzT5GeFSRZ4pGv9KWjMoeOrE3W4TqJm42S4hc/EiV803R5e
         7vvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r4MCD5v7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ke18-20020a056214301200b00473977d2dabsi968843qvb.17.2022.07.21.03.43.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Jul 2022 03:43:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r4MCD5v7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oETef-0000lQ-Mh
	for alex.bennee@linaro.org; Thu, 21 Jul 2022 06:43:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oETeS-0000k6-4V
 for qemu-arm@nongnu.org; Thu, 21 Jul 2022 06:43:28 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:38632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oETeQ-0002V7-Ih
 for qemu-arm@nongnu.org; Thu, 21 Jul 2022 06:43:27 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id i206so2086801ybc.5
 for <qemu-arm@nongnu.org>; Thu, 21 Jul 2022 03:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mJla11C/YUhbyIXvvPW1AMlljngUuLC31UEURiw75uE=;
 b=r4MCD5v7wznyS7z0UJum4vYLqA4ufeOanPt9xov2DlvGN/FLG5vEWwd5oP0ESdYSPi
 ex1fgqgWeNc1onfoZl1XeSD2SH/2hsCsTFYata3+VVhPVKcDK1fiyIoIA4xPmZYXvZ5V
 xLCCvz4/aHwssjQG3B2H1a90wuOB+ueMGteoC+RwNb8rLL4D/HzmnngWaODg3almAmfd
 571yREkFYs7+DnW60g2RkFkEY4goIkK76BBRMtDRDc10zqY88caeH3d7RoRkB+3m49LS
 KquY7QvIO4dK0/L3dYnPKbL7gQyEFzvIu8T51tgu7RLMqjF4kd+8KckLKF0vWl+Ho+o/
 AaGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mJla11C/YUhbyIXvvPW1AMlljngUuLC31UEURiw75uE=;
 b=Q8vwJNdQz0/2LqyNhps7Gd4V07mkvAnBkg6AX9v8qgixDrDZ9hLFuHRxRo4e0Il/Of
 X+K43xYODraF2me7eLMNWkU+BdgovBo1kqx06KXWkGeLmPELSH70cR0nEYA4elCWCCC6
 XLO2lCxwGmweyjqtAN5zXFRAyvn8XtB1poyLyJBgJhuJqRhPYkpnkxhazG64wwLKFsB4
 LFwOZWjyPGWEm4PbJSsI0dMkW8RRMJKuQL2aBJFIiB8aJb5/E/r1Z+Fv7fYhzrc5gdW7
 YUV/XqYCP4qWJpORWPLkPr96uc891xgEvEzobZOnx1IPDIBP468QWWMR+cCA1V5TsM4B
 9hdw==
X-Gm-Message-State: AJIora9Ijze0SfWs+c3NS7uDi/r1eP2P75Jc6wBde8eya8iXVJfbyVaN
 jloTFJA7bW2tOH1oSzN6M7ujxp8G8wgBICABrOlETA==
X-Received: by 2002:a25:c5c5:0:b0:670:9946:1bf6 with SMTP id
 v188-20020a25c5c5000000b0067099461bf6mr5775780ybe.288.1658400205134; Thu, 21
 Jul 2022 03:43:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAL7npF9T0148jkgTigVfE7cSzH2HKqy0NG0VQtAH2HMXjdBOOg@mail.gmail.com>
 <CAFEAcA8RHhRcrMSO_3MK0hSH=zWzde7S0DHHaLPZf4jOv48RLQ@mail.gmail.com>
 <CAL7npF9hKFsQF18Udi9QFnRZSH-G8cafXHBSBQcrs7jpJmPd7Q@mail.gmail.com>
 <CAFEAcA92=ne8weVYDnLLzNk0+z+aMFJgOJvW_7hSYcY1TimyHw@mail.gmail.com>
 <CAL7npF8Hg7hJBxw9j-1_7GRV_E52KS+hP1WXKfD3+r05C=CBgg@mail.gmail.com>
 <CAFEAcA8tGiaXq+y40-BtdG3jiBJpP=L6x9tsPL_5dF6dr=afEA@mail.gmail.com>
 <CAL7npF8d6LZHZtLWe65JiwQW+X-48JxLa2xBoGdxjJJWpKx-Fw@mail.gmail.com>
 <CAFEAcA9SM--_+Ret6fZwvWNe0J3E8TE-+do614TtTpi0rbAM9A@mail.gmail.com>
 <CAL7npF_8ErAn2cvFBQxVCdP96uKpdRQMs_3aL_UW5OLzm3Q=GQ@mail.gmail.com>
 <CAFEAcA-cTzrA6fZXw7onDJ77NMwjBrSFVwADYmttCgdOf9ODYw@mail.gmail.com>
 <CAL7npF9H_eKi0jA_m-wV=jSHy9hc6re7TpTe2ni=9NYK4CxRpA@mail.gmail.com>
 <CAFEAcA8xV-BdhvwvkzRHxqqEX9BAwDJGwHS=koBRbDeGHwQHEw@mail.gmail.com>
 <CAL7npF9bOP=bPtyFS-K+HgXGy9+W11M0ELRJMqQp1-JB_jVx1g@mail.gmail.com>
 <CAFEAcA8hbU7PJK-YvOkbjj2F2PBW1M9J10DkHqUPXTSxYOS-5Q@mail.gmail.com>
 <CAL7npF9neZUWweuZFqDkO5mh5=tZj3ybjZUvVoF932cJibpRiw@mail.gmail.com>
In-Reply-To: <CAL7npF9neZUWweuZFqDkO5mh5=tZj3ybjZUvVoF932cJibpRiw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Jul 2022 11:42:45 +0100
Message-ID: <CAFEAcA9CnC5P4Myf1qMO=DLas93+kSVjNvnj6Vgty_yvdjH5vQ@mail.gmail.com>
Subject: Re: [qemu-arm-static] timer_delete issue from Qemu 5.0.0 onwards
To: Jon Alduan <jon.alduan@gmail.com>
Cc: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T7CFWBDOUWIr

On Wed, 20 Jul 2022 at 16:19, Jon Alduan <jon.alduan@gmail.com> wrote:
>
> Ok. Did you try out the qemu-arm-static_500 I provided?
>
> I have no clue what else we can check for. I tested It on WSL2 with kernel versions 5.4 and 5.10 and also on a VM with 5.13. Same issue everywhere.
> Could It be the difference, that I am running Linux on virtual envoronments and you on a real Linux system?
> Could this fact influence qemu behavior?

Maybe. Anyway, can you try this?

(1) Build current head-of-git QEMU from source, and check the bug is still
    present. (I expect it will be, because we have made no changes in
    this area since 7.0.)

(2) With that QEMU, gather strace output from both QEMU itself, and
    from the host kernel, like this:

    path/to/qemu-arm -strace -D qemu-strace.txt timertest

    strace -f -tt -o host-strace.txt path/to/qemu-arm timertest

    and send me the resulting qemu-strace.txt and host-strace.txt logs.

Hopefully those logs will have enough information that we can figure
out what's going wrong on your system.

thanks
-- PMM
