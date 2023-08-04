Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp1816499ejb;
        Fri, 4 Aug 2023 08:09:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQErN2b8FiiFMrLIoXlsujipnQScF5pNxzdCpw9IOa2xDrIZHfbIaHSafs0beJIqyxnicQ
X-Received: by 2002:ac8:7d4d:0:b0:403:dba5:4266 with SMTP id h13-20020ac87d4d000000b00403dba54266mr2780217qtb.32.1691161791466;
        Fri, 04 Aug 2023 08:09:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691161791; cv=none;
        d=google.com; s=arc-20160816;
        b=y1fc/Hd/SCeVBisMD0wcBh6wzNs6Wa500dRl7/nmd14nZOJn8TD5LsS6C4xJcShwt3
         oziIIQu2uLq+rIoFEc7BoWzGwLZYSlKWE2hbhtcOv3dlQtd607i4L/pS61jJxEKLlV68
         8fIwmw0lhqTsaRNJaTXAqkLqcOels36QKjzqH88cNhNknEP1Vj51DBbOZh73LjEGENtG
         gxCxzoLtPLyEwg/aJkvrGDOOyJnyKMHQNyGHawXRqs5U7pZgyb8Wm3Fj3QQ7Kjbf8JTi
         8S6+o+trflOZji15/0iCaIGdjPo3sEuy2jY+AjbiMQy4M+vx+31/NcM+h6Bf4uE9Zl8f
         CmOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=u+cEEtL2itPWygNoL5V84W8YKVevCh1MXGAy3BM4/ds=;
        fh=Pe/MIC7yvB073Sd6/4lunpd6aUW6AVi1jfN++S25pLo=;
        b=E+p3y337/LnWAb237oAtbUG0Wy3nVQwu7bCBNQHgEEhIT3rH1uYQjSBCcXnWdE3Jpo
         GWh3U8BytITB1yQ/QIAxsdphTIN8pviapO2B49r5o11rUOL+4nfFJnPLjbzS1BIm6FPb
         //H1iPUu9kZw85NqR/8XmBKRuH507owzJxzKK6jUdv0zF9/MjfmetFU7pjL+iWa9tkNA
         8XiidqZwaLpUky70M1j0dIzboy3UXognPZtvKPu8mYKhNcWfIFo+7eOqId+Lc2XxlnQP
         4qLy+zEgsfia6uuud7JUwhNQ4nrsfdrVp/etPtEFy4XzSnNKtf8B9DgfTRtrtcg8/8f7
         IHKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Kw88Yzg9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j15-20020a05622a038f00b004055930c709si1372499qtx.708.2023.08.04.08.09.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Aug 2023 08:09:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Kw88Yzg9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qRwR1-0002VP-W9; Fri, 04 Aug 2023 11:09:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qRwQz-0002UY-0n
 for qemu-arm@nongnu.org; Fri, 04 Aug 2023 11:09:45 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qRwQx-00068z-FQ
 for qemu-arm@nongnu.org; Fri, 04 Aug 2023 11:09:44 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-522294c0d5bso2827152a12.2
 for <qemu-arm@nongnu.org>; Fri, 04 Aug 2023 08:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691161781; x=1691766581;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=u+cEEtL2itPWygNoL5V84W8YKVevCh1MXGAy3BM4/ds=;
 b=Kw88Yzg9uLt9i0e24KgwIyfctm7E0UJmT3BMH+IKadfDbJIu/pBgLAD/ZkEeiEu3X7
 SLFtoDVabAfqO+PUAObRxpem/tIOL0l+0eLmyNY4RVN2RFjeACXz9C4vBRls7a29nk7x
 bvv/H+tnxZ0PpfOFBCWoiL+mk0eOYUkeYSECoUIsauWFOROJGxGB4Nsfu32XfSw8bQL8
 DPHgnV19Ig2FzXkUeqftdDeqpj1Fr82F8yvk9J3Vgq6rVbNFicb0/7hLQd+iV/3tG2rK
 k8dUWkfkrCizxoY3QjOmpnWH9JvCcZggiJYZ1CwsR3X+euFfXCRq2DP+jwuZVxd4oPtA
 g/pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691161781; x=1691766581;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u+cEEtL2itPWygNoL5V84W8YKVevCh1MXGAy3BM4/ds=;
 b=hh3hQ0DcSeLZpmLFBlxl/Q/7L6+6FL8UofnRjSFhkU7AjBQaxWO221jh8oy1hhoffD
 P5Tdh7H/wF8vYXgRsxRWsNOEAtJ5pzWCDr05p1E6ubVrayCc6koS/VApb5Gj3x1xExV9
 FXv04Ba3PCKnD7tMCWpEl9tyZQFz3zaPXbL0p2Ew8ZsSpucWUhs/5lDBCgzWCm5Ne3sk
 tu9SegB72eAqVpXcMdeBHmpYT0owit/MnigthjYkUqBVrQZeAl6XxPz2YeiuSXrs5vnN
 JfQARpcjQnzBAXKUCm6cuaH2pfQGe5Kt543Xa5KpaTPQ5HYQNtb1EYkAGqxBXzRyOO+q
 TaMQ==
X-Gm-Message-State: AOJu0YzkbhCg5S8+ArpiVTugn8IodFVet1wdb2w2VATb4CIl8OnQL9jH
 5BMNSJFdtrdtcrSF5JfVzYQQ+GUsGF/iIINPFvW9gw==
X-Received: by 2002:a50:ff1a:0:b0:523:1fa2:4f40 with SMTP id
 a26-20020a50ff1a000000b005231fa24f40mr1130761edu.19.1691161781035; Fri, 04
 Aug 2023 08:09:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230726132512.149618-1-sergey.kambalin@auriga.com>
 <CAFEAcA_xyq3KjKVkrbtGktbS5OySZU2Q-gh_qqzv_iqnnDbQqQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_xyq3KjKVkrbtGktbS5OySZU2Q-gh_qqzv_iqnnDbQqQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Aug 2023 16:09:30 +0100
Message-ID: <CAFEAcA9XfkPtqdfGANXy9xAdxgTbeUTRAZVMGhuhLhwqH-x7Qg@mail.gmail.com>
Subject: Re: [PATCH 00/44] Raspberry Pi 4B machine
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 4zRxzrDHPVT8

On Fri, 4 Aug 2023 at 13:13, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 26 Jul 2023 at 14:56, Sergey Kambalin <serg.oker@gmail.com> wrote:
> >
> > Introducing Raspberry Pi 4B model.
> > It contains new BCM2838 SoC, PCIE subsystem,
> > RNG200, Thermal sensor and Genet network controller.
> >
> > It can work with recent linux kernels 6.x.x.
> > Two avocado tests was added to check that.
> >
> > Unit tests has been made as read/write operations
> > via mailbox properties.
> >
> > Genet integration test is under development.
> >
> > Every single commit
> > 1) builds without errors
> > 2) passes regression tests
> > 3) passes style check*
> > *the only exception is bcm2838-mbox-property-test.c file
> > containing heavy macros usage which cause a lot of
> > false-positives of checkpatch.pl.
> >
> > I did my best to keep the commits less than 200 changes,
> > but had to make some of them a bit more in order to
> > keep their integrity.
>
> Thanks for doing this -- I really like the way the split
> has turned out, and the overall structure of the patchseries
> is good. I'm going through the patches individually
> (which will probably take me into next week to finish)
> but I'm not seeing anything major, just some smaller
> issues.

I got through the second half of the patchset faster
than I expected, so I'm now done with my first pass
review of it. Please let me know if you have any
questions about my comments/suggestions on the
individual patches.

-- PMM
