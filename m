Received: by 2002:a0c:fd46:0:0:0:0:0 with SMTP id j6csp4098592qvs;
        Thu, 9 Jun 2022 06:23:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxebNpXY2xT5oksqWFMzPb/F1b2J4kR71KYXFPi0BMcoqCtw/7FwNv2pCwtSG285S9uAo4J
X-Received: by 2002:a37:511:0:b0:6a6:ad87:ab79 with SMTP id 17-20020a370511000000b006a6ad87ab79mr17706724qkf.412.1654781036500;
        Thu, 09 Jun 2022 06:23:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654781036; cv=none;
        d=google.com; s=arc-20160816;
        b=Du0YDdNyTjo64TkkMdkSrt0MU6cSoTexd5ZqbxUIo5A1rsZOvb+q6/a7T0JRcWv3Gc
         g4wRjQUq3AM5rQ2F4w4IrFuTGmJfuRIIsGoUvx0euRTeaNt3/qBQ9eqFL9YJtyKgz7PF
         FhqK9nd1tjQwOzSKuIlcaoQnd1NkyCrQ7No8oKRMAmQdQTfkQMvAW3BO2QwBsmQms4vA
         xvNbdDr7xbJaCuKBFf88d9o4Yucd11V7KQfwUXH+fQmLLaU7G07/GZhaDYW4UcxJOMOC
         NprOkdYw+c5U297elqDK9p+HYvNlMmzIt7eMcVKzrUjxnqgzrDrnxZ0gG6MPtxTuV2jQ
         AzYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=QygC745fEiwF6DlaMsfsrtmjtr74W3i5v0DjLJ1Xojw=;
        b=d365sn1N3ZbszsDuzOqpkelyANUWFaGtVvT+Gr2lA/BIZy6iKJbGBBaQLBOK3/SEno
         NPRVwORsPFcrQFss1Foe5o3V3WTP4oXfWDMI27fqL7WncHJiNcKsNjjVDaw9LYP72Uv8
         DGRpPno9A4qUBCnSu1Eyb/3Nu2793nFt36krdVu+WhBtsigPPP0TU37TeuitSMZs8Hh9
         GK8ye3hdB2NjTG02+eT8pAZX1VMv6wGSURbsbJQqBUuWUEdmkd10L0dlO3Oke1JcXqNH
         G3r7wcEmQ98ogQweyNHvFCBGraWcvoLv2Vr2XW6c4lAwqQUUSbullSiNMdxyMdPDqiaP
         +zDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Sh+VntcN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 77-20020a370450000000b006a6a854c33esi8554062qke.368.2022.06.09.06.23.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 06:23:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Sh+VntcN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzI8g-0002lB-Ur
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 09:23:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzFuk-0004dG-8d
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 07:01:22 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:35686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzFug-0008Cr-Uj
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 07:01:21 -0400
Received: by mail-yb1-xb32.google.com with SMTP id x187so13590745ybe.2
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 04:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QygC745fEiwF6DlaMsfsrtmjtr74W3i5v0DjLJ1Xojw=;
 b=Sh+VntcN835irxYJwz4fW6SSgQavkoydOAYazva5a53TyzEuVOhEO5hwIIF2mE+J3T
 sqa5NWfYVx/xUVxCh7nlsMLpoNG+PXjtjpmpOvo5EFlNKKjFx60KrAp56m/aCoyhHppj
 H5qpjVvN8zSumjoaWnIgd0QZlgplsfELwsy4l2xRnwLtCVEMps+0DrWAY+0CI0hzNKgl
 nuIE5kpKvRhhkKN/+6IdzK0ugk1q5i/PXeJbvxuoKGSF0kQ+W2VYPrOQjtnIYkQ8M94/
 qXc4iZORqKBYTRuGntmvQk7Zfk48zJMRx8lMyZjEUuZKkO/9mBQzL5cVaeN2Usb/ZoH1
 P+BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QygC745fEiwF6DlaMsfsrtmjtr74W3i5v0DjLJ1Xojw=;
 b=ZmDBOMui3KeZxDLkco2d8Rlf3KaXFyjj3UhjkH9jzdDVQoB5vZ68fn7bTWS/VBvBbH
 i6a4g1ZxPM6hhWZAIA92PcnWfcqxizxshY0fW8bWE4oVLQY/fT9HeRi6hRSwPY/SgSjc
 8kxxLvJZAsoWghscFIYkGVu8JMiJQnpbS8mvIhjZxxgo22tbQTNio8mwfy8sX/XE4mtL
 8De2pCFk61uUUIVjm558MnPSyVi1Tm90dc544V6LSkcH8ASR5cg4RxbnKFC16JAYtxqF
 DcpGc50M/SGXsxswSJELL3E2S/dsfFAmu48fuTGvsIjrkz6y+QN/Wlo81wZsWxwYea2g
 bHFQ==
X-Gm-Message-State: AOAM530t8H0ROy9cb9Jiu7z6TpfwL0g4K6VAR9bVatzllj85LsT8r3YX
 u4y6vG4Xiw8qFRb8aEiwo944sBawRiUWmk7DELpLsw==
X-Received: by 2002:a25:1bc3:0:b0:65d:46e8:6322 with SMTP id
 b186-20020a251bc3000000b0065d46e86322mr37416387ybb.140.1654772474886; Thu, 09
 Jun 2022 04:01:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-32-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220522181836.864-32-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 12:01:04 +0100
Message-ID: <CAFEAcA9-v=QROuRjAW2_kbWYYzfNX+zUn+bqhP+tdtAz6c6kWg@mail.gmail.com>
Subject: Re: [PATCH 31/50] ps2: make ps2_raise_irq() function static
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: sWsuJWONp764

On Sun, 22 May 2022 at 19:20, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This function is no longer used outside of ps2.c and so can be declared static.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
