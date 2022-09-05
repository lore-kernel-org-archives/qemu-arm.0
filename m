Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp2288107ejh;
        Mon, 5 Sep 2022 03:38:27 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5a+6MKiSER9A1b7pBUioMNsEdkMoLsDB/pJ21+ax8R5fw6r18wLGRgQ1bPoxKwFwrsDKs9
X-Received: by 2002:ae9:f50f:0:b0:6bb:49da:e1b2 with SMTP id o15-20020ae9f50f000000b006bb49dae1b2mr31325814qkg.21.1662374306936;
        Mon, 05 Sep 2022 03:38:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1662374306; cv=none;
        d=google.com; s=arc-20160816;
        b=ljH0ChmxqbH6JZGodOwAXFXnuDwoBMDnK1aPVzD7dmvcCeKh4Ty6WDAPxdrGXiubW+
         Ho/jQNiPV4BQVWYDFwbnZzeG1ERCzEQh4Kj3f1rW7D3rzGAqywLaKxA7VxFwKrFERs1L
         X5R5W8I6fI8TJLfPQeKvEIq7slmjhF13VamVulx3TCo9b8msjdmBsx/AmyklZAdcZGod
         tZACY4S8PAIzDfrz/VnQPQxHoXQKH5X2kbX+TezVEsgjIR0CY1753X3katW7Tr36e/d1
         5swSn+2HEIhMlM1gZ9WsyfI6K/wxzE8gQjte47XPoOV6CACRqGFVFEzsKUN03ZJ+wG15
         Yklw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=lcIZFyVx4K82gp+OBSRoTLB8tYeWTqWQiUsiGyAdzRU=;
        b=psKEz4r3hC5ckRmUyOAx4jK8alfOXeBoEwuiVrRyEcQTZ1MMKHkpi1PrKzHVcbtjbI
         ScAVODlfilmGBpeXEJ3KBb4AzetZKpdwomXrT49Y3KhmUNTa6ciqaaj5B7D8ZeXtBWKF
         EipQ5YflS+EkS2vO1D47soE9n4ipGFUdZkR4fywnRZcozPinUviipxUWnvnyc5VfYtw/
         gqGl82MDvF7wZCuBHgxwWiN49pfW8rDBz8NISrZuMGU/qKQ1VKjumZLm0Nl1f1tovXzN
         Udj1FL5TM0q+yhOcr8wo+ZUt/Mj6d7R7rmVAKTpkO28rVaZ33nk0zsKZOntctM4j+CUK
         Rf1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b="4V0d/G/R";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g18-20020ac84b72000000b00341bba048c9si4434857qts.729.2022.09.05.03.38.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Sep 2022 03:38:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b="4V0d/G/R";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oV9Uo-0004rQ-C2
	for alex.bennee@linaro.org; Mon, 05 Sep 2022 06:38:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oV95T-0003Xw-9T
 for qemu-arm@nongnu.org; Mon, 05 Sep 2022 06:12:15 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:43695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oV95Q-0004E0-Bi
 for qemu-arm@nongnu.org; Mon, 05 Sep 2022 06:12:13 -0400
Received: by mail-io1-xd35.google.com with SMTP id b142so6488452iof.10
 for <qemu-arm@nongnu.org>; Mon, 05 Sep 2022 03:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=lcIZFyVx4K82gp+OBSRoTLB8tYeWTqWQiUsiGyAdzRU=;
 b=4V0d/G/RzIm7XwLxs7ZEV42MzAiKEPvMIACYuXPRjqtv6xHUXD92R1wMT5mGGA9GWm
 jwWyBYT1vtceN6ZuWvQo3IOzzA5dZKenJul6HbbXaUpaRyBE0mdta+/E9okHx1I/p9YE
 jvLgoebp37AkrhP7Rf4ZxdflPNd/grVo1hryiFguHdODgYp8sxlrS9nveOK8MQDmeN5f
 gbJFgesAar6x8ZE2PfUTH5WsNchMqjFH/adO9RIh5GqM6gJrXgnpznkVEJan/SV17e8C
 I4eb3QGW2WGj/KNvyelZ2r4aiufHokKgEpBsdprljfI30HC4zACzqCYfYXRAfJcURAtk
 KGBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=lcIZFyVx4K82gp+OBSRoTLB8tYeWTqWQiUsiGyAdzRU=;
 b=zsIzESnKQSaoYCTrcWczsuA32ISlmXqraH3/qhn09+PSc6vxlDHOQ2GiZ7YEMdYPAW
 FHCXpjkKsVNgtY91hCHro0ajQ3bA7ke3n7r3K3C3l7MAOoJ3f/Ul+6uXPUoGYUB5SQZm
 XvmDzbh55NHLTN8hCuNLLpxf4RWRVG6+DnZcEi4RbWc5WKMrPEmr9b4VZGxoIQnhb7NE
 xysmfjB/WM+yPTU/ur3IeAngUeeGW/eca6+RprdMvENtvTNVmiy4KVyfxk+Y4m8rJuco
 dolnEPU22alU0AUbrGac3hABoxuOh8xE5eNqljJhge8pW3p+iJvxkbkIIyxfVJ7Gl4d7
 blJQ==
X-Gm-Message-State: ACgBeo20W186BOMZhECgwi60ZJnrACOZBlp/8mfZLI6Ka2xtq5mNUYEm
 eM/i85cE/2YG7jfSrcFFN6qmY8+Icf7M16LxgqlOvQ==
X-Received: by 2002:a05:6638:2486:b0:352:69df:1576 with SMTP id
 x6-20020a056638248600b0035269df1576mr2695703jat.261.1662372730673; Mon, 05
 Sep 2022 03:12:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220831013236.32937-1-akihiko.odaki@daynix.com>
 <87tu5qulay.fsf@pond.sub.org>
 <CAE=JJXdg=Miisek8WeqQ12NqL8obzmuyzD0mbv1SfiJTyVBLuw@mail.gmail.com>
 <875yi2mat1.fsf@pond.sub.org>
In-Reply-To: <875yi2mat1.fsf@pond.sub.org>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Mon, 5 Sep 2022 19:11:59 +0900
Message-ID: <CAE=JJXcRH-0TuM7WgbM35Nb=Ud94K-LUcdzjoyJDMEuK9o=uFw@mail.gmail.com>
Subject: Re: [PATCH v2] pci: Assert that capabilities never overlap
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org, 
 Alex Williamson <alex.williamson@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>, 
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang <jasowang@redhat.com>, 
 Stefan Weil <sw@weilnetz.de>, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, 
 Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2607:f8b0:4864:20::d35;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-io1-xd35.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 1+NPGCg6SxAA

On Mon, Sep 5, 2022 at 6:26 PM Markus Armbruster <armbru@redhat.com> wrote:
>
> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
>
> > On Fri, Sep 2, 2022 at 7:23 PM Markus Armbruster <armbru@redhat.com> wrote:
> >>
> >> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
> >>
> >> > pci_add_capability appears most PCI devices. Its error handling required
> >> > lots of code, and led to inconsistent behaviors such as:
> >> > - passing error_abort
> >> > - passing error_fatal
> >> > - asserting the returned value
> >> > - propagating the error to the caller
> >> > - skipping the rest of the function
> >> > - just ignoring
> >> >
> >> > The code generating errors in pci_add_capability had a comment which
> >> > says:
> >> >> Verify that capabilities don't overlap.  Note: device assignment
> >> >> depends on this check to verify that the device is not broken.
> >> >> Should never trigger for emulated devices, but it's helpful for
> >> >> debugging these.
> >> >
> >> > Indeed vfio has some code that passes capability offsets and sizes from
> >> > a physical device, but it explicitly pays attention so that the
> >> > capabilities never overlap.
> >>
> >> I can't see that at a glance.  Can you give me a clue?
> >>
> >> >                             Therefore, we can always assert that
> >> > capabilities never overlap when pci_add_capability is called, resolving
> >> > these inconsistencies.
> >> >
> >> > Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> >>
> >
> > Looking at vfio_add_std_cap(), and vfio_add_ext_cap() it seems that
> > they are clipping the size of capabilities so that they do not
> > overlap, if I read it correctly.
>
> If we want to deal gracefully with buggy physical devices, we need to
> treat pdev->config[] as untrusted input.
>
> As far as I can tell:
>
> * vfio_add_capabilities() replicates the physical device's capabilities
>   (starting at pdev->config[PCI_CAPABILITY_LIST]) in the virtual device.
>
> * vfio_add_std_cap() is a helper to add the tail starting at
>   pdev->config[pos].
>
> Could the physical device's capabilities overlap?  If yes, what would
> happen before and after your series?
>

When the capabilities overlap, vfio_std_cap_max_size() and
vfio_ext_cap_max_size(), called by vfio_add_std_cap(),
vfio_add_ext_cap() should clip the size of capabilities. Comments in
vfio_add_std_cap() and vfio_add_ext_cap() say: "Since QEMU doesn't
actually handle many of the config accesses, exact size doesn't seem
worthwhile."

Regards,
Akihiko Odaki
