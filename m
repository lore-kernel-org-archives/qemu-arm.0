Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp519067lfk;
        Thu, 18 Nov 2021 03:53:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzPeoiPR9SDmfKI3mjLTFPMXwISUYnJWZ15F3Kml+YRd2ZNCS8NDpSvnFjvK1mjYfCOWf+0
X-Received: by 2002:ab0:4301:: with SMTP id k1mr35217808uak.75.1637236412765;
        Thu, 18 Nov 2021 03:53:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637236412; cv=none;
        d=google.com; s=arc-20160816;
        b=sypUROEduWAPbI0RbpcGqJnRu8EctlAQHRSiHbj+ZtU1hEswxtCaBNKmRqNP4akN7E
         rs4YpCakRy8z9ah/aqFe+hWZWA5xylqOfsFjxltv3beibAiAZIByk150833tE/d/szol
         F3QfhCmV+v2pKm0TcYT5lcNeFdtFRZAmof0Px9l/s71QhvXctaRHHuWxJvO72Q/1gU2W
         Xg7MrIKcnVMG6gB1fxla1nqER1pZyPeBbVIPSfufD5rPmmGpEGwCbfkbU815Ejpt9KDn
         G3d0KEgEpQvq58lnV8Z/kJDfidq1UHukTf+gdhXhcthsUWYFWoW4usvS6S65vrsmwKGH
         ILTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nHQBRsoj5lcb1DO90s/z+9+qF17cPsIyfwCJBHM0f+M=;
        b=dtNGkDvGtyBGI9zDiuOArwHIosF1j3h/fXpQBdQgC0UIQ3MsMlpzL4CtGOC7cbmQFk
         LnSAbHTSYRQ2BlLFdLlmhT4zx+JUJfzeWJyoIehUOu7543t6hjhGrBmZNREzWP9x1Nc5
         oBGILukBGRvFxdZa1uFxnWyyKgGHEUDefbcbKLQMBLEpVmrI0ZaB3A06peG4LsGsaAYW
         WP6BPwaKkxVljM9147IEuqhuQHXuJ09zrDBqvJBcqxwjKy/ky1vCqp624XOhetR7WxY9
         VYkYerHVEe4l9fxUPaEnUkR8Z5WFwGtuZbB7qtUgkCpyKQ9IRjoW0BmZiSO8wCWHPK2O
         7k6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=S4nXaLrt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m20si5741029vke.10.2021.11.18.03.53.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Nov 2021 03:53:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=S4nXaLrt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mnfyu-0007KW-6R
	for alex.bennee@linaro.org; Thu, 18 Nov 2021 06:53:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <janne.karhunen@gmail.com>)
 id 1mnfyl-0007KD-SO
 for qemu-arm@nongnu.org; Thu, 18 Nov 2021 06:53:23 -0500
Received: from [2a00:1450:4864:20::130] (port=42920
 helo=mail-lf1-x130.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <janne.karhunen@gmail.com>)
 id 1mnfyj-0001De-R2
 for qemu-arm@nongnu.org; Thu, 18 Nov 2021 06:53:23 -0500
Received: by mail-lf1-x130.google.com with SMTP id t26so24633848lfk.9
 for <qemu-arm@nongnu.org>; Thu, 18 Nov 2021 03:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nHQBRsoj5lcb1DO90s/z+9+qF17cPsIyfwCJBHM0f+M=;
 b=S4nXaLrtSjJmUFYRLRCSgfDalVoG9tKZfVFEdkPaVmpHT6f1Za5LhTfXtA2KacHznT
 mB9efzZJc+NaiibH5FDkAtatSxiK0+pVolfZu19+nqBQzPrE5Ypu+U622BxTyvVIiPd8
 POShN9Tirq9TxPADj4ZKk6XWDvp6qN5x6NUzMDXAoSKAgm8m07+d+lsQSl1a6JGQQtGg
 XVFF8LvhuSgrfMPsGa9+Log7pUs8m+1ttIT2MlXIyXZqjelO+DrjpCzQmAgReYm2MVdh
 +PoOnD7nZPAB97a+Oblm6x056ypYl7u+0vQgNWtXEIdYtqgSYxrV/695pOMpR2ilk1dE
 /+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nHQBRsoj5lcb1DO90s/z+9+qF17cPsIyfwCJBHM0f+M=;
 b=L+P/cq2wqOP8Xk15EVZQuw14yjrwwq3hzTY99J+ALUmTL2SpSAJ1euWFkirXU/EJwB
 RZXiN52SfhsLbVlKFQR2QU1JqYNJAyrSjcp7x80SQdlhmGdRv+Xs4k5OJGr998aIe435
 BFd0wX7C8LpvyVgcrEdXm/fTdZZszg3I+rnxyNwtIe3ubUZVIhCVLmyvXAOkQ4Vk1rBN
 KIKXPfM5TPsdS7ixwC5/0f8us7EAdZNCZ80cvbnsbdiFd4dccU9r4Vgzdr7EbbkNZCwm
 7IbtkNWb6qkLUcqaK44g+Ycrr+yyI9WXYSx712FlbLgSkNcHbFfLiOFIY9FOTw3t1Vg2
 FYrg==
X-Gm-Message-State: AOAM531JRiP7NtxUnzvdRqk0c2BPSGouauwIbl/WSVTO0My/xjAHmV3R
 vTZi0lHG0e5MJ3ms0nxiD2RVC+LfOEVTqxNtrlI=
X-Received: by 2002:a05:6512:405:: with SMTP id
 u5mr22604554lfk.271.1637236399946; 
 Thu, 18 Nov 2021 03:53:19 -0800 (PST)
MIME-Version: 1.0
References: <CAE=NcrYJfjF-pEiX-tY7NfiTbDfXtcxnk5AnBVwc2AX4cpeCrg@mail.gmail.com>
 <CAFEAcA-CKqZPF8A+WsXE7gLgOPPYncteomvMSOcAuLEkB9F-Ew@mail.gmail.com>
In-Reply-To: <CAFEAcA-CKqZPF8A+WsXE7gLgOPPYncteomvMSOcAuLEkB9F-Ew@mail.gmail.com>
From: Janne Karhunen <janne.karhunen@gmail.com>
Date: Thu, 18 Nov 2021 13:53:09 +0200
Message-ID: <CAE=NcrbPW4LVihnZksOCJ6NcQQYkwJudbqrp-sUEx663+qyG5w@mail.gmail.com>
Subject: Re: softmmu 'at' instruction support
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::130
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=janne.karhunen@gmail.com; helo=mail-lf1-x130.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RXbnJySdLw/S

On Thu, Nov 18, 2021 at 1:41 PM Peter Maydell <peter.maydell@linaro.org> wrote:

> > This looks like a bug to me, please comment if I'm wrong:
>
> Bit hard to say without a reproduce case... You also don't
> say what QEMU version you're using.

6.1-release

We're hacking on our own hypervisor out of which most things are open
source. That code is just this
https://github.com/jkrh/kvms/blob/4c26c786be9971613b3b7f56121c1a1aa3b9585a/core/helpers.h#L74

That hypervisor can be built and run with the qemu from the github
directly, along with everything required, but it's a bit of work.
Easiest would probably be if I'd do something where you can just run
that function to resolve any kernel address with the stock kernel
while sitting in an EL2 breakpoint.


> > 0x0000000100004a3c <at_s12e1r+8>: 80 78 0c d5 at s12e1r, x0
> > 0x0000000100004a40 <at_s12e1r+12>: 01 74 38 d5 mrs x1, par_el1
> >
> > (gdb) info registers x0 x1
> > x0             0x0                 0
> > x1             0x809               2057
> >
> > So that would be translation fault level 0, stage 1 if I'm not mistaken.
>
> If you want to walk through what QEMU does and why it
> returns the fault indication, you can run QEMU under
> a debugger and put a breakpoint at ats_write64().
> That will do the page table walk (in get_phys_addr())
> and you can see where and why we decide that it should
> report a fault to the PAR_EL1.

Thanks, I'll do this and post the results here. I've been walking
around the 'get_phys_addr_lpae' a million times but not via 'at'.

Nice to hear it _should_ work.


--
Janne
