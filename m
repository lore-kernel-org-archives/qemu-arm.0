Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp1079122ejb;
        Thu, 23 May 2024 07:00:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVrSrx6V1Mg+itiVoE2YT0Xvjz+7hJ8WNJrp33Vovvc5Ak/Bwn3kH7qLqcLAjhxU7YmSFku2WDahdN1HGZXUEVhN76zRkzg
X-Google-Smtp-Source: AGHT+IHKaGHyIMcJMnsCIUF3LhtFVNLZ4RqD4HzIHkw+D12pjiqn0mkwkSSjvuDMK7c18KgccErG
X-Received: by 2002:a05:6358:5118:b0:192:b251:aba9 with SMTP id e5c5f4694b2df-19791ddd71emr459926355d.22.1716472806011;
        Thu, 23 May 2024 07:00:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716472805; cv=none;
        d=google.com; s=arc-20160816;
        b=iVd4k5VvXQkbGBieUPuhhid2i0ncweeBf6DTgF7CjH+kTYZfdox3MRA+cW+6AJQ/Ai
         kGKkuXc113PDUFT4UkzVbz/0x96POdT0ib8kafF5sl7rwdIclCs+0KB9cNtm3XUSpBTH
         8Yu0U9mwTihnVyJpc1DWN5CDj1bOh3EZ2KMhQBSR8G60aFl8brewFNEk7UPGa/uuHIwd
         MLO6gIbggHE+98A128PQWmjagb8WQ3nc8K9AkLhxCJONq4dXjYEpWyVOtpfMWBEEDWID
         RWg48ShYvnJd8vUnY9iUrKsqqRyB0GMIRDhHwjGzcVLe+rSX2tcWdzgiNXcbKK8HrKdu
         nvig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=b2mr7lVbeO+bj308APhWygOcy2XRVk5IKWekmqrcKgs=;
        fh=zzwMbJnv+ngLRS5w2QpsgtKVHuHtKzTRDk3OZs7T6cg=;
        b=xZ2FIlve0zlENx25gSgVxAxVwX0pD45I2lYoI/Isoi9yN2/7g38eCfdHI9YbDwdQeS
         DC3mFVONhJ/JAXLKQV9M86hUWN5FrvGpbImFWsNTPqQ1h2tQdqHRcBppQ3ti9IVo71/W
         jRxzt6s4EuQeMyLQmSj7RpfsORC+P/J66K20rVJoQtRTazQ0E1TJ+GuENdzyOa2rq1y/
         8h3CH2/qyg8Ql7X4DXL7jRxpCiUxMAKLRDugy0j1SoVQZ9wV7g9ojN/6nluq8Jj+55Vh
         r8nFUmR37ViNyfm1zIoeK1XBsUZBU5vk/yT3Lgt31xtonScoe+cPk4nKWHWppSXcLz/M
         /peg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ugv0DaYJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ab14626031si104798396d6.442.2024.05.23.07.00.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2024 07:00:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ugv0DaYJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sA8z9-00056T-2t; Thu, 23 May 2024 09:59:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sA8z5-00055l-95
 for qemu-arm@nongnu.org; Thu, 23 May 2024 09:59:55 -0400
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sA8z0-0000Pk-6E
 for qemu-arm@nongnu.org; Thu, 23 May 2024 09:59:53 -0400
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2e72b8931caso51238871fa.0
 for <qemu-arm@nongnu.org>; Thu, 23 May 2024 06:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716472788; x=1717077588; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=b2mr7lVbeO+bj308APhWygOcy2XRVk5IKWekmqrcKgs=;
 b=Ugv0DaYJK8kU1AFZ4diJJnXB4YqxdihKYplqmT209nKgumbdM41R4cwP1C+dOZdcvf
 ivl0BYC6zxwTapN13GuBVMaB2Ev2tBuSj6P22aI98hiEiQtEC6kyUyKc+TQQeSZseKVU
 SWQWlPqcE0/wuB3dKSICe+vvHIea/k2uP4dZyaeuFUGUDlpVIGwUXcWc1xspp4PuRNul
 pdKsn0wcrfd6K1rIF9PJ1N6ej+VUKr0OS6M7PbJBwgi7bLhOCOtyEB58WtI1aITwYggH
 EiYkMOCFHkCkFWiwR29FXGgRqU3YZGciKIphT2R8gKu9lrnm1aQvTbZVLVxdh9XU79NL
 f03g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716472788; x=1717077588;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b2mr7lVbeO+bj308APhWygOcy2XRVk5IKWekmqrcKgs=;
 b=cXpNq7mmpk4WKTgl5JKrB3GL4UgGUMRefzHmvuVILVYXyEgrKdQ2nj3emjYP84j4Jr
 r5pBsrujYTKaluEMwqI7pZIG9wFF1+uenbW8TLG19CFLTcteWWBIfy661m0/BbqpLr7Q
 QSNa+79z7Yt854E/376shuUUaStiifCiha+yMtVClq3Zc3X/1GxOylI6in4HHiBltVot
 3R8eOkd8k6/Tklm8o8KvgLLERQkyWSXOtS1JBJfpRP3SD/C2mln7sooaSceEB0W4cgGz
 fs7ER02yudkfjJmhYcIrhc8xkrRVsvpn9PgRGQ25Qb5Sps/j8hob/+TVubwj/F/v9Tni
 vPUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUt1KtS2If36vrimPzNzka2VgxPxicoql56+n0y8nqa5KkV4vcEdcTbEH7khi83N7oY7IKXLGzXaP7A74w9DKhK06Nq
X-Gm-Message-State: AOJu0YxNTyVh+swtK6Psjjb87JeCLQPvEFkvdV0LxspvFT58KlbMAiv/
 s9wQ5JKjrYc7lrwfl+nLaMd+plJ2zFiFBi7R8Xl525Eflbu9r/8g23a57ZHaATfjR63NR/rMwgL
 8pPX24YIuM5f03+paOZDNDoYzVrJR5uD/TmVRLA==
X-Received: by 2002:a19:ac02:0:b0:523:93e8:1ced with SMTP id
 2adb3069b0e04-526c0d491eamr2650469e87.53.1716472788460; Thu, 23 May 2024
 06:59:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240506010403.6204-1-richard.henderson@linaro.org>
 <20240506010403.6204-26-richard.henderson@linaro.org>
In-Reply-To: <20240506010403.6204-26-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 May 2024 14:59:37 +0100
Message-ID: <CAFEAcA8DKEHkM9hhOQzvVh_5bvhfrQCff=XBraGp6Qw1Tw6HdA@mail.gmail.com>
Subject: Re: [PATCH 25/57] target/arm: Use gvec for neon padd
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x22b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: +08jhU6sAAcH

On Mon, 6 May 2024 at 02:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
