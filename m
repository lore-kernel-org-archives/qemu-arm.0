Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp535835ejc;
        Mon, 25 Sep 2023 10:06:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2Tlx3hDt2m54c+PPbkdapA428WANyV6PW4ElkVk+C6iWeJEeqCGY9QMrWWONtF6Q1k4zc
X-Received: by 2002:a05:6102:366b:b0:44d:42c4:f4c0 with SMTP id bg11-20020a056102366b00b0044d42c4f4c0mr3139411vsb.3.1695661586965;
        Mon, 25 Sep 2023 10:06:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695661586; cv=none;
        d=google.com; s=arc-20160816;
        b=yEO+V6XRNd8nyP8XnO67wZV+KT0KiM1J8Z0KlxXZvkqt4nnjIXtIqPxa2QSjQ08Jui
         b3xa4xFaHsB2cQ1TIFf+6qbybJDmyE0xSrgXudLMoYfW5q2zmW7ucTBr0PRJ7rtq7cYl
         P6kteMwFNttXgPGhxyRUEMB6eqEX+2BKB6Sw5ID3kmh7CIXzqCXPoDSkywDiSlfOsDQ4
         1VX6hhrB/iYo3mTZcwrHuD+ko6S+1YPENX67Y5jpzoGf8a8q5W+Kk7qkX1U/zljoPzN+
         BbWWt2oo3t80L0tVRjQDWZ5vbnTzOGU97k3DC0LmnpmzJ11dRMERuL6Lu95Cg0EGTgwh
         5K+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LDm5R4GeSOdbeUEoV9jGBuX5oNous+Ah519BTpIljNM=;
        fh=p2A+mgBmAAdLf2Uq43+cTlX1kJloWBuV/XnDBgYDsYQ=;
        b=UFlUXEftWvEAPMfCzxB4QiMGMQEtbQg6Civ6i6gHC0hvTdx6RxdVIowaYS91RRYEqO
         WVLAgbuU0lY6h0RO2QqHjjD3v5jKEjM92c6IgT5zuxksJ0QgwZGY7RhSNsGv0gs9zcU/
         eFAaTub2/8o5sFRswT/hHP5efX7tixGfyVf26woZANkxGfDnHXln4AO6ycqUMwIVMFr5
         edNqaQwzCfso2fysF6Rm9jYRf6EYrtfohFwpZY4UBbkPXuihdZ2XxyCEzMqgZHY6SREA
         D8UlHPhyO2SzRXaFvJH+7gLoV1VYpq5rQ7bAyZoX/z2pIBfMOuPG8wyKRS1ODvogNUVp
         +1QQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="VbD/1Z6c";
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id g17-20020ac85d51000000b00417d93ca9d3si4583874qtx.146.2023.09.25.10.06.26
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 10:06:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="VbD/1Z6c";
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695661586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LDm5R4GeSOdbeUEoV9jGBuX5oNous+Ah519BTpIljNM=;
	b=VbD/1Z6cG4D6BHRgEpVuwYAggEh/tx88xIalE//RCsJrrDi2KypmEp4z4Wn2ACVR3gNvwi
	+WtJ9fZ6zaEQ3uZ+yRTMTd+WoekmXjDVaL8x11dT3bQ8ssvCusYgHaCuZV0haKcWqK+/ai
	XOuh9v6zJL3D8sIRmOS2U9ye11IahpA=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-503-6msa-AhzNCSO2Qe5oY1wJg-1; Mon, 25 Sep 2023 13:06:25 -0400
X-MC-Unique: 6msa-AhzNCSO2Qe5oY1wJg-1
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-79d966b4c6fso1913831241.2
        for <alex.bennee@linaro.org>; Mon, 25 Sep 2023 10:06:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695661584; x=1696266384;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LDm5R4GeSOdbeUEoV9jGBuX5oNous+Ah519BTpIljNM=;
        b=MemHLhyx7LItWcxsgy3I8yH3DCrYT+hVSgByuLPfKJrOTh/vjtzq0MjflW5Osxe63A
         lGYsfkO1p/uZOvZkA7iJBp8BscXauloXWJPA4lCYdlFMkeOa+YEDi/nDx6jZJ68m/SOM
         m5OgjLZ9yJuzOYGujEAGRQML+lS5Z6LDf0g71sIKMFlE8wvKNcimWuBVf5wWD4Rl7iOg
         iXPBO19Li+iuVsJtbyBiTdH8OUy7ojbyJBitaShsWiAwRXFg+NVJVlVQqeblqoyFbwIy
         diXxDnSdKcAKEscyeKdX1/1+/yLHOrwUni3CX6Ivp7NISh89TpG7wNVLGigywLvZAD/M
         cX5A==
X-Gm-Message-State: AOJu0YzXu+2WGor4ytt8QXzYLXGIMVpLUpgk/NMjeLzo4aZ5CAlszjXK
	B8RqqQ9hvwejUdSPMnoK10x+ZXCHd+4ZJNdq7FHWRUS+CH6jVCcVnpqRgMbhjZTPWLOQ+pDEmK0
	YFSTbVnTLSe+oD762UoDKlXa/Q4ADQhW8b9xyEJ0b
X-Received: by 2002:a05:6102:383:b0:452:94b8:2fe9 with SMTP id m3-20020a056102038300b0045294b82fe9mr3108885vsq.21.1695661583888;
        Mon, 25 Sep 2023 10:06:23 -0700 (PDT)
X-Received: by 2002:a05:6102:383:b0:452:94b8:2fe9 with SMTP id
 m3-20020a056102038300b0045294b82fe9mr3108839vsq.21.1695661583616; Mon, 25 Sep
 2023 10:06:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230925144854.1872513-1-alex.bennee@linaro.org>
 <20230925144854.1872513-9-alex.bennee@linaro.org> <908ae9aa-11fc-8584-bd60-e269a1026e37@redhat.com>
 <87cyy6rylx.fsf@linaro.org>
In-Reply-To: <87cyy6rylx.fsf@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 25 Sep 2023 19:06:11 +0200
Message-ID: <CABgObfYHRCoNCPW5QpydfttBMBXW7tvZo5PuQ5FYTGoVt9eorw@mail.gmail.com>
Subject: Re: [PATCH 08/31] configure: ensure dependency for cross-compile setup
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>, 
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, John Snow <jsnow@redhat.com>, 
	libvir-list <libvir-list@redhat.com>, =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	qemu-s390x <qemu-s390x@nongnu.org>, Song Gao <gaosong@loongson.cn>, 
	Daniel Henrique Barboza <danielhb413@gmail.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
	Weiwei Li <liweiwei@iscas.ac.cn>, Nicholas Piggin <npiggin@gmail.com>, 
	Radoslaw Biernacki <rad@semihalf.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Eduardo Habkost <eduardo@habkost.net>, Cleber Rosa <crosa@redhat.com>, 
	Mahmoud Mandour <ma.mandourr@gmail.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Thomas Huth <thuth@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Bin Meng <bin.meng@windriver.com>, 
	Alexandre Iooss <erdnaxe@crans.org>, Xiaojuan Yang <yangxiaojuan@loongson.cn>, 
	"zmta06.collab.prod.int.phx2.redhat.com, list@suse.de" <qemu-ppc@nongnu.org>, David Hildenbrand <david@redhat.com>, 
	Yanan Wang <wangyanan55@huawei.com>, Peter Maydell <peter.maydell@linaro.org>, 
	"open list:RISC-V" <qemu-riscv@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Ilya Leoshkevich <iii@linux.ibm.com>, 
	Laurent Vivier <lvivier@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Leif Lindholm <quic_llindhol@quicinc.com>, Beraldo Leal <bleal@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000059e3a7060631fa97"
X-TUID: yeGCDIzUHcQ3

--00000000000059e3a7060631fa97
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il lun 25 set 2023, 18:45 Alex Benn=C3=A9e <alex.bennee@linaro.org> ha scri=
tto:

> Paolo Bonzini <pbonzini@redhat.com> writes:
> > On 9/25/23 16:48, Alex Benn=C3=A9e wrote:
> >>             echo "HOST_GDB_SUPPORTS_ARCH=3Dy" >> "$config_target_mak"
> >>         fi
> >>   +      echo "$config_target_mak: configure" >> Makefile.prereqs
> >
> > This in practice is not adding anything; if "configure" changes then
> > Makefile's dependency on config-host.mak will trigger a configure
> > rerun anyway.
> >
> > If you want to add it, you should also add it for other config-*.mak
> > files.  However, I'd remove this line and just change
> >
> > -# 1. ensure config-host.mak is up-to-date
> > +# 1. ensure config-host.mak is up-to-date.  All other config-*.mak
> > +# files for subdirectories will be updated as well.
>
> Peter ran into a mismatch between config-host.mak and
> tests/tcg/foo/config-target.mak in his build system so it didn't get
> picked up at one point.
>

But what is the rule that the new dependency is going to trigger? As far as
I can see there is no rule to regenerate the $config_target_mak files, and
also no rule to regenerate configure; the only effect of a change to
configure will be rerunning the script, but that's triggered by the
existing config-host.mak rule.

Paolo


> >
> > in the Makefile.
> >
> > Paolo
>
>
> --
> Alex Benn=C3=A9e
> Virtualisation Tech Lead @ Linaro
>
>

--00000000000059e3a7060631fa97
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il lun 25 set 2023, 18:45 Alex Benn=C3=A9e &lt;<a href=
=3D"mailto:alex.bennee@linaro.org">alex.bennee@linaro.org</a>&gt; ha scritt=
o:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">Paolo Bonzini &lt;<a href=3D"mai=
lto:pbonzini@redhat.com" target=3D"_blank" rel=3D"noreferrer">pbonzini@redh=
at.com</a>&gt; writes:<br>&gt; On 9/25/23 16:48, Alex Benn=C3=A9e wrote:<br=
>&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;HOST_GD=
B_SUPPORTS_ARCH=3Dy&quot; &gt;&gt; &quot;$config_target_mak&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;&gt;=C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 echo &quot;$config_target_mak: c=
onfigure&quot; &gt;&gt; Makefile.prereqs<br>
&gt;<br>
&gt; This in practice is not adding anything; if &quot;configure&quot; chan=
ges then<br>
&gt; Makefile&#39;s dependency on config-host.mak will trigger a configure<=
br>
&gt; rerun anyway.<br>
&gt;<br>
&gt; If you want to add it, you should also add it for other config-*.mak<b=
r>
&gt; files.=C2=A0 However, I&#39;d remove this line and just change<br>
&gt;<br>
&gt; -# 1. ensure config-host.mak is up-to-date<br>
&gt; +# 1. ensure config-host.mak is up-to-date.=C2=A0 All other config-*.m=
ak<br>
&gt; +# files for subdirectories will be updated as well.<br>
<br>
Peter ran into a mismatch between config-host.mak and<br>
tests/tcg/foo/config-target.mak in his build system so it didn&#39;t get<br=
>
picked up at one point.<br></blockquote></div></div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">But what is the rule that the new dependency is goin=
g to trigger? As far as I can see there is no rule to regenerate the $confi=
g_target_mak files, and also no rule to regenerate configure; the only effe=
ct of a change to configure will be rerunning the script, but that&#39;s tr=
iggered by the existing config-host.mak rule.</div><div dir=3D"auto"><br></=
div><div dir=3D"auto">Paolo</div><div dir=3D"auto"><br></div><div dir=3D"au=
to"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
&gt;<br>
&gt; in the Makefile.<br>
&gt;<br>
&gt; Paolo<br>
<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
Virtualisation Tech Lead @ Linaro<br>
<br>
</blockquote></div></div></div>

--00000000000059e3a7060631fa97--
