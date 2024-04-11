Received: by 2002:a17:907:6195:b0:a52:fc6:5c40 with SMTP id mt21csp901872ejc;
        Thu, 11 Apr 2024 05:01:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWAGmAG2FODrXWDkutVwPj4057XJl3xfu48/97x8wnOG4fhxsCd79QTtwN2c8uGByYZ6/BfMVpNbUhxeLOBYsr4/Qafv8No
X-Google-Smtp-Source: AGHT+IGod2G/WDX6xOQGpTB7I4voE9XWlosXrcKDgEkt7XZogN8sDWY3OX4HdqCs8xRUWdpG3Jts
X-Received: by 2002:a05:620a:3bd6:b0:78b:eb70:df7d with SMTP id yf22-20020a05620a3bd600b0078beb70df7dmr5975539qkn.61.1712836919638;
        Thu, 11 Apr 2024 05:01:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712836919; cv=none;
        d=google.com; s=arc-20160816;
        b=mgBOCgroX1aYJVynoKYa12Cuu7cuMNI1AcxL/Kw7Uqr8Bg4uXxrVgyoQDG/r+/yQHI
         vf9gAZ44gyIQTabFIMOtb8C2JIYfMCUa680ZCfl46wPyE2XM13Hxc0HaaFcUm7ir1Fmm
         QrJNo/HEccNiGBRZ61FGzghMp2LvAen3ajKZ9nUttr0XBwb6DydnvVDNqToq6E0UH/Wt
         uQaT2qe1B8eLKgxKb7rytbZjt2WpMkORbHge8YOpZFBPXuPA+xhUXNbhDXupgyHPGo0e
         xjWeoc4H76BLwQ7Uf8m4x4eGPoWs4AFXl/4wvEg3cSglPlLrrc9fqA+fN7o3eQ6PcGK6
         QKwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=veCA5XuoiI2x3nFfPCI/nxUC6o5oC93sOeqtZpyyTvE=;
        fh=cVdmcr5/X4efLWjQZfymfQTZ/nnUmznxe+D0HOKdl0A=;
        b=dcwKjuYhumvA2bppVnANPlwCzcm6vgB6vk6ywnmFQpo/UfcShe4bl6i8gf74jS9FV+
         1rAo/bWtcz5AdDQ6hf3z/UfJTPCGIJMVTlQSGUkocmgyGaHsnaaBtNx2gmA1OjSDbeHh
         FT1UZUmrp/4tXcqHpROgMMfslEyL+J9TSC/OtJtz7hz9WCAc2QH7O4UJnTCjlC+80kNv
         2+2RGONpnbGDMXNvm/QPGblKHlf0TZjZG4cUkBjv0nFVwxbKjj2+B/rPCfK6JPxZgBKP
         gKzKRLAFvt4EW1rRDJmO+lPxRTbnwP0dk0WIqHXQVpfL12OK7qLF6KVmjmmoNA7Lu93Q
         /I7g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JwZ9+Kk0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp20-20020a05620a459400b0078d660e8c23si1491732qkb.479.2024.04.11.05.01.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2024 05:01:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JwZ9+Kk0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rut7n-0001JE-Mu; Thu, 11 Apr 2024 08:01:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rut7k-00016A-6b
 for qemu-devel@nongnu.org; Thu, 11 Apr 2024 08:01:48 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rut7i-0003JS-KJ
 for qemu-devel@nongnu.org; Thu, 11 Apr 2024 08:01:47 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-56e6acb39d4so5117320a12.1
 for <qemu-devel@nongnu.org>; Thu, 11 Apr 2024 05:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712836905; x=1713441705; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=veCA5XuoiI2x3nFfPCI/nxUC6o5oC93sOeqtZpyyTvE=;
 b=JwZ9+Kk0QuqtWx3r3zvma2I5YcnoxC919n0M2cyUYTLCa+44RE0tVfMU2WKAb/F+/G
 14O/RnZptmAWBLMHEfgMajo79rn6+q91/roHooA++p/MkMcAyTz1825Fv2mxf2L4nwq5
 CcyWLj/0ZaRJ7rBNT3wcp1PE4OQYh/X49qiE1uRPLyiO9Xc3SRDCH3KICv8Xa/k765So
 pD+A6igGglgihUIrzN5YUAxAOlcJhI0Ac8klZXilh/d6g0+sQbWq1Beba58GiP5eDo7v
 kCBRHdgOGJULcPzOfd7Cjdjkl5LS78UOBJbk2paBYGtWv7iM66MPGtrTxkI3U+5woGW1
 lkag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712836905; x=1713441705;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=veCA5XuoiI2x3nFfPCI/nxUC6o5oC93sOeqtZpyyTvE=;
 b=n3dhVFFkdtAY1la62gP/YYyoiDvzcMm8fgKc2E+RL3VT94JpJyUZZssqvoV+iQT0ju
 1/7bF7QKKkQlWWTgTSH5SNUka9zDzmPBV1nxfob3+VTi7pyTkoSL0zNTMcNQgdH0A3a1
 +eZKU/CCRc8bcSLgD1ym2F4aihLP7vKf9HJqtIayNTMm33yy/NGu6i/fFJrVBC2LRSsu
 owqsjWjKBAmuhF4UQ3SpGYLJ20ZuI2ZeIuHwbcmy/XzpwANY834sG8UXbvyW6FUzwZZL
 qWrtcAiyjLv0UFYefq/iUZLyOGu/In1JIcEuonliPkxy5pH8hCvEPcPodK7HCM2zqc2C
 fOtA==
X-Gm-Message-State: AOJu0YzdA97KptSneLLfYeCEGIiobrWDr7LihkPxxmmyK+UGauYCnvr+
 NKw0h8allN2WMhril0S9vln5bIQp2h8+n+oKriP3BI6iB9iyKkyR4iET7MPyf+e82pxuJmTH5Ho
 qCP90XGSz40tQt/LdeTwQRxD4DxwnQUZGO6HnFA==
X-Received: by 2002:a50:cddb:0:b0:56e:7884:9c7 with SMTP id
 h27-20020a50cddb000000b0056e788409c7mr3957528edj.19.1712836905190; Thu, 11
 Apr 2024 05:01:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240411104340.6617-1-philmd@linaro.org>
 <20240411104340.6617-2-philmd@linaro.org>
In-Reply-To: <20240411104340.6617-2-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Apr 2024 13:01:34 +0100
Message-ID: <CAFEAcA_N8yFY15v=QrCOAOPPPnsrfZk2Pqm_CBmxaj_8Gvf1xg@mail.gmail.com>
Subject: Re: [PATCH 1/9] disas/m68k: Replace sprintf() by snprintf()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: Okl2qr1+8z+l

On Thu, 11 Apr 2024 at 11:44, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> sprintf() is deprecated on Darwin since macOS 13.0 / XCode 14.1,
> resulting in painful developper experience. Use snprintf() instead.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  disas/m68k.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
