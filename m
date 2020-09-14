Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp2236670lfq;
        Mon, 14 Sep 2020 05:55:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYdxwnBBfNIoZvkKbiauwbpYr65Y6X4JwR9QonYUL5Mp92yHgR31B9zlIvPdmadTVt6UfU
X-Received: by 2002:a0c:f194:: with SMTP id m20mr13438616qvl.9.1600088127515;
        Mon, 14 Sep 2020 05:55:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600088127; cv=none;
        d=google.com; s=arc-20160816;
        b=h0Nzx1gpZzM3XWLJIVytdzq8jbdvlmu/YV0bm+5kZE9NTiH29CunZojrXxgcidsO8t
         Uc9slJVA74TishwurRDof8wjDj96pnJuFxhfJ+wQrtqXYJzgHlZa6Vn9USj+XXw/tWyp
         oJWMf9IueuGa6oYa0QkRkx6pptzWtl3fv0kQedPBVJV8yTLa9I7CFl0n+Yzx4hVYdaPJ
         eBdAUhEMkELeICu6xWisamw0aG011G9FmfUbQJAHrtAOMYlEuhHuQCAvzaO1xN5u82xY
         Qf4fkKUtBlMS5SEMjruZl6ZH8aOVupMt+qxeTePDyGmPsm2CDph34UQUQ9h0kjtbK4OF
         PrhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DVaCRgx1fQKr14/rUIRwArlH3VkYirm2d8m195lA3Ns=;
        b=0pHpRfkQreoCHP/UY+/fu3OgPNrAMl4fgqGJ/+77+pL4E3FsGO4lGP9rJn8bVfrHtG
         CqZaIs1NN50vzQmL349UGipZqjuFKLfDousTt1lz0q1ebXVgtWk4+2bDXUgu+V6TmNrd
         /eiCzVE3xaWUb2Q4eLzvsKLYyHU/hznT6DJSLJcB52+rM9QOz8Av5HaBwupgFIEhZw18
         fpH8cBCBK0Sq6A5mYumaGivobQ6XRduy+GhJHLYFxHDqz0jJZJy+Ew994rrDE8xM9Hic
         cDt3vghwVs4UwkBYrG4Y68IFOi3VhKd0OUsjchBu04D0Jh/jmn2uftgUiXvefPkB3NH1
         lgFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YnH2Aaam;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t199si6810142qke.322.2020.09.14.05.55.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Sep 2020 05:55:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YnH2Aaam;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kHo10-0001hn-TC
	for alex.bennee@linaro.org; Mon, 14 Sep 2020 08:55:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kHo0r-0001fX-Bg
 for qemu-arm@nongnu.org; Mon, 14 Sep 2020 08:55:17 -0400
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:40528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kHo0p-0003qA-DL
 for qemu-arm@nongnu.org; Mon, 14 Sep 2020 08:55:16 -0400
Received: by mail-ej1-x644.google.com with SMTP id z22so23062817ejl.7
 for <qemu-arm@nongnu.org>; Mon, 14 Sep 2020 05:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DVaCRgx1fQKr14/rUIRwArlH3VkYirm2d8m195lA3Ns=;
 b=YnH2AaamclDWLtGSojwbFNsdtFCoD6NFtF0Bc0Uo56CUeG9ySEETO5JHXbQao8iFzB
 TxNsKsVvIsa/e93sa9s4u6bA8R72PstYfBlWApsaO/Jpitet6ERGysU+akae92hBlD8C
 PGPseXpFXRTMVzk9SNflqGi03UYozGfc7Q2E007Wnn8NsteSA1WQpv4iVnCH085S4NjE
 b34g2gwXtDr0SeYAVOg2Rqv07sBcF9kqxBYf84jZ1nB2jJL1W3NizZO+23oFcMxDIIzz
 mSeD8JfAVfqAWLM68ItGULbGyarve+MOQ3lYKkvnYprF5YtQqf7D8G1gxjYVaeUK7/yi
 Vn3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DVaCRgx1fQKr14/rUIRwArlH3VkYirm2d8m195lA3Ns=;
 b=JLleVQpJKNpRzkC6NkjFzO/UlKXciWkjmVmQbeU6TmslahopjQYJ4BEbp80Bgk2+cD
 vYaDiYsY5KhtzsV2tpLMrazbnKS3rEe6aftMJpgxdO5qB8XTsE3yPUAShccOr1QGQlcU
 Ntwe15SK/qqKy5mXpTTXXc2okbmXWTRFUY7zUkrrUCFL8G3crpvus/uZzAWsJpce8B0U
 UE1Q5+Crsk0odme3qxI8lmG63yxVa3rGmiR+ZKkydVyL70Jx5TU/pccjcmn6OIIOKBwn
 hgGH487XfzRE00Sjz7V9ljU/I9EzyPDBMlTX9DqtTO9dvEN8gfnuPkbhp6UJA8o/Xfgh
 l5WA==
X-Gm-Message-State: AOAM532ctuJE3zP3rKwnM2yOuY3vjNUsgqRxDWQ3YWvNNw58YB61TDi2
 Ec+VakaZIXvrSR0X+bVqrpAVL7hWD8JGatnBCvlSyA==
X-Received: by 2002:a17:906:71c9:: with SMTP id
 i9mr14284636ejk.250.1600088113855; 
 Mon, 14 Sep 2020 05:55:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200911052101.2602693-1-hskinnemoen@google.com>
In-Reply-To: <20200911052101.2602693-1-hskinnemoen@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Sep 2020 13:55:02 +0100
Message-ID: <CAFEAcA-77U7p3RCQS5z7ZJf-CBNKqXrkwB+Kdz3ZCjPQgEge6Q@mail.gmail.com>
Subject: Re: [PATCH v9 00/14] Add Nuvoton NPCM730/NPCM750 SoCs and two BMC
 machines
To: Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x644.google.com
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
Cc: CS20 KFTing <kfting@nuvoton.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 44/n4GHNAyLX

On Fri, 11 Sep 2020 at 06:21, Havard Skinnemoen <hskinnemoen@google.com> wrote:
>
> This should be fully reviewed now, but the Timer patch may deserve another
> look, as I fixed a few bugs in it. Huge thanks to everyone who reviewed and/or
> tested this patchset, it has clearly improved a lot since I started.
>
> I also pushed this and the previous patchsets to my qemu fork on github.  The
> branches are named npcm7xx-v[1-9].
>
>   https://github.com/hskinnemoen/qemu
>
> This patch series models enough of the Nuvoton NPCM730 and NPCM750 SoCs to boot
> an OpenBMC image built for quanta-gsj.



Applied to target-arm.next, thanks.

-- PMM
