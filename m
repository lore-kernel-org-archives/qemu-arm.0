Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp2483721lfk;
        Fri, 19 Nov 2021 08:00:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw+cY6gHHNIpi9pP+eKLB2rWpiLZuF/+9H7D5W09v8NzBne6uCtPYHfYwCnJYnsPzV244kC
X-Received: by 2002:a67:f1d8:: with SMTP id v24mr95464449vsm.8.1637337602333;
        Fri, 19 Nov 2021 08:00:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637337602; cv=none;
        d=google.com; s=arc-20160816;
        b=QiNrLd4ROhuhtB6Vw2M8ZZd1I29YAdpTzfCx55jd+LiRSgJifX9KLekE/M0jf48j6U
         SfW3VSvF2NSQBwiEYhN/LETIkMI+/GtWQonRA/KLugnFY+ziJ9M7pLQi0+1VsDKR6sVg
         G2T3IS/6oXO3saNgcN+PcfoPct5jbEHg3/8Ez2fXcFRETdHsCysY8itOQBQcq88SV+7f
         l7tGlk/JjDTqeaTc1MFaTZyyvKVzK2Nk6xxEwk/dB/GIA8Dy9M8GITYJkmqK2DtWWK6z
         +nmudJOyA/dRdS1PIS0VL9raLJVSyGT1Ih3OdToeTH1iEBogdxFaqqxFY431XZVE9qfI
         lNEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gcrDFHuhHCAcDA/7KoJd2hNKPC9YZDB/QdR0gjeDG7M=;
        b=Tk9c2TmsDBisOpryGcFeva9qMPmHutubi0rJZDei6J7u3vqskyfFM07N2HW9qSer/1
         DREy/llg+JfBsdXyp1T2szb43NQG+dQvDPeCVaKXJVfc3KWfJfCcmLle1fmcHxNOVL2j
         DrS6HSVtT65zIi8FCI8jbi/1aQxEdbjLlsqQnElFj+2u/vnuH1NwVNXdM/NXDNru9M4g
         Olh83NnI7nqcZ1sNiCjNBL3BVRSq613D5Vv0ad8kzLjQ3Mi/NQqaA4i0Xg9ddJ1J5Fgx
         LYDvt6cdtDM/blwvJTIZ4pJlPDtycxPr/YiyXTnvuvVyiAmB91KUeJ1IcmvVfuREvMp6
         L+6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FAaSCtoJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e5si567189vso.4.2021.11.19.08.00.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Nov 2021 08:00:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FAaSCtoJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mo6Iz-00029X-MP
	for alex.bennee@linaro.org; Fri, 19 Nov 2021 11:00:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mo6Il-00028x-2T
 for qemu-arm@nongnu.org; Fri, 19 Nov 2021 10:59:47 -0500
Received: from [2a00:1450:4864:20::336] (port=35698
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mo6Ic-0003Eu-54
 for qemu-arm@nongnu.org; Fri, 19 Nov 2021 10:59:39 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 77-20020a1c0450000000b0033123de3425so10890544wme.0
 for <qemu-arm@nongnu.org>; Fri, 19 Nov 2021 07:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gcrDFHuhHCAcDA/7KoJd2hNKPC9YZDB/QdR0gjeDG7M=;
 b=FAaSCtoJ9aFSf2QS5fgJE2lc1/wUjJYUFhAY3ndeTHF+BriNKADcNTtxLcKYUw3zyR
 T6drpOdlqn05k8R8/g4KRSkTK2iRBaO7nWDmtFS2PcPIdvRPbLTl8qUA+0qSVhXYE2vD
 yY64xBuLFOyL8wk9Wg76Af2JciknEJ/N6ywSu9p9feAMD23UQ/Abk1gl3e6OMsFpMRZV
 r076DqSekBJY1+oFwVC2OWM+zBGFqiWb+KstRvhQU0sqYt01qAtQ5VaUvmPew1o0imPP
 LAxOVMzxueiRmm6/H72ljoWoe4/+B1hkhpukgNzmMvfdN4/nbfIbY/gFO5ngtnVoAWIt
 3oMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gcrDFHuhHCAcDA/7KoJd2hNKPC9YZDB/QdR0gjeDG7M=;
 b=53nNQRj2FiELXTO5/OXVX8xOtFlg4o3QgQ6+L31qsXnTa3TgDmveP9Qz/eogAlEgC1
 5W9bfJnWbbkSY3A3IIfAa/aRln+TQnI+6jj0e7jYLDP1jftg/3STSgwDHVzSDsvEYUQn
 RLRr8l8hv7J6QZ+UN1CAexTZjstwFvy7siS430owPGW7HEBBYux4Ph+pjm6HoNYamkYK
 Z9Sd+2YuWwTvepeq6gqH9qcxx9zwX3Kr6/5bqc6422WzoHR1SCQwiY9liKv6JfYZPuMr
 L6P/MCpkr/7aIWcyzZpaTkPBFn+q391SSOPb4pqTKfIWu30CTFh3M2wzFuNnCFztJrh6
 +ksw==
X-Gm-Message-State: AOAM531aRVz+UwVqkYClN85fJam10zxDuXyXpN/ETt2/nhx9lgS1h28z
 QB+cbrDMv2tYhFQe64lm2RBQ5qnYQAlN8sHgnlMHKw==
X-Received: by 2002:a1c:96:: with SMTP id 144mr855784wma.126.1637337575938;
 Fri, 19 Nov 2021 07:59:35 -0800 (PST)
MIME-Version: 1.0
References: <CAE=NcrYJfjF-pEiX-tY7NfiTbDfXtcxnk5AnBVwc2AX4cpeCrg@mail.gmail.com>
 <CAFEAcA-CKqZPF8A+WsXE7gLgOPPYncteomvMSOcAuLEkB9F-Ew@mail.gmail.com>
 <CAE=NcrbPW4LVihnZksOCJ6NcQQYkwJudbqrp-sUEx663+qyG5w@mail.gmail.com>
 <CAE=NcrYPqu9oa0UZM7VRDtUqQWg93spVOdRLQGs0hdHtqghGVg@mail.gmail.com>
 <CAFEAcA_uzvNuMx9KJa=Z_Dwuonf10ekTDUbNf9bZSVa+hNtHLg@mail.gmail.com>
 <CAE=NcrY8GJZ-Py0n_24JDao0sJLcYoZ1TSK4RMLfkiWyOxPR3A@mail.gmail.com>
 <CAE=NcrZ3jU2K4a7tqhKxOSGpbEf=9-z6P1vhc=ep6JWXB0zxsA@mail.gmail.com>
 <CAFEAcA-pqkZ8DEC3d0yCeNvoeDtQvdf_s3+SpyeDdOkabCOXVA@mail.gmail.com>
 <CAE=NcraAxKOGGmOKDmugJdt-bzwpUU3dsWo1ZLuhNo6dr95JAA@mail.gmail.com>
In-Reply-To: <CAE=NcraAxKOGGmOKDmugJdt-bzwpUU3dsWo1ZLuhNo6dr95JAA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Nov 2021 15:59:24 +0000
Message-ID: <CAFEAcA84ForLRiAv68ASfuv_vamL-xyNGa1BS4Pp9SzpA3KwJA@mail.gmail.com>
Subject: Re: softmmu 'at' instruction support
To: Janne Karhunen <janne.karhunen@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tQ1Lt3tKAtcp

On Fri, 19 Nov 2021 at 14:39, Janne Karhunen <janne.karhunen@gmail.com> wrote:
>
> On Fri, Nov 19, 2021 at 4:28 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> > Note also that not all ELs have two TTBRs; some have only TTBR0,
> > in which case you get figure D5-2, with just the starting-from-0
> > part of the address space being valid.
> >
> > Big question: I thought we were talking about doing lookups
> > on virtual address 0 here? That should be using TTBR0, so why
> > do you expect it to be using TTBR1?
>
> I suppose I wasn't entirely clear on the kernel/user mapping split, I
> just did the second stage and didn't really care about what exactly
> happens in the guest. Things seemed to be a bit more complicated than
> I thought as bits above 48/52 were not ignored after all and made all
> the difference on the table selection. I had the impression it was
> just the calling context that defined the table to be used.

Calling context defines the "translation regime" to be used;
some translation regimes support having two virtual address
ranges and thus two TTBRx registers. (The usual approach at
the OS level is that you make TTBR0_EL1 cover the userspace
process's mappings and TTBR1_EL1 cover the kernel's mappings,
so you can switch processes by changing TTBR0_EL1 only and
leaving the kernel mappings as-is; but that's not obligatory.)

-- PMM
