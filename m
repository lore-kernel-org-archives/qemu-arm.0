Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp5811876lfb;
        Mon, 30 Nov 2020 18:49:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx4RN9dG1mGf1JylqL9yafODJKXKF5JP3tBDcp/0Ui72jx8xR3/HPSNk4J+vfcAhyyuSX4B
X-Received: by 2002:a25:fc1c:: with SMTP id v28mr763348ybd.356.1606790997658;
        Mon, 30 Nov 2020 18:49:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606790997; cv=none;
        d=google.com; s=arc-20160816;
        b=DGdkF2koT7/olcllvoQx2VsSZylIe3HbchxEOAiLPiJvSc0iOJ2gEcHRvNN3q5MGvT
         Gi6LEo96ish5VNi6N8u6xXGJy+7C0tcc2C+2ahs8GpOji4bsRcrxNyw7KBlUUhnmq3ZE
         +zKCnI7oqs0igKmsDl7sPwVzauFIxTHACPrbGaDhClPHW27PiSVjnfOlOxm1NYjphP4i
         8y7RmOyGJcQQRQIyfSNRIlNLYLQzPRtMfgobeZ09LrMgInVc/0rSzAn1hPr+NjrkeRgW
         mTAlgBzj9H5XINI2Xt21nslG2qRm5yGNDUR7Ci/+ZUwlRHBKe6DX3RTYnFnQxtoYUKnM
         cacw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=QIUvT1d60drQnFIouLCSM6+ZBW8uiAP0YjGyhPeDG6w=;
        b=RYNF8olSpoholwVLLRH1KZkcDruS4kAibCNAm65NTH2SdDgLpu5hBxlEoZfDTAg61I
         Yu1kjNFe6/gXtV96FsCv1ckjoyVhIRq65TX7Zuukicde15Kqbd3J+yFi2ShmWu6Nk9DB
         BA9ZwWy+0NdmdwnrkkY5EHdGhj1epvUQ0VVBmROUfRUH8x2XJ3jDBe/o5tUUVsEVlGBc
         ctQZdgKK+ArLTHN91hdC3yIdbBweCnSP66pKZUd8yMeKOukjQFlo8+dT0oHTxhwyNYQm
         5z9paTB8EPzMjG4McC0ej4UErup+hJAPiFmhHdlnY8/uD0DcAiKCbzeFpq2KM7V0/aR1
         9GwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=HtCyQl2w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y73si437559ybe.327.2020.11.30.18.49.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Nov 2020 18:49:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=HtCyQl2w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:47380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kjvjp-0002oZ-3J
	for alex.bennee@linaro.org; Mon, 30 Nov 2020 21:49:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lfy@google.com>) id 1kjvjh-0002nv-PH
 for qemu-arm@nongnu.org; Mon, 30 Nov 2020 21:49:49 -0500
Received: from mail-yb1-xb41.google.com ([2607:f8b0:4864:20::b41]:41675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lfy@google.com>) id 1kjvjg-0005U4-3A
 for qemu-arm@nongnu.org; Mon, 30 Nov 2020 21:49:49 -0500
Received: by mail-yb1-xb41.google.com with SMTP id x17so457191ybr.8
 for <qemu-arm@nongnu.org>; Mon, 30 Nov 2020 18:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QIUvT1d60drQnFIouLCSM6+ZBW8uiAP0YjGyhPeDG6w=;
 b=HtCyQl2wK4hCDSozD6s82xmaSnlK5IK2l4bqiEy8B9jKaMGW+dRpR0BKC99LWgKFXO
 NbK9k8Bd3+7Gf3kGfC0X8hgY/LDGR/ah8ig4gvznBHp1TxDmCMcDYU03lmXdKQovGyHg
 WERo253QxUgOxW9AL375BRQ4bM+MksptmPm5w8YhCaiyDZ/P8rDWrD9E35Ge3z+r6l+m
 RVC1KjwUGeX7FyQDd/WadhYZECHOyaLJ11xT+y+70V9pSHq7HXSDVMiH7N7QpOfYGRZ0
 jUA1fk/IrqWxvf1eHX8UKXLHOU5XHsVSt8N0okr18xkayqsZYDco6V2EvTEbS+oJnALh
 6WZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QIUvT1d60drQnFIouLCSM6+ZBW8uiAP0YjGyhPeDG6w=;
 b=KBgDV9bOzeMXN4gdB/bK+8Fa5FBsUTY6pVG5Lp9pELnt/g7WKOev2DuOUQGxtLgPa7
 khoKfy9V2MexIBfmDPD48uola8uCWh8IKP8faEHUGn/BVn+nP0+9UmR9JKrXVTrsXFXn
 uqFMLTUD7fqopgnix7XWAEXQe+M82pEtGMMSHIxPgNjDlQZAILcAUul9onp/ws5o3O1D
 Pa/0PFS1EfqZiqVOKHntqoo1wxVZA8BnAtMGwRSTQcJc4XIGbEIunHrLQfmk4eKy7ygp
 sbFUZJvnCep719K5yBg4trpgH5kPAdvYkOspIMTV4dqUrRqZwYSTg4nLqDSXogONsAE2
 VffQ==
X-Gm-Message-State: AOAM530c/jd0/WpsqwvMsUeu45Ek+yC8u0yJWVBNxWAu3FcyPLgF5K6y
 osfY4hRSzU2tS4gGuAoBQleLye0kmjKj/myjsDpWOg==
X-Received: by 2002:a25:59c3:: with SMTP id n186mr782386ybb.411.1606790986440; 
 Mon, 30 Nov 2020 18:49:46 -0800 (PST)
MIME-Version: 1.0
References: <20201126215017.41156-1-agraf@csgraf.de>
 <20201126215017.41156-3-agraf@csgraf.de>
 <20201127200054.GC56950@SPB-NB-133.local>
 <392c2465-157e-e15a-0a2c-2e3faa166d22@csgraf.de>
 <CAEkmjvUArgL+Mcvy6nUhfJrdX3OaF=U8UdWia7ZDo9GWk0VF=g@mail.gmail.com>
 <CAEkmjvVJ5zup4NR2+DStt_NvV2cV7+7dj2=fJ3DQBkth8pAfcw@mail.gmail.com>
 <cecd20d0-278b-0a4b-ba9c-0207504c99d7@csgraf.de>
 <CAEkmjvVOAYP6wJyVpAtZE3d=iNOOWGZeHptQ9xJDGcTi4qQ0hQ@mail.gmail.com>
 <CAFEAcA-GbGeS+95GB2YZGM_nifYOfggYPvMfG6ms4PmhFjHE5Q@mail.gmail.com>
In-Reply-To: <CAFEAcA-GbGeS+95GB2YZGM_nifYOfggYPvMfG6ms4PmhFjHE5Q@mail.gmail.com>
From: Frank Yang <lfy@google.com>
Date: Mon, 30 Nov 2020 18:49:34 -0800
Message-ID: <CAEkmjvU_4neaGd7naq-CaggLuUcQ8SvxgRrzLzAzqN407yjvkQ@mail.gmail.com>
Subject: Re: [PATCH 2/8] hvf: Move common code out
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Alexander Graf <agraf@csgraf.de>, Roman Bolshakov <r.bolshakov@yadro.com>, 
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 qemu-devel <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 qemu-arm <qemu-arm@nongnu.org>, 
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>, 
 Peter Collingbourne <pcc@google.com>
Content-Type: multipart/alternative; boundary="000000000000fa0e4805b55e2dcc"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b41;
 envelope-from=lfy@google.com; helo=mail-yb1-xb41.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IsEKESi71TMj

--000000000000fa0e4805b55e2dcc
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 30, 2020 at 2:10 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Mon, 30 Nov 2020 at 20:56, Frank Yang <lfy@google.com> wrote:
> > We'd actually like to contribute upstream too :) We do want to maintain
> > our own downstream though; Android Emulator codebase needs to work
> > solidly on macos and windows which has made keeping up with upstream
> difficult
>
> One of the main reasons why OSX and Windows support upstream is
> not so great is because very few people are helping to develop,
> test and support it upstream. The way to fix that IMHO is for more
> people who do care about those platforms to actively engage
> with us upstream to help in making those platforms move closer to
> being first class citizens. If you stay on a downstream fork
> forever then I don't think you'll ever see things improve.
>
> thanks
> -- PMM
>

That's a really good point. I'll definitely be more active about sending
comments upstream in the future :)

Frank

--000000000000fa0e4805b55e2dcc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 30, 2020 at 2:10 PM Peter=
 Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lina=
ro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Mon, 30 Nov 2020 at 20:56, Frank Yang &lt;<a href=3D"mailto:lfy@go=
ogle.com" target=3D"_blank">lfy@google.com</a>&gt; wrote:<br>
&gt; We&#39;d actually like to contribute upstream too :) We do want to mai=
ntain<br>
&gt; our own downstream though; Android Emulator codebase needs to work<br>
&gt; solidly on macos and windows which has made keeping up with upstream d=
ifficult<br>
<br>
One of the main reasons why OSX and Windows support upstream is<br>
not so great is because very few people are helping to develop,<br>
test and support it upstream. The way to fix that IMHO is for more<br>
people who do care about those platforms to actively engage<br>
with us upstream to help in making those platforms move closer to<br>
being first class citizens. If you stay on a downstream fork<br>
forever then I don&#39;t think you&#39;ll ever see things improve.<br>
<br>
thanks<br>
-- PMM<br></blockquote><div><br></div><div>That&#39;s a really good point. =
I&#39;ll definitely be more active about sending comments upstream in the f=
uture :)</div><div><br></div><div>Frank</div></div></div>

--000000000000fa0e4805b55e2dcc--
