Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp1286931njf;
        Fri, 16 Aug 2024 10:00:25 -0700 (PDT)
X-Received: by 2002:a2e:bea0:0:b0:2ef:2fcc:c9fb with SMTP id 38308e7fff4ca-2f3c8f258f0mr1046741fa.36.1723827625431;
        Fri, 16 Aug 2024 10:00:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723827625; cv=none;
        d=google.com; s=arc-20160816;
        b=s+XiIznX0fyCTTSWbfGyVOoSHX5ynCA7PPdooFdWUFko9lVhwlRg+IF7+3qlykZ9X3
         wWrHpJr+75I8PdrGMw2a0PFVATAnwDB5X5hKAIoWar+TM4Ntirvp3xJtNlXpnSMag7Bj
         1x3JijqrPtOCvwthKoBLCjZAe+8tST1UPGY7RVQ0WBBXzu5DI1MdrQ2jxR7TrrXr4aXK
         LItMT8cBc6VStucNJfHwyIHrfdhf5fUJ//4SbkvQdmfGCMyLpLKgRgA9sKzB+gowoaz8
         8BgWE+Qb9p38Ec5WTZmBP6Xe4NUubtt5gbwhFpHh7aBhhVnb9kZAYOXB81mvLhSK5uqO
         KN4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QoqIax5TMn9ljyO22efSTziFL6fODrW1w8ahgMH12Oc=;
        fh=3joUD2mEBFAp8B8MrB7ayM9KKHMA2E8I/SwDIYvYd4Q=;
        b=RjapFIcLbzuxoK65V2OcuBqtnc+q7/paBKCJXQM5w1AK0OaNTRSFuRK/5QwFKbX9sh
         CNTTEWLBS5JJ6M+BfvD4NkoxnEVczTy+wsvbl6u+iG+A6g6KAQfJ6msoliqWAJwIppDI
         y0rUNeWhlqWwQIVN2iR0fiFIjVHmcrzqDxIye9JAKne2LUMc62Q6T+Ux2C+ue1iBTCkC
         VdOCp1wd5suRN4Ax0akvPUYaMa5ATJtVabB3LcQSIKJWh+wv/VlzXItfk9kaJwn+aNOw
         aMQthXFiNiCqoa87NspH4k7lGnkRozZ6T/zh45JDDoUr/Pl0JMgl7+qhhmOOGEmB6Iyd
         MWaA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gjzhvr0U;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 38308e7fff4ca-2f3b74c213csor7085371fa.8.2024.08.16.10.00.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 16 Aug 2024 10:00:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gjzhvr0U;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723827625; x=1724432425; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QoqIax5TMn9ljyO22efSTziFL6fODrW1w8ahgMH12Oc=;
        b=Gjzhvr0U+CuwEohz5AAIrLt3twfiv39njHxEGdcVeqonK9RKxRbMi+DnxA10Rcb5QS
         kq+n0bKT/zfBL7u6syO9lK2hPYRXQX//ECXF98wqkSPSVdB5GJZWPJf0OMQPa8/+vbP0
         3tWZFSw+j2Mo10Q5W3245tfUKUj5R62/bPYyqwKR2h595tDHuzkESqoE1oc8Vn1ntnlC
         scFD173vQf/Q1Grpz1t/8iUZ317dbEGKdhxEpc61RogV7gwTN5vcR3271kepnXV/Tbso
         oYFsJSWlqRUwO8kYgKcnAuJaaEuw6SZ5xNapsMCOwhB5S2vUsXpwekrKKrB7QIoJXlB6
         2UeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723827625; x=1724432425;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QoqIax5TMn9ljyO22efSTziFL6fODrW1w8ahgMH12Oc=;
        b=p61upw8TWcHRrNEC5ZTTx9wthqUe1vHDL9pRZmnQLXFLpu1pXz0yH+/606FGqgs9oq
         xTJ4vEhaGUd1iBQ4UvveKhp1NhEv/JNDYvO3+sSUhBaYx3Ww7jEI0PTr6UgR8GaxFsDn
         f8im5eiiXOrSreCY9VpxZAFva8ttfFGv5V/5HssVhRpAv4gpDLxUyAGGs0anyHpnMsYN
         SkeA8dZMwwAwPkovUJIm8V99wRYA6AULcHjYqfbAzDofS+mAI4q4I21ED8ghlZzn8qrV
         /f0MzENmdq/VNJ8VTJO4iaSRjMBWWE2xO7E+wepTRHzRF5SxT47HjHPP6mE21l1tky77
         wexA==
X-Gm-Message-State: AOJu0Yy2oDITdeKRIipUoyo0NetQE6qRX9cK9MQbr0BkgYSca4msXTcN
	tbUa/nlnV7/jj/rrHc4t1+FN+1rBdXnbN9e9Mo02UFZqTwGjwz5DIqG/ntZoNdYatO2QvIen2vD
	KiPMLroRWD+ETKlYPz8zEDok0UJkhyEtL4kajRGTJqdwtt99hlIc=
X-Google-Smtp-Source: AGHT+IFTuZwDGOcYhdVvKdNUH2kVUi+1ZxQc3KPze5h8PYYD4wEMzdHQboXuFmjH828Mb83HLLwwLUDUj+6v4xYXZzc=
X-Received: by 2002:a05:651c:1053:b0:2ef:26dc:efbe with SMTP id
 38308e7fff4ca-2f3c9133458mr755271fa.42.1723827624522; Fri, 16 Aug 2024
 10:00:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240613233639.202896-1-salil.mehta@huawei.com>
 <20240613233639.202896-25-salil.mehta@huawei.com> <87v800wkb1.fsf@draig.linaro.org>
 <CAFEAcA9A9Oq0nURkiLNWZNC=P7KQGyr8TjjfOmEq+squwF+xog@mail.gmail.com>
In-Reply-To: <CAFEAcA9A9Oq0nURkiLNWZNC=P7KQGyr8TjjfOmEq+squwF+xog@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Aug 2024 18:00:13 +0100
Message-ID: <CAFEAcA99RF2tY-9DfhdkCxrR=ayEjJYKEQ4xZSn3BBrXdOjU_Q@mail.gmail.com>
Subject: Re: [PATCH RFC V3 24/29] target/arm: Add support of *unrealize*
 ARMCPU during vCPU Hot-unplug
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	mst@redhat.com, maz@kernel.org, jean-philippe@linaro.org, 
	jonathan.cameron@huawei.com, lpieralisi@kernel.org, 
	richard.henderson@linaro.org, imammedo@redhat.com, andrew.jones@linux.dev, 
	david@redhat.com, philmd@linaro.org, eric.auger@redhat.com, will@kernel.org, 
	ardb@kernel.org, oliver.upton@linux.dev, pbonzini@redhat.com, 
	gshan@redhat.com, rafael@kernel.org, borntraeger@linux.ibm.com, 
	npiggin@gmail.com, harshpb@linux.ibm.com, linux@armlinux.org.uk, 
	darren@os.amperecomputing.com, ilkka@os.amperecomputing.com, 
	vishnu@os.amperecomputing.com, karl.heubaum@oracle.com, 
	miguel.luis@oracle.com, salil.mehta@opnsrc.net, zhukeqian1@huawei.com, 
	wangxiongfeng2@huawei.com, wangyanan55@huawei.com, jiakernel2@gmail.com, 
	maobibo@loongson.cn, lixianglai@loongson.cn, shahuang@redhat.com, 
	zhao1.liu@intel.com, linuxarm@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-TUID: kD2G39+aYDnu

On Fri, 16 Aug 2024 at 16:50, Peter Maydell <peter.maydell@linaro.org> wrote:
> We shouldn't need to explicitly call cpu_address_space_destroy()
> from a target-specific unrealize anyway: we can do it all
> from the base class (and I think this would fix some
> leaks in current code for targets that hot-unplug, though
> I should check that). Otherwise you need to duplicate all
> the logic for figuring out which address spaces we created
> in realize, which is fragile and not necessary when all we
> want to do is "delete every address space the CPU object has"
> and we want to do that for every target architecture always.

I have a patch to do this now, but I need to test it a bit more
and confirm (or disprove) my hypothesis that we're currently
leaking memory on existing architectures with vCPU
hot-unplug before I send it out.

-- PMM
