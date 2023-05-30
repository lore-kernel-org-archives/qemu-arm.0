Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2137841ejb;
        Tue, 30 May 2023 05:29:53 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ470m1A3inE/br+7yGmwR4T7cGsMLMb0npXDRLzoHhD3xhJ3w460lg0ATXXJjyckmJzFwkH
X-Received: by 2002:a05:620a:17ac:b0:75b:23a0:d9c3 with SMTP id ay44-20020a05620a17ac00b0075b23a0d9c3mr1926190qkb.25.1685449793543;
        Tue, 30 May 2023 05:29:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685449793; cv=none;
        d=google.com; s=arc-20160816;
        b=jexdv34mXyjND337/g42BXUpHCEPYyzJQl6wkggqeoha0do6yDjLrYlkZCoT3Tfd23
         tpfgL0AVyB4ctv+y5u3UUC6+f08v/3Ac7fsDAaCNRTHk0Z20ffVkRQ8YXRhA2bcB5QTV
         Cpswqs8gDvivgENEJ52NNCT69Dhf+jKdst6KkAqlw7N9wEA4pDaPRnwyj1eGscdcyxOS
         gYElK4Ds/KlB3uRzjTfdKdR/C2zMRmnWVeQ8Gv32zwz76CFOm3VPXPHb0U9yqblwNia+
         b5XpSuGlE7/i1R4gec9kgawy0DMIa5Y69ljC8jk6aYceq1g6AmJlRfdwAKqjU3i1Sh0y
         LbuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=IJHjy7EvRW6rB6ywYV3fseC3hbDe3gWjmarVrItmGRA=;
        b=zUhjS/TjEhscd5Etwu04bOlExpYQaNuMyiN3dCIsHalDDzinkyJJto/P2x47geMnB4
         pNKewM2Ld4Y7owbEDn5jOHn9xwNEwtzvL1ysxt44U8h+fclUwlgFnvhiAm/Ufl8ExUx1
         kilcxM0pzfJOHgLQm6vsMeCOfEQliCmdUxLcyWwxlA8yIxxVSdBBQSASTzwMxaIvgwNE
         EfXVFYW8o0KBhVXo0erUtdQP47TJNfz+cMyCgGXkDbyiBSLg7qQTX1ZyHkt1l7z6IWWa
         QhSJG32/dW/4VHVjGJhWy0OfKzHR5YJq/pXJuHXoBfruXWkUZ7RUUUhLp+88f2a2F2Am
         T7HA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=El2JljDq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k16-20020a05620a143000b0075b2f840af1si6046669qkj.391.2023.05.30.05.29.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 05:29:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=El2JljDq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q3yTi-0001yx-8y; Tue, 30 May 2023 08:29:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q3yTH-0001gz-Vt
 for qemu-arm@nongnu.org; Tue, 30 May 2023 08:29:05 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q3yTE-0000tP-1v
 for qemu-arm@nongnu.org; Tue, 30 May 2023 08:29:03 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5149bdb59daso3574439a12.2
 for <qemu-arm@nongnu.org>; Tue, 30 May 2023 05:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685449735; x=1688041735;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IJHjy7EvRW6rB6ywYV3fseC3hbDe3gWjmarVrItmGRA=;
 b=El2JljDqMB1II2GsN6qpdoC3QEhXbNbRx23gH0cIo7SMxiwbnswkBsoB6XTgtl+THH
 gEAzjC+ecm6sMN/DvI3A420l6KOuyJ8MxTQeRuwFKfM3sAlgZGQWEZ/oyEBT22XT+zLI
 g1xhCb0ERIAum+nz67Qq94O4S2BQZvgHzBl8uiJrgHTJHuGLl/K6weHe6rdvivF+VLnY
 gIKoslutbG1cIDZgppWP7wwhMgaPSonvEkVjLsSFB0b1G2DK8Z2B8CHhBSCYWf9aLXhL
 c+V3PTp+h5R2be5bxQN2Y2yfvqHn44x+9xROf0WiD30vZwH0pFa499XCdYDfi1yZuzAo
 dnQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685449735; x=1688041735;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IJHjy7EvRW6rB6ywYV3fseC3hbDe3gWjmarVrItmGRA=;
 b=UXuXNsx+1jbqeND3Zpr2ukmI24Ys8G41tULZ6n7ojSPkKwhEq0gSX3bcYsH/AbPQiF
 vcxw92FT0ZqxTwvB4hdx5iwGCMXrT/T9e53UpwokAOoJhx1xp1r4k+r+noNuEGAlaXOq
 t94cOEz2MglXqKlIQ7PB5OWXLRFnVt6vxylg3p1elYgy53HoaEescOOa63UL4UxhaeAv
 pyN1mFRK/khtBWd9LE6i4Xnfaye2FfvqNlvvDN/eZJ09tRiRX/LRWOWVYcEcy1aOvJp4
 8HnA64Xx0fruwAFWEQot38ecGwz8TWKVP2tLjD4jkgLYKaTzFT5FerFzgmJlM1g3HIku
 8JeA==
X-Gm-Message-State: AC+VfDwbI0nz8IL0ROTnl/wfpPcjjm1uHqr+kN5HDqfDyEnTPRJEaQYD
 kes3H1YOA3iYnXMZyKzIZV19Qgp6hzfmRI0iwFNpjQ==
X-Received: by 2002:aa7:ce04:0:b0:514:75ff:6a86 with SMTP id
 d4-20020aa7ce04000000b0051475ff6a86mr1504796edv.29.1685449735573; Tue, 30 May
 2023 05:28:55 -0700 (PDT)
MIME-Version: 1.0
References: <DS7PR12MB63096EDD683DE70EBC472E97AC7C9@DS7PR12MB6309.namprd12.prod.outlook.com>
 <DS7PR12MB6309A170F8BC7D7C956D6C97AC7C9@DS7PR12MB6309.namprd12.prod.outlook.com>
In-Reply-To: <DS7PR12MB6309A170F8BC7D7C956D6C97AC7C9@DS7PR12MB6309.namprd12.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 May 2023 13:28:44 +0100
Message-ID: <CAFEAcA8+hq3zvnowmxN+7FKv0FFu56VbA1WUTnDukGExpFS0Nw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] tests/tcg/aarch64: add DC CVA[D]P tests
To: Zhuojia Shen <chaosdefinition@hotmail.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: VNkNyaUZeuV3

On Fri, 19 May 2023 at 23:12, Zhuojia Shen <chaosdefinition@hotmail.com> wrote:
>
> Test execution of DC CVAP and DC CVADP instructions under user mode
> emulation.
>
> Signed-off-by: Zhuojia Shen <chaosdefinition@hotmail.com>
> ---
>  tests/tcg/aarch64/Makefile.target | 11 ++++++
>  tests/tcg/aarch64/dcpodp.c        | 58 +++++++++++++++++++++++++++++++
>  tests/tcg/aarch64/dcpop.c         | 58 +++++++++++++++++++++++++++++++
>  3 files changed, 127 insertions(+)
>  create mode 100644 tests/tcg/aarch64/dcpodp.c
>  create mode 100644 tests/tcg/aarch64/dcpop.c

> diff --git a/tests/tcg/aarch64/dcpodp.c b/tests/tcg/aarch64/dcpodp.c
> new file mode 100644
> index 0000000000..6f6301ac86
> --- /dev/null
> +++ b/tests/tcg/aarch64/dcpodp.c
> @@ -0,0 +1,58 @@
> +/* Test execution of DC CVADP instruction */

All new files should start with the standard brief
comment stating the copyright and license.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
