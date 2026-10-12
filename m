Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DAB6CA9EDE
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Oct 2026 18:47:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGL3K-00032k-9a; Mon, 12 Oct 2026 14:47:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xGL3I-00032O-M5
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 14:47:12 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xGL3G-0004vN-Mz
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 14:47:12 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4a1698ea378so18011705e9.2
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2026 11:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791830827; x=1792435627; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=4ktBSx0EF4e5kZb9zdegnFmr2xMwSuGm6tA1OHAP+/Q=;
 b=js2GBSFRI0YAwmca+FEVppHlDkAe4hRPixOmhDhhZbkmRoq4bAkdirQI+8h4zQY0Bz
 S4bwBr+Krq6seVYb97ehaDk5EctnBZBRj0dAAgxQuk+XMqS6p7req5OZOyqOc7KlMpRh
 mZaz6/Ib6SbfeWijfCPVPKynYTCB37/wWF0eHx4Z1qMuq5fyEjMSholljjBnQmDBaeI6
 UVMHktxBhLJToi2l91fudmJ/jXWgolEYoO3x0xVqs7chEPGWAifWPwTXhT9NtkFeq5aA
 /GH5GU05L3clE9BienLM+G0wGunbJdf+4C9a2ZlQ43+PW8DNIyg3evEYLPYMyRaH5RgV
 LD0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791830827; x=1792435627;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=4ktBSx0EF4e5kZb9zdegnFmr2xMwSuGm6tA1OHAP+/Q=;
 b=E8PZM5BUDpmLmBppIjkLlWCu/Z0kNHQTy4M65oJyMXiaK2vLRQQpK9SWwu9JIv9Xhk
 CZMYL0i7H7p8jtG8FFprmh9GODZ5RijfVfF/53Ss+EESqao+sEJQgjD01RfGaAhvW1ZQ
 tfjmng4fPW90X/BnTUwWSSZcIxfNCHO8Z8F9ewnSU0rZlofrSK9U6+vubbo4mzMSUwMP
 98DD0EytEEcuE3lhyW63WShvrADwJumWWiKW5W/05554gxGW2r+S0zGxBsKw3OFT4Lrl
 PmOyjL8HFSc4pSTTozIaXbXKi2fDwEb/l+hagdspq/Qp9C5gfKFepyox/lpMQstcxjhB
 sr2g==
X-Forwarded-Encrypted: i=1;
 AKwUvByyYncuNNBr3O09TxdNhjS3OWdojuaKZKt1L8aq/5zvEtw9KDf9btt6kgg+qBzjeT8VWidJcpFvzQ==@nongnu.org
X-Gm-Message-State: AFq9FYKwGhOjja4wG0TiRfUzcAEQ9nPkKKDbqrARCsPmU+eWPasOEgR7
 60TS2ngVEan3f8l3nt6gAIw4+F2+st7vInrSD/l/Pd8OF4H0FwgwzTXsS5BuiOdhPbg=
X-Gm-Gg: AYBFou3HmJ+GC4U2tp8ABWe4HPUlJ019a3f0xvvPmEFXb3sEjxrkqgjiIkQ6kAOQEAi
 kbdrepu8F8wvEYFxgXXb6jzXLYIFVFXDncXDNgejofeXlssZq58BmZYi4VQNkXTRNk4kFqwfa7I
 gWwws6wQKoqxeAI4OlRF2IgCufF5GSLQfAjvS3Vth/ZBFV7E4W4CGZk1s+OOugFsdtbqjgLGilP
 vOSERkh971iNlhUSCYTjrM0huHr/DRiP+TeeMJ45Hf0nWRXjD/QlXryvCRpQgLtCoi481fyBfOL
 KKrFqrYGCnGq5RVZeizAkEwEXQbHGVyKsxJa2YHqHZeFvnbgWDVtIoYlamTSd0saU3RQ7KaOmhk
 Ce6wXpfrP8N4xiXguEt6fvD/D72mnOmeoxYWesEHpOvJvBpWl2WZASPfNozwcmacGKggpb+mS+O
 bHy0cykY86vK4pmHudw+p6IK/7CdRTkxK/efynFcM5mm9vIxpIdByUgiAP2v7f7rhOOHhs8Q==
X-Received: by 2002:a05:600c:3510:b0:4a1:7703:e549 with SMTP id
 5b1f17b1804b1-4a18e4c3fe4mr228604855e9.26.1791830826853; 
 Mon, 12 Oct 2026 11:47:06 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a190344032sm310480465e9.15.2026.10.12.11.47.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 11:47:05 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id BF3215F808;
 Mon, 12 Oct 2026 19:47:04 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org,  Richard Henderson
 <richard.henderson@linaro.org>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@oss.qualcomm.com>,  Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Subject: Re: [RFC PATCH] target/arm: hold bql when SEV sets the event_register
In-Reply-To: <b5d07378-d5c4-4186-aae9-9252a08852fd@redhat.com> (Paolo
 Bonzini's message of "Mon, 12 Oct 2026 18:27:13 +0200")
References: <20261012134840.1051969-1-alex.bennee@linaro.org>
 <87fqybx97c.fsf@draig.linaro.org>
 <b5d07378-d5c4-4186-aae9-9252a08852fd@redhat.com>
User-Agent: mu4e 1.14.4-pre6; emacs 30.1
Date: Mon, 12 Oct 2026 19:47:04 +0100
Message-ID: <87o6cyhi3b.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 10/12/26 16:52, Alex Benn=C3=A9e wrote:
>>> diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
>>> index af56eff9f18..7c1fdab79d7 100644
>>> --- a/target/arm/tcg/op_helper.c
>>> +++ b/target/arm/tcg/op_helper.c
>>> @@ -471,6 +471,9 @@ void HELPER(wfit)(CPUARMState *env, uint32_t rd)
>>>   void HELPER(sev)(CPUARMState *env)
>>>   {
>>>       CPUState *cs =3D env_cpu(env);
>>> +
>>> +    BQL_LOCK_GUARD();
>>> +
>>>       CPU_FOREACH(cs) {
>>>           ARMCPU *target_cpu =3D ARM_CPU(cs);
>>>           target_cpu->env.event_register =3D true;
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
>
> The use of cmpxchg in wfxt_timer_cb is fishy though.
>
> Clearing HALT_WFE should be the task of the target CPU, not the timer.
> The timer_mod() should be *after* halt_reason(*), and then you can
> just do a qatomic_read() instead of a cmpxchg(**) in wfxt_timer_cb().
>
> However, I don't understand at all why wfxt_timer_cb needs to set
> event_register to true.  It seems to me that a wfet + wfe sequence,
> where the first wfet times out, *should* halt again on the second wfe;
> but as the code is written it doesn't.
>
> I think wfxt_timer_cb only needs to call cpu_interrupt().

Something like:

--8<---------------cut here---------------start------------->8---
modified   =EE=98=9E target/arm/cpu.c
@@ -877,25 +877,22 @@ bool arm_cpu_exec_halt(CPUState *cs)
     bool leave_halt =3D cpu_has_work(cs);
=20
     if (leave_halt) {
-        /* We're about to come out of WFI/WFE: disable the WFxT timer */
         ARMCPU *cpu =3D ARM_CPU(cs);
+
+        qatomic_set(&cpu->env.halt_reason, NOT_HALTED);
+
         if (cpu->wfxt_timer) {
             timer_del(cpu->wfxt_timer);
         }
-        /* clear the halt reason */
-        qatomic_set(&cpu->env.halt_reason, NOT_HALTED);
     }
     return leave_halt;
 }
 #endif
=20
 /*
- * Unlike almost everything else that messes with the halt_reason and
- * event_register details the timer callbacks are not in the vCPU
- * context.
- *
- * To prevent races we atomically consume a HALT_WFE and set the event
- * register. Either way we trigger the an exit event.
+ * Unlike almost everything else that messes with the halt_reason the
+ * timer callbacks are not in the vCPU context so we must use atomics
+ * to check it.
  */
 static void arm_wfxt_timer_cb(void *opaque)
 {
@@ -903,17 +900,15 @@ static void arm_wfxt_timer_cb(void *opaque)
     CPUState *cs =3D CPU(cpu);
     CPUARMState *env =3D &cpu->env;
=20
-    if (qatomic_cmpxchg(&env->halt_reason, HALT_WFE, NOT_HALTED)) {
-        qatomic_set(&env->event_register, true);
+    if (qatomic_read(&env->halt_reason) =3D=3D HALT_WFE) {
+        /*
+         * We expect the CPU to be halted; this will cause arm_cpu_is_work=
()
+         * to return true (so we will come out of halt even with no other
+         * pending interrupt), and the TCG accelerator's cpu_exec_interrup=
t()
+         * function auto-clears the CPU_INTERRUPT_EXITTB flag for us.
+         */
+        cpu_interrupt(cs, CPU_INTERRUPT_EXITTB);
     }
-
-    /*
-     * We expect the CPU to be halted; this will cause arm_cpu_is_work()
-     * to return true (so we will come out of halt even with no other
-     * pending interrupt), and the TCG accelerator's cpu_exec_interrupt()
-     * function auto-clears the CPU_INTERRUPT_EXITTB flag for us.
-     */
-    cpu_interrupt(cs, CPU_INTERRUPT_EXITTB);
 }
 #endif
--8<---------------cut here---------------end--------------->8---

?

>
> Thanks,
>
> Paolo
>
> (*) always, even if the halt reason is not HALT_WFE, if only for consiste=
ncy
>
> (**) you don't need a lock or acquire/release here, because the timer
> callback always sees everything that happened before timer_mod().  In
> a sense, timer_mod() *is* the release operation and starting the
> callback is the acquire operation.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

