Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp314729njb;
        Tue, 4 Feb 2025 08:09:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUqwc48o7f8pv3cn6tOLzMSswYJ1GqEPxC9irdvetLwzxCA8tzklQNCfmxHLpUQj2KGzbTRHptGkf32CQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHNuCjQnOh+Uoko6wzbm5pqztEjJ2x4kDp6wL5kztENToDwlCcqDIUAP6mBiCrgDgCKs4Iw
X-Received: by 2002:ac8:5891:0:b0:466:85eb:6118 with SMTP id d75a77b69052e-46fd0a8b80amr441436411cf.16.1738685364129;
        Tue, 04 Feb 2025 08:09:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738685364; cv=none;
        d=google.com; s=arc-20240605;
        b=ZLY+B/u7Mpt284r1qRJ7+OX/o29763GjBo+9ttF3XHjVzETbbk2l3gBGdE2+tUOsuH
         /51b8IGW0vi0N8HAwwI02//iXfvwRH6Jw8+jR/ZU9H4gq3SSfoQqjP9C8pTBYeJVB/01
         DyoXbdlgAQluxYnctEo/u7bP91t9MZ38h2Q60EbF3ewxQWKMLosYTyjNOCzDtIZoOGKf
         DN8SZtW4Z+GgwgWSopHZx9Y+d5CmFPcGnnLQ4W9RwDhDd/uor7X6CCspvU9PzXPAxW8U
         nWS6huc328OKod5kTitw/SmOAMIOO0uiGSBGQVpYhc6DVKdLEFxOsi3o6DbTVbgZZ1Bx
         ISrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=1jAtOVa+5QGRYtQeuDiNAasMNa9pVeWVpybgjvDAL2w=;
        fh=bkCr8YGdZKa/VjP8PkZkMrIQTAu9pr3e90RwzsW5UvU=;
        b=M83gkaDSN31Fp/05L+i9J4znZuVcHrgYXivb/0iO5H5rNihc+R/ztjNKj8DtkhdpAt
         NiLbypSwVre5r3Qtntmdga8Uyv/hSP45WM/YdUMEjOK+wFM6UwbnjtJ109Jhrng4kNSS
         9W11K2IjD/UkLzx5bSHN0684SB72yJ5D3JOmvLNzTq0l4+nrmkLfBsMCOyO8meXePvLZ
         dVUdEA/9vQ8gLJ0LvOGl4eiuP1XWUE7vl8IMeWGiKrtoRg0m87JN8H32uH76Z5unzkky
         X0prxRLYsnUMRRTySah8O4sz/c0YsRLril5G+dB50LBXpgJgCMWs5SvqrEwtyOM0lVi+
         7ncw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FX0cHDFr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47016bd2891si30057161cf.532.2025.02.04.08.09.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2025 08:09:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FX0cHDFr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tfLU4-0001Oo-C8; Tue, 04 Feb 2025 11:09:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tfLU2-0001Ny-6v
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 11:09:06 -0500
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tfLU0-0005Ay-Oz
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 11:09:05 -0500
Received: by mail-yb1-xb2f.google.com with SMTP id
 3f1490d57ef6-e53ef7462b6so5654560276.3
 for <qemu-arm@nongnu.org>; Tue, 04 Feb 2025 08:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738685343; x=1739290143; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1jAtOVa+5QGRYtQeuDiNAasMNa9pVeWVpybgjvDAL2w=;
 b=FX0cHDFroeSPzZKxH6WoKgsf4eDJS3ViPTIEhfLDT8SWuuRx0wiB83QSBGNgHG1Nlr
 v0HWJxOaTbG6XKOd+GSrMmAEN9umf3mCGtfDzO/nPGOmlbai45bku/+AgyBOtpogx35a
 uUHZjBHISOpBydnsLd+4y5SJ3hl550VHq4eFN+ZiFFjvhLfcURfwsIiCUdS940uBp+xr
 lX9UqZCO5vn7YBpvSH7wmaW1Ub9bjAdvUHQpkMg9VS8RQ0rKyjgSL/oTcpHFZaPFhqsB
 DXR40DiJQz/gWU6rBjZJCBOkzvwkziibMMjNy7jpdpDdXBQs3BJIys5P4IrNL2RDWKeQ
 j9PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738685343; x=1739290143;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1jAtOVa+5QGRYtQeuDiNAasMNa9pVeWVpybgjvDAL2w=;
 b=XCD3jQy265FJTfF+hxQd5RFQ+iIjzRy7WHlpPO1bAQnAulgdEFOVAQmomnSzPfBhvf
 bjiRQtZpiOXLBAeGjLebeMy+X8XlQyLOJ5gDpCDD3Fa0aiHPyZzqD6GlmFcdsw1EMscb
 hRgPYu5HjgBBntktl9jbMy4Vz8hqZy8KnPF56eKQr7sjKrG7H40Af1o9mYyDZCV4yVBV
 UR/cRn00UeM+hJ0DBPys6pTodGif+dDUNhXw9xORQ7vrOSt7ONleOtPvhvkmzPV79uaG
 JcxBmM46j2kAm6jlkYP94GISB5dlqeUHgCsGr+MG9iPz/UMvZq6yugaNWOARze25Q8o5
 ilOA==
X-Gm-Message-State: AOJu0YyjNFlAMzXfDBaPz9h/37d+CgeKSc6qC5A1AgM61ZDEeCqGYDk+
 ek0I8Lm/PQkwOLNjOueBDu30w83hWq/+L0ySPKSOfHcesvdHo0KPfxqAqNEo2biqDOd5CqntPJ7
 ssoOhGafV0o8z9KG/2jT32ynQpwzdLXNa75cwxg==
X-Gm-Gg: ASbGncvBrRaU+1CJ82PZpGdTGXRtCrPW9ImFCTFaFnNngv5wsnBL3rpub0/EQ/kLyPY
 aaf88+P3WnQzfICq5fKVp4CqMf3SVMkImaTB637mxPi02DKCYtEW/tLu8I4jt8qQsMSW/luCnWw
 ==
X-Received: by 2002:a05:6902:1a41:b0:e57:4226:8ae0 with SMTP id
 3f1490d57ef6-e58a4ae962amr19440277276.18.1738685343253; Tue, 04 Feb 2025
 08:09:03 -0800 (PST)
MIME-Version: 1.0
References: <20241226082800.2887689-1-wuhaotsh@google.com>
 <20241226082800.2887689-18-wuhaotsh@google.com>
In-Reply-To: <20241226082800.2887689-18-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Feb 2025 16:08:51 +0000
X-Gm-Features: AWEUYZk0drIDSGZCF40aepkg-jnBxMuPvlbv1UNySLhjL6TKWRIADr97vIjLwl0
Message-ID: <CAFEAcA8rR2Ajj3Bkt3AyjMXOwYLE_h9OBJ0ZmRNYs=SkEak4yQ@mail.gmail.com>
Subject: Re: [PATCH v2 17/17] hw/arm: Add NPCM845 Evaluation board
To: Hao Wu <wuhaotsh@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, titusr@google.com, hskinnemoen@google.com, 
 venture@google.com, pbonzini@redhat.com, jasowang@redhat.com, 
 alistair@alistair23.me
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: x4IZELjb3Y5A

On Thu, 26 Dec 2024 at 08:29, Hao Wu <wuhaotsh@google.com> wrote:
>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> ---
>  hw/arm/meson.build       |   2 +-
>  hw/arm/npcm8xx_boards.c  | 256 +++++++++++++++++++++++++++++++++++++++
>  include/hw/arm/npcm8xx.h |  20 +++
>  3 files changed, 277 insertions(+), 1 deletion(-)
>  create mode 100644 hw/arm/npcm8xx_boards.c

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
