Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp1026008njc;
        Wed, 21 May 2025 01:29:18 -0700 (PDT)
X-Received: by 2002:a17:902:db07:b0:21f:768:cced with SMTP id d9443c01a7336-231de35167bmr224914785ad.8.1747816157982;
        Wed, 21 May 2025 01:29:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747816157; cv=none;
        d=google.com; s=arc-20240605;
        b=C7Bf0aC6orQo5krfJzze7ubB6Z85BdBoxEPUscORNS7heC/woo27FJi8aidSqo5Ovv
         68r3Qbuwb3M7BHLbtzS+f4wKMzjQIgnfRWH3pi3OU8902WaY8Bx3wzM2JyB1W+9UnUsN
         KWHg4ueKFVuin6mNAQW1jEln6Ng+I8ahSHcsYMOedulG80mIS58/3GMAONEk3iNiug9n
         2MqOFKtImXhTFDQF7gFbmtNsy6IIDkN22e0ljsD0dvHGIJsVw03j38gsvD1DUd5FZIRg
         FEiNy7t2fAs53jYbbXMlQM7f4czI9KfGf4kFOuLBCF8CNXrNX7ip/Cs2xZkNp6xF6/0Q
         F+Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9Yq/HLt0u14BIYiMVeYiqtquSRLg0l668z+sdOxNc1o=;
        fh=0G1erw/cGvoYlKl3GAgMwQD07lX7t1QV9so1J1xZmKc=;
        b=XYTMyWL+0aa3pHRBUKbP8kIBglD0GEVjKfRP68uKJjbPM/UCH698bDvwnttYVDHD+O
         w1icSjA+INEfQ3f25zBWY0pqEhms6u9RWIw6dwyLikeYlVheszGO6ci8gOUWav8dv5Sf
         KNlbteE5u1oTC0jlTHKkjzwoH9+QmmFCYurUmbBQ0NAzHvEexAQ2244n9U1Jy3eKiN5h
         Lb+HO9q0BG16tceLqNFdkCe59aKSfPVgAfW4w+EPFp39t/aA1VIfzqL/E9l3T9+FjUNk
         yJEaA3lj+MqfG5MxoG459JmI7Ia2H4A8hyJpkaqKiE96+EoMVWr9Inob9BGQf68mFrVH
         Pcjg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=KNNQhCya;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-231d4e84c29sor73872095ad.11.2025.05.21.01.29.17
        (Google Transport Security);
        Wed, 21 May 2025 01:29:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=KNNQhCya;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747816157; x=1748420957; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9Yq/HLt0u14BIYiMVeYiqtquSRLg0l668z+sdOxNc1o=;
        b=KNNQhCyaO7U24mO/TQ4TkIhz0D/9yl5jEvx2U+An3cxG+8ltNLSXK/OH67OH7MQY1o
         5RxIcf470ZfN9q/sPk5o3T+2NCAzgP0CTMM4DRWWYh/+1YXuU5PYX8tUcy8yk7ILyBCx
         J9628ZCWZMBn0y+tAGw2KLkTCLHGSQNHxWMCL9tO2jVfngQkcpTEuhT0ghs6HFkXrbV7
         jxMFJERb9iERfLfLXIeEstA7TDMcaLQIQdsQysFswP6v0W+jTj0KzZz16CzKtfgZK/d5
         YU8i4KvjYqZhr1UUYJyW7cfFtyRHTipfih03wlDcD9vARX99s+nUplU0uwg251wi0xQ0
         Ngcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747816157; x=1748420957;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Yq/HLt0u14BIYiMVeYiqtquSRLg0l668z+sdOxNc1o=;
        b=xGTICn/6wfDRj9ebb5nNvRx8qPLU1zl8Wby16UJ1OsneWdjdabFaRM3TWrwccs0eJJ
         Fnoa2ilbaFkI7Aitslr+RMDs9v1uqg3YolL0Wbqh8ee2mJ9SZn5DmHGjtXh3TYV20oKE
         TzLrhS+/VB03oBmv1rl+X9gDJjvC5nUJZuAj507M5iX20N9bWt9v1BUSDN96GY+9Ps7t
         ksteYzpJBKtr+84TSsx5FFi13z3uYuKnSfKgvQw0AYW/kV8JYhfebFRIkTpVdh0nuLb7
         CbUAxNqrBS/FojblCy95RKJO/Ga1u7eJ1u7aMWUjjt81aoriwx/xwSGoUW62f0/SdO1g
         7agg==
X-Forwarded-Encrypted: i=1; AJvYcCU76eIWLurw/RUYW7kYu0m4itCt3R4fQ+jrt5fkRzkW89HbLBQaEVCSQHK6PlOB0K0b4PHRsRguByk8YpZuJzEEHg==@linaro.org, AJvYcCVsRlEjgncygx6S3Od5HyIxDZvJxnEqHLr+sk7bfosEtb4zxt5d1WErubGW3nDOfgdte0w+fh1fI5/hyKexxpLSn6M=@linaro.org, AJvYcCWq2fULzpzj9Zthm4t79ofKnlx5mdVub+02+2tI/R2cdjRQ0j6V0C+P82JJGcRg/gjrIEtVwoA=@linaro.org
X-Gm-Message-State: AOJu0YwgzHFhaVxXqL9cYndQyQIOkiozsRDD3qy6AA8sPjNZsMDJlD0h
	cWvpZZy5ZWSPZ5ReXg1VzyVI2LUzkDfEBqZ9qB1TxYVL+coV4ni35FOWlKqEF61Fqxh7NUHj/ee
	aq5A2Qfk/IdZXg8bwYXmdSHZ1HBXUQk8=
X-Gm-Gg: ASbGncuR/Te3mKZFebKl56HiqWZ1G1iLzToInlKSZIC7IMqIgeOFFbjB91x+Xp59w51
	7GT51VH4NZhYfnr6etPz2CjciDFXxUe8IaavrHZmzTPb1RQHfVmgvcRYcpwGXm6YDu6cXSrbnu4
	+s5IKOFaXHjqeUEhFn713OBZVBLJiclda2WFcq3cqqLOtqkH0A7RIrkp80llDA2hY=
X-Google-Smtp-Source: AGHT+IEUh3uoaveZbpcJPUlHTxMxs7OkktAMIfznj5fp70O+RYxcRAtZuaoB5EIpvZT5hUNQ7guv3tzIEtG1/4ORiHc=
X-Received: by 2002:a17:903:2284:b0:22f:b25b:8e93 with SMTP id
 d9443c01a7336-231de3b9f2cmr296656725ad.48.1747816157263; Wed, 21 May 2025
 01:29:17 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1747744132.git.ktokunaga.mail@gmail.com>
 <d3e7e584cf61c76952f4c9d913ba80d905c80e76.1747744132.git.ktokunaga.mail@gmail.com>
 <5d54270a-51be-4462-a02d-a12432e42be4@redhat.com>
In-Reply-To: <5d54270a-51be-4462-a02d-a12432e42be4@redhat.com>
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
Date: Wed, 21 May 2025 17:29:05 +0900
X-Gm-Features: AX0GCFtHiLrQRJyVIZfjX9qmk5k560ZlxcMBQ7lCVV5Zt-BYXWrNvzA8wIBXYI0
Message-ID: <CAEDrbUYGOfY5EPB2g-+VxFYhwrNUFKsGR8Lm4dxML0HwsAD_3A@mail.gmail.com>
Subject: Re: [PATCH 23/33] include/exec: Allow using 64bit guest addresses on emscripten
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Thomas Huth <thuth@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	=?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	WANG Xuerui <git@xen0n.name>, Aurelien Jarno <aurelien@aurel32.net>, 
	Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Aleksandar Rikalo <arikalo@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alistair Francis <Alistair.Francis@wdc.com>, Stefan Weil <sw@weilnetz.de>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org, 
	qemu-riscv@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000002fbbd40635a1292d"
X-TUID: H5ODnYzQ9zDY

--0000000000002fbbd40635a1292d
Content-Type: text/plain; charset="UTF-8"

Hi Paolo,

> On 5/20/25 14:51, Kohei Tokunaga wrote:
> >     target_kconfig = []
> >     foreach sym: accelerators
> > -    # Disallow 64-bit on 32-bit emulation and virtualization
> > -    if host_long_bits < config_target['TARGET_LONG_BITS'].to_int()
> > -      continue
> > +    if host_arch != 'wasm32'
> > +      # Disallow 64-bit on 32-bit emulation and virtualization
> > +      if host_long_bits < config_target['TARGET_LONG_BITS'].to_int()
> > +        continue
> > +      endif
> >       endif
> >       if sym == 'CONFIG_TCG' or target in accelerator_targets.get(sym,
[])
> >         config_target += { sym: 'y' }
>
> I'd prefer something like
>
> # Detect host pointer size for the target configuration loop.
> host_long_bits = cc.sizeof('void *') * 8
> tcg_vaddr_bits = host_arch == 'wasm32' ? 64 : host_long_bits
> ...
> config_host_data.set('TCG_VADDR_BITS', tcg_vaddr_bits)
>
> Then in the target configuration loop
>
> -    if host_long_bits < config_target['TARGET_LONG_BITS'].to_int()
> +    if tcg_vaddr_bits < config_target['TARGET_LONG_BITS'].to_int()
>
> and throughout the code you can have
>
> #ifdef TCG_VADDR_BITS == 32
> ...
> #else
> ...
> #endif
>
> instead of
>
> #ifdef EMSCRIPTEN
> ...
> #else
> ...
> #endif
>
> In fact, I think this patch would be acceptable as a separate
> submission, because it could be tested using TCI already.

Thank you for the feedback. I'll work on implementing this using
TCG_VADDR_BITS and submit it as a separated series.

--0000000000002fbbd40635a1292d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Paolo,<br><br>&gt; On 5/20/25 14:51, K=
ohei Tokunaga wrote:<br>&gt; &gt; =C2=A0 =C2=A0 target_kconfig =3D []<br>&g=
t; &gt; =C2=A0 =C2=A0 foreach sym: accelerators<br>&gt; &gt; - =C2=A0 =C2=
=A0# Disallow 64-bit on 32-bit emulation and virtualization<br>&gt; &gt; - =
=C2=A0 =C2=A0if host_long_bits &lt; config_target[&#39;TARGET_LONG_BITS&#39=
;].to_int()<br>&gt; &gt; - =C2=A0 =C2=A0 =C2=A0continue<br>&gt; &gt; + =C2=
=A0 =C2=A0if host_arch !=3D &#39;wasm32&#39;<br>&gt; &gt; + =C2=A0 =C2=A0 =
=C2=A0# Disallow 64-bit on 32-bit emulation and virtualization<br>&gt; &gt;=
 + =C2=A0 =C2=A0 =C2=A0if host_long_bits &lt; config_target[&#39;TARGET_LON=
G_BITS&#39;].to_int()<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0continue<br=
>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0endif<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 en=
dif<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 if sym =3D=3D &#39;CONFIG_TCG&#39; or=
 target in accelerator_targets.get(sym, [])<br>&gt; &gt; =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 config_target +=3D { sym: &#39;y&#39; }<br>&gt; <br>&gt; I&#39;d=
 prefer something like<br>&gt; <br>&gt; # Detect host pointer size for the =
target configuration loop.<br>&gt; host_long_bits =3D cc.sizeof(&#39;void *=
&#39;) * 8<br>&gt; tcg_vaddr_bits =3D host_arch =3D=3D &#39;wasm32&#39; ? 6=
4 : host_long_bits<br>&gt; ...<br>&gt; config_host_data.set(&#39;TCG_VADDR_=
BITS&#39;, tcg_vaddr_bits)<br>&gt; <br>&gt; Then in the target configuratio=
n loop<br>&gt; <br>&gt; - =C2=A0 =C2=A0if host_long_bits &lt; config_target=
[&#39;TARGET_LONG_BITS&#39;].to_int()<br>&gt; + =C2=A0 =C2=A0if tcg_vaddr_b=
its &lt; config_target[&#39;TARGET_LONG_BITS&#39;].to_int()<br>&gt; <br>&gt=
; and throughout the code you can have<br>&gt; <br>&gt; #ifdef TCG_VADDR_BI=
TS =3D=3D 32<br>&gt; ...<br>&gt; #else<br>&gt; ...<br>&gt; #endif<br>&gt; <=
br>&gt; instead of<br>&gt; <br>&gt; #ifdef EMSCRIPTEN<br>&gt; ...<br>&gt; #=
else<br>&gt; ...<br>&gt; #endif<br>&gt; <br>&gt; In fact, I think this patc=
h would be acceptable as a separate<br>&gt; submission, because it could be=
 tested using TCI already.<br><br>Thank you for the feedback. I&#39;ll work=
 on implementing this using<br>TCG_VADDR_BITS and submit it as a separated =
series.</div></div>

--0000000000002fbbd40635a1292d--
