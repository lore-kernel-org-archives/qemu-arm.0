Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp3319025ejf;
        Tue, 9 Aug 2022 12:23:16 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7+jlkbtpabht8gxFtLG2bVKEU+k1kciiGfEM++wQf0xXMbmGW1iTnQvufPKb/zH+QF3Aqc
X-Received: by 2002:a05:6214:230a:b0:46e:3890:afcb with SMTP id gc10-20020a056214230a00b0046e3890afcbmr21287709qvb.59.1660072996775;
        Tue, 09 Aug 2022 12:23:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660072996; cv=none;
        d=google.com; s=arc-20160816;
        b=WDbzLgKHBfBlSVoeMEWNb+8H8gCJ0VSl5H8Fqh//FpqclOytZN5Iymtx5dYtRagpWd
         UU343PCNtHwFN84f7/4GJa+GMgmVDXfGblIKuXLgMh9gctNwwjgSdoQ7psjnRtOMfN6W
         tltytJs89WOYWC8EYkun762Uf6czvM0+HSIy22uYy4zhLx9cdJ/B/3E6ug64bGiHJXPv
         bpDOY9I4HvKPrPWFPnnQfeXJLrOLAxof/BIYs9qkQUWtXG9xD5yB1h20xIWsDuCAFFwx
         Wm/MN9jhRJ7LOFMsfmsDMhb0Qty/ZtQBtRbUqNr918q9xTHCzm39nYSp1OiF/9e7T8AJ
         Yi0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=b4KEeqYKSmz+xSWapb66v/w2P/GZlVo3Rtu3Jexl1aM=;
        b=LC+EFiIE9cBZFhvc3abd+m7mIIbnB8hi5IUUXeo4t4hbw6Nx+8oQtkkA0S4apkHBQ3
         owj2J2QkIjBdOTttJI+u5xrdmdRdkwlKV0NmYFidIX9trbvk8+Ha2d72VeVd3mN8QJuI
         lkwfgabL/kkW52sGm7pH58bFed7Q3COF5+BhiCvTTprZDjW5SRWoHsVK7MSIFk7ciAc4
         ZeCjlhOkazANCvvFt4x5PjE9lzKVuokDzOxK4f7jJob1jDotBUUrqBmrLzQYJ2BBUUYE
         nk2AGyvzBaGulJ6zKMX4kFG8PQgHztNxhoSlNGOKsg6iXlVid40G8jbIb438xPVkVSV7
         fwhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XPNjer1s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ay36-20020a05622a22a400b00304ec6d0ae3si44550qtb.254.2022.08.09.12.23.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Aug 2022 12:23:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XPNjer1s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oLUou-0008KC-AR
	for alex.bennee@linaro.org; Tue, 09 Aug 2022 15:23:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oLUof-0008GB-DT
 for qemu-arm@nongnu.org; Tue, 09 Aug 2022 15:23:01 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:40531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oLUod-0007II-RL
 for qemu-arm@nongnu.org; Tue, 09 Aug 2022 15:23:01 -0400
Received: by mail-yb1-xb35.google.com with SMTP id 123so19910415ybv.7
 for <qemu-arm@nongnu.org>; Tue, 09 Aug 2022 12:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=b4KEeqYKSmz+xSWapb66v/w2P/GZlVo3Rtu3Jexl1aM=;
 b=XPNjer1sUFMPxWKkDgDe/ymMC1EmQd2vVI3gqYIt7KA65Wea/IG3AtD9ZxGCKZ9smJ
 xToMsw0C8YX1+BMAys49eNVW9cBuQ7AsvumT3fkP7pMaMA//Toq3SsdtKHxnZPaGJQdz
 C2vCnDq9n+09g2G/RBT+DkhMFIoJOkJfEoqSB33nGhD9hkLeahP34edpu2n8XkP27rDl
 hQc/rnGhoDClixS6xzX3b5R485wNt2Az7t/ch+tZPvfSIl8eOAC87BfjihI8HMcRFuhc
 UTc+ggDvfDe1rqGe+qInf5a4QnuRCwmhqiYTNjS2iSVrrYtslI2FKBXkxWSrUHi3VuNs
 aP/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=b4KEeqYKSmz+xSWapb66v/w2P/GZlVo3Rtu3Jexl1aM=;
 b=ir9w3Oa6tiiAh4Tn/6q+3hB8VrPKmmEtEI7o1874JjzeC7jELgkKakwtfty3zTuHwh
 6Vqau+gzDFojUxbIT3zbRlwlYLe19Lb3gQeDkO2CMrYoAng4agenukVd+S/eRTcT1ezL
 I6R4r+8kZIUe8Y3yGY7k0F/rGhGF0m+6GdOiB54yECuE/8rKg+kbz8119NNQ9qiHeRuk
 SpNuPZVP9ZrH/lzoZxAAEVYeNhtajo5PyWPqYFBfVyn+Yd6tA7l6yEkInivVcH7AP7Z/
 3lVet/OvR/6aj2Xd9MAMLYTlWCphLNT2G4G+xcW7TmSjtTA5YfFUNEWow1VR+S6DNXVL
 7CUg==
X-Gm-Message-State: ACgBeo0qLhViN1AjE0ik7vkxQrT5uc7T2uQg9A2LFg5aDZ06KExwfWs5
 azngZbGRXLCHzl9dTJY8mj+wsSwB9ZQMcHDbuCifng==
X-Received: by 2002:a5b:7c6:0:b0:670:6ba6:d046 with SMTP id
 t6-20020a5b07c6000000b006706ba6d046mr21535510ybq.140.1660072978267; Tue, 09
 Aug 2022 12:22:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220727223905.624285-1-qemu@ben.fluff.org>
 <20220727223905.624285-6-qemu@ben.fluff.org>
 <CAFEAcA9DADLZaSrRmRLXxex6V1ewbi8zV+ey9NLv0JNPJOc9hw@mail.gmail.com>
 <20220809184838.en4x5kcxiatclmfy@hetzy.fluff.org>
In-Reply-To: <20220809184838.en4x5kcxiatclmfy@hetzy.fluff.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Aug 2022 20:22:17 +0100
Message-ID: <CAFEAcA_-4U7NiXi94NeAQ2K1LZ3QEjEhufO==uU0=Mi5GKbOeA@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] hw/arm: change to use qemu_fdt_setprop_strings()
To: Ben Dooks <ben@fluff.org>
Cc: Ben Dooks <qemu@ben.fluff.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, 
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-arm@nongnu.org, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dWTKg0f/Qv8F

On Tue, 9 Aug 2022 at 19:48, Ben Dooks <ben@fluff.org> wrote:
>
> On Mon, Aug 01, 2022 at 12:37:33PM +0100, Peter Maydell wrote:
> > On Wed, 27 Jul 2022 at 23:44, Ben Dooks <qemu@ben.fluff.org> wrote:
> > > @@ -285,8 +280,6 @@ static void fdt_add_gem_nodes(VersalVirt *s)
> > >
> > >  static void fdt_add_zdma_nodes(VersalVirt *s)
> > >  {
> > > -    const char clocknames[] = "clk_main\0clk_apb";
> > > -    const char compat[] = "xlnx,zynqmp-dma-1.0";
> >
> > This looks suspiciously like a pre-existing bug to me.
> > Alaistair, Edgar -- shouldn't this be a NUL-separated
> > 'compatible' string, rather than a comma-separated one?
>
> I think the compat[] is fine, I should have probably added I also fixed
> up to just call qemu_fdt_setprop_string()

I guess if it's definitely supposed to be one string instead of two that's OK.

-- PMM
