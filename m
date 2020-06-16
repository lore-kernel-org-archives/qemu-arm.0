Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2479331lfm;
        Tue, 16 Jun 2020 03:16:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSsr8neHmucaYhqncofblCrx6EJNONhdNFON3POrDi+ZJIzhIklBxcQyyqNhl3ubiTaxNz
X-Received: by 2002:a25:3a41:: with SMTP id h62mr2975352yba.242.1592302598890;
        Tue, 16 Jun 2020 03:16:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592302598; cv=none;
        d=google.com; s=arc-20160816;
        b=ECMb2+4Q9CfY8Ls07Z3GIB6K9HHFp7KttqR4dr4p5HiOxdgjJNg7I9BlR/yl1gVVWt
         kBATDuN0b71scWhgaSuaBxc0jxoWhj3wVa+zMyVRDldr79TcXwkWt3ASV0xot2O0xad+
         YbEnrgydaEuW9M3vu8JKocSyBQLcpWpqHiDEFusdajieKcRyDh8y/wGhGNg60/r6NtL/
         3d/yQyH8jwwdJ0YlKtpL19pgiP+YpEIz1mzs9aznzMnuchPiS/MNcNZlcuP84MET5VZd
         Yc9ptjwmmcGXBNcWzggdFFBbUUDIa8aH1Q04Je5A907DTtFG8G7L4vTHMTciymA57J6b
         nw1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=iOwywz5A6+76u6vWYLIS/BZrh1ORr7H8LGCueT1K7Mw=;
        b=QDwVUhJQ7ADSafdPKVqaCgJGQkCnk+naozCJn0ifGWzgy3qGrQHPt0FdFKAVsdZaWu
         cd2pc8vSNWyfn5zUuzyyDvOF/GXnSG2BeZIzvLPn6lnHYrhXY91Aj3DfAAuBzc1Fka7f
         /VWw6G1Kuh+QZQ7YYi0MVyZkx9kfPufN6M2zgTDnHZUpWa7qeY04PewLmogH50PSuqVm
         YuvP0psnQA0NPXOf9xvwt3zKy/1/8TLMaeIEiDmS67GH1ZGLpN6eTMOYge3KItgXMuBV
         BBLTlZJ8uHE97eZjNjkGwrF0PYH/kbiWleMYL1KX6bCHCxPllEYWagD+y5fkEbUQNzI2
         LdeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hhgTb9vw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v184si14765617ybc.129.2020.06.16.03.16.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jun 2020 03:16:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hhgTb9vw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jl8dy-0000zs-6t
	for alex.bennee@linaro.org; Tue, 16 Jun 2020 06:16:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jl8df-0000it-JL
 for qemu-arm@nongnu.org; Tue, 16 Jun 2020 06:16:19 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:45364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jl8dd-0007Pf-Bk
 for qemu-arm@nongnu.org; Tue, 16 Jun 2020 06:16:19 -0400
Received: by mail-oi1-x244.google.com with SMTP id p70so18701536oic.12
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2020 03:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iOwywz5A6+76u6vWYLIS/BZrh1ORr7H8LGCueT1K7Mw=;
 b=hhgTb9vwRHyWB8OzXACpruAMD/yap1hTtL+dVVAyJ2u1pW2N293LY8WocecDxdUDAO
 t+vAiG8rNKu2dxl9SqdhH61VjzMsIGvkZZ3ofmslinVi0qd3lg+2zCkooWHcHt9mlKlJ
 +8lRdpReL4idYM2PSytrVMDDRdX1xWFwLTzK3cfubpszk6LkbV9k+xwf5oj/S+zULzLS
 ADMEOBzrccmIHLHoNIi/8pe4PjTrp7KajuhwTh2q8CBd8huF0cG0N2vy3Ga1q11z49Jc
 luEaScNMVvgo0zcvjgt04s6OVX/GVCFqAiJcpXS1IuzCIWR5HqfO0pEJvQRoT0JCJmup
 fuKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iOwywz5A6+76u6vWYLIS/BZrh1ORr7H8LGCueT1K7Mw=;
 b=THZa+vJgXtsi4EAQPtWOzMiApRXtJp1WceXlSr7/PRoIBhWB/AMPzNKcHYaxOlnG2J
 OFj2BUEAfqyAyTFwYlW0JnutKvftjdZmnwOiWGMgmFnrf7E4QmnJi1DiGCFI+3gfmYby
 SVQnomfQrwObYDo+sKU1huM9VZe9SVts/CsKcbDEuoftdfCdcUcHXsCxBYQ11PSbVqup
 D6zjbTHj7CXu9MN4lAW6MORuj7okKM35YI24BG0wdgXk8pD95Y6dO8ReZqApYgr6by50
 KSx8HlPDLq9nc3aZ94GKIADn2/isy6U1cA1LhMpJ/vkdijKzgYjaVboegyA/tHnDXNyk
 JjAQ==
X-Gm-Message-State: AOAM5308PZWqTOg0P8KowLDKiuMLKg9dc4boZ9yyVW/RECJz05Ix5i0g
 /bADRDG6Sfj/EXAjU5roWw/vdqIvYxP8ZcMMlJR4TQ==
X-Received: by 2002:aca:1a07:: with SMTP id a7mr2688464oia.163.1592302575964; 
 Tue, 16 Jun 2020 03:16:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200616063157.16389-1-f4bug@amsat.org>
 <20200616063157.16389-3-f4bug@amsat.org>
In-Reply-To: <20200616063157.16389-3-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jun 2020 11:16:05 +0100
Message-ID: <CAFEAcA99=aiO3q+c2NnaSwax-6BusH0OREr5t2DesccNUA2HvA@mail.gmail.com>
Subject: Re: [PATCH 2/7] hw/arm/mps2: Rename dualtimer as apb-dualtimer
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x244.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Esteban Bosse <estebanbosse@gmail.com>,
 Joaquin de Andres <me@xcancerberox.com.ar>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r9v9xXGI5ItH

On Tue, 16 Jun 2020 at 07:32, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> The dualtimer is connected to AMBA APB.

True, but that doesn't mean we need to name it "apb-something".
The AN385 TRM just calls it "Dual timer".

thanks
-- PMM
