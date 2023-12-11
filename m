Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp509828ejo;
        Mon, 11 Dec 2023 13:57:40 -0800 (PST)
X-Received: by 2002:a19:7412:0:b0:50b:f4ac:2e61 with SMTP id v18-20020a197412000000b0050bf4ac2e61mr2292437lfe.42.1702331859817;
        Mon, 11 Dec 2023 13:57:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702331859; cv=none;
        d=google.com; s=arc-20160816;
        b=ElyAui3/fe5j62RWmMzo/j/1qSLkuLHISmVPr7dX8GHIrmiO/UgOc1vYVu56jsMal+
         cL2cMtKRon4DYibdysDdH0j8Y9HjSDqFgIbYHyc+ZpRtf2RGYSHcOgWWvDo3rb/Tt3GH
         9EN1eBr6HMWCphyNfiAjPOOy/OcLvvd7wTa4Pw7GS7xTOvELEt2QD+epKEfBLyke+xii
         WOUC/4SNZ6BeyBgI2HMYGZeNfKRAF//pJBpEUAEVZOHvM9FBdawWttDDM9NJXrfDvFSF
         Xh/Ekkuchu+8rwNRk6wnzUu3wsBR6hjh6bIP0zDEMVuDIjKljof+cRIiFtMvxDqtUf+t
         c0RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UKPVikaa2BLezfE8Nh/92umz0KQtEqI+41mcl4l0ePw=;
        fh=eOqoSSwnjl5jaThnGlRW4g9uMXdn/sUszMfSc7si0fE=;
        b=IbhUhNV2FSXNOiU+SAwFhFqBu1zDgtUic8Scd0FILGzKuzM28cKs7RTYCd+u4tzDDz
         tXVKRJY2gFurlDYr4rUiy48YEkueDjhL9S6cSFOv17tsetVSxRGUm24/U8PJNOTZv9qT
         mGSHMNnhmwQosX2f1j5YPQ2XLmaAurnxXiKQuzP/Ag91/Av6lbCHvLS05wziQeqYYYUo
         AQgAGj8ZwNVxCZiMUEm5khxGaWBNCY5IUPltDlns3bIcOZXkoI3cuALMEAFdNYtHn3bM
         WxrDSNVzSpMMB7XxVuXQS4IzoLVAH9BPvjprw4P7vMma1VmvxR7DVvz1f8tUJ6R6CqHR
         oszw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=mCCAr0eX;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of wlosh@bsdimp.com) smtp.mailfrom=wlosh@bsdimp.com
Return-Path: <wlosh@bsdimp.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id br40-20020a056512402800b0050d135467b1sor1825256lfb.31.2023.12.11.13.57.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 11 Dec 2023 13:57:39 -0800 (PST)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of wlosh@bsdimp.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=mCCAr0eX;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of wlosh@bsdimp.com) smtp.mailfrom=wlosh@bsdimp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bsdimp-com.20230601.gappssmtp.com; s=20230601; t=1702331859; x=1702936659; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UKPVikaa2BLezfE8Nh/92umz0KQtEqI+41mcl4l0ePw=;
        b=mCCAr0eXEYbgoAgxMubBjPpVnAHrbjV2KJd+k6+n5T/ptrsReE/VoUeN03OJ1omsoV
         AzudrYsFAKWXPy/fLCCsqmEs+/62UILCZfFatYXeWSNYtYB2ot5sHpntW94zldGddMBu
         XGicyB7Yvh9IPWixSVfCdCfPiuDlK2MPWm5QtoKM7C5Y4HY3zEKHIzgxBqHiN1U7lv+n
         bYFLY9j4NPSnj1s039lI862PVMDyhKEnke7Nxj6czaQ4itKm8C5ERRk1Sg8wyHOxSG8D
         aUev81W7PYW26lJgrF1VeCEliv9f0agZ2MyJVpxjkehVsJIXI4ZaPYRw1h3Z2L7jdR1V
         GP1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702331859; x=1702936659;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UKPVikaa2BLezfE8Nh/92umz0KQtEqI+41mcl4l0ePw=;
        b=sF0pgXtw3wMx0xcD76+VSRmS34291mEvhAAjd+GR5j3I1XOFoOaKQbzB3uAliy4mUt
         p1U88FEAUYywAoWBHGxl1AsMiW6qGw7X1Hqc8VVFv6/tVCqj5tdrZk64fO2bSf9lpL2E
         879xfofJKeIvOrNiAsrizKw5h8y/hqgeWdw/S9K4RL7TB3hH7MesD+HKMQ5U/z29EOaK
         cBZlF8kQR7PfBHmfhhDsC9YmXAWYosRhNoA5nArGeFFBk4REjl/qQ6htB32IAgbQKf/Y
         8SOwIf97jsfWibohzA9KITCoqsNIFxYSRzHkkFneS0MC0eB6vYVk9y31JPlxpRoLOSDY
         mz9Q==
X-Gm-Message-State: AOJu0Yz4SyTroT6hu/AF9zIBAAYM9cW6XaZgKfc+Cj1a/ToLF4LTy3Vk
	ZhFFEW0AI1lhCXxQBnSMZSKyLHzTrf1dOcud/vNCBg==
X-Google-Smtp-Source: AGHT+IG2qMuzvVV1CtWvhYnE38e244SwEqL/xcTix+Kr15BR7ZuKHiaqT3xa9LzluUeec4JTOBB8iJLUsObH0AmIbdY=
X-Received: by 2002:a05:6512:3a92:b0:50c:de34:da09 with SMTP id
 q18-20020a0565123a9200b0050cde34da09mr3009336lfu.101.1702331859299; Mon, 11
 Dec 2023 13:57:39 -0800 (PST)
MIME-Version: 1.0
References: <20231211212003.21686-1-philmd@linaro.org> <20231211212003.21686-15-philmd@linaro.org>
In-Reply-To: <20231211212003.21686-15-philmd@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 11 Dec 2023 14:57:28 -0700
Message-ID: <CANCZdfoHViOt9-wnZ_HxHpKm2r2A_RH90MVjMF3tGjRvnjTd-w@mail.gmail.com>
Subject: Re: [PATCH 14/24] gdbstub: Include missing 'hw/core/cpu.h' header
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>, Peter Xu <peterx@redhat.com>, 
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Peter Maydell <peter.maydell@linaro.org>, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Eduardo Habkost <eduardo@habkost.net>, qemu-arm@nongnu.org, 
	Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>, 
	Claudio Fontana <cfontana@suse.de>, Brian Cain <bcain@quicinc.com>, 
	Daniel Henrique Barboza <danielhb413@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000c3897e060c430573"
X-TUID: n4Lc6tJ/UEE4

--000000000000c3897e060c430573
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2023 at 2:22=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 <philmd=
@linaro.org>
wrote:

> Functions such gdb_get_cpu_pid() dereference CPUState so
> require the structure declaration from "hw/core/cpu.h":
>
>   static uint32_t gdb_get_cpu_pid(CPUState *cpu)
>   {
>     ...
>     return cpu->cluster_index + 1;
>   }
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  gdbstub/gdbstub.c | 1 +
>  1 file changed, 1 insertion(+)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>

--000000000000c3897e060c430573
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 11, 2023 at 2:22=E2=80=AF=
PM Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org">phi=
lmd@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">Functions such gdb_get_cpu_pid() dereference CPUState so<br>
require the structure declaration from &quot;hw/core/cpu.h&quot;:<br>
<br>
=C2=A0 static uint32_t gdb_get_cpu_pid(CPUState *cpu)<br>
=C2=A0 {<br>
=C2=A0 =C2=A0 ...<br>
=C2=A0 =C2=A0 return cpu-&gt;cluster_index + 1;<br>
=C2=A0 }<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@lin=
aro.org" target=3D"_blank">philmd@linaro.org</a>&gt;<br>
---<br>
=C2=A0gdbstub/gdbstub.c | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br></blockquote><div><br></div><div>Re=
viewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com">imp@bsdimp.com=
</a>&gt;</div><div>=C2=A0</div></div></div>

--000000000000c3897e060c430573--
