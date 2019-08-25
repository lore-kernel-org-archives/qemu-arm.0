Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3155633wrs;
        Sun, 25 Aug 2019 14:30:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxNbsAcAjIsTApR/ZxAVVbplhPv0o4L4aD3VQcVbxbqyA9YEpDdahoyHR7EwWbfjCvf7fNG
X-Received: by 2002:a05:620a:1276:: with SMTP id b22mr13490411qkl.24.1566768624306;
        Sun, 25 Aug 2019 14:30:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566768624; cv=none;
        d=google.com; s=arc-20160816;
        b=cSbfuhfsPmHBf6eGsoBjVdDkgja3uO7TigV0xIQXDAS5JGBj1xLUr+h69n/6qYq4JI
         ZVeRjwpDV5DQ7RW6/5qOrHANvymiRi4gCIU9kmbxK7peEBRUoH8bQ2k8fO0ocBLHuT4J
         WvHTDfmZDP2lWl4xwqfYZ5+UQPF6KSCPbNqmBTIbAb1MO5KW2dkGpdENv52rgN32w9GY
         urnqDRut9HoXUAp3RciHcprgLcz4CHAbxPOiuGhLlmBrAef866KxolrhR/wxD1DkrtPT
         oY65EhN0UmFgX8oqwbjhd62XcJcOxF/tPwt2wxy9OroeX85zS60WI+o0lgXs4IMtFQi1
         PXaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mcbXfVPDRvMruywUePiDxdyMGKE+qItIEXNxFhjrMTQ=;
        b=0DqNzynCSDG0hF0Qb9ri8e1lHEgXCJp3teY6dF+MdWfiQ6h4bUH1x91gPvqbyHHCVA
         A8zsxFp1J8hhlABbrG2kIXcnuzcaCmS9R7hyo6Rl6tvZ58zTHTjC0i1IdvGKiRiI2QYF
         XVb+EJWiq3tO+9z56jl1g7oinJiyLKy3wg5bB2N6BtPORtKUpyXA3xzQ0iSVUboQrTDQ
         RHOEzbSGHHYB4dIBIow3M3tmvpstuRwf8mccVLCZzXJvK5Sl2Pa2+P9dVBYuU/7s2Wg6
         GKrvTKPV+3hQt/qJNpvL27+1A4yjhmeu8fTCEW9MY2ahDwSsMyku/7iD9Ma+BKrNM+4M
         04DQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=R6tM3Lli;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d6si6084235qke.335.2019.08.25.14.30.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 25 Aug 2019 14:30:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=R6tM3Lli;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i205f-0006zy-Ho
	for alex.bennee@linaro.org; Sun, 25 Aug 2019 17:30:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57044)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i205Q-0006zh-A3
 for qemu-arm@nongnu.org; Sun, 25 Aug 2019 17:30:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i205P-00059d-B7
 for qemu-arm@nongnu.org; Sun, 25 Aug 2019 17:30:08 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:43889)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i205P-00058a-6W
 for qemu-arm@nongnu.org; Sun, 25 Aug 2019 17:30:07 -0400
Received: by mail-ot1-x341.google.com with SMTP id e12so13410089otp.10
 for <qemu-arm@nongnu.org>; Sun, 25 Aug 2019 14:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mcbXfVPDRvMruywUePiDxdyMGKE+qItIEXNxFhjrMTQ=;
 b=R6tM3LlikQl74iYiweMFCwEuXyy8f3DDKcA/5Vmbx+z/NpNdzN6DKwlfFTPj+Ar9gh
 dTlES2KdWhMqgZGOHpNoCym5b8w8S0QxdsERBH1JXu00hJUHDzjZ6T2PHS2ObEvjVzxU
 LNRnV1nqciKHJt8K1KnyRyEwxYkghHqOoiGgxTdaowA4BCGaL+3F1mejMsAf//xIH0LU
 ewnPcm/yKS3N27+qO789ZNlma+vIIy1dMLjzHgHtyt9zB6hTlpHEgVqnvr+rbsFoEKnd
 VdtFyrb7s0e+0YP2qKkJYB/nkKqIMKQnSSt3i8C6XAE+yJaVMtmQ4jpzcC8xO+2FYwwP
 knsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mcbXfVPDRvMruywUePiDxdyMGKE+qItIEXNxFhjrMTQ=;
 b=t0en2ZT0tS613dQ0AC/7mZBhOlZduES02La5R8LAyg3mk3MmOuxok2Fgzz0FSoGOdu
 b0lvQa4gbCH8XeUh99bAO1vFNtehAFCVZkyAz2502aX8vCPCE4qhGXhM5czxZtvcba56
 vSzyoMWw7MIjF+8Qt1wD+FoZN6R8tMzZ3sjB5Eig6g1W7AytMdmLKxNuWzHKLrSmp4Ne
 LgbOras9FuYUBFTXmuzyZyhKI8egUfBRE1e7xuTUKrV4wrJif026HlGNTRiqnFy2s+zk
 LYsEnMA6e0AA3IPIm9wWRWPDlC8dOz6gXN30C3lAN34Ocgqs9Nyg5VyQ+Po/v9fV8FWY
 rzzg==
X-Gm-Message-State: APjAAAUTC5Kggg5pw1iOALhlNANFcJR/dnXZY/+91+QhCGfOD2vCYKkz
 k9h2AfJv7x8x6InFN0fYRwbPiCT/2CZzqb1Lh/BvXw==
X-Received: by 2002:a05:6830:1015:: with SMTP id
 a21mr13254810otp.232.1566768606273; 
 Sun, 25 Aug 2019 14:30:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-50-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-50-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 25 Aug 2019 22:29:55 +0100
Message-ID: <CAFEAcA-FKwBM0LQ62NxK04hJAxSqHcNY=Dkhfr5uHr7LP0ooow@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [PATCH v2 49/68] target/arm: Convert T16 load/store
 multiple
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
X-TUID: S6+1QmmmdFDf

On Mon, 19 Aug 2019 at 22:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 48 ++++++++----------------------------------
>  target/arm/t16.decode  |  8 +++++++
>  2 files changed, 17 insertions(+), 39 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
