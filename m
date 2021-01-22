Received: by 2002:a19:ee17:0:0:0:0:0 with SMTP id g23csp758003lfb;
        Fri, 22 Jan 2021 03:37:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzyrT44WTTcpsCvUsNG/shSvOgpr2iagz33Vs2D8rGAJskwlFqHdlIrxiZv2kauEI3hmf1+
X-Received: by 2002:a25:595:: with SMTP id 143mr4896464ybf.422.1611315453092;
        Fri, 22 Jan 2021 03:37:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611315453; cv=none;
        d=google.com; s=arc-20160816;
        b=U1EzGSLUI1lTdOqjrwoEbTftBwGTk1xMUgQp2FLQ1sXjo8vITuQ1/+uwvf0fQPVTHN
         cjHFcMfKtptq3iqJZvqa9G+fwgKkKqb4NqLh5+cJR0qPK++MNGf7+5XOxi/QdzdoNucu
         qTrIVTGY4osFdksZAlG4fTFoKVe6EzQnRmq9r/oQTJtmFXWbj317BIfHc7XWAIxDMSh+
         zp2Q/dsTd9j1aRK+yPb2Ws5pL13M+ho/hCt/UeQL3bMXi7LboET7wWnydg+9v/Lp+sXj
         aJX+FtrzzhfS3cLav2aRnyKsHCnEix22V2x2r7ORxWdOYpoq07UH61bQ9SEONcurQl6Z
         eNvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yRxDPann/7bwjlu5VchBcHrH73lxDT9XO/l8WhnUvYw=;
        b=TomuI4TxqHn417/MDGHrT0Ljsl2XVCCWJL3HT+5cpMagJwY7sDccN0LYrDjLRMWWbO
         +NqcHxrB70yofpdSF3FEgmqUGcJtQjLEXiapoYHnzE6/ItUOYNmiX1pEMMg5Mo3ntJ+4
         /rgNCKS0iNwv7fRCfZ9Hpwymjm90g37csrnhSwiEMXP2X/d6YkvDd/z0eKdwxjF9Fy6T
         0qhc6aKgf18Hnz/+WeTUoc1mw8+1tXhTktdnao4dyejkL7mcBJfal8TXtRB+MumO5fRy
         EIqgTlcIQrSCDgYU82ff1nfBXztyXlt8rbBAJYxrYAguYHmwPtR+L08lYxVAmmzBZdQT
         Qt7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZEC+LFyI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h124si7485536ybh.37.2021.01.22.03.37.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Jan 2021 03:37:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZEC+LFyI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l2uku-0001sw-EP
	for alex.bennee@linaro.org; Fri, 22 Jan 2021 06:37:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2ukW-0001g6-7j
 for qemu-arm@nongnu.org; Fri, 22 Jan 2021 06:37:08 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:32913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2ukU-0004c9-Gf
 for qemu-arm@nongnu.org; Fri, 22 Jan 2021 06:37:07 -0500
Received: by mail-ej1-x635.google.com with SMTP id by1so7236101ejc.0
 for <qemu-arm@nongnu.org>; Fri, 22 Jan 2021 03:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yRxDPann/7bwjlu5VchBcHrH73lxDT9XO/l8WhnUvYw=;
 b=ZEC+LFyIQ1iO/c7vKx9FTIDNAs4CN/joYZLsdhGwH1xo6py6brkEr6NLc/h0lwhNAs
 vE56lDyloVQLII4d8cqnzkG/aGkt9AXSyKVCE5hnEK30LHD6Dn9MTOD97GG0pRyavPYa
 6+r2t87dcfCLnIiHVQxsO+bJ3DEuwHeEK0SSxJ0e0gVP8L7mmPFtqyVy2yHzkwhjQnBH
 goUrUHTMtqwVbhYvHyXDztdxqUbTALJR+Ke9dICGpezB5fOJagWWrBjrsv9zuB7JgpEy
 biq1USvQhiduRD6DpD7az3ZGy2aEELKAYC3RIfkeUx9PqgC9+ALU2YCsMFAoBdp2fvVF
 2gcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yRxDPann/7bwjlu5VchBcHrH73lxDT9XO/l8WhnUvYw=;
 b=HGz5lpKyy5orM/nRd3K7bZHwzIGXq3+yQfK6L+M5hXpVBdURU2KyzxLH//k8r2GZsN
 TIpxeZodQhi8M3bj8w5Lh34O4Tkk+R9de3OjGqPYydTsaM/ffzJWJ9UJn+P3Ehpul2AZ
 fATc2zHPIHxhAlOzMRNnGsRqmvytykp/L9jVbmmFuyFHZOFWz5inhFnln+Ct5w2sjCUi
 QVYDUqO62x3+W/wZOXJE/v56UfjvFYVYqAeHY8CBJ4esrzsqihlyQXmOQSIrsfMsP0fl
 QE/OQ/mv/J04+n2oUGTLuHxEqd6CL8MTrHROSSmEE/F87OIy+Jdfkn6OjujAQPtiOdbJ
 CXRQ==
X-Gm-Message-State: AOAM533Yza9l2U/1omgtkrENxnotRJE517o74qu40uiolOij+5pKyJU7
 zcVLQLM/gcc9xKZWPo3zNBzqmM9UE502G6GZAZz/HQ==
X-Received: by 2002:a17:906:494c:: with SMTP id
 f12mr2787100ejt.56.1611315424620; 
 Fri, 22 Jan 2021 03:37:04 -0800 (PST)
MIME-Version: 1.0
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
 <20210115224645.1196742-13-richard.henderson@linaro.org>
In-Reply-To: <20210115224645.1196742-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Jan 2021 11:36:53 +0000
Message-ID: <CAFEAcA-2rcoOK4wLZ_m+fX69o7o652Fb4FwBj7FbQgdG4RU3Ug@mail.gmail.com>
Subject: Re: [PATCH v3 12/21] linux-user/aarch64: Implement
 PR_TAGGED_ADDR_ENABLE
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6t2AmJGwA6ty

On Fri, 15 Jan 2021 at 22:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is the prctl bit that controls whether syscalls accept tagged
> addresses.  See Documentation/arm64/tagged-address-abi.rst in the
> linux kernel.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/aarch64/target_syscall.h |  4 ++++
>  target/arm/cpu-param.h              |  3 +++
>  target/arm/cpu.h                    | 23 +++++++++++++++++++++++
>  linux-user/syscall.c                | 25 +++++++++++++++++++++++++
>  target/arm/cpu.c                    |  3 +++
>  5 files changed, 58 insertions(+)
>
> diff --git a/linux-user/aarch64/target_syscall.h b/linux-user/aarch64/target_syscall.h
> index 3194e6b009..820601dfcc 100644
> --- a/linux-user/aarch64/target_syscall.h
> +++ b/linux-user/aarch64/target_syscall.h
> @@ -30,4 +30,8 @@ struct target_pt_regs {
>  # define TARGET_PR_PAC_APDBKEY   (1 << 3)
>  # define TARGET_PR_PAC_APGAKEY   (1 << 4)
>
> +#define TARGET_PR_SET_TAGGED_ADDR_CTRL 55
> +#define TARGET_PR_GET_TAGGED_ADDR_CTRL 56
> +# define TARGET_PR_TAGGED_ADDR_ENABLE  (1UL << 0)

Stray extra space.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
