Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1735469lfg;
        Tue, 25 Feb 2020 06:13:13 -0800 (PST)
X-Google-Smtp-Source: APXvYqySYrPECWT7dRJ7z2oqcKZ3Qi0PALx5DvYGVFfBRwtG1W2MNbi5mSjSeAoufr87eR/iW86j
X-Received: by 2002:a0c:f6c8:: with SMTP id d8mr51229690qvo.234.1582639993568;
        Tue, 25 Feb 2020 06:13:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582639993; cv=none;
        d=google.com; s=arc-20160816;
        b=ybr/A4ONXWXeG1RKU2umT18LB9J1JSMX1cIysfSlx1x8uRUQYFXAFJhup6Zd9m9oT3
         Y7XWvVTITt5VwuRPfyV5H7bG+Hg4uB4kQVoBwWNTim5N+P6CYqjd0IRMOeAFaC67QoJn
         C9ormJ//vSOvHxkIhULwLraVtOBJEcZtw21e/QswZc4LoPU65TlAiSGhq0vHfx6XjOE9
         ybfR3FGqGWMhDpMJYZkGFBbH5bm3sw5qTtJx0318rut4HTCCov0z01hJbF6YTGP8Aw8i
         tA35yfU66NAa68Ws1xllSMsnP57AmKgXIxgimJd3besaaVLCa+Ip8XCjmRaTkYVfxVaL
         irmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W00TYEGv3o3wTI6WlTZXldTZ7RdbF0jWLul8rx17LRo=;
        b=Yo4henUb8Og9HFSJbn4Evimj5QD8bc58PZLFdWtCkQgP4wJ2OyhApTDCgujcZ6Tl/C
         2j6kN8Ocq0KyFLxIMIjF9UB4U1nTBiehSmo+NjgoDx5I4V039BPagEsRGWui6hiU9jVz
         Q3kc4+/N1RP1Uh/UZuWxPG/5fpfkqpkiUuJgQ9b6eRJRDQcQEWyMX+hGrDk+9kuYiQUC
         eZpI6tcNSJPT+H3D/uVwQ+B7tMRqW1w06q2nxkiHltsjD/8w0pw7UFo3Zm6y2zKRoA9y
         CG6Cex4HfrMbOkzX7ca86YtqH7Rxg8vRx8EQBJRD5dj07k8zSKoYf69S2MpjMi9f/9LI
         6m0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="mjXAp/jR";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v22si7636786qkf.298.2020.02.25.06.13.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2020 06:13:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="mjXAp/jR";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6axV-00057x-0F
	for alex.bennee@linaro.org; Tue, 25 Feb 2020 09:13:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39740)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j6aIa-0002OV-Qd
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 08:31:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j6aIW-0000ol-NU
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 08:30:56 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:37704)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j6aIW-0000oR-HQ
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 08:30:52 -0500
Received: by mail-ot1-x341.google.com with SMTP id b3so12044679otp.4
 for <qemu-devel@nongnu.org>; Tue, 25 Feb 2020 05:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W00TYEGv3o3wTI6WlTZXldTZ7RdbF0jWLul8rx17LRo=;
 b=mjXAp/jRux95OCK3rTAr1wBK2KraYyMtCymOO8VWHnyzA8s+tfJ/SBHDxKs8QCymsW
 54KTR6+kWPJQx/VV729vpEpw8zK+5g7iPFL7pNGw0DmrOPsTYi8iSsMzU44NOGnd9dYR
 xOUMW2NNygTPPsRyB1s1kleDoQoxH5xiG2RGXrvmpkECkztL7W6S8kRRlNx64+2U7wUb
 h5gCuwLPHMdM7eev5NZOkWqotBF5sEu9KKxWoaS0mv1Xm6AWkQMoEMVQSbqrRHPDS1Mt
 vay2/UUc3uBX3wBw7OAEcjehZxLXG+nKiT3CSZNywTlpTaqDa+y8FAVaYq8Hl/qrU2Mz
 K4sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W00TYEGv3o3wTI6WlTZXldTZ7RdbF0jWLul8rx17LRo=;
 b=UbEbSlyYITIEgHWiVaTmYKy9f4t77UlfqFMsBohDHw38tp7m/QIe0g/EYmip1lJXV2
 lLez/CZYW52oJ9yTU+c4gAXUT7ONOzuImTsPULjKPfn8gmGFFTYMeHJ3pgD4mSC936mF
 7Vp9jmODG3xgMnM1AKclruCow046vwQ/DYhsKcXVsta+6otFhliAeKW5Q+9tG5cl97i1
 Ha1fLeOiFPe9krUfyvfFfGRrbaw2P/Vihvw0tdc+9GsWkI2CSEYof7MacGagnqdZlErV
 xB9+nhEk57m8TTBcZ4MMxdDEmG9tVW1GjV3RSh/W+HRnmd8yrcN4TN8PLFON7tVaLkr+
 yUWg==
X-Gm-Message-State: APjAAAWIma8weBCMcThE5OdNyafdlABv4R4rR4x+zE9sEBmpFrM0vUcW
 ps+C6LpvnFNXrHBQ0NI6Vaz8/RcBeLPL3iB8PPY/UQ==
X-Received: by 2002:a05:6830:1184:: with SMTP id
 u4mr42540624otq.221.1582637451828; 
 Tue, 25 Feb 2020 05:30:51 -0800 (PST)
MIME-Version: 1.0
References: <20200224222232.13807-1-richard.henderson@linaro.org>
 <20200224222232.13807-14-richard.henderson@linaro.org>
In-Reply-To: <20200224222232.13807-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Feb 2020 13:30:40 +0000
Message-ID: <CAFEAcA8HWfbxuk89zjZ9q=i61NXS7pdRj77NV0sX03W2iPVk5A@mail.gmail.com>
Subject: Re: [PATCH v2 13/17] linux-user/arm: Replace ARM_FEATURE_VFP* tests
 for HWCAP
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sxkUf67fWiT9

On Mon, 24 Feb 2020 at 22:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use isar feature tests instead of feature bit tests.
>
> Although none of QEMUs current cpus have VFPv3 without D32,
> replace the large comment explaining why with one line that
> sets ARM_HWCAP_ARM_VFPv3D16 under the correct conditions.
> Mirror the test sequence used in the linux kernel.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Use isar_feature_aa32_vfp.
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
