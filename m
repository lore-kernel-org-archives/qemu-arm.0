Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp379639wrm;
        Fri, 4 Oct 2019 05:31:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzsNC9OaczZwVVzZsHCi+hgLgFzk++8G281QAeKIXY0SNaQjQvbRr2RM3XhfIxIFTyJ03dU
X-Received: by 2002:ac8:4148:: with SMTP id e8mr15648136qtm.227.1570192268678;
        Fri, 04 Oct 2019 05:31:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570192268; cv=none;
        d=google.com; s=arc-20160816;
        b=Hkv6Y9Fw7zOXs48axjG36zWomJH0mE84Uh3MMibWiGW7Yof8rdejbGpXK+TKmC9AVo
         WnzF3ZqetPyGgK528/zzSLeTNWSjpLLjtGpn4GRyJg0sT8ZkDRtanouDNpTRPWpgMD0q
         iEIYeJ/sUYrPMeP/PHOnRsV91KCbLofrepi5gEM5i6UOe2biGD28hHzLHlD9v4onPQC9
         6CQAffNvQDBuAmKp4v0otPKBuKzdqacFY1iw3enQw7QHFd89+7ueFxGQ+zHt1ZCRaltP
         +Sl+vzTG7DODPt+ksrZ9G8ptwA/RiP2/cnpngfUfDE29B5VT1W4tgCRJo3PEfDaFW7bx
         NCXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=73tXdKen0FxXUuZYNbEuimiM9wHeptOmr0gi/jbII7I=;
        b=sk+/IwKsXwN19N2o9SuKRIkebtTBQJPAld9Zan/iGJ3TJNJjvTcrb1hua8dojOrzTn
         kh8DOm3i/7/6TFMpSanYO96TgWBswMyLjkfnmcp5UNlCA0pFsrUsfa9TsZt4IBr2aFsf
         rMUWi1pDi0t3Z3VC8PRgkhVf6Xt0l0dK7yHfx7dO9seOpQ1b25grnbmeNEqXSD1i+cjv
         mmH1Gxx7d6oOc9sdVXUBoD93sPjPSR4bYQqUGezATjJWXBsMqMXros7yepv4YsKsb6EZ
         bAzpvrGmyE/ADUen1gi7YbCjsKA0SEbn/GmZJ5WVluxwxbNwGKmrMyJyXDAi6icw87du
         ILMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N4lhLiFn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f4si4890080qtg.257.2019.10.04.05.31.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Oct 2019 05:31:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N4lhLiFn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iGMjj-0000Zc-TT
	for alex.bennee@linaro.org; Fri, 04 Oct 2019 08:31:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59953)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iGMSK-0005ky-7e
 for qemu-arm@nongnu.org; Fri, 04 Oct 2019 08:13:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iGMSJ-0005yl-BL
 for qemu-arm@nongnu.org; Fri, 04 Oct 2019 08:13:08 -0400
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b]:40172)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iGMSJ-0005yN-6c
 for qemu-arm@nongnu.org; Fri, 04 Oct 2019 08:13:07 -0400
Received: by mail-ot1-x32b.google.com with SMTP id y39so5084096ota.7
 for <qemu-arm@nongnu.org>; Fri, 04 Oct 2019 05:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=73tXdKen0FxXUuZYNbEuimiM9wHeptOmr0gi/jbII7I=;
 b=N4lhLiFna5ReHy8U0PsYkw0+aU5yQwd5OCeboO7+qcpwtg4DtO8VLy5FxcXLaclzpb
 8bYwvmNlIRhQEAmjCfc6/2f+4GqmnPzYNGKUuVUkOTJJopTAiBAX9ryqLeQYKyaKljh8
 sERr0q1LFsE3EjDz0r3Xmiu1zdHFdhpwQX5eO32pADH+jQreWSPa1PmxO2T7OUUE0hlz
 iTi2IovEufx6T5iUXwvBrUN8OESLmuXd3DFbR++5ZEM5nofvfyP1BCFfjOGq0LSHGNYf
 3NZ9MGvUEk/DzXXEa5bPF+RGwh3AdrM1Ox2d5ntRBnzDvrE8o+nZhQXQueBUzSzCxQ7V
 ffQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=73tXdKen0FxXUuZYNbEuimiM9wHeptOmr0gi/jbII7I=;
 b=HumaSpzcWDD7/bw4nhKuawexJ4mVySGf659sgYlmh/Fme1QfKgqRp9Ly2tAbYkzPYi
 Tdihr47/jmK9Uh0G2vRLmNYhuU65svRVSonOXNvNWLxFzNJUDPCTP8c5IjY3bWTehAUK
 +4A8Yg8dHDqt24rQoQ5C4brVP/DGD9H+DrKU8zFEDnesclUWgYao/NeZ7EMZ0wxxLO6d
 3BYPfKx+ePbg0Q7pheReB2I6boFywHOAYBJlcaXcZdsNnq9Jb1f3dNpaYR3LS4Ij09AD
 C0l+4MN96qTiGs1ovjj0kY3//WusT4qYvOplv6aw+CLQLDOxFINmrKlUMhwLTA0p6DYh
 DA9g==
X-Gm-Message-State: APjAAAVwTdMhP6BNHaU6M5FnFw/ykKBbwvL3eSfe2OVK491iwUhOVbHy
 M3dz8Y19AlcZQu1YYiwxIZDnFNLTDI/MFiFdIPMx3A==
X-Received: by 2002:a9d:562:: with SMTP id 89mr10727195otw.232.1570191186424; 
 Fri, 04 Oct 2019 05:13:06 -0700 (PDT)
MIME-Version: 1.0
References: <AM0PR01MB57951DFAEC15A7E418F6F3C1D79E0@AM0PR01MB5795.eurprd01.prod.exchangelabs.com>
In-Reply-To: <AM0PR01MB57951DFAEC15A7E418F6F3C1D79E0@AM0PR01MB5795.eurprd01.prod.exchangelabs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Oct 2019 13:12:55 +0100
Message-ID: <CAFEAcA_Q9V570TSbNKBBoB1+G58_q4J98iD0CKvSfxx9gCBYAA@mail.gmail.com>
Subject: Re: [re-sent to correct mailing list] QEMU not booting U-Boot on
 almost all i.MX ARM boards
To: Waseem ALKurdi <waseem19992009@outlook.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::32b
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WJucqBiRYCWR

On Fri, 4 Oct 2019 at 13:10, Waseem ALKurdi <waseem19992009@outlook.com> wrote:
>
> Dear all,
>
> I'm trying to get mainline U-Boot to boot on mainline QEMU 4.1.0 for the 'sabrelite' board, using the configuration 'mx6qsabrelite_defconfig'.

Hi -- can you stop sending repeat copies of this question to the
lists, please? You already sent it yesterday and got a reply...

thanks
-- PMM
