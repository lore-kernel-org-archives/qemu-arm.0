Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp876003lfi;
        Wed, 25 Mar 2020 10:35:08 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvaoGCj7YCfOmdKDE75fri6AD+15rGj3LiOEszb0jl/VgIX3RJk8658ZARVhSzDCN8/1iXT
X-Received: by 2002:a37:817:: with SMTP id 23mr3739564qki.221.1585157708520;
        Wed, 25 Mar 2020 10:35:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585157708; cv=none;
        d=google.com; s=arc-20160816;
        b=M2Wohs0uQz7MCKG09wfk5Kll9nUluowp8zxPfFdVaPgV6YBxuWUU1eYrGUnf4giYf7
         71Rup7s6yv3CzCHrNEUFx86gXOLrUkld+Cjt2m2IztRDWG09oz0NtPi1Tty1Nf2vYXJU
         0iKFwM7+HMaMIIcSq1HHsUnufNIVn0r4Ms+LvWGSAkvQy1nynXva6iCVvh7gIT19PgOw
         RQRGJwFTTBMGOGzlfzcFJ4T3UG3klcFeidJXVkU/CDwGetM9DqHw9GZT/NzAnA4Oo9/u
         YkzC3kOgDXksExOIVZ0TvtHeAYrV1wrC2mvD/wlHJdHYMxNoB+Hw+lDC70DRPOYCtFSK
         mFug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=b0OnLCWvM64m5gKXHzRMVXF5dHlaSc79FQsmbEFFsu4=;
        b=QVr49GryFflRHUdt/Dw+bhppUiFzHgC4qAxtkhtBMIMi+3H5GkzivE2g7s1RRTvOb0
         AVuFbogiwcPxF56hR+e5azjp5OWwPwywSTg8n5nZdg0LMPL73zkbcxWShQLAPmNXSXzZ
         7zGkan62radIf3oJ8O0IHLPIMOjyvyZcMthwCTMEQzNsWPlRW46YCpcJsrXAZS1IBCGk
         ue6rvjhVCQvoaRodO3lPb7CMh194cYRP/H9PrF6Ohf9XfAjAJh+cxcrIyCRkJs4PUBIc
         dVXbIcIekXV2euEP4bdHMM/HWozatcw6K5Nh/GNLN7oKAs+uLEgPMnYmssM7qvAYvp2F
         umHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=C1Z6pNdv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d8si10310827qtm.248.2020.03.25.10.35.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Mar 2020 10:35:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=C1Z6pNdv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jH9vo-0005DA-0e
	for alex.bennee@linaro.org; Wed, 25 Mar 2020 13:35:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60933)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jH9vb-0005As-23
 for qemu-arm@nongnu.org; Wed, 25 Mar 2020 13:34:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jH9vZ-0005Kb-Pj
 for qemu-arm@nongnu.org; Wed, 25 Mar 2020 13:34:54 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:39117)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jH9vZ-0005K9-G9
 for qemu-arm@nongnu.org; Wed, 25 Mar 2020 13:34:53 -0400
Received: by mail-oi1-x243.google.com with SMTP id d63so2858750oig.6
 for <qemu-arm@nongnu.org>; Wed, 25 Mar 2020 10:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=b0OnLCWvM64m5gKXHzRMVXF5dHlaSc79FQsmbEFFsu4=;
 b=C1Z6pNdvSItTGgZeyhNyHULNYgBoDGsq02/U+/B/utTE5RUjqyejof07G2XRvecC+Q
 PkpQBvY9KF1KrS0ZzUSQU/rsc1sxnjZH2fg+zHWE/AbmWSzIBErw3fzYf1RdfCxxpMT5
 6fd29wVqKxDPsys028YFHaa6LboyVdGtIqve15nvmNwlNSH6qxyPEVZxM3g5oWBIVRDq
 X27+DXKgoimA58vwVDzbvUapJPsc7jtwbBU1McuM1TTw4tfp/7MxD9eGN9Z9LsNYMGSV
 bhzWh5TUwB7V4SboN80lXDx5RQo8ZfiSK3ussgHb4YGm1hAUq2WdOOlrXZ3AumPRM+Vs
 oXIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=b0OnLCWvM64m5gKXHzRMVXF5dHlaSc79FQsmbEFFsu4=;
 b=CXTy+5sFKyHGF6vydoP2E+KVegOySM4fEuyh6KX5t1JqGK5Ojt5MU+L9PpT7ykHURr
 o9QzPLAVH5MbsitZf8i4KDnDgmc/DIHzBFSt/iJWnOlPBIz7thid3nIl9kESBi/C6rJ8
 iweNg+UhuvTN9non9KoOqogsQ0O1jjQuK0B5FYilfEXyTDCYxc9o/pD0LKQZ+28DtudT
 LHUAadoiexPsxiQUy85RGH0JdkOYhb6fq9xHiso9eeSg+uIY1hLloQf+RQpqpTccni1y
 +dcju/XSRDZ94uraCOOj8Hql7/ASQvybE0Vbc36EPdWSgyF/NGwSyUscvap0HuQD1xtJ
 dDgg==
X-Gm-Message-State: ANhLgQ1WYpyXHWNOwKLTpKorquup2Gs8z8Gf2zKpiX0KavC8eLlQ5+yF
 UxbtYYn5cYfYJSNP+EZ49zg2NgXv1sGUpQ47aC6OKA==
X-Received: by 2002:a05:6808:64c:: with SMTP id
 z12mr3181490oih.146.1585157692306; 
 Wed, 25 Mar 2020 10:34:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200311040923.29115-1-gshan@redhat.com>
 <4c32dbe0-7d96-5e60-addc-b1bf43e17f47@redhat.com>
 <da34a58a-0474-c46e-7bbf-cb150bddc717@redhat.com>
In-Reply-To: <da34a58a-0474-c46e-7bbf-cb150bddc717@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 25 Mar 2020 17:34:40 +0000
Message-ID: <CAFEAcA-kbsdW5p6j6gCt48kZxXtFNM_bO8jH6_XTrFLh=QGzwQ@mail.gmail.com>
Subject: Re: [PATCH v3] hw/char/pl011: Enable TxFIFO and async transmission
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Gavin Shan <gshan@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yc1+5fuPoeGC

On Wed, 25 Mar 2020 at 15:56, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 25/03/20 03:32, Gavin Shan wrote:
> >>
> >
> > Marc-Andr=C3=A9, ping. Could you please review when you get a chance? T=
hanks in
> > advance :)
>
> Or Peter; generally arch-specific changes (as opposed to fixes in
> chardev API usage) are generally reviewed by arch maintainers.

It's still on my to-review queue, but then so are a bunch
of other things. Stuff for 5.0 is currently taking priority.

thanks
-- PMM
