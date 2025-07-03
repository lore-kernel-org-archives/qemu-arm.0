Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp507167dyc;
        Thu, 3 Jul 2025 05:41:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWWDPTW95n/qfk7qiUhsA8EdEkwAC2DQDRSoL+Cc7Clw350GGekJWae0HLdNhdIbGn4izQJSuynjibVAA==@linaro.org
X-Google-Smtp-Source: AGHT+IF/TNYus9AylRBwa96I8uwFSJTxPtUeY6WoAcHVIHqw8qx8h0uoQco7Gphl6Gag+ttxVfKF
X-Received: by 2002:a05:622a:2287:b0:494:b1f9:d678 with SMTP id d75a77b69052e-4a987dd2068mr56614711cf.50.1751546502844;
        Thu, 03 Jul 2025 05:41:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751546502; cv=none;
        d=google.com; s=arc-20240605;
        b=YgTlc0mk7gyoAzTWIh/y1ZJdv7SeZanoUSbbvTejNWSPvOa5AYoe3IQL6oGz4b5rlf
         mmiwJFcaGshBzXq+C0KhqZBHfCPHzaEfExZ8xTXqznconH0Tnpm2Jm8mfHZ5DZSW4Eyc
         7hjvEZwLAW/xf/EnNzwp0evjLe8oRgSh5WttrY0PKFJpJNmrXZCo4jcpcfZkWLOPaub5
         Z4CHh5w8+o2C0+gTsrUQutZ6Zbo8XNFT5eTSSD1JzXsCLcn1CaBmjP+Jgbbf3UdoU/HE
         1KxjzRMyYF4HXDMofPHZDSXrBWkuiJFPqt7zHBC3fPawSuEH2axWn2hokFaU6irugupf
         ZvWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=MbwHfSYOzTD/+GpLtxGAQljhFOKUTGJFolh8GMFFVXQ=;
        fh=/E6mNbOiAXrrs0VOHvxx5N8mceeTl7+34ae03++i7+o=;
        b=V3CxIlCoZqLMMIJss4IFrcc8qFkk7C2lsnOM2cRflN8iUL96r6hVPOC8ZJL2Ya6Ow/
         lusSfvfpfYePNFeYlj27cdEAZuf1hlZgZr6RKf8tLSRxsAzkCIHvDgjezgxJIEfFfR8t
         rxP+kZd8k2qqR/uEin+WhRXFjTkCuZawZAWu6V63lNw0T4gYcgcdDsW2KLIbg9mmn5lA
         rJEO5ap9Fij9vzAwg9g6bUQPD16Gjckf+c0gazGk7WqFmeK90QESLxOqZT/z8ghaIcup
         lzHeB9G4zyqSDknTIozIJNX3pGDd4Pa6YklYUhHz4bDDFuJ/uBVb38xN4M6OgLKanZDx
         N1oA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PB4uGzyy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc1e4dfesi157359701cf.173.2025.07.03.05.41.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 05:41:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PB4uGzyy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXJCT-0007vs-9j; Thu, 03 Jul 2025 08:38:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXJCQ-0007pV-0V
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 08:37:58 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXJCJ-0008S2-Lj
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 08:37:57 -0400
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-e7dc89108bfso7003784276.3
 for <qemu-arm@nongnu.org>; Thu, 03 Jul 2025 05:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751546267; x=1752151067; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MbwHfSYOzTD/+GpLtxGAQljhFOKUTGJFolh8GMFFVXQ=;
 b=PB4uGzyyuMM9iPGf9ns0pLm8SLe3yEkjsTe0nI2P3FmAAlXx9GFYWf0BJMAu4Lv0CG
 rYjbnWZh1AO6A3Hz5Ibqpoz4awfdbGPHmbHMjPaatGiQTAJLGDhLPIIrJpFraypVu/ad
 yc9HBHUn8XGDHrVYLWblw4L3DfHWU5FNXQW/Vg9wpwCm/yjLic7Kn/MMC0+60bmtlEwm
 DoHzEDtw0yLxMvONVwfKJ4fs/QP5WbvJy/N+MH4768jxozKFmcPsZYQKUbgkvbA+bpHC
 H0cYG0uYNPaGnSAqdXsQ5HrP6hw21PW4iS5kp210anZlpKKIVuB32arqS1AVLDCqLOo0
 PDuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751546267; x=1752151067;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MbwHfSYOzTD/+GpLtxGAQljhFOKUTGJFolh8GMFFVXQ=;
 b=BDX/X89gSIP/HbLE7uw+Ek/G2MapOsCsmHT2jlewkk2xnXzz5gxHRRum44dMHGgkQL
 dJAc36HrPIbzpUArDselgE7yEwW+Zvy4MY6He8f68xuZK/BfeJT90MGMYZY07B3so6l4
 iSc3dgk//ZNifrvIc4d7D4CwyV3DBVdi8kcSHeM4RfhgW7OUXohWsfuJH2NKPXJLISTk
 Uxmdw3uQ+LpCQ5WALpXqHcDulnnWSwprmKvxSEQZSFWDdETTGYaVT4rMELv4nHdjR0s+
 RAzkSyDvv1PUSexC6Jq9iBmkhrEQ2opx7WqKneEKm7rNKp8Bgvl4va5OqO3by7JSk5jU
 cBeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoRnoAe8yqN4Mfh/mreZFAWXcX2vQrOftKsrGfbuSgr4I26HqHuh8+ZR2XfTFFto9YiuaCJGkQGg==@nongnu.org
X-Gm-Message-State: AOJu0YzUUO18/5yCII8sBdX+1A8IyfASm3ao4+LrbYJSl7ZoP9TT6asm
 SnO15E8wKGQ94SR+fgieq3JoLVCzPH/etEmEZwo+jFL3CGaWoDW5tBO3JMJBcqbATnu7cjw+vxB
 6vrs+uBI8/7sCdtWBi2mWtyUzi3cpWwEK1NnYLe/2vBb9+E19LZyl
X-Gm-Gg: ASbGncsVvEHyckNO4IElG5HVdx0z+jkMM46HqwIoEUyuhXQlh5Ku4mCjsLezLNov9ss
 8WCDiKTpTgGbdqFQKTg1X1ArA4bXWbEJ+E7L1YE+TWwg/DRMzRV4IxEwqH2dJ4302C3zG7zEN/A
 BZxiuW5huulV3Kb9RMOdlRWL6h+6KJTmTLzaBrFl2WH0BF3JvWcWrLhUQ=
X-Received: by 2002:a05:690c:dd4:b0:6fe:d759:b187 with SMTP id
 00721157ae682-7165a3b7be5mr36635047b3.24.1751546267496; Thu, 03 Jul 2025
 05:37:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250702123410.761208-1-richard.henderson@linaro.org>
 <20250702123410.761208-88-richard.henderson@linaro.org>
In-Reply-To: <20250702123410.761208-88-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jul 2025 13:37:35 +0100
X-Gm-Features: Ac12FXymvlBwTPubxjUJt9ncJ3qhLC_oGYQhX_dgItnm5W3OG1RI4OcGiYyKCHs
Message-ID: <CAFEAcA8_bedSNBLx1ww=3YeZ_EZUcv4arNs_LejeyzsbSnb8vA@mail.gmail.com>
Subject: Re: [PATCH v3 87/97] target/arm: Implement LD1Q, ST1Q for SVE2p1
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: jPy2VOlV18fk

On Wed, 2 Jul 2025 at 13:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/helper-sve.h    | 16 ++++++++++++++++
>  target/arm/tcg/sve_helper.c    |  6 ++++++
>  target/arm/tcg/translate-sve.c | 34 ++++++++++++++++++++++++++++++++--
>  target/arm/tcg/sve.decode      |  8 ++++++++
>  4 files changed, 62 insertions(+), 2 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
