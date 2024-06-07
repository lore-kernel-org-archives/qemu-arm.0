Received: by 2002:a05:7022:52b:b0:7e:eb73:5b3b with SMTP id 43csp1005152dlj;
        Fri, 7 Jun 2024 05:20:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW05jvrC2e+FmiKFAkbYPUxWoSKVLkrOM6o5eOK7OhYajzy8Isvf9s43Lw3Mesz48eiAd42P4bgkwhY+4AHMVuyBACJd3Q0
X-Google-Smtp-Source: AGHT+IE7JWcGXrakfStV1huy/bGOF6sN9EILKau/n3X8QSuahg0he3xSMaxnwq+O4D4R79xLscUP
X-Received: by 2002:a9d:7449:0:b0:6f0:4947:8392 with SMTP id 46e09a7af769-6f95724ccd9mr2311754a34.16.1717762858598;
        Fri, 07 Jun 2024 05:20:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717762858; cv=none;
        d=google.com; s=arc-20160816;
        b=Dq2iTzGGG6QwcT16xM7jm1ceUPzBxqqCUpO7I12xqUHhpf25EVvO+nVRTgRVflkoaa
         3QYfFdM45/xLhR5l/4L5TUdHQUHnFKhIQbBKyOyF2BwTRQ1IElole6+0mk88RDu3llDN
         S+qy91vBFRnhSaylKHeEsGXIvVJGOyiDx1qRZA9/BnUhQmWLer0y4vJpaqCN0xA/g4wg
         cxyG5mQCiyqFne+4wwKBw605sb9VcS9VM2ADvoFFjVqXPA59KB/ub76Jv+w7eigXDZXl
         sf0BlNpzFl4Qm0+tYl+FWmdkAX5EqgZJRjoD9On2PS715YdQ8r+xwNZricgkFmxtJvmJ
         IFmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=yPuCgXWTYCvtUTvd2JN9UMsbaVvwUfJec1BJ7ZfWBCI=;
        fh=ekotH56phovDFl9XssfPsrv0WUe+YmSv3q/lU//fxRE=;
        b=YgWRK/mTs9y8HpjUfc1KpCeuo2INfwvoMzT1bSES6f4YCpzvfcUit02PoUbS3BJXUW
         yq6LJTs7wwRIhQB9HMm91iq/oj9YgvjX1rB4puICtoJnf1EuTC7zWrxzVWHyy3uSTYIV
         ygL+RWm2o0sHJrRGmMr5G3+Rj8DR14vGQruTch0hcmdnT18Fj1H45FUEv7pKp8qYK0nk
         asXwYeP0rcAkqC5uxolwegCA6Q6W1U/eaAv3fWl5dvNsa46kP5+yiFNcM3gTrVMl/fMU
         WCAbYV5D30eWPj01MoicX/Ab34M4kR5S9OBxwZ00RWYWZOZvVXV0kGC6UODYQBjijgUV
         eRoQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cAUeGGaF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-795331d1343si357965785a.338.2024.06.07.05.20.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Jun 2024 05:20:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cAUeGGaF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sFYaK-0008Gk-Pg; Fri, 07 Jun 2024 08:20:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenyzha@redhat.com>)
 id 1sFYaJ-0008G4-VE
 for qemu-arm@nongnu.org; Fri, 07 Jun 2024 08:20:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenyzha@redhat.com>)
 id 1sFYaI-0005jh-EV
 for qemu-arm@nongnu.org; Fri, 07 Jun 2024 08:20:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717762841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yPuCgXWTYCvtUTvd2JN9UMsbaVvwUfJec1BJ7ZfWBCI=;
 b=cAUeGGaFlUwi8/43C8NFHfojSlWPqhEMtU/msEwvGfwMwaRNe8QSYfVDxxm4WGFf+rMsSp
 AHxdxYPV7MwIy5IEFjK3oM76cg3NTIUhs8KGU6VLyEqGUdpDDXuw+DLYLIFtocB+hJ1kNk
 p2DFHnDkiCYPADepCwsZCc6Wsp8BA4E=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-294-vQ7bZrYqMQWamIzRHsLjnA-1; Fri, 07 Jun 2024 08:20:40 -0400
X-MC-Unique: vQ7bZrYqMQWamIzRHsLjnA-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-a6def6e9ef2so49784366b.0
 for <qemu-arm@nongnu.org>; Fri, 07 Jun 2024 05:20:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717762839; x=1718367639;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yPuCgXWTYCvtUTvd2JN9UMsbaVvwUfJec1BJ7ZfWBCI=;
 b=HbRwrDSybB872usTqJ3ePNsVVdqaJcIrfZE2J4aPUOFwguFxKo4et0eoxPbA+8Jw60
 H0Eo2+YOhDu59N40Ae79EO7/a3HHTt3Mi+m88t4rbX2oWSEkrQ5uC6qUn0Asg7qIJc7R
 k5/PQG/4YPKpr1SKfwQZYXsja+MLjw/ZpnNxUitd1f+OQ0JvAi4axnQmiS3q320o/Wo7
 9DfF/gIaXUoBptmRDZLeNaJjnHHewasGlSrUjbUKw9TrQoZB1Hg8G2dmlCb0iWgqRP72
 xaM3A2+8bzqTfT+g9T4LsI8Pwj7YAn6UhDAuGrxNxh6c/F5P1u2tByWkw03KODUEbqRg
 SP+Q==
X-Gm-Message-State: AOJu0YwT5gKOYAoD4juwN0DsCae3tpfC/pKXuUXCEv0jl5GX7NC8k3Uj
 zxEsAXFk+mOfOdOdG6/WlWtEXxcloYu6ywuddJud7tnABiQyhbtJYWPE4xpKLI6IA9xsUQ+KTkw
 K9q8ZNsQMitxQrrCFSAbVl0lUbAgG36JhZXOd5Bu4KYJYifuU3FKQGwLuY+gfecCjwvRFsJ6Svd
 el0bBwJZ7XqsazqfrXkIXlNc64
X-Received: by 2002:a17:906:a001:b0:a65:ec91:c965 with SMTP id
 a640c23a62f3a-a6cba4a1fa8mr212382666b.10.1717762839362; 
 Fri, 07 Jun 2024 05:20:39 -0700 (PDT)
X-Received: by 2002:a17:906:a001:b0:a65:ec91:c965 with SMTP id
 a640c23a62f3a-a6cba4a1fa8mr212380066b.10.1717762838943; Fri, 07 Jun 2024
 05:20:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240606104745.291330-1-zhenyzha@redhat.com>
 <CAFEAcA_ovHZWFi8Xn1YdPNkFjNWQ+BGQTA0Oc9oXTNuPD+bmmA@mail.gmail.com>
 <20240606181338.00003336@Huawei.com>
 <6e67a59a-7ed6-46c1-b9ba-884800005c81@arm.com>
 <CAFEAcA8pWdMF8e_gpP288HUppx=ceAfUGz_GH16hXaSw-aie0A@mail.gmail.com>
In-Reply-To: <CAFEAcA8pWdMF8e_gpP288HUppx=ceAfUGz_GH16hXaSw-aie0A@mail.gmail.com>
From: Zhenyu Zhang <zhenyzha@redhat.com>
Date: Fri, 7 Jun 2024 20:20:02 +0800
Message-ID: <CAJFLiBKXwQvxE7Pcs2e5Rs5ZqKzJ6x00KkoJuNbCoFYucc=hqQ@mail.gmail.com>
Subject: Re: [PATCH RFC] hw/arm/virt: Avoid unexpected warning from Linux
 guest on host with Fujitsu CPUs
To: Peter Maydell <peter.maydell@linaro.org>, robin.murphy@arm.com, 
 Jonathan.Cameron@huawei.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, gshan@redhat.com, 
 eauger@redhat.com, sebott@redhat.com, cohuck@redhat.com, ddutile@redhat.com, 
 shahuang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=zhenyzha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: SGYb9oms/YdH

On Fri, Jun 7, 2024 at 6:17=E2=80=AFPM Peter Maydell <peter.maydell@linaro.=
org> wrote:
>
> On Thu, 6 Jun 2024 at 22:18, Robin Murphy <robin.murphy@arm.com> wrote:
> >
> > On 2024-06-06 6:13 pm, Jonathan Cameron wrote:
> > > On Thu, 6 Jun 2024 12:56:59 +0100
> > > Peter Maydell <peter.maydell@linaro.org> wrote:
> > >
> > >> On Thu, 6 Jun 2024 at 11:48, Zhenyu Zhang <zhenyzha@redhat.com> wrot=
e:
> > >>> In Linux, a check is applied to every device which is exposed throu=
gh device-tree
> > >>> node. The warning message is raised when the device isn't DMA coher=
ent and the
> > >>> cache line size is larger than ARCH_DMA_MINALIGN (128 bytes). The c=
ache line is
> > >>> sorted from CTR_EL0[CWG], which corresponds to 256 bytes on the gue=
st CPUs.
> > >>> The DMA coherent capability is claimed through 'dma-coherent' in th=
eir
> > >>> device-tree nodes.
> > >>
> > >> For QEMU emulated all our DMA is always coherent, so where we
> > >> have DMA-capable devices we should definitely tell the kernel
> > >> that that DMA is coherent.
> >
> > The trick for that is to put the "dma-coherent" property right in the
> > root of the DT so it plausibly communicates "the whole platform is
> > coherent", and is then inherited by all devices, even those which
> > shouldn't technically need it.
>
> Ah, cool -- that's a pretty small change and it makes sense, and
> avoids us having potential bugs in future where we forget to
> mark a really-does-do-DMA device as dma-coherent. I like that
> a lot better than adding incorrect dma-coherent tags to lots
> of device nodes that aren't for DMA-capable devices.
Hi Robin, Peter, and Jonathan,

Thanks for your suggestions, it helps me a lot!
I will submit a v2 patch that puts the "dma-coherent" property right
in the root of the DT so it plausibly communicates.
Yes, these discussions make sense.
I will modify and test it again on Fujitsu host.

Thanks again
Zhenyu

>
> thanks
> -- PMM
>

