Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp264782lfk;
        Thu, 21 Apr 2022 04:10:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0cTOOO/N6gF9CUq25aQ9vbtJCuucinMHXpN2x2xAfMsWE6aMm6NJ0HJxFZmEn6bBQngmT
X-Received: by 2002:a05:620a:2954:b0:69e:e717:dbfd with SMTP id n20-20020a05620a295400b0069ee717dbfdmr3320940qkp.31.1650539438325;
        Thu, 21 Apr 2022 04:10:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650539438; cv=none;
        d=google.com; s=arc-20160816;
        b=dYAaDcnewaAEeJwR+TllfRIQSuQnXkStvezwOGQcInHt8DHxbXniIDFvPvZy7z2uF+
         i7s2VjHTfFWAMhod4LvYTfSOOUU91gQPW7pmG1BUk1xz5yv0wVllBdWktTZjcg1snMY9
         2mDT3U5ty32MQ64J1mAhcCdq1E2NBOnVvpwv8awbn7mvnFQU5CePEHqpgI4fr3Oai3LB
         Mjs1e8k+e2qa98S3YICgEqsSXPJwALdmnG/D2260C3sWUkmBBaBV6DzA7IIiSRs7+pj1
         BjMRorUvdZ3b4fDUaDD3Jpxow/9YBUzcRAAWWQte+5G5KLWQntS7KmzHQbWEUtZHuKFz
         ebng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U8Awzqlv1FfNretMZ6KpeVs2UOw1mEk5H2Fea9GI9pQ=;
        b=cSzwl2wxcZwgdW3y9MrbAFVwzp8KGPEEj2hNMHctOq7T5NTOLTGWVL76LvcRMxLSpi
         uRKVPajORqRAmLv+/NgSRTBYA33EIXIX2EUKWLgiTHkl6I4X8SUvheVz/BsaPA0edR5Y
         pVJaGWACoA09H4/jabU5A2q8sd8Veed0zfMESSxj8yTTUNLSvsOtEUix9XIRzsX70iTH
         CyWfx5OblFOo3BW5XiqJxbFvv62IvdpM7XNnriE4r6XoMHfwGUypYJUCks/ZaJgkgCo8
         HVVa6yyLgWZ7a1Pwx3WWwoJP4oGIGEmE9LtLpz+Jshfk16GZx8ulhPBsUqS89kt7D0Xw
         dYVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=i5TMhyFX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h3-20020a05620a400300b0069ec2139545si1397652qko.316.2022.04.21.04.10.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Apr 2022 04:10:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=i5TMhyFX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nhUhp-0000eh-SW
	for alex.bennee@linaro.org; Thu, 21 Apr 2022 07:10:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUV0-00029d-Et
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 06:57:22 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:40075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUUy-0007MJ-Pc
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 06:57:21 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-2ec05db3dfbso47730597b3.7
 for <qemu-arm@nongnu.org>; Thu, 21 Apr 2022 03:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U8Awzqlv1FfNretMZ6KpeVs2UOw1mEk5H2Fea9GI9pQ=;
 b=i5TMhyFXc3mXXVi4vD9ahuied72U2E2THbOYk82eLPvmxwtuDyFUdVih6hqK8iTIXO
 xFZf8Xmg99FB45kii1k9krwtfA6mV/Hj47dQTayHMgNz0rBdts8TnJQNlv9zvWaoQCVu
 GX4Fk+6JUVAhnkX/lXcBn4qwhaOxqeh5BZDlPjs+cqKKfG9+SGjFD0CSL0k4LIoooVkD
 2dsjdsuuuTDYeByXaB4yj9Y0N1nhssDdv8mWeeVaT8zs1DhCCHLd4GLERQ5ban471Onh
 /EyBFRac0cxSgDKyQiDaCRL0/tCu8iOpe+01EDC2OxYJpUZASS5ibYfQwpLAf3B/Z3Ts
 3zag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U8Awzqlv1FfNretMZ6KpeVs2UOw1mEk5H2Fea9GI9pQ=;
 b=pzb/CgYDdolBnenOWE7/7jc2TTJqY7u2ybgAkkVMeMMYRw+9LtQ5aowMZOdqQjHZ0z
 p/rFkhkxMecnZyyYSY8XLMMy7oDNn1OPOs8/tzExfxKAq0p+R4p8JZndD+DYp2vXyJXP
 9QvAw3WTsR5IiQrGIXFQtUnDZbRKF3U6fbGMmSdTmcAwtExww+GbQX3XtHkr3gQr666h
 gCTB/VeB9lqssG30cYkBIJ0JmqsubsOuu1ohIcYuUuEFqJWzyjRE/72yuRImL8YnZeRC
 wDuuRN4eU7d9j+jYrlOjmJJ5VCvKKe2HK6WP0LJLkts1bzY5VOo+NYbeKH0Z1uVIV3TU
 +wzw==
X-Gm-Message-State: AOAM53260DyzA/MEA1iXj1Udd4P2gOMwD1MFg6wfPra/vplfV25flQpx
 K13yKFJDUukY7nwL9D7V973BwCknzfX9jHyFaKbiPw==
X-Received: by 2002:a81:13d6:0:b0:2ec:2b3f:28c6 with SMTP id
 205-20020a8113d6000000b002ec2b3f28c6mr25231404ywt.10.1650538639456; Thu, 21
 Apr 2022 03:57:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220405223640.2595730-1-wuhaotsh@google.com>
 <20220405223640.2595730-6-wuhaotsh@google.com>
In-Reply-To: <20220405223640.2595730-6-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 11:57:08 +0100
Message-ID: <CAFEAcA_1v0yAscm-6gOjBkCYjOKv53f3-A0-RgVjQ4O2rwrHjg@mail.gmail.com>
Subject: Re: [PATCH for-7.1 05/11] hw/misc: Store DRAM size in NPCM8XX GCR
 Module
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
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
Cc: Uri.Trichter@nuvoton.com, titusr@google.com, venture@google.com,
 hskinnemoen@google.com, qemu-devel@nongnu.org, kfting@nuvoton.com,
 qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com, Vishal.Soni@microsoft.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vefnZa/croNr

On Tue, 5 Apr 2022 at 23:38, Hao Wu <wuhaotsh@google.com> wrote:
>
> NPCM8XX boot block stores the DRAM size in SCRPAD_B register in GCR
> module. Since we don't simulate a detailed memory controller, we
> need to store this information directly similar to the NPCM7XX's
> INCTR3 register.
>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> Reviwed-by: Titus Rwantare <titusr@google.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
