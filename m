Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1268344dyc;
        Fri, 4 Jul 2025 07:54:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXwOkoeXJJWMDlgA60bxQoEuNJ+NtLba+Wows88PCY+bc+EJyJwTMjtRV5NFmdgGlNBmPj941M3cJHAGA==@linaro.org
X-Google-Smtp-Source: AGHT+IEtY4rYRzZ045o95jlyuvu9hfjQ4DLED+jOuwcFWqS5FlI3MLIBApkqibeVphV+mfh2r49p
X-Received: by 2002:a05:622a:248e:b0:4a3:d015:38c0 with SMTP id d75a77b69052e-4a9987f984emr37257551cf.37.1751640880754;
        Fri, 04 Jul 2025 07:54:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751640880; cv=none;
        d=google.com; s=arc-20240605;
        b=CRR40MZm1T6u1zTnu+ZPalpfpq80jd0wxUUqy9WF5pkCZgtXo8BUJ6dZEjysiN1Upo
         k6q69c7c9nG4aG1MYliAwm1QULYlKgru114dWdC9WIQDZ2ERrku7xJy13TBLfLfjSIqA
         yD6Y6d3bc3bEJDjoQgnjCU9IIsSFmqDzAKrQeuIOZ4xka97GpKNuuyI4Yq0MYi9q+Ht4
         JgbEeNjrsHCcO4V6/iGLdZQ5tZ3By/Keu3XJEigpkd/9fi0MVQpckyYUlU7dVDE1ucxq
         c5EIlx5brD+v66+HGKEo2LC4UoK0suH9ij8SHoPjjEpmfh7fkexJxprsQCjpcYVbSOr0
         lUpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=j7vN+IJh7hfv/iYhj9mBOHpmMOeViS2uAOtapOSpZOo=;
        fh=lb2wv7dLqfa0uvIoaO6IByyQBgoApb63n2sbMvq9zzg=;
        b=W6lyoaTqgyPt/w6NXJJ5MyuLlQhriVv4fIXZPR/RMCpuCCoTOPc8K80A5N6gzKHKuX
         TwRa0Vy6/707tBbk127FhShSE1oM7zJ8QV937TUz2QRyUW7MOi0TkpQ7W5yxISB+HRwB
         KhCj482lqncjzQxGQHyWTOOgF85p6t2fahJPwaPHCggq3rbU0dgJ2bMliCEX50qji5XO
         J1iRBQBCQnyT/NZUPB3vwRspy7VUcimAb1pEc0EDJzMVW6lEBxF59SJtKoN+5G6DjDyo
         ZCIzwlQdfgI4LEocQ7s7MYSEV/Op18h+RHslT/nicI8SpydiC+BSF8cq9K7ZErY0caGX
         sEkw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tCj8XcW+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a994af6d0esi21875281cf.530.2025.07.04.07.54.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:54:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tCj8XcW+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXhlu-0008CE-2L; Fri, 04 Jul 2025 10:52:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXhlp-0007h5-Ac
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:52:09 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXhln-0001W9-I6
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:52:08 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-7086dcab64bso8675657b3.1
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 07:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751640726; x=1752245526; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=j7vN+IJh7hfv/iYhj9mBOHpmMOeViS2uAOtapOSpZOo=;
 b=tCj8XcW+xzelnYvn5ZxtBrtLvswIElU9HTSbVXngv4W4bWOdlFPnzwu6m5ZUrPxP8R
 SCRBRM2Br6X+wGoGK1Rq37uIZMXyJyi1fCpCqpYTJd15Ud0zPNgq/pOBzPoAlb+qNjJt
 kL0N0YGxU87fBbEF9PuJpuRMFisuzj1pUXHVlGtauO208ePgbGisygeF1PSg+Yzf23Fz
 j+OKjdADpdzpQDR/cqaTk6GJZeU72C/8t/j4YB9e+wSkbU4K8WIq7Z4gwAaNuL2QPL7d
 42hh87s/vwNJwM6nplMboxSBz+c1DOjM6TUSmmw1fblWCJWtN95nIK4El6RiLPkURPtU
 +OYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751640726; x=1752245526;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j7vN+IJh7hfv/iYhj9mBOHpmMOeViS2uAOtapOSpZOo=;
 b=f8GUPT3XSlfrrz3U89D97VI9VqPFY8dm+FWUM9mDzZEvx939aKAzHB2QUX7nuawu8q
 rSFdhc3ZWOazJMa3uGoIM4RIXjM2u2T0BBR+o52cbmMBidEuYNQxWjsk3ekQ/u9q8cQb
 1XSUSANSQcu6F3KfT4P2ErjsK2l0yP2Z7LKJchnKuMZx19jmx3cqg4Jrsca2qMIRLj4D
 fnbeqQ5Lma+ukuGl7vNqlKTXevdW+aNWwJNZ9F7m0OYJvrTMWMroM+dZLajSKdNqmJQq
 8kj/wqGeACNPHWTGvmk4VJnfAnCtu7O7FVqHiS7RWkjX4ZEWFfhgmn+6NFGqt1+JO3Ey
 p+RQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8TlBsnQJ8yIrsyb6U5bqUdqBb1j4mld8HCrlxA+rPtsG/hUW1v+d1TKfMvo7X+z6psSRr9AX1pA==@nongnu.org
X-Gm-Message-State: AOJu0YwytPn2KjSZOkjqc/ywnPOpejCm3MKzV1YbDWn+PrqTF653lgg0
 jtOxUclUAfXF7/5pyn5LZz2SJceApQfGsP47uiEkWCbCokwfxeDdiC2q7I2EVOo6m2jeUp1rxmk
 Dv+uNlEVe/0utPa0lvXMsA6j+Mw9IJMtzzijMCDRUphSah5Zd8b8S
X-Gm-Gg: ASbGncszdc+EJubvJ0t86ZjgDVb0Luynn6lP4/75WCZTyxF2EyG8P/DO1ewlixlQDp1
 zzGpfc9UAc99i74VeskIROW2DgmNptyNcz4NcCUt4ZLVTI73GD5f9+JUNFFxHaRAbZD1EH5ysiz
 Ets9/4BT4tfXUSbwbQyIJzw5j+mpJ3FlEWsSFbNGhurPzv
X-Received: by 2002:a05:690c:685:b0:70d:fd2a:1457 with SMTP id
 00721157ae682-7166b593dd6mr28224047b3.1.1751640725871; Fri, 04 Jul 2025
 07:52:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
 <20250704142112.1018902-91-richard.henderson@linaro.org>
In-Reply-To: <20250704142112.1018902-91-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Jul 2025 15:51:54 +0100
X-Gm-Features: Ac12FXyxGGoXJI5oYR_U53ev64yKXZIL7jTsrOgnseFjhFonaKDg_22LaX1ZfTE
Message-ID: <CAFEAcA-PfzqB-4qUddxG2Qp2RSir4U3VGcn8-1etGKrK87Axkg@mail.gmail.com>
Subject: Re: [PATCH v4 090/108] target/arm: Implement PMOV for SME2p1/SVE2p1
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: EZ8AWEG6+S+P

On Fri, 4 Jul 2025 at 15:28, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/helper-sve.h    |  8 +++
>  target/arm/tcg/vec_internal.h  | 34 ++++++++++++
>  target/arm/tcg/sve_helper.c    | 50 +++++++++++++++++
>  target/arm/tcg/translate-sve.c | 98 ++++++++++++++++++++++++++++++++++
>  target/arm/tcg/sve.decode      | 17 ++++++
>  5 files changed, 207 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
