Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4254CD98DA
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Jun 2026 12:38:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZT40-0005hp-Hk; Tue, 16 Jun 2026 08:38:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZT3y-0005hP-6L
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 08:38:42 -0400
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZT3w-0008L6-Lr
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 08:38:41 -0400
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-6626b5ace23so4107482d50.0
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2026 05:38:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781613519; cv=none;
 d=google.com; s=arc-20240605;
 b=IagaOwLk+m5WYCyF2ORe6ApdU2jeppU8FLXFbvvqP4hyJUeF3Xqv2ygOPCC4Q1M9/m
 ULxKYBhWx6fGWJel/KIg4bcwMIHg+gvaIlO5LyQSiuzCQW9YY7byIIPI2WrZ/JrD6+Yf
 p7sWkVm1rZQb9VLuWYMKqKwagYqwH/DOvWqq+4Azs8AzJcUBEnWB5zJOpcZrBDdc6AW6
 ALjj78/gcR+XE3JBa0Q7ILfIlyxrHA1aveP/EQV1dODCRZ7UnF2jn5aKxK5NF15Y1h0n
 Joqkx11WhLy3M+B3yVLSMLV6bfFRrmxj6gp0Evwjt7K8sH2G2Bjv6CCgGsStSu3A/xG2
 h0rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=s/ORHAUaOxzVNXO7cpJvSVqKmyyKMS7BCx1X2sI8mhg=;
 fh=koodpGSlhEQRO1+J9YdS4jZCTUASzaDE4n2IkUkKFu8=;
 b=Gf1xbUXwpas/O0rXMqYrYECxZ2L49tf4xx8O2M1bbedncKneK4nvu1y1RsR3Ck/5oV
 7wL3IoFgPtnS+y+kqYDSCiwHMx1rGIyeVD6IHTa33yTzQcAofGu3R6n4jh91vb0UcklG
 +KXLvtWlVb8wq8htYYUDUfaDEt1xzN/te3BjzwC7lGJHo51xGjebbR/dul2lXVn/vrKq
 Die1gxYhXs/L58HS7B66Iahp5Kws0eygw4pXsrR9us9GGLz2ESX2TWRpuXJ8ztpJLl8F
 h7mnka9AThjXRgmaHAR2k2vAV+ds/+xQURqpKfhMvP7OTQ0xCaKCIsEz1TQLusfn2IqT
 n0ZA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781613519; x=1782218319; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=s/ORHAUaOxzVNXO7cpJvSVqKmyyKMS7BCx1X2sI8mhg=;
 b=OfPCMbW4FV+adRMVKguYybzCYL6NB8GPew7aIqsUMVX3GryFYkTS46cQI4ZzvURGMK
 gEUoJVhiWEnUbJjMxCbYWPdy/ExXzS+hiyp2HstgQHkZZXdLtu4dOz9cEDIka6yjgcJl
 ms0rfUWb6mlJ+9r5OMiSO8eKLg4B0JiNZqDScGAn/5WZg45yQFMJocwcTwyRT9+MRVyu
 JehMyGvDfFtiGi7PFh70VfQNKxdON5EyN1wIdpt+n+oIgkVr7BW7EWYTHvF2eahoLj10
 jJ7MOlyGCaaEp/pN0pcXV9KI+jxebX6hgCK56Gu3WeW1JdSN4iM9X6jC55Pl7rALSpt1
 61RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781613519; x=1782218319;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s/ORHAUaOxzVNXO7cpJvSVqKmyyKMS7BCx1X2sI8mhg=;
 b=Fb6iV7uWqKN484hHMdXSCPen6SBW/GJOqlx/amZiAdhPWZ8WY8fxsAKSvnrFMZ46IO
 hVFXHaMOPKaMWHDF0OLr0zWiT7C8yC+1PNU485yL0Or34loazpcrpwxRUPkZg1M8PRJO
 D2ms5aFlE41T7RdnZXol49E8VTGiPx7rHyyrmTVbHXHTCQIVtpTF2+BFMwmVFY2cSwLQ
 UEUU85V8SpAXjjt4KVQTF6zPsVHhERilsb+SHm+INgCgs+MBZgtAdcc6alAObZkTVDim
 FOjv4nZKpb1A47vrmZozQTabSmpCK0DITyWlsfbgeRC3KubtHqmtj0kRA1bjJOberHpl
 OAdw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8HDdjv/4eTkeXm+jSM9ymvOvDojXN/vtUlO+Gtg9BlVtHgT8mQfu/fRoDPCNPc3fRNA2pY3A06jA==@nongnu.org
X-Gm-Message-State: AOJu0Ywy7dpi3YLHcWst0WORfQXaKb0/vk4OwzjSc9Uo1Y7MvFzCLNzE
 Ojt6tvP6qkwopyuegUIyRtt1knsOD7m1/6cn1RU7wTM0zXqqQMo2Jdq9a9JjisdlnQAF1sD3Xds
 yEDVRRszefa3Cn+FdVQgSYHyBfqRUjaJ5wnhC06K/tg==
X-Gm-Gg: Acq92OGFlygNMVGSA+41Wvl2wpQH+ZnXrk/PCZT6Y3JqXYPdv0seOJJXgZ/8gV2Ls9r
 ngfcSui/GaBiPKri2h0WplzZ3/fPR0+xHLFQhoyw0CLrnWufqXYZYIcvn4cva1gNKTM6JP199sT
 lfyeLD6/jBvTqT+ywCr+pDV5Ia2+FsfqMrOJJ8n6kT3phrMZ4kfq2Dz98n4dxMsy1qMwSwjPu7z
 pzCX4Ix8LuPIpQhOLf17fi2O7HLaiKrUZsPZft0jb7EzcxTTIg+qIqrOnfs7i0c6yAep2Ch3IrN
 up+oH487ReJ4ODQC4E/LoAOoBl13pjywIEj1wNxNEm2sV5EA4K6c8WqSzfhuQigvt4w=
X-Received: by 2002:a05:690e:418d:b0:660:3c35:4669 with SMTP id
 956f58d0204a3-662b49e856fmr2289011d50.19.1781613518944; Tue, 16 Jun 2026
 05:38:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260604234852.573178-1-richard.henderson@linaro.org>
 <20260604234852.573178-11-richard.henderson@linaro.org>
In-Reply-To: <20260604234852.573178-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jun 2026 13:38:27 +0100
X-Gm-Features: AVVi8CdFRkwdKKw21Bcn4nrmxhewkBQYj_72nFDlZoU97MefUFxKJpoq5S49pjY
Message-ID: <CAFEAcA_w+C9w23UmYSv9ByvukNYRXEkCg3R05q_rdVSCK-7D0A@mail.gmail.com>
Subject: Re: [PATCH 10/25] target/arm: Add data argument to do_frint_mode
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb129.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, 5 Jun 2026 at 00:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Prepare for needing a non-zero value.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-sve.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
>
> diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
> index 083b70b487..e9c0a73e90 100644
> --- a/target/arm/tcg/translate-sve.c
> +++ b/target/arm/tcg/translate-sve.c
> @@ -4656,7 +4656,8 @@ TRANS_FEAT(FRINTX_m, aa64_sme_or_sve, gen_gvec_fpst_arg_zpz,
>             a->esz == MO_16 ? FPST_A64_F16 : FPST_A64);
>
>  static bool do_frint_mode(DisasContext *s, arg_rpr_esz *a,
> -                          ARMFPRounding mode, gen_helper_gvec_3_ptr *fn)
> +                          ARMFPRounding mode, int data,
> +                          gen_helper_gvec_3_ptr *fn)
>  {
>      unsigned vsz;
>      TCGv_i32 tmode;
> @@ -4676,22 +4677,22 @@ static bool do_frint_mode(DisasContext *s, arg_rpr_esz *a,
>      tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, a->rd),
>                         vec_full_reg_offset(s, a->rn),
>                         pred_full_reg_offset(s, a->pg),
> -                       status, vsz, vsz, 0, fn);
> +                       status, vsz, vsz, data, fn);
>
>      gen_restore_rmode(tmode, status);
>      return true;
>  }
>
>  TRANS_FEAT(FRINTN_m, aa64_sme_or_sve, do_frint_mode, a,
> -           FPROUNDING_TIEEVEN, frint_fns[a->esz])
> +           FPROUNDING_TIEEVEN, 0, frint_fns[a->esz])
>  TRANS_FEAT(FRINTP_m, aa64_sme_or_sve, do_frint_mode, a,
> -           FPROUNDING_POSINF, frint_fns[a->esz])
> +           FPROUNDING_POSINF, 0, frint_fns[a->esz])

We seem to not be very consistent about whether the function
pointer comes at the end or before the extra data args in
these TRANS_FEAT invocations, which is particularly noticeable
in this patchset where the earlier "add a 0/1 indicator of
zeroing" patches added the 0/1 at the end, and this one puts
it in the middle. However, this is the arrangement that
the existing arguments to do_frint_mode() have, so

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

