Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1962676wrs;
        Thu, 15 Aug 2019 05:03:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzlGvXLUjDqepwUzzUXDMsXVp3IWa1tNYEpFs9lvqOZjhfrkAkjzV165Qzo1oaocwJvqAcZ
X-Received: by 2002:a05:620a:1113:: with SMTP id o19mr3582029qkk.46.1565870592076;
        Thu, 15 Aug 2019 05:03:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565870592; cv=none;
        d=google.com; s=arc-20160816;
        b=SxnyLnOgGjt/680OJSE/gQRk0sB7CHayOUKgp36+eCbrU6zW6ilcNrtouQH5Albj+w
         uIK2GDTmDVh0FiwRFPCizcwCvTGsT+sowp/TAEiaYovnmTeq94cKauKN+a/waQOUg/zg
         UceMcPnEBY9/BfVAGgRS+7A1uIZybHbnSUV21O5Ufl0hcrJ9T7mpmnn1PGK2RtLzVU4o
         pdBbfj5MxQGBepksdjGRSVAavi9LXNhRMxOeKylfp6Ia2yZCeq5jlx6peimEWHeKh5/2
         NcjsYdoItPPrWr2PRXR0Vgpqa+G9/RYi6TRpM7veRu6iFSGFsaR5xT7fqGiupYOefSVd
         lczw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PKUnr/M5oGNx8UyDStGHIVSwFmorItLwHa5Q5q86s8k=;
        b=mmH8j0IaKmZpFImEv6wlGuxz/vMSmgQNhsp7oeQUla68OIsUqeCEhgb7Mlad0KoBgs
         tB7zCMdE0p2nBpGpGyw46v/RXu0bQjiYErWZNwXD4zQw5+Jd4jkFjSD8/hqFBWKlVfRC
         p5ouUc9+5j1QEvsfgoCRVBnz3xEc9mT6ks4lMuktMYdC6sMf7lhmW/NdCyTsssQsjRnh
         y59ATsC0Bz7aduDjE/cfydPHGTbZJAqn1h3pVuhRBSuVor9RNFq5rnt/SgOUb8JUDDDw
         /MYz1JIrGLZvyUnT+nZkzK0JtyJc7iI5jD7DkTX5oi7d8BJ8G96iS4aodienMW3MUhoX
         ccuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SS5pI7aS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v48si1395839qtj.147.2019.08.15.05.03.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Aug 2019 05:03:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SS5pI7aS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hyETH-0007YF-GO
	for alex.bennee@linaro.org; Thu, 15 Aug 2019 08:03:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35776)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1hyET4-0007Wf-Rz
 for qemu-arm@nongnu.org; Thu, 15 Aug 2019 08:02:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hyET3-0005jT-OU
 for qemu-arm@nongnu.org; Thu, 15 Aug 2019 08:02:58 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:39387)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hyET2-0005gT-CI
 for qemu-arm@nongnu.org; Thu, 15 Aug 2019 08:02:56 -0400
Received: by mail-oi1-x243.google.com with SMTP id 16so1593437oiq.6
 for <qemu-arm@nongnu.org>; Thu, 15 Aug 2019 05:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PKUnr/M5oGNx8UyDStGHIVSwFmorItLwHa5Q5q86s8k=;
 b=SS5pI7aSc2FDFB5Du2eyfXWc+iBZwvvd1nm01BlohJHP+X3BLtK/RWa+Obco4EKsX5
 c3aakMNrrBB/skr/7IXXiyx119UocyLTMTCRO2zdNNvP0+QRlpal4PVNlXWAI+l89Fl5
 J0r+4CxhCpciPN/fLBEKb9Kwa0impncpwPGMWQDm78SzX/qLHjZj6PoqwHyakWGMFwmK
 h8RTvqPWnRg5Ec0C0cxwEOQ9oS3vAysskyktjD4xi5sOLo1hVq5cFxUeRefiEz30RIUz
 czYmQNw5wig4M5md8SN/skXkxLWl8A8UaWb0LO+AkepYHR2GfpYX086wpjDL9LMxajJf
 ldsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PKUnr/M5oGNx8UyDStGHIVSwFmorItLwHa5Q5q86s8k=;
 b=KAS2vint+Cgx/Wzyc4d150GyVxoNFhRIqUcXnyt8KMa4IobmW0vgHuL6rMilh3tCkX
 8ZTcu2AGvnQMLzvIg5C3PbC07gfcpK6bWKwIdnEUHFj1RkUsSdmOanUOEj677r+4jUbR
 KwXfg4uB4xBKiSwTx0WHVjQWvoplhwgkxEQXsFs5epWAfTOjNPVq5LlpNSrpwiDCAG0R
 eBelB7CXIRG9+FhQfzSZY1fKELEbcU5idCXfQ0ZBNHCFWENwyEHItcH0ziP3syNECQM4
 S87bExUUnYsOtMQ+PTmd+0Uz9nwGLxo114n7gtPS/nxY6ZACvLvUgN5rfFDwhGe9+Me0
 XpuQ==
X-Gm-Message-State: APjAAAXmDaeZJwjUSikWHO5bCd8jW76SN9iYSjV27z2lDSoha8W50zzn
 NmTHA6aQkoNX+xMqkTMRmOXteg8kpwEdYlEqM5qRYQ==
X-Received: by 2002:a54:4718:: with SMTP id k24mr1155459oik.146.1565870573506; 
 Thu, 15 Aug 2019 05:02:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190808202616.13782-1-richard.henderson@linaro.org>
 <20190808202616.13782-8-richard.henderson@linaro.org>
 <CAFEAcA8exvd3khkNhw2JnJWHdkFH5O=ut7LvN9Tz5H0ZTg95Sw@mail.gmail.com>
 <0F6CB102-2C02-4A7B-84FF-52CC3E6593FE@linaro.org>
In-Reply-To: <0F6CB102-2C02-4A7B-84FF-52CC3E6593FE@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Aug 2019 13:02:41 +0100
Message-ID: <CAFEAcA9kVDa6ssbcqSin6QM-Ujf3iYe6VVjoaDrjtjzeHehdtw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-arm] [PATCH 7/7] target/arm: Use tcg_gen_extrh_i64_i32 to
 extract the high word
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
X-TUID: OSBr9dNXUKct

On Thu, 15 Aug 2019 at 12:56, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
>
>
>
> >
> >This patch is fine, but I noticed while reviewing it that tcg/README
> >labels both the extrl_i64_i32 and extrh_i64_i32 operations as
> >"for 64-bit hosts only". Presumably that's a documentation error,
> >since we're not guarding the existing uses of the extrl_i64_i32
> >here with any kind of ifdeffery to restrict them to 64-bit hosts ?
> >
>
>
> A documentation unclarity in that the opcodes are for 64-bit hosts. The tcg_gen_* functions are always available, and expand to INDEX_op_mov_i32 on 32-bit hosts.

Oh, I see. We should probably split that document out properly
into a primary "what you need to know to generate TCG code as
a target" (which is the main audience) and "what you need to
implement for a TCG backend (which I guess is relevant to fewer
people).

thanks
-- PMM
