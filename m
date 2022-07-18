Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp1252411lfp;
        Mon, 18 Jul 2022 04:43:36 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tkU9Om/u+jlEC+EfEp56HS75ZA96ADlF4E+2CHPZpHJxR80nSJBy7JPN+Y7YSwyYMuz33i
X-Received: by 2002:ad4:5de9:0:b0:473:347e:d30b with SMTP id jn9-20020ad45de9000000b00473347ed30bmr20357822qvb.79.1658144616678;
        Mon, 18 Jul 2022 04:43:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658144616; cv=none;
        d=google.com; s=arc-20160816;
        b=eGeLLynzF7uMN1L/CmOfmSayMLejcI4gk7HxjajNkJkSmX/Bbs1yTXI1gVwrYZfoCV
         d209RL1h4O9QgS4iispmXYxdeW1NUoalG7OaJORrEq5FVhT1qSx88qsgkovoQKO3m2Lj
         JdwgaIKrtUKcR2ldKcMNjJuKVUTd4zJMB6bg0qtuJ/LDXPup/ow4e9by+2tM1bfcbDQ4
         6Rn6pAvEuSLxGtn/QC9V+HBwt6m7+mEfZYto3C4v2r4N0Z+9govJbhsAiEnWCTk0izG3
         Lv0UsiqWC+VspDHzQ+ey0JIDdZ/oL8a52zHgQS3Ll2RzOqscVVeDh4orJSWbciFZx90n
         zIkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=WoldH7qPBX/tCpCzWPmMhnJi44dF0bCbVICIRiNJS9A=;
        b=WEngamUMqHBTGUAlHd1wI/e5WmnkL7QfIxUu2/At0KQjc9a0fk15RWccaVV+E3e7da
         PEL5uQ2VNGzZjAbERKi4dBc12jj4o39m2737KHq0q6dI32qNn++CaMsv9oUTqmRlXiSc
         ESeCdZqj34+rZqxhGK4wXkfKBkwhj5pjxiaxtqfZS2eSIN6U3zAqXQH0V5lYt4SSTyMW
         jsZcUhqyaGmyuSCRttLe9CdVgtc76N9BXpkqnMPihGi/WqUN8ZHfM0dqh62nu3wr2CyR
         xhGKal8KXBxmzJVJfCIClhWmAaQPCtXm/n8GT2Gk+dCNHeIvVS3pXqCnFNMzTCiRFUgL
         LqXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=znSRYzgY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g12-20020ac87f4c000000b0031eedd27b45si1432765qtk.21.2022.07.18.04.43.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Jul 2022 04:43:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=znSRYzgY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oDPA0-0001dT-5r
	for alex.bennee@linaro.org; Mon, 18 Jul 2022 07:43:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDP7a-0007lD-AS
 for qemu-arm@nongnu.org; Mon, 18 Jul 2022 07:41:06 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a]:44619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDP7Y-0003uv-Ab
 for qemu-arm@nongnu.org; Mon, 18 Jul 2022 07:41:05 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-31d7db3e6e5so103430967b3.11
 for <qemu-arm@nongnu.org>; Mon, 18 Jul 2022 04:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WoldH7qPBX/tCpCzWPmMhnJi44dF0bCbVICIRiNJS9A=;
 b=znSRYzgYAF7AymlDLPfvGpxTfx9881DR4vivHwfbX6ldBDNAmBw91ExJBcYtqr19h2
 d89twRfS3H1a+67U2XzvQLoQBkP4DCd7mHHmTd7pBUNNTXj3wb0GcEMLIClYEXjIwLy0
 2G373G/1wpOfjPph/UKbkWDEXOrJmkvU1x0hiYOBz2jIfGAaFijXjURXQbwW1mYStbKf
 oTOI5ccFhmHqAnK3BWUh9B6w+X/gV7C7Owsm+hviohSDaiLZc5P+X1B0WVCeoirQfunI
 o/SxnMWlpRm7FySLdDsK3NiEkmyR4FwBaHQEzJr/dAZaITL65BTH8Uktj/nnXNUJLEcT
 V5yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WoldH7qPBX/tCpCzWPmMhnJi44dF0bCbVICIRiNJS9A=;
 b=xNYTL1GVdNZSPA/D5bo7egbRNcHCci81Hv/OIJygJybwRwV2vTPL0GifSlOgU5UaNc
 HHXPymmqGBmVZbVNC3gaLLoSnzCPPrWrpXZHBXy+bJo1jn7Z53hD5dQXQjCPNsJ9to7R
 vt7FjsLZQehRx20vvcfhhyi6Dfmn4hqTW829p00Pg+KEa+IOgAyAaAR2/T/Qk+NFLmxx
 hN1gWtU+iPc1x40S9id7XnWb+4Yy+2oYNDJVD4UVfYqObvYKfJ3jq2AAAtmB42vnN2rr
 5+WOpZ7SwB63HXF5CHxEi/A73cEcekrpaNFCC6ozYpQ5OvLtkjfMMP/tnPQVBdC7iM8z
 N3MQ==
X-Gm-Message-State: AJIora9t7O7eWiXtiTCHPBm0VmbCHn4UzbKImPgc+wIfW++aAPt6vob1
 NUM90Nn3JuSrisRrvXwqLd7hOz2XGKcmPjZAD6tUjQFCcsM=
X-Received: by 2002:a81:a247:0:b0:31d:72da:e931 with SMTP id
 z7-20020a81a247000000b0031d72dae931mr29762027ywg.469.1658144463201; Mon, 18
 Jul 2022 04:41:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220708154700.18682-1-richard.henderson@linaro.org>
 <20220708154700.18682-21-richard.henderson@linaro.org>
In-Reply-To: <20220708154700.18682-21-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Jul 2022 12:40:52 +0100
Message-ID: <CAFEAcA_EquVC8PWCSDbH_WMX7vKXu0MKpoh+7dv+D2=RTYcTfg@mail.gmail.com>
Subject: Re: [RISU PATCH v4 20/29] aarch64: Reorg sve reginfo to save space
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rHrbCcs3IFEU

On Fri, 8 Jul 2022 at 17:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Mirror the signal frame by storing all of the registers
> as a lump.  Use the signal macros to pull out the values.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  risu_reginfo_aarch64.h |  45 ++++++-----
>  risu_reginfo_aarch64.c | 171 ++++++++++++++++++++---------------------
>  2 files changed, 108 insertions(+), 108 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
