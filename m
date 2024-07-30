Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp2228772njb;
        Tue, 30 Jul 2024 01:30:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWEoivDzqy8iR/kEeoEppkKYkeSx0JuKTdbDwIrVqd9FmiqNScrjaeqzyAyfsP7N2GEl8GMrf/WajICtvo5yaOzng97oMjw
X-Google-Smtp-Source: AGHT+IHStlunXONHCwotXBasMfvzxaVRABaI3MHtFnW5RykzXOuCNJSOHGrVQyfvD0vE/BZr8RGj
X-Received: by 2002:a05:620a:414a:b0:7a1:d81a:d71f with SMTP id af79cd13be357-7a1e52568cemr1337614585a.27.1722328232425;
        Tue, 30 Jul 2024 01:30:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722328232; cv=none;
        d=google.com; s=arc-20160816;
        b=SMdSPVttgFp5fQenmwlZ07FYwniJAai21Pfp0TY1V+B3s00Kry3PISy17uEOG8eaQl
         eAW58Rb7ohhIphNwTGsldr1sLFvaLMgTKe5gj2ozlOxPIZbDeNYdSxQLOwpZpJf2hd8B
         8xRveEcH6+aiCalm+QScDvjjoaQhMZFqZnuARV/x4p/Aw8Lbtr2kWUoKKXB9wtQhz/ax
         V50LO1kAKGC56kl65Pflze9zOAajrn+tsnM87wP8Wnni/HfvSVMy4CLqIktDgXNrTCZQ
         vJcxKJ9Ehtyfycl5475SUnCjT6VX+bvYqGu/a+eC4a3zByVm29wI4eX8pH4b3atdpY8w
         DT6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=bvctSTCxXDG9vkXCPJRFSO2OwM56i0h+SX57avLe2Sg=;
        fh=t1dD5ONzED16rtaf1zEQ9z4LU3s+Hzu4FFaP6lHHeJE=;
        b=R4SqDV2M4nUIg094eynmlLOm8GqfihCHF5YOUSCEjcgDx+NdfgOkJ9FlaQy4goAiwF
         PcCl+bbOG3kGAEFTLgZmH67pBF1CjJZipZDzKO2lAfdbxuDWdT2KVmMoqhpcIEoX/Egu
         msU13jr89kH8NYcHPWeqUp+YZ+8HW1LbuSDm2bRIh9yxWIW5IGmCvVDop09rUGE/9IB9
         uIN1DHYqzKPsRTO9rXtKT+51bM2ETKnPZVC44vhYs8e+b5GDuU5uPkwpSfzsPGQv2aj9
         fWRfZApXRUq9qLaic3d5dY/UWJXosIdixd6SlEo1Vb1KEpEeS5JnCUYEeXXG6rf6GF3m
         z5XA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="M/4mS9Iq";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a1d73c6eadsi1236457785a.222.2024.07.30.01.30.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jul 2024 01:30:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="M/4mS9Iq";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sYiF0-0007Ap-57; Tue, 30 Jul 2024 04:29:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sYiEy-00073I-Dn
 for qemu-arm@nongnu.org; Tue, 30 Jul 2024 04:29:52 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sYiEw-0004SI-LH
 for qemu-arm@nongnu.org; Tue, 30 Jul 2024 04:29:52 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-58f9874aeb4so5737986a12.0
 for <qemu-arm@nongnu.org>; Tue, 30 Jul 2024 01:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722328189; x=1722932989; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bvctSTCxXDG9vkXCPJRFSO2OwM56i0h+SX57avLe2Sg=;
 b=M/4mS9IqJBN5Th0IgQzBCJ1+1LRDe6cN0zwPEmCSIPTbo2P946F3PGZhWAbJO/pXH0
 2nDkd/iDUheQcmrcgNbKORpzqUUKgYyY6pXCZIGNqP7G9o/qPuNsOL1pRRe5nVSd7SoN
 5+6yJHvqhV3DhLaZ/H7O9pK4Pgsla8jpUo6AUIw+G8oMBbqhW1IquE4yRxQT7U7alRa9
 rKLlL9Kn5sJwvsu+NL/MamZxxmivJ97pnyC504c09WAuMbFfze+DoVCPixTjEpdHHFhr
 8qjdMuuGP32Q8XDQ9UL3tjvjcQzPYx2f6rAQjC9NNrLvUbbPI/uFhXjkA75rW+ek0bOZ
 sh2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722328189; x=1722932989;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bvctSTCxXDG9vkXCPJRFSO2OwM56i0h+SX57avLe2Sg=;
 b=t4xm4Pgt0SyqBHbfse8BjhGTWnkEXDOCCCDsWXHKuqncjcXAVtNNI9fJ5FsEaFhDIl
 Vi0huvz3h2wy01RQQ8CGmo23jfEtGQoz3hMWTKaNaJ0aoE1iQ0TqjjpenijBDHc7ATDm
 HzJleO9j6KPe8/SKe8sRhDWHriMuAyu4YVokPTKoki8Iek4FvkXOlWh8qCihlpecT152
 69zpdaUMRi3+K1Te2SSghnkelFBRNgaqEkEJLQabgzRo2/3dMsrsc102XRDhamzNp1Vy
 TJ9iHsDd/ZXgH4EWQAPLjg4iSDmsQKc/DpuBOY4BXimi3yHdklhaccOIYMqg1gPcauBC
 y1iw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJSd+gW1SbbKgRuZHkWxbgM5oVGxyGtiwZJ18KSzqmqSFMuFHz/pb4R/QUGc+aENtZU5gQ88W26uv6NBL6+wQpqtuw
X-Gm-Message-State: AOJu0YwF/mWyRdqbxWAJD4LOjd5XaACj/oZ4jlp5kDkKuVXeG0LELIW3
 o+IOBNf3+mORwZd7fDKrzxb6FGbYlogQVrEnV1cExO0s9ednKLNOIymuHwKAdxriz+b57RJP77v
 EBrOrqP+1dC4f+TzkQYRTARBnB+YB41gftmFhAQ==
X-Received: by 2002:a50:a411:0:b0:5a1:7d68:62d8 with SMTP id
 4fb4d7f45d1cf-5b022c81f43mr5928071a12.38.1722328188753; Tue, 30 Jul 2024
 01:29:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1721630625.git.mchehab+huawei@kernel.org>
 <bf8367bddfdc95e378b5725c732533c3ba20d388.1721630625.git.mchehab+huawei@kernel.org>
 <20240730092549.6898ff3c@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240730092549.6898ff3c@imammedo.users.ipa.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 Jul 2024 09:29:37 +0100
Message-ID: <CAFEAcA8VWc3eQZqfJP9k5LYF-9aLChHQ+uS9UBfGV6nvybDxqQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] arm/virt: place power button pin number on a define
To: Igor Mammedov <imammedo@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>, 
 Shannon Zhao <shannon.zhaosl@gmail.com>, linux-kernel@vger.kernel.org, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: TnJ0W+Lt2MOk

On Tue, 30 Jul 2024 at 08:26, Igor Mammedov <imammedo@redhat.com> wrote:
>
> On Mon, 22 Jul 2024 08:45:53 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
>
> > Having magic numbers inside the code is not a good idea, as it
> > is error-prone. So, instead, create a macro with the number
> > definition.
> >
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index b0c68d66a345..c99c8b1713c6 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -1004,7 +1004,7 @@ static void virt_powerdown_req(Notifier *n, void *opaque)
> >      if (s->acpi_dev) {
> >          acpi_send_event(s->acpi_dev, ACPI_POWER_DOWN_STATUS);
> >      } else {
> > -        /* use gpio Pin 3 for power button event */
> > +        /* use gpio Pin for power button event */
> >          qemu_set_irq(qdev_get_gpio_in(gpio_key_dev, 0), 1);
>
> /me confused, it was saying Pin 3 but is passing 0 as argument where as elsewhere
> you are passing 3. Is this a bug?

No. The gpio_key_dev is a gpio-key device which has one
input (which you assert to "press the key") and one output,
which goes high when the key is pressed and then falls
100ms later. The virt board wires up the output of the
gpio-key device to input 3 on the PL061 GPIO controller.
(This happens in create_gpio_keys().) So the code is correct
to assert input 0 on the gpio-key device and the comment
isn't wrong that this results in GPIO pin 3 being asserted:
the link is just indirect.

thanks
-- PMM
