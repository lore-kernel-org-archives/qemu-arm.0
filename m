Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75664F99C69
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Apr 2026 22:46:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wDrxR-00069h-Uq; Fri, 17 Apr 2026 18:46:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scottjgo@gmail.com>)
 id 1wDpqB-00046x-Hj
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 16:31:03 -0400
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <scottjgo@gmail.com>)
 id 1wDpq9-0004DP-WA
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 16:31:03 -0400
Received: by mail-dy1-x132a.google.com with SMTP id
 5a478bee46e88-2d96243c91fso1899376eec.1
 for <qemu-arm@nongnu.org>; Fri, 17 Apr 2026 13:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776457860; x=1777062660; darn=nongnu.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wm0ksYbTxwDgtEXUCBhmNsLhqZyZ3sU07nxL8yqdlyE=;
 b=YD0CypitQ6HIXva/4KlbIyh4joHiPuju7j/Q9V94y7xPd4RasmvehmXvXaGVRumLnE
 IXecmoz3bCNQdSeWOEv85vWaGJFabf05xyZjV7kqRR29ieUKW9EmKrQbRgHIgYRRw2rA
 gTH28hHZS7Fq5lQyDBTiZwaFHP+96LDi4wTSl3TcGNeIbP3HPXKvkrzNoBOZ1MJoOmcs
 Z74jbS0fZacdBi42CcDkPEWyvSrSRFEMJ6y+ifalqhjEKa0mhsLRWIjf1klCv5iXKynR
 4VxPRQcIEykOlY+bsBq9oxh6qRDGoL+Puj6DFoOkTaxMXs9zOgehmnhlGbxUJv24jZPD
 lLcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776457860; x=1777062660;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wm0ksYbTxwDgtEXUCBhmNsLhqZyZ3sU07nxL8yqdlyE=;
 b=Bzvxvfg/lZCs/u2ie+KtLgny5xQRXm91IDTVtLR9p4e8pxD17za9DWJvKACfN6GEQ6
 AwwhjBHaihGTuQlM7sbIvhSmYmE6/lL03ax6bwQhViREkrPZfRhTu6arKZRfg6T94BBb
 /Sda9rnJYB686eq1LGf3T+1KWfZEjzhLqBHBHHMXU7MEp7xdjJ0p4HaNjZ9jHR8x8Dz8
 +UYhPuPRhRDkUAwlyVH/DReGB9IcD6mZF3yd1CYZPdLJFv9s9U3EqWhI+rRj6iKLBc2d
 ZPu3QGqrEzFeFtCFEDDN/kpwEMHV2SUdT2YAcWmgE5grIJiBi3tQd4Lq6i2rfLEu3lh1
 ywFg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8M4zCw8KC3pf4I8fQuhusQ118A3eyiM2wkCSviM6eKP0QtGitcWnLb89xOM9PfRhwJeRT5+6/HJQ==@nongnu.org
X-Gm-Message-State: AOJu0Yw50n+GZEOX2FqWkEEq7V4zx0+0PfEa45wDeZs2hC2ZEC2kUOC9
 vkrR/QSK/YXT3PV8Un9NLF2X/nP0uJ0l2wJsdRufrzS0jxHeAbAAbuWu
X-Gm-Gg: AeBDiesLzsnxN2Xyjp7Hp55Q/l54P5jUZnftLPQHOkzyyQO9gT3D5i15hB4INyt4L31
 sWnG99bKZlLBj/8xxf8ucd7cWyTwKajzE1VpK8OSPBQUA2U6oSf65zvJzsWBpKQLJfuO1x8qVoB
 x4e5qvKpmTWORrvx99Lu2Gev9Zk6o+Xlyh2K/WqWtG81nerSMRUjhnA6IWudUI/sdUYpufiOWmY
 vCPtk4vgLlYdkoYCa2qMOEKL3VJxMuG795u8wX+m6ypjvdhkIFLazgbVopZ6WONX+mGqwJLSXif
 IVfFVZZHQS63HxX3i+vWioCO+SdZntQs6i3+niRplncjxokE0Tq87zjgF5I255F5ahQnQEfVPps
 t61Jc84K19/UVc6k2bDZ9Nw8KdrIP4mz6A+uw27pL6znwwgLbXw5WLujJtWagERH9oI1bg1gk9Y
 Y7U9NinRBEVCC0oq4vlED6YS5tqVfNmA+ANNhG8FHWl1tP4yjANfSRqdMrNjK2eyCWkYXaM4bLU
 s9iU+Utj57766z8Hjcn
X-Received: by 2002:a05:7300:e12a:b0:2d1:d434:cfe3 with SMTP id
 5a478bee46e88-2e4528c967bmr2468840eec.0.1776457859188; 
 Fri, 17 Apr 2026 13:30:59 -0700 (PDT)
Received: from localhost ([2601:645:8200:47:b4a9:7592:ad4:897a])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2e53ccce440sm3666751eec.14.2026.04.17.13.30.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Apr 2026 13:30:58 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Apr 2026 13:30:57 -0700
Message-Id: <DHVPR5CMUKMG.3803OP5N2C9J3@gmail.com>
Cc: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <rbolshakov@ddn.com>,
 <phil@philjordan.eu>, <agraf@csgraf.de>, <peter.maydell@linaro.org>,
 "Mohamed Mediouni" <mohamed@unpredictable.fr>
Subject: Re: [PATCH v2] target/arm/hvf: Fix WFI halting to stop idle vCPU
 spinning
From: "Scott J. Goldman" <scottjgo@gmail.com>
To: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, "Scott J.
 Goldman" <scottjgo@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260410044726.61853-1-scottjgo@gmail.com>
 <20260410055045.63001-1-scottjgo@gmail.com>
 <86D19C52-2A31-4802-ADF2-703D9AE83E75@unpredictable.fr>
 <DHUW6DNJWPDC.1MEF4S1911AJ1@gmail.com>
 <803470a9-5669-4c29-89fb-2c9be4656512@linaro.org>
In-Reply-To: <803470a9-5669-4c29-89fb-2c9be4656512@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::132a;
 envelope-from=scottjgo@gmail.com; helo=mail-dy1-x132a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 17 Apr 2026 18:46:40 -0400
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

On Fri Apr 17, 2026 at 2:57 AM PDT, Philippe Mathieu-Daud=C3=A9 wrote:
> Hi Scott,
>
> On 16/4/26 23:20, Scott J. Goldman wrote:
>> Philippe-- apologies for the nag here but this is a fix for a unfortunat=
e
>> regression. Any chance you could take a look? Thanks!
>>=20
>> On Thu Apr 9, 2026 at 11:18 PM PDT, Mohamed Mediouni wrote:
>>>
>>>
>>>> On 10. Apr 2026, at 07:50, Scott J. Goldman <scottjgo@gmail.com> wrote=
:
>>>>
>>>> Commit b5f8f77271 ("accel/hvf: Implement WFI without using pselect()")
>>>> changed hvf_wfi() from blocking the vCPU thread with pselect() to
>>>> returning EXCP_HLT, intending QEMU's main event loop to handle the
>>>> idle wait. However, cpu->halted was never set, so cpu_thread_is_idle()
>>>> always returns false and the vCPU thread spins at 100% CPU per core
>>>> while the guest is idle.
>>>>
>>>> Fix this by:
>>>>
>>>> 1. Setting cpu->halted =3D 1 in hvf_wfi() so the vCPU thread sleeps on
>>>>    halt_cond in qemu_process_cpu_events().
>>>>
>>>> 2. Arming a host-side QEMU_CLOCK_HOST timer to fire when the guest's
>>>>    virtual timer (CNTV_CVAL_EL0) would expire. This is necessary
>>>>    because HVF only delivers HV_EXIT_REASON_VTIMER_ACTIVATED during
>>>>    hv_vcpu_run(), which is not called while the CPU is halted. The
>>>>    timer callback mirrors the VTIMER_ACTIVATED handler: it raises the
>>>>    vtimer IRQ through the GIC and marks vtimer_masked, causing the
>>>>    interrupt delivery chain to wake the vCPU via qemu_cpu_kick().
>>>>
>>>> 3. Clearing cpu->halted in hvf_arch_vcpu_exec() when cpu_has_work()
>>>>    indicates a pending interrupt, and cancelling the WFI timer.
>>>>
>>>> Fixes: b5f8f77271 ("accel/hvf: Implement WFI without using pselect()")
>>>> Signed-off-by: Scott J. Goldman <scottjgo@gmail.com>
>>>
>>> Reviewed-by: Mohamed Mediouni <mohamed@unpredictable.fr>
>>>> ---
>>>> include/system/hvf_int.h |  1 +
>>>> target/arm/hvf/hvf.c     | 65 +++++++++++++++++++++++++++++++++++++++-
>>>> 2 files changed, 65 insertions(+), 1 deletion(-)
>
> I haven't looked at your patch yet. While looking at commit
> b5f8f77271 I noticed the previous a14afa985e3 ("accel/hvf: Skip
> WFI if CPU has work to do") is different in my local tree, where
> I have:
>
> -- >8 --
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index 5fc8f6bbbd9..1a76c9cf402 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -2037,6 +2037,11 @@ static int hvf_wfi(CPUState *cpu)
>           return 0;
>       }
>
> +    if (cpu_test_interrupt(cpu, CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIQ))=
 {
> +        /* Interrupt pending, no need to wait */
> +        return EXCP_INTERRUPT;
> +    }
> +
>       return EXCP_HLT;
>   }
>
> ---
>
> Does that help? Now I'm really confused.


Hi Phillipe-- Appreciate your help here. The good news is the bug is
very easy to reproduce (start a linux VM with 1 cpu, watch the vCPU on
the host will always spin 100%). The bad news is I double checked my
bisect and you can see before b5f8f77271 there is no problem, and after
the commit is introduced, the problem appears. I also applied the
additional cpu_test_interrupt() patch you suggested and it did not
change the behavior.

thanks
-sjg

