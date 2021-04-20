Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp2072471lfb;
        Tue, 20 Apr 2021 05:32:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzoCpAC7WyXRN+Zl53tWZ1+i6+Gg6EqUM2HcCqKEUtnIbIwrBzmfQ271+WHL/1FuBps10o9
X-Received: by 2002:a05:6402:17a8:: with SMTP id j8mr23092602edy.43.1618921956553;
        Tue, 20 Apr 2021 05:32:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618921956; cv=none;
        d=google.com; s=arc-20160816;
        b=o30eTcHBb8YWT4uzOB7gGRPz23pr97DxZXgWeUBj8SGxtGdO180p8uVDkP2IKrlt+w
         iG25Ybj10y4KzG9sg0AA3V2O5Ery6oTZiIcYDkTqGgSZ2VL34R3DKuFmPTcPeE3gs3wy
         vvTj8Lc5yTsjhhFJATq6irXNXxNJv+iLM9uGqdIKF9kZxi61j0ULi7JeIkLXjrmAUXg/
         Gnty6Nsxbxq6ejcWNxK23ImcC9pkj+o1NHzaTEjrS+2V+DB/cj4e71EymEjFRRQuQfKn
         u7DTOn6YHVoRxtC7HOeTe7Pz7pwHYQZzAJBE53VXSp/05ro1aeC708Dq58aJ6/xqL8pk
         I0pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=rVjx/Xnx63tt3dCW3hg+ziU5euDLjd9Szvgxqz74n7Q=;
        b=bxfZeubpFic+Fi8UtAEYR/z4VvZ9LrSnn5UBbF2wHElrux3s4eg9hNL4N2nn1TphLm
         /0mczgew1vt6qNJaWONkNVC46nWnN+17fIF5WiD2iJyKJUD2rEEOxKjpBlXTiAGzDcuC
         0Mo3g0KJ5pY0LHTaDqXs0Wm/QuNoVKvhA7WZ7giAFcmpNBZhKlbZYH1vML+KiGozhiU8
         6aGvlHWd6sXFXrJvy/aXZq9fdxsiwMWs7smwSs4XomKxDwGAK5jo3fOxaTrnZWZ1OkH+
         9ooCiwCUSdAeEF++UvYlWukswooeHe/3EPeSp0JQiDoBW9MtGFtnPvylkC1v1bMRk8MF
         xJbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kwuRy94t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s19si15262682eju.247.2021.04.20.05.32.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Apr 2021 05:32:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kwuRy94t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:37770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lYpYR-0000JE-Ha
	for alex.bennee@linaro.org; Tue, 20 Apr 2021 08:32:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYpXD-0008Li-6k; Tue, 20 Apr 2021 08:31:20 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:35387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYpX9-00036o-Q4; Tue, 20 Apr 2021 08:31:17 -0400
Received: by mail-wr1-x42a.google.com with SMTP id a4so37441455wrr.2;
 Tue, 20 Apr 2021 05:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rVjx/Xnx63tt3dCW3hg+ziU5euDLjd9Szvgxqz74n7Q=;
 b=kwuRy94tlJjkQhFMrLhx6SNoHma864mu/fDl/kF1tLX7ppcmSOFaYm4ifKXzSWN7X6
 u0zQ6gEZic6lxElRv8CS6z56yMxnwrLZS3z7ZVC9XS6JgcyDyQ16GXu/n2dYa0Me/329
 CMkDwkEZVL0RYkONvogrY/4AtkxWA+a+HpdA4QtxgI9iBrGMEDhmCk+NbVXyHjdecfNF
 3gU1CcAZLegPFlljI3uFicjUnQo149o89f4BOAlsvn4y6gKXK6LKgyagG82Hl3tfK5ik
 JGBKIwjxJ0h6Ha4Z5c85x1iAfjFYcK+SI22fjVSo69mF9/MlYcvPiuTTf+URZZ81FS4b
 urWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rVjx/Xnx63tt3dCW3hg+ziU5euDLjd9Szvgxqz74n7Q=;
 b=aeHZAzdw6gwkrnrNZ6ydFDvgvyBnOvSYhYgaNOMkB8yvmGQCMtWmxI9Wep8inr5RcI
 Y0n7saZmN/kPlDy02IkO9NwyPr9YRHCZ59bSfBg9NtY44jKgzrW8ho2pbV1CRIp8YkFJ
 EHCenvbfmLAP1OYhfC6YwIJVV5vn6tDjstauozmTKHxMEzbAcVyWnZ0B8l0hSb4gn3/8
 3d9wKge8XbUyOTY0mPGEF14TPaVO98D4UrVkeRP+dJKdqd6SXtBQMw2/DzpXhRoTdDyB
 vhgFY1KSQs3RHZJ4L7bhEtx6hCb+LdjLwZTn2L4ziFPDc3PhaaCwIEq08YmbdjvR4iUe
 /I5Q==
X-Gm-Message-State: AOAM531OYitCe7ItAYx1qtpoLh+pyti2S/r2IzCTAVaEfGWicsBvFfwD
 T2RY/TF5VuUPnJGZ/iklLBg=
X-Received: by 2002:a05:6000:184c:: with SMTP id
 c12mr20705146wri.125.1618921873690; 
 Tue, 20 Apr 2021 05:31:13 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id a13sm20796781wrs.78.2021.04.20.05.31.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 05:31:12 -0700 (PDT)
Subject: Re: [PATCH v2 for-6.0?] hw/pci-host/gpex: Don't fault for unmapped
 parts of MMIO and PIO windows
To: Arnd Bergmann <arnd@arndb.de>
References: <20210325163315.27724-1-peter.maydell@linaro.org>
 <1df78911-9858-b747-b22b-7e5254cd3cac@amsat.org>
 <CAFEAcA_TuKCJ31xsv_j49oQfOFuEipmMnsNb2czPZRMPTN=wxg@mail.gmail.com>
 <bb3cc932-5111-c388-2770-3c1110dbc89f@amsat.org>
 <CAK8P3a3zeYC0wiT2Or3RicPbVBY4TJCOTa6ZN3rT=e4XGR-eCA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2ab20805-cd19-b628-00c3-e8b601c323db@amsat.org>
Date: Tue, 20 Apr 2021 14:31:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAK8P3a3zeYC0wiT2Or3RicPbVBY4TJCOTa6ZN3rT=e4XGR-eCA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tpNZjfn9XLi2

On 4/20/21 2:26 PM, Arnd Bergmann wrote:
> On Tue, Apr 20, 2021 at 1:52 PM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> On 4/19/21 3:42 PM, Peter Maydell wrote:
>>>>
>>>> I suspect PCI-ISA bridges to provide an EISA bus.
>>>
>>> I'm not sure what you mean here -- there isn't an ISA bridge
>>> or an EISA bus involved here. This is purely about the behaviour
>>> of the memory window the PCI host controller exposes to the CPU
>>> (and in particular the window for when a PCI device's BAR is
>>> set to "IO" rather than "MMIO"), though we change both here.
>>
>> I guess I always interpreted the IO BAR were here to address ISA
>> backward compatibility. I don't know well PCI so I'll study it
>> more. Sorry for my confused comment.
> 
> It is mostly for compatibility, but there are many layers of it:
> 
> - PCI supports actual ISA/EISA/VLB/PCMCIA/LPC/PC104/... style
>   devices behind a bridge, using I/O ports at their native address.
> 
> - PCI devices themselves can have fixed I/O ports at well-known
>   addresses, e.g. VGA or IDE/ATA adapters
> 
> - PCI devices can behave like legacy devices using port I/O
>   but use PCI resource assignment to pick an arbitrary port
>   number outside of the legacy range
> 
> - PCIe can support all of the above by virtue of being backwards
>   compatible with PCI and allowing PCI buses behind bridges,
>   though port I/O is deprecated here and often not supported at all
> 
> The first two are very rare these days, but Linux still support them
> in order to run on old hardware, and any driver for these that
> assumes a hardcoded port number can crash the kernel if the
> PCI host bridge causes an asynchronous external abort or
> similar.

Thanks for the clarification and enumeration Arnd!
