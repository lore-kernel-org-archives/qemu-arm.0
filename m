Received: by 2002:a17:906:ca8a:b0:a63:3083:985b with SMTP id js10csp484718ejb;
        Tue, 28 May 2024 06:19:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXC2aZ5uUsN6W+5KZBKqsaRzK4TiZN6u5ImkQvvPp68o2kvOvZltvJrsUWVwFIv8Ekf1jFXj/Uv6NAOOHdKJvwnDqCT/KNO
X-Google-Smtp-Source: AGHT+IGFJVFZZejQJ4ufOUS6HavSCdEbhJ48Y25BcR2L0jQwdmkLOfUCc2acgaEs9F1S0kvkh/r7
X-Received: by 2002:a05:6358:3406:b0:194:9cb5:fb25 with SMTP id e5c5f4694b2df-197e50c256emr1704890555d.4.1716902352108;
        Tue, 28 May 2024 06:19:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716902352; cv=none;
        d=google.com; s=arc-20160816;
        b=sFkDMhe/4z+F6HnV1KSaunKYypiHtD1/weGcN2MeyIPIAu5tXHzlJ9r902KlVIPFXc
         5rT06+cFEmC5D4DNvzw39YFUnTFXxhu0pHujhs1i9pWlO8vDVNMzqbr4F30FW9mSa0eG
         alwOy4UnP2FIvb8lHJZmOWaNhbSx7DwmTclklx4hXHvIB2IrSIZDrOiOTUP/cZk6tQWh
         VjSy1aiLkLHATjyjhS/VCcamcra1wTkn1ULAjOafUGGx9jOrE4xbvQZpyvWdKAUBWIJw
         eCL0aBSAy3OaMQWQXa2NRQWWcvx/ipB+s/TJq1UfUe4Io50qywrdvmrMyDCInEnICDZI
         Nc3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=KUs431OcOrPSHN5IsKVp6gDCDDBL6vuomJl8eZ18TuM=;
        fh=/ftcwOPYeEIhzseC7WF42kR+xVR/IJiWpLC1+A7SOWQ=;
        b=uChAUgvEwZuP20ZnFm5uLqSz1Uap9FEpcwWXfzrNjm/WyJ0Lk/9BA8Y7qxJA6zqhIx
         uGFO4mtqpWZuMQ9GpaccWjT3nnzCPDmKZHLwsJhSzNkLsJgwDQa050bGP1j4VUBjllw3
         UzNShZ97LltNNnBuEUTaZR8tFN9RDRzVPwjxe/6+uf5lJz5U16TCmfUQnj/BYp3FzygF
         EAcgHvPuXcKZXOKUkyolioBj1L6ncYbtlLD8qLzqmdK2cNHz+CkikgUETFDVUuMuRlPI
         /80Ka6kQMnpfNo+yEvXYMjmUhn+3Y2GRBpiwV6MMnq9RiHcYbvEbXN1GbscBQ3IiEe8Y
         vvIg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mh8wCY5L;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-794bfb64dc9si522217985a.594.2024.05.28.06.19.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2024 06:19:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mh8wCY5L;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sBwix-0001HB-Th; Tue, 28 May 2024 09:18:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBwit-0001GQ-QA
 for qemu-devel@nongnu.org; Tue, 28 May 2024 09:18:40 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBwir-0006Nl-Kc
 for qemu-devel@nongnu.org; Tue, 28 May 2024 09:18:39 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-57857e0f45dso981217a12.1
 for <qemu-devel@nongnu.org>; Tue, 28 May 2024 06:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716902316; x=1717507116; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KUs431OcOrPSHN5IsKVp6gDCDDBL6vuomJl8eZ18TuM=;
 b=mh8wCY5LIUxout75orzEylB0p7ONsqvhHv5sAeGJ3NPwP0sCYfKmscTfeY1fUS/oSd
 bezYk/ZAwg33BVEiwuyug5brPeo21xDBbGFBpaHUrCTUoLxF7NKZBgnKlAyNa4EwpX0b
 N+mxiqG3Chs54nYVRq5QuRRzgqz+6A0xBLc8Fri0x+INMLH86HdooJYgtXd7LKiFRtrU
 UB81U0ORUOUgSHeF3DX9x5Jz2eezNRj4tjnSGWAXDpzqfdARKgGNGIWuOvJeZKxwM7T/
 qCJIZhG8LuBz72qJFsabuENKm4GkCq1L1uVX/A4lqkj9Gyv1HCY/TsMbIFphW3hwEi0F
 kghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716902316; x=1717507116;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KUs431OcOrPSHN5IsKVp6gDCDDBL6vuomJl8eZ18TuM=;
 b=DN21Bg2LbeAz862NalDT01dJ3WU0eWCBK6z5UhGvx0P+PiqM1Y5P607je/DD/kvwB7
 8hXGfs/t6xJE2jq1GaZ4ZPKQf9fE1Gl3oZu66sL3A9IHKUzf7koitBZ9Fe2DfyLbcMwu
 OPH8oSl0L0sr2qYzue9kD/+9MtIYnSM6vMANOgKt6hX9Z7HS01z6AFRR56YynpWHPSsb
 RpTDM6OGGIRPATE6OWHSr+f/fnOsne8aT85aV/QYcqVChkxF1pMfJvBgRqvr3YAf5B9F
 s006jzzpNuu2jr9Ii7bkSbcYtds+rfn6hyQfwEhX/Qm9xpXG6Bfll53t6edoEYnOd58u
 /S+w==
X-Gm-Message-State: AOJu0YwY6FqgnSaJCXUZY2FocY7zwvSlmNpdwlmPsKer6h7Fu3tKI8sy
 ItBv9Bfm0fcOZWBA9BNkELjkc18PjuvApL28u1fln/jfLkj9wqIlWJKUDS9UbJe3DAMWzTlq2Gx
 WBv8SQjM/I1DKnD50TQQlhziR5Kl1u9Vep4Kpy30FXO0bQtL2
X-Received: by 2002:a50:a683:0:b0:578:55a3:8b52 with SMTP id
 4fb4d7f45d1cf-57855a3a941mr6528516a12.8.1716902316071; Tue, 28 May 2024
 06:18:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240524232121.284515-1-richard.henderson@linaro.org>
 <20240524232121.284515-4-richard.henderson@linaro.org>
In-Reply-To: <20240524232121.284515-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 May 2024 14:18:25 +0100
Message-ID: <CAFEAcA89_nWDXhXKds3gezUyXdXfO61bMNgSn=em166ufgQAbQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/67] target/arm: Reject incorrect operands to PLD,
 PLDW, PLI
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: vpinx3fXcPG+

On Sat, 25 May 2024 at 00:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> For all, rm == 15 is invalid.
> Prior to v8, thumb with rm == 13 is invalid.
> For PLDW, rn == 15 is invalid.

> Fixes a RISU mismatch for the HINTSPACE pattern in t32.risu
> compared to a neoverse-n1 host.

These are UNPREDICTABLE cases, not invalid. In general
we don't try to match a specific implementation's
UNPREDICTABLE choices.

I think we're better off avoiding the mismatch by improving
the risu patterns to avoid the UNPREDICTABLE cases.

thanks
-- PMM
