Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A09CC6B03
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 05:14:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGUpr-0000FW-TE; Tue, 13 Oct 2026 01:14:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1xGUpn-0000Er-Qa
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 01:13:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1xGUpk-0005xM-RP
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 01:13:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1791868430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zkwZOKEVoYFPbzRg2a3N45+abdV0p+u1Fj3X5wW/a04=;
 b=YuEPhSoVvk0ruq1Jq5XgJnGGwpVprByd11TPSrVQUNKjoQPbODq7hGYomDJWz9O3Qp+Bsu
 xbbL5q3tuFG0ycQ4wz5JMNbSEFh87alj/2vIUegkzqF034CVzjBdxmP1/IGCXdc73fmeUn
 0jJraumg4vii/cesGRlR0TGbfobEag0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-473-3f9ZWkikMBSUueJxI9i2OA-1; Tue, 13 Oct 2026 05:13:46 +0000
X-MC-Unique: 3f9ZWkikMBSUueJxI9i2OA-1
X-Mimecast-MFC-AGG-ID: 3f9ZWkikMBSUueJxI9i2OA_1791868425
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-48c437ae81eso1385671f8f.1
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2026 22:13:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791868425; x=1792473225;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=zkwZOKEVoYFPbzRg2a3N45+abdV0p+u1Fj3X5wW/a04=;
 b=UU54Scu2X3hmsSIGmTIBXfAvU2UN7gbVoWsKVMq0ht/9XK0fZw9v8UW+1vr7w7khu+
 eNfj2jQ95CObf/mn40omO+CtfHDHjEiCROFRAqoWkWxBehxXwF0iQE4Q7psYAid/Oh/r
 SoG5dA/4P7Vj59bOB+TqdGObB851+E+IPBoIXn0LFbfX9JLYURyzwzqLVZ8eQ7OVEImv
 SsXuzKzcsGpddE5vnwCb7zthzsWATmWMxSnw2YeMhjurKiK6wTH8kpjtf3r2RteM0GIZ
 4Ift9S3Hjf5gY5OhVcQSV7E4DpdvXrlBxjwBAeDYMyM0rOPmqQd1F0dbugRjt0/lUrVQ
 Bicw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxzNZS65XI6/oGbgsyHeSH/ONYaTwzD3lXDyUD0iXmdM4KLYgu25popbEwNbJBU/u6QG+4fDtP97Q==@nongnu.org
X-Gm-Message-State: AFq9FYINNw/McNxgBHKw7nLdfj8P272cgbvqu5kiKAypG9DF//I65UQH
 moul2Da814IlZVzZikaerSajLDtcya9ulthbsZT4TnZywUb/jVX+2QF2obRv474vA8tiRQ+UfGk
 nBv48svIFN/7BXeiXmMJGxyz4UxnW/ieL/myLTWk2+4ELR3zveIbwqerfkzLBj4+EJj79s+NgEz
 GK/5swMQbLjpb1ejEiFLihfHPqwEQk
X-Gm-Gg: AYBFou0KQmbpvzx6ev42oOOYMuZ+00oipZjQBqdahmLUJtDeqgjrYm+pJ/JvEKm6t90
 wKbMb/76J34ovdlw2dHkekRsO4VCVMcZAdO/rs5F7lh1Lme9FCk9z+wiHuwnIwu3rVwmWh2PhL0
 9AZKu8Y+eHX1p0rnINjuukxs0KRq3EWB/Fl3PzFYlfAUpSZNfWbi6cjPgzU3G4OhgiWmaMG0vm7
 WL4ucqG7MeyNpXth7o8dnBvQzffqX0zGtXvPsGAnTTDbeNf5hXLrC6mgjmZkg==
X-Received: by 2002:a05:600d:17:b0:4a1:9663:7639 with SMTP id
 5b1f17b1804b1-4a196637a39mr134836395e9.34.1791868424748; 
 Mon, 12 Oct 2026 22:13:44 -0700 (PDT)
X-Received: by 2002:a05:600d:17:b0:4a1:9663:7639 with SMTP id
 5b1f17b1804b1-4a196637a39mr134836235e9.34.1791868424423; Mon, 12 Oct 2026
 22:13:44 -0700 (PDT)
MIME-Version: 1.0
References: <20261012134840.1051969-1-alex.bennee@linaro.org>
 <87fqybx97c.fsf@draig.linaro.org>
 <b5d07378-d5c4-4186-aae9-9252a08852fd@redhat.com>
 <87o6cyhi3b.fsf@draig.linaro.org>
In-Reply-To: <87o6cyhi3b.fsf@draig.linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 13 Oct 2026 07:13:33 +0200
X-Gm-Features: AclHuK_t7Nft2uI56Um5F54ZTnOHDqa4kcfxRI2vWBcNgZ2DLxCxgIdnMOQCppM
Message-ID: <CABgObfY8KzvrDZdpVXEEuRm8iKP7Hi01b6+B=KbMvkNfbXih1Q@mail.gmail.com>
Subject: Re: [RFC PATCH] target/arm: hold bql when SEV sets the event_register
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Mk_Aksjt7XQywt7C9yrailbYW3_flXNv_C240lJuA1g_1791868425
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000ec2070065db1e0da"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.24,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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

--000000000000ec2070065db1e0da
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il lun 12 ott 2026, 20:47 Alex Benn=C3=A9e <alex.bennee@linaro.org> ha scri=
tto:

> Paolo Bonzini <pbonzini@redhat.com> writes:
>
>
> > I think wfxt_timer_cb only needs to call cpu_interrupt().
>
> Something like:
>

No, the cpu_interrupt must be unconditional due to the WFIT instruction.
Your patch puts it under qatomic_read(&env->halt_reason) =3D=3D HALT_WFE.

>
> +
> +        qatomic_set(&cpu->env.halt_reason, NOT_HALTED);
> +
>          if (cpu->wfxt_timer) {
>              timer_del(cpu->wfxt_timer);
>          }
> -        /* clear the halt reason */
> -        qatomic_set(&cpu->env.halt_reason, NOT_HALTED);
>

I was thinking about the ordering before timer_mod, in the
wfe/wfi/wfet/wfit helpers. However it is not relevant if the timer callback
does not check halt_reason.

Paolo

     }
>      return leave_halt;
>  }
>  #endif
>
>  /*
> - * Unlike almost everything else that messes with the halt_reason and
> - * event_register details the timer callbacks are not in the vCPU
> - * context.
> - *
> - * To prevent races we atomically consume a HALT_WFE and set the event
> - * register. Either way we trigger the an exit event.
> + * Unlike almost everything else that messes with the halt_reason the
> + * timer callbacks are not in the vCPU context so we must use atomics
> + * to check it.
>   */
>  static void arm_wfxt_timer_cb(void *opaque)
>  {
> @@ -903,17 +900,15 @@ static void arm_wfxt_timer_cb(void *opaque)
>      CPUState *cs =3D CPU(cpu);
>      CPUARMState *env =3D &cpu->env;
>
> -    if (qatomic_cmpxchg(&env->halt_reason, HALT_WFE, NOT_HALTED)) {
> -        qatomic_set(&env->event_register, true);
> +    if (qatomic_read(&env->halt_reason) =3D=3D HALT_WFE) {
> +        /*
> +         * We expect the CPU to be halted; this will cause
> arm_cpu_is_work()
> +         * to return true (so we will come out of halt even with no othe=
r
> +         * pending interrupt), and the TCG accelerator's
> cpu_exec_interrupt()
> +         * function auto-clears the CPU_INTERRUPT_EXITTB flag for us.
> +         */
> +        cpu_interrupt(cs, CPU_INTERRUPT_EXITTB);
>      }
> -
> -    /*
> -     * We expect the CPU to be halted; this will cause arm_cpu_is_work()
> -     * to return true (so we will come out of halt even with no other
> -     * pending interrupt), and the TCG accelerator's cpu_exec_interrupt(=
)
> -     * function auto-clears the CPU_INTERRUPT_EXITTB flag for us.
> -     */
> -    cpu_interrupt(cs, CPU_INTERRUPT_EXITTB);
>  }
>  #endif
> --8<---------------cut here---------------end--------------->8---
>
> ?
>
> >
> > Thanks,
> >
> > Paolo
> >
> > (*) always, even if the halt reason is not HALT_WFE, if only for
> consistency
> >
> > (**) you don't need a lock or acquire/release here, because the timer
> > callback always sees everything that happened before timer_mod().  In
> > a sense, timer_mod() *is* the release operation and starting the
> > callback is the acquire operation.
>
> --
> Alex Benn=C3=A9e
> Virtualisation Tech Lead @ Linaro
>
>

--000000000000ec2070065db1e0da
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">Il lun 12 ott 2026, 20:47 Alex B=
enn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@linaro=
.org</a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=
=3D"_blank" rel=3D"noreferrer">pbonzini@redhat.com</a>&gt; writes:<br>
<br><br>
&gt; I think wfxt_timer_cb only needs to call cpu_interrupt().<br>
<br>
Something like:<br></blockquote></div></div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">No, the cpu_interrupt must be unconditional due to the WFIT =
instruction. Your patch puts it under qatomic_read(&amp;env-&gt;halt_reason=
) =3D=3D HALT_WFE.</div><div dir=3D"auto"><div class=3D"gmail_quote gmail_q=
uote_container"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qatomic_set(&amp;cpu-&gt;env.halt_reason, NOT_=
HALTED);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (cpu-&gt;wfxt_timer) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0timer_del(cpu-&gt;wfxt_time=
r);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* clear the halt reason */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qatomic_set(&amp;cpu-&gt;env.halt_reason, NOT_=
HALTED);<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">I was thinking about the ordering before timer_mod, in the wfe/wf=
i/wfet/wfit helpers. However it is not relevant if the timer callback does =
not check halt_reason.</div><div dir=3D"auto"><br></div><div dir=3D"auto">P=
aolo</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail=
_quote gmail_quote_container"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0return leave_halt;<br>
=C2=A0}<br>
=C2=A0#endif<br>
<br>
=C2=A0/*<br>
- * Unlike almost everything else that messes with the halt_reason and<br>
- * event_register details the timer callbacks are not in the vCPU<br>
- * context.<br>
- *<br>
- * To prevent races we atomically consume a HALT_WFE and set the event<br>
- * register. Either way we trigger the an exit event.<br>
+ * Unlike almost everything else that messes with the halt_reason the<br>
+ * timer callbacks are not in the vCPU context so we must use atomics<br>
+ * to check it.<br>
=C2=A0 */<br>
=C2=A0static void arm_wfxt_timer_cb(void *opaque)<br>
=C2=A0{<br>
@@ -903,17 +900,15 @@ static void arm_wfxt_timer_cb(void *opaque)<br>
=C2=A0 =C2=A0 =C2=A0CPUState *cs =3D CPU(cpu);<br>
=C2=A0 =C2=A0 =C2=A0CPUARMState *env =3D &amp;cpu-&gt;env;<br>
<br>
-=C2=A0 =C2=A0 if (qatomic_cmpxchg(&amp;env-&gt;halt_reason, HALT_WFE, NOT_=
HALTED)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qatomic_set(&amp;env-&gt;event_register, true)=
;<br>
+=C2=A0 =C2=A0 if (qatomic_read(&amp;env-&gt;halt_reason) =3D=3D HALT_WFE) =
{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* We expect the CPU to be halted; this w=
ill cause arm_cpu_is_work()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* to return true (so we will come out of=
 halt even with no other<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* pending interrupt), and the TCG accele=
rator&#39;s cpu_exec_interrupt()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* function auto-clears the CPU_INTERRUPT=
_EXITTB flag for us.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_interrupt(cs, CPU_INTERRUPT_EXITTB);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 /*<br>
-=C2=A0 =C2=A0 =C2=A0* We expect the CPU to be halted; this will cause arm_=
cpu_is_work()<br>
-=C2=A0 =C2=A0 =C2=A0* to return true (so we will come out of halt even wit=
h no other<br>
-=C2=A0 =C2=A0 =C2=A0* pending interrupt), and the TCG accelerator&#39;s cp=
u_exec_interrupt()<br>
-=C2=A0 =C2=A0 =C2=A0* function auto-clears the CPU_INTERRUPT_EXITTB flag f=
or us.<br>
-=C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 cpu_interrupt(cs, CPU_INTERRUPT_EXITTB);<br>
=C2=A0}<br>
=C2=A0#endif<br>
--8&lt;---------------cut here---------------end---------------&gt;8---<br>
<br>
?<br>
<br>
&gt;<br>
&gt; Thanks,<br>
&gt;<br>
&gt; Paolo<br>
&gt;<br>
&gt; (*) always, even if the halt reason is not HALT_WFE, if only for consi=
stency<br>
&gt;<br>
&gt; (**) you don&#39;t need a lock or acquire/release here, because the ti=
mer<br>
&gt; callback always sees everything that happened before timer_mod().=C2=
=A0 In<br>
&gt; a sense, timer_mod() *is* the release operation and starting the<br>
&gt; callback is the acquire operation.<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
Virtualisation Tech Lead @ Linaro<br>
<br>
</blockquote></div></div></div>

--000000000000ec2070065db1e0da--


