Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp1082329ejb;
        Thu, 23 May 2024 07:03:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWN/e8Fe1bwK5ugdR02GdCDz6jpdLIoELlbPbd7P11qXOsAJzX4hSvEm1LNq7MCCA5ISm/k1OSnVPSV/5f3CXV9puWUZ1xb
X-Google-Smtp-Source: AGHT+IErQ8Q65QsXGAl6UMXw5UFCaV60cw9Lb0PYYPIbIare7wf0JY8k+WIkdRbXxpzl1UKPi/FO
X-Received: by 2002:a05:6808:1058:b0:3c9:cf94:aa6a with SMTP id 5614622812f47-3cdbb05c3d7mr5630058b6e.49.1716473009222;
        Thu, 23 May 2024 07:03:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716473009; cv=none;
        d=google.com; s=arc-20160816;
        b=IxvdcLktJBzDmX685s0EQUbX9A4nI1v/Zz84njh1PI63LomsxKz7GhxU2HDvt4f+MI
         G/ZkBgZ/sUnvHWL0BDspDIUXtsRZ1i/RR2487pDeOslxATtlhGeDIrhtRX+BjVmWSTLQ
         /wC+r0tqMXw7OX9FwJSfm1fHwrT8SJAB1AL5hl45yhbjj4gCp5zUnQyTAOzLyd/lV87u
         YRgOsEX9/xu6x5qW10qC6ZUkI5wUH7KBOa+f3GBigW8FMySVdo4Nkf1+648hlkMAtw3s
         C3jU56Wl8qIVX5BtdN64WiWEyScqDHdNGXGVU36lAcexrZ5mL/C9y3eRXDg46S9394kJ
         ibpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=BPt+nb7hywVmTI8U6ts2p8IFjc0iayqwxsudITFwFFk=;
        fh=NfbKhODcCzxaqeYywjLHPWCQTDuKgG3JJ3uBNZ36Wyg=;
        b=ML9jqSMi8jZwDS8JZjqbzLsBmigwanLyZlKTIPSVN4mXvpfwO5C4tdNBqFUGCKI9se
         /edBvzRrdDvZEOvs3piBROaHVocwBPv9f4eqYEN1X8yJAUH/cqz1EiEb6tDu3BIzSJLL
         3wcdG00LyznaDVqJXqZLY0KjK+UKyyHJpEzP1TSAyPOm8eCUMgt+Q9eimi6zht7w5igP
         Riu+W0InXBunlyHnK2Ur4zJv1c0UIi7yk1CTASy5+Ego1IWA0httzqBwEtK2lG/WCdD4
         j16gQCsV3LO+3XWyLIFqi0oBoxPSvgpzShf8Hr+UnK2kQKYk5eylMBDfl5V+qtUbthlR
         c/OA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R1Vt5c1t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-4df7c07f989si5456631e0c.202.2024.05.23.07.03.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2024 07:03:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R1Vt5c1t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sA92A-0007lr-Ey; Thu, 23 May 2024 10:03:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sA91w-0007in-1G
 for qemu-arm@nongnu.org; Thu, 23 May 2024 10:02:53 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sA91u-0001TX-6l
 for qemu-arm@nongnu.org; Thu, 23 May 2024 10:02:51 -0400
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a5a0013d551so642815166b.2
 for <qemu-arm@nongnu.org>; Thu, 23 May 2024 07:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716472968; x=1717077768; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BPt+nb7hywVmTI8U6ts2p8IFjc0iayqwxsudITFwFFk=;
 b=R1Vt5c1t3SD/0GfHvau2Qq/GpYQ6XsfV5jysartTUPCXpFRK6oRvBiAJkxTBSvFk6R
 VsBUpqHcuEFvARJY7hDyGirLcojh4ohaOhs44/g3fS5ZPf1yZVUlLPmlhNA/t8S9nW6b
 g1PIEWELEthbm/DDjlLdk1dO9x+/AiaFWM/yFUU9cGxuAFe1Ic2V/VBYRh93ciNm4GU7
 cesSczic875keo2ujZNgjhjCRueaG90V+V8JobG1XuyuyNPQ06MkEfc48vb4Zg7Q/a3k
 ccp8sBp97wA9UJCgY51KZ/oUha5MIyS6FPr4H3CJV639CpNkBcxVFmZwV7HAlSns3Snp
 Q1vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716472968; x=1717077768;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BPt+nb7hywVmTI8U6ts2p8IFjc0iayqwxsudITFwFFk=;
 b=sxpFutRZoZb7XNdt9kdgCLJG8B+4MahpcG4utJ3asNCJzlXbhDKnW9kP6hJ4vU4kM4
 6h8N33o1fhqDQPATgrcZM+g/GnBuu6pi2UpLCI0LHNXVSILODW/Lz/zIC1FrPyrbo7Cu
 /MGSF/cAF0CWrzOaBRmEf4rm63Aw3xrjoWOSjqSJ9B4+fzddLLItJftNaBuau9KqwoQk
 FJjMgF7IBNlrwNR4L3epKjOZ2f1PryVs1vxcTV0enOANR5Gx/8OotnqDOp6Q+X0pYw5j
 6jSqbC9+4Kz957Bs3FjdosrWhCNnQdIz7Fj7A3PfSTJ452GKNOZTvlcl42leTifx0lLV
 /iVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7m/VP7jiHLnzdky3c4LdcpK0zANLxkv0k78h2sUn4IET/MMxBnK3Bs8yuY7sJbl+vzCGAQxrf31IlvAt3kxJuKslk
X-Gm-Message-State: AOJu0YwfC7SDW3HVxh34T5K5Jy/Aw5qSRD3VsjfCJ5D1K5bGz88RZUlq
 jHEeMnPiWbWPc3yJOm3uoI6/TtXkDmfi1dTHFEPTrmp2I27aMtH5EswRAIiyVgIg3s0LxNR58k7
 gL+BndVs1ynMyOCxSsZNx9USVjKRKu9Y51Q7ZMA==
X-Received: by 2002:a50:aa9c:0:b0:578:4ad4:7645 with SMTP id
 4fb4d7f45d1cf-5784ad4788bmr1099417a12.36.1716472968098; Thu, 23 May 2024
 07:02:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240506010403.6204-1-richard.henderson@linaro.org>
 <20240506010403.6204-27-richard.henderson@linaro.org>
In-Reply-To: <20240506010403.6204-27-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 May 2024 15:02:37 +0100
Message-ID: <CAFEAcA9hbxVwFZAJH8hHjLRb-zPvsgn4E1M5Jb1fqOtECa2EOg@mail.gmail.com>
Subject: Re: [PATCH 26/57] target/arm: Convert SMAXP, SMINP, UMAXP,
 UMINP to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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
X-TUID: g9pKe9rppTLv

On Mon, 6 May 2024 at 02:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These are the last instructions within handle_simd_3same_pair
> so remove it.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
