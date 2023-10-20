Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1401153ejb;
        Fri, 20 Oct 2023 10:40:21 -0700 (PDT)
X-Received: by 2002:a05:6402:278c:b0:533:520:a5a8 with SMTP id b12-20020a056402278c00b005330520a5a8mr2231185ede.29.1697823620996;
        Fri, 20 Oct 2023 10:40:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697823620; cv=none;
        d=google.com; s=arc-20160816;
        b=rjPm6SUPU3sbxGr52qVXA9KWwREBNjDFOT0hHdiXji/5OvKYGtkJt0w1+odsK0T8Tu
         GjREmsz0a5RLNR4KlmzgiOvOupZx1T+mfg5n/fgub34aoGtmMsaL8O451lvpe5vmwBp/
         Djmt3d4OwCzynam4YTf7Xyj4Wjt9sKnqtAFOvYllfWC6FxqECvCBFGIQTFOxtqQ9Nytp
         iFQeud+Q824cnDZNcbQvczMNss5ngqmCA+cYk1UDyBJCMaVFnE+zkH6KxZ45zRHtoVgc
         g7GVnJoe7diBK+Sug68RDV7trAzVxC0LiOcFCFAg8da3/7hO8bRTY5pPopQoq5QFNHeJ
         9x1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5ecj4k7fUCeUFhk806jIEjdUHq1mY981ro5iqfcu8WI=;
        fh=ySz4uvZLyDObz85uR5NBqz/U6sAUw4opTKEeeWadcys=;
        b=wJqI4xxinhBH79vkLW0yIZ0PjCkmXnTpf5klF3fi9xiFN43cJCVFyGO0vCNeItsuRD
         E5cy3KZc95Hne68wtY7CZLb7VOZQvsXRLRu103IRRb2T2BXNF5qllIEJ7yGDqj4ryHJP
         m3NQiEvLZn0b6Z2mS2z3y8n+GSG86qUstrL5OFfT4b98d4nN6Wuf5HyvkkPjiOBfCvfj
         pa+T6cObFf7mGlp+l7Fzfltz8KLNRNpE8Xmq63fJWFTp3QTX+Q1gxHJGP1mNdNeaSxHZ
         Am2WtvnjzKEAYx6282ddB8tTic15beUxUA6Tml+mChO8JVw+1lvjhARM2zt4mWrMzEII
         +y+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wm+h9f5G;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id cf28-20020a0564020b9c00b0053fc3d654f4sor747562edb.0.2023.10.20.10.40.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 20 Oct 2023 10:40:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wm+h9f5G;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697823620; x=1698428420; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ecj4k7fUCeUFhk806jIEjdUHq1mY981ro5iqfcu8WI=;
        b=wm+h9f5GqpbbrdzbVl2tXLb7yBLsNwsgLwzQ1L7D354hPozxiPG2lH6hMpxk2ricxV
         t92K3XbiiQXMUL+NTgz8yNKaCNVg4RodcAdUAo1qFxhdwSL1KLvhvcYywhzTFnRAj+iT
         MbpOkNPuIuWlltghYgsfhwsP+yRtoNn3PzcxrQHiHoEp43v/jDcWcC9UFKYKVDp9pu52
         /bJm0EX+lrQODDOCQ9Ri3CRS6Esuw/9TmrkIlo+ohoY9RW9Bfo/jT74507xyQxvUdMs+
         jc9YskWZDfyPT8VF89chy20t1vjMd2jvd519l8H/VNJQGHhvrMHL+LZe8VnNS1qhvEI9
         b3Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697823620; x=1698428420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ecj4k7fUCeUFhk806jIEjdUHq1mY981ro5iqfcu8WI=;
        b=IKrfL5g3SWTZ2jG3ARvy292JXHqYZvx2o9AVkY/jQY34HUqqdmG4oQhCRf1ICtrK6w
         +bWKssDKef6gH69OUNIOrTatCHiqrHseIu+yxmbAsLh6ruEVPw6PhNGyI1Xhtg34O68P
         79gMnl/b74aqL+H8Gk1jFJqzNfdXhOsujq3temWSLe/R8GbBx6mInhjfdLtMU2FEjFS0
         ki27usF1V+TQ2RN5/qYVCk9PmpRNg5i+AcBs/IbgOdfZZbgpEhbOaU0wDjxikQDicIQE
         lcjNfUWR7riqRqC7mT7FIObjn0loGZH8EBtg2Bjqpytx/aoJRudEIb/8Smh4DL7Pu19r
         LwTw==
X-Gm-Message-State: AOJu0YxYgq+nt4PIoYcqDxAqppPHTedBGkFelsvkxQK2VDyOnDJha/R3
	5n0MtXieU5K2J79kX3Zm7ESKGu9+rp4R/7sTy+kHvVvg
X-Google-Smtp-Source: AGHT+IG5XeIAflMpcqUls1q2bcmzj8M2720/NorBsJ559jux9veJWCY8EgwkFHN3rl7l1ptkNMF9o7lWjVanb/aRjds=
X-Received: by 2002:a05:6402:26cd:b0:53d:d913:d3cb with SMTP id
 x13-20020a05640226cd00b0053dd913d3cbmr2077965edd.28.1697823620612; Fri, 20
 Oct 2023 10:40:20 -0700 (PDT)
MIME-Version: 1.0
References: <20231020163643.86105-1-philmd@linaro.org> <20231020163643.86105-2-philmd@linaro.org>
 <CAFEAcA9FT+QMyQSLCeLjd7tEfaoS9JazmkYWQE++s1AmF7Nfvw@mail.gmail.com> <56646980-d38c-d844-1ee6-80453d092172@linaro.org>
In-Reply-To: <56646980-d38c-d844-1ee6-80453d092172@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Oct 2023 18:40:09 +0100
Message-ID: <CAFEAcA-SwdO9qo=dFpbwOuEo2fu_WFxD7L5BipVnuvk99cz=Hg@mail.gmail.com>
Subject: Re: [RFC PATCH 01/19] cpus: Add argument to qemu_get_cpu() to filter
 CPUs by QOM type
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org, 
	Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>, qemu-s390x@nongnu.org, 
	Zhao Liu <zhao1.liu@intel.com>, Andrey Smirnov <andrew.smirnov@gmail.com>, 
	Radoslaw Biernacki <rad@semihalf.com>, Leif Lindholm <quic_llindhol@quicinc.com>, 
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, Shannon Zhao <shannon.zhaosl@gmail.com>, 
	Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>, 
	Alistair Francis <alistair@alistair23.me>, David Woodhouse <dwmw2@infradead.org>, 
	Paul Durrant <paul@xen.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>, 
	Weiwei Li <liweiwei@iscas.ac.cn>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Song Gao <gaosong@loongson.cn>, 
	Thomas Huth <huth@tuxfamily.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>, 
	Yanan Wang <wangyanan55@huawei.com>, "Dr. David Alan Gilbert" <dave@treblig.org>, 
	Marcelo Tosatti <mtosatti@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, 
	kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: RFNTf8mAXHnx

On Fri, 20 Oct 2023 at 18:29, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Hi Peter,
>
> On 20/10/23 19:14, Peter Maydell wrote:
> > So overall there are some places where figuring out the right
> > replacement for qemu_get_cpu() is tricky, and some places where
> > it's probably fairly straightforward but just an annoying
> > amount of extra code to write, and some places where we don't
> > care because we know the board model is not heterogenous.
> > But I don't think "filter by CPU architecture type" is usually
> > going to be what we want.
>
> Thank for these feedbacks. I agree the correct way to fix that
> is a tedious case by case audit, most often using link properties.
>
> "we know the board model is not heterogeneous" but we want to
> link such board/model altogether in a single binary, using common
> APIs.

This seems to me like a different thing -- just compiling
the different boards into one binary. That should be fine:
in this single-binary qemu, if you tell it -M foo that's an arm
board then qemu_get_cpu() returns the CPUs that are created,
and those will all be Arm. If you tell it -M bar that's a PPC
board, then qemu_get_cpu() will return the CPUs that are
created, and those will all be PPC. The assumptions of the
code that's currently calling qemu_get_cpu() or using the
first_cpu global won't be broken. It shouldn't need us to
change a lot of code that we don't intend to try to use in a
heterogenous-at-runtime setup.

thanks
-- PMM
