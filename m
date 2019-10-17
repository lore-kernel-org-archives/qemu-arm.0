Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1005917wrm;
        Thu, 17 Oct 2019 07:12:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwtmI5OvyxvLVvkIs9yTNU4l+s3Tp6Fx7bpcQYTgpOir84xva4R8fEepAcy6XI7QGfWRQrM
X-Received: by 2002:a17:906:480a:: with SMTP id w10mr3697442ejq.212.1571321523435;
        Thu, 17 Oct 2019 07:12:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571321523; cv=none;
        d=google.com; s=arc-20160816;
        b=Wjf/59TpYx6zujZQhnU7KndyL3XHXnJpvqqZgM0gvuxgT7WwvKAwJ1gGpAFOT0H9ka
         WgSOb2JKqO92WGY6NFT8oLMFrUcc7gq/sN1vnQtNwc6tCe1aQh6r3aFZpXMn+gtZjRGT
         0ul3knIfvaMUBrrrsF4s9X4Hzrxl1sYTiOet2qM7xYiOZM1HqUAWYIszIm1+Cv/XgLlv
         o18+0sDKayvtLUSHwHu6j6NL3m2Q1cPiuXTYsjFFZiwmreYAs19yS9PNZk+35m9c2fkq
         fsphqyJJ8d79sA7vspM7AEn33o81itVoGYZxarM5GNA3JDf8EcgNsa42Mizo/8xlBiZS
         F70w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7d/+485lo6M8a0AMPPaFjTHJtJpL7YzBomI/jRF3jB4=;
        b=zgFW9n15zlciJ7kjPkfl+I7P5WUfdML4BG4GTSPWIxdqCQ1Byx1jQppfieK8pQs2SJ
         ZML2SfRbf5eCiD2funVxpwxljFhU+xZX/0fxR2ZOLi2HPCPLaBeQy5ArnXgDo28KJjAt
         iFBSMHM94oC3J8vXk8b9wlksH+LlrE3RIiRdIeOnDwWFWHqESJbdnIz/AYAt9Gv7/n/T
         +YaTRoz3gVYDgUb+/Nu7zLhEElO/IruGs49+bx4iMyimiGer25FnVt05lGF55bl/6zh8
         mOuTq6WiWjMoUPwbBQI+Q3c8faRo2LjI4KSNce1/kaPsJ8eB+h4JjTU6RR+0J9Xejwy+
         z7OA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WdGpMc7k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l8si1365278ejc.432.2019.10.17.07.12.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2019 07:12:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WdGpMc7k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iL6VW-0007O1-2P
	for alex.bennee@linaro.org; Thu, 17 Oct 2019 10:12:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36447)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iL5s5-00019n-CZ
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 09:31:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iL5s4-00036t-CK
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 09:31:17 -0400
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142]:36708)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iL5s4-00036S-84
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 09:31:16 -0400
Received: by mail-il1-x142.google.com with SMTP id z2so2037466ilb.3
 for <qemu-arm@nongnu.org>; Thu, 17 Oct 2019 06:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7d/+485lo6M8a0AMPPaFjTHJtJpL7YzBomI/jRF3jB4=;
 b=WdGpMc7kYwUpvkBEFbJ0/lX+0Sf5KzC9Zrh4XbuAjMREBaIt/iErPB4A9EYkKNSBzC
 SCGSbv7iivHbiX2PW4l5/L6XvOC5mzWv/whho4joevvUFyI6yMRj5QH6J/yihiU2u4I8
 UDJ0iCVVFB0slMVI0GM4QEp6gsXMoJpqB87BolV/i5anK0q8KyrZc/KkWDD+ysIMLfsv
 o06uWBNdLbrD9+K+8/pstVs4kWy/xoFHi9l44BbUTxSt7bG9tuwHAwdc95yVDSwiD0lQ
 J4DqG0R1eXXIejrRBMO9futPHr+Ep7a9LSzjhRkKptvMtYtTmw+m+dSE5Gff3sczS6Dc
 k4DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7d/+485lo6M8a0AMPPaFjTHJtJpL7YzBomI/jRF3jB4=;
 b=afXqqBvCjacwZC2/+BnaquHH06vJkpTZZyAfQZseF4qcoViuz2CMJ0ndxKtHLHU7lD
 3aQfzbWdoF1tTsPB0l5f6ydOQ/+4Cxwli7Jn1MCtXXqcZGfQsmPrIu+wfc5SNhZofVuV
 1C6fs1LN8NL3uNeNJauaQpvyjcMVLncUCPdBX6nXHq9z605jFFjnUU00fSawfPV/Sa8H
 2Z3PWpuydlsJWbuC3di5p3Ut7dluO9Y1DKU6PmSJ88/QNSL0HiLfCfrWTxeR0xW/Ecfy
 +hQlQVXDtH76C+Qn3zKvGpAhz0GSYfMuax1YdMXOYlUbi8QBMbLjq4JP7hcKhujrYd2N
 4XPA==
X-Gm-Message-State: APjAAAWCCvszB7wXqmZvFouh++byJwmBQe44tAO9HaQADJscNboXKVeK
 jXLHbdMaUVOmau/yrFQFqgMxyiY8i30VuziCtJh0PQ==
X-Received: by 2002:a92:1948:: with SMTP id e8mr3762268ilm.292.1571319075093; 
 Thu, 17 Oct 2019 06:31:15 -0700 (PDT)
MIME-Version: 1.0
References: <20191017132110.4343-1-peter.maydell@linaro.org>
In-Reply-To: <20191017132110.4343-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Oct 2019 14:31:03 +0100
Message-ID: <CAFEAcA-PgynTS2Tc9Zgi0ynes35Os4s0GQ2NnhUox=zk9eg0xA@mail.gmail.com>
Subject: Re: [PATCH 0/3] Convert ppc and microblaze devices to new ptimer API
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::142
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
Cc: Jason Wang <jasowang@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 qemu-arm <qemu-arm@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YWnoEj6asQJ6

On Thu, 17 Oct 2019 at 14:21, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> This patchset converts the devices used by ppc and microblaze
> machines to the new ptimer API. (xilinx_timer is used by both,
> hence putting both archs in the same patchset).

Apologies for the duplicate cover-letter: messed up the
git-send-email command line the first time and sent just
the cover letter without the actual patches.

-- PMM
