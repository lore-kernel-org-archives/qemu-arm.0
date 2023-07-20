Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp7766929eje;
        Thu, 20 Jul 2023 05:06:42 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFNV3ad6aWVlWTaL5We4uE8gFLIsElWGqVtShEG2wAMjbFf1zOEtJ6Wh97H2F/EPH7tJSDd
X-Received: by 2002:a67:ef81:0:b0:440:a760:dc9d with SMTP id r1-20020a67ef81000000b00440a760dc9dmr3809647vsp.16.1689854802180;
        Thu, 20 Jul 2023 05:06:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689854802; cv=none;
        d=google.com; s=arc-20160816;
        b=ccSVxXpmEWsrSlqDFg/X14jOPUcAbrUiZcqiEAKO1pI/FWbucq3WDnUfFYJLIKbFjp
         rRLWjjC3CTDrfBRmmfL62vBfpLzJLbJSjJg7asi/tolMNUuWruYIbTWBiKJ2aKWtAIOD
         f8/3xA8JwzuvSPcm7XzXOguaDmDQ4dFqLy12N2FrTePrhFLNs0Cs57JTgFol47sE6waP
         YHniDAivrOBUqmJinau4/ZykDPG6JeruXnCE4DCs0y9l7XegjZ65Ctrl0VBKVulEnV/y
         Bq99SIeAe491qlSZBHgzyGm+gKiEVRzfKUYkaQrhFFQA51Coq5UlAqVc9E/EXjd3tbYN
         rsSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=+dDEQ1p4PQhlb6pPBixSFCjoLSgaIPSCDKEbYVn0FhE=;
        fh=CEa3UdY0L+UQ/2T/5R8rkDkdq4jlW1F1hWJjDNQD42w=;
        b=spyEHjtj2NNVTEQWHKFa6onR+SnL+m4sQ3T/tQ1wypp5nteVPJ5NeHAXWSqO0KKW75
         QvCP7I5jTPW+Uu4/RYQFbUjg3C9laAVKTP0wNHBzGW2LLX9uisKFwXYxRgenoDS8sZjJ
         RFBG5rn0J/W0UixrsSKbfXxcBTHE+n90RRe2gCS6rvDyYhJq22t+NsvCIRc5rHKuscA2
         BUhCPF4ZSOQxn1zIq+C1Ny3MvqOvIIMP7qEr2mCjWv2Lqh8dmCJqzsnnEZanA58JCbJt
         8lekxp4loQGv0HcoQB/OBosa3DmqzHtMp63atGTR2+611EtzFSWfMQ6kfiQZX4Kk1I1U
         /58Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="kaWK/dX9";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ea4-20020a05620a488400b00767dc52431asi213179qkb.734.2023.07.20.05.06.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Jul 2023 05:06:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="kaWK/dX9";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qMSQL-0000qZ-DS; Thu, 20 Jul 2023 08:06:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qMSQ9-0000ok-Vm
 for qemu-arm@nongnu.org; Thu, 20 Jul 2023 08:06:14 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qMSQ8-0006JL-6p
 for qemu-arm@nongnu.org; Thu, 20 Jul 2023 08:06:13 -0400
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4fb960b7c9dso1126081e87.0
 for <qemu-arm@nongnu.org>; Thu, 20 Jul 2023 05:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689854769; x=1690459569;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+dDEQ1p4PQhlb6pPBixSFCjoLSgaIPSCDKEbYVn0FhE=;
 b=kaWK/dX94oD2MkNSA6MU7FqisWviazMYwkSQxO2+x2MPhz7NaHs3qiB17RQhS2rLvE
 OA289ZNllAdePuGgCfFufZ6V8+S7J/PFvNHXsSk9uuYEjaUXGKafqLDrYE+mHvXpcDAA
 6Yxrj+YZO7wEGFLMkD9jji8GscJf6KC+bBQ3FUefbKwD2gw0tjEBdGejBrL/TRqF0pIl
 lLmCY5BvmDT+4PzyZExEMXN00Xsnd543RTbC2bpNzmJIb9vxpLN6/JBsJhlUxeM2dveL
 PkwD2r8T2lS+NeBAZ/bpPLLMto/sx9ExO72dMjfUeuO6qRvW8KdblexeIdcqkS2Oa0YF
 oyMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689854769; x=1690459569;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+dDEQ1p4PQhlb6pPBixSFCjoLSgaIPSCDKEbYVn0FhE=;
 b=lNTYYTYY1qFbYXqZ0U2sXb4B/FXvlKQflYKDxQbmynUC96SLvQA7QhzehhajbilQUd
 wS1aOnoORRwt/ZaYYrjl9WkFFeJvqi88blg/vuSZPy84YyvK/v8uILEytfaUE3C0hLIc
 IV7kDpaMg9j9Uz+AO0g+g0ApQWmbCZc0vzqa7jaCOB9bvgn9y8wYEXbqr0TPzJAs0ttG
 G/W5Czazu5FsG3/yeo+yxYDbHrGN43yDmD2hWbcyAunuBEe59A1bEvZf77zcptuBKr9W
 jAGf2j8B7QkUJjPSYAnmlmjHH2oCF8BzqXAHmvILX5wfDBAsEOtJK1H4XdKeydVB6zqg
 nbzQ==
X-Gm-Message-State: ABy/qLaKN7guggsLPadk/mof+X7j+Hc+1MfIDMhWiMPaJ4K99Zc8nrFa
 s1mfBZjhGbqNUSr0J2m7jQbLlAmTYi6MPIT6DcpPtg==
X-Received: by 2002:a05:6512:523:b0:4f8:7503:203f with SMTP id
 o3-20020a056512052300b004f87503203fmr1898168lfc.48.1689854769259; Thu, 20 Jul
 2023 05:06:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230719153018.1456180-2-jean-philippe@linaro.org>
In-Reply-To: <20230719153018.1456180-2-jean-philippe@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Jul 2023 13:05:58 +0100
Message-ID: <CAFEAcA9sfezZEHVXFT1bTA=1oiEy_ayc0xePJHPKVf87P3E-Mg@mail.gmail.com>
Subject: Re: [PATCH 0/5] target/arm: Fixes for RME
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x12e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: EZz5OA5Cokew

On Wed, 19 Jul 2023 at 16:56, Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> With these patches I'm able to boot a Realm guest under
> "-cpu max,x-rme=on". They are based on Peter's series which fixes
> handling of NSTable:
> https://lore.kernel.org/qemu-devel/20230714154648.327466-1-peter.maydell@linaro.org/

Thanks for testing this -- this is a lot closer to
working out of the box than I thought we might be :-)
I'm tempted to try to put these fixes (and my ptw patchset)
into 8.1, but OTOH I suspect work on Realm guests will probably
still want to use a bleeding-edge QEMU for other bugs we're
going to discover over the next few months, so IDK. We'll
see how code review goes on those, I guess.

> Running a Realm guest requires components at EL3 and R-EL2. Some rough
> support for TF-A and RMM is available here:
> https://jpbrucker.net/git/tf-a/log/?h=qemu-rme
> https://jpbrucker.net/git/rmm/log/?h=qemu-rme
> I'll clean this up before sending it out.
>
> I also need to manually disable FEAT_SME in QEMU in order to boot this,

Do you mean you needed to do something more invasive than
'-cpu max,x-rme=on,sme=off' ?

> otherwise the Linux host fails to boot because hyp-stub accesses to SME
> regs are trapped to EL3, which doesn't support RME+SME at the moment.
> The right fix is probably in TF-A but I haven't investigated yet.

thanks
-- PMM
