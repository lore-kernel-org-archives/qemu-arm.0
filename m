Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp378137ejb;
        Thu, 5 Jan 2023 07:12:45 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsh4UsnwzqEU4AEKsXCq4c+kmYKE62dJvSLwkzv3E0LbgMTlxeg+wj0EpJmr/5L2D5vu9Es
X-Received: by 2002:a05:7500:4496:b0:ef:f110:982b with SMTP id gb22-20020a057500449600b000eff110982bmr708342gab.24.1672931565550;
        Thu, 05 Jan 2023 07:12:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672931565; cv=none;
        d=google.com; s=arc-20160816;
        b=fVkrCr2bYY9a8NM7if5H1iis4Oq66/1X4NIDhTNa2sovarMKMqaRf+idS63QgoltUP
         788yD+iexrW7/axoc5Y+T+tRv15OAMBiXfJkAQ3zXEB0uf+C5cIlND3lbNJRagTJ8cKN
         3zTIS5/yEOLhUoRylYltK5ud3tIeSKDzrHM9pOOaIBBbLviz3nq2/BBWi6DS/LiY0vrg
         5CbgIwfrBmqpL7Hv4xZv1NA6acRVW6c4Z48OuWU02OEBdli3C9bhi0OakPVzz+oTr2Os
         tMJ/5CcDt5u1ncPPHLzDVMxQ/wlq4ADjInbDo4FM9kRVb5jrzs6erqQ9/qrpT4ZrYCbm
         HW8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=bkaE0LEBcl2+UKhpdPTxir9P+Zq8HpLovlsuyNwQyCg=;
        b=xQ5ZmXwHr378XB94FwJkynMbjffclz+pAecRo8Gq4kC1expPmAa4IlB942QirnNHvq
         mOSqY7Q2Z3hf9WtclqCcc1bAGn+Eyw4PrTFoeG+UjNscl8fTlkbkhAQr1a/yF7xl2WZB
         r1N8g/qSTag5cpVq2Z/9qsM65MSQyPznQoyey32+MogZMVJaVrt8OceIPp9c6Y0GJzp4
         B3xq5YN9fY4BIKq2iYCm93kwWTFXa3HL1j3SWmbr5o3lDfW2cJHHtdg+jU8JSGjupZe1
         18dxVDNvsrDWfguzBNPBwbVtlKIik24iciaS1e6JBnn2DYb1prJNqrIbkYAYHX+RfJEs
         zF/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fn+yVd3R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g5-20020a05620a13c500b006fc9f8621f6si17460453qkl.738.2023.01.05.07.12.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Jan 2023 07:12:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fn+yVd3R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pDRuc-0001u2-79; Thu, 05 Jan 2023 10:12:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDRua-0001tb-Ts
 for qemu-arm@nongnu.org; Thu, 05 Jan 2023 10:12:08 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDRuZ-0004CV-1e
 for qemu-arm@nongnu.org; Thu, 05 Jan 2023 10:12:08 -0500
Received: by mail-pg1-x52f.google.com with SMTP id 36so24678897pgp.10
 for <qemu-arm@nongnu.org>; Thu, 05 Jan 2023 07:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bkaE0LEBcl2+UKhpdPTxir9P+Zq8HpLovlsuyNwQyCg=;
 b=fn+yVd3RMDMt/itv1sjgrRAoc+om7ou6AiMSZRD4AsgcJMJd3PwcV0ggqEdeW69OKG
 +tUS71fznpWnsv1pcGDMx0PChP4himp3j27YIQSoiYRCdE/DDfcHOaMl6f2M6F/SuP2F
 wcPTWugB68FuLL29TQoXP4PAInqg74svGoIVpKWLvevdv61nrGZv+h4wztFlKvtFnU5I
 8Fbl4NG1N7937FaSmebImpp/hbAuTjUFTyx/y4VQ1oMiQQZFsMX3sSQd5SWciocJMOna
 hI1e0XfaDPzD1/d13taZIoobmgigfZpzSLg7qai8XMhazz2o+25ird7hUYEfMrIBG7Hd
 JY8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bkaE0LEBcl2+UKhpdPTxir9P+Zq8HpLovlsuyNwQyCg=;
 b=GoYmO5hBw6/iYHX9AOZo3sEcXQBjKJZXFEsvqPG+nWF/QNYNHrIZPbGu4wPCIbCRob
 lKewnBBhPtZafKVcAMsJqSI9a1+ytAmqwb8vvsg/iP1SHmbDAqWY5UQLyVN+aR/l9NYq
 XP+WyJrXZhK2PfKUZ32UaxSqOqqQ+z2KKlDNQ1b9b6JsWNqrtCVjd6mnKEwePC6WBwqu
 AbRRtegzl5SHD0/2HLQHHJMSn/CkzsIw73+YErkLUTZRmpdmNdbVLwt423y3f+98LUk4
 jIh6GV7FGQdNNYlk3JjEzELWpaeGVJZ15rnf0Pxt2OJ5UB70Or0IjKlu85iZ43NFQMPd
 5NWQ==
X-Gm-Message-State: AFqh2kpl/822VHOAbPzq5d+0AtR1SZmT1FO2ZwNz2ecIAFsz/hGVwN/1
 LCNsi0ZyAdRHwhuHSUVHbgTeC+IcYWxanmgIk05ZVw==
X-Received: by 2002:a63:3d4:0:b0:492:50dc:da4d with SMTP id
 203-20020a6303d4000000b0049250dcda4dmr2345250pgd.192.1672931524559; Thu, 05
 Jan 2023 07:12:04 -0800 (PST)
MIME-Version: 1.0
References: <cover.1671548388.git.jcd@tribudubois.net>
In-Reply-To: <cover.1671548388.git.jcd@tribudubois.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Jan 2023 15:11:53 +0000
Message-ID: <CAFEAcA-ogofwCvR1fAJ5+PiGv4Z2+FGqxhcw54AH19CaBdv-dA@mail.gmail.com>
Subject: Re: [PATCH] Fix i.MX GPT timers for i.MX6UL and i.MX7 processors
To: Jean-Christophe Dubois <jcd@tribudubois.net>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: MenOYieW5e0n

On Tue, 20 Dec 2022 at 18:18, Jean-Christophe Dubois
<jcd@tribudubois.net> wrote:
>
> This patch series allow GPT timers to be used on Qemu emulated i.MX7.
>
> In particular it allows GPT timer to raise interrupts in i.MX7 processor
> and supports some of the fixed frequency clocks.
>
> Note: CCM generated clock sources will be added with a later patch.
>
> This also brings some fixes to the i.MX6UL GPT timer as its clock sources
> differ slightly from the i.MX7 version.
>
> Tested by running =C2=B5COS application on i.MX7D emulated processor. =C2=
=B5COS
> is using the GPT timer as its tick source.
>
> Jean-Christophe Dubois (3):
>   i.MX7D: Connect GPT timers to IRQ
>   i.MX7D: Compute clock frequency for the fixed frequency clocks.
>   i.MX6UL: Add a specific GPT timer instance for the i.MX6UL
>
>  hw/arm/fsl-imx6ul.c        |  2 +-
>  hw/arm/fsl-imx7.c          | 10 ++++++++
>  hw/misc/imx6ul_ccm.c       |  6 -----
>  hw/misc/imx7_ccm.c         | 49 +++++++++++++++++++++++++++++++-------
>  hw/timer/imx_gpt.c         | 25 +++++++++++++++++++
>  include/hw/arm/fsl-imx7.h  |  5 ++++
>  include/hw/timer/imx_gpt.h |  1 +
>  7 files changed, 82 insertions(+), 16 deletions(-)

Thanks, I've applied this series to target-arm.next.

Something slightly odd seems to have happened to the threading
of this series -- on the archive you can see that the patchmails
are correctly followups to the cover letter:
https://lore.kernel.org/qemu-devel/cover.1671548388.git.jcd@tribudubois.net=
/
but patchew and patches don't identify the whole thing as a single
series and they show up as separate patches:
https://patchew.org/search?q=3Dproject%3AQEMU+from%3Ajean-christophe

This might be because the subject [PATCH] tags don't have the usual
"0/3" for the cover letter and "1/3" "2/3" "3/3" for each patch.
git format-patch ought to be able to do this automatically.

thanks
-- PMM
