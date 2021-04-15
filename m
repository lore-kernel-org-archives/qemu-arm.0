Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp849529lfr;
        Thu, 15 Apr 2021 13:15:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJww53i39LydvxbvWKeVtpVWT01U2CF3z5M/4F9IN0efuy6fL6ATC5zJpedabCQufcw4WRJk
X-Received: by 2002:a6b:f909:: with SMTP id j9mr783298iog.138.1618517726712;
        Thu, 15 Apr 2021 13:15:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618517726; cv=none;
        d=google.com; s=arc-20160816;
        b=rKWNbo0F4BmcKCwJNQV6IXHckSOdhQGYSstot616oQWDc8tVOYwLuPFmGl2BOuoT94
         lOoUnCdpLN6iqQZ66oCC2z/Y9NFmVtVVV4OOep/VrndxMayOk6BFElayyyd0FU2DIOtB
         FSbjUNo6GRfWr/fvqt0ViHRDrKuhTR5z8TCILxBEEgbo7IoFFlPJpb+8ByRHXwdAE7MV
         GXw003K7eBSry0yi0fpvIFiyNkdCNDscXMYWOxIEWwJi0AaFkmnJsAeltwthhuQoVYDv
         IGyDlSfxcqKexzEpuiqY4jAHrUNMG7WKF0USsJBYLUeGR0a+VuFE5LS3agX+kXYs73FD
         1Mvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gHSKxicn0yIf4UXUNNoWmFc1Z55Pc6GeXuNztixQvQA=;
        b=F5y4/Xo/BXw0rgzA+yoXlKygilgcKBquV+hGo9CnJAH1bOGC2JHaHK51MGKaUZUzYo
         IMRcW+/V8Y0Vc4DJUzFmCsfM+sZAYKLDfou2OMyXdoqDl3/Fzx1+1NXiByZarp9jRMw5
         Q8GcwZYjOBJiDPAYA6xNt2I/R36OyuuF388gY3EytOFq75o02g/Au/sYprBR/7SyCI+E
         KcON5LEaQU1eEFNVpgjs11LgQCxtgv9S1avj0RNe1WZiMB1YrB+nAhOoObN0U0bFsuWL
         fN2LagXfYdZCjlPJUKZzOSFwd49l6bv5Hf+n95/bZlRAYZUmTvyrDoI2VTvPGpV0XUxb
         7iWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=imhv0pin;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p31si4024688jal.19.2021.04.15.13.15.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Apr 2021 13:15:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=imhv0pin;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lX8Ob-0002KQ-Ur
	for alex.bennee@linaro.org; Thu, 15 Apr 2021 16:15:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1lX8O6-0002Ie-RG; Thu, 15 Apr 2021 16:14:55 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:47026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1lX8O5-0003Qn-J3; Thu, 15 Apr 2021 16:14:54 -0400
Received: by mail-ed1-x532.google.com with SMTP id h10so29568339edt.13;
 Thu, 15 Apr 2021 13:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gHSKxicn0yIf4UXUNNoWmFc1Z55Pc6GeXuNztixQvQA=;
 b=imhv0pinl9jhNPKi6m3CC14XYtZ75rdBaZAA8R0s3hZKBeVmhMv36nmZoE0jSL1Lsi
 0c23vj3JEkGMgHIfnK8e4mVTdj2Bm1ex7JsrXRPUEHyG55/rL3pcCo3ioYlzqgveQf2D
 oihmvXeVtx2HeeFFID19JxozR7HYLGPWdqLWvX8zKONFtSQ8ys8SjQ0l1KBtDJFPGJoy
 mnUxMzXbvwJEOZIHIN0HfV8yo/LiCEPDRF5n2G988JN0aHvSJAVtpO4j0CjBaX+RJKv+
 B0uB6vIdWWgWM2kyOlM4xmSGtH5OrE0I5Z5EgkYOjyGxmY/j11BlRGb0YbnMWTsMNbGb
 AV5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gHSKxicn0yIf4UXUNNoWmFc1Z55Pc6GeXuNztixQvQA=;
 b=H5YUJHMrIWaPi2uxtsAD15pGuk2hJpaIwNuge29Rz93sSWgRrmLnFCKeXcLIxLSfnU
 T5/0d2UiL9EHYStF1ccePXtTY9bXWQWfus8Ys/9MqZfZQ4L6n5ldTExVnr27eYjIERc8
 ai2m8ek2/tHffxaFyvU635FTTQzLU2lc+XUdvdc+C6H+jlkJWE4J2I86ApIGDrTduHu1
 s12Qx2pZHPiRGbzc0IaLun1+QuP1GkR3sz+L76eePjZGAG17qlhzApplNdeBlKuga2W6
 IiscDW1deEaKNaUw02q5IWrm029nLPeifvvhc0wVhx2TcqRgkqwwNZuMWgO7mrUiuS9B
 p2Yw==
X-Gm-Message-State: AOAM533PPKuy3Qqgn5+4kw6eN4HawjBb59W8jDVY9lNyNKHki5CwuLiq
 NxUGpmxqPKT+6pT6ulaWKchvUG05Ir4IGLjR+no=
X-Received: by 2002:a05:6402:2552:: with SMTP id
 l18mr6251193edb.71.1618517691084; 
 Thu, 15 Apr 2021 13:14:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210415130305.28640-1-iii@linux.ibm.com>
 <20210415130305.28640-4-iii@linux.ibm.com>
In-Reply-To: <20210415130305.28640-4-iii@linux.ibm.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 15 Apr 2021 13:14:39 -0700
Message-ID: <CAMo8BfKxvt8kGD5m7sn6tVtb=BvGM32yU6CPAhQTjfN-SwpemA@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] target/xtensa: Make sure that tb->size != 0
To: Ilya Leoshkevich <iii@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6wpqkJD2dZP8

On Thu, Apr 15, 2021 at 6:03 AM Ilya Leoshkevich <iii@linux.ibm.com> wrote:
>
> tb_gen_code() assumes that tb->size must never be zero, otherwise it
> may produce spurious exceptions. For xtensa this may happen when
> decoding an unknown instruction, when handling a write into the
> CCOUNT or CCOMPARE special register and when single-stepping the first
> instruction of an exception handler.
>
> Fix by pretending that the size of the respective translation block is
> 1 in all these cases.
>
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>  target/xtensa/translate.c | 3 +++
>  1 file changed, 3 insertions(+)

Tested-by: Max Filippov <jcmvbkbc@gmail.com>
Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
