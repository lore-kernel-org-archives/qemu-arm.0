Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6654024ejq;
        Mon, 15 May 2023 10:06:58 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4tDnUPUYZAx1kk6PoeJ4BGsY35FVlriaBLVBtmFp3j9J74jwr9xbY44YPUHX2yuLzYnDM6
X-Received: by 2002:ac8:4e4e:0:b0:3f5:2bba:5c2b with SMTP id e14-20020ac84e4e000000b003f52bba5c2bmr6515146qtw.32.1684170417882;
        Mon, 15 May 2023 10:06:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684170417; cv=none;
        d=google.com; s=arc-20160816;
        b=BjFxCND9Lyg9nmLEURUkdjmGRRBamp/ms6YZL0gIy2Hw8GK9bpPq0o+RW9JdSpci9u
         HnyDvB9rLtCIB9RV+e9aBW9hYPBNJAcJeMsyXhUV/jY55/P1Vo9mAfzSfSvNT6sl2sLq
         kGfryd2/qVrGBl5ncKEQaCFN8vXNvBVgMR5eQmbseYlb4a8QJMAt2aB/TT+4CumCTivo
         IqVi40C4eN3cGskdHrPuvSUBVA/85WVJF2yhEI1wvJaaIRJp5hjLBcXwwNWSm+LYQzxj
         iX1P5kWc+4cWtrTZPKSrklV+81WKJWtjdbM92BkWgd44FIoOvf39JSrtg0g6h+UCoEQ3
         7wSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=gRE7xR0Jwrb4WJV5HXCftu/ZiYmjjiqxIA4l6rp3IMM=;
        b=fAhk9rshtNNN6GYKl7wqcUwkmAFM363LXIrE+Mv5KPgHzb1piej4lzU2LxUG4Pa3s0
         tMHAb715cQ+ABE87y/vbnSqa4xVCrkb5bst4QE8iPl9Hn7RY7hxNjzemRhYMcot0WLMd
         o2Dy1lGEYae7wGgN7gtfn/XVKR7SJnvO0o34sWX62qicKRQXpvIHDYOzsOFqs4MUkgF+
         puIaRffCAh0x7QAtwPyKnrfxiXsDNjbTYaNwbauDsAMRgrt/RHSbdPxnF6Edt4tvhNCp
         vjVllTM0Uss3JBqXM7A8p1XmvfPn1n5qJGlsrnBgbWR3SQkzJBOPUjG5o6ZijYcfzc7O
         hWyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RrQQzfat;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d4-20020a05620a136400b0075944abffd9si153303qkl.556.2023.05.15.10.06.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 10:06:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RrQQzfat;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pybed-0002Wn-3j; Mon, 15 May 2023 13:06:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pybeb-0002Qs-Bk
 for qemu-arm@nongnu.org; Mon, 15 May 2023 13:06:33 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pybeZ-0007NM-RV
 for qemu-arm@nongnu.org; Mon, 15 May 2023 13:06:33 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-50bc070c557so24268774a12.0
 for <qemu-arm@nongnu.org>; Mon, 15 May 2023 10:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684170390; x=1686762390;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gRE7xR0Jwrb4WJV5HXCftu/ZiYmjjiqxIA4l6rp3IMM=;
 b=RrQQzfatCoImhtkLRP6B+gc8nu0TzQdD4wu8LQvdCzP7+qEZe5XeMszPQzKXwnEdTS
 VzfRwfnOLrtdqaSbFyEkrcOTOjLgk+Gsd9az+lEy+5mqXHE2Ccu24yrfJseRFoAvjOy5
 iqJVEQKGBbvThMvQft3ag5nrYSTPVl7tqHuw/6ogRGwmp7uVYp/SwIefS+NvJwIO+WFh
 kvuNkkKJAkfSdr+kPfOePlS95Wl7mr3cEt7Rqk+yTWBCXT+CNMWkABoPk14rS4s0YrgI
 s3l0mD83pSUSgIXZMFx20v5Jwf2xmV3YCHkOARl6blLlYy+QhPRPD95PyextKBEFIY6k
 gVxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684170390; x=1686762390;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gRE7xR0Jwrb4WJV5HXCftu/ZiYmjjiqxIA4l6rp3IMM=;
 b=d/TlTNcf7/7IgkEgEKSa+cV4oHpg1exu/f/IX/rc1zktmqapdpChurBAm7fLwldo4A
 rOeIDsb+GUr2EtCj+hDfCqed13dEXO6vN60uicqHn4eClZrGCVHRxwG6TvqU0S8pla2U
 IhWaB13y0d1IbuxrOVk6Coi3ZJk9/7hwfALLxP8qZPTSH9O/ee6EVPA0xeAzRjEDQDoq
 cD1rXtNivl3P3ksIlnSbz15XSTk+Vr3GXmeOlT7nUQv3LMTT3/vBhhT5PecMQWiXoWnI
 H1UZVFvHF4iSZ1iRu009A4Tg9m330QTp3o0eR5Xsd5jX/Q3ZuNdD49SWjBXh3r+EvGdK
 OSIg==
X-Gm-Message-State: AC+VfDzguNNvTd2nmbLNzdI5U6vloMg8RSH5SEoDWJvfg/mTLg5SKfHT
 rKYttdzMOdUxKDqi/+c4jIJKndEJ3cMNkT0uOD+r8A==
X-Received: by 2002:a05:6402:322:b0:50b:c689:8610 with SMTP id
 q2-20020a056402032200b0050bc6898610mr29998475edw.18.1684170390183; Mon, 15
 May 2023 10:06:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230515143313.734053-1-richard.henderson@linaro.org>
 <20230515143313.734053-25-richard.henderson@linaro.org>
In-Reply-To: <20230515143313.734053-25-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 May 2023 18:06:19 +0100
Message-ID: <CAFEAcA-45sdSOxnXEcHMNKF5mPCHhoKBoRg4zWCanKTXMKpygA@mail.gmail.com>
Subject: Re: [PATCH v5 24/54] tcg/sparc64: Allocate %g2 as a third temporary
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: +V1T77S/GpNm

On Mon, 15 May 2023 at 15:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/sparc64/tcg-target.c.inc | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
