Received: by 2002:a17:906:2317:b0:a3e:79c1:d636 with SMTP id l23csp254447eja;
        Thu, 22 Feb 2024 05:58:34 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWzx94zLpNuEue36zcMr7UxOxZ+wb6ZsXEVPgvhc9AgGyAiw571ReBDsNx2CZYMV9wJwBOkqvyBwVFl3BRm4KANv8c/girH
X-Google-Smtp-Source: AGHT+IGSk7/epUf2B1LtSBica+q+ly63cJnXha6qkmHGI2N03Q5BE1CSAoNfsudzkth8Qfgp7aP/
X-Received: by 2002:a05:6214:4001:b0:68f:301b:5485 with SMTP id kd1-20020a056214400100b0068f301b5485mr21341804qvb.5.1708610314316;
        Thu, 22 Feb 2024 05:58:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708610314; cv=none;
        d=google.com; s=arc-20160816;
        b=KvDOImF6icLjAf/La14uNxkdokFlPGJ6Q16cM7IwEmwwiWcX4qYENxhE0hYi03ZYuA
         zgXWB7baMlSTyEf6A66j59YPsn9xXt5HPFipnhBER3We/qsBQx9lGYPqGkKu8knGhqqd
         5j6NbXGK7kcXXmoLy6jtX4GvwK1G+Eg7EDvVGCpg38weFtBz6avqae1MFnuvhsCp5QDA
         +mZARAQ4/AVcxjKlFEy/OKw+g35eGE02Upl/03zqhGQ7nYKBb/ULMZ4klH6IEII3pfjS
         xjXyCNFnwxivBoNcgKknaBDJDSd39AofOsWZ71LP/atm3WbG8sJaAa7d+9uk6TL6msar
         F3eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=jDPcUci35H3C/VnE3OFjdHJIAfHNt88JWRtO5LfoxiM=;
        fh=YEZkz5xE9XsHqQ98J3jWBds8Am+BoXM5EH5ZHLsfabI=;
        b=jT7ECXMpCxelcTJZLJbX08juAB5QsnSb24n9ge0exLuEFDQiRNIypXKFXBNeUX25Jr
         5Twvnli5MZ9QMaW53OQqrgUTzgyR2Y3bEO7VrtqjpKjZpty8stmEXzGW/ntQMizDgn0X
         8BWD0vXa78F922Z1to1jxcBfQ3vEKTfqYnDgep4U7WqnlTA1XEWZt9zStlpogzCPQvY7
         VtgEFDwfaPFd6AXyJb2rIpqgpuu0FrpTqEW8tbDknEfTfL9kE1s+t5+SYTICm7Xc5B2I
         d6g5lMMu3zKwRxrAcWKTr5ndDaLB4z4/XZZHgBq3IHiluxUTlRbMjtQBMCgUkEZvNY/U
         ipUA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ihG4pOj+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p8-20020ad45f48000000b0068f99fe364dsi4962813qvg.483.2024.02.22.05.58.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Feb 2024 05:58:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ihG4pOj+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rd9a7-0007wp-NO; Thu, 22 Feb 2024 08:57:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rd9a2-0007w8-3z
 for qemu-arm@nongnu.org; Thu, 22 Feb 2024 08:57:42 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rd9Zy-0000Fr-Hw
 for qemu-arm@nongnu.org; Thu, 22 Feb 2024 08:57:40 -0500
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-564647bcdbfso2118120a12.2
 for <qemu-arm@nongnu.org>; Thu, 22 Feb 2024 05:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708610256; x=1709215056; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jDPcUci35H3C/VnE3OFjdHJIAfHNt88JWRtO5LfoxiM=;
 b=ihG4pOj+2z24Y+3FmaNskBYWA2yzXACyPA0MrOT1Qm6TJ72xfVA+2V7wRvFTD1QIPo
 kyF4E6I3xz0y1YSM5hisLXTpTKllgAQMYOyQEQE9zdYvfG03AA8Py83Z/g9EX64XXw4t
 ojBaK85rYccm+ICiTB/TzbV3LaPKjEN47J8Hw3Ku6pePZj2/QAKmbHF/OUN4ZAi9oMa4
 MoeHeQ0idEXj2N9RDIRsrsRzVaqIx2Svq4OGXPI0Vg2O4ikpYSnyen588LBm0qXmPq6Y
 X2H0zg1cIYWbLkorOD5N8aK+bp1lVa38sAbobpr8EG3O+C2ckrsXVeHaurmPJ6Wte0wS
 a16w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708610256; x=1709215056;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jDPcUci35H3C/VnE3OFjdHJIAfHNt88JWRtO5LfoxiM=;
 b=M8nlOrdvZWugoxVgW1aV6NJXB95OhROgZt1xGqIINrZHr2GNCFeAEhnvoVAMpwW2e4
 Rckq768FJz8LsP1+d1ffJOl4aI8iq1IdVlsie46otvQ39pjIZKLa/yDVV0L0Ow9udaUw
 nmVEALeQ8Iv/CuCSH4WMZsH3f3X+bG6CABFTH/xwvLX9vDBTf1+NgZcaeofOm+mnbKpR
 fMFURAktLB4/2XvC2oajhu4LzQXGZUlPc1VAlunw5SCvQ44Uh37zqB0ckmRu5cbAbNVO
 P0Fc6fL+pkrVBuRovIPMz17XurujAdnIm3pMpWApzuxEz2HxexmkZKwTE2cz4Mb4ZLAn
 cA1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiSYB5Mi4G4I+apAjiKeeN2LLSyFWJm+Hd73BgiutVBiFk6QlrhyXSLr1VteQBHMjQAtxTrHlbA8wJ5/tvE4s6rV1h
X-Gm-Message-State: AOJu0YxyUhj6oPKd5ZQirWIcPuzccNFjTUEVqernugC9oa4k6z9BISl2
 LzvAr6AZzVVoMrJNWGH8darEbGNEkNFS64cqNLJA/veRGaYHmcTr/TadWVWjzS608lHEKn9EX1A
 vZ8mRLOzrBTC61hh7FgKta3NKUg2+fnujTl6z/Q==
X-Received: by 2002:aa7:c643:0:b0:565:3a0e:5455 with SMTP id
 z3-20020aa7c643000000b005653a0e5455mr1260547edr.37.1708610255383; Thu, 22 Feb
 2024 05:57:35 -0800 (PST)
MIME-Version: 1.0
References: <20240215153311.186772-1-marcin.juszkiewicz@linaro.org>
In-Reply-To: <20240215153311.186772-1-marcin.juszkiewicz@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Feb 2024 13:57:24 +0000
Message-ID: <CAFEAcA8UAeCPN6bJXZhprvESDaXG0DqoXbtdF3_6ZnKwM4inQw@mail.gmail.com>
Subject: Re: [PATCH 1/1] hw/arm/sbsa-ref: Simplify init since PCIe is always
 enabled
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: qemu-devel@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>, 
 Radoslaw Biernacki <rad@semihalf.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
X-TUID: 2mkD/CjipJZB

On Thu, 15 Feb 2024 at 15:33, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
>
> There is no point in checking do we have PCIe if first thing after check
> is adding PCIe card without checking.
>
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>  hw/arm/sbsa-ref.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)



Applied to target-arm.next, thanks.

-- PMM
