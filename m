Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61787CDE008
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Jun 2026 09:32:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wd2uo-0003Ia-Un; Fri, 26 Jun 2026 05:32:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wd2uh-0003GQ-31
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 05:32:01 -0400
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wd2uf-00015V-IH
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 05:31:54 -0400
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-66388bf3793so786277d50.2
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 02:31:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782466312; cv=none;
 d=google.com; s=arc-20260327;
 b=HmDykUqylGU/9r6Moz18/Ow/4kJBl4fYI8k23DwpUkwOxEV5kaBaoS8lAh9HxDfW6V
 UuuZl4hMvkF4IUs60F7N3a/k29b7uh+uhfy/XUjGaoi1ZBHhzkDG8M+QEPoAPk9S6zu2
 hWKmL7VM5fHRiI/DZtknoq1BS9U3isHJnkIZ5gj5b4PSG0SkyQZ4jnBpGE8ZsF4jOWzo
 jrHtMA6rwSX1yOqSBdDpIkMVWc6m28ZNG/2baRkzvEr1cBZvr8p9njfFmuO7oadR9we/
 f3hc1dVpfKzkor3WqmPKisBIGMsXdWBk0f7JgyctlLfjQwmQEmJ2XGXKpYAYF+O9ajKS
 ywsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=anzMaGLv3SjUYf3ORAILJUaQFKa6Pr43gCSes0FQBtU=;
 fh=RPCODgg7VNyI7YTsIKVMqSOCPwm4nVo5gfIwv5I90L8=;
 b=q+34Om0ijXFXtx/OYbn/ouwS8618ELu8A/s5uZ/CYf12dq7WHEZtza146QAJAOXDv2
 6pk8fPhjhjM/lbItBzqLTCYlq4Cd6kbG7oGM5xfHkYiBZ0RyEQuksf7uLnr4T7guG5Ps
 66P+xndNQ6YRBtVJIVAADmYYt0cj5MEl/Js+RCAZh4faYowI+jcY0y40ML/thusWjNVV
 trthyUo3z6XBChH2rwkqyasDfV9bS8HI4POMTJWhrzMsD679dxYQGxJ5We/Eaqf/vx/l
 VxZIq28EhLf6h6KP6zuUt2nd7QBN7ds8XXSvgBiJcXj69e8CEoq7RBBFCaY5K1In3c0V
 X+hA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782466312; x=1783071112; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=anzMaGLv3SjUYf3ORAILJUaQFKa6Pr43gCSes0FQBtU=;
 b=nurDVeQKuv2jrbxnfn+bmX1xCj9VBUUmxANPQATcbRqzfamUHRnVWiW+EQyOouqQgZ
 5AEgWTy74JUG4R8WtkCc2J6pUPT48vSVKdaDz4bByzhVJs4hPL5+E7yOPMs5jqYqb993
 sVq3Y7nLySBvM5ixm2VRuHWbMcAsSZkr/WMv0Hxh5SGjyp7RA269NWZFkq0BZZ6GrbXP
 Bvi83vLBWQU8jrx3j8yN0C2CNSwOvFvrRxhobf8pySwcv6JCkEQFDRtJvv3DhVDhpbJM
 5U1vZCZYQCPZQBQMnf18CPQX2gY10/XG/2Tl4jrzJUdYXV0XUwHfW2pzmV52zlf2Sbpz
 PFdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782466312; x=1783071112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=anzMaGLv3SjUYf3ORAILJUaQFKa6Pr43gCSes0FQBtU=;
 b=aKjv79jc/eAO743jKCL+aH4nTQLhdysRreUUOEQEERHouHa2AUFpzaHLSufEJ4mzwp
 HU/ZGmyNstahP0C9nMgkjJbGXPBiyKztOAFw22xwU3jlaxdGsBDWXJHsLv+Via9/eRKd
 OVw5GusVzcCMgvj2T6MwSfWU0WktAD7DYNuGONfG8HQq8xE4jaL9Kt9kw7t2Peyl32OC
 bhk7Ki1vkqPMpTFfML2Jokg/LjtmpyQ8tKsL1CPRg2SxlNzd5O1NZxNmhJjz2ZqRvoDT
 XzL6vy4n2FXJ5vlZeqq9DeZO3mZnyIbnimR7bVUcyCdhdU6CrtFEkF6SwOBGFO39P/tv
 GyTg==
X-Forwarded-Encrypted: i=1;
 AHgh+RoRog8E57IekanhOa5Ee5CFgRkoy8BaE6FvqPYR//+jxo5FIX65x3qjeWg1q+P2iHkchOiXljBqMw==@nongnu.org
X-Gm-Message-State: AOJu0YxFz/Ylq629bHC1+Gs6TSl7Um8DZ8sBYttArOjGjsGIjswgEDGE
 0Wi40ex9GUpjZaHAl3KW8M4EDR3mm58x+jxd6M7uqQ5qVx5fPn5EB/UpxkXbfgx+Q/uHdDfsMHi
 7zo1+JZzc0I7aT1sRO7CIzgrHsjoxy2RZBjt1AKhRWg==
X-Gm-Gg: AfdE7cnLh3QYJWf1zkEKHMSKpr99SvubiGcpY4obswihhPi/Gt3LT1x92uVK6Sf4PMh
 a8Zcfs1wiyHTTalmD/sECk+spk4+rfoZa396fHogYDkwoD0inMwvi+FxtQlWpZl/MrG/Oho104/
 c27pX+j7Ft3BrSme9zNAlqLDPrwhdpYUZD9TCz+0OHK+5IdP2FYV1QRDtkFFEzCNDw/YLfDne7B
 wT9i6vYJChuP72/WtHiT3xGqVFWTQFuHr5vk3gC/npji/YZG/onBwJWlu4DVpIsgFV5o/hNyp7B
 KK+lRpntWpTWkUjCxBzEnkm00Y+XfSs8DcU/WYQeqJkQby9KpwtOKLMm
X-Received: by 2002:a05:690e:1207:b0:662:f28b:7c63 with SMTP id
 956f58d0204a3-66487e77653mr4688202d50.63.1782466311977; Fri, 26 Jun 2026
 02:31:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260625224723.766270-1-richard.henderson@linaro.org>
In-Reply-To: <20260625224723.766270-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jun 2026 10:31:40 +0100
X-Gm-Features: AVVi8CfBEbcv0T26ZbVFGbyX0iMZQwkEPA02gc_sXbTNkaF55yYv5OkVlccxgMk
Message-ID: <CAFEAcA_LE9O0Ax0AKnsJi-7FAxfmcLxxSYrOTUU-VYmgJEaKEA@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Implement and enable FEAT_SSVE_FEXPA for -cpu
 max
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb130.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 25 Jun 2026 at 23:48, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


> --- a/target/arm/tcg/translate-sve.c
> +++ b/target/arm/tcg/translate-sve.c
> @@ -1373,7 +1373,7 @@ static gen_helper_gvec_2 * const fexpa_fns[4] = {
>      NULL,                   gen_helper_sve_fexpa_h,
>      gen_helper_sve_fexpa_s, gen_helper_sve_fexpa_d,
>  };
> -TRANS_FEAT_NONSTREAMING(FEXPA, aa64_sve, gen_gvec_ool_zz,
> +TRANS_FEAT_STREAMING_IF(FEXPA, aa64_sve, aa64_ssve_fexpa, gen_gvec_ool_zz,
>                          fexpa_fns[a->esz], a->rd, a->rn, s->fpcr_ah)

The FEXPA feature gate also changes to FEAT_SVE || FEAT_SSVE_FEXPA,
so I think we need the second argument to be a new feature
check function aa64_sve_or_ssve_fexpa.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

