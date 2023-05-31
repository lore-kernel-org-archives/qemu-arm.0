Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp41998ejb;
        Wed, 31 May 2023 08:28:58 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6RDoje0ilQIlZ3JFUeVyEmDPdfwOdHZAlnq1ooAgYbaTPgf3faW/ccsC9mJzTEBa3rdX1P
X-Received: by 2002:ad4:5947:0:b0:5ee:2789:160e with SMTP id eo7-20020ad45947000000b005ee2789160emr7374486qvb.52.1685546938664;
        Wed, 31 May 2023 08:28:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685546938; cv=none;
        d=google.com; s=arc-20160816;
        b=NNIvZMFrXzfHc0KrF1RHEEtAr0BWkuPK8hChZvFMxT3XwwzMRnDX3FLWFT90BNC8io
         Gh7iGMpPdM91Nv1VANpwnqP+32TlUKk/lbqyXIJVv6GrEm5CfEb4qaIgB6Q3VWepV6Ln
         EeiXaQQPwPpc6UL+D8eS+TVEtcHMwj9w2mIprGsuFQfdBGzHPyMs2SlXDOkMzyizNcPH
         QmQE8VMldX/SUoJxWHWFzSQAAsIwUQA+tkN/KcKTziZtElTEfm74ZAfOn/GpEmj6wqfi
         09g8QFH05BUphUvhJztoKgh/S3ggSrDM7lhySF7H3UAGAgaXo/JlLmRIZEedMHL+UeDu
         atrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=KIcLj7EkGs6KAt2JC7AbOLpJYtKq2JKggaI9q8lYma0=;
        b=MomnWKO7dXzL0KQEgVLXHjAQHPT5ANq5YQEJDIVXWCvq/H7pVzHTTSKlSUT4lSqEcm
         DNLuImRQDtu0qpwkWxMcpS25iN+INdNAVrPPWsNl+ccijpZspNUs/oV7s5ExyH1cWCiF
         3EDs+0v5JJMpGTbZNfmI2pEqG66pVxOzzEmCcREBufe0HhdClRRDbFdKZFhdPWagzfDX
         SeIwuiYaqpFhD7pwlWWwIqCd7B9qOGxbGVedBzqcs6I4ftmRiS1g0BqZnHW8mtriomJm
         uCkCuK6tUy4X+P0ySx0aDVub7EShiaqwfeNMSrJBhcQRyWtwUr7zdYhvW3mU7XoK75aP
         CuBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UQ4whnL0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 11-20020a0562140d4b00b006262b1ea732si3763839qvr.222.2023.05.31.08.28.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 May 2023 08:28:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UQ4whnL0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4Nkc-0000db-BG; Wed, 31 May 2023 11:28:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q4NkZ-0000dM-Oe
 for qemu-arm@nongnu.org; Wed, 31 May 2023 11:28:35 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q4NkX-0008E3-8N
 for qemu-arm@nongnu.org; Wed, 31 May 2023 11:28:34 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-51456392cbbso2345871a12.0
 for <qemu-arm@nongnu.org>; Wed, 31 May 2023 08:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685546910; x=1688138910;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KIcLj7EkGs6KAt2JC7AbOLpJYtKq2JKggaI9q8lYma0=;
 b=UQ4whnL0GJOwEeRAZjx3s+aXdHN+P8YVmeccEZ0RiISHAQpq9jSKrgae3MOjyg3Vuh
 VfxLP6IvGqkypNPxsOwEml5rLpIx8Wlxv5+TkiA/dy6Uf9EFUStPyZemWUsMdgWNOhLJ
 iaxIUwCDzzXcvo2Sb5cTx4llA1OCwGJSnc3d5fxhWYh7SimE1veGvUizU+dLHkyl0FRP
 bV2T6Q3YBdJKi+jWPxJYNFqvnY/dVk45RgujohBcwHw2IkY0TSPTBfh8so6M1ZnXDqXa
 2Xov1++xwfqgx3U3f0FhT2neBREfCKeGYlNzb8rZfH1QaX/Lr4OTOKN/cBMuL+Q9ro9G
 /png==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685546910; x=1688138910;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KIcLj7EkGs6KAt2JC7AbOLpJYtKq2JKggaI9q8lYma0=;
 b=h9Uf+IG6eMj5i0qsRNwBZCc0EBolJVTCT5ptVAOmF/uvkEpa1ezIMCH5hWHc/2vv5Q
 h2zNjS2gVtDHihGgh+5kybvl1eb61d+3pODNmhsXx3wEwo7IQWIB5CuB8+hLqQfbRQFk
 enOffuIzX/Ny3VIkblLL8mmBYY/DYma2CkN/lT0gLxg8Ndf3f1IuTFdWgfXexFcoU4hs
 wt0Cc42jdn0d4gCtLWLCgWKHSC9WaFgJKANinfUc2MxKxI2oBTlSMGLci7NJYsPKVaoL
 RLcMQLuAgTp/lWMbhNRboudo+xyMXXdzF8v8gmLbrKmdJbhiY+6OO5/cUQzGjwMQrQyb
 jWqw==
X-Gm-Message-State: AC+VfDxhC06T0/Q4iiBgWEcbUPxALZ9+xZ5hGjk6SSksfiOj73w67739
 90BLFyMUEN+3Ii1e6Gr10CPT7zeMRKGfCZqcWkrVlenXG4+Ni5Vb
X-Received: by 2002:a05:6402:5107:b0:514:9311:e83a with SMTP id
 m7-20020a056402510700b005149311e83amr6533557edd.8.1685546909775; Wed, 31 May
 2023 08:28:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230531070229.334124-1-wangyuquan1236@phytium.com.cn>
 <20230531070229.334124-2-wangyuquan1236@phytium.com.cn>
 <lfcmvvqjp64wngrdk33bvkb3k7op53l24lcoslah2evsyh3esc@at7jnsnrto7h>
In-Reply-To: <lfcmvvqjp64wngrdk33bvkb3k7op53l24lcoslah2evsyh3esc@at7jnsnrto7h>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 31 May 2023 16:27:59 +0100
Message-ID: <CAFEAcA8h9-YWUYsvuERttmsEK3xi+K+xasFdoWmnFm26S6npNw@mail.gmail.com>
Subject: Re: [PATCH 1/1] hw/arm/sbsa-ref: use XHCI to replace EHCI
To: Graeme Gregory <graeme@xora.org.uk>
Cc: wangyuquan1236@phytium.com.cn, quic_llindhol@quicinc.com, 
 chenbaozi@phytium.com.cn, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: vVXuTGB05BpP

On Wed, 31 May 2023 at 15:58, Graeme Gregory <graeme@xora.org.uk> wrote:
>
> On Wed, May 31, 2023 at 03:02:29PM +0800, wangyuquan1236@phytium.com.cn wrote:
> > From: Yuquan Wang <wangyuquan1236@phytium.com.cn>
> >
> > The current sbsa-ref cannot use EHCI controller which is only
> > able to do 32-bit DMA, since sbsa-ref doesn't have RAM above 4GB.
> > Hence, this uses XHCI to provide a usb controller with 64-bit
> > DMA capablity instead of EHCI.
> >
>
> Should this be below 4G?

It would be pretty disruptive to try to rearrange the memory
map to put RAM below 4GB at this point, though in theory it's
possible I guess. (I have a vague recollection that there was
some reason the RAM was all put above 4GB, but can't find
anything about that in my email archives. Perhaps Leif remembers?)

> Also has EHCI never worked, or has it worked in some modes and so this
> change should be versioned?

AIUI, EHCI has never worked and can never have worked, because
this board's RAM is all above 4G and the QEMU EHCI controller
implementation only allows DMA descriptors with 32-bit addresses.

Looking back at the archives, it seems we discussed XHCI vs
EHCI when the sbsa-ref board went in, and the conclusion was
that XHCI would be better. But there wasn't a sysbus XHCI device
at that point, so we ended up committing the sbsa-ref board
with EHCI and a plan to switch to XHCI when the sysbus-xhci
device was done, which we then forgot about:
https://mail.gnu.org/archive/html/qemu-arm/2018-11/msg00638.html

thanks
-- PMM
