Received: by 2002:a0c:e741:0:0:0:0:0 with SMTP id g1csp1904325qvn;
        Fri, 5 Nov 2021 10:09:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLWwnnIxFSb6qzPLBe59BCoXc9QktdJpVUtJouLN10IgtjA7o/27eLJlSVp5xnhEuBke3S
X-Received: by 2002:a05:6808:6c2:: with SMTP id m2mr22656884oih.8.1636132178259;
        Fri, 05 Nov 2021 10:09:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1636132178; cv=none;
        d=google.com; s=arc-20160816;
        b=yqKlICJEyzGkix7JavE9YQL+oOI1voj3jq8rBYhMsioHsmq1jFFKb6ITgNflblMf//
         gE2mEXFfNLmU2VbR2WW/WRaOQY7UCebtMQ6LkF2Ui60pReq6vj5Z79LJlUdFmTiRSK9X
         WfZ5EgMVfXD0VxszckJu62n10FZCXiSqNia7k3q2vyJtPUB2w6O6N4zV13o3/sLDeut0
         w19h3PQU7GYKpsm9cMwrkPi0gZfyLxlMUNwUqpCcbEu9/IXSRv4VGXKLFTyFTuQybMM7
         t/yUg60LPGCmLKixlEI8dPEWZQTV/KlnZU95dScMMUhHVxJbz8ixXyIIyYrpE01G5noU
         uqrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X1Np0AvnZZ5JMeT14wgEEsoZFkTxr8V8yUHNPb4ZyHc=;
        b=mJ7t2Jhn0/XYuusPpJq3gyEL7gYKoBJgjrOu7NlFUR5iTD8DN9Zh6V1uOrKM/iFFlb
         jNuzkJBDAurwyGaAc8pHGFZuVvpQHwKyJeFe73WyOlrTGvnNwATCNvsqZMKulbjNrPRn
         2Ly7FRsOP84H/wZwyoGXW/e99cugOd8HS296dC22rwi/Wpg5ef5obpj9lbzC4jQfoUxt
         OGBBdJp70tLzQgzj6KTywrrMMeWO5lsmzlSeYJUxyWGKIsGLD2k7mkmG9d3aC6XAKfId
         dH4qiGJMNvSM6ldmBPW5uF0ZNwGTwPmj9FAA4GCjzPJ0/XVwaYg7SO/YKHL2VR8EOwhW
         Fh+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oOaENlKv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l23si7511873oie.190.2021.11.05.10.09.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Nov 2021 10:09:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oOaENlKv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mj2if-0005Ck-LD
	for alex.bennee@linaro.org; Fri, 05 Nov 2021 13:09:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mj2gR-00024j-Sn
 for qemu-arm@nongnu.org; Fri, 05 Nov 2021 13:07:19 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:52109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mj2gQ-0007HY-CO
 for qemu-arm@nongnu.org; Fri, 05 Nov 2021 13:07:19 -0400
Received: by mail-wm1-x330.google.com with SMTP id z200so7619276wmc.1
 for <qemu-arm@nongnu.org>; Fri, 05 Nov 2021 10:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X1Np0AvnZZ5JMeT14wgEEsoZFkTxr8V8yUHNPb4ZyHc=;
 b=oOaENlKvIXMb2evWHMim4/aVLAotXdAxgnM4fpY8b4rokQffnxENqsdgyj2S3+vv3T
 LgcyVVXFEZyc9f+nP3Rvw9tORfNUGR2LBQTJ42GMa5ZNv7OUIY8GFf85xX6dQqalEH/p
 PaCFgRZCm/3NwKbvYfYF5Zq3wnZ3f7R3IyZs7B3w3YwvivR473m2XfhPYLmx1LXNQRDk
 m4pOfgIn+KRNkdCG5Klk0Njsws2REL81ppMCMZyhOG1TEGaDuhqJHWF47SkGINRSJW5S
 8BLcQxaEniUpQODpEd5vp1vbDvMM7/kQ8de8QoBF3EyzU8+BNY53TIfn/6RglJ1RVys/
 EG0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X1Np0AvnZZ5JMeT14wgEEsoZFkTxr8V8yUHNPb4ZyHc=;
 b=AtLUKCxDDR768LUWDnRSaOTyiI8of9z2TXOSU4Tq+/uZ3H1C/cUNsuOtOmaSw23zpl
 ir7n1aIeFlDd/TWYPcHgISRWDB777wZnrio8QxuhbzYrv4D1hxE31OjPQaAAMOf/SeXH
 TqZpxS3r3OJMq8q1e1F7zBK5zfTo+Fq12smyLLdQfcICAKxohYsFGqBh1TJNGNmUSWPG
 ERTyzri/9oswjaJiNpbI9eSggf0chkJ3w4lKGxlplU45Kk0/Pp66g9cG6KBGwK54Ezcn
 BDdgOBODsbBxUl1DALIlueuRbF+cK9pHWjkCL6aW9ScGsuU56aQn8MQNEqqiy2XASs74
 e7Fw==
X-Gm-Message-State: AOAM532wSybAvaGmGwNFEeezMaPxoH9g64mgn2wXrIjhJ0dkN8Ij6h/j
 rQRloXYo+zGsI0LVj1vgTTuOoj+452KocRUDfHCoEw==
X-Received: by 2002:a1c:f712:: with SMTP id v18mr32157999wmh.37.1636132035029; 
 Fri, 05 Nov 2021 10:07:15 -0700 (PDT)
MIME-Version: 1.0
References: <20211103040352.373688-1-richard.henderson@linaro.org>
 <20211103040352.373688-6-richard.henderson@linaro.org>
In-Reply-To: <20211103040352.373688-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Nov 2021 17:07:03 +0000
Message-ID: <CAFEAcA-f0t5RW=m1QnjUffrmt4dQUc+5RdW3NS+cp2gUa5a2sQ@mail.gmail.com>
Subject: Re: [PATCH v4 05/10] target/arm: Advance pc for arch single-step
 exception
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NXpyRnM0NebN

On Wed, 3 Nov 2021 at 04:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The size of the code covered by a TranslationBlock cannot be 0;
> this is checked via assert in tb_gen_code.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 1 +
>  1 file changed, 1 insertion(+)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
