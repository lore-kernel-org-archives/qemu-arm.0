Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp386159ejb;
        Thu, 1 Jun 2023 05:07:36 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4VvepjYznb6/Ko893neVGT5auCWOk3HZsRc61nHyh7iGvQLZyTG22s30+X7kq8vPDGnmlh
X-Received: by 2002:a67:fe4f:0:b0:43b:159b:f2c5 with SMTP id m15-20020a67fe4f000000b0043b159bf2c5mr273052vsr.32.1685621256552;
        Thu, 01 Jun 2023 05:07:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685621256; cv=none;
        d=google.com; s=arc-20160816;
        b=tcGYdELY8w261jIONhYiLHqTNYrXuzVNfP/xar1gjjEBrN2zBUlYyRMHdFdQDhKadV
         VsJHToze6A3dzE3uzrZjWcEMpzXsBJA83z1z8aFVDmwtHHNWRwEfEvKEcHDNn9G/CjHX
         MAbbQ6eSFtx3Lw5mVKW2Ykqu81b7fs0NqXv3P0RVWk8TLt5hHKQRIyBKGR0ClTTcJ830
         xkUq/Jr76wwmyb7QSaJv3+/ZpD5niSx/WiGvPvMNidFfpIvJxZxQL+94CpRAJ747jrnz
         sJU3DwLY59ovd7owm2Oq7eigEDGgV38iL0GvM8K7GUcJHkfOFLL2c7r8hwmpz8s8ve3k
         j1yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=6KQU5YIHTzsd3r14/A+S7fdQB5OW96KUk6rgK9mse6M=;
        b=yhOYqIQWkleyRazCCYxmPksNrJW9IHharvz/KkkkSZ1mI4pdiQL6yDQrNIDAd/9eyL
         t9aDuFp31lsQbKDFZcTMRUQXTChHQ+KG7sFBMgNF0H4OV2shind8v4XkwFKXi9PLLdi4
         z2Iw/B5pJ4UWslw+ItBV7wXsg8ASFcaBMK9gT7tRA6o1eTU2Oc1aVDstAcVK17j7Lgs5
         M62ad9VsGtGTdeRsCfWb4pn+IbuAWkQtIAlDEFDPR219ofNmsHYcHd865HuztDe107iF
         ISxLh6EVs/7joy1Aa4IxvXEutsVfGF3CQ3Ntl8MHU/teZSx0DcELbaXIUETdT9gM6eCY
         +Vqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Qg2aWal5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t14-20020a0561020a0e00b0043b1fbf9166si9549vsa.670.2023.06.01.05.07.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Jun 2023 05:07:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Qg2aWal5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4h5M-0008TF-Tv; Thu, 01 Jun 2023 08:07:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1q4h5K-0008S4-7p
 for qemu-arm@nongnu.org; Thu, 01 Jun 2023 08:07:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1q4h5G-0004xm-EA
 for qemu-arm@nongnu.org; Thu, 01 Jun 2023 08:07:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685621233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6KQU5YIHTzsd3r14/A+S7fdQB5OW96KUk6rgK9mse6M=;
 b=Qg2aWal5gOr3nVZMthEy/sxrmujoIqgFRcMIdThiYqXq8Qwsv4zJFkF57uI/cgAKy5Rm6p
 bdSebSJDcVVXi56sfJYB1IqK8d3TeD2q5svXH63RvLOLCxR4+nGOylOEeizfpO3hJPKylv
 akHpQEwIl/Y4jKHx832ALD7iyQ0bUOE=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-339-0iCL_zsmNJSL9g4y-G0upg-1; Thu, 01 Jun 2023 08:07:12 -0400
X-MC-Unique: 0iCL_zsmNJSL9g4y-G0upg-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-4f59c4df0f9so498052e87.1
 for <qemu-arm@nongnu.org>; Thu, 01 Jun 2023 05:07:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685621230; x=1688213230;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6KQU5YIHTzsd3r14/A+S7fdQB5OW96KUk6rgK9mse6M=;
 b=Xn1xpjDTl96A8sqGkhVoJjfLjHRSQO8jKRF6ELA/+DO8bon1f2VRAKfNjW1tRMlvaf
 3bZVBKWAosF6JUC9gi+zmbwWTImuskiQszRzB0oFMUds5q0qNL7x8rUnnlK1u/iWsJYe
 AtsXovZr1DdvVISkRH+sUbY7UreOIY9+xLUXPB0OGuPppufzYnklol48yuYOnuQwkt4F
 ws9Y2FArDsSJ8NyOivmswTh8Ntvu8YUN8llr7uR3b1W78V2FyNIT03zIyJenaXwMZiMV
 GbnJbVK4JmpiMpkEUIC40uNjxqRvj5Ah7VljpzSUbpJjEDgq2Zv67FxWYJW9mDC0RHFk
 4zVw==
X-Gm-Message-State: AC+VfDxjP02IxlgtkS/g0isR+wFBE/Ha1yCEeswPCoqPS2d0ViRRIaTH
 xJeiEMCYbn+lRkrqP8OtC8M8ezx87Sgjn07ShgjfBU/3iCxN3qFf4bgphcQhGERc4POJyIsLvBs
 sfHLAojXuT8+e
X-Received: by 2002:ac2:46c4:0:b0:4f4:e353:6a98 with SMTP id
 p4-20020ac246c4000000b004f4e3536a98mr1308906lfo.36.1685621230692; 
 Thu, 01 Jun 2023 05:07:10 -0700 (PDT)
X-Received: by 2002:ac2:46c4:0:b0:4f4:e353:6a98 with SMTP id
 p4-20020ac246c4000000b004f4e3536a98mr1308868lfo.36.1685621230292; 
 Thu, 01 Jun 2023 05:07:10 -0700 (PDT)
Received: from redhat.com ([2.55.41.2]) by smtp.gmail.com with ESMTPSA id
 l22-20020a1c7916000000b003f6f6a6e760sm2168994wme.32.2023.06.01.05.07.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jun 2023 05:07:08 -0700 (PDT)
Date: Thu, 1 Jun 2023 08:07:04 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-arm@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 0/3] Trivial cleanups
Message-ID: <20230601080655-mutt-send-email-mst@kernel.org>
References: <20230523195608.125820-1-shentey@gmail.com>
 <c138717c-5085-3b4b-5a46-0fa93179f6a8@ilande.co.uk>
MIME-Version: 1.0
In-Reply-To: <c138717c-5085-3b4b-5a46-0fa93179f6a8@ilande.co.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.166,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: 2GLvFywrZAuS

On Thu, May 25, 2023 at 05:03:15PM +0100, Mark Cave-Ayland wrote:
> On 23/05/2023 20:56, Bernhard Beschow wrote:
> 
> > This series:
> > * Removes dead code from omap_uart and i82378
> > * Resolves redundant code in the i8254 timer devices
> > 
> > v3:
> > * Drop TYPE_ISA_PARALLEL since they became obsolete by
> >    https://lore.kernel.org/qemu-devel/20230522115014.1110840-9-thuth@redhat.com/
> 
> Oh I didn't see that this had already been merged :/
> 
> It's not a reason to block this series, but I'd still like to see your
> changes to ParallelState and ISAParallelState merged separately since they
> are a better match for our QOM coding standards.
> 
> > v2:
> > * Export ParallelState and ISAParallelState (Mark)
> > 
> > Testing done:
> > * `make check`
> > 
> > Bernhard Beschow (3):
> >    hw/timer/i8254_common: Share "iobase" property via base class
> >    hw/arm/omap: Remove unused omap_uart_attach()
> >    hw/isa/i82378: Remove unused "io" attribute
> > 
> >   include/hw/arm/omap.h   | 1 -
> >   hw/char/omap_uart.c     | 9 ---------
> >   hw/i386/kvm/i8254.c     | 1 -
> >   hw/isa/i82378.c         | 1 -
> >   hw/timer/i8254.c        | 6 ------
> >   hw/timer/i8254_common.c | 6 ++++++
> >   6 files changed, 6 insertions(+), 18 deletions(-)
> 
> Do we know who is going to pick up these series? I can send a PR if no-one minds?
> 


Go ahead:

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> ATB,
> 
> Mark.

