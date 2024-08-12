Received: by 2002:a17:504:6454:b0:1be9:327d:8ee3 with SMTP id g20csp793374njh;
        Mon, 12 Aug 2024 07:11:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV1bnPSfiWe0cqeGTBSMbCaD42bWEpaqScS0KXwqd9anVvEqYN3Z4jE+DoY7uuAFmMUzPun0BwLeqESev1d4v0UbgY/C+bw
X-Google-Smtp-Source: AGHT+IFP2689qQC4TwF/CP1Pqfjiu67GaZNLNmplq2ml1I+Aw4VqAJQJ8uPWUoDPvwgM2GtFFzbE
X-Received: by 2002:a05:6808:f0a:b0:3d9:2562:7541 with SMTP id 5614622812f47-3dd1ee315bamr436666b6e.24.1723471912845;
        Mon, 12 Aug 2024 07:11:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723471912; cv=none;
        d=google.com; s=arc-20160816;
        b=UzoSIiPGOsJUEXZ6J4CAp4YERP2ovqUZteVEh0zNronnPWEa/FVGgv6aS6J2O9H56k
         Z9PIgdY3/vJlIyfBxPiZMNRn8rIF7QpozoiZ9DLmpr7U2fMKov5nlNwQB2Osux8GpDc3
         tyEPRtYoIHo6BaOum9cpDvIh3h6/bir6IZ0F4BaKk0LeAwsztkd0gn9d6BHyPX7JHRFO
         40Wqze/fGMxsadv3dVrT4GbRlLZr2pbqZZgQBRZWmeHrCO9qMpP8GORgqHJrrnE2VYQ0
         l79yvXj4213wCd3VGZNiz4+YtDVZJFM/+G4uG4wQR/0P8b0whJWSthrmF3z92JMLKC8p
         FQ5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=pfWf/ngXQYnE2u2itjcrKImrtTr4LroRGjSrxyJGTNc=;
        fh=tH21erHwKDWrylyof8PZiz4OzqhcgcQM48XQRWAsqxU=;
        b=xkEPqGYXMX36SZsbtP7B6Jn7Y4qP7nLeqmbskDTTmeSWRksRPfW+/FRbDUNvpFhymD
         8YbAxU3H7UdZoGthZ+hOq+OUp8QHGMtyVLt75gkVZ8rtUrTnMKjZu5zHRrdRjKtOud4a
         6f+CDVL0IGrefJlE8KcpM2J3wHWL7hjGRIehQi+HTgphFNwS80ADgQ9cla9e/avJuchU
         eO2+umKPK1ehFCls3gsJU1wI7nSFaP/ERaPPPNIVvGpCP6eU9uvNO8jGyq42VKPKFxWo
         QbSv6f2g5Slr6tgCM6/99+sTAcC40hZmYuRB7v3+Gj0YeSjrKp+JcMD9ZCqVh2wmKfsZ
         UoEw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tXslvMY3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-4f91f2d978bsi807915e0c.14.2024.08.12.07.11.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Aug 2024 07:11:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tXslvMY3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sdVlk-0002Uc-IV; Mon, 12 Aug 2024 10:11:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sdVlh-0002R4-6S
 for qemu-arm@nongnu.org; Mon, 12 Aug 2024 10:11:29 -0400
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sdVle-0005GF-LY
 for qemu-arm@nongnu.org; Mon, 12 Aug 2024 10:11:28 -0400
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-530e2235688so4769391e87.3
 for <qemu-arm@nongnu.org>; Mon, 12 Aug 2024 07:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723471884; x=1724076684; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pfWf/ngXQYnE2u2itjcrKImrtTr4LroRGjSrxyJGTNc=;
 b=tXslvMY3d5E8IA0cYlQXy2Bg7RiOYxR+QLqKCINahsgJYpQ5c610WJ0hd0l/n9lXJn
 1JNLfvdrHpj1Jul5Jqu+j5vx6/WgZs2VBq+Z1W4mibQpkPPwVt/Y2ia8xDMA6gZDerFQ
 fWucr0SlJklmt2HSOBTfJcPkoRsRSnY0EBaznb9pSrGgncgelUGsQG5WSZkpsMsIpJAt
 3qTSAQ/KBxMSS28tIRvEDXXSC5LVQsL3agv9HTGwp15N3VTmL6DliCB8dt1LGG36nPqP
 BYpiFyB4Ii1m8HcXZH/sRlVsUT0BQbPEwxnclRuLMNmHvbQZyny8r967qkyzX4Yxp+Vy
 CqVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723471884; x=1724076684;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pfWf/ngXQYnE2u2itjcrKImrtTr4LroRGjSrxyJGTNc=;
 b=eQcwuc3b1idm2/LJOv8mjotHx7EyXBATimcPeJUudW6mRVuoe8J/RyID/8K3pexmqu
 pd3X5b4dGRes2WpW6i2VLnwv7WTNJe0m52EiNxsgQl6QXANfk14valFTvzKcEZ8pLoBb
 ltaKS7WmIvZumhaJqAmoD/echVlDzKGzS2w/IUca5PkoIQluKlCCoVFTlc5Egfppo3LA
 /o1C+2W7cunOzv6uMwxP08pg1unOem78JSpU95oPxrgTHEN1m+KacS/zBHtU+KNFJ4mD
 BgHkhPam5dh7uzUkC6+MnddazcAc/M89tcRTl6cLg0y623+9J7pr7X5MIrE1YTy6Xph0
 4rhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzp4K68qOOuZsz6ZwvYHS+epIvh2lom8hm4wehvXDsTgZ63miQKmqqDuI2DpQ1F6+95s5YThHSU0ceks/cz9f415ET
X-Gm-Message-State: AOJu0YwWepCnyBliLWt90+JbrVNLAnjgBoFFqaxZe45w9PrGsj3Ovt/Q
 m4Ef+D2cLKvru3xweXn9OVmGtEGm4Ttgpn2UaQ+aopg7uCxAowTQ5/WxFlxtYFGw93PiFSjl6yZ
 rqBrO5PKmGvKbl2v0yMgY+FvFfuJvXoHAxFZgLg==
X-Received: by 2002:a05:6512:3195:b0:52e:f9f0:f06f with SMTP id
 2adb3069b0e04-53213662e79mr179812e87.36.1723471883974; Mon, 12 Aug 2024
 07:11:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240717060903.205098-1-richard.henderson@linaro.org>
 <51b8f685-2ffc-4021-9d7c-bdabdc4ba177@tls.msk.ru>
In-Reply-To: <51b8f685-2ffc-4021-9d7c-bdabdc4ba177@tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Aug 2024 15:11:12 +0100
Message-ID: <CAFEAcA9J54_G-wQY6HJKLZeVmgFwc5+gmcyGeGJW_z8k5avK_A@mail.gmail.com>
Subject: Re: [PATCH 00/17] target/arm: AdvSIMD decodetree conversion, part 4
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x12c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: vxXI+r/DuTD1

On Sun, 11 Aug 2024 at 18:41, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> 17.07.2024 09:08, Richard Henderson wrote:
> > Flush before the queue gets too big.
> > Also, there's a bug fix in patch 14.
>
> Hi!
>
> Has this patchset (together with the bugfix) been forgotten?
> Maybe we should include at least the bug fix for 9.1?

Thanks for the ping -- I had indeed lost track of the
patchset. The series itself is not 9.1 material, but
the bugfix could go in. (I don't rate the bugfix as
very critical -- nobody's noticed it in the at least
five years it's been there.)

-- PMM
