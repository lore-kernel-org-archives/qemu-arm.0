Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp2203648ocs;
        Mon, 26 Sep 2022 07:14:45 -0700 (PDT)
X-Received: by 2002:a05:6402:4411:b0:437:b723:72 with SMTP id y17-20020a056402441100b00437b7230072mr23420473eda.38.1664201685705;
        Mon, 26 Sep 2022 07:14:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664201685; cv=none;
        d=google.com; s=arc-20160816;
        b=WwDW0LL5cr1r+Y5Ewf1qLCs50VEGppye9Z79G0jxb9x1VROOE3MCDc24OIylet7tQg
         f2tinu+q+gjGRg4bp81f74nbow78e9hC0CwGPvGaTW0xsbJQlz7Ey8G5sg/3vmaOfWq0
         4h6rFpEZf7aQE9LVD0tEvHx1m2FQCftkp2IRBPNQIfPr2kvWB735QqpXyc08r8sY2k5s
         ESv0tJAGvyGzoo3KSNZmX89JmHt2BFmGnuM99QUptp7+590MJIzUvIzwK7Q2338GYxVC
         c2zGUle13FsGoGy1qdVOfRKYmATMrH3w0f69rtPw3RhVIVwNoXORbPVrbCOSPSzuI8YE
         YBIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ubW4YXp9SL4/T57xOh2xJKBkgv3jkO1ZKYvp+tRSgQ4=;
        b=UR0Q9VVuc6rvfYqy9gy5+NF8UvjlV5zGCxoBm7IznJJycwXWzCuVAIK67BrVl4KEv+
         /wetHReOcK7iiFjEz2B3zDujAw/gcHL5BqPZbfI1ngw61Uo1reVGowzINK1b9Dsho7K4
         jCmxm0a20b0WS02vABCDN7xnHn70PLueHdIXlcGUkfgoYj3Jf+cVfL5IPHz0l9yRl+lb
         dbOk+ZF+G7sKFZM6yZF5MWd9N+gIe3AX23/5MfGMC+Ts/Z/XKM+MPonpcJ4ydF/Uf0bY
         Q+HGaWxNCTKl5BcYJNUE5L263+Di/qywai4fJXW4VBa4m/QzyzOrt7afjyLriqrPwMjJ
         yL2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BXjtWXRe;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a24-20020a50c318000000b00456c9fd948asor4009533edb.40.2022.09.26.07.14.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 26 Sep 2022 07:14:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BXjtWXRe;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=ubW4YXp9SL4/T57xOh2xJKBkgv3jkO1ZKYvp+tRSgQ4=;
        b=BXjtWXRerqhAc4MTZNE39VddzMyW5HFBaWj90x23ErogeD4CjnQPxdj1lLgUco4I3I
         +M/WmUBDDEVmiMlS52QkRCMyS589hyR2luJVNptE0ZJ7H1s60ZUSxNV1gy0vCEgwIA0Z
         PTrbyHXFOwzfRvIrJtS87QoZKvYLnqe2aLVpynN6nlWbVeS8pSNW2mPV7fCf72nX9U/T
         telSszVnognB+WyCUykI4dfnjJt5DAZ2VBdeMa5yKipU3CIemfuZOXwkIeLaiq1/J9py
         0X2g+iU2+JJX7oOg23YaxWVFAxDwii6CQpIDeqVK+rTqTD2ahaNZ6PQ0l7vu2I4AzDXj
         N/wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ubW4YXp9SL4/T57xOh2xJKBkgv3jkO1ZKYvp+tRSgQ4=;
        b=THD0tjEguZoqKn75wV1x6lgTqHD2gnbJYAjcbsxeA1CvETa3b55eZlITE0+TL9QleA
         VcA1jwqfA7M0WiXPMIP4IvTXRcIwp9vMTnhUeFmj780kXhVQC8rrI0kEQPSjgghkW1Rd
         cB5SjCeoT2bmLNZC/hVJVKNBq+WQb87uZJp4Nraxtk3vxukPudaB93x6vVyob8JWEpI3
         ck0bZBn2DQ8LFRoWPDVSmnbTgirz+wC8lHLDBuvLMQT6++tzLjPSyiXXqk8mma8YRdNK
         FCBmCUbraRlBkRNd1Tt9Y78bjq2KtU0exTIo99qXh72ZlL4lgdcJK1L2qbFKlCwo6qan
         6gAA==
X-Gm-Message-State: ACrzQf0EuFdLjhl+c3RflRjSgAPfhyn5mU/XogZRGzFX62NJYCBwtHz7
	CvQzFWYVxlDYs8+0GQrL3e5a2eNvHCO+DhPwAPqn3Pi3LHsnmg==
X-Google-Smtp-Source: AMsMyM6u1yQ8WNcU6NYv5kqiUuAZd22EpRqpBF2eh33fjdj5ajRAcXm+Q+xiLki8WjmP/yxFMpZ0Msu1VEhsP3uQ4RE=
X-Received: by 2002:a05:6402:35c5:b0:450:4b7d:9c49 with SMTP id
 z5-20020a05640235c500b004504b7d9c49mr22741440edc.149.1664201685305; Mon, 26
 Sep 2022 07:14:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220926133904.3297263-1-alex.bennee@linaro.org> <20220926133904.3297263-6-alex.bennee@linaro.org>
In-Reply-To: <20220926133904.3297263-6-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Sep 2022 15:14:34 +0100
Message-ID: <CAFEAcA_u8TQW5EoX5bBZGKhhaS6PYaYZGyqMrhB1Tsa6eTXCyQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/11] hw/intc/gic: use MxTxAttrs to divine accessing CPU
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, f4bug@amsat.org, mads@ynddal.dk, 
	qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: SXgITq4SNR6z

On Mon, 26 Sept 2022 at 14:39, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>
> Now that MxTxAttrs encodes a CPU we should use that to figure it out.
> This solves edge cases like accessing via gdbstub or qtest.
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/124
>
> ---
> v2
>   - update for new field
>   - bool asserts
> ---
>  hw/intc/arm_gic.c | 39 ++++++++++++++++++++++-----------------
>  1 file changed, 22 insertions(+), 17 deletions(-)
>
> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> index 492b2421ab..d907df3884 100644
> --- a/hw/intc/arm_gic.c
> +++ b/hw/intc/arm_gic.c
> @@ -56,17 +56,22 @@ static const uint8_t gic_id_gicv2[] =3D {
>      0x04, 0x00, 0x00, 0x00, 0x90, 0xb4, 0x2b, 0x00, 0x0d, 0xf0, 0x05, 0x=
b1
>  };
>
> -static inline int gic_get_current_cpu(GICState *s)
> +static inline int gic_get_current_cpu(GICState *s, MemTxAttrs attrs)
>  {
> -    if (!qtest_enabled() && s->num_cpu > 1) {
> -        return current_cpu->cpu_index;
> -    }
> -    return 0;
> +    /*
> +     * Something other than a CPU accessing the GIC would be a bug as
> +     * would a CPU index higher than the GICState expects to be
> +     * handling
> +     */
> +    g_assert(attrs.requester_type =3D=3D MEMTXATTRS_CPU);
> +    g_assert(attrs.requester_id < s->num_cpu);

Would it be a QEMU bug, or a guest code bug ? If it's possible
for the guest to mis-program a DMA controller to do a read that
goes through this function, we shouldn't assert. (Whether that
can happen will depend on how the board/SoC code puts together
the MemoryRegion hierarchy, I think.)

thanks
-- PMM
