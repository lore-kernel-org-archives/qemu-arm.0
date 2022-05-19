Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp1028720lfh;
        Thu, 19 May 2022 03:23:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNR09VQ3YxFFucl8GzEAFgoVBeYpEINywsZ9Z1jBjzwinPZhwNx7znEWpql8YLKB84HCRU
X-Received: by 2002:a05:620a:913:b0:6a3:4124:e4eb with SMTP id v19-20020a05620a091300b006a34124e4ebmr216245qkv.605.1652955832453;
        Thu, 19 May 2022 03:23:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652955832; cv=none;
        d=google.com; s=arc-20160816;
        b=mn/IppmCKU1GPcvKXQ2yWuQd04ZTpGFzipldYNPc7Ly3eFAw4gGmJxsdv3ukh0NEOv
         1a1mnjaFgzFF5cqQZeRctBFvmsaTFArCiYxeu5KPtWTTDbfl033XOVY2m/Mn2Jyb5Cbu
         ApBHgzfZYLgOBkqGsJvYAZKxv0Gig3k5CYWyYrXi+/Pu8naur3oL8JZUCkTmYlmyCI+v
         y8QyS7ktkpl6LEL0IDo3/UoyChqMUR5cU9hHw8uxv8nYeBWFURZ6rZ1b/UOiS8cKZjJu
         7NxB95TEoXp/9C9Hz1gqogB7nmIsB2S9NxtYgfxV64c3XRDWpq32jvoOtVIRPMd15LNs
         eL+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=6+mQg6Km9PCaVsSY0lD6r2PzVkIRrRIKWAQbDxYhNXw=;
        b=NeBq8glJcBnDK0hivXflpFqvBmjPPTQ5AwUdyIzXlZeIT+48BmOcJxSpW47sDIQcCe
         GCueaYD1Sa7w0sCGJ+8zOLzNmNF5Ysk043v1mibhPyGkx+ot2KChRFogHTZiAJX1V9tT
         6E4F2HlTNzk0/Xu+xKaRFK2yAbP8SK3Y4flYBjYK2tHh+C7Thk3sNo1QuVjXqRtIW19z
         mjkpAcBfRcWkTtyB1A2k9hyAPM21ARAPIOdKyyRemD7Soe4b1Yky5PUjKv+eank7l3aJ
         mx9RtmbOFqbfXrPvnpB2PckJ/pU6r3S9pMAg3GktvxHaGo9+ti7iMDSQb74vBUyOSAMB
         mBlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dx4gqTqm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k13-20020a05620a414d00b0069f92e72e59si573894qko.383.2022.05.19.03.23.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 May 2022 03:23:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dx4gqTqm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nrdJu-0006sj-Ni
	for alex.bennee@linaro.org; Thu, 19 May 2022 06:23:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrdJZ-0006r0-N4
 for qemu-arm@nongnu.org; Thu, 19 May 2022 06:23:29 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:40612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrdJY-00073m-0t
 for qemu-arm@nongnu.org; Thu, 19 May 2022 06:23:29 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id r1so8209131ybo.7
 for <qemu-arm@nongnu.org>; Thu, 19 May 2022 03:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6+mQg6Km9PCaVsSY0lD6r2PzVkIRrRIKWAQbDxYhNXw=;
 b=dx4gqTqm+x/JlMdflvLvuaFVWdnqNRDBJ5Z4E1RhKsJDG083QQs3NnGXlUknAil/Cu
 hJA5mYSniltM0EjrDQRAlbGH7SQcVjCSWoDqur0o3awmWbP9yJCgzYtf2B3ffl2T67Wy
 0/zqvsMEstQetU7mAy70J4mVB0DGWfqPPbkSVWt16mc6MIJIFp+/ELMOPUhvUdttcxwV
 e0gIL57PftKckJs7WoEeQfWcYqyWskj+GYz3PGRpsee6lDB9sPNI4EVeICLZay3M2B3e
 Pa5ptjLL9EUswKxE078OdLbXhCx3E5854oleh97L9ZDAkBKfTIp+z8I7CegdhClQgqtq
 30NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6+mQg6Km9PCaVsSY0lD6r2PzVkIRrRIKWAQbDxYhNXw=;
 b=UznmDHw9ucICuTL9wSkeeCirJT0ldMcpt0GOfOifXlXzJ17b9dwo1i4UJwtjAY4gr9
 F5WSknk5u+ahoZEUNteVsITBedxDkuSnfQIZmU2TWkBElBfr7sLnLCx09palX4gKw7si
 y4MB6wHcHgDpJpsr+JPGRld952TDKlT8U442CFZQ9Eb7yvEvsuX/sEsl0cS2jFuN4mVj
 jBpms+k+UE2EgmIfaWJUqNVjBltrIW0MKlTLsM5darOVq1RFWySLCQpkf4Pct1fKaaS5
 T4zz9RXyWuLjw0WXqdQvcNsk5FiuLyVhKKUcfXY4yqWm5q9419EksJm3YijcKyfOPEGQ
 H6Eg==
X-Gm-Message-State: AOAM5318ZKrd3NgoEzAxwjuEUSkAG7SXopXXu6Nu/TjHJN7smxDE2Oug
 E5Wj1Hl8r+38y7hQRhffI+QZ9R7torAItjmEboIN2Q==
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr3677564ybq.67.1652955806743; Thu, 19 May
 2022 03:23:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220517145242.1215271-1-florian.lugou@provenrun.com>
In-Reply-To: <20220517145242.1215271-1-florian.lugou@provenrun.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 May 2022 11:23:15 +0100
Message-ID: <CAFEAcA86yCAsdGroBUn6ncphnCZNTbznp2LRygMb1mtmOMO8LQ@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fix PAuth keys access checks for disabled SEL2
To: Florian Lugou <florian.lugou@provenrun.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ncw0CD4UYedU

On Tue, 17 May 2022 at 15:53, Florian Lugou <florian.lugou@provenrun.com> wrote:
>
> As per the description of the HCR_EL2.APK field in the ARMv8 ARM,
> Pointer Authentication keys accesses should only be trapped to Secure
> EL2 if it is enabled.
>
> Signed-off-by: Florian Lugou <florian.lugou@provenrun.com>
> ---
>  target/arm/helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
