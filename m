Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A2F4CCA46C
	for <qemu-arm@archiver.kernel.org>; Fri, 16 Oct 2026 14:06:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHiZm-00071Q-1f; Fri, 16 Oct 2026 10:06:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xHiZU-0006yp-Aj
 for qemu-arm@nongnu.org; Fri, 16 Oct 2026 10:06:12 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xHiZS-0004jl-EE
 for qemu-arm@nongnu.org; Fri, 16 Oct 2026 10:06:08 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-6b1f4d8e09aso2602680a12.1
 for <qemu-arm@nongnu.org>; Fri, 16 Oct 2026 07:06:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792159565; cv=none;
 d=google.com; s=arc-20260327;
 b=W3G2tNKriQzHl4xKWktkcKqC2wteU/Y+JH09yzV0wASPws8F6fQOiiPTJGxnJ6E/Ow
 5bp+Lz9u49DT5CXe3AzdKbiRCSK6FYtaushBioGuWG25gzLjOc5kwaI5Wv1KaJoGxqrp
 wETaWYkFNJrmuit+5F1MMxoVS57Pr1LlmSKpCm44yJJisoHHwgejWVMXguPmbx5vPPY2
 DZP53Vf4uKrX61Gqcn04OOItuN+7BH4wcQuyMWbwxUInJZIw2/UcUERsf+j8vErlEoFz
 Y56wGuU/KKXVmaLDm0YaTq/qzGkjNWm/JIh4owvIS3DIsMi0g+q32sqKXnQloEMDGkUJ
 IE5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=J9IImW9GgYpIi/RCk8fzQ0zy4Zwv383B/5op/lAYV24=;
 fh=gCxWFGBYbOvWej1llYRIhJQB9Me42BUfBM7sJjMG6QI=;
 b=VWjlpZtKH+/x4v9clS5b+RTxrl6uBJoMQZ4UQ1ySXe+g3KdUQRRzLz9ahICKZ5hf0B
 KNFwVAMoIs4/PpJFTMNkH4M29Pcq/vUOZhkAblmH6St8S9a5YezM4/LQYqnq5Y1aryBv
 s2G5p7bG45yVdyDv/CkOY1RnKRZS86M/0B057i2R+djcy8r+H3Yb6AFrrhHXLXH7Bzwk
 fsGvraMs09Z79rJMWes4UJAuhpPNBEgaCTEaoeBr2HyYoOYHmykVu1sq6+4qg/SDYKxl
 rHkJDvt/93ft1GlRWbQo4l3ZG+9g3wbNSKFC7QzgjgfgFWfOHxYVdkcl9YR5ki083gf8
 qXsA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792159565; x=1792764365; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=J9IImW9GgYpIi/RCk8fzQ0zy4Zwv383B/5op/lAYV24=;
 b=OIMtTIZwfQ4ORk6ygTzGEIE7Lv64oLpfsBmb0TUzXL0Mk4Z/4xe8oOusxdqwn+WaXw
 UhQkVmP1lTCRrtVtZhITTu2zQ73ShlD5HjgD8QFqjYegS1fCUPG+BU8TQt6aC0T/o+0g
 efSiOswEzolnz9tFp9rh3r+ito3t6917GU/H4NjYvvij/X8GRU+pAJzq2BAcpkdE8HmI
 en7UowcDJSVfwm4Lrs/mxRBg/XNehu0lzovPDIXBm6ZNxWuJuMkxj17vfdWekeiQ1R9z
 uVUWcmjKrSiGsnzoAt6p8zRbw8LsGeBusuqOPJz1/Mmqcx6VKKYzwDzzWe6nrBI/ZTuH
 qokA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792159565; x=1792764365;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=J9IImW9GgYpIi/RCk8fzQ0zy4Zwv383B/5op/lAYV24=;
 b=bYbEDr6bPaDzH2cqBF51Fx4XIhtDA4emfX2Sa8BrHQ3LifFfKd8lHOlqTC1OTm0jVW
 43x7ej+Y1BBcFwkDq9NSqmSCarYX/pwCVnEzFdntSsild6LpBjYu0I8qYNnnhZVM5eq9
 JYPDgcdDaiYod8qUcY/S4xo7oj7F5TLJPovClwYqDM+l2zfLOUW7eo3EhQg764m0p2dM
 WKMWgDGRKgarjs1IMTQs24f/+SUgdSCwb8jTelen+POIsd7Tz9IKme/6qWj8ErV/zOQ+
 6d4WW5F8TlmzGxot58q9oNcwVALfkq5zGIGlV7v1XmanDsZILbqwmsvFQK/TUsfX4jiQ
 E7lQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBygo6WT3S3BWWjsI8PPrhtemyi1CMqm+LTy6tZr0NaIrLQQX9SZ8vM9AmSWS4eW5zVMkxElAPOHBQ==@nongnu.org
X-Gm-Message-State: AFq9FYLXzdno1QLWehXG1OffOEtIQeHOVlfh7JdnUELrLLCwFi+5paAN
 UYuy8FwKv9mvOIf2RQH6CVmF1hXTZE5TnonNz3J0b87L/lHQPs6CO4K0Ab0Q4+dfOfR6FCW/wSM
 uNiYeQmmXwW1ukr6jYXZ14I+EMJ86BVY=
X-Gm-Gg: AYBFou0btP6kR7kIA5fNO8gvB9hP8PUq6UjOxnuZ7rLXh9BifXxDWJykZvKD9bpmihe
 OfLJ2EtTCdfNYGfg/oolgf0IXM+Ri7leRl683+oZz+jkmtBSM3RxY1XAqbWTvML9GC7Hjb9+WyX
 DNL+ycuxlKPqlMTGjesZogNmK6O3gicgF/2xMTJYTTjyaRQzgYJYh+U9CJvNwnguPChhQEz8ZjS
 n20jZdYI0TOCYNezdytzNj8JJGYg0dhysOB8lN2KrhCIVz0ADfqLHhIbLkFfQDa7zVk0LLWRFjC
 kOu5KlqTEBBpfiWiAcgLFLvE9ymIWFix8eafiYmDp6YWl8kdQlpQplE=
X-Received: by 2002:a05:6402:400f:b0:6b1:c526:afa8 with SMTP id
 4fb4d7f45d1cf-6b1c526b70fmr10556282a12.9.1792159564415; Fri, 16 Oct 2026
 07:06:04 -0700 (PDT)
MIME-Version: 1.0
References: <20261015044104.879-1-luoyonggang@gmail.com>
 <CAFEAcA8n9E1jpcOCat0kzv0Q++x7YwK_MNJBJ0qGdtX1-As4zg@mail.gmail.com>
 <CAE2XoE-fgq_c9qONyvfbNi3Ys_hv7yKvGCkk+Wz+rHPW0p65Eg@mail.gmail.com>
 <077274ba-002e-4241-9158-13a3270bddaa@oss.qualcomm.com>
 <CAFEAcA-mii9S1NvhKOt=pMha6-OQKheYj7FuMaDVbV2Eoi-3bQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-mii9S1NvhKOt=pMha6-OQKheYj7FuMaDVbV2Eoi-3bQ@mail.gmail.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Fri, 16 Oct 2026 22:05:51 +0800
X-Gm-Features: AclHuK-LdFdTnzXiy5jqe912RkVRxxCOyAwgNKxP22ZmT1O2AJBfnTBnW-lNw90
Message-ID: <CAE2XoE9W+vohRokJ=ePFesJpiTg7hfjSH3c4ptAibFPxAtv8oQ@mail.gmail.com>
Subject: Re: [PATCH] target-info: dispatch CPU QMP, dump, monitor,
 and Angel semihosting
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Brian Cain <brian.cain@oss.qualcomm.com>, qemu-devel@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org, 
 David Hildenbrand <david@kernel.org>, Glenn Miles <milesg@linux.ibm.com>,
 Zhao Liu <zhao1.liu@intel.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 Cornelia Huck <cohuck@redhat.com>, Weiwei Li <liwei1518@gmail.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Bibo Mao <maobibo@loongson.cn>, Artyom Tarasenko <atar4qemu@gmail.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Song Gao <17746591750@163.com>, 
 Chinmay Rath <rathc@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Aleksandar Rikalo <arikalo@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Eric Farman <farman@linux.ibm.com>, Philippe Mathieu-Daude <philmd@mailo.com>, 
 Xianglai Li <lixianglai@loongson.cn>, Chao Liu <chao.liu@processmission.com>, 
 qemu-s390x@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Matthew Rosato <mjrosato@linux.ibm.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Laurent Vivier <laurent@vivier.eu>, 
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Reply-To: luoyonggang@gmail.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, Oct 16, 2026 at 9:56=E2=80=AFPM Peter Maydell <peter.maydell@linaro=
.org> wrote:
>
> On Fri, 16 Oct 2026 at 14:51, Brian Cain <brian.cain@oss.qualcomm.com> wr=
ote:
> >
> >
> > On 10/15/2026 4:38 AM, Yonggang Luo wrote:
> > > On Thu, Oct 15, 2026 at 5:20=E2=80=AFPM Peter Maydell <peter.maydell@=
linaro.org> wrote:
> > >> On Thu, 15 Oct 2026 at 05:41, Yonggang Luo <luoyonggang@gmail.com> w=
rote:
> > >>> Put query-cpu-definitions, dump notes, monitor, and Angel semihosti=
ng on
> > >>> TargetOps[SYS_EMU_TARGET__MAX] and look up by target_arch().
> > >>> Keep the table in target-ops.c and with a stub
> > >>>
> > >>> - Register with a QEMU_ARCH_* bitmask so shared base-arch objects
> > >>>    can fill both slots (e.g. QEMU_ARCH_ARM is ARM|AARCH64).
> > >>> - TARGET_INFO_CPU_OP is type_init. A NULL member means no handler.
> > >>> - Drop stubs/qmp-cpu.c
> > >>>         stubs/hmp-cmd-info_tlb.c
> > >>>         stubs/hmp-cmd-info_mem.c
> > >>>         stubs/dump.c
> > >>>
> > >>> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
>
> > >> Too big a patch touching stuff all over the place with
> > >> insufficient explanation of what it's doing or why.
> > > Oh, sorry, I post is just for demo(DRAFT) for other place to
> > > reference, but git-publish have no way
> > > to title it(maybe because I use it wrongly).
> >
> > git publish has `--subject-prefix=3DPREFIX` - that will let you qualify
> > this as DRAFT/RFC.
>
> It's also helpful to edit the commit message for a single-patch
> RFC so it's clear about the purpose of posting it (or to provide
> a suitable cover letter on a multi-patch RFC). "Just a draft
> to go with this other discussion" is totally fine, as long as
> the commit message says so. (More generally, an RFC should say
> what you are asking for comments about :-))

Thanks, I'll take care of it next time.

>
> thanks
> -- PMM



--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

