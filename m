Received: by 2002:a17:906:4f0b:b0:a47:c39e:cbe with SMTP id t11csp286456eju;
        Thu, 4 Apr 2024 07:14:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXo9P0hcyYDI8WOwHjZ7q+0DiyyUgD1Jo6JcO2FxxhJ8tLcnl2Mq8gJOJ2bepXuO5cauXXItn4cc0K1OJCrB98JY5FKALe7
X-Google-Smtp-Source: AGHT+IGpe9CaAnFCkjM1/WRfoUmRULLIWzSxtxzab/79EDKHxSg9jd1DfsaJS8LoAPxCjJIDCcNi
X-Received: by 2002:a05:622a:cf:b0:434:4848:bc6 with SMTP id p15-20020a05622a00cf00b0043448480bc6mr2553130qtw.30.1712240080815;
        Thu, 04 Apr 2024 07:14:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712240080; cv=none;
        d=google.com; s=arc-20160816;
        b=ht8ZXTaLxZh3ANLluizv/s9Lugd0lAxX2+OIwlTtlEPkl6Qjh2Wdy+kpYWZHhyqg7I
         x7PCGLm4OK6wzSYSE3GYGdGOZg25keoX80SAXF2WLrsOJhfDsVI3hvokogfNrAHn9cgR
         Am7bATG/kXGVA9pRbFbEudEdwVS+/NkT10aTuYexAmA56re86NdIw8tCdtbreUNPXzqX
         ZZ0qD0MQXPmGQHCHBxjOGraNivjjQPK5oR7NdmQXNlH2AfnRH7dmQ2dS55e7vBPAUR1z
         Eeuc9KjYfS6C4lSfs4ASrCUMeGlJMnYNquxgmlQYyxGocuPfAuHYKwlv7POgfSgoreJc
         IGjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=0z4FnaPcsOBQ+YX4GKSd1KH+I7KTyoZry6IxOeoJ6Wo=;
        fh=n/JHYNSl/1HuKsMyrlRhm4EDxXs3COKE1JNul/xoa+A=;
        b=xVu/Fe9Pgw2tO72gpOiQhANue//JhOXZsvScaW610YbXD6/U9CNa7NWmNXlA8w3DsB
         hpcrxSMTg3V9QjxLMH9pmEuhXhPJ4VguYID37zSWmVsKFfuUMrrRYHUrd2oSVP2xW8Km
         mapkmfugSXTVwM5mZu/tuYVcIQAY+r0vC9K3eTVWRorr8YObdudG4I2vl4v3j0p0D1K+
         ixLl8bsUMwwDdSIxuBuMIZrO/qKV0XA9n2ZyMhgsOjey/sJSEE8JsHKJfTYVevpAG5lx
         0RAQ2s/8AEzOUusH/A1Y41Z8SzvdXKZ4nJ3aWsAjXQ7VnxIzEeeoZB7lKxzkuDzpxpL2
         9C0g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aHAbDuwm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e9-20020ac85dc9000000b004313887acefsi17146298qtx.227.2024.04.04.07.14.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Apr 2024 07:14:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aHAbDuwm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rsNrH-0003Sn-UR; Thu, 04 Apr 2024 10:14:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rsNrF-0003RE-8P
 for qemu-arm@nongnu.org; Thu, 04 Apr 2024 10:14:25 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rsNrD-0007rv-PC
 for qemu-arm@nongnu.org; Thu, 04 Apr 2024 10:14:25 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-56e0e1d162bso1016117a12.1
 for <qemu-arm@nongnu.org>; Thu, 04 Apr 2024 07:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712240062; x=1712844862; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0z4FnaPcsOBQ+YX4GKSd1KH+I7KTyoZry6IxOeoJ6Wo=;
 b=aHAbDuwmjm/1rCXnbR+SQTCG8nAlNGEUy7+9MRmDCRn9NzdMOSEZ8m1bAksnGSDQwK
 M58qa1v3s3yfh9FXg61AU0iBAi60ORDcEj2Gc6s/NqpOmaFg4N+Jm41dAtz0aXa33yzs
 ANKhfVrlWqgK9I5CUseBYfVElkG60poVdxCdebdx5SjtXf7gBJyM374kRaPTzP1hyIsE
 MWQaeNf617rFTHR8ycNTfYz4rfxUJikB7E2A5H2jV6ht9596Bm2/98RmA2YW6FcdzK9d
 rWiBuy8Bfk263H2uOS3/XFOnysdGroEYS60yevwuuyXTnOUnTOTXcT7AbfnbP5PyNnwu
 Le6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712240062; x=1712844862;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0z4FnaPcsOBQ+YX4GKSd1KH+I7KTyoZry6IxOeoJ6Wo=;
 b=oX6WPTuipj77HmlSIRFL53vQwXtr2vt1WgOWpDgJQ3IVXAImmaWW69pParDrFmTr19
 mi8mroC2jPvgxDJqIbUCkojUZ8Mwrd6dNz/K7SiLINIGSgBw6faIW/gRExM4iz0ZKCYu
 I9JkC8tGUys4Bd3HGUKBsR+4nuCfPHO5/MVVcbKi8ovDnZJbLzl4PTaKcX4N+TZ3cIjS
 woEUS/XqpK9M4hSOoWr241qMqK7tQyBojQaQSmlPscMVqP1/nuOgxOOlTvnphQ/Y2n+/
 y30OvTeQdhlXrnymcE4QFRAPkzXkPu5JbEMEmOCh++bkYPbqyvU4h6tbJyz1mhlj/7fQ
 71AQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4RKDZYJC4tF21vLxFsIuiVS0tJ5yQ7ikOUJh3/bHdX3yHJdC9PQizE+H5myRnZQXTc17EY/m0zN23F1ApGoIdiTe6
X-Gm-Message-State: AOJu0YzmAcEhbqtjsIZBcKFVgPHjJS61VYka1ZQcOJVpEw09zkEb8vLw
 AP7gf1B/JGEcCvggOJPcBJVTKsPzXIkM+Hf1Qo74eyXr2lYQUth3bD92VM2EB61LFNJw6ybFWER
 JiZdhAmYQR+k5DCFO9F7a3BMWqojH5PKitv18+w==
X-Received: by 2002:a50:cc95:0:b0:568:b3bf:409c with SMTP id
 q21-20020a50cc95000000b00568b3bf409cmr1817688edi.16.1712240062280; Thu, 04
 Apr 2024 07:14:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240403101611.3204086-1-ruanjinjie@huawei.com>
 <20240403101611.3204086-7-ruanjinjie@huawei.com>
In-Reply-To: <20240403101611.3204086-7-ruanjinjie@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Apr 2024 15:14:11 +0100
Message-ID: <CAFEAcA8GJE9WGT=zzrK6y3DRz9zXPxoPELtbqA0djPSYQD3jig@mail.gmail.com>
Subject: Re: [PATCH v12 06/23] target/arm: Add support for Non-maskable
 Interrupt
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org, 
 wangyanan55@huawei.com, richard.henderson@linaro.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
X-TUID: 9YuVtwU61SCT

On Wed, 3 Apr 2024 at 11:17, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>
> This only implements the external delivery method via the GICv3.
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
