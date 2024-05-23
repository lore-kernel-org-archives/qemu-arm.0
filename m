Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp1095584ejb;
        Thu, 23 May 2024 07:20:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWpYXsxiyHfFY6Umh+fDcV27CsvznR6SqwcqDCQt+whCuT8Pn/L8Wt2kqTwGdSS+UJ5mTiTs15dRytOI3oNFXEAoYhwgP1g
X-Google-Smtp-Source: AGHT+IGGXzRGCSOh37PXduUeh4mKgdQydzZbDkmX1wYfqmRxPZRJXhEdYmuonhyqz765UnPRUkte
X-Received: by 2002:a05:6102:3e81:b0:47e:b219:8f11 with SMTP id ada2fe7eead31-4890a27d733mr5238678137.29.1716474011820;
        Thu, 23 May 2024 07:20:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716474011; cv=none;
        d=google.com; s=arc-20160816;
        b=OkA8xIpk40DXdJt0f91bW4s0huZlGW9SIUeCd6QcoPVJ8L55b+bN2ndsEf7xtpIB+z
         cMQkuHlJkgr7kH0JSs2ee7cGmhdiIR2lr0sB7bCjoJUnlcilhMMcc0uDQZ8Hrb/uNweq
         egwOgijBM2qVJGZg6oadyx6o4l/6Le6HgegKDUMkZ+RpVpWhuQXeifIm05FabvsqNQup
         H3HnoCYZmHHGmYLdVwdxiCHA++rIlld780iVhGIEIjxVJOugF3zu6jKQXVLf7YfSzW4v
         5MQ7cVXooSbOewQQ1uxrLYP4z63vplYnq0tbwLsTBMCIZYWAIFYAaKwNuG4Z5Zf3NsO9
         8zuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=I2liDebFkFTCFftBWCVhJz27a1IxsiRH1ew8XkLA6gU=;
        fh=EHxdWEYUlxSFyp7ckGD1pdA6gH3y2fXexGlzB4F+bG4=;
        b=ZUHBZnYQToyTTl9pua5ftsvVWtvsCIe2WU46NScZwHG/gjl4Dz+MzXDub5h0BqWESM
         YI0PUuKzlT2hfp+ygJP5uz0iEAjyFxfrNHL1nDV8srx9ofq/Gji97ALqwWCTnr5gJ/uu
         rnCflAUCoaMw8W8EQnY7qZj+w2/tf4i6Z2DYif98VwRlwWO+Vx//InkxvAxkwLFo/KTU
         O/md8iCcoBVHZl797wPAugHrgS2XtpBzjVg58oThqva02VXrOqGvWL0AEfaS+NVDpLoe
         YiS7DpfRqtH54FUqufC/qK2WH43A/V/e80vaA82lm1C7KH6v0+hdOmrWPzbUlHoZmGbO
         fOUQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ax0ihSkO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4806ccc899fsi6009443137.812.2024.05.23.07.20.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2024 07:20:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ax0ihSkO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sA9IK-0000kL-Tb; Thu, 23 May 2024 10:19:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sA9I7-0000hY-V0
 for qemu-arm@nongnu.org; Thu, 23 May 2024 10:19:36 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sA9I5-0004Zl-GC
 for qemu-arm@nongnu.org; Thu, 23 May 2024 10:19:35 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-57825ff689bso3567712a12.3
 for <qemu-arm@nongnu.org>; Thu, 23 May 2024 07:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716473972; x=1717078772; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=I2liDebFkFTCFftBWCVhJz27a1IxsiRH1ew8XkLA6gU=;
 b=Ax0ihSkOkMID6dEjhGttv1+DvE6aNKqJNumRaV9WWgGotTWbTo+6geRSwJg62FE6sF
 AO8cLUv0ATt6Ak3kBrHdEoVBkvbZ+pV8qCkn6x50493nFQEbU2zXD2shJpffphVarNSL
 TktFq/yACrVabaVl5yzTqobEnIm3TnRiVXJkwVTGn1Gei3e1LPP5kPE/cl8QbsM/hi5j
 YYkfy69cFWnzGpt2Tub32TQPt2ViWD0YCzVcPFEUyNuMqgwh7I9ykq99UQxLEVvZyxfU
 ILM+QY94mus4iKSJoHlP+2W0j6uYmw0pt/XplQ6G+5bLBPJEOQZsOa0yS16ecvCn1USF
 3dGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716473972; x=1717078772;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I2liDebFkFTCFftBWCVhJz27a1IxsiRH1ew8XkLA6gU=;
 b=TiC59H9vagRz817haZGkD7y6Kc33wsbbcy2BwbQGztgLP3U5xJ7qJTeHDgmIBIvwf2
 QU7sXvMSwo+imn5LpwpoE5Wi493CKgoLiJRYBLqfKF1W+1OGy21cmOy5/p9gubZes+Sy
 nfotNg3fCWSsiaPVWaPtGfQea0pjvBjc/nB956BpXroqG2iA7TGrfScbP9c/LoCkW/Rq
 NsjlSuXxOmYi+O6PTPZ15HslbjWOaex6GyWkmlsYvvhm2tGMtrjvtiiEgFuUz8aZkd1m
 OlMyPPsymtvoMFRkiuTg9OIg54OMktll1Zulm4oPlRsJGxvdafdubMQxbnJBw3VARQWm
 jd8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/eR+LaTVQpsSKWjVQAA0sOUSMqXHtPHID6wMblH/51fbT/UsLOZ8JP3XdjCmtLjyd93drAfkVduW4rJoMWgSDlifN
X-Gm-Message-State: AOJu0YwigwtUH5WZmKKdBRDWdRb73/kPTmI7gTBa92XrbbI+an+8y0D2
 lq7WBZ1qms4u7fVbVfAtNXdB8uD48nOgq8TvFSUzDwk8MukcIyT25rvRJN4yLA4z+/phVMagbOV
 vp+mfOmHBxJHXuIkLhWoTjoCeU3vHv1mO/sgj1w==
X-Received: by 2002:a50:9b11:0:b0:578:4380:3ec8 with SMTP id
 4fb4d7f45d1cf-57843803ef2mr1351380a12.25.1716473971578; Thu, 23 May 2024
 07:19:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240506010403.6204-1-richard.henderson@linaro.org>
In-Reply-To: <20240506010403.6204-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 May 2024 15:19:20 +0100
Message-ID: <CAFEAcA_vcMuJjjOVnsfiD8JAk3KZ+6DG6K6kiRUGqHWXbBjR6Q@mail.gmail.com>
Subject: Re: [PATCH 00/57] target/arm: Convert a64 advsimd to decodetree (part
 1)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
X-TUID: shsHeawuiLBB

On Mon, 6 May 2024 at 02:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Based-on: 20240424170908.759043-1-richard.henderson@linaro.org
> ("[PATCH 0/5] tcg: Misc improvements")
>
> In the process, convert more code to gvec as well -- I will need
> the gvec code for implementing SME2.  I guess this is about 1/3
> of the job done, but there's no reason to wait until the patch
> set is completely unwieldy.
>

I've applied patches 1-29 to target-arm.next (with the
FMULX decode line fixed). I plan to continue looking at
the second half of the patchset, but I want to get a
target-arm pullreq out today before the long-long-weekend.

thanks
-- PMM
