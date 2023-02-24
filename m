Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1843075ejc;
        Fri, 24 Feb 2023 06:52:44 -0800 (PST)
X-Google-Smtp-Source: AK7set/BwWiF3GfYPWU8OjiKcBKnyAQlMFO3jzL+2PaKM0uQUGLHt+n04kZYf1XDCcvlvgo77H/o
X-Received: by 2002:ad4:5bae:0:b0:56e:957f:dd5f with SMTP id 14-20020ad45bae000000b0056e957fdd5fmr24926524qvq.50.1677250364683;
        Fri, 24 Feb 2023 06:52:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677250364; cv=none;
        d=google.com; s=arc-20160816;
        b=rtzi3Y3IiVmJxVjF4sytVETmxkFTcbc2OAJeFHzsIfTZv48+5Zl5iMJbd5+oH2Rxs+
         gKaAHs3212KziYhFPI3P4L2gfpx/PrCmLO8GtCNT/yBrVWDYzkGSFLvqtb9OpFMulyh9
         V6b/t/O7b12wziPqJcQbZOJGQxQkMUos25v9157TjU3kDY9lCplT6Hm/7gfOo/BJV9W3
         RAg/M8qRtIkgQKYIDNdTum43NuwmKmSwl2g5nVClDmeXtUMEYZXftWD8u9SCR9URQnMq
         Ve/uND4F5b8LsDtspS0FAuF7NsyUiORZ/1EmTl7GP0n25oQ2LDsDL1UVhVE4G6RM2CFv
         bUSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=13AMWkYVkTsfPmSEiA29LWtZf+Sd+WLTZopN8iRQg4M=;
        b=ySxjGovNrK72Kjp7+MNuV9yl1TGEqOO0zFxAFQC3hRd+9o/hyrZtNUz8P9pncdsjIR
         23gUTeWwWvZhaHwYzq8YDqy9XL2BwI+RIU/mDfga5FnxSQe4w92SqB7IIWujTEcaPZjL
         nBBiLLNlB014vkW+Psx7mor6g0a9r/dnk/xA0PkEYw5NbL5taDSmvZyyTZTKShe1JxSM
         8wGxS/+kSmYtF/9oe5hbT2hCnZM0JmbS35jPrHW1JRgAUSXBcvjo89tROxQGlGuOKTmO
         q18FMUbeOfQig1OYJGOe4/VmUcOx/wQeC2bi5YMtWqocbpqGPs22rHApD/jWVYVNgWXB
         cxuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yzrw3FDf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s14-20020a05620a29ce00b006fbdb69389asi6406835qkp.121.2023.02.24.06.52.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Feb 2023 06:52:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yzrw3FDf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVZQq-0003nT-Ie; Fri, 24 Feb 2023 09:52:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVZQC-0003Ui-CB
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 09:51:40 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVZQ4-0004b5-FZ
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 09:51:33 -0500
Received: by mail-pg1-x52a.google.com with SMTP id p6so7703197pga.0
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 06:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=13AMWkYVkTsfPmSEiA29LWtZf+Sd+WLTZopN8iRQg4M=;
 b=Yzrw3FDf+h5wWig1ZGcrkkP1mDs9mAH5M/0b7932R1swBPLrWDpYa0cNQHB9uGC58A
 ZuLFkiOVMTGnKiNkqlRgZN73/AN24KU1hvZyCEQaryQ//Bwb8WngEwjgSxCxXEMq3Km1
 jJ315wa4i/+5rg2Js5RnX569KhbvJsOamwstkV7mBDaeFvkYMe7H56dX4XmCc+ldPeY2
 gC3rm1WP51a/LIslA8FBJhAszQp2MW+XEItK9iuvIEcmYBeNpRaIUm/zwFkkIb8IsbP5
 gxnwzED4pykoOYlRBrC3AShvxcqq7GUpC1NQMnDzRykZFx2FuiP0c0OmeH7y2QXd/o+m
 bCdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=13AMWkYVkTsfPmSEiA29LWtZf+Sd+WLTZopN8iRQg4M=;
 b=gg2D4cRUqTn9U8exLA/T/LQnCI8I1W6hFCHcjPm/sa/5QiJyy61l05ntg0jsceLP4F
 bko/eEmj7vcWGsjbHypFNLiHM+17FXMfQL3K3BnfJGx3KMuyTeDQQehHAvSMj2UJ+RtL
 nv+TLZkhlh10dctXGPzNPzLGy7LNQsGiYyf3Oc59mDYj5JAK70Oh5sk+bgK6qDLHohWq
 uR/jcCY0FN+NDFhaFY2mnAqv48zSFXi5V/o0Ibpp3z7Gycx+CDVNQqtPiCFah27mDCAf
 AJvhd9HczjXGD/RJ+EHv0fp07OhL0x/nIb+wX/mDH+LQhuq0p5LIEqeeoYa4/dm9l+tZ
 zdWQ==
X-Gm-Message-State: AO0yUKUolrpqlKQ1q+tgQpXKUM/YGC1fGmgD0/frF43g4/ZEfdNT+h7u
 KGZRFAGM7FGKy9n281xSi1SAu9PpfcwYBcXRc6mxdg==
X-Received: by 2002:a63:8c55:0:b0:502:f5c8:a00c with SMTP id
 q21-20020a638c55000000b00502f5c8a00cmr1672851pgn.9.1677250290745; Fri, 24 Feb
 2023 06:51:30 -0800 (PST)
MIME-Version: 1.0
References: <20230222023336.915045-1-richard.henderson@linaro.org>
 <20230222023336.915045-17-richard.henderson@linaro.org>
In-Reply-To: <20230222023336.915045-17-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Feb 2023 14:51:19 +0000
Message-ID: <CAFEAcA-E5kEbYL06xSuT2j1daD=kmZu4OBev+5uXBs0mxhOLOw@mail.gmail.com>
Subject: Re: [PATCH v3 16/25] target/arm: Handle Block and Page bits for
 security space
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: BIIV9z+Ec1mq

On Wed, 22 Feb 2023 at 02:34, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> With Realm security state, bit 55 of a block or page descriptor during
> the stage2 walk becomes the NS bit; during the stage1 walk the bit 5
> NS bit is RES0.  With Root security state, bit 11 of the block or page
> descriptor during the stage1 walk becomes the NSE bit.
>
> Rather than collecting an NS bit and applying it later, compute the
> output pa space from the input pa space and unconditionally assign.
> This means that we no longer need to adjust the output space earlier
> for the NSTable bit.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
