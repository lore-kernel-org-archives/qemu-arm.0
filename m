Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp5104838lfg;
        Wed, 12 May 2021 08:15:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBUIsbYl9SRxMo8QEs1uC01OvmKogdejvFADS8G4WRBzJD3VFLRHzsnlhMoXGc6iNxhjn3
X-Received: by 2002:a05:6602:14c4:: with SMTP id b4mr5531846iow.82.1620832547479;
        Wed, 12 May 2021 08:15:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620832547; cv=none;
        d=google.com; s=arc-20160816;
        b=xsEjbSB5xy2lx31zUIj+zHHPxmcS6cwyK+Rh8cV5ln5P4oNPDHtM+68vvwzti5ipgc
         HJAY+rEL8yw9yHRMEgzAPBqE22RXNcpV4ZBWa00Hjyl1sNdbGKWyhWPCfwggWtVQ+5YC
         CHNsejvesQj2Dxl5fBMbDyVZXdi2LHzieBfv4GqzAH61IBG3UgZIHMY6TjYxVqDyOIUL
         En8FIxpotQyRJYQ9HHHyIVS+Y1z5ofCc3Jhd/YODR+gzLZogTh7c8rZPthioPFUQwL0E
         HS7DxS9UJZ/2hDIlL1w3f3spa5gL0znppQZNHaF/hc/hlWnRyc6UEmDb36FdHUWJROOX
         Pa2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dkt+jChPm0N42C1/x6I+vYjeUWnz0xQ05UAjY1oDVIE=;
        b=UYsZwddwAFk31Dp33oZig6c67xxcKGSn6as1X+221pMOf5XmcEsql2RgbXx0Dq5HNj
         A0Hjkdfud+CsKEA7oEFjWJmPOZ4QHsOmuXE6tj15FmRJRKU7hZ3EEhe9I8ayylA7PMJO
         JAjryJqPAf9qfD9jN5/Bx+MWHO7ESdslE1S8dD2pB/gaQDCodHt884beLTMdlb2b9RHj
         ayXt0m9O5bL/IAoqMzg8LFUwLQx3x+BTU13vdyuizhJUzjaB3KYuuzJJPnzge0yJC0UM
         BqMNkn1XPBKbp303MfeNN7aUsRqe25ZllCvxsX9w6jFFKQRtYHCP941TojbHOJIwdpSM
         +HhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=a3Qap3+Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a14si30262684ilm.103.2021.05.12.08.15.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 May 2021 08:15:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=a3Qap3+Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lgqaQ-0000iF-N1
	for alex.bennee@linaro.org; Wed, 12 May 2021 11:15:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgqZo-0000fX-KT
 for qemu-arm@nongnu.org; Wed, 12 May 2021 11:15:11 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:35420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgqZj-0006uM-Rj
 for qemu-arm@nongnu.org; Wed, 12 May 2021 11:15:06 -0400
Received: by mail-ed1-x52d.google.com with SMTP id di13so27523195edb.2
 for <qemu-arm@nongnu.org>; Wed, 12 May 2021 08:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dkt+jChPm0N42C1/x6I+vYjeUWnz0xQ05UAjY1oDVIE=;
 b=a3Qap3+Zu4y4BSZ41ofLEgMJRoyy3Wqr70mj0jl8wHYARdRbNInNrduwW5a3OsL2Ri
 bdAxEliOwVpcZ8bsLYEIw8FzLVG/59DuBf6KXl1UOuyqHrCFleq4anDJh6TbDI6ZrGi4
 7yL7TgTkWXq+Z+cqzH+zDvFSc1pqjNuLjXf51QqHt/T9Vbvq/g+wB8pWu/FVbxznXMHQ
 Ia6093YujraXh2beKjo899DET88JJgU4Vq8jG6Xm1nVQhfY4PRtHgaFIzRciNWe0QKSh
 rneXbxCaePMi3O04sunFEirn5MhI1u9XfKcQdw0Kre8DZQrIwIQ8cj5qscH5xBy51ZoF
 eBEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dkt+jChPm0N42C1/x6I+vYjeUWnz0xQ05UAjY1oDVIE=;
 b=AUTcL18YEXsWY7TXChERLL3RNO/uJfs/m6wBPKFOC9iUBKjqMoM0FWhfLbeyObAvAf
 iEwjzRMy+ROej1C6FFk10PntPmtE2noj6HJMZpU1f2U39a16y2d19IreUhyx63oJKIGz
 KoKj12Wp8BZaj0SKyhCvMffsuY3Zi6YQ9oRyPNK+/eGeRFBMSVfGHnQ/1VIVdVrYXJWS
 Uruan2oseFeUyRX46BfyBEt623Z0u3bMdJKyUMyva/E3BA5uy/gwwQ8iidmTd0KF1s44
 6XyKx6DmCiCoaxeZnHn0/R5oiCSx/CQo+Ad5dLRL4/meTVRYyvMQwWs/S+0rWlv7pi03
 TyKQ==
X-Gm-Message-State: AOAM531ySUwxjsXuo51UDNVNxpmdyn4iWhUSrAhXb7dH6/WyA4fb7r1K
 Tfcdea/y00D/XtG6BYySyuMT1wuH6lp5GnKo0igCcQ==
X-Received: by 2002:aa7:cb0a:: with SMTP id s10mr43589924edt.36.1620832501213; 
 Wed, 12 May 2021 08:15:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-37-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-37-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 May 2021 16:13:47 +0100
Message-ID: <CAFEAcA-Zb0EpMNZ9S9zyAnipnNQ2J3A7nAESpj0fDf_JMdnJvg@mail.gmail.com>
Subject: Re: [PATCH v6 36/82] target/arm: Implement SVE2 integer multiply-add
 long
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gicIpsZE9Qrt

On Fri, 30 Apr 2021 at 21:56, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    | 28 ++++++++++++++
>  target/arm/sve.decode      | 11 ++++++
>  target/arm/sve_helper.c    | 18 +++++++++
>  target/arm/translate-sve.c | 76 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 133 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
