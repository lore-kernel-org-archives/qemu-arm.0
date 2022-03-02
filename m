Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp613441lfo;
        Wed, 2 Mar 2022 03:08:53 -0800 (PST)
X-Received: by 2002:a81:178c:0:b0:2d7:8d37:a83 with SMTP id 134-20020a81178c000000b002d78d370a83mr28468711ywx.205.1646219333264;
        Wed, 02 Mar 2022 03:08:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646219333; cv=none;
        d=google.com; s=arc-20160816;
        b=J6IruvWZcfZiY68MYgc7CjOcs9gSs/EOEsu6WyU9gQa7L0wEBAyty2I44fJXqypJRe
         9mnGeTSbZ4ned22Fxs3uRLAcadYCFxWV9dfT3UGIH1HdKX5sIgQoFkiL2/YYlQoPYwFh
         K9zniO28eBQSqBdaDz95hZU6I1PYt1CcmW+42QnZG4WNe8LJ/osYZOCnMjBNaRlqdEQe
         igdkzdsK2rvYcytiUw9/YXSFTfmsfrTFCKO0llx9021coVfCHGvtDMekbETPLaNrQSaW
         ai3T/jkqIvBXfqpBDRlqLAXC3Oqj29EhTlMnnsShMxBzItP9l9mpyULVOAqEx0nslGD0
         887w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aoaE2JNk7pDFmBahG5UX1vgTn40WfvyEsSed8FaQ2Jw=;
        b=PmunsD5cVJacPR7nuWur/1oC9pKuDL0iD2L7Sy5IDzdoBCRW+1lxMqRcl5OoHaPuWj
         4qgzuEl1Nirlj/hYgvIZLr6Is/jYfmooEW/GxrAXcwIlM1UYICNdhKbO/bmyMw2e/Cti
         WpKCWTMDJO5nG3jTeVP8nmDDAtHTKbiGmXt4SOJXmAfIsJ/ELiv2kz41NuieQpWrifdM
         hnjUenOmZEXQknBWb0t19utxK2IRSbYGkFVbBtrXNTSNbby/gCNZVgdZp2LPoZhRviQa
         A8Wa6j8Fnkurc9x/U0RUmevK+A6LeBGbZ03F57ioER1xW5oW5WojgqadYJq7B4xMWw5C
         UYPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MjacDy4T;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u15-20020a25790f000000b0062441fda571sor7849188ybc.31.2022.03.02.03.08.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 02 Mar 2022 03:08:53 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MjacDy4T;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aoaE2JNk7pDFmBahG5UX1vgTn40WfvyEsSed8FaQ2Jw=;
        b=MjacDy4TwOV0srnXkZlksZuiPf4FFj2Ng+mlspUsOs/pRfc9mEoDd8NqB27nlphEIR
         sWdKjMPgmTt7By+hfmsRH0wVnNxvImnea9EJMfGmoarQbBMt8eW5uUSKpbjY7Wzke7cn
         ijGOTrkDb+L9buLmmVwXNpxb1gFLLdZBFKmDcUnuIc8C84RqTiWY1CAIAfDCKavOAOok
         wIFk4KffD1+dSOQCGpO8N+DTepbHJK7N+VAOdMRHm0Ezdggl5XYPbLY/7TQl7eUA829l
         UzojkXvy/pk17BgxLgG47dF1XN+mAQtZWRYWVcdogE8ghAjV8IDAAgFvwG9whbhhmbnl
         P2kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aoaE2JNk7pDFmBahG5UX1vgTn40WfvyEsSed8FaQ2Jw=;
        b=odFRvkm0k7jIDWJJl6FsrqDgPTkzgtKKmRdfPh6/Hxcu82RF6pXDKjKJrLqLTMEdpc
         /FTG5a/mybgU0hJW/QUHvEw5p9f0q1AkFzwspeR0up3NVzc8v1hpKElmP1vieMWXLKZ6
         PGAbu0ff7JV/4e27hueGwpV+HJyAsqsxvSpGu8V/R0maw3QGLeQ0/VRs79EiMGcGQH66
         uka/J2eYWeNsK+tpuOvbQHtyLon+exLkkgMnWeixT2sAyARPY/+r6mJlAVXJYn5Qnv2s
         fHbU0/dT8kaoNRarWgZJenIuGtmB1gi8f8vrkofvd+rv8DFtAiuVnJXdmOh7qj/hRqRf
         tGsw==
X-Gm-Message-State: AOAM532HvV25Ly6zxXaM7mCIoLJc0m4MmPCKwPijVB2cYNClUj+y4dzF
	akcl3B7SJ3hmhI1MtbBtfQ3y2ybc9aYnmZ07BB6X+KM8
X-Google-Smtp-Source: ABdhPJwl25Ctm7tC6lL7bAu5zZRNcU27s8Gxcy4c1aaLou7CDXc6v2/t+ZExyPAu3/F9skzLmxkWCmKsGsWYe0n8/TI=
X-Received: by 2002:a25:9c08:0:b0:628:a472:30f4 with SMTP id
 c8-20020a259c08000000b00628a47230f4mr1273088ybo.67.1646219332910; Wed, 02 Mar
 2022 03:08:52 -0800 (PST)
MIME-Version: 1.0
References: <20220301215958.157011-1-richard.henderson@linaro.org>
In-Reply-To: <20220301215958.157011-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 2 Mar 2022 11:08:41 +0000
Message-ID: <CAFEAcA8E49vV9bGxMMXM=NBSCm0R1toUptrvt4=v2rM69u9o7w@mail.gmail.com>
Subject: Re: [PATCH v4 00/18] target/arm: Implement LVA, LPA, LPA2 features
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: tU3qF9+Muezw

On Tue, 1 Mar 2022 at 22:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Changes for v4:
>   * Add cpu property for lpa2.
>   * Disable that property for -machine virt-6.2 and previous.
>
> Changes for v3:
>   * Update emulation.rst.
>   * Split out separate update to ID_AA64MMFR0.
>   * Hack for avocado.
>

I've applied patches 1-16 to target-arm.next now, since they're
all already reviewed. 17 and 18 are still on my list to review
so we should be able to get those in (ie actually enable LPA2)
for this release.

thanks
-- PMM
