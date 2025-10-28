Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09DF4CCD1BF
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 11:30:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDhtq-00045N-KL; Tue, 28 Oct 2025 07:30:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vDhtk-0003xJ-0N
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 07:29:56 -0400
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vDhtf-0003m6-57
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 07:29:55 -0400
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-633c1b740c5so6231939d50.3
 for <qemu-arm@nongnu.org>; Tue, 28 Oct 2025 04:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761650989; x=1762255789; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SaBayW4KONq8CYUoOu1AyRovaWldoaExgXYlkxxcPMo=;
 b=YENP29JCiIUL+ccIZksZ11QByfzEb0evOg76acEWHIr61QXIp4ZHRk63Xl+vHboynN
 tVIcZye65oU43rMOTo1LLTF8xiCLkemb2fYKSAvZx0zkC9MkSuspajwR1f8SWEqeiOQl
 JoMvdq8x+fbXDkc0SArD157yRqoLvdx+bkYw+JoDXzd0eseo9ftAeuiDIGLRi3oWKjPU
 OUJwk0fo6uMdhNSj8zXpidGfW9gCQSw0SrzocRIaToigCBvslTFaAFmqfuc17li4cum0
 a+k56TeOcCuo5cb6FihNYQcBzAk8gsFC8/f8Fwa31tzVlh6ZYkk3m0z7jPxdj2KhtrRr
 GsUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761650989; x=1762255789;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SaBayW4KONq8CYUoOu1AyRovaWldoaExgXYlkxxcPMo=;
 b=kWJwj0/jdS3664ql8WagHSevqEenfyCr8Y3KeLBQnYZ06aQ6WEFfAOGl3JwbRGpFHA
 S6AGuUCGZ3kVizJudURyK4cFt+M//P8oKvk9RvWZmCdzNzzjCStePgpgSnbdKew92WB0
 gGaT4jqWzHGJU6RTw8MxmTOWfXegUPq8d28Iq2jBx7HsDU4ATanjsg1Wfqw9ZQjDG378
 0O4mm/TFHTZRMvvUzxx0oxR6ssVC/9UHTQCmB7c00yphk6DwqT17xBWz4yFQD1PaKn+t
 eaSY4hTlC/GCNjUZ3qQdI1f0bDgeGnhtAivcw36Q+k+WHt6ARF+iSkDzFT3OB6kEvBVy
 UuWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYDX5uyY44xrAsEEKCKk9TxZU1jG6gwu3Ka85aSjsNLvfRV8J9mAaTQ2EWaaunnUUodf1p1E/Z8w==@nongnu.org
X-Gm-Message-State: AOJu0YyhClne4IJVJmcmn6hYukXgnhRit2RgTb4WBBGdLbSjNsxnYrr2
 +gAn5qjZXy7QoBOp/iXK4DM3PvDXMSHeu36P1YXW8qfeGnpx428rvOj2kKozAfuiw+LE9Y3lKw2
 1GHvQDOpsaeDkKef+60aLvFFdxxRlw4XCLymoUMvSDQ==
X-Gm-Gg: ASbGncudKCF3mFjFE1tRehht/3JxNwZIz+SaIJy+5EQTAc0STDz7lLU1031iFG+35rb
 ATtwXsvLtg/XI+swQVaWz5zyL3ZGaeVsh34ifgoi4/CVysfertjA5uVmLARjqBb5Q+P9FsnSOBt
 FjmUPfFfDMWxhjx460ftssb2BkN8Tin8jgO8K3NVgQNAwm5GnvVZ71davEmrN9THwtSUtvdlmUP
 fBNoy6d5L1/rjk4xuzVCWQBeUba1s/L55SRZBOqE7z5JLHbvRCzrWVwxshP70pKJioeHlML
X-Google-Smtp-Source: AGHT+IFNpmH2i+8gBelWzPJAeciZgxXUN7gk4SRabDUG1jmAhjauZIRm866bbhJ8V/JO9wCbwX39LW8+n//EhEJUdGM=
X-Received: by 2002:a05:690e:c4a:b0:636:15d5:aae5 with SMTP id
 956f58d0204a3-63f6b9473d7mr2878669d50.10.1761650988052; Tue, 28 Oct 2025
 04:29:48 -0700 (PDT)
MIME-Version: 1.0
References: <20251028054238.14949-1-philmd@linaro.org>
 <20251028054238.14949-35-philmd@linaro.org>
In-Reply-To: <20251028054238.14949-35-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Oct 2025 11:29:35 +0000
X-Gm-Features: AWmQ_blxxZ3gWaPxQMNnD6TbCUe_VI-t6L5mI1hjUFPPJ7QiZLDX4MHfzlsbKWM
Message-ID: <CAFEAcA9iTnb2hfXV1OwXiRUVaTtX+VqXdF=PyKDgqkTqQgt+Ng@mail.gmail.com>
Subject: Re: [PATCH v3 34/59] target/i386/hvf: Use hvf_unprotect_page
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Mads Ynddal <mads@ynddal.dk>, 
 Cameron Esfahani <dirty@apple.com>, qemu-arm@nongnu.org,
 Roman Bolshakov <rbolshakov@ddn.com>, 
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Phil Dennis-Jordan <phil@philjordan.eu>, 
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Collingbourne <pcc@google.com>, Alexander Graf <agraf@csgraf.de>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb129.google.com
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

On Tue, 28 Oct 2025 at 06:06, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> From: Richard Henderson <richard.henderson@linaro.org>
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  target/i386/hvf/hvf.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
> index c0b2352b988..1e92e9b707b 100644
> --- a/target/i386/hvf/hvf.c
> +++ b/target/i386/hvf/hvf.c
> @@ -139,8 +139,8 @@ static bool ept_emulation_fault(hvf_slot *slot, uint6=
4_t gpa, uint64_t ept_qual)
>          if (slot->flags & HVF_SLOT_LOG) {
>              uint64_t dirty_page_start =3D gpa & qemu_real_host_page_mask=
();
>              memory_region_set_dirty(slot->region, gpa - slot->start, 1);
> -            hv_vm_protect(dirty_page_start, qemu_real_host_page_size(),
> -                          HV_MEMORY_READ | HV_MEMORY_WRITE | HV_MEMORY_E=
XEC);
> +            hvf_unprotect_dirty_range(dirty_page_start,
> +                                      qemu_real_host_page_size());
>          }
>      }

Subject says hvf_unprotect_page, code uses hvf_unprotect_dirty_range.

I assume we can just fix the Subject.

-- PMM

