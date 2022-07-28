Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp294628lfg;
        Thu, 28 Jul 2022 07:06:07 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t2HQjprKp4J3JcjlEGcLF8irXZ5JILasYEZuCaEBkQQGmHiTT9A4TPhLcU0YGMJ9Tn8/gq
X-Received: by 2002:ae9:eb8e:0:b0:6b5:bf14:c029 with SMTP id b136-20020ae9eb8e000000b006b5bf14c029mr20583142qkg.712.1659017167080;
        Thu, 28 Jul 2022 07:06:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1659017167; cv=none;
        d=google.com; s=arc-20160816;
        b=rnh4rQ1FHo2hLHkZFVusVV5N2xgg74an7DTs8DsSatCmqJ2+LloKBnxmWl/WJN1TZb
         sOdPvoDGNM49dxNr62W7tEOaQSyZcsjwp2Uu1lvDMIKVgNxvJIgSXG6jGZ8ir+Ule/HF
         2vtD1njoMHg5UTj9kBNsrvwjcZvE9tXYRQO2V35zwOAC7nDAzktuj7WfvXCW+PFyqkrc
         5cubdQpqgzbywEdA7hibg/Ck9hshoiuUWf8+HJQzQ38TD7BSSicokgJHgoCPo/iWbFrJ
         n1ZXEntz6NoPlHFJCo0hHofSELY+9Mh09sfUZvZZk10ADXY+PjVk4OLOsVlus/yMRjes
         iB6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=PphJY1T/gyzvy1mB/CBzklEkVbGsRPvYLm6OwRq+C8A=;
        b=GsDmxBJO2e/gkyXNRHBpwdsA22v0CjOXs3flXB2yr9HGu7/zM2i+4ZRcL7rjr4kfvv
         2hodNRFCKGaaq9tTpsbQVZ1pRL4c4ABsv45HVWjLVtXShQI7Q0rGpp6eo/y884zj3ucW
         Zv5GucWR3So//pAiv7LEX6KUeTJLqPRFuO+InTGOUIkfn+oLMGx+FXE6yBTS/NeztAcj
         hguQvlNOlBtSKgMWFKw3dc7xDibXTw8mZBYShsmh+pGKUmtT82OwwTmK9vEirYgt6PjG
         01ST1DDMp1A/OhsCci25rMxOvvYr4xrRXRkVxBl4fpQf69MYq5FUlYaCI8BjBBFbgWHk
         IYxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gf3CCvkg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bi38-20020a05620a31a600b006b5e56f1c9bsi657158qkb.98.2022.07.28.07.06.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jul 2022 07:06:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gf3CCvkg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oH49O-0004tG-HK
	for alex.bennee@linaro.org; Thu, 28 Jul 2022 10:06:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oH3oP-0002fG-K4
 for qemu-arm@nongnu.org; Thu, 28 Jul 2022 09:44:25 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:44818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oH3oN-00052h-LG
 for qemu-arm@nongnu.org; Thu, 28 Jul 2022 09:44:25 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-31f661b3f89so19544427b3.11
 for <qemu-arm@nongnu.org>; Thu, 28 Jul 2022 06:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PphJY1T/gyzvy1mB/CBzklEkVbGsRPvYLm6OwRq+C8A=;
 b=Gf3CCvkgEd2Sn0X1c+fi0sE8CmO4RrPIzW1WwxdZmd17moYeO0yYrL2m5pqXeXbERN
 TF8xmqoX2/GjTezwgGVsAw0UTIdCK/dckOD/NqnvUOyjc65mz8QV28MElO5nh8GZTv3l
 K3XwMyI2hh/DbuMp7wDB8FA7nGuHHY+rnh5HY8gcGU2G/cDOeMLAe0cI75qKDeIrUaGL
 R7vENBPjNXwqrWPHLZMV/9A1l67Pd2HzqMXZ+rLpTsqzGRdxmTwY3EDc1r1ovGmjD7xS
 gV2Gpwa+AYOVpeFB1GjI3i0rEM8WpG3zsFW2b4gzZgt79savlVpKJz1GyESBycSOUhTP
 /jaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PphJY1T/gyzvy1mB/CBzklEkVbGsRPvYLm6OwRq+C8A=;
 b=7ShYNOyX2/LBTlxORYG9oaxlkNK9ljt1uGV+sFelEbUSCExoRRlW9Gtw3J2/p2oGbT
 nGpAR5wNWws0Yj0vbvMUjSNcaHKANPcXAeLiRLB84E7L0FuxwQ29J6PcVaMr1AskSwSx
 7NFiPx6f8tpKxFoMkN8y5SY+cS3v+9mfNZDH0lw0lUgj3/cLIL/oBdohbhY+wOEjaiO9
 jRWtuRX9l0Q/Ssqi/W8Smi45rowMDwEFz4XMDZVRKWYnEo2hs4XeqjDRxph2H4+6BxGI
 Jb5tsxgxAhpI1bIo0JUJw187VgaQyTUw0pQ1DuQXohk7lUyMuFzY85tX0l8fZtu4d1O/
 8BaQ==
X-Gm-Message-State: AJIora9DHcCCrWoydIUo/ll/ucEP7fS78fg7BtOGrD6QSMTbpNtPRII7
 DMzX/E7fVUxX3AocHIap3fzotTrvV7ezjBQyY971tw==
X-Received: by 2002:a0d:cc0d:0:b0:31f:8a70:38e0 with SMTP id
 o13-20020a0dcc0d000000b0031f8a7038e0mr5914274ywd.347.1659015862201; Thu, 28
 Jul 2022 06:44:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220714182836.89602-1-wuhaotsh@google.com>
 <20220714182836.89602-6-wuhaotsh@google.com>
 <87ilnuda33.fsf@pond.sub.org> <YuGMFRDj3tLOIJK7@redhat.com>
 <CAFEAcA-_TkDW4tPxvmwEt-Rr6VAr_7aWNX2++CE+1G5cBPtiBg@mail.gmail.com>
 <YuKPVi9UjmZVqw5a@redhat.com>
In-Reply-To: <YuKPVi9UjmZVqw5a@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jul 2022 14:43:42 +0100
Message-ID: <CAFEAcA_90z+z+=TmVBjX9DfJwSB6aLJTrdXerEqNepOHDvfO5Q@mail.gmail.com>
Subject: Re: [PATCH v5 5/8] blockdev: Add a new IF type IF_OTHER
To: Kevin Wolf <kwolf@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, Hao Wu <wuhaotsh@google.com>,
 richard.henderson@linaro.org, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, venture@google.com, 
 Avi.Fishman@nuvoton.com, kfting@nuvoton.com, hskinnemoen@google.com, 
 f4bug@amsat.org, bin.meng@windriver.com, qemu-block@nongnu.org, 
 thuth@redhat.com, Hanna Reitz <hreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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
X-TUID: E/Rkp6k93gzo

On Thu, 28 Jul 2022 at 14:30, Kevin Wolf <kwolf@redhat.com> wrote:
>
> Am 28.07.2022 um 11:46 hat Peter Maydell geschrieben:
> > On Wed, 27 Jul 2022 at 20:03, Kevin Wolf <kwolf@redhat.com> wrote:
> > > If the existing types aren't good enough (I don't have an opinion on
> > > whether IF_PFLASH is a good match), let's add a new one. But a specific
> > > new one, not just "other".
> >
> > I think the common thread is "this isn't what anybody actually thinks
> > of as being a 'disk', but we would like to back it with a block device
> > anyway". That can cover a fair range of possibilities...
>
> How confident are we that no board will ever have two devices of this
> kind?
>
> As long as every board has at most one, if=other is a bad user interface
> in terms of descriptiveness, but still more or less workable as long as
> you know what it means for the specific board you use.

Extremely non-confident, but that holds for all these things,
unless we add new IF_* for every possible new thing:
 IF_PFLASH
 IF_EEPROM
 IF_EFUSE
 IF_BBRAM
 ...
?

thanks
-- PMM
