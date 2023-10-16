Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp3301195ejc;
        Mon, 16 Oct 2023 09:24:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvwWBEYyFL0CVTdhbPKjljARKw2n1W32YDBGvagUoNolw8S7Q8VopMLN9Lcf5g62cktNn4
X-Received: by 2002:a0c:ec87:0:b0:656:48e3:7afe with SMTP id u7-20020a0cec87000000b0065648e37afemr9963295qvo.17.1697473472800;
        Mon, 16 Oct 2023 09:24:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697473472; cv=none;
        d=google.com; s=arc-20160816;
        b=daGPk/v+1Y5T23WrhRtddRN5/zDQpBQrsyGy/90vmz5N8krID5VEOl6baoPQTCj3r9
         32g+eAldsprJQ5TjNF5l0AFDTMi6qmQC2L/nuwpvJjG8qAtPl9qZSqftm3ho34c652N1
         qOc4IcSnTTceizwj41o/NdJ7hlASmnELqibqMl2z28/rKVsP8R5fGfBbRnTMZ5/82p0C
         1O5GZyv7Q8vyiNRU63ck01yLjcmsgNGLR6Ep4FGU0lheG57slh5IVU52op0HpCquEZ8m
         AhkgiLWMQ5nT82+I2dEfk8mNXGNJ4+ul5MXY8SxrQFXV91i2zokVDKgi6foLO0ZJSJB5
         xOPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=/akte+CiF8NMtj2PiHVWNfP6urFYlEiWvzXYLM8C7GE=;
        fh=p2zrkdDRRyDtauDkie/mO73MG/qvwTv5clb9/BXHLi4=;
        b=BRXeSQ99y6kjfZEldvwmbD8lYyAxUifXWwPhQADR046IhmToJwBWVQKZbX4izec5an
         r/6YLXFboPvQBYp94m+tuWDm7XjfqTgpNgSx4dLOGNuFJwRysS5k8Fq2BbTakIKVWyB0
         +L9LiipTTHb7qjeBfWC/1K+zWVDCEjFM24qZp+ZhSGKAZ8rVikwvEuP3bWOmYgvNgt9n
         EgrEJaPTNVaxOli2/Xg3kkn3GZDtFloou5H7UhgYfezDB8yTdi+GPu/wX19FOiWWJj7m
         SGHtLC6brkhOCSdNBH4w5rois0KC8Zf3LunW4V1B8fREUNY/PnKPKOcChgsZl89dwVDK
         iVrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rVNhdE93;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y9-20020a37e309000000b00775cab41f33si5322168qki.552.2023.10.16.09.24.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Oct 2023 09:24:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rVNhdE93;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qsQO2-0008LR-7Z; Mon, 16 Oct 2023 12:24:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qsQO0-0008Ks-RA
 for qemu-arm@nongnu.org; Mon, 16 Oct 2023 12:24:08 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qsQNy-00085Q-Om
 for qemu-arm@nongnu.org; Mon, 16 Oct 2023 12:24:08 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5384975e34cso8479004a12.0
 for <qemu-arm@nongnu.org>; Mon, 16 Oct 2023 09:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697473445; x=1698078245; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/akte+CiF8NMtj2PiHVWNfP6urFYlEiWvzXYLM8C7GE=;
 b=rVNhdE93NSbhtTIJRS06gbq2lwTgHK1rPu9dWcloHXm0s/SYP2NZoQDgwAuB05vX/T
 HGcMBT4TqgNittGzuy6pg0XplDplP5tTX93rlbyu9kDFiqHq7skjBR8KQFFInJ6ARR1p
 RhKZKkoHryScYjsQGFKPDnaN/4BmHmh68OnHjdbG1ltDCew0yNp4TCHQ58PFXHGXv8Uk
 SsKLT/UCTIO7cDnoRU75fewyZESI1zCbccmD6XNrO7f4RZWdErOnpxTEm2Nay/oBu8SN
 9gVjBB7H34OAQR4NMhRgyad5WuUwitthODoL+xGeQ517VioYXQSUOE9ceEHa2ahcT9R+
 vaXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697473445; x=1698078245;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/akte+CiF8NMtj2PiHVWNfP6urFYlEiWvzXYLM8C7GE=;
 b=uqZhoJ3OE3vVCkpMv6uoCGg8iqavOP03nVzliaYST50vzVJv9kr01IgzvtP6kUgdH2
 wAEONdRpcfHgibF8OzfndU/uL0TZ2ecfMf9/sqLpoSi4Ppt0NHoWr+DFlyMh1V10pw8t
 GVgAv6M348jzcmYnPmOPx6jW7JaoRU1eh8LahKJKMLh2U2Pks5hFWc75VxctbdPHhTyF
 vLFjm2hr2WPoG5AIYK+xDF/6KMgGY1+GE0DP5K6duh8ZqRv/xuZzdQRnL7G+zGKdU+zW
 oW76r7ydyBEKuspGRqDIkwDrVQTaEC1ey1R7KpkigtA9Rfehsr/JD3vZcW3stWNx3tno
 5OsQ==
X-Gm-Message-State: AOJu0YzZhtpx3wnUwiz1tdlAmcZuHkm0IL7cTEhrb+13XjVE2mXkTM5D
 wVzhKcFPHhp1f+aTt0zjX5SrVuhy2ZLITUiyMeg3q2EDSDVzU53V
X-Received: by 2002:a05:6402:3985:b0:53d:bc68:633a with SMTP id
 fk5-20020a056402398500b0053dbc68633amr16847844edb.5.1697473445111; Mon, 16
 Oct 2023 09:24:05 -0700 (PDT)
MIME-Version: 1.0
References: <20231012085710.880440-1-mironov@fintech.ru>
In-Reply-To: <20231012085710.880440-1-mironov@fintech.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Oct 2023 17:23:54 +0100
Message-ID: <CAFEAcA_jD+yQq8fJBY0YUobWMgadrjEPwQs1W10DtZ80Pb2ROw@mail.gmail.com>
Subject: Re: [PATCH 1/1] target/arm: Adding a check for the result of calling
 the CPU information check function
To: Sergey Mironov <mironov@fintech.ru>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
X-TUID: d91mZFEcZ1br

On Thu, 12 Oct 2023 at 09:57, Sergey Mironov <mironov@fintech.ru> wrote:
>
> 6 out of 7 calls to get_arm_cp_reginfo() are checked

This sounds like it's talking about a Coverity warning, though
it doesn't say so. Is that the motivation here ? If so,
it would be good to say so in the commit message. If not,
the commit message should explain why we're making the change.

That particular Coverity warning is quite prone to false
positives, since it's only a heuristic. Sometimes it's
useful to add an assert(), if it helps both Coverity and
human readers, but not always.

assert()s are also most useful if there's a comment that explains
why we can assume the thing they're assuming, as Alex suggests.

> Signed-off-by: Sergey Mironov <mironov@fintech.ru>
> ---
>  target/arm/helper.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 74fbb6e1d7..cffbbaf571 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -198,6 +198,7 @@ static void add_cpreg_to_list(gpointer key, gpointer opaque)
>      uint32_t regidx = (uintptr_t)key;
>      const ARMCPRegInfo *ri = get_arm_cp_reginfo(cpu->cp_regs, regidx);
>
> +    assert(ri != NULL);

>      if (!(ri->type & (ARM_CP_NO_RAW | ARM_CP_ALIAS))) {
>          cpu->cpreg_indexes[cpu->cpreg_array_len] = cpreg_to_kvm_id(regidx);
>          /* The value array need not be initialized at this point */
> --
> 2.31.1

thanks
-- PMM
