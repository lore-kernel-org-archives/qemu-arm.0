Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp2088921lfg;
        Sun, 2 May 2021 13:40:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMPfwjqMSP7XYgSu7PKfTDSh13wZrUed3vnhT8nLiTYecdP+RaV3oKLRZsXaBvzQzXXuUa
X-Received: by 2002:a02:5142:: with SMTP id s63mr15012510jaa.82.1619988034806;
        Sun, 02 May 2021 13:40:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619988034; cv=none;
        d=google.com; s=arc-20160816;
        b=MdF00SBXiz8hVBOMtEF5MBQrp043G8tx+6vJsKdNfkEiI7YVbqB/7Wl147mPeLNt0S
         SY7EnsxllwFYyLoWQGksAJw4SsBAkJwsKfThArCSflJhAf2a++QHVR7FjlSuYjVBJEhD
         R0iSjWw9XeFg7HKHPdXxVJjYLIVVVc2IltVqyg0PuLRwuxKs8S+WWY+XiMqtpwRDJ79Y
         J41nytm63Kqp9nD0Nom/oJbtXJEEcmP1xiFOOWORquEb3uSDTf7PqoNyNuTaBgHyBIbg
         pWW53a1AdDvwHlGJqvldzkuqX010D5oSKYpJEH7OdCJsC+naJTHyYmgmLM2lXaVCZmBo
         st1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=wG9xlrA9F8eC54N94UgpXONbV4nPEG5jl49T3e34djg=;
        b=LUVjDF536znfIdl3BpqrkRFcl3YHWhF87ZiOVe3T+NoXKl5B+Mdemg/S5iDa1tI6XV
         U3jCG0ZShW4OIXBpztVrm4Xvo8fh/uW7Ui9WrGMAeD3AL/xatgqK+VZtEcnXHYOraW4G
         BnrX7cmBtzbFQ7yvJMIGxK8YseB8l1WEzw4/GFVYvNwMo+gB4VOUyX0Y0XliLRWg/qvo
         mroe0K06DcDhbMdzsr390ddXwt47bM9ihit4ZP5YfNCnCHeb1OluxMt+CiprVuw2b76O
         0BY1fHXdfn1KOkHaJ7y3xls/CAdxJ3G++++kFKhEVN4wA/MAFdY3E+ANWLcLCialKOEh
         J4VA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sIz7+GRP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d21si11150292jak.76.2021.05.02.13.40.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 02 May 2021 13:40:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sIz7+GRP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ldItG-0006Y2-6s
	for alex.bennee@linaro.org; Sun, 02 May 2021 16:40:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ldIsq-0006Xc-EE
 for qemu-arm@nongnu.org; Sun, 02 May 2021 16:40:08 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:43610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ldIso-0004d1-IW
 for qemu-arm@nongnu.org; Sun, 02 May 2021 16:40:08 -0400
Received: by mail-ej1-x633.google.com with SMTP id l4so4880834ejc.10
 for <qemu-arm@nongnu.org>; Sun, 02 May 2021 13:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wG9xlrA9F8eC54N94UgpXONbV4nPEG5jl49T3e34djg=;
 b=sIz7+GRPgXpDDXm28PBCTEZJVs5X/kekA7FcpIOX2r5hECjJrHq/ymdB1nf2cy01Gu
 Kuzf1U1kvAHIPz6TEi2vNBTdfZ/6Sl4PwBA3UDhzk4PjplTYI8V7VuM2ef/AC1bMnXpH
 XsEcaQxThJxGTPK+/YHpt8iGBc1IbQni0wesydcrYPkNhJQQjfxXaH5ee6lt5k7f1AVV
 D9rZzCbUO7OysVip/HopTVp47dclBqt53iXZpBppcB7LNJGmBYlrZ9A3KlVJZFWRLqg5
 l0+zQ2uDLUOfSioKbhL9ZM5mfhpdhVhuIbBFViT+6ka6YTBAtzls/f8AMVzzNGr0DzHa
 vErw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wG9xlrA9F8eC54N94UgpXONbV4nPEG5jl49T3e34djg=;
 b=HYp793JIMcniZTaznjv4BhNp0Vkm4Hds4z/SdPaKKq5qT9EGTurEqBGIGogRrXM6Ou
 mZlj48glVs+JuwO11P95Cz2lsJxvPVSMLp8owhUfgYGnWlrNpLE74Yd+a72ch+NnlfJs
 4zc0GuR678xjWFfmPXWIzfzmp+a0Yl7Q4Tv8EhGmzWq6d1YI5X+UP7m9Pn3aqu6RFmbv
 l08zoj3R1idWcsHW8iqojZShtoW8iuNFuOqS/K6KVkUIWRPnG/WBnLoenNkRZL/nkoVm
 cYMQq1N214/XvgSLNmzedp215JT1YX/GiCvEpoKPYgBnaUN1bU+rCTsaY3UfseLuKiXZ
 hClg==
X-Gm-Message-State: AOAM531Ttcc7pzVtrhLpWf/N1UXaKeOPnqDXtQ5DLX8esdgaVsC0DWu4
 9MrfPsBoS9yKVtPZnTfUIJqz5CQeuAR2U+jj2mqEqA==
X-Received: by 2002:a17:906:1dd3:: with SMTP id
 v19mr13494082ejh.4.1619988004193; 
 Sun, 02 May 2021 13:40:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210502203121.630944-1-f4bug@amsat.org>
 <20210502203121.630944-2-f4bug@amsat.org>
In-Reply-To: <20210502203121.630944-2-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 2 May 2021 21:38:59 +0100
Message-ID: <CAFEAcA_pCcM70-OMaPhaAiW=-V5OK6KbBWSEK8y6AVNxpAtyMA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] hw/block/nand: Register machine reset handler
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc <qemu-ppc@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /aaaBXjuTS0i

On Sun, 2 May 2021 at 21:31, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> The TYPE_NAND device is bus-less, thus isn't reset automatically.
> Register a reset handler to get reset with the machine.
>
> Fixed: 7426aa72c36 ("nand: Don't inherit from Sysbus")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---

Personally I would just revert 7426aa72c36 rather than introduce
a new use of qemu_register_reset()...

thanks
-- PMM
