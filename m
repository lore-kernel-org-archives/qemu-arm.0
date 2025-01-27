Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2457290njk;
        Mon, 27 Jan 2025 06:04:02 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWuAlfFMoIYt16lBIvAqZCM8V9fNFkJx1Gf3tuKbIArnG324LlzT1N9PZLnX0bfMDq+UTDiDL4TbZ7sLQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEpmTGPZVgxzY9HPYp805D+mKIrxVNYkwodF6SvEqh49ZgBYkKqFEB8aavyHW8sdryykBJ+
X-Received: by 2002:a05:6102:cce:b0:4b1:1eb5:8ee5 with SMTP id ada2fe7eead31-4b690d12989mr34791127137.25.1737986642644;
        Mon, 27 Jan 2025 06:04:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737986642; cv=none;
        d=google.com; s=arc-20240605;
        b=e6gq9evgIr6u8lDkCPwyvKq71D1SN2U+hrQuPWp+CDkeW8HHtS4/aIrcZ/YTkkzp/W
         iaVVmqcVVLDP8ziXtoVfXgMva+TtmkPA8YmRQJK/bLUAfpuS+yrDgDwm/gmp809nXSU7
         FQNSZRrWNMX6LuT2Qy6RuvLBHP0V69oUFaNh66PI7WTSbKbZUJXGjuiESnMkt2DfpjYs
         SvpKJRuNzidQRCeqfk9FAHu49ZoGeHdJmf6PwzzdqPzejd2WYFTusHwN4Ij5W8v3IhYf
         lItD3jQxVg6oR2v/LeVuESVbiqcH1S7HOb9BzZz1WFjjwqCqrdaVg1XLw/YhDG9qMIVV
         dZHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=qKISiDwwSjT1V7tDMhH4ariCyCOtY48IroqOiKLqwTw=;
        fh=p0kXgKgHs7blENGZYoJH3kdYRUWZAB8ONlQ20oYaGfo=;
        b=Pbjf2VvELV3/QroU4kQhfaieUUICzj/kPpEjUddNvUEQ7BcMCzaa9jUtMAzj/TNQiR
         pzefBMlZFr4TPFHOl3hob86ycQjK/TwdDvDGyZslGT9+dAV3TwH6Nz6TmcPEIATgfuAk
         wJMICHDStbExVK2wJ+35XnFZeJSILyeHGRF6MWMPIU+pNYJ0m+JuRTb6NxK2dS/HIrPq
         bchNbHTwqfWHmU3lSto3eoYBQVq7IjaQjngx1FiMi4dv1/EOMIMmJcwx50QR6IU2ddHP
         hOZFF4RJpiqkHsgom/+7WW9xlSSdTG2mpKsgxIPLIvEF0V8vWMSED1cxSTWJnA/CdYyh
         rcYQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YCA0irZ6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4b709982013si2906334137.274.2025.01.27.06.04.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 06:04:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YCA0irZ6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcPiU-00060A-Ku; Mon, 27 Jan 2025 09:03:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcPi2-0005sg-52
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 09:03:26 -0500
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcPi0-0008Td-Du
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 09:03:25 -0500
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-e5447fae695so7689471276.2
 for <qemu-arm@nongnu.org>; Mon, 27 Jan 2025 06:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737986602; x=1738591402; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qKISiDwwSjT1V7tDMhH4ariCyCOtY48IroqOiKLqwTw=;
 b=YCA0irZ6GDoSXw9mA6v77z1yhqY/AJnvcoqUqYbu+xl5HFbNCtSSg+3NgnScEPYR47
 yRjeeKNB4gPxXbEyTeScOEN3yqFxoJW4r8AN2MDPiPCfstIV4oN7kdZCF+o3D24CQ3lx
 05335woyE1qAL7+lHR3H7AGQlAkStJHOE5v5I70BqeoAtaUeKcmmL+obm2mQ3AnIx3yO
 3ZwiSLZOAO2E396rmiN9ut1RL8BLNSeRUVY/hcmlJJGki30Oee1M5UQ9MPqd5dPTjSN0
 1LUmpwkK2cl69MFsTbI+BMhf7lhvnuHV0qUcYqJZuG8ACvD400Xgo2ni0B9KKPbWJnMV
 4Lwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737986602; x=1738591402;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qKISiDwwSjT1V7tDMhH4ariCyCOtY48IroqOiKLqwTw=;
 b=RUfpytWNXfJQ91hHyRBQ2MuWqNMON0pSeNaeJPz5vaPBuBUttgE1Yiem47Qmj23542
 OE1mXooCIRkICADIrro0Lndu8ViffT1uW09hSStgIz5fiT6eLXPzvINI39WGE+SUVlch
 N6A6wrsogjIO7gHODAmEXNwfAFbg7oxyeKg8WRqPmxTKMJfAT79UjwL16v3d3YAQ6KP3
 0eSh1jMb7G/Uwu4dEkCYED1XygCdKPmiqf5iwo7G9k5/IBxmM7qcqscTbEFgG0l0BPMY
 4vHY8dzjJgMVFZKn2Au0TU2EQFuHuF6Dn4fTGc9+fnZqK4YmTFdY8GpF+AmRu5gT0Rc+
 Ntvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxti5Ur8F0XShFA7mRPUiaz6E3+UWNcaT2LaG6HCx9scAx0kpq2lPCsYc4Mh6CDc6RIL5K5e4cFQ==@nongnu.org
X-Gm-Message-State: AOJu0Yxg9TbzsJyyiWsbZWEggRwb0um6kbEWmdWwDdC80pmb/S5pl+52
 4PBylwcq5xB4GoD4eqvxsDF9Os0xfCKI7sF5K0ol3FlWvs9/GRCXFMJV3WcQO9Cu9k2s6Bo8mhY
 Tur3SC5nlmQo/953tam51PEuse5j4DuDpgZsCJg==
X-Gm-Gg: ASbGncvlN8Bo8kv2sU0x11j6Ss5NwQs/A++aYqjY6x8e90gU1VYU5m22csKK++Dlqdu
 FrFAJoyEl6iwD+9eGUOqUNJiTC4fSyOCxyNqMZYrP57PMpFlP2rIibZjHjbQPsIY=
X-Received: by 2002:a05:6902:1791:b0:e54:a2e1:9aaf with SMTP id
 3f1490d57ef6-e57b105aff9mr29464316276.18.1737986602093; Mon, 27 Jan 2025
 06:03:22 -0800 (PST)
MIME-Version: 1.0
References: <20250110160204.74997-1-philmd@linaro.org>
 <20250110160204.74997-4-philmd@linaro.org>
In-Reply-To: <20250110160204.74997-4-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Jan 2025 14:03:10 +0000
X-Gm-Features: AWEUYZm40oUPc7Um61Y3oMSUBOa0I1pLqwi7KHFZt9RBB7ECXXWFCVeKS6Qtsf4
Message-ID: <CAFEAcA8wnLxh5q84RrYz-bgD1mBQkjtQfgYpZNthLE89gG90CQ@mail.gmail.com>
Subject: Re: [PATCH 3/9] hw/arm/stellaris: Remove incorrect unimplemented
 i2c-0 at 0x40002000
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
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
X-TUID: VEugHdzCUK13

On Fri, 10 Jan 2025 at 16:02, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> There is nothing mapped at 0x40002000.
>
> I2C#0 is already mapped at 0x40021000.
>
> Remove the invalid mapping added in commits aecfbbc97a2 & 394c8bbfb7a.

I wonder why I thought there was something at 0x40002000 ?
The data sheet per the URL in commit 394c8bbfb7 certainly
doesn't list anything there. Maybe I misread 0x40020000 at
some point...

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
