Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2161937ejf;
        Mon, 26 Feb 2024 08:26:43 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXb6gzrSu2nqadkVsapdiZb0bLeKPSCcNZ1QNYBxpx08wGCJeTUurfTYrQbNByh3ZxjpH0SX/D7EIZJEA50DrmdJkSxzyWi
X-Google-Smtp-Source: AGHT+IG6oqAxJnnfxBN9JvHUyaPim18tesFUnsD41rH25nigOxngfriockBSSQYDrOq5I1Y7hEXy
X-Received: by 2002:a0c:df8b:0:b0:68f:6dc5:14b0 with SMTP id w11-20020a0cdf8b000000b0068f6dc514b0mr8500738qvl.44.1708964803056;
        Mon, 26 Feb 2024 08:26:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708964803; cv=none;
        d=google.com; s=arc-20160816;
        b=ioxhnYE5rWiaLc234ZWDfFENHFY9FDu/cyq6mbIqjNy2jheIAbe9fX6zaNEKOXJvAJ
         rpBp9Y5hZgqJlHO8vSkMoFot8kvjQabwlAXhciM6btE9rC4GxOIw72C3dAWyfPwk1xnu
         htEflDDLfKpMyziUmBYi9sSWZLIMFOiZpBLPHXmaPXO9SdykCbDwEctndmWlvDtADPWF
         cW7wJLvgIpL0nQPoy2VG6/An1X62c/DceORN+ol/tTLnNNDGLYhfoFdT9UHQnCmMFjV3
         2IMcO9DzwVMOCwTAfhbzS0enMXxi8QSc6pqrfZdHvNLK+IpzRsNpEua/IvFklQg90PhH
         W/VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Al7NiyG0DjAOIvuLmW/3Gqmjpit13X+oiA/kiHxVdTs=;
        fh=gdBed72JnSifzQdV0PLkUCrNnp2PjbNCgzXbyzmTG1w=;
        b=VDTxSOKMuonSuA8iIua+M+xoqwlAs7lPzshDJ5Sr7QBI/blIZ9pUAgJ0RUtL2u4lfy
         xJ7yqMtkKbKoE0K3exCcYmE7pZoe13pAwQEJPP3+bZ1dxYuIOmp7REgF9OpOHbzkgagw
         f/gWZjWpRch+IZ1HWHGrXeBXf8SH8/Kr5ho5B5JWJWjCF0kk5DpLJSAEdXOWzGaF1kcV
         xCr0DDqJhyOYtiuOElqsdMHrABGbRSNnF7WKusSSDz3b/8DDXLrtDYP2sHNqwOXA5Iej
         oZzxbbX0wHKWTRl0h1eryqEmsIk9NOxVTH9fpjGoRApDpU9OQwPoC4W8l8WnnJ8aJb2Z
         dOYA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F6QYPBay;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id js5-20020a0562142aa500b0068cc019bafesi5372721qvb.396.2024.02.26.08.26.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Feb 2024 08:26:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F6QYPBay;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rednx-0006XP-1C; Mon, 26 Feb 2024 11:26:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rednr-0006It-Mb
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 11:26:08 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rednq-0001sL-9k
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 11:26:07 -0500
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-563c595f968so4309116a12.0
 for <qemu-arm@nongnu.org>; Mon, 26 Feb 2024 08:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708964764; x=1709569564; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Al7NiyG0DjAOIvuLmW/3Gqmjpit13X+oiA/kiHxVdTs=;
 b=F6QYPBayGDYTpXcjXv6B2VVEipUvnJVQiQMmaGofFWs46gsjRfM/b5G7sdxOIkPc43
 xv6WzTGkqz1xwNZsiSDTv/SfhpDrwdLGOeV0pN3oJDLUQW1g+OCLgei5kuX50TS4W78e
 F2/0YhMK3aDLYIiL23IjxaODuXVGO1Rx24C+brQeosyq0/9u8A2fryEdWFN2M7RDrSMd
 MpU62AjmtELBm1gaZajsF34LUqR2zedUJVpXSj3QEjOf9YvI6/OKXyTFZqpkcaGPqaZ8
 iuf5ilra0Ha2ZI/P3NOWnpJHaX9yP+/4d+qdC5MPLPv75lZlmzzg4bkepssLkoft7tNE
 mcpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708964764; x=1709569564;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Al7NiyG0DjAOIvuLmW/3Gqmjpit13X+oiA/kiHxVdTs=;
 b=u2CPr9N43eilOItl62hvhp8EZvLtyfzPFkvX9w5hTsH8R/OoAeOoc0SF2MYyDHGMBC
 3GsDOy6GNlY/G6kQxlLsax8tvYL+fF83cAFVLiEtlZ++/gc5CxOElZS/UdTYKc4DgIl9
 7eiVZJfo51VaArAfHFvE94axU8JTjO7N/mK5Iu1k6NuMdDzXbuK0uILK1ucs280jTxW6
 MWBXciysSG6ugGRfoYGA+aJsA1oyhgrJoZh8Jb2wDZYQYXPe03qPJOD1NahsvwpeMR5D
 463Ff+FPH38jDZsrff4jVOxeZs12b3mcSjdCZ3ZeiIS/hyOWa4wMHsZ4HIsb+pPsAsHo
 c67A==
X-Gm-Message-State: AOJu0YyTQQpyyiYRTGz8UpXeP4QZx9J0OnT123FKxPkrHmY1novwSf6b
 J9+dELkhnHJJYFFz0Co1iJ1RI4FNE+RiRLqy9UfmLuyZGP3ozZm1uaRBfjjH0j3elRruv5yfCtf
 AmZi/nR4WPnu9NTQvBWm1GmHZYXXGQjZuXK9RLw==
X-Received: by 2002:aa7:d513:0:b0:565:7ddf:548b with SMTP id
 y19-20020aa7d513000000b005657ddf548bmr4990645edq.1.1708964764283; Mon, 26 Feb
 2024 08:26:04 -0800 (PST)
MIME-Version: 1.0
References: <20240226000259.2752893-1-sergey.kambalin@auriga.com>
 <20240226000259.2752893-41-sergey.kambalin@auriga.com>
In-Reply-To: <20240226000259.2752893-41-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Feb 2024 16:25:53 +0000
Message-ID: <CAFEAcA_gp+maY=Dz4=kQMADawu=vrg6pTxLLpjhxG8-yRNJnRw@mail.gmail.com>
Subject: Re: [PATCH v6 40/41] Append added properties to mailbox test
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
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
X-TUID: 4nQLyHO5phGJ

On Mon, 26 Feb 2024 at 00:06, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---
>  tests/qtest/bcm2838-mbox-property-test.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
