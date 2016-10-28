Received: by 10.80.166.35 with SMTP id d32csp1058120edc;
        Fri, 28 Oct 2016 02:07:56 -0700 (PDT)
X-Received: by 10.176.1.112 with SMTP id 103mr9900807uak.154.1477645676015;
        Fri, 28 Oct 2016 02:07:56 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-ua0-x231.google.com (mail-ua0-x231.google.com. [2607:f8b0:400c:c08::231])
        by mx.google.com with ESMTPS id 8si5654870uaz.132.2016.10.28.02.07.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 28 Oct 2016 02:07:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c08::231 as permitted sender) client-ip=2607:f8b0:400c:c08::231;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c08::231 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE dis=NONE) header.from=linaro.org
Received: by mail-ua0-x231.google.com with SMTP id 51so31847713uai.1
        for <alex.bennee@linaro.org>; Fri, 28 Oct 2016 02:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=QZzA5zltEP1VglhI2LpAP+cCUOZu/LQORh0mxUhQiUA=;
        b=TViZ+KT3qKKibrQjEvl8HAgiyCaLacVi/ss+tD3Dy83U6CCqsqs6DiJxnFu1Cx/xUT
         X3C9ji1bx5Xs7sDO7AJB6M1OPGMwJ1bLKo7llPhTaa8bubsgTChpUFxPvVO/CJ4400p5
         TTdj/hU8OnwVx6CP63EGkWoAHu1R5T2LAA4fc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=QZzA5zltEP1VglhI2LpAP+cCUOZu/LQORh0mxUhQiUA=;
        b=dF4aZHnIPZ1YMB7ChDvCS4Ubntf+Jr09r2AKMk7iG31fsBfRrUp3nbuxnYt8mHDppL
         fYgkNW1lxhIxrVGauDgKae+s2xEDPazPXYYyw00SK0zG0LDqTq52Z1sihaGz+VnhicfS
         NA7RGzL+j9CcaMh+yLL56XCQAyIAwVBEBn0e8CN2aS7L4ZeEUnfGBjnSNdk5Te8sjhpu
         PCBuVA+jS8wLC2t2lTVwvoBDMLY8JZmcfLSB8K3JEndziWCtmbZc7W7kSUSDtTA7zoyH
         lpKOVosCEHV7/ESSTDr6bZsLPnCDLwtlio6xCchQKcItqMZYq/0l9b5MNBWLCRn3NCNc
         4yOA==
X-Gm-Message-State: ABUngvfGBsN4w9LsGn385pJyF9tg6sqlYJJD6RA1qj+keMqGqY7Vnfan1oym7lP6ROjNJZZbGmtDuqrn1HGx+ra3N0M=
X-Received: by 10.176.67.196 with SMTP id l62mr10061897ual.164.1477645675603;
 Fri, 28 Oct 2016 02:07:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Fri, 28 Oct 2016 02:07:34 -0700 (PDT)
In-Reply-To: <87bmy498bg.fsf@linaro.org>
References: <20161027151030.20863-1-alex.bennee@linaro.org>
 <20161027151030.20863-31-alex.bennee@linaro.org> <fa288bec-8178-590a-db42-abb4c6986db4@twiddle.net>
 <87bmy498bg.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 28 Oct 2016 10:07:34 +0100
Message-ID: <CAFEAcA9Nrm9P=RHti1L_HkSvG1PkoOypbJ82Jgo_bLV7Cdy_WQ@mail.gmail.com>
Subject: Re: [PATCH v5 30/33] target-arm/cpu: don't reset TLB structures, use
 cputlb to do it
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Richard Henderson <rth@twiddle.net>, Paolo Bonzini <pbonzini@redhat.com>, 
	QEMU Developers <qemu-devel@nongnu.org>, MTTCG Devel <mttcg@greensocs.com>, 
	=?UTF-8?B?S09OUkFEIEZyw6lkw6lyaWM=?= <fred.konrad@greensocs.com>, 
	Alvise Rigo <a.rigo@virtualopensystems.com>, "Emilio G. Cota" <cota@braap.org>, 
	Pranith Kumar <bobby.prani@gmail.com>, Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>, 
	Mark Burton <mark.burton@greensocs.com>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Fedorov Sergey <serge.fdrv@gmail.com>, Claudio Fontana <claudio.fontana@huawei.com>, 
	"open list:ARM" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: YDeauqbiosRm

On 28 October 2016 at 09:38, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> Richard Henderson <rth@twiddle.net> writes:
>> And don't we (or if not, shouldn't we)
>> handle the tlb_flush generically for reset?
>
> Probably. tlb_flush seems to be one of those things liberally sprinkled
> in the arch code for all sorts of things but certainly cpu_reset is one
> we could make the call from generic code.

I think the theory I formed last time I looked at it is that
if your CPU has no state which would require you to flush the
TLB when it changes, then there's no need to flush the TLB
on reset -- any entries still in the TLB from before reset are
still valid after reset. For ARM a CPU reset will reset state
like the ASID and the MMU-enabled bit which require a TLB flush
on change, so we have to call tlb_flush here.

You could argue that the set of CPUs which don't require a
tlb flush on reset are not worth trying to optimise for
like this and we should just do it generically.

thanks
-- PMM
