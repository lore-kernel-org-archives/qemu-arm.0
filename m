Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp2075482njf;
        Mon, 19 Aug 2024 06:43:55 -0700 (PDT)
X-Received: by 2002:a05:6512:2346:b0:530:ad8d:dcdb with SMTP id 2adb3069b0e04-5331c6a1931mr10361172e87.19.1724075035633;
        Mon, 19 Aug 2024 06:43:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724075035; cv=none;
        d=google.com; s=arc-20160816;
        b=GHaxgr/EGy3+2GmDSjvYr9iv+I6u1HQ+c83WzUwE7IXS9zyGyDXvO3YdCe+r/MLn0o
         zjOxqgIiprogMOZQGazVt4ZZmYQSGI0R+G/ZVZb5iMyZAoA6+owHmlphXxYa3tQkGJXi
         Qz4PYzWOvFQnqsFUeZJOBZRC21RR7LfQBvfs+hnDGo5tZxbukokFvRMFx3dI2icpZs6s
         dw36kxmrRUJc/loUdrI7qDlOpXlHayGttVli/YENzV6fwcW0harNhzMi/zv3xLwFzjwR
         xfTIqfBi+TgJVSzeEVKG8cO6E0oclgrtLcQk2+kHVKhzAqwG8gsmrZ16FsRR9w/TBccj
         lOXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VZSQvibo+wu7IP70i5D5poEBqcsjxx4FufbBQPXg2lI=;
        fh=DwrckmRigb9tyjcAvAn9bQNorl03mLCGjsd+AllMViY=;
        b=GqjAqQgKRm3xxdv4w2mlkBKGXTnP1dZeoGeXEs+B5RXlvWd2XoaCMvt8KTtNfCryNe
         u3k8p5eUhiefZgqo0/a5aDKyH7H85rT7aH9EJ+UJNfgaAjyclY209LsAG5BAuXhtBoIm
         YDC5RhFPtKQhM0PrnVdTeyFuRcUi4GpqaX/+l7C/Ygjdp0ojsgaDo7bza7krPDaJmYP2
         RCCxgR3MqrmnQZcxdt/ud/XDygB/CByF8ExAPvnkbK42PJllzCEIv649p5CickDCbQtN
         B+xavLK7/bh1ITBBcPndaoNbm7lmhpidLB0i7ej/2czcuYHnaqJOgKwipBCze/6CwamH
         35Gw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bLXGiVCY;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-a838394ae2dsor101394766b.20.2024.08.19.06.43.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 19 Aug 2024 06:43:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bLXGiVCY;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724075035; x=1724679835; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZSQvibo+wu7IP70i5D5poEBqcsjxx4FufbBQPXg2lI=;
        b=bLXGiVCYJzL5BLVb32BZl8scBG1TZXl8uoqK02aLjKKqqwOSLp5r4p4rjO9Gu3UJTq
         yBcNfPdTWmJngJKDLVIf+Z57f4QjZWO2VQmMf6qlxYA/o2UGS3G6I37/RapQt+P4ySBr
         gd1iEdw+NOqlWzsZrZ8c404VGeuJK84JSgLKlqJqOxzVycU1TdK5T+Eh2ycronhCiYkW
         lmBRo9tP12RlKiq4KYg/hhjWXu8Jn+FjTHPEKKTjXrkfkOJ2yAjmJC/jkHnntdRmKpZr
         gHYYZir4/fFOzKoitWIdgcjTcmPziuBrJFLJYTgtQeTwI3l/T+SAiIE0CsuSqQ+o7Tyi
         rT5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724075035; x=1724679835;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VZSQvibo+wu7IP70i5D5poEBqcsjxx4FufbBQPXg2lI=;
        b=HO4eBJMGG+ltBsFuYoQl44Vw+Pe1m3XOC3EBclm7ekaN9h1bUgbmnTGODAEwYt4iSX
         Ly5gednfAAXZrDYTK3TYGopHE6iqAMs13nLnweWNzecsLwwu9t+M2bEP3wvN49H0hHIC
         FHFUbJNrol+Q97iHRbrrWv1KC15xezIB/nVQeBW3pAulwGh3Wb2a6E0BbPv33lZMuE8T
         IvMRvr6TsH6gHOa2EW5KDMJMw11L1okgTQvCip3vo+f966q/49KJng4ESsmtwITX8LEL
         mQ/ircN3loMZfYb7Ii+VZr0uqqIx3KIjfPsH1d3c6FLgvDrmmgSdFHCvWyB2KZOjsy7X
         KfVg==
X-Gm-Message-State: AOJu0YzQKwux989AzYIzetXX8keg0Hd36roAp+2EvvcYopLz2L6Mr1Bc
	7fLvRjNrHJRg5EDUJMUr0CdcbnzKRUAJiSdXOD7U1S6Pf9IpSdqpqGq8SbD3b58B3QGcRRXTA/p
	b7K3PTpfOvVB4CbnQGLfbV02YAHr7l+j8L+3K5q0x
X-Google-Smtp-Source: AGHT+IE+UM/rUhRkNaD447GoOLYwr6ZmGyRtTkZgMo4wJzir2YNTVhSAMrIzK0HyA7lZcTGfiNCg61kSuf943QzgdEQ=
X-Received: by 2002:a05:6402:84b:b0:5a3:619:949f with SMTP id
 4fb4d7f45d1cf-5beca8b7a70mr9704051a12.32.1724075034825; Mon, 19 Aug 2024
 06:43:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240613233639.202896-1-salil.mehta@huawei.com>
 <20240613233639.202896-25-salil.mehta@huawei.com> <87v800wkb1.fsf@draig.linaro.org>
 <CAFEAcA9A9Oq0nURkiLNWZNC=P7KQGyr8TjjfOmEq+squwF+xog@mail.gmail.com>
 <CAFEAcA99RF2tY-9DfhdkCxrR=ayEjJYKEQ4xZSn3BBrXdOjU_Q@mail.gmail.com> <8cfd576d650c43128e9f1015827ab66a@huawei.com>
In-Reply-To: <8cfd576d650c43128e9f1015827ab66a@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Aug 2024 14:43:43 +0100
Message-ID: <CAFEAcA9ohibzUMwKsZz4Nps9Q-74jLM5340esS+E+TejGR+DNQ@mail.gmail.com>
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
Content-Transfer-Encoding: quoted-printable
X-TUID: jBCs0pnpDeok

On Mon, 19 Aug 2024 at 13:59, Salil Mehta <salil.mehta@huawei.com> wrote:
>
> >  From: Peter Maydell <peter.maydell@linaro.org>
> >  Sent: Friday, August 16, 2024 6:00 PM
> >  To: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >
> >  On Fri, 16 Aug 2024 at 16:50, Peter Maydell <peter.maydell@linaro.org>
> >  wrote:
> >  > We shouldn't need to explicitly call cpu_address_space_destroy() fro=
m
> >  > a target-specific unrealize anyway: we can do it all from the base
> >  > class (and I think this would fix some leaks in current code for
> >  > targets that hot-unplug, though I should check that). Otherwise you
> >  > need to duplicate all the logic for figuring out which address space=
s
> >  > we created in realize, which is fragile and not necessary when all w=
e
> >  > want to do is "delete every address space the CPU object has"
> >  > and we want to do that for every target architecture always.
> >
> >  I have a patch to do this now, but I need to test it a bit more and co=
nfirm (or
> >  disprove) my hypothesis that we're currently leaking memory on existin=
g
> >  architectures with vCPU hot-unplug before I send it out.
>
> I think you are referring to this patch?
>
> https://lore.kernel.org/qemu-devel/20230918160257.30127-9-philmd@linaro.o=
rg/

I'd forgotten that Phil had sent that patch out. My patch
is a bit different because it refactors cpu_address_space_destroy()
into a single function that destroys all the ASes (and so we
don't for instance need cpu->cpu_ases_count any more).

-- PMM
