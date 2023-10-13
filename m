Received: by 2002:a05:7022:2383:b0:6d:30c6:dd9e with SMTP id bz3csp1182946dlb;
        Fri, 13 Oct 2023 02:20:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPm9NvKQO9+FBY6qL1YdsR5r2BmWH306cyyKfabcSVB53JYBfjU3V7e0nbmm7KNHjLlWQi
X-Received: by 2002:ac8:5f13:0:b0:418:554:fa25 with SMTP id x19-20020ac85f13000000b004180554fa25mr32935200qta.47.1697188851483;
        Fri, 13 Oct 2023 02:20:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697188851; cv=none;
        d=google.com; s=arc-20160816;
        b=wjatMeh76zRx0NYD1KovPCh3TGWpWgCaqa7aRawnG+sE1HEgOePoGfpUXeyYORNgNW
         RW8zjTk+1DLAZasb9VuurgzBU/hQ0LYFwddv1LG3DUwzzE2ugMvclBVbo/XfqL0I4oCI
         p/aLCNrkpKfw0gbJeDniWyQW9mw1XtPA4B4KbimraNXkv9+DYtva2qiOeiNNuey43IL/
         RAl86iwbXC3t5h7/WWmlz1UoOQQKm7/zL5rdOP11pev25QAmwuDj2GQ86yuJaxz7r35T
         F2836MaqyOnEmxn9uQ54ZntxHBMi+F8y1xkam6/I5bCjgteK2JSDBL+zjZ53lbijLgqA
         8w3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=PzA/o1mqLZWhWgE5bPSaUnGXXWtkY7CixflE7pLoS/A=;
        fh=tvjXVlbyYwkOHdljk76KZgOiA5ex9+Qi0tdiyoysUSE=;
        b=kyWTylcVW75HUW2lFjiVIq40UjDsaY+MbrOsFRwx8LbPNKoqYJPdkHhyAJ42XYvMBB
         6Wp4wPRTR6hYfIlkvx5bcsvcnwfZAH/e22VKRVV+llWNmYNfZpjb52SgNjU49XzTi/KU
         ad+VlfIJnjNLclymg/EvRkhY8GnYnKsfQHZ/MM6rkjT2YZ2HTbF6Hrxqf2Mie0Nxtf2V
         Gsnh3EBKHGfUQY/s3vPzqwwqP3fDzrxWZp5AhshwZ422o8kNSGm4J6pKtridgQTy8vPO
         G0p04z1uN5lOelZ7jR+9BFGQy8pTz0D4nWmAqaoOs703+eIDnZBr5M+uFFLROnpbtG39
         qadQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RuHsGfC9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u18-20020a05622a14d200b004197f495da6si867633qtx.554.2023.10.13.02.20.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Oct 2023 02:20:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RuHsGfC9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qrELP-0004RX-GR; Fri, 13 Oct 2023 05:20:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrELN-0004R4-CT
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 05:20:29 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrELL-0006fc-Qh
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 05:20:29 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-53e3b8f906fso893281a12.2
 for <qemu-arm@nongnu.org>; Fri, 13 Oct 2023 02:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697188826; x=1697793626; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PzA/o1mqLZWhWgE5bPSaUnGXXWtkY7CixflE7pLoS/A=;
 b=RuHsGfC9brwO8xheEBmG8/UvNpM2WHYX8dGo6o2pfaubZdH1fVduhNaiA2HxM9fLT0
 5S8SYoQKAJe4Xbju5RDuF4ocI/pO93V3tzb0h17bqUeSN9yL0tST2f110QkLWzml28Ca
 RBfs2+wj+/Oa+g/HcYfyuSrpDS+AHJ9Y1/F1Zi5Agltquz5enhSXKs+7ZcG28BGXCMe7
 DiPHB3BYdlB1/tNTQXb5CQqk5W7qZ4ksWPff5rk/pR9R0aiDr1zXXFhlCyd0y3SuOd1O
 MvKZM3wM0LXwtgk4FMAzDtYfwQv+TiAbnoVY1YsrKESeBrPoMiTmMwju4oHHpiQ7+xga
 nl4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697188826; x=1697793626;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PzA/o1mqLZWhWgE5bPSaUnGXXWtkY7CixflE7pLoS/A=;
 b=bo0OYHLOnItj2utyBjTjnfB96KsdlrtlnbBu4t5fddE7RRWjhAck9tcSbc4lrORXRN
 0+eBW/vZUjNveppi7BWSldL5sGtmewVIibRJ4hTttcmPDh03i+MdUkOSsE11BhrmFe9u
 5AMCPJP4ltLf3x5wk3TnQqR4CflmxiEICstkUpN8f6wU4JvtfR4qzrhD9wA50fUNx85a
 BXfW5aWTj4xwzOOayNgsjztlUah60jHJjYB7NU5OnmBU16RomaTDfeJ9yUlNtS9LAk9N
 yGzug3l7qMdjKGZ999Bvwk8EY4Z7p7t5WjvbT8jpqgDipaOo/eCr0j8UiAnCiZIUPc9B
 ReuA==
X-Gm-Message-State: AOJu0YydH+45ZJjyMWNJxX6mJy3+ZO/2H6HEmt7+MNKhmmCAuzLZa8vr
 j41nurCnQI1kEDAZAhK5ed4v5OGaS0jLxOvNETtKBQ==
X-Received: by 2002:a17:906:cc2:b0:9ae:5db5:149 with SMTP id
 l2-20020a1709060cc200b009ae5db50149mr23290286ejh.35.1697188826248; Fri, 13
 Oct 2023 02:20:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1697186560.git.manos.pitsidianakis@linaro.org>
 <84a6d743b5ff71c323cee718412e2a67084b9237.1697186560.git.manos.pitsidianakis@linaro.org>
 <01971536-5a3d-45b0-99c2-b3583dbb9584@daynix.com>
In-Reply-To: <01971536-5a3d-45b0-99c2-b3583dbb9584@daynix.com>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Fri, 13 Oct 2023 12:20:10 +0300
Message-ID: <CAAjaMXYjgKapC4h4cQTQAuq=GVkUCKp0iYkrpiLFVGFkbrFcwg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 57/78] hw/net: add fallthrough pseudo-keyword
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Jason Wang <jasowang@redhat.com>, Pavel Pisa <pisa@cmp.felk.cvut.cz>, 
 Vikram Garhwal <fnu.vikram@xilinx.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>, 
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "open list:Xilinx Zynq" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ed1-x52c.google.com
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
X-TUID: EMeRogdxkmqn

On Fri, 13 Oct 2023 at 12:11, Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
> > diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c
> > index 4525fda383..42f19618b1 100644
> > --- a/hw/net/rtl8139.c
> > +++ b/hw/net/rtl8139.c
> > @@ -2447,8 +2447,10 @@ static uint32_t rtl8139_TxStatus_TxAddr_read(RTL8139State *s, uint32_t regs[],
> >       }
> >
> >       switch (size) {
> > -    case 1: /* fall through */
> > -    case 2: /* fall through */
> > +    case 1:
> > +        fallthrough;
> > +    case 2:
> > +        fallthrough;
> >       case 4:
>
> I don't think you need comments or pseudo-keywords here.

That's correct, it was a stylistic change. I can remove them in the
next version. Thank you!

Manos
