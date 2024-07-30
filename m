Received: by 2002:a05:7022:429:b0:85:21:bd5b with SMTP id 41csp761769dlf;
        Tue, 30 Jul 2024 04:26:35 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCWzsyFehKPPUVDDT9Qi5oo9U947794p4anviG9tep9ux0QlGlT0tb/+F0tpteBixehEewCTuTzlhikWV0fJQ+iFSdC1d3/v
X-Google-Smtp-Source: AGHT+IG1h4jfMDzlRiXslshoXIUpXAIlVZCWuLayujD3ZxdJL00CusdS+DYaxqgmOnCeFBH0hgAV
X-Received: by 2002:a17:907:9409:b0:a77:c26c:a570 with SMTP id a640c23a62f3a-a7d400d4d96mr725585566b.36.1722338795194;
        Tue, 30 Jul 2024 04:26:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1722338795; cv=pass;
        d=google.com; s=arc-20160816;
        b=kaIntZJLn0gAAGycsaJ9Wbgpfu2Jy6bHblevhljdnwqH7nc1Bg/Gon4z3Ig0m+GvzP
         orFLIb/y+2xXI+B7TR269wvBFFyznYkNlsri1JE+bafEKi7wDl634XdLAUZRHc7hy/sv
         /CfvX+eWel2co3DclA7r/v9IufXTdTVecPOx8RmuGs9FOH4DGGVZUj4AM4n4lrsVMKRW
         4sLPfm7wxCoEY8TdQr+WxL0jhUGZ5Ywf5VZnWPnw8D9Jq+P2Yvw/VC7hn/TNkO2fe6KL
         1yiU6A6IUB/uywdbXX9xwh3jh5H9BvjXZUXJYjnFfwvY0aBgqBdDTodoSz7edN003vgp
         Az5g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=68Bv3qUhugllW5feZfpnaJ6Nwxgo67qRQ8KH325FnCA=;
        fh=r5S5mpwfXra3PIwMpoMpN1ZgATW/JnZrUZk66relfS4=;
        b=j79ASL7P1fKQ1XtHHbLVk3dOr5pAZo0NRcFXZkCdi5C2QthYJiCQqB+70XBlLnqPo8
         zj1IXX7rFbVH/C8rsuMHdWmvq9oUUPlZkYxP6ucHLkwq1iQCzuK0x8bFc4tKa2NXOAbu
         ZYfDVxmGoQ7fFOmoz4jtqsuVhyX+eSpOFT5z72waUqNmuc093/UDtHN8zePAxrZYAHs1
         dJv91BAM0xm8wXNCkw8m54L6YYZG8XZwQX4LW325MoUevi8P+jt1UIKlAFnWNC3vY39t
         cGKsmNgUZCeCQuc0n+GrNZh7qLsWFQhcaeH/o+wjFnauemNTc/coQXZg/M7nVbCvy6VV
         XHKw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KE9aljSn;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-267339-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-267339-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <linux-kernel+bounces-267339-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id a640c23a62f3a-a7d8665a910si77135666b.661.2024.07.30.04.26.34
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 04:26:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-267339-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KE9aljSn;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-267339-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-267339-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1C831F25A09
	for <alex.bennee@linaro.org>; Tue, 30 Jul 2024 11:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AF9A19D8A6;
	Tue, 30 Jul 2024 11:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KE9aljSn"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C4518C336
	for <linux-kernel@vger.kernel.org>; Tue, 30 Jul 2024 11:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722338789; cv=none; b=aTAL3V92zb/FeJB4MoT+QY4Creg6uLPREJCCego/55/va+MNxlbJURQMzrjezA1onUCACxzAb42md50HYQqw2HG5Q5VGUP0k1+aIur5EGBAwQIw5A+vIdPcEYK0SH22j/J7oMQqVwXAMB4KQkyksVMwKlmDg0Bwf04zb1qUBbjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722338789; c=relaxed/simple;
	bh=JCI53+kxpVBH/b/xCXx13Bk0eh/RhU9qOj2KGMlV3Qc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e8aK64CsVcS4IkmkOQosvYKS5JJuW7vfT1X7dGcq9QJ2KuHSrWPzC4WTyk5qO8TEPWJ2SzFjK4EMojIxO56Iplu+HpzqmyWuKvAXZLJU8IXIetbQ43jLxvqWncNlu+e6v3GrZYAjo4CHHivY0idDqnZsiL2dbtgbSEvvI9y+1bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KE9aljSn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722338787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=68Bv3qUhugllW5feZfpnaJ6Nwxgo67qRQ8KH325FnCA=;
	b=KE9aljSn7iH5i6SQq1ekfyuxfy0dwFofX6wSFk5XpbVEkey2LQpw3jgy7PbRwkW9tDPooX
	lZIndt7ee6HWFaNyLP6bu6eofHqIzLuODouEzJJ8MbD3VMgYUkBDJ4t+V0o0mnib2yh/Gk
	5b5KlYpRBadh/ZY8vqmarrRlrz7M39Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-pq86rJTcMACuvB0DrKFU8A-1; Tue, 30 Jul 2024 07:26:25 -0400
X-MC-Unique: pq86rJTcMACuvB0DrKFU8A-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-42808efc688so26020475e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 30 Jul 2024 04:26:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722338784; x=1722943584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=68Bv3qUhugllW5feZfpnaJ6Nwxgo67qRQ8KH325FnCA=;
        b=C798ZxLKCxK4sp2MdpZdseXtfrsujDR3QcQkiux0z1fgIPo9bJeSt/8UGVODIJTQsf
         yq7gGx+e3IQSXf2uRgdQDEf4JYMHFoQWgo3b4IYTtqku2xHwbcMr9w586JSDRAF4ZiqT
         BL3qu7o0PZgz0waIdiNph+H7oJI1Tb7/61lepuimocUF+5tjyk4tAiRmRiHl2uNsHuI/
         vyNckin1wNiALlVe00RoLN9lOAYC+orX6dVzXW7or4ETWsftMv9TdZXx5oGeI8pmp92h
         jLvXruFTnDcXHPV/KhlcjM/9gRmdDvV/tONJKOWnmPZLlRe1pKol1zgQAqWN67Q1kBlR
         Jt1A==
X-Forwarded-Encrypted: i=1; AJvYcCW9YYgwviytuRTFXMahhVbhxEKFfdGG7v3JKYorb/9x6x/BUjrWWvjlEg+63yl7X0sHInxgs0I5dStUdcF7w9hn7IvraqsuEi39Jkm4
X-Gm-Message-State: AOJu0YwKqNrrBTg6844QXY2Ju0UD+QBW41XXYxeiA16VL+sc6EcJqXe3
	Jm6AflkVNeqLyi8kPyRrzXftFHtuXjPtJT9cTsFO0IrtAbcNAER7yfi4DVJPvtZATg0MlgpFN8b
	kMSfb2/Pg/tm8qQ/gnO/HcVB2HM1KtTNvAd4JeVipfJNp7gZHUxjganijPvX6xQ==
X-Received: by 2002:a05:600c:1515:b0:426:55c4:ff34 with SMTP id 5b1f17b1804b1-42811d85b96mr64691615e9.15.1722338784286;
        Tue, 30 Jul 2024 04:26:24 -0700 (PDT)
X-Received: by 2002:a05:600c:1515:b0:426:55c4:ff34 with SMTP id 5b1f17b1804b1-42811d85b96mr64691525e9.15.1722338783818;
        Tue, 30 Jul 2024 04:26:23 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4281dae1479sm64171485e9.44.2024.07.30.04.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 04:26:20 -0700 (PDT)
Date: Tue, 30 Jul 2024 13:26:20 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Shiju Jose <shiju.jose@huawei.com>, "Michael
 S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>, Shannon Zhao
 <shannon.zhaosl@gmail.com>, linux-kernel@vger.kernel.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v3 1/7] arm/virt: place power button pin number on a
 define
Message-ID: <20240730132620.46cca4ce@imammedo.users.ipa.redhat.com>
In-Reply-To: <CAFEAcA8VWc3eQZqfJP9k5LYF-9aLChHQ+uS9UBfGV6nvybDxqQ@mail.gmail.com>
References: <cover.1721630625.git.mchehab+huawei@kernel.org>
	<bf8367bddfdc95e378b5725c732533c3ba20d388.1721630625.git.mchehab+huawei@kernel.org>
	<20240730092549.6898ff3c@imammedo.users.ipa.redhat.com>
	<CAFEAcA8VWc3eQZqfJP9k5LYF-9aLChHQ+uS9UBfGV6nvybDxqQ@mail.gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: nrN+fkfr+4xi

On Tue, 30 Jul 2024 09:29:37 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Tue, 30 Jul 2024 at 08:26, Igor Mammedov <imammedo@redhat.com> wrote:
> >
> > On Mon, 22 Jul 2024 08:45:53 +0200
> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> >  
> > > Having magic numbers inside the code is not a good idea, as it
> > > is error-prone. So, instead, create a macro with the number
> > > definition.
> > >
> > > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > > Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>  
> 
> > > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > > index b0c68d66a345..c99c8b1713c6 100644
> > > --- a/hw/arm/virt.c
> > > +++ b/hw/arm/virt.c
> > > @@ -1004,7 +1004,7 @@ static void virt_powerdown_req(Notifier *n, void *opaque)
> > >      if (s->acpi_dev) {
> > >          acpi_send_event(s->acpi_dev, ACPI_POWER_DOWN_STATUS);
> > >      } else {
> > > -        /* use gpio Pin 3 for power button event */
> > > +        /* use gpio Pin for power button event */
> > >          qemu_set_irq(qdev_get_gpio_in(gpio_key_dev, 0), 1);  
> >
> > /me confused, it was saying Pin 3 but is passing 0 as argument where as elsewhere
> > you are passing 3. Is this a bug?  
> 
> No. The gpio_key_dev is a gpio-key device which has one
> input (which you assert to "press the key") and one output,
> which goes high when the key is pressed and then falls
> 100ms later. The virt board wires up the output of the
> gpio-key device to input 3 on the PL061 GPIO controller.
> (This happens in create_gpio_keys().) So the code is correct
> to assert input 0 on the gpio-key device and the comment
> isn't wrong that this results in GPIO pin 3 being asserted:
> the link is just indirect.

it's likely obvious to ARM folks, but maybe comment should
clarify above for unaware.
 
> 
> thanks
> -- PMM
> 

