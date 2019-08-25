Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3146629wrs;
        Sun, 25 Aug 2019 14:14:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwpoPr8Dpv2J7UbzlDWSJ8+sbm0S0lWLbaMDE52PqCF0BvhlvNS85yaYPr2woAmyvcssGco
X-Received: by 2002:a17:906:f289:: with SMTP id gu9mr13927458ejb.257.1566767655725;
        Sun, 25 Aug 2019 14:14:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566767655; cv=none;
        d=google.com; s=arc-20160816;
        b=dLJywltUvcy+Z2aOUzPxtVuBOgFUIdLydcjirOUWnZkPiYe8eNDQKX1TWlEpfoAEoQ
         +KdzxKJtRBp9wMEEbR9AI/9FkaLq9dTMHynF7sT+C4K8ClD49bZ4YrGqHnoTJ+ETBpG3
         wTIieXZNZePnKeHK6Q9EPxqJvBR/YhVSGqNT148DvJOlc+EqNhQUfzy6p/0ZuVBmM0Bk
         CJqCkBr1wkPQ7LP+vsBwEt4fBZshYZoSEh4YGrwpH7LpJdz1h53zdlGSNfyYFDwS4AQK
         m5q2UMDtbv6xh7g1k935BYBP5wKYmK7Fg77YAGUwqnKVqN7LF1tR52n1L86EQHXYtZWt
         c8vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aTIi5UmlFrMFRTckXDC4yF2EUayLCeuxRq7bNjSu0Hg=;
        b=VkJ/dzaRIyI2n2I8CrnBC3DhCpefy324O4oZf3zLNmoXcaeSXOw9ws+T/EkW3wVOcz
         Lz72WpQortcXyzJiQsNVFCvC83u6NNx6Swgj9aSlebvibU+zxLyxRI9tNMCWjpQQDGnJ
         gr6fC+GKClO2CUwBf8rIt3pg4rbRmIhpHcwNLgS6W7WIWzBduAu+D8+u2R372hPxgyE/
         wEgJIykTI/Zl2JZkfWBqsJKXw/FGFXMVdb5dIPuS7E0W4tab2k07iFOclxefCaBNxl+b
         gI/54kkRm3KtYICYXUvKhURHxGOyWG/uRw4Tj8dcy+MxlgTiij5x/K9mejS57vfr3IYK
         y5EQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=H384J6iA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z18si5608972edd.11.2019.08.25.14.14.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 25 Aug 2019 14:14:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=H384J6iA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i1zq2-0001an-Nt
	for alex.bennee@linaro.org; Sun, 25 Aug 2019 17:14:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55119)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i1zpu-0001Zi-CE
 for qemu-arm@nongnu.org; Sun, 25 Aug 2019 17:14:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i1zpt-0002uJ-De
 for qemu-arm@nongnu.org; Sun, 25 Aug 2019 17:14:06 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:38465)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i1zpt-0002th-95
 for qemu-arm@nongnu.org; Sun, 25 Aug 2019 17:14:05 -0400
Received: by mail-ot1-x342.google.com with SMTP id r20so13394818ota.5
 for <qemu-arm@nongnu.org>; Sun, 25 Aug 2019 14:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aTIi5UmlFrMFRTckXDC4yF2EUayLCeuxRq7bNjSu0Hg=;
 b=H384J6iA4/qONLPPUAZKUHjLuGr4Sye8sGnh7tah/8/M4wf8xRvhIM/wvgu2TOn1wT
 IRlpR5bp4YjyAPaUP06xOeJEzwHpHl6SYpzMprgYx3eCGqQ4S078cbeTqoHs8/mFE/XH
 zBO8UBBXN8/jLFzrunZ4VDAyDM9gXfTxntFLt+g1gVIMX8WWEE30MTmAcmsz8lH9iCHG
 esaFKWMdPQal2xRD5BDb/zKDnUgHpd7TOnWzVykwQyBEN94EbBCuyHnd94rtjacoBKrv
 FgKXjRMgBpjxSjTAfY+IDNrPdpfMrvTnzW8tO9Qfa+zT7/mNqJHQtwwJz/DZw3vJzNp7
 lvqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aTIi5UmlFrMFRTckXDC4yF2EUayLCeuxRq7bNjSu0Hg=;
 b=QiicCaquN49YneMDhxzXYrV/Qqt459BF6XAS/H/UUEySoudTDHaUMzE83Q3e5vziLH
 9653VSpKKmFpcQQTnPPYtsGCm6l2E0Csic0NNJAKnffys8pIvFRXcy58OT7nT7+/lbR4
 5uuC95sFYc07kBsJoFSkkQndKDx+sSs1/RHe4A+93FgAaKetVku8gZyQ/uQacT7fDVQh
 dFr8jD8e4RaSACeXqUzAtkHWYi+ZslG3JRBUTfYbMliGOfj4WDNkmc7k0PoYMhQ1bBoE
 TX6qPvAoKG7Ddjv/cNTXGMi1hDVtl1WL8KC/DgoTuiFxY3/d72iPmSgPIR9IvFuDs2zp
 rNDw==
X-Gm-Message-State: APjAAAWMgZpxAuMgUq2WqIEEYcCsTzI+70AMwvpZzqnLj3uE/A6qJ6eD
 mp7U+sHV7mARNWUk5iPMToJnnythg+Z8t/3kskOnsg==
X-Received: by 2002:a9d:5e10:: with SMTP id d16mr2107413oti.91.1566767644345; 
 Sun, 25 Aug 2019 14:14:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-47-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-47-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 25 Aug 2019 22:13:53 +0100
Message-ID: <CAFEAcA_Ff8aWy1TL3nT0OxQ2=0CiBayDouiWDmF7h_Nf5EV3fw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-arm] [PATCH v2 46/68] target/arm: Convert T16 load/store
 (register offset)
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
X-TUID: T4OQUf0rELun

On Mon, 19 Aug 2019 at 22:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 51 ++----------------------------------------
>  target/arm/t16.decode  | 15 +++++++++++++
>  2 files changed, 17 insertions(+), 49 deletions(-)
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
