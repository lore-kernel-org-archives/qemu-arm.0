Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B4ACCD195
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Oct 2025 12:49:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v9jtp-0003r8-U6; Fri, 17 Oct 2025 08:49:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v9jtm-0003qy-H7
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 08:49:34 -0400
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v9jtY-0001PO-PK
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 08:49:34 -0400
Received: by mail-yx1-xb12a.google.com with SMTP id
 956f58d0204a3-635355713d9so2064781d50.3
 for <qemu-arm@nongnu.org>; Fri, 17 Oct 2025 05:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760705357; x=1761310157; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GsEAZ2DsKyDisHfi7SKDKedY0mzmq7ky3j+DoY9yFi8=;
 b=JQhhP20noaFi+l7iWt6WA/rw4d3BukR14jm3EeYwVeAQEBLOpJJiXiHEeI0SUkXM7o
 +lwBLBqbwz6LsxYaQTd3ECB2q1/7YDmyuy3HDTH83cdzm6Ro5ExiJRfyp2lHT7JLMj13
 CqWJEJXBN2oqvcrWFOKabEiXV/FbxOPTkTYq8jVy1gKgmn+P6D8NUBed19wXYaOETKrS
 +c2cMXohO3q2snzzn/+MZLESvGCqum9c8hzCwLSQhd9pNvWw601fLN3nGGckrjLRHljH
 88dIaKm4i9F6CBWJLShtUgwfV0ANnjmNd4/MwNcqxq2HlzqYdrcJEM4ZeQyzNr++Plhw
 Hlqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760705357; x=1761310157;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GsEAZ2DsKyDisHfi7SKDKedY0mzmq7ky3j+DoY9yFi8=;
 b=NbZwRcBn4DZ/pYuY0COswhMuoazBxcyUIvIXjoQbTJHQJaiNSILkKQaIl8Jx/9OYbp
 qy3jULIp8CVio5KUPq5/mX7IhPU4bROzGQJB9ON3owbVtjiW8mCpSNzYsJx91VwX6cUd
 yeZd5uQJc7jJmnaEsQteoRRsbMJffj3kvTlb0FnVoJhGF5yM334FU7pfAfHhAuauTOBU
 PuP/p1OFVvRliIXeGdQvLGphDfPjhIQQsz3q/X6gDKktGmMkah0KQUFmJOa5PA9wArSe
 P5qTsusw6c+2MIaMMD1y6iLzztZbI8UzcWxsrHfIrrN4ygYSePQVO83tCfV/RyQhx0Lm
 XRUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeKV4HuMDTtVyYyynUkiFniPOwE+9chywTIUnQZjzU1nPuYR4M7KTG3LnHWVtOv9JomZR7INVNEw==@nongnu.org
X-Gm-Message-State: AOJu0YwfW2S9yX0e8rlXPQaxhG1MiQdjNmaPlE2zC6BOv98zSeTWTKvm
 mRbVhGHPHyD5XBWlPxFoCDByayk0SLyrPwB6nsRlb1gfhqosxjax4JiJ1BKf3Xd3/anCRiuL7cE
 2uxVIhigGguPqFlC3t76L/bZck/H7Q6MRK5BX1HRzjpox9/PSRECy
X-Gm-Gg: ASbGncuSPdFKwiC2Ckdjo2Qlurm7c06y3NB8xDxC/HZp9UJCc6n63p+x2ij8fYibGFQ
 Z0cgRkTyKYUO9doh8EqdwCUUefX6COECgo6ydM02wBDVsEDIwl1nsjPr6Q0x5luOqX+GbG3V+iG
 O8RobQfwa4N3Nns6LfGAlMM8f4TIeEu9siljcNZqOMR19XlSdNhDvNsUX+wSSBAZ3jz3rScR0AF
 msG9Oz0XlvT02UWfjBlgqnjd+ZP4G6ou9MZ2bEeLJJ9MmIg0+ox40Z0UU1o7w==
X-Google-Smtp-Source: AGHT+IH4g7/Rt0lLFJt/Wnu6hzc78mu7eCFcHBQuuaqw/uGsRD6ATDx7guH2+rYDCeeOseHk6gr4f2Wy24kv2kF5ATo=
X-Received: by 2002:a05:690e:1553:20b0:63e:1943:ce49 with SMTP id
 956f58d0204a3-63e1943d10amr1971887d50.39.1760705357334; Fri, 17 Oct 2025
 05:49:17 -0700 (PDT)
MIME-Version: 1.0
References: <20251014200718.422022-1-richard.henderson@linaro.org>
 <20251014200718.422022-22-richard.henderson@linaro.org>
In-Reply-To: <20251014200718.422022-22-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Oct 2025 13:49:06 +0100
X-Gm-Features: AS18NWBmhCSw_IoW6E7nADmkuUEQSEz9iLBGrikMmowV-AdehplNtCwRDWttjMA
Message-ID: <CAFEAcA9J-g1cKTXk_pv1AWLgx5YksvEGyAbL2Z6coB6=wA0dZw@mail.gmail.com>
Subject: Re: [PATCH v2 21/37] target/arm: Extend PAR_EL1 to 128-bit
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, 14 Oct 2025 at 21:19, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Do not yet produce the 128-bit AT format result, but zero the
> high bits whenever the low bits are written.  This corresponds
> to PAR_EL1.D128 = 0, and bits [127:65] as RES0.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


> diff --git a/target/arm/tcg/cpregs-at.c b/target/arm/tcg/cpregs-at.c
> index 0e8f229aa7..9e6af3d974 100644
> --- a/target/arm/tcg/cpregs-at.c
> +++ b/target/arm/tcg/cpregs-at.c
> @@ -353,6 +353,7 @@ static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
>
>      ss = for_el3 ? arm_security_space(env) : arm_security_space_below_el3(env);
>      env->cp15.par_el[1] = do_ats_write(env, value, access_perm, mmu_idx, ss);
> +    env->cp15.par_el1_hi = 0;
>  }
>
>  static CPAccessResult ats_access(CPUARMState *env, const ARMCPRegInfo *ri,
> @@ -496,6 +497,7 @@ static void ats_s1e1a(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
>      ARMSecuritySpace ss = arm_security_space_below_el3(env);
>
>      env->cp15.par_el[1] = do_ats_write(env, value, 0, mmu_idx, ss);
> +    env->cp15.par_el1_hi = 0;

I guess this is where the downside of not storing the
register as an Int128 shows up -- we have to remember
to explicitly clear the high half everywhere that we
have code that's doing an implicit-write to the 64-bit
version of the register.

thanks
-- PMM

