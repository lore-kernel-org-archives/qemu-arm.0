Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13281CA0FE9
	for <qemu-arm@archiver.kernel.org>; Tue, 26 Aug 2025 20:07:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uqzvq-0000xB-Ju; Tue, 26 Aug 2025 16:06:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uqzvp-0000wj-8q
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 16:06:13 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uqzvm-0002lN-UR
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 16:06:13 -0400
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-e95230750ceso345462276.0
 for <qemu-arm@nongnu.org>; Tue, 26 Aug 2025 13:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756238768; x=1756843568; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HXu67O7Ea+PWvOotIP4pcItL7PoH39gsbWp7BO3koiU=;
 b=MxslXl38WpD9n+s7pIIorf/Zf7NrJPmEn9fCuA4W7mUZWbolrXOeOWmWDsU38j9of/
 nm8KLLWjvE3Y3i7umXHSrsXQrEDebNFitM5HEzNTVLnNdwCJWgbkj28KgIoYHT314IaN
 CF/qJ30KSCS8Of2VxW4GuggGxWRVQ8XYi9iNeJU1D/zDw4u96ZMOUBCtd+pR1VRKGxcL
 uIblF8/BpDq9RtIgUljfecPqcH14+q7s/t2j5weCSTRjP9FaOruvqM1+JqVM7s0AZoUK
 Kx9dHIUKovSKk/tWMF0ovPcYE4SfjqmZp5Rv4WYTzTCeTaQ1V02jfQj2vCdl3e4AaGBU
 Oejw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756238768; x=1756843568;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HXu67O7Ea+PWvOotIP4pcItL7PoH39gsbWp7BO3koiU=;
 b=OQYPZB2xu0K6dyEQkAaZIOFfog7Zh9Nt2LPPTUKl3xZhZtPJF8BhCH5tEuViOZQme2
 iGpsLDokgdAt7TFjHTgzTjDOAxV4mUfbBf229G7FFZsQyl9uQ9ObUEFwXUA4zMo8nZUe
 Na/rh4rqchUPevL0Q0YxjvEBA1juy/iZEDGM6rFdVFHqFUPob15Qiwii6H2QM7msVd2O
 Jg7M5XVSqn1qC8hVM+ika2qzdqEip66JkMlwlirjV5VFGJVZRmTID+Smht73eSiumqDW
 jRQbpOJZDyidR+pKFZMfctpy2xD2BtjfO4LtAMiYai7IudrCOaC61VhpQ2Bp5cAoiYdS
 xSnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUD2ByuYuQU5eVsXwfDyXjeNe+rT2hh2HrUUDkjZf7M82DdrEm3zIxXwr8RuyaX0UPdKRjioMU0cw==@nongnu.org
X-Gm-Message-State: AOJu0YxedlP1pFzsFzNDtcEYJeP5dkJlwUW4/t3sEPnpolhHGUExEp5v
 c4wXjqX+4UCEZxTLxdnIYrq2BsbtEsdS+JlLiU3pEL5laK2qR44hCj8+bAKuCEzTj0iyG06Rph8
 4dAyuf1i3r4UuSAp+KDw5JvIA4Xjd/8/C7SQujRU0nw==
X-Gm-Gg: ASbGncvef8hookpTRNp/v2CTTJMFJzrnmRm4li+5sE7O7tcavNSrlOS7WZFj6NWIzex
 ww8N6HxcinS+QDKZgDmq/qyE73KcJ0XfvWf8/mUTHzkbSZbSqnPkO/1yfp8cc3XRmkaxGa2m19n
 5sROQC9y1sYH5iBNSmcQr9TCANxBwg7xwqXxH7UEc8aB2E/rnlzXJ5tIVN+AjVJ1su5xw88eNCp
 wOlktE+hj2CVdJzb8gP1ElNsh3erA==
X-Google-Smtp-Source: AGHT+IGVIbJSYaMHDgmGIq52hpcM5ytpviHDC68Vg16MB2u+KdxsQK+h8pCxUbnATa+2I/euGNadLshVrA7/D7VeiwY=
X-Received: by 2002:a05:6902:2885:b0:e95:398c:d2a0 with SMTP id
 3f1490d57ef6-e96e479290bmr2458803276.8.1756238767562; Tue, 26 Aug 2025
 13:06:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250822151614.187856-1-luc.michel@amd.com>
 <20250822151614.187856-24-luc.michel@amd.com>
 <aK4MCVXhR2hazu6B@zapote>
In-Reply-To: <aK4MCVXhR2hazu6B@zapote>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Aug 2025 21:05:55 +0100
X-Gm-Features: Ac12FXwi7wyiTBf4PdcXAiA6VV4AoPZTzADNGp-zE9HZxCO0VCOtirRbpgzQsGQ
Message-ID: <CAFEAcA-Db1FRLAUtCUa+C_6X1U+F8ubo_PntsEJcZKPFQCB8Sg@mail.gmail.com>
Subject: Re: [PATCH v4 23/47] hw/intc/arm_gicv3: Introduce a 'first-cpu-index'
 property
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: Luc Michel <luc.michel@amd.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Francisco Iglesias <francisco.iglesias@xilinx.com>, 
 Francisco Iglesias <francisco.iglesias@amd.com>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Alistair Francis <alistair@alistair23.me>,
 Frederic Konrad <frederic.konrad@amd.com>, 
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, 26 Aug 2025 at 20:33, Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> On Fri, Aug 22, 2025 at 05:15:48PM +0200, Luc Michel wrote:
> > From: Francisco Iglesias <francisco.iglesias@xilinx.com>
> >
> > Introduce a 'first-cpu-index' property for specifying the first QEMU CPU
> > connected to the GICv3. This makes it possible to have multiple instances
> > of the GICv3 connected to different CPU clusters.
> >
> > For KVM, mark this property has unsupported. It probably does not make
> > much sense as it is intented to be used to model non-SMP systems.
> >
> > Signed-off-by: Luc Michel <luc.michel@amd.com>
> > Signed-off-by: Francisco Iglesias <francisco.iglesias@amd.com>
>
> Peter, were you looking at solving this with links to CPU's for the next
> GIC? Perhaps we should do the same here?
>
> I'm also fine with this patch as simple way of solving this problem.

Yeah, links to CPUs is my plan for GICv5. We don't currently
support having an array of link properties, so you need this patch:
https://lore.kernel.org/qemu-devel/20250606140327.1289993-1-peter.maydell@linaro.org/
which provides the macro for declaring the property array and some
functions for setting it up in the board/SoC code (and a sketch
in the commit message of how to do it).

If you want to have a go at doing it that way, feel free; but
I'm happy with doing what this patch does, since it's what we
already did for GICv2. We can always come back and do the
refactoring later.

thanks
-- PMM

