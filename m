Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp458837ejf;
        Fri, 23 Feb 2024 01:54:57 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWU4lvVEtNNa1Vij+9rsY2XPHlg3dj2x8rOkCjdLScnhUnQYraLPUykk3fcWFu76QsHEcTSgEdTBQ1FrrpDpolYK8EvNSrk
X-Google-Smtp-Source: AGHT+IEj1TbBebb6ZEfGQZJn2yJJspE8CVMChH8+lumc6A7U92CeIrF/O7NZJF+oxBbnawRZ8QWH
X-Received: by 2002:a25:1846:0:b0:dcc:1449:71ea with SMTP id 67-20020a251846000000b00dcc144971eamr1491123yby.50.1708682097462;
        Fri, 23 Feb 2024 01:54:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708682097; cv=none;
        d=google.com; s=arc-20160816;
        b=MfW8JLnbIUtQ67tJO5Eq3Fw35lhAOYTAcHFT54sBA4F4Lgikwb2nmeW9n3qTZpoagO
         NU5oSzbAl4YHSrYdAxuJ91/3mu2/cQUqF3CsRoFRnPaETVLpDxcwRIYBr7bkLRoa3est
         bIZaLz1sI+1xs/MG39s4YK6if+zvVDZQEUm6OyR3JtrseDwnQdZpTsJ0G5Si4kZDf8hS
         Eo/FLQBenJHWH0ditp7hOf77w0NdRrxGjQxk+YqAh2/6n+0svTPiBaMSaWyeyVF09M/E
         ikUn8XRm74bpDX1Kj0Xd00RD3k4afUcINoAdHJGJrsIEXMf9lw9SigWLn796DXhG4DQt
         /ECg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=UfSa1JIPQDgOPcjSwttNa4K0v5842px0GxwssmihDe0=;
        fh=s/7rU05GOkNzFqUzkfujwtN2mdjJftdkFqYIuxcB5X0=;
        b=WGKCSD5PJMPF0YaNtZDNB+8PP+JZ++FAYrIeGcU0Pv5XhqaW16wGr/D6Vp7jEsgwXc
         wrCNXpoHCzCJQ47IL5YJE0UuXx49kAOmp/3rSflCjmcxs4OyTbnJnrfWrvTUyNKdEZYZ
         lWMEG+vbIT1zt5BEgxaZfbgKEKCR60nTrGwejXZgt9B48W7cP6FY8FtphAap4jFU1OcX
         zvqeZuxvrWH+txnq4C6X9wd1tEriZYbjgl4FJHZtr913+PhRJhCoYsPMzb4Wua7HHEtT
         MaE2JNyS781C8aTUJmaFCHt3hk7PxbGsI2ZUQaejiH6rZXggXD0G35yxAYW8YgtgDvzm
         avrg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MH3MMRpP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t22-20020a05622a149600b0042e67bf0ee1si250634qtx.650.2024.02.23.01.54.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 01:54:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MH3MMRpP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdSGT-0007X8-EU; Fri, 23 Feb 2024 04:54:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdSGQ-0007Wb-B1
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 04:54:42 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdSGA-0003WZ-Hi
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 04:54:42 -0500
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-563c0f13cabso200747a12.3
 for <qemu-arm@nongnu.org>; Fri, 23 Feb 2024 01:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708682053; x=1709286853; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UfSa1JIPQDgOPcjSwttNa4K0v5842px0GxwssmihDe0=;
 b=MH3MMRpPGwqcco/7TDFd3x3XD8wGgv0hxE7hXJxxkQn7OSv73Kfl16SV0Jm/dYb9gc
 FKW0KnrYtN0+hEpb19ejJVxAnCy09Bk3BYneB3MJK+KwYbL5kVDY6cwZB5tbl6J475o0
 cSoft3Xwqw37U//ceXuw5Uhgf/AIVbWrEuj9PJv786VkFFPOL0xpmnW/wss9g08nh3RP
 OlPvQN4lM37CTbvmdLSWo9HJZciGPnEqJyBrlwwH2Ana3UCRYnkdoSrV91IDbG1tsCvy
 sE76q+gkAmspJ4q2FuzgU8LySdUBLUtLHXXzIGsoFw+XTJzrztQrzbh8B/tSrtpzfarn
 jeDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708682053; x=1709286853;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UfSa1JIPQDgOPcjSwttNa4K0v5842px0GxwssmihDe0=;
 b=fy6Mm+ugJEsvYszlWIW5C2L4R6X5UfQeoRyrkMHNZh5PXsY9WimVp9rEV/UrqIMeGW
 tDKNQwDcDazhTy/EmNn4uc/5yvQle/CbvbpshlUdZsblhi+HAEBcRcjuzVdOYcKIzHlP
 WMPoF9nn1DbgAGDNTGl/X/O6DftIAJYILFacri5w5pzr9W8qppOCJHLwQWRKgLxbGj+a
 49LwG+5h1IEMBN2aPxWDxb34PCiif8BHfkjEPElnerS/xFW+cavxgueIf5qB10tPeJk4
 roh7mvyU1yoGeoH9qui8BNmkaLXGEuUvv7UXnAxT1SPya45I4TcUk717TD09YXxJB0kO
 DEag==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9Pdd7Y8ceUlCjdBL0bC8JuUVlrcjalMsjoLI2h1YvhuNYAGu2MEOK1w7ZMMgsEQjkXftw+jRaUMf3AcT+CMWRLU9C
X-Gm-Message-State: AOJu0Yzp+q+yHgAzjgkK0Ke6e/YpCHDzJgAy6Qe4D3O4sA87LMDhIyNX
 qT3TojrbCpM8BCAvLKR+SmfYX/6uW3gMb73nN6kmgZkDguAApAUfzeVW1IrVc/+X44bnU/2IHNC
 VUq0aIGqIJWBeGGxApBupJjVdMAel+Dd4WBQ9L4sYambhbnHp
X-Received: by 2002:aa7:c990:0:b0:564:e278:60d2 with SMTP id
 c16-20020aa7c990000000b00564e27860d2mr856753edt.2.1708682053226; Fri, 23 Feb
 2024 01:54:13 -0800 (PST)
MIME-Version: 1.0
References: <20240219011739.2316619-1-sergey.kambalin@auriga.com>
 <CAFEAcA-Wir3M7dVV5247uMPxCtrYs8j4Z3S7nucCx3Ha8pA1dg@mail.gmail.com>
 <caf1110f9e9445cab3aa00ebab24d263@auriga.com>
In-Reply-To: <caf1110f9e9445cab3aa00ebab24d263@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2024 09:54:02 +0000
Message-ID: <CAFEAcA8uDn6v+6jTDY_wbSmcFq=5Rao8LB=ce_RU8GCtuHzq+g@mail.gmail.com>
Subject: Re: [PATCH v5 00/41] Raspberry Pi 4B machine
To: "Kambalin, Sergey" <sergey.kambalin@auriga.com>
Cc: Sergey Kambalin <serg.oker@gmail.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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
X-TUID: 3O2Pho1TL8VO

On Thu, 22 Feb 2024 at 18:15, Kambalin, Sergey
<sergey.kambalin@auriga.com> wrote:
>
> Hi Peter!
>
> Sorry, it wasn't intentional.
>
> How can I keep the tags from v4?

If I reply with a 'Reviewed-by:' tag on a patch, and you
don't make major changes for the next version, copy that
tag into the commit message so it appears there under
your 'Signed-off-by:' tag when you post a subsequent
version of the patchset.

thanks
-- PMM
