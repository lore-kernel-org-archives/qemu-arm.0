Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp302473lfb;
        Fri, 15 May 2020 01:50:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzht6T5ysSVwQEJEpQEVPb0yalqvG/Xj+PyL057ByBCTaNiYzw0kM71YP/M/9qoNviZ8miM
X-Received: by 2002:aed:2843:: with SMTP id r61mr2298976qtd.349.1589532600450;
        Fri, 15 May 2020 01:50:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589532600; cv=none;
        d=google.com; s=arc-20160816;
        b=ZBE8Dl4UEZf8vYXFz7iuwtXu5II8PSFK6yESlsD5vdzsUtYlTcQMRfzvwpavSL0A78
         rEE4u77ifn7Kt7c0ALutTSOrMgaMsVFpqeSQb/wBX1MtUTY8/dtQLFwwlLWelNLf6i3C
         K6WgpSU5wBUkYtMpcz1xC195368f2RoKZ9OKQcE5cpg8Rhz/ZR4F4dIvhsgKehdhVWmF
         I1lrNeZCrnU2cxJRVJQnwAH7L8mm9ASr9RFde/8iC8eGbmYUSWr9GjmTemCEkaLHVtX7
         5XGHfCMbEAtGrejEF3aBGTiy0DKmC6hEoPgya6ijrnxu6oEM0Mx8C7SCKg5gGWTwPbwA
         bcGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=ql+QW/dw5n5VhiaHTLZQttC8kEnVCnp17tzdhHjobtI=;
        b=SDD7+C2VFwL62Pjxafo0iaG41ZH45fAsCf/ZEK1MtQ25vkGXjNw5Q0pDGYs+ZvO9Nj
         IRIvsgOC2KCfcWBZPE/1ya1qaplz150vABbztVuy5apDvQVcMrttp1fLfLh6GageTFXT
         2LzzeBSF2+Mx4Lhve6GclOIia1kPd49nnFpiuSv5jDPKlZQt/VUNTuhDtUCCymlKkW52
         3nZI35YAAVSgTCzb9gvqOGvlMaXwfUCie6wYMJLaWtOiDlExsn2wAynAaTajZ4YrZTyd
         MokDgbjKpi97kJwq4PfoiylBTNN2qHW+4TJ+X8o9ub/h4tNGhPkgV9nnmu9bHazURc36
         i0zQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nGhoCGHu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f67si666514qke.350.2020.05.15.01.50.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 May 2020 01:50:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nGhoCGHu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jZW2Z-0003nz-UU
	for alex.bennee@linaro.org; Fri, 15 May 2020 04:49:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jZW1b-0002XB-6b
 for qemu-devel@nongnu.org; Fri, 15 May 2020 04:48:59 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:41006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jZW1Z-0003vb-Vy
 for qemu-devel@nongnu.org; Fri, 15 May 2020 04:48:58 -0400
Received: by mail-ot1-x343.google.com with SMTP id 63so1309855oto.8
 for <qemu-devel@nongnu.org>; Fri, 15 May 2020 01:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ql+QW/dw5n5VhiaHTLZQttC8kEnVCnp17tzdhHjobtI=;
 b=nGhoCGHuH0IT4IlBC/Rfq3u7j+YTHWs2ZTfSsZe4J/o/xBzvHMBIpr9B9XlxfQDn+z
 2RVhezRYp18MNkGGS8iYSsy00cGPrkm/N3/g6nozEfGvze38VXr/Y4Y+gHsIItvE1JkE
 KytdqLRlFscrRFGO8jOte/wjxjtEK1ScivCCSNPFEuFjABSNogtGXn4fwNgGaZiesKH8
 8EqMwQvWaX/xSZC3qoVMu4NbGol47WwPjlWdEtwrHbR7FXADLXGgcKUDv0Gvt8VfKnz3
 zOk3NevVBIWW7F1KImuV2LcuirWDtOsGaCOupNoaylGBD1JpOICpDpYUMHcs+ekw/jE3
 ISbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ql+QW/dw5n5VhiaHTLZQttC8kEnVCnp17tzdhHjobtI=;
 b=dk/7tox3+EFXfFWwHwJmIrSiSt9hMRL5Sf/PimQ6VKUPXw49JQCpAsc1yml81QWY9H
 yf0wUNqfFPCCkNSWNDdSYV1HqpgoMXbxQlSxrRRYNu9lAItRT5/T60DoYLi27Q3cPzXU
 7ZymWmgZ/1jzfh0SNnPjAvJW/ltiM59jeo49+yJybd3ISOzTCzR4x0d99e+vglzLdeZS
 5ZkSkJU9YNDLrnOE4j2ZLgG663jhYnuZDn7pr6zo/1GXakI6Wkr19d8AzJQz/A+yuAMF
 ntaPBMET0YGzVZ/nR/Bz2eeLy1/2vqy/HzBi7bkrkmUi7ruQDWhQCApXtShU40BC70DA
 W7Hw==
X-Gm-Message-State: AOAM530rnHeTX7QZenJVepk0xnMnbr+A6dRQMVy8gv/6iQkvitv+lPJ0
 F+h3JdRj2pSTdzaO1zRdZAaVwZHyQZqo/q1ljCHldQ==
X-Received: by 2002:a05:6830:1e4e:: with SMTP id
 e14mr1433784otj.91.1589532535548; 
 Fri, 15 May 2020 01:48:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200507151819.28444-1-peter.maydell@linaro.org>
 <20200507151819.28444-6-peter.maydell@linaro.org>
 <9a94c5a6-cbf3-184e-40f3-25b18052dfa6@redhat.com>
In-Reply-To: <9a94c5a6-cbf3-184e-40f3-25b18052dfa6@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 May 2020 09:48:44 +0100
Message-ID: <CAFEAcA9BR6Aajz72=vLwpASrt=Px3gdMu+VhS9m0LZxySgdMvA@mail.gmail.com>
Subject: Re: [PATCH 5/5] docs/system: Document Musca boards
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
X-TUID: VRY2tXmQLP4z

On Fri, 15 May 2020 at 08:56, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> On 5/7/20 5:18 PM, Peter Maydell wrote:
> > Provide a minimal documentation of the Musca boards.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

> > --- /dev/null
> > +++ b/docs/system/arm/musca.rst
> > @@ -0,0 +1,31 @@
> > +Arm Musca boards (``musca-a``, ``musca-b1``)
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +The Arm Musca development boards are a reference implementation
> > +of a system using the SSE-200 subsystem for embedded.
>
> Maybe nitpicking, but this sentence seems unfinished.
>
> " ... for embedded [?]."

That's the name of the IP block:
https://developer.arm.com/docs/101104/latest/introduction/about-the-sse-200

I guess it ought to be capitalized: "SSE-200 Subsystem for Embedded".

thanks
-- PMM
