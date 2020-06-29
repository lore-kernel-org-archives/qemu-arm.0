Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3343309lfm;
        Mon, 29 Jun 2020 14:08:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4+7CZOnAKDltYpzqOuTVs71aRc0qYW8cnZydck9ExDLZ9m05g3KyniCFHi3j/Vpy+4Zuz
X-Received: by 2002:a25:7cc4:: with SMTP id x187mr29678058ybc.245.1593464887745;
        Mon, 29 Jun 2020 14:08:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593464887; cv=none;
        d=google.com; s=arc-20160816;
        b=E2SXXkCurEVCNXPe0735UlOIz071LEP8v/MJUYuHflIhNN7wj/5lvTSxANEvMg2a4p
         6UC0T4WNWmpaxqmDdr3ueesNBPca/wkKf/HnqGhsalC9Zv/SsSS85chaUnfUzR3XZ9oc
         mXqECOsJ6beEmfzhv2NE0wC4AQKAdFc+j9Vty7R6CsvlieUsiKOSYeXeYPmicGCej5x9
         H76vRnLIHbbZj8qIo6hpA+Kaw9pslRGkaZiWoBHXQN4ndfd5kNA2/orkHgpFxcLMTw5F
         wF4swjSKRPH8C/cRPfol8955M2sE/4LmU+u/hbRASpdVQVf2d/SJmiGuALZ1PM6bkkIm
         mLCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=P0sC1303DHIgqwmSuo2kDjh0PYJIAmblyh0uELq49Ls=;
        b=cosiiP1H5o0oOGZh53GH0j4empGqDk2wrWKdQm1gnSAo0Scz1m9tbBziWTl83ug4gk
         ZMjuJYWAculNElFhu8UGRbsMbIZ0ro+Mox1oEbhAbd2vEk+lVrt+Ku+RJjvcxU8+mhJr
         CoLIwhFSfRcxZZu8/LsPoDzDCnkD1l2tdg3BZ4YNx0x363zooKLyz/Wq3MMgIhsUBQwM
         776AcMCn1jikeC2ZzD89QmrIKaq+84UGN+TgU8a77CazsDRm+1p9XEBXVMtyFjEps6tl
         Q+CSIfbh6x+Q1VYtpJqoJ/Zcj6ywEESGsQH45z5vzfx+2/WCF65JuV5G9lRtJ2mK1LXn
         7D9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=m1xnXIzF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v9si673926ybm.380.2020.06.29.14.08.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jun 2020 14:08:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=m1xnXIzF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jq10Y-0003Bo-V4
	for alex.bennee@linaro.org; Mon, 29 Jun 2020 17:08:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jq10R-0003BY-IU
 for qemu-arm@nongnu.org; Mon, 29 Jun 2020 17:07:59 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:45045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jq10Q-0001aD-0X
 for qemu-arm@nongnu.org; Mon, 29 Jun 2020 17:07:59 -0400
Received: by mail-oi1-x242.google.com with SMTP id k6so11728472oij.11
 for <qemu-arm@nongnu.org>; Mon, 29 Jun 2020 14:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=P0sC1303DHIgqwmSuo2kDjh0PYJIAmblyh0uELq49Ls=;
 b=m1xnXIzFEfNO3XnhH4rzYQFRmXS4kn4ilZ7d/2XaTk0UMtVfdiltD2yaqjEq5GeFda
 jFVe4ADCstF5Pnnp3eQ0wxCao3yx4MK3plOQIXU5MxwXXzmzFbceeaGH0XYjooFeqHlh
 F9SWSccmGJYsPhDOMfvn71qXREYn2kpImM7AoaMQRB7HSvFSorCblj0BLk+u/xOcxVrL
 agchxgK3iXTNXDsKA7dfhTu9xPtOS2gbixMVfM7CNCC8HG203vo86NpMvHIrnvvj1abW
 gN/lmrslk0NQetaUX5P7+OP/NzbtsRdN3wMR4XlQEVPkDNcvSS2Wx9M2grTTRNEFQW5G
 2ZtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=P0sC1303DHIgqwmSuo2kDjh0PYJIAmblyh0uELq49Ls=;
 b=COjV0fGA3BrdC/ZjzGzh2M6TTMsc9xXTWlMZTe7G98t6IAGWT102uWJdeC/xrqKOry
 6XeH9gehL4DQ6+T1ytKgjqD0PJAqwlX0VKIjhHy5nZlGxJ6RH9T2GCNhS1VUM6ymP6CO
 fPVII/7BbnZtRkzbKOO+3EnNjw5v2AF3QhKE6RsRXRHkh+CIE0Vy3gQuDz6KgrwlLLcx
 QpYDFRu7Om2G2H8M2q7fHUOoDlWluUzIPBFpGgYev6acZra7+Jj62EwcdmgNTyWtt/4y
 Y6mcX3yOrIrS/f4/1h9ns1CgL4W1KL2DkzZSp8ksdJglGDyLqOPkv5CGuF42Ux2ylBTr
 dvZg==
X-Gm-Message-State: AOAM533lmjHbVmBSLCZ4kkQLqreyQSyWi/9obWuXIEOoC47CgL/anXPc
 VRWXNtON8GHLWff12O4NdnshZVmd7zPud8KUPJi6FQ==
X-Received: by 2002:aca:2819:: with SMTP id 25mr7850835oix.48.1593464876587;
 Mon, 29 Jun 2020 14:07:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200629074704.23028-1-f4bug@amsat.org>
In-Reply-To: <20200629074704.23028-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Jun 2020 22:07:45 +0100
Message-ID: <CAFEAcA_uAJzddqVfttgZ9PjNfbrjt3q1=HaTwRNPs+=smrDkjg@mail.gmail.com>
Subject: Re: [PATCH] hw/misc/pca9552: Add missing TypeInfo::class_size field
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x242.google.com
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
Cc: Andrew Jeffery <andrew@aj.id.au>, QEMU Developers <qemu-devel@nongnu.org>,
 Jean-Christophe DUBOIS <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N2scrk40iW+B

On Mon, 29 Jun 2020 at 08:47, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> When adding the generic PCA955xClass in commit 736132e455, we
> forgot to set the class_size field. Fill it now to avoid:

Thanks; I've applied this to master since it fixes a memory
corruption that affects all arm targets and I'm not otherwise
planning an arm pullreq for a bit.

-- PMM
