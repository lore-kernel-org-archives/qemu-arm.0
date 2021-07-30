Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp525563lff;
        Fri, 30 Jul 2021 12:50:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6US5KhTvKUSURBVw7xj1kc/Dz7fPTH0cA8CUbOlzLDx/gS6HtuQ8yZTV6fmrcY28M9K0H
X-Received: by 2002:a25:8489:: with SMTP id v9mr5493739ybk.477.1627674644492;
        Fri, 30 Jul 2021 12:50:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627674644; cv=none;
        d=google.com; s=arc-20160816;
        b=TFpNNGTtL9N7s7NBk0BajublNRfAeEXKfIuXdaLzBBk16yMcoCUIKoi8Pi17zUIfDH
         Y0KERMO6bRcEHHwl5xKrQnkTSpnFD110+f9MGBBGebIAD2dHpCSYbbKW13Res7TDZnQV
         MCIEmB/a0KThdmYfRAWVyKRQ4GKkY92LzRT4EKUNOABJ11ajMBhDhm67AeKXz1YJzCC7
         E4JIsTgRiGpktss4lQMeZkxIPv872hA7dlIoCDgdPKfF+ftbJCnVIwcNkvG2SUzYNtBh
         lFnPSywGY1fRG5P/V5Wa91hM7m2Cbo9G+9jE87nnZnoTL1ImVC9XoEsT9ET/pPL2eSct
         o1yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=bmlIp+0ON9Qts3yqUGeH75l1oWQ/NEKpeZrMW4pqUZQ=;
        b=RawS5/O6j5CXkC4+pFrvIMg6Yf+0bdY2ThalPFEd/hANJczvfKxS5m1h/Y4ptsBWvn
         jEMy+tbgRQFOGR2acbLD+o/zngY3O2BurnCiLBas7ZpK30uCovZW4GTrmRXQYFaH8FBJ
         Gr6KjAVD1B2RIXeCbkkgE1sRk+2ZJ7la/MrZQVmODtzMI+jlKAsNB+qJzAmaTFZ6yA+H
         tFpwLqp3gSPcex+Kvm4zy8CG9g5AbkXoPEhBZnJGdk9p1WoHspBqUxvuKU3zGluMdB09
         FHmq8exsXtJDbY1t9D8x054y7OBxOLJadQU1ebjvU8Sm7ukLbef32YtHgnGNiHenFpzn
         43Dw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vPJUWtBj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q18si2831979ybp.33.2021.07.30.12.50.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Jul 2021 12:50:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vPJUWtBj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m9YWp-0002g1-GJ
	for alex.bennee@linaro.org; Fri, 30 Jul 2021 15:50:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9YWd-0002eV-2R
 for qemu-arm@nongnu.org; Fri, 30 Jul 2021 15:50:31 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:45983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9YWb-0006j8-I9
 for qemu-arm@nongnu.org; Fri, 30 Jul 2021 15:50:30 -0400
Received: by mail-pl1-x633.google.com with SMTP id k1so12311917plt.12
 for <qemu-arm@nongnu.org>; Fri, 30 Jul 2021 12:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=bmlIp+0ON9Qts3yqUGeH75l1oWQ/NEKpeZrMW4pqUZQ=;
 b=vPJUWtBj5WoR8EYQdYENAECx3R1qFrWuL+1On/ddB47XR41Cb9kb3szY5hysGQtKlX
 v15zickptdYgiHGla1JubVyzwelzvT9/lWEJTUGDAB+AFAkd+s8iZGqyUDx2IJfCGjgC
 Vy6dPiALpWh9NXwJVVbPOwCLoccJuFWFMpyOQm19qCuEzIo2y45/Zy2mah5nTpOB0WDB
 id+FoGkZV6ITJSfDqY0IKRC1tnqmcrDWHPnlkxWd8Xm+4/7njzVq9096QRe2ZuA7ViAa
 CPrectVq6aNkqX/HJBPpnC9NSQ5gMsNmtiTm5VAj3nNsvuGZJ0K5v3KWB1qrXAuUYwTJ
 UbIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bmlIp+0ON9Qts3yqUGeH75l1oWQ/NEKpeZrMW4pqUZQ=;
 b=EnkpP4klja56/yku2usr0v0SUE+Wg+jj5/AgNrjQrWYsUSxO3OTaOC0GxvAOKE434X
 81xKMjC5Zb9MeRrW4Ls5b6oKkQmYztRzuVeGsLXgQ0UVAVzV4kgVeM55MfXbwruJYbCy
 FI4mrCPrCEqcf7hXCL5bu0FhSJnMRcgjMFAXzPbBUQUoI/Ylr035fSd7UKF2vAYl602/
 eMhLrsJymqNkFqvGc9KgRFtxUSqQhGOJpq/eAC1/l6JrYiWHKrbiDhGxeEVhoFSgVxdp
 8sUYGnm3wbEGBB0EH0Tzu7BClFBbddHDNnwDduloqSR938OIP9+9ohuPBi28HfY3u59Q
 CLfw==
X-Gm-Message-State: AOAM531F+nOkhCVG7JKenBgGzvqhfIW7DOx4T+thKRUWgTaCHiaRU3Cg
 2P/AuP3b+gq2Wkx7UJwEgWfPWw==
X-Received: by 2002:aa7:921a:0:b029:2cf:b55b:9d52 with SMTP id
 26-20020aa7921a0000b02902cfb55b9d52mr4264439pfo.35.1627674628348; 
 Fri, 30 Jul 2021 12:50:28 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id s20sm129804pji.51.2021.07.30.12.50.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 12:50:28 -0700 (PDT)
Subject: Re: [PATCH for-6.2 41/53] target/arm: Implement MVE VMAXNMA and
 VMINNMA
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210729111512.16541-1-peter.maydell@linaro.org>
 <20210729111512.16541-42-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b525a3cb-1809-28dd-3f72-0ab51b5d739d@linaro.org>
Date: Fri, 30 Jul 2021 09:50:25 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729111512.16541-42-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0PM3c+LL4RSI

On 7/29/21 1:15 AM, Peter Maydell wrote:
> Implement the MVE VMAXNMA and VMINNMA insns; these are 2-operand, but
> the destination register must be the same as one of the source
> registers.
> 
> We defer the decode of the size in bit 28 to the individual insn
> patterns rather than doing it in the format, because otherwise we
> would have a single insn pattern that overlapped with two groups (eg
> VMAXNMA with the VMULH_S and VMULH_U groups). Having two insn
> patterns per insn seems clearer than a complex multilevel nesting
> of overlapping and non-overlapping groups.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  6 ++++++
>   target/arm/mve.decode      | 11 +++++++++++
>   target/arm/mve_helper.c    | 25 +++++++++++++++++++++++++
>   target/arm/translate-mve.c |  2 ++
>   4 files changed, 44 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
