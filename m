Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C84DC5516F
	for <qemu-arm@archiver.kernel.org>; Fri, 31 Jul 2026 17:49:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wprMA-0007Kf-Si; Fri, 31 Jul 2026 13:49:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wprM9-0007Hv-4I
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 13:49:13 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wprM7-0008RB-Rk
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 13:49:12 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-81ea0b7d137so11390357b3.2
 for <qemu-arm@nongnu.org>; Fri, 31 Jul 2026 10:49:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785520151; cv=none;
 d=google.com; s=arc-20260327;
 b=aNYqyf8w+HvH8FqMWqh2qgG9Q0t85y00/wH954Ay69LuQcHDzqoROBjgUppBUf55+K
 eJnZlsqnVqL8UgHbh0nHKAKzHnPcYOsQFnfxKrNLuivSgMNbxWb3N6zlZ8x6bMXzXCCY
 Qe5W5jk2XLUoRFl5VMcdC4cZpm0597h6vPWxVwvF4qdtb889SaSXTyWSf/LslmWnxy4v
 p9m/jM7bWPCfM9iOxJj7ibHiesIF492UBkuikMOdXnDpzN3KUSn2Z1zom6fq0iIhE+UE
 gTPaL/VthMC9NB0543sHHOEmIlpX8vrHW8D+/YEgfm2IaEUevkl38C91QhtqqKkIPrwN
 7MSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=tg3KSb9E5/pqu001+cu3W/Lq1boDE3D0/BkB1VuNc50=;
 fh=pOg5qPEW61BzWhWBQTnDlgSOSwJqd8svddMpDTxmqac=;
 b=WEyLB/1t9KIWsVaqu6oB6RrajFKXJcLXtJQYFfg5lUj9UfyaLn4uUr02C42/9OMVIN
 Fp84UyusbTvUHTrsHtxJHlgJEumIKZbHYtGjcdZcc+hbZ41jVSarl2TRwo/GQ2pBhan2
 KwuPiIocU5vLTLLMTuHg1kN67c8nj/NgAtaOyvidcspI4H4f20WCTxj18m9kBngetAA2
 9A0zaql7fyIYkYxBnSugQdIWGXsr8sp9Sea0skqksugUGfv9bMvLcM+zzrMZ/939CQ8w
 iRh2C3YEoe0i+lMGlku5dbk2FDWy2irUjp8ygTW4WSY+/8OX13mqU/J8AbQ7iO9BwnV9
 AfuQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785520151; x=1786124951; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=tg3KSb9E5/pqu001+cu3W/Lq1boDE3D0/BkB1VuNc50=;
 b=DKpep+Dex8OTXkRVosTwsfm4tmAJpQiekNde3aMJ6bVkjUKJhtMlVWGkQJB9HdVOWp
 G/rDeljvrfWe5WL0wzU7ZDViR/RcRmjk7xV0rVW/POUjKxC6imRQnUe8Dnb6UoHnLQ8i
 SwbNp0tsdka2lDgUVRKnFlKdAvKawLAm/FQpceLOGt7lMW/9PGPnndSpkO7yLiihWdDu
 4+SyK/BMHuOeve92kig2xWNWB5y5GP4qQ8goELmu759r0w3cahgZN1OX4CyownFNSB+Q
 iYaqpIc62T/UqkdBXZtDXyUJ6Alp5ZjhzsL56l/fXamMPTmx+okT8shUyTJwrn/CJvQH
 jWPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785520151; x=1786124951;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=tg3KSb9E5/pqu001+cu3W/Lq1boDE3D0/BkB1VuNc50=;
 b=CYJMWja+ZQMnqAMkAMpPIVB5J+HrxyZOJ4rjhJDC3nuTxrI2soV16c/vNKGQlb/O1O
 oyDFvYVIANoMqOjfuGGWPRfI3/6MbMiY13zqS0JKFYLKk7IaLhi+PvZ4wHpYjETEYSF9
 WZ1X/2MfbzFNQHBRVw3m9/JxKoKayypaM7VyFdtRxTZEyXjQAVLb0cm3iFUgMzL7aCwZ
 QJ2/FJ0ptx3YQZrzp9/sI0+2UfP4Rh4JdMucmH/CBbJ/Mbk/rfXWqqsCHYb7RL3eUC08
 IcY2lN1HLAthXIy18EaQPxrylsMSWDvrE6cJgS6pLMPaKf/48I0DCDYBLgeXuTh4a0yn
 W7vw==
X-Forwarded-Encrypted: i=1;
 AHgh+RopC1NwS8xbGYyoJWzkrh1oF6MGvRch2gLyH610W6i7qt7mrq/pNBYvttk2W0LqqLGwcNTMsx8idQ==@nongnu.org
X-Gm-Message-State: AOJu0YycI+tDdn1ub5H1ZLUBpMmAj6fySU91vijlS4aBXPsOUJ6xY5Or
 5YtICFrpmbPFSY9z0UPzBsr+hBu/4SzxThBh0tczYshu0oBG6X46eDWQJg/yRBXH6FR6KwiTNYW
 s79awQaQ1KAJcXbxF9cN2h5QPoNTKXm3iFnVNx/UJOg==
X-Gm-Gg: AR+sD13FoivZKsZxRYAa1cEWY+yTuXrfPlttvD5OErkMrG/uxNCLutxkHpNd7OrcIwO
 VuFnggjpC2b7D66EfV6zFP3XRFuDVMr6JXFQ9zYh5JliXONlYVrnhKDK2NNAidwT28rXmDvKT2x
 8ZWVqrU1cnNwAlmjyWVb3aPxehAsSwhwbp4FWlkTGRQ/Vh9SwhDWeyppuxVV39Ws4wvkyl7LlQ5
 y9rzc+8bsN953Vgt9YQWl4oa9IYJxLY87lo5Gw9xQYeUpWB7Zu27M9rarWXKdMg/e71L2+gtC3Q
 /CGSToZXfySdNe5lfnc15e2si1TIW7zVb9+Zvm6gWKInOc/1oaUywYGdIa8Fqcbc+yzi52078X5
 uUjZDcIWULTnN3R28kremoiuyySER
X-Received: by 2002:a05:690c:670e:b0:81c:c77b:3546 with SMTP id
 00721157ae682-81fd4b5a1fcmr10601587b3.21.1785520150569; Fri, 31 Jul 2026
 10:49:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260724031123.76597-1-richard.henderson@linaro.org>
 <20260724031123.76597-6-richard.henderson@linaro.org>
In-Reply-To: <20260724031123.76597-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 31 Jul 2026 18:48:57 +0100
X-Gm-Features: AUfX_mxGk2F8aSh_JgVQt-7gXRA-omlK1T6Zse-BobWTZnkcNJnAUhbBzMBme60
Message-ID: <CAFEAcA8z9R28Um+ympuZ7xcAJoCn-EBynxRN=SGmF-XT+bi-0g@mail.gmail.com>
Subject: Re: [PATCH 5/6] target/arm: Implement SCR_EL3.TID5
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, 24 Jul 2026 at 04:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

