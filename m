Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp2076567njf;
        Mon, 19 Aug 2024 06:47:08 -0700 (PDT)
X-Received: by 2002:a05:6402:1907:b0:5be:ec0a:c10f with SMTP id 4fb4d7f45d1cf-5beec0ac320mr4459643a12.2.1724075228253;
        Mon, 19 Aug 2024 06:47:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724075228; cv=none;
        d=google.com; s=arc-20160816;
        b=kyhy1uDn2d1rWs/bda/EXChZC7lyRDARLIgVvRfWQGxmF9NrDJCw93LXuvwbkKQPXI
         DvRPBxG0UMzBX8tHzcYXSjwrEs9Gb4bwDzeyMMFhBZQMgZryYx/vnFchP5JnQZFzL1Am
         qAZGWlXYeoim8ZuqLNVUq+j3B9WL9o4xFQu1q1wiXS4FlTrZeXX/o7zTpB1ZeD1t2zSe
         /+7p88v7vi+aTbM7IJkwPGdvWv6EJho9uGGMnnoazkFBi/jLeianL9vNeXD3qJPtJ3G/
         KT51h+gCn8WBR/03FGxlTycKNgRxTR4TxIdhEMMpzkLDx0AQ1mHDbfO64GxIXOaGCSKA
         fLvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SW0H8Ghm2HVoUmXlM0Qwjh7ymocmgQj5WEzGHKt5/XE=;
        fh=DwrckmRigb9tyjcAvAn9bQNorl03mLCGjsd+AllMViY=;
        b=ttCIw6V6FLpzynZ94KuOU5SukvixTmMyYghV03FZeTziX5lzN3dQ7i7FTIQUqCUZU2
         857+7dtz3YZ4nSmcAUB2MaeUf7YcdWr1gNLCDDZ+YNhN2pyD4ziqW0igKcoI7Zy5eSNz
         yBakz/2cMbNbIHujYUr4X4tU+Zc++rzMd65wDnGaJwzcm86DZ3J7TdCsNQgJyaSQ1UkT
         8/k4eVTLi4ubwFBcaBNfUsfmBVYgHnqfyMHe/PwVts+stbh2cRwKlcMgtzEZBGqyhdmm
         QCnfuWVPSLuqx6zqy0EpBzqRQ41a9XqZmqtrTxmvNDu+I9bblAplRG7Ou87fVD1OBcIb
         YknA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hVkjj5dS;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 4fb4d7f45d1cf-5bebadc0c95sor2957746a12.1.2024.08.19.06.47.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 19 Aug 2024 06:47:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hVkjj5dS;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724075228; x=1724680028; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SW0H8Ghm2HVoUmXlM0Qwjh7ymocmgQj5WEzGHKt5/XE=;
        b=hVkjj5dSjE23seVRrZsgFDxeCr/CSr54y8z90t9jt+aLd2FqqgOwHbYGwgyy5jL1vo
         ZuC2ooAh2PQ4Bxu4AnQxMy4Fd3BD3pEv0zuUTzBsyiiPQNfEgiXrsGaQZfzuq5ARPxsH
         2QFv/zliThuXsRWjrtH8G/gmCiqgrVc5U3JayuMDOLtYWbZj2heaPOmJ1Z8ifJjbScWw
         QvKtcQ2ZjXxnyI4lEslHSJKTVXqlNARJrQj7tMMMaYeyTnRGKhfoTtedgbNzU3DFMpYd
         H3TZwXib46v3l8KZ0HaKPS5YqN4Vln7/ouAQjPHMeu9S5HtfkVgKCeg46F79mwIP6yN6
         fILQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724075228; x=1724680028;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SW0H8Ghm2HVoUmXlM0Qwjh7ymocmgQj5WEzGHKt5/XE=;
        b=FUfIqMuIakWYSCv6WkOIAf+/QSy4M4Qb7ywlY8WtqH0g3jhwe00fBBKvY5Svy/kCz+
         enA1tawCbNvQBsEWdGqEPbWCCx7Od4R877Sh14tokOxT+A/1UKCqWqgqNKbebZnXcaw7
         L5tPpsd2tKV/n3LzxZ1iAz1Cbgml9X0PNs3dlsFPgjbecuR4dMpDwWOZdQyYAl2p8hhW
         E5oGWjMoGVi/b8nvWrjYn1kpND/+XwL3stk4ZkLNzZR8NO0hqzuFS7dGUZ73AEvp5Qs1
         /eRqERhWwNmYPrJDa9Bv095d/h94HBl5TH0aL3Ph8B+D4QnBY8hjlAcWtqZg3ct8vcxJ
         GO/A==
X-Gm-Message-State: AOJu0YxSvvTkeK6T38posbZAH35MjxmJv3hnajSCoqwP/o0ZjbCVI1tI
	ZetNEhj6GsjZc1nCAr2BA40CFyJ5spQKAALDKxS8rkcEMdHGRU/rTbfpzzUlZWipQbok6ualHpP
	sSrYiedgzudN/W68hcDUvD3wV5MRqzCC4OfBe7QnTvRBl156zhbg=
X-Google-Smtp-Source: AGHT+IFhqm8I3foBBgQZWECesTy1DIPDLieO0gg49gL507EiNCJfYWu+TqXqEJ7Dw+/xIjrO6J39EaWpN/42D5FX0gI=
X-Received: by 2002:a05:6402:1e89:b0:5a1:4ca9:c667 with SMTP id
 4fb4d7f45d1cf-5becb5edc13mr11402103a12.11.1724075227465; Mon, 19 Aug 2024
 06:47:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240613233639.202896-1-salil.mehta@huawei.com>
 <20240613233639.202896-25-salil.mehta@huawei.com> <87v800wkb1.fsf@draig.linaro.org>
 <CAFEAcA9A9Oq0nURkiLNWZNC=P7KQGyr8TjjfOmEq+squwF+xog@mail.gmail.com> <0059c598676a4b9d8e34b9c0dc62b09e@huawei.com>
In-Reply-To: <0059c598676a4b9d8e34b9c0dc62b09e@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Aug 2024 14:46:56 +0100
Message-ID: <CAFEAcA9jm8RD0FF4fo7YPCHwaC9FwEG0q1EYce-OmrD1J--iWw@mail.gmail.com>
Subject: Re: [PATCH RFC V3 24/29] target/arm: Add support of *unrealize*
 ARMCPU during vCPU Hot-unplug
To: Salil Mehta <salil.mehta@huawei.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, 
	"mst@redhat.com" <mst@redhat.com>, "maz@kernel.org" <maz@kernel.org>, 
	"jean-philippe@linaro.org" <jean-philippe@linaro.org>, Jonathan Cameron <jonathan.cameron@huawei.com>, 
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, 
	"richard.henderson@linaro.org" <richard.henderson@linaro.org>, "imammedo@redhat.com" <imammedo@redhat.com>, 
	"andrew.jones@linux.dev" <andrew.jones@linux.dev>, "david@redhat.com" <david@redhat.com>, 
	"philmd@linaro.org" <philmd@linaro.org>, "eric.auger@redhat.com" <eric.auger@redhat.com>, 
	"will@kernel.org" <will@kernel.org>, "ardb@kernel.org" <ardb@kernel.org>, 
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"gshan@redhat.com" <gshan@redhat.com>, "rafael@kernel.org" <rafael@kernel.org>, 
	"borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "npiggin@gmail.com" <npiggin@gmail.com>, 
	"harshpb@linux.ibm.com" <harshpb@linux.ibm.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, 
	"darren@os.amperecomputing.com" <darren@os.amperecomputing.com>, 
	"ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>, 
	"vishnu@os.amperecomputing.com" <vishnu@os.amperecomputing.com>, 
	"karl.heubaum@oracle.com" <karl.heubaum@oracle.com>, "miguel.luis@oracle.com" <miguel.luis@oracle.com>, 
	"salil.mehta@opnsrc.net" <salil.mehta@opnsrc.net>, zhukeqian <zhukeqian1@huawei.com>, 
	"wangxiongfeng (C)" <wangxiongfeng2@huawei.com>, "wangyanan (Y)" <wangyanan55@huawei.com>, 
	"jiakernel2@gmail.com" <jiakernel2@gmail.com>, "maobibo@loongson.cn" <maobibo@loongson.cn>, 
	"lixianglai@loongson.cn" <lixianglai@loongson.cn>, "shahuang@redhat.com" <shahuang@redhat.com>, 
	"zhao1.liu@intel.com" <zhao1.liu@intel.com>, Linuxarm <linuxarm@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: O5egsURulIjm

On Mon, 19 Aug 2024 at 13:58, Salil Mehta <salil.mehta@huawei.com> wrote:
>
> Hi Peter,
>
> >  From: Peter Maydell <peter.maydell@linaro.org>
> >
> >  We shouldn't need to explicitly call cpu_address_space_destroy() from a
> >  target-specific unrealize anyway: we can do it all from the base class (and I
> >  think this would fix some leaks in current code for targets that hot-unplug,
> >  though I should check that). Otherwise you need to duplicate all the logic for
> >  figuring out which address spaces we created in realize, which is fragile and
> >  not necessary when all we want to do is "delete every address space the
> >  CPU object has"
> >  and we want to do that for every target architecture always.
>
>
> Agreed but I would suggest to make it optional i.e. in case architecture want
> to release to from its code. It should be allowed.  This also ensures clarity of the
> flows,
>
> https://lore.kernel.org/qemu-devel/a308e1f4f06f4e3ab6ab51f353601f43@huawei.com/

Do you have any concrete examples where a target arch would want to
explicitly release an AS from its own code? Unless there's a
real use case for doing that, I think that "common code always
does the cleanup of the ASes, nothing else ever does" is a
simple design rule that avoids the need for target-specific code
and means we don't need complicated handling for "some of the
ASes in cpu->cpu_ases are live and some have been released":
either the CPU is realized and they're all valid, or else
we're in the process of unrealizing the CPU and we get rid of
them all at once.

thanks
-- PMM
