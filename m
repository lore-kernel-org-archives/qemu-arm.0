Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp3960473lfg;
        Tue, 11 May 2021 06:04:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/MthTIMPB8aZUKoEbulLEgX+wI8XTKgVi6/r7R4TQfzOrCEI+NbUKIVnTzJCWmrmqqXk8
X-Received: by 2002:a2e:9e98:: with SMTP id f24mr23793376ljk.442.1620738255867;
        Tue, 11 May 2021 06:04:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620738255; cv=none;
        d=google.com; s=arc-20160816;
        b=A/fsr113CZPimdTDS6d3ugouK6NNssawTUYTky97hVGLuAXOsfM0O3SAnyRsxSTBMO
         bfcmy/uaKO8p4mDKgWr8WWGHhQ6kKdmfD95yIXwt0EyHqNwsWPyKWMl1l5nS5CWul82j
         zcQuWsUJu8Pm/nphzbzeuptE8aZNSZig+QPJNMOCJduz2i8iDStp9fJ3RWX9IP+Dvr82
         a4YvwMq/bVrhiKsZfpghoIdnC7LwwVmkxRmNkeNDEWl0dgcWrvEYS2G+QitweCtD6/Q3
         vI/2btAw3CrtKNF/QhmfL98lQjcWSdxPzEKZX4xL3tYb3I4MoVHx57TeTFHAe72eMeM4
         9soQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G0c1JpvEDRqc+UHNhvIsDN5GTFnLZ9YqQOOBcT7j6Zo=;
        b=YSmCdnzfONUfAU6PEBtj0T5tH98XUpnFpZ8/KrIjRYPbJJwM2AmEkgKF2gfVbimxmx
         4CkNR0lvaF+6N6jKmVfGP90Xtj9prbFZBaYd5HFBTtPrp8PdVlQth26cTU604HOEyPVW
         oOXal2XTVUHQs6ECbHMzotZXtLCIpqqC++el3qYJiikpcfqB6PGp2R+gWs4wKJBoYd6M
         aUzDuu0elfFDVkQZ42PjsHO8CMVYuxYTcGaRmlRhyj27YwQDOZK4oI2ky/czIB2RYQlL
         D/p4eA6A87K0pSxc1UrO7QzCHKjW/OZIZdXGRbAsZbKJSJRij8X2lypivUfjFrFC/9PC
         GZZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=e5cZQxwe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x2si24670765ljp.212.2021.05.11.06.04.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 May 2021 06:04:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=e5cZQxwe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lgS3a-0000ud-Im
	for alex.bennee@linaro.org; Tue, 11 May 2021 09:04:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgS3J-0000u0-Fo
 for qemu-arm@nongnu.org; Tue, 11 May 2021 09:03:58 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:40553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgS3A-0002ma-4Q
 for qemu-arm@nongnu.org; Tue, 11 May 2021 09:03:57 -0400
Received: by mail-ed1-x52b.google.com with SMTP id c22so22755815edn.7
 for <qemu-arm@nongnu.org>; Tue, 11 May 2021 06:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G0c1JpvEDRqc+UHNhvIsDN5GTFnLZ9YqQOOBcT7j6Zo=;
 b=e5cZQxweiXNPvwbel4L0t0hH3785CuAi376RJ3bvk8D8sf2NRO8aPBgJfVCj9A/3Of
 iGBveM4up/r8sx7Uf5Y1CFmbv3PdVjvS7FAn6Brj1zG3ZHHujX1/cKW7cTqmAaO8S/Ls
 XiJzNAW3DBghNI4V1vRsDVyYqdzvVe4gsJCRdPGcC5+vInz+J06x/9snwzUzCN4clyZ/
 afs1RfsZ+57zsipBvGrLmfJDmfjfSUJaq0sY8RT4sKyyoNa0olzrlqsi25Mwo5iiObH+
 Mug1WitgrwEygIW/PdGjoapEVhdTpsYTL3fzzjIaYG8TzhIvcpEzsK/FyR4CNpAe5qlH
 Z1xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G0c1JpvEDRqc+UHNhvIsDN5GTFnLZ9YqQOOBcT7j6Zo=;
 b=nQhH204qjCxLNYIDY0EA6XcCNZx7Pg4EBj7OC6gVJlq5mKCfTH7f8uWHvBGp1xxSS6
 +PFrrivj6FBamZ9POnXvI7GPYlGbLDpPtgNlUKuVuq8WFvu10GinJSs7RnTtWiZ1QAEt
 3zE67zIPKBzYDeL+W0l8KHZOGm8qxVbF5R3CT4gQE0wq6q6JA6crOpCIhlw7L9wkzE/C
 iGuUx/Ieub35q+uW6FkmxKYUhQaik1wx7kSYtQtymMgio+lnp4sxHaNdHMwwVpCy382r
 gtnP/Um38eiw/MmbY0b+iRZt0eL2xqwHp3GTwv5LpBZm1xejlIZPLEkP/hPhcBFxIV3s
 pMJQ==
X-Gm-Message-State: AOAM531jus9JB11RRrN7PtOsKa7RljWE5eLZgZhOaUdTgRVBUsKVrj5u
 DXv9KeKr/UO0jAnX7ftrZn/szd5EyN0xPBs6JCYEmA==
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr35654415edv.44.1620738226556; 
 Tue, 11 May 2021 06:03:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-19-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-19-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 May 2021 14:02:34 +0100
Message-ID: <CAFEAcA83Gsd=WeqTGUWOSJwHfPaip62gBw1Q1+XXnzs6Xcxn_g@mail.gmail.com>
Subject: Re: [PATCH v6 18/82] target/arm: Implement SVE2 complex integer add
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-TUID: zup5ZuPv1E9q

On Fri, 30 Apr 2021 at 21:43, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Fix subtraction ordering (laurent desnogues).
> ---
>  target/arm/helper-sve.h    | 10 +++++++++
>  target/arm/sve.decode      |  9 ++++++++
>  target/arm/sve_helper.c    | 42 ++++++++++++++++++++++++++++++++++++++
>  target/arm/translate-sve.c | 31 ++++++++++++++++++++++++++++
>  4 files changed, 92 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
