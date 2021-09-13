Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3725340lfb;
        Mon, 13 Sep 2021 07:26:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0ciRPRERrwUjLu8EG3AMbx2Qhhyo3ajOmHRWhk0MBX2GYKQ6HbdF+KtnAwKPj3jjjgeWu
X-Received: by 2002:a05:600c:3585:: with SMTP id p5mr1782742wmq.110.1631543198981;
        Mon, 13 Sep 2021 07:26:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631543198; cv=none;
        d=google.com; s=arc-20160816;
        b=ISmGgOZ6uRdEFw4JLUcMpGXeF1FSH+GUF2Ql8rPRqX4kWVFQLzKfbnQ5aNLDuCbYWN
         9mCC0u3TvSHnibwhV+O4NqzAj4xTrHvUDkm2iHwhSiIoO8sixLAMoJVkw4FwtUOuIFGT
         qGnexmsuauJEVp9UNWih2pgQ1VVcVghKs1ax3wYHGI5vP5ObjOfazQKgm0j1bCHu6A8S
         84OC9Bhmtt3vzGnikzkmZr8zQ6qqW1HIuFbqAkVL5G1c0nsvtxotyC0WYEJMq1sZ/qNg
         ZRP3YIWVkEHIF5jMTWsJHi9EBEE2aTSk2Sl71msdc9dgunNmpvyGpQNoyKrZwr2HSuQx
         0IVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G/oXdG+K/mn7k+A9gPyTnR0ScqfyVqdSsawxB342AdQ=;
        b=lO5GDNQlXERdwNxQoeyANR8vsWSmZu6qiP+p0ohCrPVG/vDnOJ3M3sK41QgeW2KJnA
         AtlP7pz5DdCIu/cqnYEFKe7bfs6z4jYuvpIS65N61bmYhDnajp+dB5lrvHV8+vl6AIzL
         m4fqLQtBxiDp+hQ+1QRHQW0FPDdXjTofvJbRNzgNGzBglb0cDIGIFN6IS4Pb8SMkWLYa
         /BUoq4/LDTbt2qJBTtxQ/ZFSY3UUZii3h7rsQTXcWpqFAt6HaT8NK+uGTCSVqs15rhMo
         KqdbP9HYBcS5wpuljZ4tYnzZNaShqTXebxlhWJ0wP9OC9F8W9UET7IByYSqHlj/nbHpq
         56PA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aa47cwxo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j19si7464126wms.96.2021.09.13.07.26.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Sep 2021 07:26:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aa47cwxo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mPmus-0007V1-08
	for alex.bennee@linaro.org; Mon, 13 Sep 2021 10:26:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPmru-0002Vc-9W
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 10:23:34 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:40876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPmrs-0006jZ-Or
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 10:23:33 -0400
Received: by mail-wr1-x42e.google.com with SMTP id q26so14993330wrc.7
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 07:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G/oXdG+K/mn7k+A9gPyTnR0ScqfyVqdSsawxB342AdQ=;
 b=aa47cwxoqLvgSeQcR6/VLipx63NWLnoUaKUUsR4TY+SEhDePfi1lL0pHheGqBCvOvS
 G9WDDPI+Do/rdlu/8V/pd/IAi1t72HEJVfuIhaJDTD1xqmM1gY6tl2eCE0E/3znv5M9g
 c8h276ZUYd2HngfdlOxSjDCa3xwE62g5/U4bgckwtv9n6QxVq7KVQSzMrHdau5dB6tuM
 AAiZ5zaggrdcfa0nCkytUiuBSVO6YRg8QIaC09hkR/HcsK9mIhuHCFcH2xgs5eQkz/qp
 NlUapo18u2E52sn5oIT+oNzPTvWmbE6v2LRMPqXhFt7wFPt0T/MgHpwYeYnGLKRnGpHh
 wWKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G/oXdG+K/mn7k+A9gPyTnR0ScqfyVqdSsawxB342AdQ=;
 b=FFu16Oz2QOfbN000w/E2vaZjAHTAcm4VjNWEAyVYNjnIM01Yd0i8jGw534Jmhy0h4R
 ELDbxdHZlv4bjDRX6/O9JjiSvBm8WlLqBaSi53ohxXRj/XYkjzo6iiPwZ0wq8743/JKe
 MF1s95ryUT5pa8yBjO+0Ap4I6J60fFNXdP004pyDhW0lj+h/elB/I0vvssluuCL7kFVa
 bx4NOdtb7b83DtiTKIJLQryvYpveXUY5nS1dIMlyazRx7gTTQf4KkAGyZfyGE+JZM+L8
 U0hE+occtKQcUR9uf+shlxTLMEFHtlf1g+jRBoGH/jeZe0/qgcn3zNL3kI+vobUiWZHv
 KXYA==
X-Gm-Message-State: AOAM533UK0kMtKOEI3Ij/aAcPXO5820h9eGauPl2IWfIoMRaP1PjWo4Q
 uBYkS4Kn3r8aa+GuCZtQiUEEZfl2Ah0/YWda9tUklA==
X-Received: by 2002:adf:f185:: with SMTP id h5mr13060833wro.302.1631543011063; 
 Mon, 13 Sep 2021 07:23:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210913095440.13462-1-peter.maydell@linaro.org>
 <20210913095440.13462-11-peter.maydell@linaro.org>
 <0bcbd02d-abb6-de1c-efc3-d0ba465cdb9b@linaro.org>
In-Reply-To: <0bcbd02d-abb6-de1c-efc3-d0ba465cdb9b@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Sep 2021 15:22:40 +0100
Message-ID: <CAFEAcA8q1Uo_79geDF3SGXt04RUSmo90+UumLxjOCAPX4HLb9g@mail.gmail.com>
Subject: Re: [PATCH v2 10/12] target/arm: Optimize MVE VSHLL and VMOVL
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Jl5UbRJaPA6m

On Mon, 13 Sept 2021 at 15:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 9/13/21 2:54 AM, Peter Maydell wrote:
> > Optimize the MVE VSHLL insns by using TCG vector ops when possible.
> > This includes the VMOVL insn, which we handle in mve.decode as "VSHLL
> > with zero shift count".
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> > The cases here that I've implemented with ANDI then shift
> > could also be implemented as shift-then-shift. Is one better
> > than another?
>
> I would expect and + shift to be preferred over shift + shift.

OK. (I wasn't sure, because and + shift requires another insn
to assemble the immediate constant, I think.)

-- PMM
