Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp686129ejf;
        Fri, 23 Feb 2024 08:57:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVVQ5A4GIQBeGg/MJAVNSrkLVatXcJDJEtZMcjvtbOsSVrz5XEX/nCyffro+se5Z0UPTm2tKH3Y1TxckBRSTdKlX3Iyerbl
X-Google-Smtp-Source: AGHT+IHBMFKigzZ8e9sC40/Kl8vhwK2pVepKfYLg0wINwq/s2wgyPouXKaQZfOOUPQcatyYXLfgW
X-Received: by 2002:a05:620a:351:b0:787:a2df:6a0b with SMTP id t17-20020a05620a035100b00787a2df6a0bmr344893qkm.49.1708707453101;
        Fri, 23 Feb 2024 08:57:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708707453; cv=none;
        d=google.com; s=arc-20160816;
        b=HBYHRroQmAt3HEbSd/q7FQpbrw1dmEEHBwPsa8ThN0rRreN29sPjOOGoIyLitBpSsq
         lH+zsI3cwxlRCPPXka54GG3koIubHdz3lriW6Jtft/c5+su/Ob07PRR2OTy4JK+zpCID
         X6VVgUGpFbbSU0fCs8mMrk6bhj52+Tt+4LPlGyXEAYsznIubnmxgeReeOCXV1XMbSaIJ
         fB2uy0sYaZcclAdJ11kwl7FxsRV2WQRrX6cNJ/psV2qnUxV/+c1rLC2vrvXOyhPz+EzM
         XoFnb2pw1FAU4GVYFFm1UW3pri2+hh0ui1W4EC6QsimKHheBh23n2qe8sFgoYkv9zT50
         Bf/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=pZc25dn41Pr5mgn7N8TPAoYH29m0vSeYFNGuMqZaUnA=;
        fh=gdBed72JnSifzQdV0PLkUCrNnp2PjbNCgzXbyzmTG1w=;
        b=X0PentcPIZlkklhYJZxeZ5/V4x1nWKXha4Deix1MnJrQkc1H1xuPLQwIO1MOgJuz9z
         S/a8xSQYa4vpELCq7wekV91N0svnioLDNwIbLx4AkV51ny5ROqN2v8bsj3QcmXasei75
         9RPNfrCGnsWKErEL3D1fpPYo6rX9U9xc2xtZGJK7QIsD2YwCRf/16RMJFLBVtko3C+JR
         KlEShYVDxTeqrRA4wr2D+zvgLhO+vPi9RTYsFcTLBNRgtaoNF4dgCkKwQHKPQUGtbqJy
         kZrnl17bCXxvbG7GYfk4L6Pn9EUUc0lOQVV5Z9qp7R6v1WS1/OUKhP1+rdbpI8Nqvjn0
         dR0A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DZhz1JfP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c24-20020a05620a135800b0078753f558edsi13957133qkl.701.2024.02.23.08.57.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 08:57:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DZhz1JfP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdYqQ-0007us-MO; Fri, 23 Feb 2024 11:56:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdYYr-0004Kz-Iq
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 11:38:11 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdYYq-0000QJ-5i
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 11:38:09 -0500
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5654621d62dso1058832a12.3
 for <qemu-arm@nongnu.org>; Fri, 23 Feb 2024 08:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708706286; x=1709311086; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pZc25dn41Pr5mgn7N8TPAoYH29m0vSeYFNGuMqZaUnA=;
 b=DZhz1JfPlkKwdj1ZkX7JFlcApFIE1iU/PiH8X+GB2c5faMGe5XjO29qkz7miQ4NQpQ
 BrWBZ4H+MRRfGXWqPFYK1Ocdbc5CvXylPZbto1WXwzxcvPDZmWbfTwQmOqpz/OCGLuBn
 elaIsTjJFPbAg38kSIteRSZ76qG+fRwRDa9QOvH+ar0J1dzLvQkSDiarGAiJhDkxp7sT
 CChCtKM7frZgFwpQdvkJpKZC5A0rMUsPQpcD3HWAkSNFatwMqYe6DSEzijugr4NtohWo
 sAGcJBxaMGqbLIMqiwiUJ/n7uuBpmgvl/G0mTV5iClG/Hwx3TODIFQafmIUT/dB/fDnr
 uQUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708706286; x=1709311086;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pZc25dn41Pr5mgn7N8TPAoYH29m0vSeYFNGuMqZaUnA=;
 b=wwukirJhITLokl6kkpGdWvXxYtHCJ7Y8ucvCh1HgPnvL74+VT3w0D8yOtKkEDIn9EV
 FsXShP9eYeVyRDw9TRSmUdwaMHlaoAiOfRpynmr8+bTqMOAiFixnnbrsiiIy1nwKcRbT
 BhqcMY1zQBE1yjP3ss4MxJPU1+durqpmXmHwq1JJvWaWRJzKW0sPYEqgwjMXjaJussNV
 2OhqdLFr8yyShsgmCxzGWeCklUiOA4/6mopG/qkIeyjKpZOH7qnw9WlxzME/QwPlMXDi
 xV9k7+wxmzgzbwf1l7wVc1opRlaZOHNAkVIyA7+kPcUCriCCPA6jq4we3vkzpjDFJx+w
 wiqw==
X-Gm-Message-State: AOJu0YwTq1oxS7dXAB56GNVrkCEQ9bBxEAw0xxxLhSDdXUBCJjBwAqYA
 gx34PgGaibxnbbYESWTUGx3v9BrWQ4nk1wAueWkuzP3VCt4OftjjyX5JVUbwF3Pb5k1FC158lrf
 c7dLeeha+1RamZ0niTdeqKtsEtFtXpw3Tg7zXJw==
X-Received: by 2002:aa7:c0da:0:b0:565:7ce5:abce with SMTP id
 j26-20020aa7c0da000000b005657ce5abcemr248485edp.20.1708706286597; Fri, 23 Feb
 2024 08:38:06 -0800 (PST)
MIME-Version: 1.0
References: <20240219011739.2316619-1-sergey.kambalin@auriga.com>
 <20240219011739.2316619-3-sergey.kambalin@auriga.com>
In-Reply-To: <20240219011739.2316619-3-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2024 16:37:55 +0000
Message-ID: <CAFEAcA862NjREpcjGmSbB_7zAG8vD=t0AkpqdwwVQj8FnVSUUA@mail.gmail.com>
Subject: Re: [PATCH v5 02/41] Split out common part of peripherals
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
X-TUID: rRWd3MGBr05h

On Mon, 19 Feb 2024 at 01:19, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Pre-setup for BCM2838 introduction
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
