Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp181768lfo;
        Tue, 2 Feb 2021 06:52:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwm+mT6tHAY6u3kzziTl477qqvtnoh4+owAu8xvD3aX49+HGETRRB8pTrSlTGP4ErmPZrwE
X-Received: by 2002:a25:3450:: with SMTP id b77mr32790879yba.352.1612277550551;
        Tue, 02 Feb 2021 06:52:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612277550; cv=none;
        d=google.com; s=arc-20160816;
        b=OUY7wyrwNFk7J6uMO2OB9xLrfyUD07njR9asANcQy2b3034essEwq2gHVbsy9LZ4Lc
         zQAknIxjABY2WzBFMzlzzWhdca8b1YWS20sRwd0IYiCPecE0Rb/dJBxuj0Hl/NSkC833
         KsSt39eYVgLfByGE6s8h69XZoRdyd9DSdppd4sHXAtkSN7JfE2N1czOFWZEWkRnT/LkG
         fmEBlplimyokwgfAe1btB7ryK4kkXP842lSff6wuB45CtmFDFfojXmH5Ou8TVpvfjc4V
         vQin6dSxoUvw9ZouN8Fsl+eI4vX4b1QM+U9xwkzkCvMHl8HafbsXXNYbA6yUbs6mlFQD
         lqOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MypB+0cpkh92gkN1Vi1y0ZBTUrvtD5Er68ivZX5ch/Y=;
        b=STTbxPqEUWVL2WeYLXQbsxCqE3SAHxEkwzwGicMp5+j3UxmjopF4aeOtxrAgvMr+iW
         c/dJcLt6i4Qm1p8kWPCsUIjoMSC7DW80vEBvrAZnqXPCXCs/MpANGq5SBj3g0ZCLRzwp
         od53V+zxaTJng294Zl6luOc4FM2uiulWGjW5QgndSAeItQWsTqdT/67LS5+bX8fSq6pO
         SaGhUUfatAOFIJX80VxKdcOAPrd+EPyE4KqSLfaPJw3nfQsdweoXIKWZTfV+OHTw2Ukv
         G1o3120Nh3Pf4RifdPMbDeE3+aWOQzheMxSWb/HeseK7fTlSHOl4fa7YrG/Zq650JgjD
         wR5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=M3WSyzex;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e128si20133522ybe.422.2021.02.02.06.52.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Feb 2021 06:52:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=M3WSyzex;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6x2b-0004Ho-Rp
	for alex.bennee@linaro.org; Tue, 02 Feb 2021 09:52:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6wl7-0000i1-S9
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:34:26 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:45599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6wl5-0006BG-3o
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:34:25 -0500
Received: by mail-ed1-x535.google.com with SMTP id t5so2078621eds.12
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 06:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MypB+0cpkh92gkN1Vi1y0ZBTUrvtD5Er68ivZX5ch/Y=;
 b=M3WSyzexFHIAiI0y5Qp0YN634pffutu7nxEics+XQjWgA2HiNvDUG9ihgPpVShuj5k
 /BXsp/jLeBdqzj6EGe1CzmgWg8/oGc2i1ANadoNAblovHDdFtl8SBmchnOvZQTetS09a
 h1IErIlx9EaTtbkWb8ZZ2+z7WE8nDAk7+qsF8agS/noxrHVbL/hJwWh5c8SbzFN2i+Y7
 AuiJFFGq3z2ZqwkToosLbU5QSxyInvfqlE8yzn4J36/qUJHDh+vv0Zz41NGZhc6yMjzk
 oNHsHciMP+w7Kmx9VlWHqZH/wquisKtaUMH0AuziJjgyz1ikH5MiXkVuP2pBEi+iiFuE
 DnEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MypB+0cpkh92gkN1Vi1y0ZBTUrvtD5Er68ivZX5ch/Y=;
 b=FKyIbJbbL6C8uyYc3V0fAKvlyTloeB1OXFV+LQloohjhxYPAcZALPsTS+pY66tnQIG
 E3QJxuhkhK2yin9+XRgpgbn+bEmrmNWQH/WOW30Q43BmK9IfUHKg8U9F9PpItq23k+0w
 vCiaIM0WHcA2iGv2CISG9hw0M6w2Mlk1KoLmbvfL7WK/Utd5iAjUC4A8LWw7LqecYLuy
 oBR0nCcBmD++FE0b/Leh6Jp+5BgUSrBgu3otAmq4aGtudXIn3RCyjeGw8dsc/hA2/ALS
 jwpT82ho22qR/mg99ACmnjJW4i/A9HErC1SJ9PVfQLLCs1pk+f4voz9Vl869YsIGI9tF
 S+fQ==
X-Gm-Message-State: AOAM533NL6y0pxPMaV4p1ECjFa+3zWUx8R0lPbtuj+/RoR9L+dyMWI3I
 hNnEYejXtwN02z764TEhfrzg6zZMndGcwr+qrIMbyQ==
X-Received: by 2002:aa7:c88a:: with SMTP id p10mr23863521eds.204.1612276460435; 
 Tue, 02 Feb 2021 06:34:20 -0800 (PST)
MIME-Version: 1.0
References: <20210128224141.638790-1-richard.henderson@linaro.org>
 <20210128224141.638790-10-richard.henderson@linaro.org>
In-Reply-To: <20210128224141.638790-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 14:34:09 +0000
Message-ID: <CAFEAcA-oZNJr_VADuc3WmxG1nHJWS18yfEyrQSvLrpu+G9iMog@mail.gmail.com>
Subject: Re: [PATCH v4 09/23] linux-user: Do not use guest_addr_valid for
 h2g_valid
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
X-TUID: AQqMUnfvCBIf

On Thu, 28 Jan 2021 at 22:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is the only use of guest_addr_valid that does not begin
> with a guest address, but a host address being transformed to
> a guest address.
>
> We will shortly adjust guest_addr_valid to handle guest memory
> tags, and the host address should not be subjected to that.
>
> Move h2g_valid adjacent to the other h2g macros.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v3: Ditch type changes; retain true for HLB <= GAM (pmm).

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
