Received: by 2002:a17:907:a09:b0:a52:4db9:938b with SMTP id bb9csp186942ejc;
        Fri, 3 May 2024 18:41:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVD+OEOxukCKlP1T+iASVOC+kUo2lm98xoXcPkQUW0RdYAlo/x/cFpFXP0D/0yfq4umwQvFzEkdkmNk/ieD7SF/7bn0ZeOa
X-Received: by 2002:a17:907:9195:b0:a59:9d4c:eb09 with SMTP id bp21-20020a170907919500b00a599d4ceb09mr1410684ejb.27.1714786869430;
        Fri, 03 May 2024 18:41:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714786869; cv=none;
        d=google.com; s=arc-20160816;
        b=rmpp8mTiCUCCOLVr52mGlZj3D8vrQq24qFH9EiDOk465uG3L6CwC4u1wpuq22RY2KH
         7QnnzMNbZUfugiUF6O1G6kyocP3Y8Q9AScpc3LBCc3zQ4UHNRsYAdl40f4tpllfAQSqd
         Cz6qmF6hsmVPcAnE2TlbtZEAPt4d0+j+cv1Q/sYKUQ956AKlUM3+QEok1BH+1pTVMUl/
         zv8uHocLZGRbPI3s4z8WY+laQTKFYqtL1+Fq93eaZntovRQ5nRWG0rkLJvs+b+ROSFjY
         TCSPfT2o1XfYW8xx2TUM4afo5jJnEgcaEEEX9C2MzkO1HS0dKVtmwHOwVh6undu4CSp8
         HJ7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cMaSACtjO3SUkgFNE0eUoOTbz0mIrS43V9gIJCsSjMw=;
        fh=QQ+LZZri3kxqO5l93k5HwenmK+SmwasCOkONJtHlS40=;
        b=TSo13IGCX82zwaN72o26SOIcREcBtCanM13AON8NEmziA8WOOwmVE5sWMFMJFx6wo+
         9CE91NDR5cWL/sxVwCxWQudPS+f1ywJbxgi4RqLEZ+PLM05HtFl08Geu7G2unRgaJitA
         mAK1k39gVjjH9oMmqx/10X92tygd675kAfEaR1LbgKZBAXb7tucnXw39spFfTPI4wX4Q
         tz3O3CNEaj4YACSil+ZoKb1xIK5jl9vFuXvVc6ZIdgYH6XJriouE/tLe2wB2paS3wdL6
         q4Qicz5Z3z9I7Tu7IemujV7Ys92sKIPqFTwZpMhwnj+E1rFe/Gpa+NkSriHTOIm8A7U7
         dYNw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@opnsrc.net header.s=google header.b=cEK0JfLj;
       spf=pass (google.com: domain of salil.mehta@opnsrc.net designates 209.85.220.41 as permitted sender) smtp.mailfrom=salil.mehta@opnsrc.net
Return-Path: <salil.mehta@opnsrc.net>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id lb5-20020a170907784500b00a521c173f3esor1287222ejc.17.2024.05.03.18.41.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 03 May 2024 18:41:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@opnsrc.net designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@opnsrc.net header.s=google header.b=cEK0JfLj;
       spf=pass (google.com: domain of salil.mehta@opnsrc.net designates 209.85.220.41 as permitted sender) smtp.mailfrom=salil.mehta@opnsrc.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=opnsrc.net; s=google; t=1714786869; x=1715391669; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cMaSACtjO3SUkgFNE0eUoOTbz0mIrS43V9gIJCsSjMw=;
        b=cEK0JfLjzgLR6m3FTfXYGDEAH7xbk4tR7yaW3jd4b/1kIczxYNGcjSuPll4yV0JBt7
         3YtwnevhYZ07EeFOQhZiV8SHv9prvcHsYzB9NqNPCxeseSZxSw+8+qL6vy9GVLuUBNm/
         FrkhCUaFOZDCPnBMd83i7yXHbSWCYRrhvYdkHuvSd3eAY2EDLgQs0e6pALBNGhLiHvPF
         X5dyw+JyPQEABVZXBK2suBzssBrgIHHivyr6hTnjIqsXoIvGcWEfi5er63hBue4Aki41
         0b3Z9JUgC5A98HuwdTGGUMW5tlGZPvvHWdkodFRDG67ae/5C/tujPW8H2gYBkXJ7ILG2
         5/Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714786869; x=1715391669;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cMaSACtjO3SUkgFNE0eUoOTbz0mIrS43V9gIJCsSjMw=;
        b=uDr52Z5pBz7kel3Jfm+L1wOk7Q0Yp/pzhgupBWxsuAzVLZSJP61vyU9Biju6ZGtFoV
         nPb9JftWPJ1F4wE2gobBdFzzJ6+zWGYbO0gPUa1w1lmfXq2T+ilppMdQO7orODjguq1i
         G9RFfGh8o74t9VKlmKu3ca/clWNzcrwW3awTshMKNot6fOEbaejNiU96Jk+42ZAmKuPF
         +TznGmoJru6DE24NjUajMXXS27fBbEj+je1YNF1pRfKnnKOoaJNY17sZDjU40uxsJzuP
         fWy3OUFCBbnozc/t+DlQtsR2VibXXvkxqxb5U2XlEz+1v37HPdqSbfQGzH55vn4J8d6I
         TNEA==
X-Forwarded-Encrypted: i=1; AJvYcCWCU8VnowI7Q6xqGj6IpcUmpzm1ckPmFhJ5mfpac/40w1c//bIdCZyozLVg/YhNxM5tIoAxLK7PzWTs3j0+saKVp/NVc05U
X-Gm-Message-State: AOJu0YzdUmdhBcJNZZYC9rgYBOIOpZA8a4M3WxNmwph4+rKk/FZoZjpd
	LtjkCaOXTH13T87XoPMd9i7Fqyp2diM0dEqPMKc/RTUYpot64biVqpkDiK2SzEoXCWTc4Yk8xP0
	W3HvKpOkadUugSAnz7AzC92CQOCQvgncXWOu3YQ==
X-Google-Smtp-Source: AGHT+IHjmytAzojMfNdYwcFmfP1vW50Hh3Q+jDWe+k2a+JTyeZh4d7TBP15mECEOVzFwePmUI2mZfJryFWNQJZ5yAHI=
X-Received: by 2002:a17:906:52cc:b0:a59:9f11:2b66 with SMTP id
 w12-20020a17090652cc00b00a599f112b66mr974332ejn.36.1714786869051; Fri, 03 May
 2024 18:41:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240312020000.12992-1-salil.mehta@huawei.com>
 <20240312020000.12992-7-salil.mehta@huawei.com> <7bccde5479f044dc87679236b736b861@huawei.com>
In-Reply-To: <7bccde5479f044dc87679236b736b861@huawei.com>
From: Salil Mehta <salil.mehta@opnsrc.net>
Date: Sat, 4 May 2024 02:40:57 +0100
Message-ID: <CAJ7pxebK_rPFYN_NVLUyAVExb+e0ep7Bx5BuPgRJcmg9s5BQBQ@mail.gmail.com>
Subject: Re: [PATCH V8 6/8] physmem: Add helper function to destroy CPU AddressSpace
To: zhukeqian <zhukeqian1@huawei.com>
Cc: Salil Mehta <salil.mehta@huawei.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "maz@kernel.org" <maz@kernel.org>, 
	"jean-philippe@linaro.org" <jean-philippe@linaro.org>, Jonathan Cameron <jonathan.cameron@huawei.com>, 
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, 
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>, 
	"richard.henderson@linaro.org" <richard.henderson@linaro.org>, "imammedo@redhat.com" <imammedo@redhat.com>, 
	"andrew.jones@linux.dev" <andrew.jones@linux.dev>, "david@redhat.com" <david@redhat.com>, 
	"philmd@linaro.org" <philmd@linaro.org>, "eric.auger@redhat.com" <eric.auger@redhat.com>, 
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"mst@redhat.com" <mst@redhat.com>, "will@kernel.org" <will@kernel.org>, "gshan@redhat.com" <gshan@redhat.com>, 
	"rafael@kernel.org" <rafael@kernel.org>, "alex.bennee@linaro.org" <alex.bennee@linaro.org>, 
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>, 
	"darren@os.amperecomputing.com" <darren@os.amperecomputing.com>, 
	"ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>, 
	"vishnu@os.amperecomputing.com" <vishnu@os.amperecomputing.com>, 
	"karl.heubaum@oracle.com" <karl.heubaum@oracle.com>, "miguel.luis@oracle.com" <miguel.luis@oracle.com>, 
	"wangxiongfeng (C)" <wangxiongfeng2@huawei.com>, "wangyanan (Y)" <wangyanan55@huawei.com>, 
	"jiakernel2@gmail.com" <jiakernel2@gmail.com>, "Wanghaibin (D)" <wanghaibin.wang@huawei.com>, 
	"maobibo@loongson.cn" <maobibo@loongson.cn>, "lixianglai@loongson.cn" <lixianglai@loongson.cn>, 
	Linuxarm <linuxarm@huawei.com>, yuzenghui <yuzenghui@huawei.com>
Content-Type: multipart/alternative; boundary="000000000000321bd9061796eeec"
X-TUID: OYoR8XP/Ci5c

--000000000000321bd9061796eeec
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Zhukeqian,

On Fri, Mar 15, 2024 at 1:17=E2=80=AFAM zhukeqian <zhukeqian1@huawei.com> w=
rote:

> Hi Salil,
>
> [...]
>
> +void cpu_address_space_destroy(CPUState *cpu, int asidx) {
> +    CPUAddressSpace *cpuas;
> +
> +    assert(cpu->cpu_ases);
> +    assert(asidx >=3D 0 && asidx < cpu->num_ases);
> +    /* KVM cannot currently support multiple address spaces. */
> +    assert(asidx =3D=3D 0 || !kvm_enabled());
> +
> +    cpuas =3D &cpu->cpu_ases[asidx];
> +    if (tcg_enabled()) {
> +        memory_listener_unregister(&cpuas->tcg_as_listener);
> +    }
> +
> +    address_space_destroy(cpuas->as);
> +    g_free_rcu(cpuas->as, rcu);
>
> In address_space_destroy(), it calls call_rcu1() on cpuas->as which will
> set do_address_space_destroy() as the rcu func.
> And g_free_rcu() also calls call_rcu1() on cpuas->as which will overwrite
> the rcu func as g_free().
>
> Then I think the g_free() may be called twice in rcu thread, please verif=
y
> that.
>
> The source code of call_rcu1:
>
> void call_rcu1(struct rcu_head *node, void (*func)(struct rcu_head *node)=
)
> {
>     node->func =3D func;
>     enqueue(node);
>     qatomic_inc(&rcu_call_count);
>     qemu_event_set(&rcu_call_ready_event);
> }
>


Thanks for testing and identifying this. Let me have a look and will get
back to you.

Thanks
Salil



>
> Thanks,
> Keqian
>
> +
> +    if (asidx =3D=3D 0) {
> +        /* reset the convenience alias for address space 0 */
> +        cpu->as =3D NULL;
> +    }
> +
> +    if (--cpu->cpu_ases_count =3D=3D 0) {
> +        g_free(cpu->cpu_ases);
> +        cpu->cpu_ases =3D NULL;
> +    }
> +}
> +
>  AddressSpace *cpu_get_address_space(CPUState *cpu, int asidx)  {
>      /* Return the AddressSpace corresponding to the specified index */
> --
> 2.34.1
>
>

--000000000000321bd9061796eeec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Zhukeqian,</div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 15, 2024 at 1:17=
=E2=80=AFAM zhukeqian &lt;<a href=3D"mailto:zhukeqian1@huawei.com">zhukeqia=
n1@huawei.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Hi Salil,<br>
<br>
[...]<br>
<br>
+void cpu_address_space_destroy(CPUState *cpu, int asidx) {<br>
+=C2=A0 =C2=A0 CPUAddressSpace *cpuas;<br>
+<br>
+=C2=A0 =C2=A0 assert(cpu-&gt;cpu_ases);<br>
+=C2=A0 =C2=A0 assert(asidx &gt;=3D 0 &amp;&amp; asidx &lt; cpu-&gt;num_ase=
s);<br>
+=C2=A0 =C2=A0 /* KVM cannot currently support multiple address spaces. */<=
br>
+=C2=A0 =C2=A0 assert(asidx =3D=3D 0 || !kvm_enabled());<br>
+<br>
+=C2=A0 =C2=A0 cpuas =3D &amp;cpu-&gt;cpu_ases[asidx];<br>
+=C2=A0 =C2=A0 if (tcg_enabled()) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 memory_listener_unregister(&amp;cpuas-&gt;tcg_=
as_listener);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 address_space_destroy(cpuas-&gt;as);<br>
+=C2=A0 =C2=A0 g_free_rcu(cpuas-&gt;as, rcu);<br>
<br>
In address_space_destroy(), it calls call_rcu1() on cpuas-&gt;as which will=
 set do_address_space_destroy() as the rcu func.<br>
And g_free_rcu() also calls call_rcu1() on cpuas-&gt;as which will overwrit=
e the rcu func as g_free().<br>
<br>
Then I think the g_free() may be called twice in rcu thread, please verify =
that.<br>
<br>
The source code of call_rcu1:<br>
<br>
void call_rcu1(struct rcu_head *node, void (*func)(struct rcu_head *node))<=
br>
{<br>
=C2=A0 =C2=A0 node-&gt;func =3D func;<br>
=C2=A0 =C2=A0 enqueue(node);<br>
=C2=A0 =C2=A0 qatomic_inc(&amp;rcu_call_count);<br>
=C2=A0 =C2=A0 qemu_event_set(&amp;rcu_call_ready_event);<br>
}<br></blockquote><div><br></div><div><br></div><div>Thanks for testing and=
 identifying this. Let me have a look and will get back to you.</div><div><=
br></div><div>Thanks</div><div>Salil</div><div><br></div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Thanks,<br>
Keqian<br>
<br>
+<br>
+=C2=A0 =C2=A0 if (asidx =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* reset the convenience alias for address spa=
ce 0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu-&gt;as =3D NULL;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (--cpu-&gt;cpu_ases_count =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(cpu-&gt;cpu_ases);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu-&gt;cpu_ases =3D NULL;<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
=C2=A0AddressSpace *cpu_get_address_space(CPUState *cpu, int asidx)=C2=A0 {=
<br>
=C2=A0 =C2=A0 =C2=A0/* Return the AddressSpace corresponding to the specifi=
ed index */<br>
--<br>
2.34.1<br>
<br>
</blockquote></div></div>

--000000000000321bd9061796eeec--
