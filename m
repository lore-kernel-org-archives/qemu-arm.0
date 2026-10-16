Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1494CC6B38
	for <qemu-arm@archiver.kernel.org>; Fri, 16 Oct 2026 13:57:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHiQO-0004Qb-H8; Fri, 16 Oct 2026 09:56:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xHiQI-0004OF-GY
 for qemu-arm@nongnu.org; Fri, 16 Oct 2026 09:56:38 -0400
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xHiQF-0003gt-I4
 for qemu-arm@nongnu.org; Fri, 16 Oct 2026 09:56:38 -0400
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-6767d92cde6so23103d50.0
 for <qemu-arm@nongnu.org>; Fri, 16 Oct 2026 06:56:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792158994; cv=none;
 d=google.com; s=arc-20260327;
 b=oqDkKubzFnjcq/GKVEKUKevjz3oFOqDow0R0yyPAWAwvXNUDENnRnVBXrmG5AexbDV
 hXxG+UpB+Q9D0GJe+n1sIo72Ji9ZVLRG5SSohRgKw36kK8WXOX/UxUUMWzNUevxsoFd+
 NWj6pNixRObyx/Tu9TkW2iCdff+egGQeuKPG4AE9BqEc34SrokMH9odswenrH7aZgPZZ
 AL07JSq9Du09j+aHjvOtI1bN2/EnnTuvWJlgqd6liyOZOxFmBqVxzBf6DoiFuelvHLo3
 SUWGERuwfxboGzUGKzqW/2U36gSfDE9Uu9SNSwNlCK4cbGGqX6ja4WWHfG5Kwa3o9Ukj
 q7QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=fTdKnUdCFdyXZeAX9yFe/q/eC5y0O8GVJQgxbqY+Rz4=;
 fh=KmrbDILLKzbVQtYMBM0XwyQ1uV1rpWp479dsY54huRw=;
 b=schkgk80Zqtavcv4tQ+prGh5390MJov38t9R/RfetrB2NjwDc4Gol/K+6EeBPn13hg
 XfJszy4wCzZhsJraQaQck8PaRFNIsYGtqdfkszXZG2ECQw1Rmtzqc3qX6YwqTJzzh/+U
 baSGHravnAUeKngo2MaVxCQCcyRtgPMM/idKfOapwM3D72S7L4ETqBH1TLe+C4QwbZ5h
 e9p8/JqtnJl+5dGCV/Wj/V1fuHXBtD45JW/0e6yG+BryTrwDJvoCiDg1J8ZjujtPC01i
 4BiffNqfZ/PzrVMIsR2kbm8oBMrlfyt1QCpCxitLPujYb6w9MZI+ST03FQb9nHxJETkS
 0CPQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792158994; x=1792763794; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=fTdKnUdCFdyXZeAX9yFe/q/eC5y0O8GVJQgxbqY+Rz4=;
 b=Q0+vhXY3Rt+RY+oJUxClce2ZGfVQZyYPR3az6zu0zYL6bREHbf9XpeGcRv/GJOEvPd
 TSqheX1kuC/I+L54FTjjKbEIJ+sttI8j5DRjuqR9SX419XqyjF4ORu5VpCI0TZeq7N1I
 U1+mfu1g9NSSm9cf3qb9/FFIPq29YEI48xm5vGn+81MHIoSnToYmsmvMc9cmHK7CzlZn
 r+8pp4bFAQae+V+aMj/iAKYJk0WC4LwNmt/xMbfV/FqxVbTSUdNUyMQbG9a9J1oi+zsX
 ErQfC/GZvsHLoCxktFFZyp1Zf4XPZ7d6/0BsIEiEClURShqMOobh0nHlst2E+nH3yAMU
 87ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792158994; x=1792763794;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=fTdKnUdCFdyXZeAX9yFe/q/eC5y0O8GVJQgxbqY+Rz4=;
 b=Uxb4iN3q54qK4eokv7p5LSFpcXw5371qschj2/xcQiNLWuJGLNTJmXh+o9TZmAMkZ6
 HY3AMKXM1xHx+eQ/gggVhJ9J9hysMzim4FoZKOpCN9z3/K3T1O3xAEerA+gZmtyho3/M
 eMEN/mDvlWc3TSCx05C1Dwi79wVSTErRvN3nijFRp8ct1ugct0vl1hwTE+XTyXjOyf8U
 ccSLgFicfLjAj5aiRcy5rbgYXvmhgq6QeAyqjyK3NHdJIUQbh7bgHn591IWYNvMLS4Hm
 HToNPtV7sODGzCKvNkTblnp8J/RyptC1E5JAxWdc6sBKaa45jPDp37A32YHNlH8MFzkn
 kEDg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwVaJyKTid1kO6Sis4NH6i6QGtpzlv7ad8F2n2wj7XzOWWcVVdS+Il7lkW3BXh4OuR2yOeJDNlJdw==@nongnu.org
X-Gm-Message-State: AFq9FYLp5qb3m5uCbPqZRoQb597+gGOaHuj4F63pd5DEvTr+jX8MJ01C
 xkVdhtfr/AEuBwZyp1NOzgNCQ5XqwexLroJSw4T8WpjJEwiLb5kz7gnX8jUz+9T2ZIjZs4vxfUJ
 PsUiiy4pNxYKt4XHL6/V0JpR74U8JXZGl7saTvNWuiw==
X-Gm-Gg: AYBFou383QVhyPxn+vRz3GFKb3AyAyxe2o+BmY76Q7HXHsskmz/ZB5ugrr1pm9z/VIl
 CBpNg2tPMDZ3xJVUZnhqtuuUOdjzW5tpu4CBKX24PTQPwAXAQxXIMiRVSTxK5ELAO0AOko4bLC8
 ZVJ6MyLh3gIzMYCN3zcnY79rXTCnLjL5581+exfKhN1WPTMa02vFhVP2O/Zn7S8fCDrnEm2P6Wh
 35ezAB2T9gZ7pTEdXJpxFKGPZw4e6nBe+AHZzXfiXuF/68TxxRhbGhSG0JwWfzLNMaLXbWht5jz
 uaHihCEl4P8rj07VSdixbt5CTwgHsA9pcIkgWzd62TKNzy9eX4abnsv86M+aNb1Pekq/7tjd+rA
 oLjRoNCTVvTZdy4BM1HhJYY6geJVUEB6J99efwWA=
X-Received: by 2002:a05:690c:e641:b0:8ab:48c5:cbce with SMTP id
 00721157ae682-8b0f217d65fmr71687b3.32.1792158994114; Fri, 16 Oct 2026
 06:56:34 -0700 (PDT)
MIME-Version: 1.0
References: <20261015044104.879-1-luoyonggang@gmail.com>
 <CAFEAcA8n9E1jpcOCat0kzv0Q++x7YwK_MNJBJ0qGdtX1-As4zg@mail.gmail.com>
 <CAE2XoE-fgq_c9qONyvfbNi3Ys_hv7yKvGCkk+Wz+rHPW0p65Eg@mail.gmail.com>
 <077274ba-002e-4241-9158-13a3270bddaa@oss.qualcomm.com>
In-Reply-To: <077274ba-002e-4241-9158-13a3270bddaa@oss.qualcomm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Oct 2026 14:56:22 +0100
X-Gm-Features: AclHuK8ssUU6FVTl6l9wX-3cDpH8rijJrXQJT0ZI9oWF2AtJ-fysQFU920oTZ_w
Message-ID: <CAFEAcA-mii9S1NvhKOt=pMha6-OQKheYj7FuMaDVbV2Eoi-3bQ@mail.gmail.com>
Subject: Re: [PATCH] target-info: dispatch CPU QMP, dump, monitor,
 and Angel semihosting
To: Brian Cain <brian.cain@oss.qualcomm.com>
Cc: luoyonggang@gmail.com, qemu-devel@nongnu.org, 
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::b132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb132.google.com
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

On Fri, 16 Oct 2026 at 14:51, Brian Cain <brian.cain@oss.qualcomm.com> wrot=
e:
>
>
> On 10/15/2026 4:38 AM, Yonggang Luo wrote:
> > On Thu, Oct 15, 2026 at 5:20=E2=80=AFPM Peter Maydell <peter.maydell@li=
naro.org> wrote:
> >> On Thu, 15 Oct 2026 at 05:41, Yonggang Luo <luoyonggang@gmail.com> wro=
te:
> >>> Put query-cpu-definitions, dump notes, monitor, and Angel semihosting=
 on
> >>> TargetOps[SYS_EMU_TARGET__MAX] and look up by target_arch().
> >>> Keep the table in target-ops.c and with a stub
> >>>
> >>> - Register with a QEMU_ARCH_* bitmask so shared base-arch objects
> >>>    can fill both slots (e.g. QEMU_ARCH_ARM is ARM|AARCH64).
> >>> - TARGET_INFO_CPU_OP is type_init. A NULL member means no handler.
> >>> - Drop stubs/qmp-cpu.c
> >>>         stubs/hmp-cmd-info_tlb.c
> >>>         stubs/hmp-cmd-info_mem.c
> >>>         stubs/dump.c
> >>>
> >>> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>

> >> Too big a patch touching stuff all over the place with
> >> insufficient explanation of what it's doing or why.
> > Oh, sorry, I post is just for demo(DRAFT) for other place to
> > reference, but git-publish have no way
> > to title it(maybe because I use it wrongly).
>
> git publish has `--subject-prefix=3DPREFIX` - that will let you qualify
> this as DRAFT/RFC.

It's also helpful to edit the commit message for a single-patch
RFC so it's clear about the purpose of posting it (or to provide
a suitable cover letter on a multi-patch RFC). "Just a draft
to go with this other discussion" is totally fine, as long as
the commit message says so. (More generally, an RFC should say
what you are asking for comments about :-))

thanks
-- PMM

