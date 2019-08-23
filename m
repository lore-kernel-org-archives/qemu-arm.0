Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp527951wrs;
        Fri, 23 Aug 2019 05:47:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwFaSINv5f555DbvbwoZDRxrtOl3pyAm4UStpNF8D/kQUJ/cWlH1az+0SljltveOZdtdBte
X-Received: by 2002:a37:5f87:: with SMTP id t129mr3864365qkb.183.1566564474602;
        Fri, 23 Aug 2019 05:47:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566564474; cv=none;
        d=google.com; s=arc-20160816;
        b=mjjgpkiQwLZTzSo34U9Z7RvUEu82ZZPtXRvTKs8eWQNBB8nBsi0QbqFtMWLDp1qDPy
         KotB37MOHJj4Wkp0ZlUulVpd19T2w/c/HG18RjaSvqzi0+cYea63tdFnmLevWzMjcx/r
         WqFGSb571GrDEOTb0apIO6YsImCJQY5fwXsBYjj4idrp9vHJMYB4zUYh7zkVSuqYUe+8
         /E7YrfKq3wabmK5Cm2mAG/wYDPJvL3l+//HQPxUHKMT2NK0+JJruWQWItvKcPxS3rZqe
         QaqyjKvQL95/qNrK+vuhpKrfEf46uMJpnkj9/mIOX9Cc+DSEFmzAKuSxEjqEfvPoEfKE
         O5lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bqijAOUErtzwu0NCAtuZdqR7+GgOoRdedD0yhHDh/Bw=;
        b=EipqSj7FNlVw5/zoyB5xH5o1TpSYauFeUjnYHvCGzPPEf9VwZnWC/U3irLO42F/58k
         EhBD2uaa/CD7FVYNBEkU6ppDyfPzGK4katH+2TW2zX23BS4NTLENTFDPB6q9zJ7Gxi7u
         LEIkl3Ez6gOIpwDJBsRhwCAT7UHUzoyHK5OVgx/mlUL9zZGXx/pkDD3Esc351ozcmSDo
         HhHb/RYIXlpCmvl1djPLowt3g04EpQfgMUX2nmQHn17+mBvYtEXFPrSzfsXZXvcaRLyc
         tmJeN4xso5pbQH/g+PahYj2q9lhczs2by/dPmUfrxtYmTEJOiuli04DDOgqRROnMdxwf
         1ZvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FAFRf3V0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g10si1629754qkk.246.2019.08.23.05.47.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 05:47:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FAFRf3V0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i18yw-0005VR-2i
	for alex.bennee@linaro.org; Fri, 23 Aug 2019 08:47:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58330)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i18dL-0004Qw-7J
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 08:25:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i18dJ-0005oM-8s
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 08:25:35 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:32804)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i18dJ-0005na-2C
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 08:25:33 -0400
Received: by mail-oi1-x241.google.com with SMTP id l2so6871924oil.0
 for <qemu-devel@nongnu.org>; Fri, 23 Aug 2019 05:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bqijAOUErtzwu0NCAtuZdqR7+GgOoRdedD0yhHDh/Bw=;
 b=FAFRf3V0s26ggWTe0kFmAXg1HTmX2rPnVA8a/IaWOZ6m4v2r6982vdBGlx9mKm6RcT
 QkJoMH8p5hlmPJSc3mE/Ri8xoeF9gltxCZ/0zekHJCoa2nZPJUvdxmHNVY7y6br1BfVj
 NVxHOD15ih9gjkVFumAPS0Bze9z4UetKbW44MRHRsUQHvANJLAiN4cvxKyMcmoDbMuKN
 0SmOLR3tsrP5EK5Tw6rhyOyR+ILZJbzImtOGQb/qXncLznBWBioQnbpSN4bpB8h6IosY
 hTDVWshMBAUbPTY/AZryDdiSP+sJKWHfFn1pkiuXR2j6aNIQltZBdS7+pVqMdKYfCn9f
 //xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bqijAOUErtzwu0NCAtuZdqR7+GgOoRdedD0yhHDh/Bw=;
 b=ASsiqKPwpzgm0yuUW9IwGJXBp/VMvqYUgq62lWoLvARjYh1y5UTqYFN3JzvZKsevht
 HrxxMGfGR2Tl/5tgq5c4Ui7DqxAFdaC3goUkYSJ2RFLPOzJjixZrJK8z++/UNZSkdW2O
 Rstp43kFPWDXxW4vnBSDy7LDfK+yPxyu9f+JW4jPDmCTPPwKkQl4a4/tV10TvQMzTQGP
 vGtnH5Rz1c4lBmQemWisTG2CmHn079TFUYFISII7sc2gkmjvmbLWAq85zdfyzGzZVKrg
 bjgrEk8CxETUEo4HO+EHLdbOnXXdaGfrZoRtST8Wdd+huQFRQN7zaZcvepzO9mOQsjvs
 zoHw==
X-Gm-Message-State: APjAAAWljmfKSH3gK185sjGghC0e3Ac4c7uNS3CaKNX2ewzz+TrWaZ1y
 bTU4Tgk/XkgO2vMrn/zXQL1Ryfz4r/dK2tN+jfusMHpX
X-Received: by 2002:aca:4b86:: with SMTP id y128mr2913740oia.163.1566563131773; 
 Fri, 23 Aug 2019 05:25:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-18-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Aug 2019 13:25:21 +0100
Message-ID: <CAFEAcA-PbBqFuBww0VnrYHR1GF6xjakvu0sRrD=_umw3W20yUA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-devel] [PATCH v2 17/68] target/arm: Convert ERET
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lPIOdZd64+m5

On Mon, 19 Aug 2019 at 22:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Pass the T5 encoding of SUBS PC, LR, #IMM through the normal SUBS path
> to make it clear exactly what's happening -- we hit ALUExceptionReturn
> along that path.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
