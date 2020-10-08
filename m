Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1323673lfq;
        Thu, 8 Oct 2020 06:07:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjlEAbOd7UD5Y0y6W7qUPpgTTzCgOQOt81kvptDkAleCN32I8xWTH2hcpEVWRwy+0BK8/n
X-Received: by 2002:a67:f24e:: with SMTP id y14mr4501639vsm.55.1602162476259;
        Thu, 08 Oct 2020 06:07:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602162476; cv=none;
        d=google.com; s=arc-20160816;
        b=TCjyGKkyEa3GQy4ycfrz6YaZQI2lAfKU9FhyaGea5uPa9Mxhb0qoEdHa9+OW+gl9cO
         uZOFr8b9y6bPwzKPMpbohGWxujIaT0KtyW3ceK9WRR1VPe4zx33FwBzI3eN0/p0JIcRQ
         Mgj3EQFfxo0SBA/aFVCuBzrVkHmayEBMtQql5CYqwFY6pOCSwDghcGkkuZkmJj9nmNBU
         0HiEa8qeMX759Br0vY/qeLO52P9xV89cOHHNBNXTqL7NlDoNzYHyDjoALBcFKvroZ1tY
         sNmqrxc9vf8yLWKkdTt11YSjsdPfsHXL00tHLgZdkZWc3BKmQqiSoOqJX9LLRgDx6iPI
         przg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OGY/uIp2EDPhm6ZC96lZgvI3+mtwjY2iX53QRwnCPxY=;
        b=bFFvxI4kipkycRbVtvxnPX0UDn06O5oOjwiRlvuLYraBREk+A8KAWaENOQBjeOf1B3
         I/90/5Wek47/eJx9aqZFB/IEu11AGb/A5pLmyBfCjTtGjuw+UcZ10awmUvhI4LWi8lu5
         +qGx5kB1V3bvr2pno6dzUbqdMkR4rCvfyfACfd1q37IltCMNrnOxqbQAJoZQR9IN8qOS
         ZUaVj7gvWKWs+OUJAdYnF9E9aSh8811wAikFzQ9PnjyG7/uIz+N6SyTcmYuJhh08HgLO
         MfE/u+cFbVZqYBlJybl4Ww2cHyErPX5B5IRCkQojIreIZ0RqScXDv1KELlL6nMDXl1CE
         AKog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=muqzXu2+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u3si532928uad.233.2020.10.08.06.07.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Oct 2020 06:07:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=muqzXu2+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kQVeF-00073q-AK
	for alex.bennee@linaro.org; Thu, 08 Oct 2020 09:07:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kQVWS-0006Nd-Hk
 for qemu-arm@nongnu.org; Thu, 08 Oct 2020 08:59:52 -0400
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:46615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kQVWG-0002FE-Cl
 for qemu-arm@nongnu.org; Thu, 08 Oct 2020 08:59:52 -0400
Received: by mail-ej1-x644.google.com with SMTP id t25so7916257ejd.13
 for <qemu-arm@nongnu.org>; Thu, 08 Oct 2020 05:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OGY/uIp2EDPhm6ZC96lZgvI3+mtwjY2iX53QRwnCPxY=;
 b=muqzXu2+kq4+YjZIs2kroXkbvrqVObe4XtuZp5AfdTUM4zh3xdepJId80zkZEhB3T4
 PSB6SUMZ6ZvTbHHKDHgHgh8NyWFQuUR+TfJLvweI33wby20MLg6pkdqdRxz98KUnGc1n
 sKavpN98NG9ZhWXiSPxnt/iVs0zpGwkbRVqj1WYvZc8Y7QxYeCZucqxdjcgFh1QakkBR
 rljuXZCbzQUoyXqZypl48CBDFry4/0b6KtnrU5xxTfQDNuPNd/hyOaThTppkDxWEc3pc
 hF+Gf8OgFDFVvNc7matcjWO5hWayT/N/Ejq4zPjKgY+6ohiFaekOZfqqEc9NEsy1MOJy
 Zp2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OGY/uIp2EDPhm6ZC96lZgvI3+mtwjY2iX53QRwnCPxY=;
 b=QGv+KceHzyZeR4N6jnc5xNwwQZ76imRooyn5wC2n6RLX6SREQURpddpyyidvLkWqO0
 1A5caWjo6ovpufsLQB7//2ygD2o0m35OS1vaaE+PjPFS8zI6EPUzV2SondTuzuD9D2LH
 EE9WJyXLJRRoxtvPVcwSORI09gCpxR9AyvtrmeETYsNiTSEc39ObIkb3WFGH32PgwCSa
 JfYBYTBdSXLgwE1d1dO2m7WSPsx4s2uIxfs094hv12eRtrV6gU7UpNIYA2/z6jdcSh2T
 2rujAj1fkYpHU8MVyRKokP9z+pVHfeK90dpyw8iWHK8jNNCQaj988G02tylBuxa65eqV
 Ke6w==
X-Gm-Message-State: AOAM5339tOMSdjRv8GDJYpQzGQj8C1dArfXzZwsTy5RoWvZWvtvoOoBV
 fl3FZGOs6Ob2V3vrNQlHgH30F9OuPd2FXjkBnMmo4w==
X-Received: by 2002:a17:907:4365:: with SMTP id
 nd5mr8867865ejb.56.1602161978581; 
 Thu, 08 Oct 2020 05:59:38 -0700 (PDT)
MIME-Version: 1.0
References: <20201001170752.82063-1-richard.henderson@linaro.org>
 <20201001170752.82063-3-richard.henderson@linaro.org>
In-Reply-To: <20201001170752.82063-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Oct 2020 13:59:27 +0100
Message-ID: <CAFEAcA8pgsS8rKaSZcs3Dq5yGepV7h2v4AOtRrRMAAkPbNGezQ@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] target/arm: Use tlb_flush_page_bits_by_mmuidx*
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Jordan Frank <jordanfrank@fb.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bBTabiK/cjZv

On Thu, 1 Oct 2020 at 18:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> When TBI is enabled in a given regime, 56 bits of the address
> are significant and we need to clear out any other matching
> virtual addresses with differing tags.
>
> The other uses of tlb_flush_page (without mmuidx) in this file
> are only used by aarch32 mode.
>
> Fixes: 38d931687fa1
> Reported-by: Jordan Frank <jordanfrank@fb.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
