Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp700609lfy;
        Tue, 28 Jul 2020 08:32:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzV2Pw0G4XvWhToueNrhzI7fKx0pJAf/6vV3YvX0Ci4Y0R9NI0dZwkgtSO2FuizFmCfO/8j
X-Received: by 2002:a25:5f0c:: with SMTP id t12mr11898263ybb.54.1595950330874;
        Tue, 28 Jul 2020 08:32:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595950330; cv=none;
        d=google.com; s=arc-20160816;
        b=MvlShnh9PetsJgHzaJ+8VM9axhzKwCkTJEk65yKeU0XVa7zQEq/dkGc3bYwfM9J5Of
         lsTizvVQpY8Lr+LhfnNhDoU6bCMVZ7JppJs+IjwnDKrcQQ6JkyQrHLxXiXdnHS3jKplt
         XNq2slb4+TOJhuSo7+YCKLHNq+y5KPfybTpxwnuR6GW5sTEnNCpA82aQK0LEk+1fbSWy
         NvQYPgfm0uS7PUoXcZdk0YbhtiPYxaeWLI4LzjeYWquQjUeWTut8rwGqKKp+l2/fYEGX
         dI2ItCiYTQydBM2JwZDGhGYiPGv+rCiBz+ua2QMgk2XlhuNi8tr2SdCo1dKfaVrPGgkT
         tO+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=RwBQasF8I5OWzkHlcD15LP48+OAcdoOVTyj5Bhbz1P8=;
        b=MCp+rmFquSQRznsTk8zj237xBAofyeqkxJu7ExzK8AMSvhe3QQQDho8eeX1/Rw+0NS
         fARanP/9tDYplwO7GulpLvDl3ZoewH0u+jFJcd+4iSRxBPaVzAwJt9cYqC2PO3133eyF
         vHWhQ9xw57ytGgmlTW67EiO6+1dKWL5fViE7OZqnEESpMu7tol8MOBx3y5ibzNcr2nj1
         EXVZPWPoPQdDRoYEu0VpAFZS1KGbu3EeHYBRccSZE57YJpCMh+G7U0SuC5w+mvHtQgn0
         SokkSpAXY+urj1OklP9RM5Gw9tmfdTsqWjrEc/wc0UDWNyOdZrY4ALRPQJmxsswh7Wwj
         Q1Zw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xH8BbQVG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f4si11579567ybp.103.2020.07.28.08.32.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jul 2020 08:32:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xH8BbQVG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k0RaM-0000SU-6p
	for alex.bennee@linaro.org; Tue, 28 Jul 2020 11:32:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k0RaE-0000SL-PQ
 for qemu-arm@nongnu.org; Tue, 28 Jul 2020 11:32:02 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:43257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k0RaD-0003F4-6i
 for qemu-arm@nongnu.org; Tue, 28 Jul 2020 11:32:02 -0400
Received: by mail-oi1-x229.google.com with SMTP id l84so5278678oig.10
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2020 08:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RwBQasF8I5OWzkHlcD15LP48+OAcdoOVTyj5Bhbz1P8=;
 b=xH8BbQVG9xWYOEWUA4aW40+hG5xqQsY/7/Vuczp1OYlXLC5x91eqC3dPmzRd8dCHwx
 TUJYw3G/OYXOTF40bXCaZdV0n7eAfQRoYbH4P8zMHIeQ0BCMjwzRvKBrEqRGmUJEouba
 F0HiFyVshIyiGNUQ7S+DaxwKwemtnRhb5gP8bDbu1a23AiqyvYSEw+GljykYVQjLKrRT
 TIqG4xCcZQ6B9HKUckhfM7Vk24IaWcnmZgRPP2d9Aa1//CzrWCPeIA98wGtyYSuoQCcj
 lPJjnNwoVbnkSPo9U4mUUXqrR2HbtPy7G4b946llUhlrOQZQ/kfU/8xyJcOuieZ7S9pA
 VG4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RwBQasF8I5OWzkHlcD15LP48+OAcdoOVTyj5Bhbz1P8=;
 b=XjWeiyNSyktzuQXTpmN4L0FgaDgYtpa4YNa7Dl9TrwTHAdfXmCFNZReTptf7GbljQl
 GOabQa3A16msKYj4Q0rVpHY95oq2mtkymctw0Y6dyoDHutH7fqnjmUjNMovuUPC6xC6P
 wpd3BpWXITtry71qlhjE3s6SnKBCzAJPIXsbzg9Nz9v25uHRQV188R0P3MWrYD7gyUOD
 wkAHd/mSa7KeaIDl+iplguo6huhp4zD7PsT2v4Jvm695F8Iebcqcn2BwZVMATt3QvsUN
 Up/dEXNw/fG2Kes/i94Z62OcMf8e7+myCPp5/dsQ7f3R4MkomldAj7Ex7jBXMjov1KHz
 3yQQ==
X-Gm-Message-State: AOAM533Dv0rxuwiNzvfGpUP2BGaCuP53uaSBmDZeKhkKFY6qZJHF4oLl
 g+O1IRq92iHWgYLmsoRYvTVh2Z3hsHy1rZxsgpJYxQ==
X-Received: by 2002:aca:50c4:: with SMTP id e187mr3818987oib.146.1595950319852; 
 Tue, 28 Jul 2020 08:31:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAJoBWHzJq-51dBxP8pniQPd7fy7J+jU2gHwZOkn-NRJzc5uNiQ@mail.gmail.com>
In-Reply-To: <CAJoBWHzJq-51dBxP8pniQPd7fy7J+jU2gHwZOkn-NRJzc5uNiQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jul 2020 16:31:48 +0100
Message-ID: <CAFEAcA9XmXhp+Crx09k++Ryd3jSL8U36FSMvw6X73sBFEmiofw@mail.gmail.com>
Subject: Re: Differing PAC behavior between Qemu and Arm FVP
To: Derrick McKee <derrick.mckee@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x229.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-TUID: 3aik9XWZIBS2

On Tue, 28 Jul 2020 at 16:26, Derrick McKee <derrick.mckee@gmail.com> wrote=
:
>
> Hi,
>
> I think I may have found a behavior different from Qemu's system emulatio=
n and Arm's FVP, which is supposed to provide exact hardware behavior.  The=
 Qemu commit I am using is ed67b09529a564d2ceb242a7cb02613bbe0fa3ca from th=
e tgt_arm_mte branch and the FVP is the freely available FVP_Base_RevC-2xAE=
Mv8A from Arm's website.

MTE should all be in master now, does the behaviour still reproduce there?

thanks
-- PMM
