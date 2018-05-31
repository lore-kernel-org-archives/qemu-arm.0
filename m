Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp5771606wre;
        Thu, 31 May 2018 03:50:31 -0700 (PDT)
X-Received: by 2002:a9d:caf:: with SMTP id b44-v6mr4043455otb.270.1527763830727;
        Thu, 31 May 2018 03:50:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527763830; cv=none;
        d=google.com; s=arc-20160816;
        b=bu0wqstuyHWnFpUNFM72BT7YgE0z+E7QFWZW1egGGcWNvQQ/Ybr/pT1sZSf5mBqm/1
         3HgwIN+tRznLIWqTod1BPa44peygrcHtNjtfzi/j7BVbet1bTidOai/J2pnAXZ5TcjjY
         qPV/HqB2/7RVCtALqpAPONhoavIRsm+xokwpxXfsnuJ/xVMOE1Gzs8FDlg7vM5C7i4A/
         +RfNzjDYxVKSDxKeet3nJEM7UH9dJNIt5ZKkZqHsMp1o1JzNa8IF7mFkmXV3koOc0oCQ
         WjKNR0xfBchKroTKVbhPjBQMhSKUDMmQpNKdaHytgniY/zO3et24sGMI2blFIAfgwMgE
         5iwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=OGUMixXkxmOz5JStg35aDoNX6ye5nmcPRUspLnWkyMA=;
        b=fAQ8JApdunt9dCH6vU7oouu4fD7y0duXgJp7JPgbADOEornXnLJUz8qO/6xopyfX+6
         N/zlhpQB29K+ehZa7mnbhLRHlax3rLw8JKVWtJe6aaa6a9qenXAuUKEH7so5fBYedcgD
         jc9M89gmyUMStp42uaL+zPvTZxmeG2nfH3i0aM9wmWaMhWabTUdjq4gSkKV2TDVQ5qn3
         mDKa7Yq5nl5d+VaeVl/PEqV5c0vTitszVH9LBiJ7j8cywAOWYN7lqpkuRlzHiAFxhPuK
         WDgjklzfEqLzIw+SufIKb8TIF4/373rNcZTNbXxW/WcEUyfxRm1fdnVwxjq9yPtG4lMD
         h1Rw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UQYesy93;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id e10-v6sor14637546oif.315.2018.05.31.03.50.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 31 May 2018 03:50:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UQYesy93;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=OGUMixXkxmOz5JStg35aDoNX6ye5nmcPRUspLnWkyMA=;
        b=UQYesy93cL8t2QT4XqNH8H7lSELtstwo0ms5ee8XzUqzAeD2nal161nLWLPT3TNzb0
         tBemotHOln1P0EJePJ6xtceDNjJg5hhKkjQnnVSQ5KquZcj+JiY3bAN/yHN9/Gavcm6w
         zLM3SwtKEn0JOJD3Se69YvShCFc8c8WpMelMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=OGUMixXkxmOz5JStg35aDoNX6ye5nmcPRUspLnWkyMA=;
        b=ZCv2S0qzbININHphe4fqoIzhmE1PbOvgmLN+HNaCiKRVMXOC1kSNpg7ti4suEWFWsM
         rdoCPNF7mgziUXHh498tXPwSSu8+2kFc4LENBy3LvUuvilvJ4rx3c/n0TGmTZoKiWvoA
         b+VJtdOL6BC6KXoBqw0RR4JUhrC8G6Up/z8g/exSyxlmD+q41nMgYcO1zG5v2gaIA7MP
         0x+zUVhKQy9iMTtGB/zvRl2hHAgya6DhvW0/vYy6U0oFVF2dHRcngJvnK1+J6I0UqkS7
         mqrnHK+e9L+QRW2PkcJ+s0lSTBXkCaJubgdqmJH43Kawawj4cPDQLvZ/gt020CXuyLu4
         JoHQ==
X-Gm-Message-State: APt69E3HdoVgn31LQOunJs5i9f1kYMTRjWs7TU/fkX9UeEGtgL+WmJKs
	3O3Il/jcOpm32hcq427PP5gCNBrElm9BHXNxxIZILe7W
X-Google-Smtp-Source: ADUXVKIwzTLhK71x+AwbmrBq9+LQKZ3kRHo5Xil06rBdeErugPF9Pa+53VZEu1ca2IswzFCa4hL/hqZxJ8wwk0HWgBE=
X-Received: by 2002:aca:538b:: with SMTP id h133-v6mr3715384oib.252.1527763830406;
 Thu, 31 May 2018 03:50:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Thu, 31 May 2018 03:50:10
 -0700 (PDT)
In-Reply-To: <c7e4c537-2174-005b-fa15-0e8286e540ad@redhat.com>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
 <20180521140402.23318-24-peter.maydell@linaro.org> <c049f864-304d-f8ee-4b2f-1476a602be30@redhat.com>
 <CAFEAcA_ErfYKnVrp=Dv9mNg55Y+=fFmg4eEMddGdMxUGVb9ztA@mail.gmail.com>
 <530bef1b-a143-1566-3089-32629ab250b8@redhat.com> <CAFEAcA94JAccGhbhSrBkTHUV+dLR-EvYQW_nuB9FodtLTDQPZw@mail.gmail.com>
 <c7e4c537-2174-005b-fa15-0e8286e540ad@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 May 2018 11:50:10 +0100
Message-ID: <CAFEAcA8p=PzfMbzbE6zQ-mAhP-vgvDRvPTjharRD76BFLyS_fA@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH 23/27] hw/core/or-irq: Support more than 16
 inputs to an OR gate
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-arm <qemu-arm@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, "patches@linaro.org" <patches@linaro.org>, 
	Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
X-TUID: JtfvMc3FQfa+

On 31 May 2018 at 11:21, Paolo Bonzini <pbonzini@redhat.com> wrote:
> On 30/05/2018 19:35, Peter Maydell wrote:
>> On 30 May 2018 at 17:59, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>> On 21/05/2018 17:02, Peter Maydell wrote:
>>>> On 21 May 2018 at 15:34, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>>>> Why do the levels have to be migrated at all?  It should be enough if
>>>>> the IRQ level is either migrated manually, or restored (e.g. in
>>>>> post_save callbacks) through other data that is migrated.
>>>> This is standard behaviour for devices: they track their
>>>> inbound irq/gpio lines, and then that becomes internal state for
>>>> them that must be migrated.
>>>
>>> But or_irq's input are another device's outbound lines, so tracking them
>>> should not be necessary.  The other device would do it for or_irq.
>>
>> There's no mechanism in qemu_irq for the destination end to ask
>> the source end about its current value. The information flow
>> is strictly one-way.
>
> On postload, the source must call qemu_set_irq and that will cause an
> update of the or_irq, won't it?

No, calling qemu_set_irq in postload is a bug. (You don't know
which order the state of the source and destination devices is
restored, so asserting a signal in postload would have different
effects depending on whether the destination had already had
its state restored or not.) The system design relies on each
device keeping track of (and migrating) the state of the input
lines it cares about.

thanks
-- PMM
