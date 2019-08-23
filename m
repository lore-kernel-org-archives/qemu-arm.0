Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp499967wrs;
        Fri, 23 Aug 2019 05:20:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyIgMZwKb6YVomGXcc8rWnkX/s7qptZV/t09GDANrZU2RsfwR7iefl0V5+fVausiSH+jxdr
X-Received: by 2002:a0c:ee87:: with SMTP id u7mr3619270qvr.118.1566562809338;
        Fri, 23 Aug 2019 05:20:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566562809; cv=none;
        d=google.com; s=arc-20160816;
        b=NuJmz2lxNqgtNKPS1YrZ9nrRKT3yMA3cc8LhIB64K/t6v9du+yttE62F0hOswuOvRm
         7waXd6nCsrQclCyCWgwtwv/SkX8ty2mKAbdApHI/r2EmIjOwWC+JDtYo6/4c6gvYVGv9
         DRiC97mVuHLlAytfqhNqF2bRjy0kpJmtRDGN2WEMV7q9UaoXueiihaQHPxLzqjr0pDA5
         2o4XKZhvcTktHc3LYZgaUdOgh7oYnhD1z3OgEYlvan5As5BmUMNlNSS8QIO9W+SwgiI2
         MO4B3fTW+Y0GDz/8AP/P6qGNK0o2tnWriPwfrF0BTnCCJBGyJPJz1rVrVBH3mZ68ojPM
         ovCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EDFjzMZB/tEMJxBQIka91gbQDjgWB8klAFTgQcdJ79Q=;
        b=NYoZudgI1LLDkleKAg00v98FByT+FtITPqtrm4Ky9AB3BV91HVEi7+ZOuKEC4Ii+Ht
         oeWviXfHKAf5N3v82Z+/nwMz9wD+oen8l2LIXQdnEN3ANQrHv9CE5rBTmQQqEaC2RlLa
         AT7LPhsdADhSpkKCFP5vvB/ExVb6cOqVgMaaIEAk+EkJK5KIkBFP7RKK0AqCGB7cpsk3
         v39KbCeeDgVIYo5xwo8XLHmH/3LuI1qM3K3v09j2PODKAkIXtBI/Z3gEocOvezn+H/7e
         LyjE63zG9/oQTuYRoMskwUHvmjdw4Z68S6UdpSi3bMapRBHdrYc22w7hZMhQL3BHljRD
         I4wA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jWIGl7oO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f37si1936759qvf.17.2019.08.23.05.20.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 05:20:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jWIGl7oO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i18Y4-0007KV-D6
	for alex.bennee@linaro.org; Fri, 23 Aug 2019 08:20:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56861)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i18Vi-0005pb-CT
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 08:17:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i18Vh-0001LU-5g
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 08:17:42 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:39655)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i18Vh-0001L5-05
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 08:17:41 -0400
Received: by mail-oi1-x242.google.com with SMTP id 16so6830368oiq.6
 for <qemu-arm@nongnu.org>; Fri, 23 Aug 2019 05:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EDFjzMZB/tEMJxBQIka91gbQDjgWB8klAFTgQcdJ79Q=;
 b=jWIGl7oO1PMZl4HSFH0gBeuHm877eiqxDNiRFqUPsoBxBhZXKGz0H1//JtUOhFrWAK
 TwtF/FjuDTZ4XlsTz8oOw2KKyA8UETbVGXCb8gRdMeAA6EgYK+650IKuGwg61SvY2eMo
 Gd4RsOufpLmJzebPngBOvKNorPaQc0jpCdHZG83lfb0aCgx4mjvUI8Qz2cj349/p+oWz
 L+whuZNIfeWjULrjkXKvb0q/olR5+xlIIhPbZi155h1IU617+nBI8tWC1eemIq0+KPSy
 6GgkInjjbDfbGhfGVfO//TuTUZkXRhD5hKCxyECSvsxImOH1GebgUJ+50d3uYq+W7uUH
 0oeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EDFjzMZB/tEMJxBQIka91gbQDjgWB8klAFTgQcdJ79Q=;
 b=taZShE7Q9H3O5tyZiYrfEo8Qc3Urze/wzQjPgKbbGvlgwUxDZMMKcv4prhDntPaE6N
 l4DjugME0mmwZdA1H2/Xumbl4qxxYEH0TTXqerqsG84eG8/MXZFq10P667Txd0iMUB/t
 TeGNSn8CAsw1pCPySv0BJhhRS/88TnUQlnUl4/LNhXksJukrHyzzaw7vh8imIhbFelXO
 SFehKPW5M/RhqREUBCjVIfhsUaNkxjHFbNhTclZmvFju+fxa/rkQruwXcCN39ii0sn0M
 f/VjAs/Zf4+ufdtOG852WfvOsrlLS8v4/Ah/+XkVKhYt4YWY4V3X0QlKJ15aIshTe3es
 C6Uw==
X-Gm-Message-State: APjAAAUoLkG3iwwCncMdVfGHGkphBrFZdnhZ7F+lzuaHPqa45x9Gr5mz
 2dLgk+tbtsbykyv62A1WC0AY4J5Bowhbr4aCjAygZg==
X-Received: by 2002:aca:4b86:: with SMTP id y128mr2894127oia.163.1566562660102; 
 Fri, 23 Aug 2019 05:17:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-5-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Aug 2019 13:17:29 +0100
Message-ID: <CAFEAcA9bSxhjjY-98SoT=buAsji1oc_-dg2WEnkfu-MZV6YN_g@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-arm] [PATCH v2 04/68] target/arm: Convert Data Processing
 (reg-shifted-reg)
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
X-TUID: yBWCoYZBncKF

On Mon, 19 Aug 2019 at 22:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Convert the register shifted by register form of the data
> processing insns.  For A32, we cannot yet remove any code
> because the legacy decoder intertwines the immediate form.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 74 ++++++++++++++++++++++++++++++------------
>  target/arm/a32.decode  | 27 +++++++++++++++
>  target/arm/t32.decode  |  6 ++++
>  3 files changed, 87 insertions(+), 20 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
