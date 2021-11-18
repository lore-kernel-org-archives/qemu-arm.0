Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp814801lfk;
        Thu, 18 Nov 2021 07:41:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyrXGvZauqmyQLxc05uzLDM4YdCRcnd658MVXYGdC4O44AGhD3Cp6euKt4NGGjBzq4l+FAz
X-Received: by 2002:a67:c40c:: with SMTP id c12mr81410172vsk.16.1637250079444;
        Thu, 18 Nov 2021 07:41:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637250079; cv=none;
        d=google.com; s=arc-20160816;
        b=U9A27H/7eSRAAQ1oHg15Ak2TLfiYjOA39igVFfLvX18Aot6oZL2CLbWj5IUAbV6XYI
         a+HFBIUo7ujNfUHMUspv9rmz3SSBeHeCyliVbwrZkdCWbgTek8qLhBDw4a/ufbj8UXEF
         8lloOwU0dBSercNYyF70HFyulZQ0iMBAF1IRjQrJkduM34tzQ0Hrxbi0cd7DBInIJVGC
         fGTDbRJMPVP3xSrTgdPtkMkiR7/NshtwZoHLzhQxLbB8ezKMq6vBPpwiJrDYoAbHfRc1
         5XALheUAOPVbWZ+DS27UdSJmeAhohX/LPRLlMVsrtr8b9gFHyfdy0/kUJog0n9N/DauR
         3Onw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Or9aclFld4t4+xGVLP7iNv56YT0kaZqRa8Kdd1fKAg8=;
        b=Vnlf7SlN5KXLHYCMK7LYGGj8v1CQsvPv3EQxz5tk69Xk+D+4Srq0IeDh5/A+4nhUZF
         ERB0IDKg0RBqQX9r/u/ySwxW+ANX54e8OFvawzLhJLYEX9pDyDzLVlKZBYPdbycloh0i
         CpW3xAjALjEegIHNQsQ6qNXdl4NeJEsE3/qZDmabh2+JuYhEHU3tV8pSD4IfO93QSS9r
         oHeMBQ6tGdtK1AgmbqRadsa32jX+KjpzOsUdkk630/lCnRgriNNA7sElP0ca9ogph3Ln
         nwxJEMgMbWvvI5GJ8WiPiTRTENLaVURaduyR3RpF0elzrPJNTIN6tvs/NjKJghA/wNL0
         K2wQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LOI7t23D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g77si387294vkf.52.2021.11.18.07.41.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Nov 2021 07:41:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LOI7t23D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mnjXK-0001dw-Pt
	for alex.bennee@linaro.org; Thu, 18 Nov 2021 10:41:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mnjWj-0000sr-E5
 for qemu-arm@nongnu.org; Thu, 18 Nov 2021 10:40:41 -0500
Received: from [2a00:1450:4864:20::432] (port=36433
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mnjWg-0007rg-DE
 for qemu-arm@nongnu.org; Thu, 18 Nov 2021 10:40:40 -0500
Received: by mail-wr1-x432.google.com with SMTP id s13so12403926wrb.3
 for <qemu-arm@nongnu.org>; Thu, 18 Nov 2021 07:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Or9aclFld4t4+xGVLP7iNv56YT0kaZqRa8Kdd1fKAg8=;
 b=LOI7t23DI2L9bHsYksfxGAB/xY4CncMajOY1FbQf+Y/uHtxqeWAB1MASW0/5ondKkC
 UyqRvlRqhXeCydSzRLTkI2YyAaPDZykWV9TnFpbcJevSr7Lwd3kF8Qpj+5GGmyq8W37p
 yc23Qx/Admgnikch12UFRm4qTe28F4iT7GT6emTgpBpO8QQt1LPdXaE/Sy4L59X3jlKb
 7tuRX5Bt5naPc/0fwv5h6tLciWRmUsyCXSdfQZA0T7fwNI1/z9kmc8pIRE2hPQo4UQqK
 AOto8ebEkvV1NpzUlQaJsBDR/LQQHotbB7TKIrk796jqIq83Q+4nHZgtKxk/waiFZXY5
 WNhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Or9aclFld4t4+xGVLP7iNv56YT0kaZqRa8Kdd1fKAg8=;
 b=kBMRer0hn0pMEnMjg6BLc0P7xa9ByMnqoP++jHdSw95shFMLYEH66CsDcmXnfvfuRt
 vukQMbo5AkZHXQmn6wmLejIl3cb25nQKS+pLwz2bAViKtlnj2CV5iqfMP/v1ZX7tNR/P
 aD0TPYgRS1wWHTYIH/dOa1bcb8McopCAarJETJNO6RYv/7nKQe0FbA8NDqyrCZlq+AaB
 9bouYUyVzi54gfftN+OJT20EqLuddKyg2fzi1cLE71Q/e5Dh0qGInUHNNzlCKUXX2ZPg
 1OrP1XSfx+TckbQ1LFlBaatBtc98/ROj8uWOiGhEgQwzneU2jgfRFOW4tCQLuVSU3ZLq
 HSnQ==
X-Gm-Message-State: AOAM531RFt/iCmC/8ii/rKx6HUJi66CwqSg63YOB/sk5o5v+63DKmOjM
 +zywp2YrbHp+Eu/ObM8e3b4wSAowr3a1KD/CB8TOlA==
X-Received: by 2002:a5d:6151:: with SMTP id y17mr33136944wrt.275.1637250033873; 
 Thu, 18 Nov 2021 07:40:33 -0800 (PST)
MIME-Version: 1.0
References: <CAE=NcrYJfjF-pEiX-tY7NfiTbDfXtcxnk5AnBVwc2AX4cpeCrg@mail.gmail.com>
 <CAFEAcA-CKqZPF8A+WsXE7gLgOPPYncteomvMSOcAuLEkB9F-Ew@mail.gmail.com>
 <CAE=NcrbPW4LVihnZksOCJ6NcQQYkwJudbqrp-sUEx663+qyG5w@mail.gmail.com>
 <CAE=NcrYPqu9oa0UZM7VRDtUqQWg93spVOdRLQGs0hdHtqghGVg@mail.gmail.com>
In-Reply-To: <CAE=NcrYPqu9oa0UZM7VRDtUqQWg93spVOdRLQGs0hdHtqghGVg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Nov 2021 15:40:22 +0000
Message-ID: <CAFEAcA_uzvNuMx9KJa=Z_Dwuonf10ekTDUbNf9bZSVa+hNtHLg@mail.gmail.com>
Subject: Re: softmmu 'at' instruction support
To: Janne Karhunen <janne.karhunen@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: zHVBKm9vC6kr

On Thu, 18 Nov 2021 at 14:25, Janne Karhunen <janne.karhunen@gmail.com> wrote:
>
> On Thu, Nov 18, 2021 at 1:53 PM Janne Karhunen <janne.karhunen@gmail.com> wrote:
>
> > > If you want to walk through what QEMU does and why it
> > > returns the fault indication, you can run QEMU under
> > > a debugger and put a breakpoint at ats_write64().
> > > That will do the page table walk (in get_phys_addr())
> > > and you can see where and why we decide that it should
> > > report a fault to the PAR_EL1.
> >
> > Thanks, I'll do this and post the results here. I've been walking
> > around the 'get_phys_addr_lpae' a million times but not via 'at'.
>
> Here we go. The debugger attached to the kernel says:
> (gdb) info all-registers TTBR1_EL1
> TTBR1_EL1      0x41731001          1098059777
>
> That table is populated by the kernel and looks like this when I print it:
> Table 0x41731000
> 000:0x000000ffff9803 256:0x000000fffff803 507:0x00000041fbc803
> 508:0x000000ff9ef803
>
> Note that the first gigabyte is populated. Then we move to the qemu:
> Thread 4 "qemu-system-aar" hit Breakpoint 1, ats_write64
> (env=0x80ec001fb8, ri=0x7ffff5b802d0, value=93825004025122) at
> ../target/arm/helper.c:3691
> ..
> 11610     ttbr = regime_ttbr(env, mmu_idx, param.select);
> (gdb) n
> 11616     if (param.epd) {
> (gdb) p/x ttbr
> $1 = 0x41730000
>
> So it starts looking from the wrong table (off by one page) ... ?

My guess is that your guest code and QEMU disagree about how aligned
the page table needs to be, and that extra 1 in bit 12 is being
cleared out because QEMU is implementing it as RES0.

TCR_EL1 = 0x400035b5503510
so TG1 = 0b01 (16K pages), T1SZ = 0b110101 = 53

Page tables for 16K pages need to be more aligned than those
for 4K pages. See table D5-12 in the v8A Arm ARM: for 4K
page tables TTBR_ELx[47:12] supplies the page table address,
but for 16K page tables only [47:14] do. (This assumes you've
set things up so the initial lookup level is a 3; if you've
set T1SZ so the initial lookup level is 2 then the table
might need to be more aligned.)

-- PMM
