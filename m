Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp70338lfp;
        Thu, 23 Sep 2021 04:23:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9OHQkDUAwKaawVkAfFp2iH3lnIGcDKX00IVGlRG3qquWCkOG4pUlSoEyrHPoWHWo++oqF
X-Received: by 2002:a05:6e02:1b87:: with SMTP id h7mr3245648ili.93.1632396224925;
        Thu, 23 Sep 2021 04:23:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632396224; cv=none;
        d=google.com; s=arc-20160816;
        b=X7mWFQgL6ecJ+zbQXNfKtKL/wranZTJNmbWSfqjsNXho8CXDe0xBqtLp5YNAzPuJBD
         kvfCo7wE1h3Ov2XK2KhBrd78MzBzWBJXa9FshKqfzxYJO/lVnUFBcZmcGoTCoQWEhucB
         fes07zlQbiSlkdiiKrH9wxYM5jdzX5wqOhwz9XapANwsfivf+17X7A0GyYsX0UFHVA6R
         /sE3xN/Rdrrn/A45+L6SSoyXx74rErsonjveoXXrGu71z89YbMPX2KSCyk6dO12e1KPz
         VtzNXpBLkCyiJb2oq4rP57BpHWkkFDyCwxdBARDflXbWYhbDLFN1OhZdUpSHEfD7ohFY
         KvKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dpoQgtk30Ps+mJrqbAOulADtATuITPp97tcgQFr+C0o=;
        b=NzdSWqyxBK4MRC5i4Baxr8hVWRwsJ9nUL4gqrpYR95Npyk19YAwtW1tH3PyWKe0GNO
         n3a+COrjC0+rOMm/q3xoAbRIaIETmMI1tWGqFZ5LXDL3SW6phsPfsyKzhArPOhiKEpCD
         YmeiYuoXpUmonjPM7HdykYej1LbUqlQiZ3Cy02ZaHQUJpeNhc1a27PTlzGBmzRi2RI7Q
         GUgO8WbyFss6NjQxr7a4DDwyqFabHZnSVvUuVm85mefairnroCgZ4OSBtEVScKDN/jd2
         DfsOaVaAUp+sOUWS98h+svbtGqabcfzDKUcVvVAHEmGXgBn7lW0X0xyVjpIYzo7dVjeV
         +9iw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VL9msoxn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v8si5102203ilu.137.2021.09.23.04.23.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Sep 2021 04:23:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VL9msoxn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mTMpL-00052w-5I
	for alex.bennee@linaro.org; Thu, 23 Sep 2021 07:23:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mTMoD-00050R-L9
 for qemu-arm@nongnu.org; Thu, 23 Sep 2021 07:22:34 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:36734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mTMoB-00085P-SC
 for qemu-arm@nongnu.org; Thu, 23 Sep 2021 07:22:33 -0400
Received: by mail-wr1-x430.google.com with SMTP id g16so16199357wrb.3
 for <qemu-arm@nongnu.org>; Thu, 23 Sep 2021 04:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dpoQgtk30Ps+mJrqbAOulADtATuITPp97tcgQFr+C0o=;
 b=VL9msoxnRferzL4jnMl+PQPJb9TjzKBp2RNJsPVJ0N4Pir31Kb/vqHhcfqZHMh+M8Q
 kCaFSl7khdSN7ms1LGubTM4jEmWoiYoBUuup60NC6lzo/viQ7nNN5325jcm7TkgwVypE
 oLg5x/hf739toZTq6U50C2AqoT3aPFYyVzPjTOi2PVxvf3kZ9nwPuyeQ/hG1tyvIqXbT
 HwBp67Yxx2Ik9bsYrG80xG5PDcuRxoaEBNeD/8VwkpDKJ5HlOkdlHCCrmiG9qUctiowT
 JFqatF3nSxOj3WD3SdkNuI/GgHW95Se2cTCrBSnSYLJGL6FUTQ19iCExPbHJcSox7i2N
 ZdPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dpoQgtk30Ps+mJrqbAOulADtATuITPp97tcgQFr+C0o=;
 b=hffln8I1wXezupaq2PEogNij8kzbnWYyIS87KIDVUgWy6sgLhiII7F4/Mvi0Y2PGrz
 2K1O3HQ3Xld39F8oXgFRlRPoIluUt3AdiZg9v8JEfbbWIjkaybJjztQ4oBzOc93XAYdM
 YioF6vkyH4zgkvS/Kcv0npp0mYEh7chbJAIjx2/WYTJm7Vvm5N3nREn78VDMhcumUy2y
 GLN4uj3K3v2O27AiQiC+faqBpOdENzyyFVVnQVlpWwL9+XOxFXU9kahne2yjf7bkyA7u
 fzn6dIZAWCb5QDyYU/xAVYwX6XtJnXoxDEsCXd4ilDZcZBda13ctsyuGrjGy0p02z++S
 7S1A==
X-Gm-Message-State: AOAM530woEFVIF1CtgqKQ/tmqO/yQbLDa1ceqxcAXtdDfhtj4V+9ihrR
 XrmIFlabkKRMVs0mE24VbK34gVUpsy40BucPjVWRJg==
X-Received: by 2002:a1c:a505:: with SMTP id o5mr3910692wme.32.1632396150282;
 Thu, 23 Sep 2021 04:22:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAFLP=uCeyj+MK_a_BgC27Gr_=MC7w+-_08xJsrUC+bHvV8KWWw@mail.gmail.com>
 <CAFEAcA-vpTqu+dX=CFCihWVC1FQSbXvQPdyPHg3P+0Rd40wdWA@mail.gmail.com>
 <CAFLP=uCmE71pVfB5xNUvF6sZn+srqnK4Qo4KwGJ-QhT79jr0qA@mail.gmail.com>
In-Reply-To: <CAFLP=uCmE71pVfB5xNUvF6sZn+srqnK4Qo4KwGJ-QhT79jr0qA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Sep 2021 12:21:37 +0100
Message-ID: <CAFEAcA8caoz9LruDwKOe0GHC7i_g=A=MUDK6EKYqd9Ffgdtouw@mail.gmail.com>
Subject: Re: Failed to execute "SMC" call on Guest OS.
To: Chenxu Wang <irakatz51@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TxS5dbu9YPdQ

On Thu, 23 Sept 2021 at 12:09, Chenxu Wang <irakatz51@gmail.com> wrote:
> In my FVP, I want to write a Trusted Application (TA) and want my Guest
> OS to call the application.

You can't do this. The guest OS inside a VM does not have
direct access to call a host system secure world application.
The host kernel keeps code running inside the VM safely contained
(which is the job of a hypervisor like KVM), so anything that in-the-VM
code wants to do it must do via KVM.

> PS: I Still do not know how to reply to the thread in the
> mailing list, maybe cc the mailing list is OK?

Yes, either to: or cc: works fine. Any mail client should have
some kind of "reply to all" button, which is what you want.

-- PMM
