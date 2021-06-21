Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp2260940lfg;
        Mon, 21 Jun 2021 10:13:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyy+YdF5zrbZ6fKwHsmOQXiUTKzrNq9qWfwYU//WymZEHxYwj2rdQK9FM6w7grkydfKwgjk
X-Received: by 2002:a17:906:6b8a:: with SMTP id l10mr25723062ejr.125.1624295604696;
        Mon, 21 Jun 2021 10:13:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624295604; cv=none;
        d=google.com; s=arc-20160816;
        b=Nk2f0bZdMJl6A4ZlWVDDhSswBxM4ujHlm8OYiyzBAd7fbfzIAa9cZf4eV0jQtb2Qfo
         EUNh+Y1zXvLxU6qRT3ChEYBrfH9yqizQg78ly0jbyyMPgnCq0982T7ReVhbsGrX68qAS
         FC0M5IuGDs3Lm1anNWvrQe//xLrVDCaCETEOP/fuE0TuagOaILsMEnCbjO8Lm4y5s165
         DbYSqyRMGiHQjSHabaZq1Ku3FWzkaYl5dXKMBErEYe6hfXnPDt3c8fgP33/+Gb/76+W5
         3goFlJK7P+yS0En0MqBo1W+IWm+iDNaJ2M0sng2ALMOlxa7fULyjQpeUr9FMvuHdboYD
         KFKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cNyPnxlYlTwEBGjEXebo/3/R4NZM0aR4fkRxX+zCu/A=;
        b=Uo8cED1wNwx2h8IQGmQ37XzFXtQ1PSa2aC67xyXXky/Kq/YXSyhBbHfM5NcUce5W9/
         73HEPR7u7g9AYwJDpNGh9XFLJce+MrI1PBrmUN80tCdtXqF2C6BWhyp5xrAPVrsw6CSR
         m5gAb3T1x0LiRwIvBLwQgSKTkM/C/HcnHrKqENoxo7FB7YywAk95fA1P5KQM/1cPZM9x
         50Anc0xwouEBuYhhnuFqqOxRJGPl46fy4Wa+YeoOUVDjpgr5RSwCxbNo6D7RhFEdP+Ua
         198SBm+zZs+Yg7ag/mE7fQzae9GN2blue7ieUycOa4o4PgWiUNl4FJhP0A/I2uZWxN5i
         1NKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OjAhCUJt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id yd16si11922803ejb.249.2021.06.21.10.13.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Jun 2021 10:13:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OjAhCUJt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lvNUB-0007Ti-P6
	for alex.bennee@linaro.org; Mon, 21 Jun 2021 13:13:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMvf-0006lx-0i
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:37:43 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:44742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMvb-0004N3-NN
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:37:42 -0400
Received: by mail-ed1-x531.google.com with SMTP id h17so9921641edw.11
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 09:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cNyPnxlYlTwEBGjEXebo/3/R4NZM0aR4fkRxX+zCu/A=;
 b=OjAhCUJtJtfZ3JwTyEQbFo1EBJb1ZAzUfiC9yCCuXe14S/B1ZAYnNzXqnQuQgj8DfS
 6ZNSxKw7lf9+8qMfPijKUs7GIdU7HRWZM48QxD9+vHmhAXej4vSVJY7TrHyn/ap7TJoj
 yHkk/NyVgHT7n5SBNnENLX7ys3nKLsOylZg3OXyw6lzqLZd/u5M1TOfisdxMPjlJTGFQ
 yyr+gu6xoQHS7eG+ui04AK0Bblvfqv4/b9swASUJY9RBeJ0bqekKUE1rS2X5rXw2Kd5i
 F9Dv/TFEj1OGcTCbIG10a7m0PNios0l7xRg2JLb+EzC3yRt5n/XQTSYRzTwzk0ThsAEG
 Gg/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cNyPnxlYlTwEBGjEXebo/3/R4NZM0aR4fkRxX+zCu/A=;
 b=NWaGzuvcoGw011b3ERmZa3HabACFwCWivSIqvBM+0E9ZfssDHuDhpzqUroqgb6gTph
 7siMWatwOltmHyIHBfYVtST8Pv96ueQJN/+sa4KLyGVZ07uTrhSv3rxHAx3896+YMyBW
 kp4xLCxGlvLSTTL1V+wwSE13xJ+H7QkGnN0LcyXzT5/EOJ0UvwmdefrqXY5bR68t6JFe
 1X4Pyic5UsMO+DyJkoYYYS0nSQ/NrSMUnu0KJX58elsIm+zTKCXkPyt1La/QAJKFtwkt
 LerjGb1AiYq5FiPUJAyIO/vo8Z/WIOQfWzgJM3w2OdgzTnCfGksm/1n10I+YVGTxVhm0
 vFUg==
X-Gm-Message-State: AOAM532N5xCBhN2JV7CFQBo1MyojvsnTqbHLPxbAiFt4ErnsvezfsrpG
 Po9YfkuFxhhfhEHVoQo/6ANPg4wnUKnTkrcFG9YJNw==
X-Received: by 2002:a50:fd0a:: with SMTP id i10mr397690eds.251.1624293458410; 
 Mon, 21 Jun 2021 09:37:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210614151007.4545-1-peter.maydell@linaro.org>
 <2ded6216-9fa3-2b39-87ac-c61d08e80fd7@linaro.org>
In-Reply-To: <2ded6216-9fa3-2b39-87ac-c61d08e80fd7@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Jun 2021 17:37:02 +0100
Message-ID: <CAFEAcA9udbXc9jTJORVfTmH6jdBrSwJLaivAoaeCUom-uVGrLg@mail.gmail.com>
Subject: Re: [PATCH v2 00/57] target/arm: First slice of MVE implementation
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GrfdzLXuQ0LR

On Mon, 14 Jun 2021 at 23:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/14/21 8:09 AM, Peter Maydell wrote:
> >      - pass only ESIZE, not H, to macros in mve_helper.c
>
> I've been thinking about the H* macros again while reading this.
>
> While H##ESIZE is an improvement over passing in HN, I think we can do better and force
> the adjustment to match the type -- completely avoiding bugs you've caught at least twice
> during SVE review.
>
> The form I'm playing with today is
>
> #ifdef HOST_WORDS_BIGENDIAN
> #define HTADJ(p) (7 >> __builtin_ctz(sizeof(*(p))))
> #define HBADJ(p) (7 & (7 << __builtin_ctz(sizeof(*(p)))))
> #else
> #define HTADJ(p) 0
> #define HBADJ(p) 0
> #endif
>
> /**
>   * HT: adjust Host addressing by Type
>   * @p: data pointer
>   * @i: array index
>   *
>   * Adjust p[i] for host-endian addressing of sub-quadword values.
>   */
> #define HT(p, i)  ((p)[(i) ^ HADJ(p)])
>
> /**
>   * HB: adjust Host addressing by Bype
>   * @p: data pointer
>   * @i: byte offset
>   *
>   * Adjust p[i / sizeof(*p)] for host-endian addressing
>   * of sub-quadword values.  Unlike HT, @i is not an array
>   * index but a byte offset.
>   */
> #define HB(p, i) (*(__typeof(p))((uintptr_t)(p) + ((i) ^ H1ADJ(p))))
>
> void bt(unsigned char  *x, long i) { H(x, i) = 0; }
> void ht(unsigned short *x, long i) { H(x, i) = 0; }
> void wt(unsigned int   *x, long i) { H(x, i) = 0; }
> void qt(unsigned long  *x, long i) { H(x, i) = 0; }
>
> void bb(unsigned char  *x, long i) { H1(x, i) = 0; }
> void hb(unsigned short *x, long i) { H1(x, i) = 0; }
> void wb(unsigned int   *x, long i) { H1(x, i) = 0; }
> void qb(unsigned long  *x, long i) { H1(x, i) = 0; }

What are these functions for ?

> This gives us
>
> #define DO_1OP(OP, TYPE, FN)                                            \
>      void HELPER(mve_##OP)(CPUARMState *env, void *vd, void *vm)         \
>      {                                                                   \
>          TYPE *d = vd, *m = vm;                                          \
>          uint16_t mask = mve_element_mask(env);                          \
>          unsigned e;                                                     \
>          unsigned const esize = sizeof(TYPE);                            \
>          for (e = 0; e < 16 / esize; e++, mask >>= esize) {              \
>              mergemask(&HT(d, e), FN(HT(m, e)]), mask);                  \
>          }                                                               \
>          mve_advance_vpt(env);                                           \
>      }
>
> Thoughts?  Especially on the naming of the macros?
> If the idea appeals, I'll do a pass over the existing code.

Getting rid of the need to keep matches between H macros and
the types certainly sounds like a good idea. I don't have a strong
view on the macro names -- they're always going to be a bit opaque
because we want to give them short names.

-- PMM
