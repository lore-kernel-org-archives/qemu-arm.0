Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp3945988lfc;
        Mon, 19 Jul 2021 08:29:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypLd8fFUaQXZjak6Uju0MRRu89WXtnXeLIm22CA1oW2taUhAkeHyvjWuOFfKCnShRIV0Nd
X-Received: by 2002:a0c:c3d1:: with SMTP id p17mr25127148qvi.44.1626708561107;
        Mon, 19 Jul 2021 08:29:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626708561; cv=none;
        d=google.com; s=arc-20160816;
        b=wSiALMJcZKXBWmN4hEitms6V1J9T5Cmi33+gtsYN+JQmpF/aGJ2CRkyNGr++gdWMmt
         lasxmFBg1bmLVVhhLxDm0UlubSwBAlKguT5R+cAJn9w/Np6oo7aV4l2Of88ier22QIB3
         RFo0oN+a3mCLavmppbdtGUPb74HEZCDR17gXb/QgOLvBdnha/wAD7yz5y2RzUbZkej/D
         OFOuRnoSRETWFYOfNMSTiQfrSby7cWH+Sr6x3kem0GTP7JK6ag7qT9g92xvvBLEhYgEA
         W9eeJ6z8mkoLWC4HEYYwUuNg+O8RdNulxdVKFfkupmjPMUQpga8/0vYpY30CrwwgB00/
         Pk3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R+EUD+jkGMlz9G2KAc85rFEOmUwo3IRiFL7mZwVnLzQ=;
        b=V1n/w5p9q7v1Yn1BoG4xWa0xRHkzGUhQTXrD8o98yWq8R9jeuBvZR+HC2eEKYrlQRD
         +nh/jvkL95X1GsKqCqtqzmXGb0GeG6pgAxhePuGdlXxe1gA1WMaWhbsPLMkGD/eLUS+h
         +j82hqM0ovY6yURU8Wxn1y+O+VLle5vlKVrhszBI1Rq+aZ6RmEIHX7IEBABdyurs85Oa
         gAmCXQ2sMCq7Hj+mM9/RyPPVgbezjxyiDxD2CHQscJN01a6lf7SL7Wo+R4wefaGhaK8U
         OukoGjF3JBwyT7pvV4vDad3UlIAOMVWkW+cZZc3NS9+PpxlnnF17yExRRH3fLSr4VSHD
         SYRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RzLKDyEy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o5si16083450qtw.232.2021.07.19.08.29.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jul 2021 08:29:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RzLKDyEy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m5VCq-0007fu-37
	for alex.bennee@linaro.org; Mon, 19 Jul 2021 11:29:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5VCg-0007ct-TR
 for qemu-arm@nongnu.org; Mon, 19 Jul 2021 11:29:10 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:46958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5VCf-0008HK-D7
 for qemu-arm@nongnu.org; Mon, 19 Jul 2021 11:29:10 -0400
Received: by mail-ej1-x62c.google.com with SMTP id c17so29313362ejk.13
 for <qemu-arm@nongnu.org>; Mon, 19 Jul 2021 08:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R+EUD+jkGMlz9G2KAc85rFEOmUwo3IRiFL7mZwVnLzQ=;
 b=RzLKDyEy3g17YBG3AZqpJfOf8fuFy15iewV+xQni/w4SkjMlvTS7oAtCTedKCMaACn
 a3D66Sc8zfyvUBbABWAljzN6ei99dOBOQ7XmD53oCJm1RCeRQDPM+Ug4dcTHgqiSKOly
 hCR44IKOHmL6JtOl3JwyxEOu7PS94UbLvfQSIAMoNb8pQbyNFmbBYXgnASZWjXMUoOdS
 PT2nys9ap1ciwUxETBR2WLamE589QryTuFw1oYsaelPAsl1bElPADTV1O8eUtVIvTuYu
 ty7abbnlXEhhI4JibAGKg6dGWeFcmVPuPcCZWIMNF7BsO8AQbtecEyR3GR81b14XFr6p
 66qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R+EUD+jkGMlz9G2KAc85rFEOmUwo3IRiFL7mZwVnLzQ=;
 b=jKW1bz4RGUFHk6zD3OPxBnnepIuVcST2gsF14OZKpMkPLTJCeErOkfa3mhZNt3k2iI
 CRbVlhY4MpUIB6XFTl2Hh/est77xwSlf90eLI7+/fxAYvRw5/4IRgMhGy5HexSjvc7nE
 TIQDdgU/loouQ1IwfgEIFMi6pL5Jf9A/5HZtvPwRIk8BqumUrdKcHS4eSPmRnT+00O8X
 P/aHtob4tC5HeDSWOsVybP5AXM48ZIodyzDZ0tyPGRpX2U2IuMrlPdUeB7eYOufWD6Lz
 DIVXvnb/yrcM4/12JtfMhCq4xBZ0LH+FG1ucTQzxPhblPMX6S2Cs+II1qa5uzYz/diEv
 dZSQ==
X-Gm-Message-State: AOAM530/TEn/T0H9ocCfIzUbmB4aB29bBmo5iqioLxQGnRDPVqO/JJj8
 XL6UD8ooIJ8f/b6pf/HtuGNgpxwjC2vmvr/Bhc6e9Q==
X-Received: by 2002:a17:906:16cd:: with SMTP id
 t13mr28317714ejd.250.1626708547931; 
 Mon, 19 Jul 2021 08:29:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-21-peter.maydell@linaro.org>
 <b38a6e37-084b-57c1-dc91-867e9308629b@linaro.org>
In-Reply-To: <b38a6e37-084b-57c1-dc91-867e9308629b@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Jul 2021 16:28:27 +0100
Message-ID: <CAFEAcA81nfSPcYDk1FsVqAcxq5D4NXhtXP5c90_0MLtBVxvr0g@mail.gmail.com>
Subject: Re: [PATCH for-6.2 20/34] target/arm: Implement MVE integer min/max
 across vector
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ENr33k2P4ys6

On Sat, 17 Jul 2021 at 21:46, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 7/13/21 6:37 AM, Peter Maydell wrote:
> > +/* Max and min of absolute values */
> > +static int64_t do_maxa(int64_t n, int64_t m)
> > +{
> > +    if (n < 0) {
> > +        n = -n;
> > +    }
> > +    if (m < 0) {
> > +        m = -m;
> > +    }
> > +    return MAX(n, m);
> > +}
>
> This doesn't look quite right.  The n operand is extracted unsigned, and only the m
> operand is subjected to ABS.

Yes, you're right (this patch does always extract ra (here n)
unsigned, so the only case where it makes a difference is
VMINAV when the input ra is negative). I noticed this wrinkle
when implementing the FP variant of this insn, but missed it here.

-- PMM
