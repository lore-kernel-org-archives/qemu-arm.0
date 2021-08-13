Received: by 2002:a19:f24a:0:0:0:0:0 with SMTP id d10csp306675lfk;
        Fri, 13 Aug 2021 09:44:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7yamUA4UI7EK1cakkfwQEG+ZgyQ3SUKmGHjdmkRbOnvlZJQQWIHWw3sSq2MB+cl27Rn5r
X-Received: by 2002:ac8:1493:: with SMTP id l19mr2716235qtj.43.1628873076052;
        Fri, 13 Aug 2021 09:44:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628873076; cv=none;
        d=google.com; s=arc-20160816;
        b=ainPadsZfP6LnrWOeYZmX9W2jQ9xr2Ca/8+eHNjT9xXUa4Janu/tLhUgiG9C2c0/Wd
         3n8w1qNRya6/ymCHrTSOIoqCPcos4KSxCQB/kVwGOk0/z5oYDKaAE3B390TwSq8YbZeY
         VumcT+9YUdKH57L0CsGxmIpadmqWs/nPaZkRjSEvfFTVJIQa+k9vX4yhAHD46w55v4NW
         NcNrpnyURq2Izb3umcWzFB6wRqaP1xojz2lUnta1IHdfBQmEhuPU4LupK2t5bhBUID7L
         VYq6W2ePV6AtfRE3paSZh4lDqVeHhE9v8YFJcsMIzU8qevlOL2aGP3ee5n/9DKAz0JIC
         OCcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y8BCSS8d0ct5KHtCFrgYthNO1VjuHDd84aooPMW1oYs=;
        b=oRGmO8G15i3dx/3Iu+ePPQ2kSGyqfIrsGVBCgppgXH3sC1gCuUt6X9RJz21W12aj6f
         ziy11IhHI+R71DjVX2Xz9ThdJYTqsKp/taEu9TvGSZZLlM11U9NymTiW8myADvoOlDvW
         HbFT8QIqhR0q4JtMm76VjoiDQGAwkGlfrCYTvtG60fXvgyCBFk06Zx+sX7l6IkhUSa+8
         Pul8pGpvRhLBJoUXJRAz3lLP8FPhjkdesVT9fsnfzvusDtz0SqbTdv+cS7YaTyec7uYh
         QjIwzDr6B++icQxigJhq0i+Kx3avo4oPcPwS8PrA/Y/T322QWOgYuKUYxlA1sgo27/8V
         /jtA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wGc1zh7M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n1si1230593qvp.45.2021.08.13.09.44.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Aug 2021 09:44:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wGc1zh7M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mEaIN-0006Xz-Fq
	for alex.bennee@linaro.org; Fri, 13 Aug 2021 12:44:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEaIG-0006Xq-Qs
 for qemu-arm@nongnu.org; Fri, 13 Aug 2021 12:44:28 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:38798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEaIF-00049u-7g
 for qemu-arm@nongnu.org; Fri, 13 Aug 2021 12:44:28 -0400
Received: by mail-ej1-x632.google.com with SMTP id z20so19388283ejf.5
 for <qemu-arm@nongnu.org>; Fri, 13 Aug 2021 09:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y8BCSS8d0ct5KHtCFrgYthNO1VjuHDd84aooPMW1oYs=;
 b=wGc1zh7MINa8RSGhV0OGtgnomqvowf8sLlm9rtsufaUT9bJ6sB3kr0+40hlADyrRz5
 NuxiCBAQzscV4SYbZ93XOId0YOEJJT53LwdrxrdhvhhjrJ4ByCCmu/cAhbdV0WN69Uak
 YB7SaARj6SH6F6uSHRuJ9AKeaWNtk6+31DnFSrXQY6bS6dbE6flxLxpEbijJ6OhXn1ZO
 syeqeGFlMxdHx1FANHsIZf0u4QFTswdFNYz+L4IU0o75k79yF+2lgU2uMT+Lqo41bn+u
 owj6Y+PQeGUnCSXsZa//uHAOhwTBj6Hzmag/y8jB9Pa+Wj4vTmTh+0OnpZ50N2czrIEf
 tHyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y8BCSS8d0ct5KHtCFrgYthNO1VjuHDd84aooPMW1oYs=;
 b=TQinuDyOb7ygYw7zilB+vytdsOhuQIg3aFOD6hjaZCcVPqyeNpzqH+1+X3SlPJxk9B
 2+4pK1N7dn7Br9YRjTFgDRpSN8TMdnulrHEKj54xVubyxE/l30ILu3FktQbayAEmAFJb
 pQ+g7C//FJrDIeA4pHdM9cZS3k6zgQ/6uDkJHniUmjZvg1xBCGhCBJT2of8rhqBW9Kkr
 cOeP2V1RzGwakmyxx2Z/yjA+xCEyT6fMoKH1k70VhpptTJ2ltTfs0Vok5Y2pJIa0GLJE
 3WwPqN9mfdZXDdJ2dg/UnQ/RkWvIuY8R2pX+Lh4j0r6MuEX297+DZllU0ZvQjoqPQLxY
 XwcA==
X-Gm-Message-State: AOAM530j/fQNwPfMcc5e0ufd6Y2DoaVcG2VVwFEVqN7EDCY+Xhpggh77
 ufuu3G0oGkZ5mNydIPxpbDUqtXJ3d/HGxXGxoYZvnA==
X-Received: by 2002:a17:906:3bc3:: with SMTP id
 v3mr3364585ejf.482.1628873065452; 
 Fri, 13 Aug 2021 09:44:25 -0700 (PDT)
MIME-Version: 1.0
References: <4C23C17B8E87E74E906A25A3254A03F4F216C4FC@SHASXM06.verisilicon.com>
In-Reply-To: <4C23C17B8E87E74E906A25A3254A03F4F216C4FC@SHASXM06.verisilicon.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Aug 2021 17:43:40 +0100
Message-ID: <CAFEAcA9JWA515a4uO=G9n5eTaNNuCJ7GKZnmdq3v6F9zusCnZQ@mail.gmail.com>
Subject: Re: [PATCH] hw/dma/pl330: Add memory region to replace default
 address_space_memory
To: "Wen, Jianxian" <Jianxian.Wen@verisilicon.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "Liu, Renwei" <Renwei.Liu@verisilicon.com>, "Li,
 Chunming" <Chunming.Li@verisilicon.com>,
 "i.mitsyanko@gmail.com" <i.mitsyanko@gmail.com>,
 "alistair@alistair23.me" <alistair@alistair23.me>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gFpGapLbYNRY

On Fri, 13 Aug 2021 at 07:44, Wen, Jianxian
<Jianxian.Wen@verisilicon.com> wrote:
>
> From f780b0ee2ee36c562ab814915fff0e7217b25e63 Mon Sep 17 00:00:00 2001
>
> From: Jianxian Wen <jianxian.wen@verisilicon.com>
>
> Date: Tue, 3 Aug 2021 09:44:35 +0800
>
> Subject: [PATCH] hw/dma/pl330: Add memory region to replace default
>
>  address_space_memory
>
>
>
> PL330 needs a memory region which can connect with SMMU translate IOMMU region to support SMMU.
>
>
>
> Signed-off-by: Jianxian Wen <jianxian.wen@verisilicon.com>

Hi; thanks for sending this patch. It mostly looks good to me.
I have a review comment (which you can find further down in this
email), and one note on the patch-sending mechanics:

Your mail client is sending these patch emails as multipart/alternative
with both a plain text and an HTML version. In general the list prefers
plain text only, but this is particularly important for patch emails because
the HTML can confuse automatic patch handling tools.

If you haven't read the SubmitAPatch guidelines you can find them here:
https://wiki.qemu.org/Contribute/SubmitAPatch

Using 'git send-email' is usually the most reliable way to send patches
if you're a regular submitter, but it can take a bit of setup to get
working. You might also be interested in the sourcehut web-based UI for
sending patch emails described in this subsection:
https://wiki.qemu.org/Contribute/SubmitAPatch#If_you_cannot_send_patch_emails

>
> ---
> @@ -1108,7 +1111,8 @@ static inline const PL330InsnDesc *pl330_fetch_insn(PL330Chan *ch)
>
>      uint8_t opcode;
>
>      int i;
>
>
>
> -    dma_memory_read(&address_space_memory, ch->pc, &opcode, 1);
>
> +    address_space_read(&ch->parent->mem_as, ch->pc,
>
> +                        MEMTXATTRS_UNSPECIFIED, &opcode, 1);

dma_memory_read() can already take an AddressSpace* -- you don't need
to change these calls to address_space_read(), just change the AS*
we pass them.

Otherwise the change looks OK to me.

thanks
-- PMM
