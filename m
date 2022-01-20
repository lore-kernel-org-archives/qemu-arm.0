Received: by 2002:ac2:4c90:0:0:0:0:0 with SMTP id d16csp671728lfl;
        Thu, 20 Jan 2022 07:59:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyTlFNLN3+TBX18EfqXYELFehNXELKeHpWWaQx6lgK7VUXqKaVRYLOGPcQCsosDK+2hcHRn
X-Received: by 2002:a25:dd8:: with SMTP id 207mr15163672ybn.25.1642694385586;
        Thu, 20 Jan 2022 07:59:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642694385; cv=none;
        d=google.com; s=arc-20160816;
        b=EZWeZv/HxUNeG8j0Y2Ts8anI0tHcITCi1n9nmJWNpiJjDrNzoJIR/HF7/p15XX8qdj
         1Wdr2N+sCSaV7V3b+jfH5ItpA5L6VQTuo3T/gBLbmfof5E+/yozL9Pwyr/B23ItL8RQs
         0P6KqX0mOEOgrBoatU+FFF+lgWWL2nOGou4vITafuyb/X154753qBU+zcpB7netf+Q7u
         u9QmmaJxU2vh75GQbGj7lTOMcZDROGLw2VzFHxaEblynoGtlF8gBrPRpC9yVQt8XVvRJ
         yHe7UY4zoWKVFBr+wP9RqEnCIEr4Q3LrUwag4Ri3m0PaNVtzyd7N1ajd7DjgPABTcAR0
         zKAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tIAQhhNKuEU2dRJSPe3TK1XUceF0ty5yyfgba7DgyF8=;
        b=NNnSfHI46QXC1OXcvE1Z3a9nDL9Bn9U1dOkTNd24MUsAJPbGMewmhFLp/ssSZSQ0he
         Vhi5zDl7/DJ+2tNEsDQftz/K6T/A/lcBKKPJG/z5obBWwhEvL7CnaHcff0SzBOQrPxQ2
         QeZ0pRJ38qbnRF4gPysKrshCbLeYzgSQoGyGc7imgCdMH3ny/Y7LMIEbcgw4grdKF0WF
         FwjeQzk0ZL8hwX2uuV1yy+4awRwoKGyxRLaBTVLJ6/GTp0F7JFE0ine+K35adIAdY3at
         SaSgKgNEFXLb75UthhpwEeLdUHoyYMx+tZQu3u56FPl1Dnu9Gcvj+VRgn7GmJ0gfH4Qj
         sZDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=lJ5zJacm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s78si3941434ybs.521.2022.01.20.07.59.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Jan 2022 07:59:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=lJ5zJacm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nAZqi-0000oI-TK
	for alex.bennee@linaro.org; Thu, 20 Jan 2022 10:59:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idan.horowitz@gmail.com>)
 id 1nAWF0-0002wk-Bx; Thu, 20 Jan 2022 07:08:36 -0500
Received: from [2607:f8b0:4864:20::c2b] (port=41521
 helo=mail-oo1-xc2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idan.horowitz@gmail.com>)
 id 1nAWEy-0000vw-QH; Thu, 20 Jan 2022 07:08:33 -0500
Received: by mail-oo1-xc2b.google.com with SMTP id
 v124-20020a4a5a82000000b002e303ad3241so2220107ooa.8; 
 Thu, 20 Jan 2022 04:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tIAQhhNKuEU2dRJSPe3TK1XUceF0ty5yyfgba7DgyF8=;
 b=lJ5zJacmzPLc+UWuK8SG33aZPvCMK6KT93RDejXm9hV9PU1MVlx2fHJN2Tna1sVnrq
 5RREQFWu0kXW8VlKV0qeWMObQJwcRyDjrBaWu7o1P/q7KHYbeSUqAyMu+RTlfaxcripk
 crVStVQ1oPvJdQNkBFzm0+Z75Xp0NtpFCdqfXR1X0tdjBqWdSwzpRtMLI54DPYYDBoCg
 Okz0i/Qu3W1+vwp181qxI3Vk1LCHqk32C61D7acAiEuCgiynG/B+6oym0MVWrK/G2PwT
 ktXu5G6dfPCiDtkzf7PvNKy7qaP2u93k5LlPJZnwzfqRW9p/If2PyvUUmD6gfznl/bye
 tskA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tIAQhhNKuEU2dRJSPe3TK1XUceF0ty5yyfgba7DgyF8=;
 b=4q4lDKGVes0Tdfc6SFe9l0/J1UCXiLVpRZU9FM/HiioFqN71N0AOmKuE7so86VvpZr
 VPTJ1aoIwZ/CfJoxCWcvvY4fhp0WyLG4p8KOs+76gKjhURmj5BE3khgwsnT4U8YJChRc
 L6zgsxAr3fyE/qmNQS94h3EY/8eG6jiXNLpedew847k/MpdZZjUmBbatKeAEAxX2YLoC
 VHWIyAj/GoDHCDfbcDglvOQle3AuV49BBfKqhsmk3OBKkUFjXkz+WDL7iBR9AxNfK5BJ
 gbbygivwnfh/pR0ynA7wDRaBXkVQx/e8DF9nXa3WIvCoNr4NIL9a3Ku13g5MkQScgTUr
 LSBA==
X-Gm-Message-State: AOAM533W/DJzRmYWtAmcdjypNHPKVydvK9of2hgpHE3jFyIDMqnDkqz+
 3oy3dS9RHZ0gaZOvlM2VtKfa/qpuh6e+waQd6zG4pKPSdVlN8w==
X-Received: by 2002:a54:4702:: with SMTP id k2mr7163541oik.100.1642680018164; 
 Thu, 20 Jan 2022 04:00:18 -0800 (PST)
MIME-Version: 1.0
References: <20220114004033.295199-1-idan.horowitz@gmail.com>
 <CAFEAcA96gKH8r_a2aV0bfcOR418WnRkmEsV73Uss0kDEQ2Tx4w@mail.gmail.com>
In-Reply-To: <CAFEAcA96gKH8r_a2aV0bfcOR418WnRkmEsV73Uss0kDEQ2Tx4w@mail.gmail.com>
From: Idan Horowitz <idan.horowitz@gmail.com>
Date: Thu, 20 Jan 2022 14:00:07 +0200
Message-ID: <CA+4MfE+nh4LRAbmT2GnNiZWTU=xfmkReNWWTgOhqWLddXdV_hQ@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Allow only specific instructions based on the
 SCTLR_EL1.UCI bit
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c2b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2b;
 envelope-from=idan.horowitz@gmail.com; helo=mail-oo1-xc2b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dsvBG4Enr9uG

On Thu, 20 Jan 2022 at 13:42, Peter Maydell <peter.maydell@linaro.org> wrote:
>
>
> But for all of these instructions the reginfo struct
> sets ".access = PL1_W". The .access field is always
> checked before the .accessfn, so for any of these instructions
> executed from EL0 I think we will always fail the .access
> check and UNDEF the insn without calling the .accessfn.
> So it doesn't matter that the .accessfn has "if EL0 then
> check SCTLR_EL1.UCI", because when running the accessfn
> for these insns we can never be in EL0.
>
> Am I missing something?
>

Hey, you are not missing anything, this patch indeed does not change
any external behaviour.
I should have specified, but the point of this patch is optimization:
during benchmarking of the various AArch64 instructions I found that
the cache flush instructions were quite slow, simply due to their
heavy access functions, so this is an attempt at simplifying them.

>
> thanks
> -- PMM

Regards,
Idan Horowitz
