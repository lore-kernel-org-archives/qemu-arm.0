Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp3947275lfm;
        Mon, 27 Apr 2020 03:51:40 -0700 (PDT)
X-Google-Smtp-Source: APiQypKrRWxwKoV0JZ+afJZEgL/QWohbIR+d6hDNM2yzp305+tEk2b+u1G8nCbeKJB1V7ZzmLzsu
X-Received: by 2002:a0c:f1d0:: with SMTP id u16mr21997382qvl.160.1587984699974;
        Mon, 27 Apr 2020 03:51:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587984699; cv=none;
        d=google.com; s=arc-20160816;
        b=m76tp3h1K51Dz4dlC5kXuZz/I58kf93z7a0I4TTtnA2yLdiKcNz+gsF9OSoc1ZQzAY
         8Oo7C/O36p5OMclOl/HSLeNqV5nBeyttjy5visBt5NVO5NbXRlZUKshnwG9Mm5hSEkeG
         9kOE6LURW8iyZHl3N04WkxvyOBooniFUrC+uEbWJhHvzQuk/bFg3bp/qbzUBpWBREGO6
         KDhTfOKwmrQKpaqjCLJmrtXfGW0KCTmoQjGDKA3tYYjAqB4+2L9/Toe7f++9miD5jJxG
         X3WOk2gLMumtsN8iYgi3Acui+7aC/qhyLI3qXD0lBSmgo2Aqmx6GQQG2g/Ic+6UgWcbN
         ZU/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4OBh4ec6GjwKLih0OoWVeBTKaaXA382J+Kz6YgpfMUc=;
        b=Z/kIT2DPby4RLKls3z+0hxBhw6VjiAo6axPHcRUGz6IyXG6tuJbmc2pY0rN2tgsvon
         vjYq5XH9ZBJXUjS/mloQrUvOljPwgRn9MMZ6SYN5WC1d7yWKigHWn/x5DKPGRfB7RX+R
         3UgptiRLHn1kEV3LX043yyj4JRfvuLr0O5MuwN59vx6Fs/Bbh9oyVY0K0WJ9UhopXDri
         SDMY36nCUOaK4W118jkzguXVtol68q1szuAIRA4NOLpMuqovLNCeOSZkXQQJWnLo+bh3
         zBm1QLWd5iU0ojhYCfal2AXisDRJYsxFO1T5tIPXSyWuXOkDeHyzoi+FND+kHvBfF5pU
         iEMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=k+wYjquz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u9si8090006qkk.297.2020.04.27.03.51.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Apr 2020 03:51:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=k+wYjquz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jT1MR-0006PZ-CU
	for alex.bennee@linaro.org; Mon, 27 Apr 2020 06:51:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47070)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jT1MI-0006MU-Df
 for qemu-arm@nongnu.org; Mon, 27 Apr 2020 06:51:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jT1MI-0005Aw-2J
 for qemu-arm@nongnu.org; Mon, 27 Apr 2020 06:51:30 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:34815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jT1MH-00056h-De
 for qemu-arm@nongnu.org; Mon, 27 Apr 2020 06:51:29 -0400
Received: by mail-ot1-x342.google.com with SMTP id 72so25381358otu.1
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2020 03:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4OBh4ec6GjwKLih0OoWVeBTKaaXA382J+Kz6YgpfMUc=;
 b=k+wYjquze8NFFaoMrV6C3I4N2K0AJzVLTlj6v+FLdJ98jjp1PJMNhsIZM93WD2cd7J
 BOrluea43f/fcV7KoXiX0YpatptJaMeJFrqkPGoOWXIzWXDgJ+Vrli+SeO9FL4IJJtnr
 FWABX/BEkLIrATGhawjR/0Pb8jgpts2oTwsKQJ8Xbhj3Keho/xZMzHYxYsIETLtFsY7L
 h2VafDqbte5N/JPLxyM/OjWGxcmKdrGq1cPEEtHhdA9peeHggDC6n5KImKyNYWWhp7vB
 MsXnMC7c/fC080EF/owRalgKMLGK/+PEZaSbNWkBBwxQqmiWtbKeJ1i0aTw03Dhjr4+E
 +xUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4OBh4ec6GjwKLih0OoWVeBTKaaXA382J+Kz6YgpfMUc=;
 b=teUrIDV1d5KvLTQ29dOBjsPWXK34a2r/q3Vp33ptRVUYTmf6loqKolz5W/w+K1hlg8
 YQodtUX9gISEvTYHQhhirml8sDIrw0/LWb8LiJUmZYAbE8aOzwYiLA6grxhCreQZIedA
 PrK4y1cKunkUBUTeareXjxBTpu6y/hANk4lEsOcMj4zvdMUz0s8gtAGJ4mFBRykg3fbA
 VDSnN9WGM2kquwviGjGfIj8tEqTdILYX5yAP62H3Z6MIhvKTIY70agxeraN7XEt/CU3b
 sykKBMWG8hOUzn4AWYCdqcWwijvm6U8V9ZVFJDZqgMjK5h8wFHBAKvoxE1idpxYfyP9Y
 49pA==
X-Gm-Message-State: AGi0PuaArRahtRBJadD1HPnbhtP6Fz5tOiA42RaNNFXJ80iHJRgZjALe
 JLmledTxCp+dPC8b5U9iVEju56MhK6BSJ/rfmygIKeX8Ik8=
X-Received: by 2002:a05:6830:1e4e:: with SMTP id
 e14mr17453149otj.91.1587984688271; 
 Mon, 27 Apr 2020 03:51:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200422043309.18430-1-richard.henderson@linaro.org>
 <20200422043309.18430-7-richard.henderson@linaro.org>
In-Reply-To: <20200422043309.18430-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Apr 2020 11:51:17 +0100
Message-ID: <CAFEAcA_tokLPQXCU64=FrC=dWGD7PAoPCuj=Z46pxbtWywEvfA@mail.gmail.com>
Subject: Re: [PATCH v3 06/18] target/arm: Use cpu_*_data_ra for sve_ldst_tlb_fn
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::342
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
X-TUID: FOLrLOU+l5rc

On Wed, 22 Apr 2020 at 05:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use the "normal" memory access functions, rather than the
> softmmu internal helper functions directly.
>
> Since fb901c905dc3, cpu_mem_index is now a simple extract
> from env->hflags and not a large computation.  Which means
> that it's now more work to pass around this value than it
> is to recompute it.
>
> This only adjusts the primitives, and does not clean up
> all of the uses within sve_helper.c.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
