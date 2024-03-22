Received: by 2002:a17:906:bc5a:b0:a46:bbde:2c08 with SMTP id s26csp1378505ejv;
        Fri, 22 Mar 2024 11:51:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV5q5lfMNOYHOt9EkBPxPW4sLLJO6UntwNLiLB7IveeySvVtC1QmbnIYmQXYONJCfxL+O4EIUvEoGzS6V7fmB5ocSfV6L1b
X-Google-Smtp-Source: AGHT+IHgo0AvfTpeJ0jvKmK8tuzUYc28hGz4qQzwAIgPcs7qCnzsuZer05sLZqTektupe0Xt7zIG
X-Received: by 2002:a05:620a:8326:b0:789:f14b:19c9 with SMTP id pa38-20020a05620a832600b00789f14b19c9mr287014qkn.70.1711133506664;
        Fri, 22 Mar 2024 11:51:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711133506; cv=none;
        d=google.com; s=arc-20160816;
        b=L5Nl2S0EWxgR4apPpfPSHyZU1gSDGHeg+3jzRQRO7K/cvlJLqAt4vr/fIkghlnzvHV
         m6XtsQRvtlwlvZFSpVrAxdOuuzfbu3URMEqy0dzmk82C/hLnenj1AeFqGsn1BfJHFRBO
         rtDzzFzvQpe/9QCWLrX+mjpjAQ/w1Dj9EgVLSFyWHpp13+sO8nVjjGXIgbRefI2KJQwa
         ZUrLmC1TLMoo5vW5O0iK2LxZzeKPKX2Zmjeityh+wzQ7yszAU4qGApfw5x/sVndXHI1p
         6a0uOovzrJRe1sAIwip5mkQtmFub1lSgvxYxPp3r25FvTFjzpF+YmXoYCxZ76Fq76K2J
         e3Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=5DQETAIf3hyQQrRzWpZBKS8ulJFDYqHzLUM8L2zZaM4=;
        fh=gbil3buL8BUKVRVyhq9n25cziptxGVjB9LQCqcowcx0=;
        b=p1W+xlVkrSn+tf85h/jAovCMcFAZ5f4BWgu5fZXPUzrPt+cOzolS7P5wAUH82bbqsL
         gIdV+6TseCsmeeWVms58QBQBcsqitDVM5JvASPSt0LwbkXjVuUd1daA4LmFBsyDntZ8j
         GrlC/LazY3cg9volCcJtzoT1wXvvIA/+eJPB22peNFW6ZgYQoA3Egwr0l8mU6TGvTy4m
         WmDqsRyXUBLd3DFymIoLXP6uuhYawmbWikG9pwiYWvP8mjzSswRdJfrAfshRiJQZveYS
         YiUSkq1RUiCLb8tICZDRtQyBxEAWt2Hqgo92Jsl48Ja3HQ6lWuis7oudqsLUSukB3fAi
         TFOg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tiyyLEYq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p18-20020a05620a22f200b0078835b8a92fsi182177qki.90.2024.03.22.11.51.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Mar 2024 11:51:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tiyyLEYq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rnjzP-0001kE-0y; Fri, 22 Mar 2024 14:51:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rnjzN-0001k2-Dv
 for qemu-arm@nongnu.org; Fri, 22 Mar 2024 14:51:37 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rnjzF-0000sQ-7k
 for qemu-arm@nongnu.org; Fri, 22 Mar 2024 14:51:33 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-56be0860060so1347298a12.1
 for <qemu-arm@nongnu.org>; Fri, 22 Mar 2024 11:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711133487; x=1711738287; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5DQETAIf3hyQQrRzWpZBKS8ulJFDYqHzLUM8L2zZaM4=;
 b=tiyyLEYq0hP4828aH9ud2qqWJbY873S+SmbmOOqRfBRiwSEJ6OP6i4njIccd4uL8oE
 YJ+FATX/aL/pM/BnvoZLliN+3otQhOqtl5Amq7Fz0i6sxCtj9asxPQuhQPjttOGvYhxo
 vSi45UyKOHZeI50fZzn1SfL7zm1dmG10S7w3X2r/FLAy9bn/j725myiOSj44oX3rgH4m
 2liBIDQlaL3FaHnTIPtj22rnqwarQxyOzRkLbsQxSp+ytWPi2Q8TF6Rf7rD/YsLjwD1C
 rZtsgAKwa7SbFYXEHUVbRKgWDtHAZOjawSkB71+1vEiM2FT/PLzgbsINctuB7AYz5lU5
 TZAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711133487; x=1711738287;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5DQETAIf3hyQQrRzWpZBKS8ulJFDYqHzLUM8L2zZaM4=;
 b=hQnqlhEtncgoUb3ilzVhR1fkhJ8OGPfCC47mWM2yka26C731+nrARsF3Fe/mxOLeMT
 MS9mjgBd522/1reLX2gZM01jB3nr7+Pn+mb0dxY1dXLn5GI/3GKGQPyvunjLmAskmne1
 YTz7Fl5Dqa1uSjgHV61PK9EhpNbujvCoCi5PKBZfv9wE422IkpJDXEY9doDRRx1UA4Sl
 m8pNUt63dB1Mvme28LOy+scqu49EzvmduLiyZLMF7qHPYYBgtYvA1E2vaF0Jc7m0E3HP
 6anYIxhFln0J1PVxd5A+rYCLjp2wtI6IK033j11GSwXeEtRJMiDppELLe/4M5i2Q+Vt4
 A5WA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUb93MfaRnCdgn90zg+h+1ze6xCCg82xihNIIaasER0XEhZnxauviW+/0plX52GNGVDG93C1fEWCWY03CwLrRWG3kk
X-Gm-Message-State: AOJu0YywVSWdfVb7rC9RAZeo+1e28oGOqJyB5AJVhVmYZiKNPdzeFMvU
 tkqvWFbfG8dZMSWp3OYKLdpB49Rt8h2LYrv1zjyJTa+yh0SuFF35k2UKk4RAX/4ChkxdEYATZlb
 /BI8xx2qNnwA9MDXQL2vEFNhIffHXr7oR4Ti3sA==
X-Received: by 2002:a50:bae2:0:b0:568:9fc9:ec72 with SMTP id
 x89-20020a50bae2000000b005689fc9ec72mr266167ede.35.1711133486977; Fri, 22 Mar
 2024 11:51:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240312083049.3412522-1-xiongyining1480@phytium.com.cn>
In-Reply-To: <20240312083049.3412522-1-xiongyining1480@phytium.com.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Mar 2024 18:51:15 +0000
Message-ID: <CAFEAcA8sQnBzFq3b_WscYY1o+J2CutFrEcTGHXvbi8YVn6vorg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] ARM Sbsa-ref: Enable CPU cluster topology
To: Xiong Yining <xiongyining1480@phytium.com.cn>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, rad@semihalf.com, 
 quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org, 
 chenbaozi@phytium.com.cn
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
X-TUID: 2eFbsCRzRHLv

On Tue, 12 Mar 2024 at 08:32, Xiong Yining
<xiongyining1480@phytium.com.cn> wrote:
>
> Enable CPU cluster support on SbsaQemu platform, so that users can
> specify a 4-level CPU hierarchy sockets/clusters/cores/threads. And this
> topology can be passed to the firmware through DT cpu-map.
>
> Changes in v2:
> - put this code before sbsa_fdt_add_gic_node().
>
> xiongyining1480 (2):
>   hw/arm/sbsa-ref:Enable CPU cluster on ARM sbsa machine
>   hw/arm/sbsa-ref: Add cpu-map to device tree

Thanks for these patches. I think we should squash the two
patches together into one, because the first patch is only
a single line, and also because we shouldn't say that the
machine supports cluster topology until it actually does
by putting the information into the device tree.

There's no rush, because we're  now in softfreeze for 9.0, so these
will have to wait until 9.0 is released (in about a month's time).

I'm also a bit confused by the Reviewed-by: tag from Marcin on patch 2,
because I can't see that in my mail archives of the discussion on version
1 of this patchset, only a Tested-by. Marcin, are you OK with these patches?

Also, is this change to the DTB something that would require an
increase in the sbsa-ref platform version number, or not?
Should we adjust the documentation in docs/system/arm/sbsa.rst to
mention that the DTB might have cluster topology information?

thanks
-- PMM
