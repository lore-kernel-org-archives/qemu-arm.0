Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2457762njk;
        Mon, 27 Jan 2025 06:04:34 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUL8blEi+7ZyZXPhWRfdBI+FFPqmCjcMtluEUO0/bSUCKIrTgniibNyo0F6xlus1CvOrTVUSv8Zl2VQhw==@linaro.org
X-Google-Smtp-Source: AGHT+IF+4jqS/Mno2IEjzFE81+N7gTG89Jc+4a7g8Lwh97k/Bk5CeyoF+3fcdrn0I66qlexNyKvN
X-Received: by 2002:a5d:64ed:0:b0:386:3e87:2cd6 with SMTP id ffacd0b85a97d-38bf57b7633mr45801168f8f.38.1737986673787;
        Mon, 27 Jan 2025 06:04:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737986673; cv=none;
        d=google.com; s=arc-20240605;
        b=c1m3oRtXUP2wvAWOZ4H+wXqDKY9JLaiBFp6FfMYkb5kx70RMxUxBfZNL2TCDXWyXn6
         e71sT/YQdZsogPDnfKIfJYUiD0z2d2G9H6KkxmxQDm4Dgfqj2QiHNyoX2st++nrA/2k2
         ahP2V+z5OR0u/9qQNyS2MkhUpbJPA0b9Dpw1rmx+YXMnhwPVH9wPv2bjkxTzZtdlOrvn
         EuwQxSyd2nM3g68qadGjgwuqis8zRX+2V4CSG81VFv2lOKiQMzy0lPRjj8w02aXsgQkb
         oAKnPRzIZCdzkxiDG/uClPzWTBOBxPH/0ZkTfAEclhSbtWkhjTFNhdLig1zDATUWRzjD
         7XTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=M1FTkJX742cJ5hI9w7nJZdyeHNqnv3M72LDBFIiWbAI=;
        fh=6PYuo90QnYCyAVgNw+8N+6ytOtV8opwSHhb3WfkDGnU=;
        b=H/z4LBh7jVFbGj2qO6UbZx8cFABfZnPfQiPcO72+QiHLOHrHx1zR7Qq6JglFPQxoIi
         WJDJ1wwBayZR3bb1vnqPEqx8roRUwd7HE94da1AlMk4bmtqSG+IxPGH9iKDsBjjEQtml
         egM5x91Gqqwr8x0a2iJY2MUekIbsUxBHz59YxZqNGi22034ZtgzLR4Ly6Giu94AqAODR
         6R1UTu9g4+plnyVZfb9J3FuVK88AnxkDiOcNe8YVdsM2W90BL/SySiugakySLnME0cNS
         QJkFojlPVisevuMexOYCX1Y9e3/RFY2zmypHdIXLiD2sE2UjDkhkfb3qtqMywvELsuvi
         wENA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BCLv2sq2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-38c2a1c1a03si6034154f8f.539.2025.01.27.06.04.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 06:04:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BCLv2sq2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcPin-0006Fy-Nm; Mon, 27 Jan 2025 09:04:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcPig-0006Bj-7G
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 09:04:07 -0500
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcPie-00008m-J4
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 09:04:05 -0500
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-e3c9ec344efso5960335276.2
 for <qemu-arm@nongnu.org>; Mon, 27 Jan 2025 06:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737986643; x=1738591443; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M1FTkJX742cJ5hI9w7nJZdyeHNqnv3M72LDBFIiWbAI=;
 b=BCLv2sq2/M6TFhhxD6AG2m7msOX8rJSqH6Ds5bKAP5eTV/YHU7rgAILmnNLYxX8IWs
 8w7Fg9JA5j5uz5k3qv11fAjziN79U4zVDCd0yD1LJawsq3zZ1b9r5SxNWUCKHg5JzoZY
 mVAO8EBL0f+pByzDMmb+Xq0jpr1bVVO56gBB115jxsm4SOrSSjnGw2LYrqQMkJCJ0TER
 uCb/q8E8Iv9GaPK83fVH61zyYNHRGm2p2qJGJfdmrJ02mweqKvT1UwrLOU6xfF6Q5XGA
 XBuESS1M/kt+0D0ttd06DyPCroFysSBJ2nBJKHw1wWmIcPXI3vRI4+lPAAodtO4raSgJ
 ccTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737986643; x=1738591443;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M1FTkJX742cJ5hI9w7nJZdyeHNqnv3M72LDBFIiWbAI=;
 b=Q27f+ii+bojKvnh6m+KIzMyfej3bSV2ju+WTKB8kXh+fHWekY1u7/gmI7etJfk8PGd
 0fBE8JWML02MgZadpbOd4CJ19rKckVS0f1BJhRqVKeNuAsOQjbH068mkit7yYXnLXVWK
 sUts3P6Z03tSlNLeV4zT64Tx07OpENBPJT2MtL3CqPNkWxvLnqmqHBbKCQd59FRpHv84
 rywuM2Jn22fPG0fgszzWUsTBzCiKK6tr5Bln0bNURYLpijQfWt7Lq5HVWvQS0lZHesby
 7+/3s/DWybMF3D2pTsuK8g840tIyd5fUebrZXffKs9l7hVDu5Tye6EJekOhPB9VJgfzx
 EF7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtagkbxk6EMGBRpGRzELuhh+WQsJTANXX6QRHG2qiKfLX6gXyzXZEWOx5a8FkT2Nl3209kpab5Yg==@nongnu.org
X-Gm-Message-State: AOJu0YzAbXv9iPqLhOZzm28sS+c3bBN8AcXwJrmWkc8WeQIP6BOzUxzF
 sx5vKDzcOCAwnXP5VuFan5dVBpYOJmFkhS8UE3siuX8zsPzuQttQ9TCRSzdxERl+m+GlO4AhuL0
 SxaBSXj2vaEwLjmLeE1mhRhSgi2QdqEFbLP9/hcjzIM+BEWXH
X-Gm-Gg: ASbGncscLNQkPUWgwYhp4uWaROLKvb88kqVHJ4uGtRs30g8tQtzGl6lGpzEahW7Z6+4
 QIiP4iYaoHnz7VO07i9YKFMzbAie0NUaiqxuiQMEMpd56j/R9w5trnsan0UW6o4A=
X-Received: by 2002:a05:6902:110d:b0:e57:99a0:eda6 with SMTP id
 3f1490d57ef6-e57b1096d49mr29509636276.25.1737986643328; Mon, 27 Jan 2025
 06:04:03 -0800 (PST)
MIME-Version: 1.0
References: <20250110160204.74997-1-philmd@linaro.org>
 <20250110160204.74997-5-philmd@linaro.org>
In-Reply-To: <20250110160204.74997-5-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Jan 2025 14:03:52 +0000
X-Gm-Features: AWEUYZnsLylrvmb8yTwMS3XNj2gcBiEWwfbqmRjnlBWRGfbmV02-Y_p0ACZyjL4
Message-ID: <CAFEAcA_oK3Osfu+6vWDRPO3b2ufPn=04BO_zR=aw9-iJk38D7g@mail.gmail.com>
Subject: Re: [PATCH 4/9] hw/arm/stellaris: Replace magic numbers by definitions
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: bIMUAiVcaDG/

On Fri, 10 Jan 2025 at 16:02, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Add definitions for the number of controllers.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
