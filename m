Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp315589lfk;
        Fri, 22 Apr 2022 02:53:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyx1HJUdKQha9P3200T6cRrC/c58hcxnL1AectQCm7JRFD9pRp2m56SrX3gEmahFxNZNL9r
X-Received: by 2002:a05:620a:139a:b0:69e:d0c4:38ee with SMTP id k26-20020a05620a139a00b0069ed0c438eemr2083755qki.380.1650621186517;
        Fri, 22 Apr 2022 02:53:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650621186; cv=none;
        d=google.com; s=arc-20160816;
        b=hhCe5d9wyumWt9kZW+6RRD/igBdDvNYDqAxc/S/UQ3Tp+U2em4b5iKQkhr3EHdmkQl
         w6MstMErVx8UbmdHMNgUjdQY6KOdc5wwaR5zQMiEvIjsidnCF310NhcnBHxhC7hpCan5
         MlroC/Hb2dHq20bvzOZas7ivjYw6j8gaKLNZWdscRokvxR9qn0h5jD3V7CUZsj/zrNgr
         ubIO5a74j9lE2HBTbvjtq521GZs845qG6sWH89t5VYRKlGJx2FXisO1FauWhf3TLXSIX
         S4VC2YjhRdzyz2QkM2lBO5C7MMI9YoUdK3TujqifhzdE4+pFyfd2AUMSjdhKBEFS9EwN
         r+Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i7yrw++c0JUn6Tq7eJdTKv7p1bKNR2LXL+dQvKR1EuY=;
        b=i5BerAjn533UmFBNmOLXmyYALiF5OYZwtozfIftp/QL3BjP5qBI/crplxmOXvzsc4Z
         JoVfSIiwNVwRntwCfosFzNd3xSgW+RCh97AalbXUdlRHWxCPybpZdhuoZ7IxGklvhln8
         Uyxn1v4GojQ3nXHRh445vlWJ025Ewet6+I1d0dJhw8C5h0hx+sBq2PgUglvgi3VNJU0J
         C783V8OVVUOYLOtR1FGP5IfmwgjmLMfJZihJA09YVLZZ/4DOcT5TxDKPulSlAFnwfOM7
         qUW/KPFgYCb1kMxgouJHwlTnwSF0kvavOze1EjjIaRDnBby1ddLIptSCMlLCyxmGmfjr
         Zn7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="NDls6/v8";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k27-20020a05620a139b00b0069c7923cc7dsi1866824qki.305.2022.04.22.02.53.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Apr 2022 02:53:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="NDls6/v8";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nhpyM-0001qy-25
	for alex.bennee@linaro.org; Fri, 22 Apr 2022 05:53:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhpxq-0001oC-VA
 for qemu-arm@nongnu.org; Fri, 22 Apr 2022 05:52:34 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:40817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhpxp-0000r9-BG
 for qemu-arm@nongnu.org; Fri, 22 Apr 2022 05:52:34 -0400
Received: by mail-yb1-xb36.google.com with SMTP id i20so13519221ybj.7
 for <qemu-arm@nongnu.org>; Fri, 22 Apr 2022 02:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i7yrw++c0JUn6Tq7eJdTKv7p1bKNR2LXL+dQvKR1EuY=;
 b=NDls6/v8hCsM0kbYfNn0nA+Z8RrmGttD7Ip1Aa/hzMwS4NM/oV5mSJjiMZG6TfAvSe
 MMwubXzMtE1wTh61G1tkQ+Rt6OIZQsDHEqch4KoYDyqKmjFfhMRhKBbPrbpftXItSb+j
 VVB9hdrZC5yACBCs65XVgAO2pieVDWoATCS+q9Cbaz/8wxw9ytOnHvtHtkOqZ4FgqPMt
 rm6E42R9DuxXXgwWWb3d9+LQWHsFU2Uym3Om1zlQM4IGYjf9t9S7hZ1Ii7m8VS9+kpnZ
 89ea0w9NtXN5La4t9Xpkl6lr59B7Ukmu/AYSdYpRz3NQg7YQZDUK4DDt2cweK54BBh2+
 NGZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i7yrw++c0JUn6Tq7eJdTKv7p1bKNR2LXL+dQvKR1EuY=;
 b=cpg5jOTI88fVCnj0Zc7mHmzguedGvXg1o8qqEz7ERvNziYJ7GSPW9oi4fJ4GPpKO4r
 cktsr2fXTq/PQ/O2eikU7ERlWB2H22SqJOgjFfpehWp2RoMMJ0kY6vmyTWLf2LI0+6rV
 uDsi7lTQgcamZzX8oIwvGRIi5+BEImG4nZQieRe1RnUxIn8iybfjbX+qxiC+udrm2irB
 HCJBsX1Zm5ZFtbyXCLh9JVGOZ9tH9qwY0rKXTK4eb9FKaG0Xj+mAfHzDV+gXwfXI95xq
 FQyqmMKe+0Ti8ORMzgO6wbfLk3uwIaYDQpYgFRbov+pJHeaBMqjnNpGIviyurD1a6p/Y
 XNsw==
X-Gm-Message-State: AOAM533M4X+/fX69A7SHs/VteDJ/wARVM/2hWB//cUgJWTrPaBvONnwj
 oGiHgQURZvIsS2TmFA+N0FjhcU9VTULO6qBxHlsmBg==
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr3561103ybq.67.1650621152269; Fri, 22 Apr
 2022 02:52:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-30-richard.henderson@linaro.org>
In-Reply-To: <20220417174426.711829-30-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Apr 2022 10:52:21 +0100
Message-ID: <CAFEAcA9Kh8ws0D-DZdj7V9pm=tpOfwY=MxFzCNK16YWY8uTm=g@mail.gmail.com>
Subject: Re: [PATCH v3 29/60] target/arm: Change cpreg access permissions to
 enum
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yN4KqKVcs5rp

On Sun, 17 Apr 2022 at 19:15, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Create a typedef as well, and use it in ARMCPRegInfo.
> This won't be perfect for debugging, but it'll nicely
> display the most common cases.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

> @@ -8741,8 +8741,7 @@ void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu,
>              break;
>          default:
>              /* broken reginfo with out-of-range opc1 */
> -            assert(false);
> -            break;
> +            g_assert_not_reached();
>          }
>          /* assert our permissions are not too lax (stricter is fine) */
>          assert((r->access & ~mask) == 0);

This part is an unrelated change and should be a separate patch.
Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
