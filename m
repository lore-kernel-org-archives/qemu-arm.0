Received: by 2002:a17:907:a09:b0:a52:4db9:938b with SMTP id bb9csp1440577ejc;
        Mon, 6 May 2024 02:29:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW7coCgK2g94MltZ/hOu1vmaWCLvDFmP6Z+SnoGIZZBs+4SlYSfSyqvVjnLH9R67DpHfO6mM+lumAYQhrzMzTGFHMZCfAt0
X-Received: by 2002:a50:8717:0:b0:572:72ff:da34 with SMTP id i23-20020a508717000000b0057272ffda34mr6517082edb.14.1714987744692;
        Mon, 06 May 2024 02:29:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714987744; cv=none;
        d=google.com; s=arc-20160816;
        b=tbSRPOHXHqSAOf66BG+/K+m4F2MRjH+jBvk2TyVIautzZ/xlMZ7NBpodS0QQlmYRUR
         /gn1ogYm0EbFcIf+zJZmkGGCfQenaQ8RbxQPZQdb2pjo5M13Kk8sJ5LLue2KRxsWvXxN
         nRCKuGUeG+KktXnUJOzJzFl2Y0OTKIYUKi+M/cTbWBbt4hcnxj+jTu4uFajtQvEVfyf4
         iXVxdMfUIftzlhn0vi8z1fAOasNChGcbOyzBtGn4JxpvWuDbs2+Bhz9g4SP1QZBfmqH6
         enTvJ3qM5+yD+nyrxq1dKUAh3B1+E4mwXy86jLLjSgpLjFEUEzlbZIf1gQhojfIvQzz0
         aQ6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NDFtcL5t4gXzrN/uQPJUI7ZcnUDtAe2YPjtW9fAQBEw=;
        fh=fLLd5XuZOLRfkuZCTMfReS46qsV7XgmwtcMNVt0y/30=;
        b=FDxKHeNIM9MsRTwRuOuRksVAn4k9qhJPNa3WtO9Wo8Ti88a5DwSacw35AXf9+grM/3
         0zCGQyXveAkmzPD0r0C+XqLQWtEC+ebIJj8tY2Goa12ac4wyrWQ3ZrKWyiJrT3eNZx5u
         E161gwH5uon8bGF4rR8UPZm0uNSkfKugxM+j/m3RYae9Zod4rnltATusxkg3DCocEEZo
         3Bi28mAKwZ/V+IqHCEHCLBNqwnNaFciz7LYd3fXVCfDuPzeFULuXAN1NkP96M0ikuese
         ARN8Hcd1axiKqUNnAx95SOG5ZJc3oi19cJV9VSh7uehOy56wu37j2r08I/OqG9NIs5E/
         rYCw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oKhkQB7E;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t27-20020a50d71b000000b00572a6f5bc84sor1825284edi.10.2024.05.06.02.29.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 06 May 2024 02:29:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oKhkQB7E;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714987744; x=1715592544; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NDFtcL5t4gXzrN/uQPJUI7ZcnUDtAe2YPjtW9fAQBEw=;
        b=oKhkQB7EIkwPPFcuAXJ9/ft+/FVR3Fl/209QrzKjrTOmeuLfvQ7pe/GqiTxNmzaPRn
         /6/HEUa5XgL88rtAhKiWRtm65wdGy2jJLRLOlY3aDfwxy8PYknVnJhFlqVDcvv4ObIlc
         bYrwOVzd7a8IqlVNPEHM23rvvFx7tt3dkkXHoOr99xJh4RIxlqZlNSRYuBcJLSwjI7CP
         XZWRo3NHjfX8T/ILazk85EPpeErjct3kzlXelDhnKuRJWHA5IPiFgKP1eXlhTKKDvN8A
         jBkdiKMS4hN76Ov+6mzPQu+lPJvkxCDZzzBCTalmQQzKxW5c4PZ5/wUohgS25AfarOkX
         bEOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714987744; x=1715592544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NDFtcL5t4gXzrN/uQPJUI7ZcnUDtAe2YPjtW9fAQBEw=;
        b=OvONyNOmcHAZBlrA+bLOCk5BcJ0VHShgH1/9mvKE5Zi5L7Qv1AtIOVU3Ooh+4/EXSG
         ru6SPLrHC/rHFPp0A7kw1sPY3la08hRovIC6iFeby/qNihppkJPzzOMAdvdeFNx/tnIh
         2HWHRm1GEC89Aiw4b62+/0S96MXvanc0MzKnqFteMDoiK3qIav9y+RHYEA+a5remnCHr
         uOUj38fWERdCcK2PZH0SSKvqRV/RXgiqAuosmu/9kAZYFxmt5L87E9kvQvxbn4C6rsCG
         o4XrPPtB3msNUePuOIZS1+Db98k1YxhhLswKWg3XYfBpFLur1XGE03eM5V+Ys62q4LRM
         auSw==
X-Forwarded-Encrypted: i=1; AJvYcCXUZu6m47xwPMnDh4nvQofkEeyFZkNmr9hCxo71bHTfZpgv84bxYQ0CWtAHwDc/CRvdx5RUT803BhR6xvAhCkFvX710NMaK
X-Gm-Message-State: AOJu0YwOhrx4YZbp5+x4/PiOWipPzdzXW7b8t1q1eLMMMU8DDrx0L+mT
	Lak+lYwZgaplayXAmQR09sxA8Vr7zEdWHQTu+XcN64auMh8sc0+Wke514xkhHkYClv+V5dfOlnF
	v6XE1xKU0rKxA0ePRF1bUT78mlIuGVZ2ZL1+5b0fj
X-Google-Smtp-Source: AGHT+IEqIDgMe2oDZ5RHq9MbU78RQXnYjCtvPqFtl7gl7Mutky36zjfwIX03Jme46gdh/TtmGKOA/vo0RCOy1YbvXv0=
X-Received: by 2002:a50:a696:0:b0:568:d5e7:37a1 with SMTP id
 e22-20020a50a696000000b00568d5e737a1mr6219741edc.36.1714987744248; Mon, 06
 May 2024 02:29:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240312020000.12992-1-salil.mehta@huawei.com>
 <20240312020000.12992-7-salil.mehta@huawei.com> <CAFEAcA93EotG4-LXRJF034_9dWAWgZJA1VF6dB-xCsXn0T059g@mail.gmail.com>
 <10f35804a55e460a8ce6ecdb3f0c79b6@huawei.com>
In-Reply-To: <10f35804a55e460a8ce6ecdb3f0c79b6@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 May 2024 10:28:52 +0100
Message-ID: <CAFEAcA-w7wf9F4VVAnZR3b34ydEWq=QNw=CxhTMobsr+AP_LCg@mail.gmail.com>
Subject: Re: [PATCH V8 6/8] physmem: Add helper function to destroy CPU AddressSpace
To: Salil Mehta <salil.mehta@huawei.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, 
	"maz@kernel.org" <maz@kernel.org>, "jean-philippe@linaro.org" <jean-philippe@linaro.org>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, 
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, 
	"richard.henderson@linaro.org" <richard.henderson@linaro.org>, "imammedo@redhat.com" <imammedo@redhat.com>, 
	"andrew.jones@linux.dev" <andrew.jones@linux.dev>, "david@redhat.com" <david@redhat.com>, 
	"philmd@linaro.org" <philmd@linaro.org>, "eric.auger@redhat.com" <eric.auger@redhat.com>, 
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"mst@redhat.com" <mst@redhat.com>, "will@kernel.org" <will@kernel.org>, "gshan@redhat.com" <gshan@redhat.com>, 
	"rafael@kernel.org" <rafael@kernel.org>, "alex.bennee@linaro.org" <alex.bennee@linaro.org>, 
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>, 
	"darren@os.amperecomputing.com" <darren@os.amperecomputing.com>, 
	"ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>, 
	"vishnu@os.amperecomputing.com" <vishnu@os.amperecomputing.com>, 
	"karl.heubaum@oracle.com" <karl.heubaum@oracle.com>, "miguel.luis@oracle.com" <miguel.luis@oracle.com>, 
	"salil.mehta@opnsrc.net" <salil.mehta@opnsrc.net>, zhukeqian <zhukeqian1@huawei.com>, 
	"wangxiongfeng (C)" <wangxiongfeng2@huawei.com>, "wangyanan (Y)" <wangyanan55@huawei.com>, 
	"jiakernel2@gmail.com" <jiakernel2@gmail.com>, "maobibo@loongson.cn" <maobibo@loongson.cn>, 
	"lixianglai@loongson.cn" <lixianglai@loongson.cn>, Linuxarm <linuxarm@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 66IaKa/pmW7Y

On Mon, 6 May 2024 at 10:06, Salil Mehta <salil.mehta@huawei.com> wrote:
>
> Hi Peter,
>
> Thanks for the review.
>
> >  From: Peter Maydell <peter.maydell@linaro.org>
> >  When do we need to destroy a single address space in this way that mea=
ns
> >  we need to keep a count of how many ASes the CPU currently has? The
> >  commit message talks about the case when we unrealize the whole CPU
> >  object, but in that situation you can just throw away all the ASes at =
once (eg
> >  by calling some
> >  cpu_destroy_address_spaces() function from cpu_common_unrealizefn()).
>
>
> Yes, maybe, we can destroy all at once from common leg as well. I'd prefe=
r this
> to be done from the arch specific function for ARM to maintain the clarit=
y &
> symmetry of initialization and un-initialization legs.  For now, all of t=
hese address
> space destruction is happening in context to the arm_cpu_unrealizefn().
>
> It=E2=80=99s a kind of trade-off between little more code and clarity but=
 I'm open to
> further suggestions.
>
>
> >
> >  Also, if we're leaking stuff here by failing to destroy it, is that a =
problem for
> >  existing CPU types like x86 that we can already hotplug?
>
> No we are not. We are taking care of these in the ARM arch specific legs
> within functions arm_cpu_(un)realizefn().

How can you be taking care of *x86* CPU types in the Arm unrealize?

thanks
-- PMM
