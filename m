Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BEB9CD98CE
	for <qemu-arm@archiver.kernel.org>; Fri, 12 Jun 2026 17:19:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wY5X1-0004Ps-HA; Fri, 12 Jun 2026 13:19:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wY5Wz-0004PZ-BK
 for qemu-arm@nongnu.org; Fri, 12 Jun 2026 13:18:57 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wY5Wx-0004P5-I0
 for qemu-arm@nongnu.org; Fri, 12 Jun 2026 13:18:57 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-490b211ee6aso8839145e9.3
 for <qemu-arm@nongnu.org>; Fri, 12 Jun 2026 10:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781284733; x=1781889533; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DuOtHeBbJw1YDeqbXCJ3sEezGFxNJJSYyUp7OFWdCrE=;
 b=csfa43W+/Owo314DeDZ8OLMymlIO2yntLNVwP9J8pWLdsvRPrMS0cfhTbfAUSGSUKd
 JA5Plloov75yF6PShmEInvXYXXnHUmbRClCh42s7+naAF4XSeEOMb25Y0jeXBFpjAb+y
 URfw0Lbgm/tmiC7FIpuLyMbjsT0jndQ9SeK8h2TFFNNEn7y+OEpq90A6AVOu35sLHLmJ
 /+0spye9pd0p/xvm5oN+SSrL2av0LZCq2SN6M5IIL1w7moNrl66P1wwEZpbLkIOBwE+y
 vVDk8BsiJsjnPKfIpW/jkMdnpwwLtJu/jDpkYlFSGYFzhqmLeYzPk5WYwVdGFLUN/Rzc
 a/3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781284733; x=1781889533;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DuOtHeBbJw1YDeqbXCJ3sEezGFxNJJSYyUp7OFWdCrE=;
 b=UoGRqCgKG9eryM2tNiuG6A+loNj6/jg2R8jGnDrIbmjxFbW4zrMm9Y5f75RsmeF8cT
 kuY5S1iyfnJx31+wFCr2t1haNuTdmlq+NtIHQStxpIfmxAbE0VvTrvgnJJFTsS6pbtti
 ppIJy9rYWfgtizERs4713CeM9kXaHqVhf+fThEH2JVE5zsrGZbSE2XTp63k7IAnpGIh+
 UwsXwjubreQBU/D9piwX14ElhpbIbS7mwEMMBc3KJgg03pnkuJrzEcLZlPhIiypbAUNW
 kQABamWUUMNLx2F+Bh6D2DgMyuzdu89eYwTkkE7FvLz03ZfA5BfBfXpHpMBv3G7g0SF5
 VadQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9fjOLSLw99oEpIGcQySyHZ/goK2A5qk0Y/ufEg5AiLiMjJajBXT9eehhzlQfMUAARVUcGY1FunHg==@nongnu.org
X-Gm-Message-State: AOJu0YwOhtvcJ33SC0PN6uV2adH2odQydgeFTd2XiuwxzK+i7lF34CWc
 NyiBy7YolyhMRTKETypWj1fsNfWPm+23u/XVUJHI+Iuqa64ZshSKkvk/lXWnsSVNbIc=
X-Gm-Gg: Acq92OEmRXC/Ef2CJOlyVplHbOTROHz1yOtF13L1QuR9/uH6iEsoML2VCgls+G7Ed1V
 phJHxCBn6oU31KvrZ9ypACXUVD2UeLT0X9B4t7kqUM/trM++netu71KtshPLoFBwF3y1Esdelaj
 2RBcwUWhH/3xLMsXN+onzSRYHmCmzUhV+AdU2ipMW5nnfiglCIiw3pqpNhidgSd4v79Wz3C1DSr
 0Uy/oHWHb9dOCe6s+FPnpOhmRk4oH7Cpzr/YmRVc/Z4XwcM8sbZxEGT1c1ILmTil8qyYMBOy0dn
 aJilyiUxJULqUP8PS2Cl+UgZW5Y9KHP1HDtp3t50YbpRNdDDu69XU4w0fW94V0TjWpP3IJQKsgO
 CMBLSrt3TjctKpPW/RnreSmUyKGSxr2HzdfWEjU/3NurZ6qQaXQrEEIn203Sw932HixpT+9RIGN
 nVBUG7oW960yL1PPmz7Gku6Dk=
X-Received: by 2002:a05:600c:83c8:b0:492:1e36:d16e with SMTP id
 5b1f17b1804b1-4921e36d1a9mr17505975e9.36.1781284733060; 
 Fri, 12 Jun 2026 10:18:53 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922035b4absm3694975e9.11.2026.06.12.10.18.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 10:18:52 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 65D125F814;
 Fri, 12 Jun 2026 18:18:51 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>,  Alexander
 Graf <agraf@csgraf.de>,  Mohamed Mediouni <mohamed@unpredictable.fr>,
 Pedro Barbuda <pbarbuda@microsoft.com>,  qemu-arm@nongnu.org,
 kvm@vger.kernel.org
Subject: Re: [PATCH v7 0/8] target/arm: fully model WFxT instructions for
 A-profile
In-Reply-To: <CAFEAcA94+mh_pigFDi+tEPRJ416fSWfxsQ1Lj8Byemug9kBp6w@mail.gmail.com>
 (Peter Maydell's message of "Mon, 8 Jun 2026 14:51:24 +0100")
References: <20260529082948.363931-1-alex.bennee@linaro.org>
 <CAFEAcA94+mh_pigFDi+tEPRJ416fSWfxsQ1Lj8Byemug9kBp6w@mail.gmail.com>
User-Agent: mu4e 1.14.1; emacs 30.1
Date: Fri, 12 Jun 2026 18:18:51 +0100
Message-ID: <87h5n7ekxw.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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

Peter Maydell <peter.maydell@linaro.org> writes:

> On Fri, 29 May 2026 at 09:29, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> This series fully models the behaviour of WFxT instructions. We
>> already had support for WFE for M-profile but we left off A-profile as
>> it has more potential sources of wake-ups. The main one is the event
>> stream which includes events from significant bits of the timer
>> ticking over.
>>
>> The refactoring from the previous iterations of the patch have now
>> been merged.
>>
>> I've dropped trying to fully model the global monitor in favour of
>> taking advantage of the architectural flexibility to have an IMPDEF
>> event wake up for any reason. We treat the setting of exclusive_addr
>> as such a reason because it indicates the current vCPU is in a ldstx
>> exclusive region and we don't want the guest to deadlock. This does mean
>> the system won't sleep on WFE enabled locks but people shouldn't be
>> relying on QEMU to model real world sleep patterns anyway given the
>> efficiency of emulation compared to real HW.
>>
>> I've written a test case using kvm-unit-tests:
>>
>>   Message-ID: <20260527111822.1563679-1-alex.bennee@linaro.org>
>>   Date: Wed, 27 May 2026 12:18:21 +0100
>>   Subject: [kvm-unit-tests PATCH v2] arm: add wfx test case
>>   From: =3D?UTF-8?q?Alex=3D20Benn=3DC3=3DA9e?=3D <alex.bennee@linaro.org>
>>
>> All patches are now reviewed.
>
>
>
> Applied to target-arm.next, thanks.

Is it too late to drop them? I've a fix for 2/8:

--8<---------------cut here---------------start------------->8---
modified   =EF=83=BD include/hw/core/sysemu-cpu-ops.h
@@ -18,6 +18,9 @@
 typedef struct SysemuCPUOps {
     /**
      * @has_work: Callback for checking if there is work to do.
+     *
+     * This function should be idempotent (i.e. not change state) as
+     * it will likely be queried multiple times before a CPU resumes.
      */
     bool (*has_work)(CPUState *cpu); /* MANDATORY NON-NULL */
     /**
modified   =EE=98=9E target/arm/cpu.c
@@ -158,7 +158,6 @@ static bool arm_cpu_has_work(CPUState *cs)
      * A wake-up event should only wake us if we are halted on a WFE
      */
     if (cpu->env.halt_reason =3D=3D HALT_WFE && cpu->env.event_register) {
-        cpu->env.halt_reason =3D NOT_HALTED;
         return true;
     }
=20
@@ -170,7 +169,6 @@ static bool arm_cpu_has_work(CPUState *cs)
                            | CPU_INTERRUPT_NMI | CPU_INTERRUPT_VINMI | CPU=
_INTERRUPT_VFNMI
                            | CPU_INTERRUPT_VFIQ | CPU_INTERRUPT_VIRQ | CPU=
_INTERRUPT_VSERR
                            | CPU_INTERRUPT_EXITTB)) {
-        cpu->env.halt_reason =3D NOT_HALTED;
         return true;
     }
=20
@@ -874,6 +872,8 @@ bool arm_cpu_exec_halt(CPUState *cs)
         if (cpu->wfxt_timer) {
             timer_del(cpu->wfxt_timer);
         }
+        /* clear the halt reason */
+        cpu->env.halt_reason =3D NOT_HALTED;
     }
     return leave_halt;
 }
--8<---------------cut here---------------end--------------->8---


>
> -- PMM

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

