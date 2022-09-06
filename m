Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp2723273ejh;
        Mon, 5 Sep 2022 21:21:48 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4Baz40ixMS65WIGr7uZIP54WxOudnOm9AU8xI1Ogpu/1mpeYKL6XxT+DikbGt4z50hLmPu
X-Received: by 2002:a05:6214:23c6:b0:491:99e3:80ce with SMTP id hr6-20020a05621423c600b0049199e380cemr41578418qvb.111.1662438108730;
        Mon, 05 Sep 2022 21:21:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1662438108; cv=none;
        d=google.com; s=arc-20160816;
        b=yGU/MNGnqP/DrwYn6236scHXdZvhBLgmqMNlzorSHmiEI95OcGfrr2/Ei+62aPoO3P
         Amy/1KIsbBABWgBV7rCVFC8VAi5hizxXuOpEwlO4xZO43GAav+D/vHEssS/WZsl2OOFC
         drdl+Yf58PP3piOxHil4brIVlSxzSirbD3+3WyhC+D2Qg51BNFPt85l/slEASCWS5w5w
         1CV5U/4n68xrtucWETP9qybdHnN+n+uTEjLDellMYRnm4Wjb1lsWHPZ0RDv0gGALuW0P
         ku5sLWAShuWm0LQoPN4zw0opcoBsFH8zsXRktrTRUTMD5e2Yx+lRCWNTbxWvrxm/2D4F
         9zJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=i7u3LfUeWs///DsuQsLDAMlfLOMAWy7Qt4dlAu+r3/8=;
        b=xfGOvrTWaiPY28zokvyGqlv9aaGLWLvwQXuLG7G9GOR0DvEP6XDRS8sxNixY/5jaAF
         1aIeiuJ3cMXC3PVZGeach8C3lm89ZAKSHzOci0zI0cBSXoS5g+/VnUo+77qqeoCFTsyq
         prgeCHCyS/QpVYCmZ8atv592Dsa2sfy2Fv9IFGgR8JKq+JguZzn1RivgbcUjWkP3XCiN
         4WSEtcYyq7Rlshe0dq4mqSrMma+K9APxp1bfhF4tO/0NQ38RZV04tEyKKkTqMTSqpz2v
         NnPaV9w1G9dDD2HVAld4dU2pVJSzH1kL1kV1mCgRFwTMS61e9WNOyHUlEEWbdgLuTkQY
         /CfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=jzpdaL1b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b16-20020ac86bd0000000b0034451c909a1si5454032qtt.538.2022.09.05.21.21.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Sep 2022 21:21:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=jzpdaL1b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oVQ5s-0005T8-8j
	for alex.bennee@linaro.org; Tue, 06 Sep 2022 00:21:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1oVQ5H-0005QZ-Qp
 for qemu-arm@nongnu.org; Tue, 06 Sep 2022 00:21:11 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:35420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1oVQ53-0006NW-Hb
 for qemu-arm@nongnu.org; Tue, 06 Sep 2022 00:21:11 -0400
Received: by mail-pf1-x434.google.com with SMTP id 123so767709pfy.2
 for <qemu-arm@nongnu.org>; Mon, 05 Sep 2022 21:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=i7u3LfUeWs///DsuQsLDAMlfLOMAWy7Qt4dlAu+r3/8=;
 b=jzpdaL1bAbCYSuC/oedme8SJPJX19BTBqcqdGB82OKD3VIyRnb/ijJH8ClxadHFzeF
 mlg1s/0EsQMKRKU2NFdjZrj1xhb5MVFyyWpiPE5jqjC0/YB6/Yn9JnkeIkz1g8tNsS1Q
 9kf15x/2CxwPhW9Zm7LwBE0ttHde8B1RtXIJtUTRZg5lWNSHarsjdiyqpZ6pZjPzE3ED
 SG9tJ+fcoRovMoyCaf2X4bYABJG3oYkGfkcMqAnaPyrFJ3q3oDVD3MfGuMeL8o4AThTB
 yy9PhZlS5MGwT2X1+tSu1481WyfsoYc9GDXySOaKgnQRgV73CvBXa1XeTjq4Tl+6aL6m
 f5TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=i7u3LfUeWs///DsuQsLDAMlfLOMAWy7Qt4dlAu+r3/8=;
 b=Q6sQ/Kicepb1rfVfg7o7j4/qi7AdwZ99iOixYEVJP99UfH4u1ggVpbmkyRZVVtpvME
 a+73dximnVbGXQAExfsdX0VTObc1/4ItM9eShg7qaiaYUhpCWyroJ6MUhG5xHaj6Q9e2
 dFmur1x7L7+3hxSC5o6UxG5xQrKZY6EN6TSRoHB77IUVoqMhU9JVjmHSz9S6VXj/495f
 hdFEgZj2Y7VpvHHIJwYaFioebYb3ly3RBWjrQ9qkoICmV7F2Q0rsbOnUpmNLN5ysdoqU
 yNqS2daszLV3uXJu/le1JMZcFmMeEaE0iLOcAbYKpK5X0V1d1QzgkMUoeULlSuHyudfN
 hjug==
X-Gm-Message-State: ACgBeo3VLza62vm6Qm/7KtFlGOJd3Xf6CQDG8TD/MjWknMmFHiFffiBk
 JBdv+TF5dEMal0LYvOH1jEJoRg==
X-Received: by 2002:a05:6a00:1826:b0:537:b261:3e4d with SMTP id
 y38-20020a056a00182600b00537b2613e4dmr54278086pfa.65.1662438055909; 
 Mon, 05 Sep 2022 21:20:55 -0700 (PDT)
Received: from sunil-laptop ([49.206.11.92]) by smtp.gmail.com with ESMTPSA id
 o125-20020a62cd83000000b005371c5859d6sm8749652pfg.60.2022.09.05.21.20.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 21:20:55 -0700 (PDT)
Date: Tue, 6 Sep 2022 09:50:47 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Song Gao <gaosong@loongson.cn>, Gerd Hoffmann <kraxel@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH V2 1/3] hw/arm,loongarch: Move load_image_to_fw_cfg() to
 common location
Message-ID: <20220906042047.GB194675@sunil-laptop>
References: <20220905182238.374545-1-sunilvl@ventanamicro.com>
 <20220905182238.374545-2-sunilvl@ventanamicro.com>
 <CAFEAcA8QKs7foPWyf_OgEQog=zhfPNnz5dyevDXjPSXrVkh9sw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8QKs7foPWyf_OgEQog=zhfPNnz5dyevDXjPSXrVkh9sw@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X+CEr6m/SOBB

On Mon, Sep 05, 2022 at 10:20:40PM +0100, Peter Maydell wrote:
> On Mon, 5 Sept 2022 at 19:23, Sunil V L <sunilvl@ventanamicro.com> wrote:
> >
> > load_image_to_fw_cfg() is duplicated by both arm and loongarch. The same
> > function will be required by riscv too. So, it's time to refactor and
> > move this function to a common path.
> >
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > ---
> >  hw/arm/boot.c             | 49 ---------------------------------------
> >  hw/loongarch/virt.c       | 33 --------------------------
> >  hw/nvram/fw_cfg.c         | 49 +++++++++++++++++++++++++++++++++++++++
> >  include/hw/nvram/fw_cfg.h |  3 +++
> >  4 files changed, 52 insertions(+), 82 deletions(-)
> 
> 
> > diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
> > index d605f3f45a..3f68dae5d2 100644
> > --- a/hw/nvram/fw_cfg.c
> > +++ b/hw/nvram/fw_cfg.c
> > @@ -41,6 +41,7 @@
> >  #include "qapi/error.h"
> >  #include "hw/acpi/aml-build.h"
> >  #include "hw/pci/pci_bus.h"
> > +#include "hw/loader.h"
> >
> >  #define FW_CFG_FILE_SLOTS_DFLT 0x20
> >
> > @@ -1221,6 +1222,54 @@ FWCfgState *fw_cfg_find(void)
> >      return FW_CFG(object_resolve_path_type("", TYPE_FW_CFG, NULL));
> >  }
> >
> > +/**
> > + * load_image_to_fw_cfg() - Load an image file into an fw_cfg entry identified
> > + *                          by key.
> 
> For functions declared in public header files, put the doc comment
> in the .h file, not the .c file, please.

Thanks! Peter. Will send V3 with this change.

Thanks
Sunil
> 
> thanks
> -- PMM
