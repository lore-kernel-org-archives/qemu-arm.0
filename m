Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp499737dyc;
        Thu, 3 Jul 2025 05:28:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUr87S3sUeLT66FWZ+zUEG53EDz6okK4DoYkfItWD46W819PCh0OkUQCbv6EtnGWOp0i9qjc4CvrIaWeQ==@linaro.org
X-Google-Smtp-Source: AGHT+IF8EBTotEf+ikEqzSHNOjyWoAFEYIvYmeK5/cUM1RdMDAkJvitT9Uhl2B2vaoUptZahkE5b
X-Received: by 2002:a05:622a:5449:b0:4a7:9b9b:aad7 with SMTP id d75a77b69052e-4a976a37271mr128033231cf.49.1751545688187;
        Thu, 03 Jul 2025 05:28:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751545688; cv=none;
        d=google.com; s=arc-20240605;
        b=O+N+wj8i+amsnjV+bCWEUau64v3eSbI+a+pmgXNflKc0EghTRHaG3uWaHf0DYdEWAe
         YqTRevuAlhntK+Sdgpz4E25VpQipRUIWwmg5HDG9uo+guJ6YTM5Nf0puhNjP6raNlklj
         j1v/RO1+HLU0dcgGHxfPmZ3BEKIo7I3UGMT0rH3iSRMZwgyRYuMXquSA6Y14wLzoc6CI
         PWTveBUTaLWIenNdZIgVXw51qDrdq0L8WUs+4CovHW5UBDeR5YudUlboAFsHWkV1N+6v
         4NLQ2D9+cPDBIbirSgxEzrsuIpgvxjwQuY/EQWDH4n9fT86mnK9mXu3xOkxxqweZ/pdw
         VvOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=iE5wuarQLFP1KfubjkovK94cVecmZJbOkHOEdG/1ai8=;
        fh=vY6orrrzLw8gt+5EPDKZ+JmC5btuHgftt6tjNgF3Jm8=;
        b=QAeCiGOJ6xlMR5Im3qwjxaKUsG1kqXKp3LrybG2i66CLOLcKyknF2pa18vWeHAE1Lu
         SPut4EywZ4JI/HL8veY8gHUy7nkT23h811T6vVSJPmKsciF85BAbQxX9kIFm5p38pq7h
         3d+v2BgEaqgMjnX4r1qJEN1M2fquWcZgO/iM43XOsyn7m3SHwKI3Vas/r13D6ySUtghp
         vzxHpFsChJZBw8MjIU3bOHprOVo0NHPwHe/471fclB/+1v6M8iEBXYK0s/RIxeVoHjng
         mq12zvGQx4wAfSsX9OZ7MO1DvjSODeggSTiE1rmceceAiAcExodC8vuaBKK18BLykbbG
         u8WA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U+sHHlys;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc56170asi160647391cf.563.2025.07.03.05.28.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 05:28:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U+sHHlys;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXJ2l-0000WZ-9X; Thu, 03 Jul 2025 08:28:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXJ2c-0000Ug-Kt
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 08:27:51 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXJ2W-0005AY-HM
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 08:27:50 -0400
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-e898de36cfbso1061255276.1
 for <qemu-arm@nongnu.org>; Thu, 03 Jul 2025 05:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751545662; x=1752150462; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=iE5wuarQLFP1KfubjkovK94cVecmZJbOkHOEdG/1ai8=;
 b=U+sHHlysKoU8Yy2hvDiLdsatZAfqrdXv86rGE+5cQwiwLxyR9gelQ2XaVkXc3/jQrv
 Hr/TnoXI1XNeHMHAai4VTiQVjBbHp6n/YTBZN8UTFbkBH/G2FF6h/WQzIhnG5XQ4RuEg
 DbmItL9UGugdZdEWRtL4hLqrZiwZekGYPXEYpwB8fhGN2umjfB3MwTZYwmm0V8btv/QM
 emSsmyp/Hweo32e9gim10CRaH5pMu3MjlhmjHhXaRLtjN5YGfK5+Xq7mYGIsX+YC138X
 zHUHnS96VYQnvapt131pL20mEHdtTn+qX3bWEDRfKERrvlLrWb1+q0x2XcvheF6uHhaW
 3q7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751545662; x=1752150462;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iE5wuarQLFP1KfubjkovK94cVecmZJbOkHOEdG/1ai8=;
 b=qcTwtJ2JGZoJihRifhybHjeTrzAOm8sGVuZl25UtApxTcSR6aWxhnm9bQ5y5f7RPyq
 kHONU2NNFPQMRB2Zmnu9NlLI3o8ozFxwsE3zBHmeJfnEo59EalLwR/q5SSXYGLxsaR96
 T0Fe/5pd6+jTOKWN/kXDR73ppMwWJwhaefzz5ley4+tq5Tk82fUjaQHEHbp17Ad9SY/k
 CgPvi++h0ogCeqyW4maixEJtz0pING0GBN/EhbFxBGvbJ/z3OmQYBv3RisveG5iAX17b
 i3be9VCXzxbgTk2k6sFBb97tjz8p5+AR3xOJRBYEAjAbZLOlMJNqHTifhWmkaobV3u7j
 J3yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1kc9KP/cwvaNEmbfteHqolJOxlcdnVTETNnUyDtP4W15PqJvi/tpaaGtKmDJa7bQm/rLaAIZyQg==@nongnu.org
X-Gm-Message-State: AOJu0YyZb6U8o1KwhS30I3B5NTWD3nvSOEXDAfBLnDRYmSPkpThNXA1E
 Jda64Y1FtB2nT+ArtihueTd4uTa7K9qBctpDJR1G3JrATAEwvJPgT258VTkKM2AmYIh3EOBvEOu
 rPFaJi3VdYSI2uTUOkTIwTIIKQjcVfxwoVYVuPM1eFQ==
X-Gm-Gg: ASbGnctR2xrlkh+N0KDQPs61zkDJz/whohkdP/wKohIHt7QmSa03asPNmVdF7nynDhr
 CG4cBWxIgDJjH9EH+KvGnJOZ+vXNcVuHG729B5IhCl+9WB49GohnkuSEHmVLvSyJkDCaAsiWUB8
 2Vaa5sC4tTEqaaW5rxODqBjaadd3A+XruNi2dKOSVMj/ou
X-Received: by 2002:a05:690c:d0d:b0:714:349:583d with SMTP id
 00721157ae682-7164d26db98mr86068187b3.8.1751545661880; Thu, 03 Jul 2025
 05:27:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250702123410.761208-1-richard.henderson@linaro.org>
 <20250702123410.761208-78-richard.henderson@linaro.org>
In-Reply-To: <20250702123410.761208-78-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jul 2025 13:27:30 +0100
X-Gm-Features: Ac12FXxatI4Y05L27pD0n-G0ffr3wpI23n1hOPcOeRJ8Xp-DrOTAfHKl7Eggi6I
Message-ID: <CAFEAcA_reGV-388woU+-_PoUD2PBLGiXpU5BE93b6MbCERpHtg@mail.gmail.com>
Subject: Re: [PATCH v3 77/97] target/arm: Implement DUPQ for SME2p1/SVE2p1
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
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
X-TUID: VORa2TJ1IV4b

On Wed, 2 Jul 2025 at 13:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-sve.c | 21 +++++++++++++++++++++
>  target/arm/tcg/sve.decode      |  6 ++++++
>  2 files changed, 27 insertions(+)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
