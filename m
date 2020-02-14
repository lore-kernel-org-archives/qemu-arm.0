Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp2350327lfp;
        Fri, 14 Feb 2020 12:32:32 -0800 (PST)
X-Google-Smtp-Source: APXvYqyBO1RN1DwzKp6vhpgND0FfpZuLNhKbPH8H0PoohmjxTyDZgZxhCL0vE0respLTQCpjN3QQ
X-Received: by 2002:a37:a116:: with SMTP id k22mr4253080qke.340.1581712351845;
        Fri, 14 Feb 2020 12:32:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581712351; cv=none;
        d=google.com; s=arc-20160816;
        b=XUtmxkZwExj52bJHCox1UU8FuDg8hoJE0wKchfk3QeNPqZezl0+jiC+i1gEmXwElWH
         vlwyw7X8kRJY6OaMGDIbD1RSPaGe0sSqQMrOcS7XX/isU48coiHN5jQXmLToSJbDwaFM
         y9+cEKP/tDGg79qMLofUacX9B3RLX3vhoiST87wh6RHIZqzdKQAjGwUwPZ3vdPkkqMir
         85sXuiXrXtjRb9IQUxVAC5hKKGWkxU0C+FUHHWj0cdMbTOIpYn16JcYQj58mKh46vDp9
         1Yuh6lBb1TDO/3ebHHTHZXl3zBh4+pAUULzr2vH3rRCiHKjcg3ELlnvXPvE9RO0iwrzC
         mc8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=9hG8SXXZJoqeLzXg5G3xeFaLJJkIakNB+GjZrK3aecU=;
        b=tZ1i5Xqu/20zuTmBLvVJIb8HVUK9U8Ek5JNYV/tyJiWLkUhojJnJCHIntBHRa6oTAJ
         MbCBc3/iEIoOW5D5A1ynpprDmYJVIC/RO8ZQCcRj4XN9jz2M4HrnrxrHRd93tLg7fabj
         IbKziMx5e8pmtjyxgaQWAAbmt9ru0Bnv+sGybvLVIWTCRijE0Yfqk54kDYZCPHZv1r3T
         eHMjcE5+Zjq/eToy28kxwHf99GzV47I2e/0RtGjKniy7xYk7/jGtDcLSjLtpSx7Mud8M
         QVBF29HBBvyK1X1d0uApWjI1kwcil0qq9srAYYIG+hK9qSwehNerQDBwQBdV/FQKE0IJ
         +5Eg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BVwef2TD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z1si2966825qvp.210.2020.02.14.12.32.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Feb 2020 12:32:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BVwef2TD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2hdX-0003Th-99
	for alex.bennee@linaro.org; Fri, 14 Feb 2020 15:32:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54940)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j2hdE-0003Cw-52
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 15:32:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j2hdD-0006vj-6f
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 15:32:12 -0500
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:54336)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j2hdC-0006ue-VS
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 15:32:11 -0500
Received: by mail-pj1-x1041.google.com with SMTP id dw13so4318844pjb.4
 for <qemu-arm@nongnu.org>; Fri, 14 Feb 2020 12:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9hG8SXXZJoqeLzXg5G3xeFaLJJkIakNB+GjZrK3aecU=;
 b=BVwef2TDnEXSg/XMvo4XEADNYW19ahzUur2+kTHx9Aoip/Utui1ejAgkxfl93dGf69
 4biJljocNZRH0LYQ8ZlKQ02oCFOexLri7F0RHXNY5G+oAKdcL/aUChUFx9NrLVwCE7As
 F+zMLa0XdSrOcC9sPOO0D6isqHii2VuN4HnQl1SINX5lR8NeHF2ylCYvPhRfoTirlHQc
 D7EBWEowgU4y+67zYMCYoNREma8oJ9btfF1OgE3Udu9sLnRGH42Mvp99i1RJbhZzoKMw
 GDWK4+gVdCziRBXlk1+h1z4/HWF7hsf4bzF/Vr3lKtcrBgWcfUHkgMD1Z3OQn6FcMj9s
 U4vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9hG8SXXZJoqeLzXg5G3xeFaLJJkIakNB+GjZrK3aecU=;
 b=EN7dx+4xyvVqzSoFisPcCLYy6ihOA3Q5+k+iTzO9Cp7YcjNofzMcqrGZ4VlvVwuuVK
 cO0JbFDfv2R8uP8T10tDl11XsZrJAa9jTRbQWUTXbMCwaBny4scciu1x4rId/kquwJ7Y
 1YBlf5BOqxE4s+UlJ3K6MtUtaJ52I2xDdhdKFKMgJT2n/dxcJOBZ6Pud+YnqIoY3bm1j
 AygtcQi9p7mAFQWjcsrLbFyG6PnG9hNfSGG7htoOTrFovAmJH8ypQlNs7z2NRY1aUGOl
 lQpdk4uYhARvpiAJ1tEZSsi6YMcb5cBkrsVPKig74TIAmn5m28UOoeyIOKGF/6P25mZf
 jOaA==
X-Gm-Message-State: APjAAAV2MS9GB4SyBczhjfoUwKYnIr+o9axknU+2tdciAidasIaC2+hY
 gaVHw5Nu4wgYKikkrsYkwZZ8eQ==
X-Received: by 2002:a17:902:7790:: with SMTP id
 o16mr4877872pll.271.1581712329982; 
 Fri, 14 Feb 2020 12:32:09 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 q8sm8078939pfs.161.2020.02.14.12.32.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Feb 2020 12:32:09 -0800 (PST)
Subject: Re: [PATCH v2 19/21] target/arm: Use isar_feature function for
 testing AA32HPD feature
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200214175116.9164-1-peter.maydell@linaro.org>
 <20200214175116.9164-20-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <15e44636-abdb-c339-1eb0-cc59343a9334@linaro.org>
Date: Fri, 14 Feb 2020 12:32:07 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200214175116.9164-20-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1041
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Eric Auger <eric.auger@redhat.com>,
 Aaron Lindsay <aaron@os.amperecomputing.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Q+cEJBz9cUS+

On 2/14/20 9:51 AM, Peter Maydell wrote:
> Now we have moved ID_MMFR4 into the ARMISARegisters struct, we
> can define and use an isar_feature for the presence of the
> ARMv8.2-AA32HPD feature, rather than open-coding the test.
> 
> While we're here, correct a comment typo which missed an 'A'
> from the feature name.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h    | 5 +++++
>  target/arm/helper.c | 4 ++--
>  2 files changed, 7 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
