Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4171445njb;
        Wed, 11 Dec 2024 08:09:07 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU5taDzMcn71VUgzfNLkJtZrLSkX2ksmP4AiuggrsrxeePnAcE054PDj1X3biM1j1qL9rf3gGodP5OEXw==@linaro.org
X-Google-Smtp-Source: AGHT+IEp6h4/4LYMmAhtKqFtHzJ3evLNBDyleTdPZ+GFRfTENo/pcJIRIFARLrRNYL1Z3VYuKMue
X-Received: by 2002:a05:620a:6290:b0:7b6:c324:d3a5 with SMTP id af79cd13be357-7b6ebc969aemr457695285a.19.1733933347483;
        Wed, 11 Dec 2024 08:09:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733933347; cv=none;
        d=google.com; s=arc-20240605;
        b=bSyZrAaKiKI8fAxRw6Rj0+pw/Pis45iGLf1JvBIalrKAP8wPOsrnL3EWKH59LP56YT
         WwZdUfCGFCdJG1osEBJluCTyKomYSKVjENSzGND3sfqtJf7Vo6IBSsIShL5kn3BYyEHQ
         pZSvXAMRLAS+iDL1gLnFnWF33ASphSoDH/xux5spjm2KbrED+sIgEYEDfVsfG1dAg5iR
         lJRTKiWmTQBzPjnA48cz+dHuR7OjhdD+k/RM0VtURg/kW3Umvyi9Soq4HAWTfcg6L2Jx
         vaXflz32uBTkD1dYVhuvewGAOGzhawi3Mg2o9Vn8clwXhdSynieBqwUDwX7m6l24SIDe
         Wc2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=AgXhxKsovO2mUySK3XXly2g4lapJwYYTu0gwvcav5G0=;
        fh=+oXHvVJMjIWFwTYwC/SF+qw3NEm6CgHlcfWP3KOzH+Q=;
        b=T48JTvC8X7tAVd4T6M9Swq6ZPVnd7gIb9O8aj9tr36+W+kmpHYIh05vHqdXhcd/LyT
         72zxADSHxpah6uw9TuwUCiPqBcez3okVh+kZCAycBp4ja1lN6TX/eUkmfMx+UH5RZKCD
         vsgcXt5+RDIOS2PfjzIb9sHoA9kr+qbdkAAjBuVwGS4PVmlpNFUJSIYjphTyB2RhlOHu
         GAuAsNLEnbotR5mosKLZfBd09Fl7LEOponxtcQ8c9mbAJYrj6dmMEyxbO+YbOOaPEAYQ
         eB0y4DJbCm/5zs0/yi3dSIi8H8hIVNnCrBzp8oZf5Jj0z/aFabz5C+D+85Z9On1BXrao
         Xcnw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HTtVoO+i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-85c2bdd8046si3722450241.159.2024.12.11.08.09.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 08:09:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HTtVoO+i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLPGo-0003j9-UZ; Wed, 11 Dec 2024 11:09:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tLPGb-0003cq-Ts
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:08:50 -0500
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tLPGa-0005dl-84
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:08:49 -0500
Received: by mail-yb1-xb2f.google.com with SMTP id
 3f1490d57ef6-e398823d6aaso777950276.0
 for <qemu-arm@nongnu.org>; Wed, 11 Dec 2024 08:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733933327; x=1734538127; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AgXhxKsovO2mUySK3XXly2g4lapJwYYTu0gwvcav5G0=;
 b=HTtVoO+i2jNvU2ci/XjACbEA7zIB/m+9C5Dn6lIBNK6HMvx7BO0HbsmkOWJgPIg8Us
 7HHdOR+9r1DkETlRwz4/WRmV8nssyC5ykhaWEDViI0YXwwFx6/T19+uJ3qmeBmS4qUNJ
 mOBunOszeXEjte01KPL6UV7CdABoBJFVcxZ89e7TGRHRHXgV+lNAaN/PBXYULv0OLrOY
 5tc/d36+h1gJKul8g9XZHUd/fFo0jkzOFRNuBc6t2pKFfXvuNUDqLz0YY8Vd5VkWIqPG
 +JudMdvoxQzuoMsHTqnhXyBo52s9JNxKGfANiMSgWMvW/lvFeJEXoxYKHp8hOfG1Dw9y
 wXjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733933327; x=1734538127;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AgXhxKsovO2mUySK3XXly2g4lapJwYYTu0gwvcav5G0=;
 b=K3I5VaKC2UBfLgBGrjJrS/XyU+ykbmFU4adaRc8qlvMcntVAncw2qIPQOIgHtUadZT
 qG47UMjmHEorJTBBsS6qFTI2FFIy7vAakdLmS46FZN+JViKZrccaSMaxVS8JLLBZSJPs
 tmCZNR/iyiGudkArEYD0vAiQTd5qui+Q87tFi/NRkiexHUf9Uw5HAgqOq9bUe0y/JZkR
 jVAW6t6TkqQDiRQySC4dbrqBhyuM+TZKfMMsWwSX+N7nyQaIdtwIMDn98qNlBFL42+yu
 u6/h3gbkCXxaKbejs2Y5yeNoJdpNVRLqO+tzNDfqhqjoGaUvdtYViLL5H0bH9s1tPtBT
 DNpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhWSlHoKlM/sv31uuyatk7d/m2oVSlqy+VFEpwjL4kr5CmpkshGi04trkbvoxcVpMLVufp8l5JSA==@nongnu.org
X-Gm-Message-State: AOJu0YyqDIMe+0P0fgbqBilPlW0R7v5wNOd1dyyrMaBMx7JZqXfEJr7t
 0DkUJA3cpZ6jjcN8Rb2NPPPG2KIce4s03rNTP6YfWaYMqqyzoi9JDvsBTd7zL8CWtRmk2MwA/63
 W7S/BgtgfjOGcdu55XtXUBNWP8sfas3i/mphy/g==
X-Gm-Gg: ASbGncvMee2AHM4gV+k2l0ZMdQZiwPJeCwNSlKszGDuxmyFhErfY+OC+tOF8JCvNYpy
 YoSW7fphlWyjX5PDKYwNjJbs2EDq5yOcv6tiP
X-Received: by 2002:a25:d045:0:b0:e38:d000:1555 with SMTP id
 3f1490d57ef6-e3c8f97116emr2972607276.4.1733933327140; Wed, 11 Dec 2024
 08:08:47 -0800 (PST)
MIME-Version: 1.0
References: <20241210161733.1830573-1-richard.henderson@linaro.org>
 <20241210161733.1830573-65-richard.henderson@linaro.org>
In-Reply-To: <20241210161733.1830573-65-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 11 Dec 2024 16:08:35 +0000
Message-ID: <CAFEAcA-7O=w7UJAU=ESeV29YKRvPS1xmt2Hm_QmXFqN_Y08yRQ@mail.gmail.com>
Subject: Re: [PATCH v2 64/69] target/arm: Convert FCVT* (vector,
 integer) to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
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
X-TUID: +LUYR0af0K13

On Tue, 10 Dec 2024 at 16:28, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Remove handle_2misc_64 as these were the last insns decoded
> by that function.  Remove helper_advsimd_f16to[su]inth as unused;
> we now always go through helper_vfp_to[su]hh or a specialized
> vector function instead.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
