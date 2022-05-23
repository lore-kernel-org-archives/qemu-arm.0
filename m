Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp3380792lfh;
        Mon, 23 May 2022 03:17:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlKrMLLx5Zq9O/gmfKGZvrIApQt+bDEZRBAQqb/hto7WuehWU+BrlIziIZeJ9R/X7DPqC2
X-Received: by 2002:a05:622a:311:b0:2f3:ddb0:4ae6 with SMTP id q17-20020a05622a031100b002f3ddb04ae6mr15838099qtw.140.1653301061878;
        Mon, 23 May 2022 03:17:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653301061; cv=none;
        d=google.com; s=arc-20160816;
        b=DdoRBgWAKFhfbPmQscp0HQcuiPcGcD7eiPDKHJje3o+Z7vU7iB+DUI8h0Q+fbjlQhV
         fpS2WvLJQ7eW47LFKbpgQ5Syiv3i+2F8RW838nhECXmKen0kOwotSR/AiwuIVEL2ymTk
         biXblJ46ifdSyfvZEarKFXay4pFEXp54kr0RZ2us4iwG0EAv1+yrfPdQ0d2eHWoTQ9nN
         oUnZth7zeR2JLPs1w6YwvDq/4ZSwUG0hJRfQchwTy79ZPXKR09VcepgtsgIOCK3tbBMy
         PlTONglGBwzbXytr2TL62hkpXEg+60/3J+oEwkcav9qAL8Uak3LrV05w1Dtq/O2n0KCf
         A1ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=zSE26wja7l50rNNqIf73gJREIagQaFyzLkLesA6xxJo=;
        b=B0S8Wwens4pcwudjDc05yFqhiSj7FipV2MQx3J5Te77wTDHjuYLhsB98JyQ/7noyA4
         QmEXlCRIYyNO73r2HfL4WxHCQw6TXCIxlWdc7lxhvEcDeUiVJ+CPuNg+j22etweEk2BM
         PY9MvXmqttb+19Jz6kuEwsfhWLsKTlVA1UZMcXvkMfb6QKdwNE8rHuWTch3pwT1X0RUr
         ewEnLvfqL3k6OqZoq/WLWtSaaMFTy/X5UaDUimwpN+oji0s6i1zikKz3/8R2OCzQj7pt
         lhINiEke5SumMYM0XwqfTpKVAxjETHliJMsVezaRYGlz3rH/HDHqrRkG7BJBaRs6x+uw
         g6zw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ljrQYc22;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a5-20020ac85b85000000b002f3d41f22d3si2400774qta.396.2022.05.23.03.17.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 May 2022 03:17:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ljrQYc22;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nt589-00089p-CC
	for alex.bennee@linaro.org; Mon, 23 May 2022 06:17:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nt54j-0005zP-NS
 for qemu-devel@nongnu.org; Mon, 23 May 2022 06:14:11 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:43737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nt54h-0005ER-53
 for qemu-devel@nongnu.org; Mon, 23 May 2022 06:14:09 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id q135so24513177ybg.10
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 03:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zSE26wja7l50rNNqIf73gJREIagQaFyzLkLesA6xxJo=;
 b=ljrQYc22zbte2O/EYya8tOc/FBnvEZgePy8CqimkkLce/azdKp+9W8lR+nzuUOOR32
 +xh1Ojb+hHD0oJUYH8Qt+1Rd4r/odReIRuN8VVRMFH6XlgDIUmAn5btbJyJj1sNOFjwu
 +bBDpNCxMlnLvjxuElNUYvgrq9FknlCKid61z2LaXzh7dzW2L35tYfaMzw37RjwMVhTI
 4cHx/bdEbVudXZC1jmUdh5lPbiVVe6EVM89bgbPByOgSD2TibA3h9iL4r81jRuMQgHvm
 +m7HnsFmiVaXiZuxmzdDcMAn+bHPP+Rlq2bZUceHrzGK17fR/Mc/CoYHynlZRXz0Psz/
 4E/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zSE26wja7l50rNNqIf73gJREIagQaFyzLkLesA6xxJo=;
 b=SIs7X7m7UeNXFFoKYx6y38nBPT/jmd4GnU//hn7AW8y7RArcOX+/v2yYuFSxtaBuOG
 jxrCB8IRSS9OUYn3tug64NozROtHmjaDAkiakKKd5glyn2dpxbw3fSfDIvrixJb8GW0w
 Dr6GVQJCYorLlbKUr2pws1B6ZzoQ4gOJQ4dYjlnD5zj+oGBUSOOtf2KRCiDXw30Qbuiz
 Svtn/DR6FaoSlCPobybQDerw8c5VeU/yBnYow0PpCBL7lYpXuVHdyAWmUD2AEhYm3gko
 n5ZYtpGLjwglgSe3d8SIVH0e+8dCwxajHOYEORqfjXVGfV1EqNqhiI5d7KxxY11ev2o6
 nDqw==
X-Gm-Message-State: AOAM53235z8ghT6rmdtWczjTGldF0ZLlbXw7Unqeo1DBZr7KLQ4rZQpB
 rAOMIq8e2aOf5f7OLjNYfAK/y+tgKMhpuyPbMnKOSw==
X-Received: by 2002:a25:257:0:b0:64e:b1fd:2d54 with SMTP id
 84-20020a250257000000b0064eb1fd2d54mr20368905ybc.193.1653300846018; Mon, 23
 May 2022 03:14:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220523095629.144441-1-dgilbert@redhat.com>
In-Reply-To: <20220523095629.144441-1-dgilbert@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 May 2022 11:13:54 +0100
Message-ID: <CAFEAcA8G0foQ0WrvknfdCTOUZHNEomJmB19xxTmjdzrS6xv18w@mail.gmail.com>
Subject: Re: [PATCH] Trivial: 3 char repeat typos
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, laurent@vivier.eu, 
 mjt@tls.msk.ru, danielhb413@gmail.com, clg@kaod.org, mst@redhat.com, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MPejxRQm80Dn

On Mon, 23 May 2022 at 11:09, Dr. David Alan Gilbert (git)
<dgilbert@redhat.com> wrote:
>
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> Inspired by Julia Lawall's fixing of Linux
> kernel comments, I looked at qemu, although I did it manually.
>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Checkpatch would probably ask you to fix up some of the comment
styles when you touch some of these. Either way:

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 04427e073f..2467c5bf76 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -997,7 +997,7 @@ static void aarch64_a64fx_initfn(Object *obj)
>      cpu->gic_vpribits = 5;
>      cpu->gic_vprebits = 5;
>
> -    /* Suppport of A64FX's vector length are 128,256 and 512bit only */
> +    /* Support of A64FX's vector length are 128,256 and 512bit only */

This one came up in review of a different patch that happened to touch
this function. We should ideally rephrase it to fix all of the typo, the
missing space after comma and the unnatural grammar:

/* The A64FX supports only 128, 256 and 512 bit vector lengths */

thanks
-- PMM
