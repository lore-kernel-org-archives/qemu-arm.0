Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp932513njk;
        Fri, 24 Jan 2025 08:38:38 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUGF38ZJpZg2Co4Kw5H3tHEjs5pftO3NpKkNyocBqKzcRH3iRePJym26Z7cRjnhsASEo5YZQ3hZafwQ2A==@linaro.org
X-Google-Smtp-Source: AGHT+IFejcVNKXtkjJkgKwaLpPC22b6LTUzTDjWsfG9zbKo0fja5KgpYrys5EIjZg0MaWjFfsXZK
X-Received: by 2002:ac8:5a53:0:b0:467:4fc5:9d72 with SMTP id d75a77b69052e-46e12b6895dmr427983131cf.36.1737736718168;
        Fri, 24 Jan 2025 08:38:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737736718; cv=none;
        d=google.com; s=arc-20240605;
        b=fQzcbPKADyIZVTcEkmLMdLfOYuk0kJ5r2BQ3uqCuWPjtaW1L/0eSqKl7VlTYCKZeBw
         X1kfuKbNNwxxOOH6poTGC1l1zDsp/tHSF1nQAaLtDAcCWSM3smFNEZfbWSyhEKD8lQx1
         e3wQV+6ZzhpFft0L0zyF1GPQwthd9OF/y2osWEQKLLiuKE5w4uPIuP6hsVRkvRBr8HC8
         ajrOCBokIH0zvchDjWxLOMgMGyiG9nADO9jLGO0Vpodf3UD8lL2YLvNas5Xx9FLQirGZ
         TKm9slOnFPTy21cXpismyBUKCk6R8pmmnng3bpI9h9Lx8kOJ1kvRGHvST1su0DLiG3SG
         PaVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TxUN8Fd2eU9DUvV9yTSFQlBGvgml4AE9HSaNzAgXGr4=;
        fh=P0HxCGxAtsl5Rp+GJVB1CxJsrlTAb0HE+78fYB8XrXs=;
        b=B/Xq6Gy1aKQafs8dKTA8bRiNI5hNdEHezP5lgC9cCn2kZVbD6k3uhnn9ce4CdoIFCx
         mhETKNra5L5kvc3wLmrRhM7wyspaXz3b6siOWf3VSJleyB/O0QU7xKcKvC8Cgtu/wcy/
         xCPBn7pV/SZ/pIjD8rqiACGeCNjd8+GjLHBMnH1ffa6A6s6R+/g5i2gW/q4nJHVqH2Xr
         9T17r+DkQNAG6Ck8wtdqY87b/6lHgbcASpHuY6G8Cv0oH9z6lGNQ6ujLGSszryBL2tMj
         /wrdHUob6AGsKcwBrqJI9GCfNempHuON8bqOP2g9+jdRUL3Bnt5+gZFA7e6lSFYH/Zaa
         dWKA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=smjrkdqB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e668882e0si27487771cf.161.2025.01.24.08.38.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 08:38:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=smjrkdqB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tbMh6-0007a5-6T; Fri, 24 Jan 2025 11:38:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMeb-0002r7-3C
 for qemu-devel@nongnu.org; Fri, 24 Jan 2025 11:35:35 -0500
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMeZ-0006qA-Ii
 for qemu-devel@nongnu.org; Fri, 24 Jan 2025 11:35:32 -0500
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-e53a91756e5so4112597276.1
 for <qemu-devel@nongnu.org>; Fri, 24 Jan 2025 08:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737736529; x=1738341329; darn=nongnu.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TxUN8Fd2eU9DUvV9yTSFQlBGvgml4AE9HSaNzAgXGr4=;
 b=smjrkdqB6qI147hdB4ff7ULiDCXvp0gIgOXKDiwKOGB45iCrAvyPgScBoqj1XgStJI
 zp+Fv/vuO9A4AefGcu2vpG/dVtTKTbpb3R+G+1+TOHyPdmtSa5Z0cjSidt2Tez+U2jSB
 +hI17751y0YluKfEmowmY/8CatNorS4lJdTqMuoce5PHkUjBnVSQiw0w3vEMrdRHr71Y
 H18b2xVRpOWPp0Gads6e83ny11lXxQIvSSdPypW4QBeCw1ikmAsMEgrLQvkoPm8EUtOW
 bmAtAnhInz68EhYFXYtkU72NaG+gELnYo9KzbUhdq1rbkk+V7yUhXwhHSNxq+1Vkbm4P
 5Luw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737736529; x=1738341329;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TxUN8Fd2eU9DUvV9yTSFQlBGvgml4AE9HSaNzAgXGr4=;
 b=CNtqKU/8r+WWChtP7dsbA59UWEORAL7qgMWLDYpVSCyx52b8w5R+PtZ2beARa/IPwB
 sm6vm8p5OA/GcKEQDmS6+y6h3+soJ+lvEAMugzy0vSVT+v1R4QH+uQyBFMz2pv1Vk3hJ
 O/hoj+A8gKmVVRstJ4cavnnY89oI4nD2olD40I3J6t8sXZEZXFQcHjZBXHN638Y0LiJC
 B9khrfIQB4mNQRp8/1Tfhn1zXLoBFkwZ6fiyW7szQIDiZhRS7s7/Ha9DLDDJ0YH4sYXO
 +ggundRhFxV/tamRi+TRL4mL5Hfw+s7eg0RuwQe6emmh6sSLcUvljM/m1avmCHAfAdyR
 QlsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/5w/nnE5eqVzQkbJOjIxuDt9RQZiui8jT4zAFo+A1wFojACr8FZGHE7EJZHWfRTIW20bR41ve23rg@nongnu.org
X-Gm-Message-State: AOJu0YzyJNgfh/n5Or4eW+8RzWGiGvtjz1XBW0Tw8ckr82jBcnCOeb5b
 F3ypZSOWLHR6fDGqZYMfJcA4gtHp5BWbmxgXWrObhVxCAuPKcgUQQ7GQffWZf1sjjhyx50QiSbD
 cNyyifNQrkLzXa5S6qyC5J7FqjG8YF3y4IpSiP+b9NytkslUq
X-Gm-Gg: ASbGnctLssZ9u0DU7tCh0JrzdfkpT4OexACgFWutbhTu/Nv9dsaIi2s4BdGHPS8gzS+
 vvJgiwDIQqSPP6x/LNMp4awrWhywkEyBFvkzNtna1WzuNKt/+Pz/g2ydGJ8/z+AU=
X-Received: by 2002:a05:6902:144c:b0:e58:3990:3f77 with SMTP id
 3f1490d57ef6-e58399041e4mr4279979276.22.1737736529607; Fri, 24 Jan 2025
 08:35:29 -0800 (PST)
MIME-Version: 1.0
References: <20250124162836.2332150-1-peter.maydell@linaro.org>
In-Reply-To: <20250124162836.2332150-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jan 2025 16:35:17 +0000
X-Gm-Features: AWEUYZm1HnEMlkcuXd3WrwzLYmOcYihRTgLRdgThh_c2AwdH0FwNrx5NVH8jaQQ
Message-ID: <CAFEAcA98LTxpbiXj2YdQvRmUfufzqxDkOcPF0iUfF1rKMY3v=g@mail.gmail.com>
Subject: Re: [PATCH 00/76] target/arm: Implement FEAT_AFP and FEAT_RPRES
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: DwTIsaD5WpSs

On Fri, 24 Jan 2025 at 16:28, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> This patchset implements emulation of the Arm FEAT_AFP and FEAT_RPRES
> extensions, which are floating-point related. It's based on the
> small i386 bugfix series I sent out a while back:
>
> Based-on: 20250116112536.4117889-1-peter.maydell@linaro.org
> ("target/i386: Fix 0 * Inf + QNaN regression")


> I have also some patchs which make target/i386 use the "detect
> flush to zero after rounding" and "report when input denormal is
> consumed" softfloat features added here; I don't include them in
> this patchset (though you can find them in that git branch I
> mentioned earlier) becaus I haven't done as much testing on the
> i386 side and in any case this patchset is already pretty long.
> I expect I'll send them out when this series has been merged.

...having said which, I was so eager to get the series out
once I'd finished the last test run that I forgot that I
didn't intend to send out the first two or the last four
patches in this series; whoops. Feel free to ignore them.

(The patch numbering in the explanation of the series structure
in the cover letter is all going to be off by 2 as a result,
as well. This doesn't seem worth resending a monster patchset
just to fix, though.)

thanks
-- PMM
