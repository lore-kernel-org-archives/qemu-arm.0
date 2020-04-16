Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1880247lfm;
        Thu, 16 Apr 2020 07:29:00 -0700 (PDT)
X-Google-Smtp-Source: APiQypKzc8javAUAgX0n2ll/eGqVmw+cO6AxAk8ZfLhaDOAoK7bQgI/ooKlI+AWeen8kqKgqW0Vw
X-Received: by 2002:ad4:42b1:: with SMTP id e17mr10474707qvr.149.1587047340578;
        Thu, 16 Apr 2020 07:29:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587047340; cv=none;
        d=google.com; s=arc-20160816;
        b=kiqezhyZle8+rlV67kD8HfPhkCJnTEyoAyblFr/bRRfqal50P6nQGElCq/Yv5goaSg
         ssEYt8EPo7MlkHComEdweqDbVftjAxaxVbyNR2+DzHYjpsLs5bRyI381urHJkqZwTkcf
         NyEixhsKnnOGLl9cWDAbIi52m58EanfBQ4wqC3NtP8xKdGBi04d8T3QiW3OJUPsogeOP
         JUxFyx2H0g6C4BlQHHC/cb5Lc6Z2T80cBf1JDIm0e1k5hu/EzPO2ntcWfiCGh5dzfmzW
         XInaHbNKJUqy14ujA2Js9ZF5QElnRaV/F9y/J3e2lTRZVPjChGFecbqE99hA7OpDwPsL
         sl4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kJb0ObQnb0PelbvTX6UW4+KUHeJAFJy421iEdXcmHb4=;
        b=00uIjvqiOxmaoD4VTFgSyOv9Trdo23sYRsdgEFNYlskGQRu/2Z47HGoSv2sC3zf7KU
         FWXtWMnCWw4hsLjYFqHXzlhycyLqXkncLKF6DYtAWcbYZ4hqwLD2D2SzJ192VR98bKgn
         auw4Uoko5l1HAblkfo2JSmkSYfzKWVC9d82QDHveV/Kh1/1jEwX0xUZ76Yk5Ir1Pi5t9
         9abr+JbZmFRIthhBN2Ez9HE3Gm3E9c/v5GjQJNe0IHh9EKFWI2EugNofpoNADbpYw8ww
         G/s4f3o1fXKeUKZbFKivijkw7daj7xsDPMPr8l0c3gFV9VC+8Gvru4efNWvy4Sdv7gQJ
         jCMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iB0UO4rr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v187si11417035qkc.318.2020.04.16.07.29.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Apr 2020 07:29:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iB0UO4rr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jP5Vj-0003re-PN
	for alex.bennee@linaro.org; Thu, 16 Apr 2020 10:28:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41669)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jP5Vb-0003op-UU
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 10:28:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jP5VZ-0002Z1-T8
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 10:28:51 -0400
Received: from mail-yw1-xc43.google.com ([2607:f8b0:4864:20::c43]:46483
 helo=mail-oo1-xc43.google.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jP5VZ-0002Yc-OW
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 10:28:49 -0400
Received: by mail-oo1-xc43.google.com with SMTP id x16so689397oop.13
 for <qemu-arm@nongnu.org>; Thu, 16 Apr 2020 07:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kJb0ObQnb0PelbvTX6UW4+KUHeJAFJy421iEdXcmHb4=;
 b=iB0UO4rr/1zKr6b9r9DFP1rBmTnltIt505S4x1ZJbuUpZw9krfAojC0J8bQHvB/glf
 qoM92W9QBKqiL8bronZ4yUCKDiJWR+dO/70DhmKQG45MfSBqXmlv0uPF9Yb5Qk6Nt5va
 CrsF/IIIim4jr4+LgXjsCcO3cats6Ku50kkpH2A44TVW50u9a4qyMtP7zScyfoXRuWvq
 LJ5MkUriFjvkz4kQv5qwsacRzqZCvG9hOxSX2yjHTLCruFXDu1IyITIm3qWRtBOstdj1
 ICII7zrbKcqIVy7gdwT+n0LK0qkXtXz8/92tqYmSYaqarCxx0urjNXXkw/FjcD5FATLV
 FFBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kJb0ObQnb0PelbvTX6UW4+KUHeJAFJy421iEdXcmHb4=;
 b=JG9QRyZRPhlIu5wXYo0Avise0F+GSwo5fab1WRXAmQkB1Bt8UPdtTetMMonwQQpApS
 PsG/ZA7pHhQy0/u3EE/8i5m7RMPOSygDiq8OG4gntUirqh80RNnnkxwzx34hKbmqPeeh
 gOdxjyWN5pjIgr9TC5sj9v0UyW4omVSo6++DRojqTaPiiMbm5+8KwGjCjY5yvfBtXzTj
 BrDZcefnh7g+u7r6plbjxasGR7xqcIGT8ezGtb+tsxT+MlSad0jbRGh0wvG4JrT+Bzjr
 IuXZPApBMOAT4LI2Cqnd4Sg46VqReqsOenSiwvzvDvrDrMnhqW1DhFsw6TT0pG93uxFR
 RxwQ==
X-Gm-Message-State: AGi0PuZqdAM3AL4df4Umwdw+9fvWCYqK84JDpyLpsv/ePDmY02GgZkxu
 Ln6wo3QNCTpUUpk/HoCX7j2LEjd+Lb9U6D4jwJTohw==
X-Received: by 2002:a4a:3f41:: with SMTP id x1mr17174005ooe.69.1587047328832; 
 Thu, 16 Apr 2020 07:28:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200311064420.30606-1-richard.henderson@linaro.org>
In-Reply-To: <20200311064420.30606-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Apr 2020 15:28:37 +0100
Message-ID: <CAFEAcA-p1HRLU0S4Zgz6hEL1fNxDXpoCQnjiz7+a=T7yyEGQ5g@mail.gmail.com>
Subject: Re: [PATCH 00/16] target/arm: sve load/store improvements
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c43
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
X-TUID: woXh9C9zdjP9

On Wed, 11 Mar 2020 at 06:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The goal here is to support MTE, but there's some cleanup to do.
>
> Technically, we have sufficient interfaces in cputlb.c now, but it
> requires multiple tlb lookups on different interfaces to do so.
>
> Adding probe_access_flags() allows probing the tlb and getting out
> some of the flags buried in the tlb comparator, such as TLB_MMIO
> and TLB_WATCHPOINT.  In addition, we get no-fault semantics,
> which we don't have via probe_acccess().
>
> Adding cpu_probe_watchpoint() allows to *not* stop a first-fault
> or no-fault load when the page contains a watchpoint, but the actual
> access does not hit.
>
> Having these available means that we can handle all of the watchpoints
> for a given set of loads/stores all at once, before we begin doing any
> actual memory operations.  Further, the actual memory operation on a
> page of ram that has a watchpoint can still use the fast path.
>
> Looking forward to MTE, we can examine the Tagged bit on a per-page
> basis and avoid dozens of mte_check calls that must be Unchecked.
> That comes later, in a new version of the MTE patch set, but I do
> add comments for where the checks should be added.

Series reviewed; I didn't bother to flag up the checkpatch
complaints, but I think all but one of them are legit, so
please fix those too.

thanks
-- PMM
