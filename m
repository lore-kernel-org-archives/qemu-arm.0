Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp2230255wrs;
        Sun, 18 Aug 2019 22:26:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwAoYuWJx+myGiUjcQLtF9bgumwuyZbRE6w3gfrsfGcJnA1gY9bshi4u72hzhxlzOsgAb+W
X-Received: by 2002:ae9:f10d:: with SMTP id k13mr9127630qkg.68.1566192414909;
        Sun, 18 Aug 2019 22:26:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566192414; cv=none;
        d=google.com; s=arc-20160816;
        b=XTNZeXKsoOBEh44WmNgD4Kc2Xi4LRlIfJPTIagYreN/8UdgTqJqjwTaBlYrHMWnzrS
         mxbGd4vs+g5ruEHwqGhacpJGxXl5+BzD5nnT/aj4GiIF0xx4y/T1T99AbvbQUFZtmBvm
         2wT7rReyQ107nfHi1KwOepohiUIq/9kAbc4POYo8pEptaCeMfqGQF70mNGMerGz4a+nt
         hcAA4zyHyEph0+9RIdJPXHBb/6iYupluHL6/LAX/K3VPsZSFJ1NnKbORuHu0xVi3rcT6
         RQQhFwexz6PuE6vwBwWFI0CkvxeVFxonhOZAgxuTn7M/FhN1D65iIf2TSSfktMsxf/Eo
         dgqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Kw8gZukUQn7Y0YiR2lb3z6XxAV+KtL/W1eXtQ5TEyOI=;
        b=zL46+KehXGmvs8oNXlBBhLD5jZ1tfJIqRKr93a7qVdnHsIJhs4w8efILG7Ie8hv+Wj
         UGozAl9CTtYc4GPmZonBUSHjIdZ9bIC3pmjSuw7eGYG7VSiOrKKdrLKCRvrmby5GJVKI
         Mm6v/hhmp6soIK7+P48xH4L2MQvdOxm/Dgn/hwV9lUtNXeJTyJKkdgwr6Tb7lqNQI7WZ
         2ramM0hZzu2Yg2vSiB6EQHXwNbbfI23XEbT1X6nzMWk2K0/32a+tNrbJSOcs7wXcsPBC
         /piy/DhSOUkTf6jxP02+e4nBO5+HuuNzAZc1O7kL75uMOjaMoiCdYMEj7jQ7Y3J3ZC7M
         c8SA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=atvHOqa2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 36si8349321qtu.149.2019.08.18.22.26.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 18 Aug 2019 22:26:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=atvHOqa2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzaBy-0005JN-5e
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 01:26:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45224)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1hzaAA-0003u6-1d
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 01:25:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1hzaA9-0005me-3I
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 01:25:01 -0400
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:35525)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1hzaA8-0005kw-Tq; Mon, 19 Aug 2019 01:25:01 -0400
Received: by mail-ed1-x542.google.com with SMTP id w20so477571edd.2;
 Sun, 18 Aug 2019 22:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Kw8gZukUQn7Y0YiR2lb3z6XxAV+KtL/W1eXtQ5TEyOI=;
 b=atvHOqa2h1M7il1dJDVq6U0vuvXfIHLCSYRO8vn4ITyO7qkL4x6lbeukOX7yDvz+bl
 Z5RAmKiEeH2NaydGRpSczxEdgp0a70+ZVtwIzlPJU/XvH4x1JlLCQp8xHM0XZNotyyWf
 MFrXdcCegQWkA+/e89tBc0PzJ2ptdcnHENcHUTA5mshO/fDcfnN2iBzgCLzI6CiWJqZK
 QUi/E2cP1218e+cLxNraZWSAPhHxD48hgx4rsL5vafH5JnDxUL83ZqpMMmSBtE8JEgVo
 F4AOPlkk++0iBIA33+IEIdzftTHhxL97XNaOBOD5U5y2LfGZ3UHiJ0yIFACSRtjluQ87
 svLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Kw8gZukUQn7Y0YiR2lb3z6XxAV+KtL/W1eXtQ5TEyOI=;
 b=l9HRm/bCtc4WT+qenfvBDv8xkohaB7WHFkGrgDGb6qMftpPs9Zs38bOJqtjvEmWJDo
 /zTBOJom7sEHPFxd51Z2J7YkccJ6KIXbyuCHziyTa/DfCE10PffPqTJV108PpRv6twNx
 MLOK5M+xHmoaFp14hoXeS/Qpy+2jI5/9zICidx6xTOLFQsIeNGFIxaXjvgAaowpwHMH7
 p0hQ87awlt2AbjAFqj2FNvFQB9bozMzzRMLnScxSXKomKClwFeJzwuVnD6dqvTeqD2p5
 TyNIwDJk7AZjINGDSsfEtG1/JQ65MH0h5Rcgg1JCmLy9kxVSiCUGX+XndNAUtWabnXDf
 6K1w==
X-Gm-Message-State: APjAAAUUj/WRU2wQFJMLJtcGtmOfCBjGw8DXjTjp/d3UCpuYpf/2RTHm
 p/BrM3345a1lgn5RA69x4dJNKkTeMRTWsq2D/ds=
X-Received: by 2002:a17:906:32c2:: with SMTP id
 k2mr2762236ejk.308.1566192299260; 
 Sun, 18 Aug 2019 22:24:59 -0700 (PDT)
MIME-Version: 1.0
References: <1565335544-23584-1-git-send-email-bmeng.cn@gmail.com>
 <CAKmqyKOyTXgs5uZuukZjAEqQkTtf1U+vD=u9_470+OgsfaQdqQ@mail.gmail.com>
In-Reply-To: <CAKmqyKOyTXgs5uZuukZjAEqQkTtf1U+vD=u9_470+OgsfaQdqQ@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 19 Aug 2019 13:24:48 +0800
Message-ID: <CAEUhbmW0sCEN7mzSfCvUBSqhAGD3v5JyeDj2iSqs0MQJv13bag@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::542
Subject: Re: [Qemu-devel] [PATCH v3] hw: net: cadence_gem: Fix build errors
 in DB_PRINT()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yRY/ZCfLEwZw

On Sat, Aug 10, 2019 at 9:58 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Fri, Aug 9, 2019 at 12:26 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > When CADENCE_GEM_ERR_DEBUG is turned on, there are several
> > compilation errors in DB_PRINT(). Fix them.
> >
> > While we are here, update to use appropriate modifiers in
> > the same DB_PRINT() call.
> >
> > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>

Ping?

What's the status of this patch?

Regards,
Bin
