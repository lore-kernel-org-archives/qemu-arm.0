Received: by 2002:ac2:4c90:0:0:0:0:0 with SMTP id d16csp669595lfl;
        Thu, 20 Jan 2022 07:56:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwGs+D34jct2bRc07NmnUDn4cobf8QPvdvC33oiRalsp3j301odi7ggIt23XwiRqGqU2tRW
X-Received: by 2002:ac8:5d93:: with SMTP id d19mr28755454qtx.191.1642694193993;
        Thu, 20 Jan 2022 07:56:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642694193; cv=none;
        d=google.com; s=arc-20160816;
        b=XXkplywpZvE6sYYe/z075UqCN9G3ziRZqc3slXPAU6tvuxgLB22eknruHklO+97wcx
         3tSBAb94adRugM+LP3VHvRFCnfupvThj9qCD8dRJa3tlP7nrkRXIPpVCmGJNLpx1FFlt
         kW3elfKHPvyCpkUT4AiY9cBbEMTCcf9ylnRKKL13SOID8yNYsN5Q53m5Gqusf68cjV+y
         fM32b8qo3eS/Ida6XyJ3MdTyrCz/8ef/GD5kic1Spb4ARFBut5wWMjO3dYckh5axlt2K
         f90EDRM3jtQQ8V9O/Q5GnUAeCuc/PHC1PgEJh/SRUexyZ37YeEhewqQYBmDnFivvY/81
         qdTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PoFmUAe2U/9+Q8HlewAE973W1wbfT1HXpWq4wD7Fl4U=;
        b=aBncNme9D501Lx9M8Ahl9jWyZfAzPD5FDAMlHom4hJpabnZPC9UEijK7FYyVkd7Dd4
         QsBkzsqUI+Dc3pwEED9K/NwzDR+kVO08XUP0GIRMqys3jjuAL4HSUiWwLpoFW0v2EnB5
         zRHtAMJAbM0TgNITMTHMdZb6on7dRmzz4gLEbrxTmAuRX1kOdKXeBL9zcSuoM9aBgsh9
         b/m7pI5dkrTq1FXgu5eats/fHP5lVoNNGWdRI5BT8cfPefxCnhYYZsIzZsYFRnYu0csj
         hvwUwzFiYOSIVzSyhg/njvC2M6TH/hCy7sxSEOATuLOTvnjhmAT4G66m07GrlqLghfH3
         AaTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=trAtQTtj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c11si1327318qtc.454.2022.01.20.07.56.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Jan 2022 07:56:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=trAtQTtj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nAZnb-0005x1-Qt
	for alex.bennee@linaro.org; Thu, 20 Jan 2022 10:56:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAVpY-0003x2-QS
 for qemu-arm@nongnu.org; Thu, 20 Jan 2022 06:42:16 -0500
Received: from [2a00:1450:4864:20::336] (port=56036
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAVpX-0000Hi-7V
 for qemu-arm@nongnu.org; Thu, 20 Jan 2022 06:42:16 -0500
Received: by mail-wm1-x336.google.com with SMTP id c66so11455355wma.5
 for <qemu-arm@nongnu.org>; Thu, 20 Jan 2022 03:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PoFmUAe2U/9+Q8HlewAE973W1wbfT1HXpWq4wD7Fl4U=;
 b=trAtQTtjGtKTSG8jkqio6A5N2u6l+MX2UEDq2kFLocVm6luoS2zu4WP/4W7SMygDhI
 xpj4NPMshAGXrnet1U+yuHySGx+MOnJeJf2OkrVz5vL4SldsJT0SyW0RQIlu6MKM2DZp
 U8zaRAXp6CREUV+Phaj1pwInYURYpC89F3PCwsJguhyPFkcks7AMGpAFbifOSRSKFj6M
 gWJY8of6Tr3aukufCa7z/VI0srj4/IDcgHv11TRe6dfG15W2IarbetmU5RrzXEz1rG6z
 PwHqO3brbSJTbiK5/F68zhPzIUpY7cS36ir42DHTK+EH2a0PRdECWbu8rQR06SoOVn60
 kXEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PoFmUAe2U/9+Q8HlewAE973W1wbfT1HXpWq4wD7Fl4U=;
 b=yh5uQVgKPSsAhkl2oFnmU/MxjseuWaW0OgTVnIVCapB4YqeFTsrShzxffaU39y4Tfz
 77SZGG/gh3hMgYckVs9vU5mbFm9ui2RNp5xW7wpHh1jlxnlAqz6LX0rUhZdJcn93/+An
 YuJZF/AMIf/tFYnSJCEBR/sJwDLJh2u5P40wX6ACpbyY0VDWmZfkFaALZAVKlrAoNPep
 RqGpPDR/C9/JDUYqVnjnWKOTGTmn7eMLhAbdALMpE1L4AzFulIYRHuZsMDX84yC6WhoI
 09hAaUB7g3KD8HLO/HhixX+x4zJZ02bnPgIiHmFebDvNtjwMJcbAP2gbrSYFxMmAlt54
 SiLA==
X-Gm-Message-State: AOAM531FMA9SgoiSxI1OmzGQ1eSCnDqX5b9Ni/yrD4oTPavxvm9GbQXw
 zcq7PnPRgKEdcstxv3Nm3crxXN+jkouB1vf+SEF7ZQ==
X-Received: by 2002:a05:600c:d3:: with SMTP id
 u19mr2826274wmm.37.1642678933707; 
 Thu, 20 Jan 2022 03:42:13 -0800 (PST)
MIME-Version: 1.0
References: <20220114004033.295199-1-idan.horowitz@gmail.com>
In-Reply-To: <20220114004033.295199-1-idan.horowitz@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Jan 2022 11:42:02 +0000
Message-ID: <CAFEAcA96gKH8r_a2aV0bfcOR418WnRkmEsV73Uss0kDEQ2Tx4w@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Allow only specific instructions based on the
 SCTLR_EL1.UCI bit
To: Idan Horowitz <idan.horowitz@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cLbazFsrNCGZ

On Fri, 14 Jan 2022 at 00:40, Idan Horowitz <idan.horowitz@gmail.com> wrote:
>
> The SCTLR_EL1.UCI bit only affects a subset of cache maintenance
> instructions as specified by the specification. Any other cache
> maintenance instructions must still be trapped from EL0.

Hi; thanks for this patch. Do you have a test case which
demonstrates this behaviour? From reading the patch I
can't see any instructions where the patch changes the
behaviour of the emulation.

As far as I can see, the commit effectively changes the
accessfn for the following instructions to one which does
not check the UCI bit:
AArch64
 IC IALLUIS
 IC IALLU
 DC IVAC
 DC IGVAC
 DC IGDVAC
AArch32
 ICIALLUIS
 ICIALLU
 ICIMVAU
 DCCMVAU
 DCIMVAC
 DCCMVAC
 DCCIMVAC

and it is true that the architecture says that UCI
doesn't affect these instructions; they always UNDEF at EL0.

But for all of these instructions the reginfo struct
sets ".access = PL1_W". The .access field is always
checked before the .accessfn, so for any of these instructions
executed from EL0 I think we will always fail the .access
check and UNDEF the insn without calling the .accessfn.
So it doesn't matter that the .accessfn has "if EL0 then
check SCTLR_EL1.UCI", because when running the accessfn
for these insns we can never be in EL0.

Am I missing something?

thanks
-- PMM
