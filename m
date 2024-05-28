Received: by 2002:a17:906:32d0:b0:a63:3083:985b with SMTP id k16csp50190ejk;
        Tue, 28 May 2024 09:04:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVn4y6B4rEOQm5Ho0aXH6jdMKaLVJJl0ozvtrgjTtoifvYWmFozaxxpAyJpeUKXetpWmnn340oIz5bcIU0slYWsXtOYTo4l
X-Google-Smtp-Source: AGHT+IFIe3VRWTICQ4eiFBIV6lV8fFfFYO/s3kUEUCBUnD1AwUF7AYNXORqMymmeNBd2FGdLsC/J
X-Received: by 2002:a05:622a:189a:b0:43e:3a88:7d26 with SMTP id d75a77b69052e-43fb0e2438cmr172981401cf.8.1716912291418;
        Tue, 28 May 2024 09:04:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716912291; cv=none;
        d=google.com; s=arc-20160816;
        b=wcrnwMHwfIi8tTk0T/4zObyFUfVObMtBW2RAjxDCA9TMQN79UDr5T0shNxEUbPC/WN
         wugHynpfGTS42NHuVfAN/2eeKR78aVSTDqb1WQFF5iWeM0YdXtCkTZmZzGSnVqGg1cTD
         eoybvqHtT32JxlMYFbS/wNYzS+huVRI/i8yLzpJ+/oNBJ7g9GVz91mr/c24WPvCnl7aS
         j6gNp1vuYYyC48Fp5SJ5VuVsvkloJm1irbVejNm5X5opBndKc0TLdRBJ6DMMUjJTVUHX
         1auUAPoaDyXbMzDyxNYEOqKbcrcubIMAaoD9dpfMKBnO7kGckR1vnwqO1P7PWZWhK1V3
         ubzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=jtembfibf7TJ16NK/HQ1lgfYPTMxTnwU5WdErop0Xd8=;
        fh=crewkMUiQuRDmV2eIgkrZONkYvUJMOLI28PAeddfrDs=;
        b=MDtT9OIpLXpSY9MYXeXFkHZqTqFfs23ismsZA1K6/bEwU7/+6G7a8m6GtMbHMaaV2z
         a1LBvmT0PKONT8peRUU9d7bCX+m3Cz4FLtO2C2L9s+XzkB4b5iuI0n6YLXKofGNxlq2J
         OUQFgyDcAhWID4RW1CD+l51uijXxSGgmEUO9cr3qKvf/YU6Nqi8/Zr7PmHCBrJgewQPd
         wcZ6FlrFoL/dWc/LDRM5pJCwdL/Hfo8ltq5CX7yRRvPyOT4CvMXZi0Y9Z0F0t/wjjASR
         5IxdS1FFpWP++iBu2AS+8dSGRrDPsHEZr0sXQujoE7XvVAl5I3xSnnUEfQLFMk5pNo44
         c/SA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OVKDydt7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43fb17bb188si107564391cf.147.2024.05.28.09.04.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2024 09:04:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OVKDydt7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sBzJa-00014j-A6; Tue, 28 May 2024 12:04:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBzJP-0000Vt-4k
 for qemu-arm@nongnu.org; Tue, 28 May 2024 12:04:34 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBzJL-0007wK-Tv
 for qemu-arm@nongnu.org; Tue, 28 May 2024 12:04:30 -0400
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-52449b7aa2bso1269690e87.3
 for <qemu-arm@nongnu.org>; Tue, 28 May 2024 09:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716912266; x=1717517066; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jtembfibf7TJ16NK/HQ1lgfYPTMxTnwU5WdErop0Xd8=;
 b=OVKDydt7ckWZWnpY3k2oeQ/Fe35GnQVU0JedcZRus7yfqoTE+nb8CjfBtKtXo1or1m
 5TuiOTCS+08Pp7uAgVvfyXjNa1MH6r7uq9ISkLSPLrrBpOPDjECOFb5RMX3UP0IC5CyD
 RU1qIiM2+OMxjWiQVVPyzoJ9B5trjhuLHXK9oBV4e3jSSBLTtpDZLS/QjsDEMHIZW5wz
 nigFmOV5AYKzZacNQ8BNlT2E33VQz2oAtpzq6KHffeS6o3JqpZNfKeUgK02++GKRgKsN
 TCsFbTJ62fVl7MqLFr1BLfFIaMQoET3wNWThfCOkiziDdT//Hj1+0lhRFEjbiPu4DnQ8
 K8bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716912266; x=1717517066;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jtembfibf7TJ16NK/HQ1lgfYPTMxTnwU5WdErop0Xd8=;
 b=MdNbFg5ewKk3N39/jujcIK+hKLBlQIGJ5ipXRmkqAf3m+K7S1TcPgtwlwVNsS4XdVk
 tFRWXOU6acGLGgmZ4yweEfnLIAyIP2JbdVJXQp3fh6T+uFq2dfCjxVLl5fOkhRK9CxNF
 +3qvaa/B8zVqDMWkOV8SinX6kWf+1/Zy+4Vwcdbcd0tXqE6vmo/qnmy+HLDM16Op8T0D
 PkuHBQdgTp/YcoxE/xEsALPkA+QxKkkKfQjD3bW6/T4Y2uAkHhHL47gJQuBmalH5SLdu
 BqYhGOOHHkfgfkwclkgeRoxt2nHPbn9mCv+214dS5VF9IxfScoJWROywq0sX/74/VFEW
 9A/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWMEDBbTY1avc2KvlyyHMUT7KNl1p2A04O1XKd0DwkpRBQ8AHClXQKSzOWTqoSrbL4i+HR2tUdFbowsfZcG1GKUPW2
X-Gm-Message-State: AOJu0YxRkbqa1MUkp9bndLspxFNafWmKOy57o7q09zYWjJss+8H6cVTA
 CBXnx1KBtVDo6vPGEWEKO7RqIR8jl2yyC3WreVqEgyUkgnfDC5jOA99oeleUkfWYJq8228MJ4mY
 Mn7cbAAdzgnTkgIe3Uqk2NPk9EHPaDvctjhhfuA==
X-Received: by 2002:a19:2d56:0:b0:51f:452f:927b with SMTP id
 2adb3069b0e04-52966ca6423mr7426489e87.45.1716912266021; Tue, 28 May 2024
 09:04:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240524232121.284515-1-richard.henderson@linaro.org>
 <20240524232121.284515-60-richard.henderson@linaro.org>
In-Reply-To: <20240524232121.284515-60-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 May 2024 17:04:15 +0100
Message-ID: <CAFEAcA-vXfp4+O5dV5onXHZMDZW0bfLeKJgWt9icZt7TQhmXyQ@mail.gmail.com>
Subject: Re: [PATCH v2 59/67] target/arm: Convert SRHADD, URHADD to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x136.google.com
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
X-TUID: /MRvr5uSDIbU

On Sat, 25 May 2024 at 00:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
