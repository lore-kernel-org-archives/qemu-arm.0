Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp139282lfp;
        Thu, 23 Sep 2021 05:46:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxW1z0HBWziNC2o9DxVeTmClPW7cOH0rh0MhMYR7mXZ/WOB+8+jeYj905TPTbkI8tySNTOP
X-Received: by 2002:ab0:4751:: with SMTP id i17mr3821671uac.86.1632401166062;
        Thu, 23 Sep 2021 05:46:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632401166; cv=none;
        d=google.com; s=arc-20160816;
        b=NiUZjoQtTyrCqSJ10wNhBfoiDxKU+AL8b0c2XJn+GrTALToiNaLOoM2tjU/0qq8Y+E
         hWMwh8Auz0/tiqQFvmvH6SKxuDbZg7tVpYzKBJmTcspHHaJ61/3bmH8jJ1klur2tst5r
         h44yTH4UwvHlvcnn7WAoT/qtlP1fO6TRbRjc0LubT10wlYQFymY9mpYnvVN/Ds+ebAZC
         gq87aERONOypSAF1yTaHqE5aVAkgQ5DIl4y4QviDJyvO4LOhx09+z2PNdXdDFP6tSyBS
         O1c9eltw5/pl7uE261L9tIlqc4G4vv4SYAxJJ4OLwlUbG30vJFI/vRSj9zXUyjTuw4C0
         4tvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=whcB/87UemAXzrGS1x3Hrk67VMa1rcYprVhfvpxn+g4=;
        b=TDgyOzBUW0ObBUrhkfzX04lh0wpwxxWoQLIphHrtQf0vl0ykT62Yd2WSXnXyWpf93n
         el/51XIsWwDW71Fn5OX3dw6SbhZB2XtgeYPdU5/DlMieLTbrfGUzUciRtCJ6uR9Xtb6O
         tOlVvd4IS1GzdsJbrEPNldIqDcPoLoGpCngfd9ztT8ySBR/dWYepwXJuE5h3q+jSL7NP
         r4E4K7s2LBwUtk3LuloTfhHSHDlDyifLqzbQeDRESoEyTxuOO4UTcenM0XnTrQQyCARy
         8xEZqY1VyRHbGgchFkUZwUGRL5GKuBy2cnsU3xIAIBCvf0ozhVrCzBKMuNJi1+EPt2sf
         lAjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G2GR4AWd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i15si3807972vsk.261.2021.09.23.05.46.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Sep 2021 05:46:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G2GR4AWd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mTO73-0007DB-Ca
	for alex.bennee@linaro.org; Thu, 23 Sep 2021 08:46:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mTO6f-0007Bw-3s
 for qemu-arm@nongnu.org; Thu, 23 Sep 2021 08:45:42 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:34697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mTO6X-0007Tt-3h
 for qemu-arm@nongnu.org; Thu, 23 Sep 2021 08:45:35 -0400
Received: by mail-wr1-x433.google.com with SMTP id t8so16966946wri.1
 for <qemu-arm@nongnu.org>; Thu, 23 Sep 2021 05:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=whcB/87UemAXzrGS1x3Hrk67VMa1rcYprVhfvpxn+g4=;
 b=G2GR4AWdXmjwlmdgEaduU9iKyI86zFFmCpc2D85saemMRYwsaM3RcCaVXvuRDRa0mR
 WcLctrd+PmyQM+CSM8xG0zAwKDWHQ7GxHWfT/KKlotYUpyRJdxPz7daLuROumGcMJEaX
 pCXT7ANEzPV/v8OSUr29HzeG/I3AeB46sjc7dW8F/NE5AqBCMgdJsQ+L694Lu5nLDAo7
 PnP4++71yklgNy2gMACqoDUxRVr03KQb5sGk1sHl5VF1XavNFhNwkTRQ4w7j1SYkYzCE
 ZgCsl0847uhll7r7bdNP/U3WTeEpri3DcO1zgbEngCRtt2YhtmRMnAC9/E+IYDGlKC/H
 8NUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=whcB/87UemAXzrGS1x3Hrk67VMa1rcYprVhfvpxn+g4=;
 b=iGWy+4BtqsbETipuvEZwZsN7vX+j/Ua9tCry2zjCiLmXqD03Gmf4BJZysvu6vNz4Li
 6n3f7xUlIMNfoGeahu0kigsbGlkZv+HpUWjXmjTagvxZfsiP3eJnNEamIU0kl6Uf+jVs
 zct83rRvVq4rKxAX6BWaQbghatBqVcL03Fbg77CCXccGFV1Z5i/3yspzUZNwFBu//Tgb
 uC9+eHIBKevgZIx+IUMdH9hOOSN7tictnmv+QB1gSVpyhswdFFOj+sNB/n2Oftpea4Rj
 mOM/d2H/D06/m+GbLMzDyz3+2zIOgcYwA7voRlNRc8Tjf6Z1Y8iEEdRYNFs2GSbHFx+T
 S6eg==
X-Gm-Message-State: AOAM533M1NZ54keoT3U8S/5irrjTw2AkbqQANfJ6a67rvCuTHCroTN0n
 SZxpwyReu0eUQtO3PcP4K454iZBNoRfgrpS4cfW5Pg==
X-Received: by 2002:a05:600c:4848:: with SMTP id
 j8mr15933531wmo.21.1632401129741; 
 Thu, 23 Sep 2021 05:45:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAFLP=uCeyj+MK_a_BgC27Gr_=MC7w+-_08xJsrUC+bHvV8KWWw@mail.gmail.com>
 <CAFEAcA-vpTqu+dX=CFCihWVC1FQSbXvQPdyPHg3P+0Rd40wdWA@mail.gmail.com>
 <CAFLP=uCmE71pVfB5xNUvF6sZn+srqnK4Qo4KwGJ-QhT79jr0qA@mail.gmail.com>
 <CAFEAcA8caoz9LruDwKOe0GHC7i_g=A=MUDK6EKYqd9Ffgdtouw@mail.gmail.com>
 <CAFLP=uA=aB3-4=3MPP=xkRMV=G+DnBQgzGxmBmUdO-_AfdiS5Q@mail.gmail.com>
In-Reply-To: <CAFLP=uA=aB3-4=3MPP=xkRMV=G+DnBQgzGxmBmUdO-_AfdiS5Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Sep 2021 13:44:36 +0100
Message-ID: <CAFEAcA9aNtR-SW+qVO26A2W6zRhhb01XLJVyusoTU4-eh_9v4w@mail.gmail.com>
Subject: Re: Failed to execute "SMC" call on Guest OS.
To: Chenxu Wang <irakatz51@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URI_DOTEDU=1.997 autolearn=no autolearn_force=no
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
X-TUID: wHeiZfM3jGdD

On Thu, 23 Sept 2021 at 13:22, Chenxu Wang <irakatz51@gmail.com> wrote:
> Since the Guest OS is unable to directly calls the Host OS, I
> design an undirected way, can you help me to check it?
>
> I ask KVM to catch the SMC calls, and modify KVM (really KVM?
> not QEMU?)'s exception handler. In the handler, I route the SMC
> call to the Host OS rather than "Undefined".

The principle is basically that you need KVM to handle and
do something with the SMC, yes. If you just make KVM do an
SMC instruction this is probably not actually going to work for
any non-trivial kind of function, though -- for instance
if the guest has passed what it thinks is a physical address
to the trusted application then it will really be a guest
physical address and the trusted application will then
corrupt host memory by treating it as a host physical address.

For local hacks you can of course do anything you like, but
my guess is that if you wanted any chance of getting this kind
of thing supported by an upstream kernel you should instead
look at a more generic higher-level way of providing the guest
with whatever functionality it wants. (For design discussion
of that kind of thing I would suggest the kvmarm maliing list,
which is where the kernel developers generally are:
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm )

-- PMM
