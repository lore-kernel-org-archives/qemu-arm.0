Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp274067ejq;
        Thu, 4 May 2023 05:46:20 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4XGqS+gQHLzSuLmeO3G2wTanKHX3h2ydDYLO5ZiEvqgvJ/5YOzde+nUllWUQ9sKVBWYx8i
X-Received: by 2002:a17:907:1c15:b0:94e:13e9:3926 with SMTP id nc21-20020a1709071c1500b0094e13e93926mr6813471ejc.19.1683204379882;
        Thu, 04 May 2023 05:46:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683204379; cv=none;
        d=google.com; s=arc-20160816;
        b=uu1e0Ne5C5N55/jCpk5ahGh8aSciEB0BpfvTHunftwSb3PphHEXFNUlSpxNZsjtILn
         WYDMb+D/kIooMSVybPYW3pjnc1BGCtt7jjRl/SQSu4uAB7FdD/Ml3cWJLCdB/U16+sX5
         8fDbOZT41U/TLOxp0xQQ/jbHqnKsb5JKOEIpwZzbHur+4srW0k7wZMsVGJcnHwQTFvpp
         Py4ruwgiXOgVrmM993405gZLWbkofonxKZuwj87D+3D52SjnKKpSl+EPozB5kVa0Ulxm
         MelXHQdnS3dYyLSyd1fMtf180/kn3FaotMpejc52Mnllk7eA4PHWWzQ03U37Ov8JZVOr
         5mkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=B9YqC0o9/qkX6yUGHRT52JjR4W4HUdj4HYbhRjn1iRg=;
        b=r55frcA4lVdk1zfAbqbph/o4UM+CSjBKS1/z5VvwaVhfU1R1Li7U0fSUKq1eyw3WDi
         3vfEbmSWIBd1F58GseDkgV9ep2llysRkDp7SwFm5h6wciy3u3/vOHHVrdceR5Ky97RuN
         XtZGeDOJFNlKDveZy9H5EdHelEM+HHgFiisHpJeDL7dcKLXuy7eO3MNt9OKJpL4UELTs
         NLxOvQHoA4kiAl0YmYFmSVsvT8OKF13pKJ4KqHkZIFeMUqabqOIxrijK2JVGES+RRAg1
         9KbNGnd3VCL8oKYm82WRrsu0fniGUd4OLn9LZRlk3Jc9pbG9XR5oQN4E5wLjMoghXr1S
         Mo0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bF1YK6ic;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id nd33-20020a17090762a100b00965bab05946si530219ejc.343.2023.05.04.05.46.19
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 05:46:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bF1YK6ic;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683204378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B9YqC0o9/qkX6yUGHRT52JjR4W4HUdj4HYbhRjn1iRg=;
	b=bF1YK6ic6ZQUKVErGgNEqUb3MhsZvm1FxEFTwFt+DnfOjWfsYOqPPz/5hg7NTlDfGJfvtw
	BI2I8qJvUIlCdXgmmHEZK8/Nc+q/GxczY+SkmZwIAjd504I4ypDZL+I59InTfOOLd6Ju9F
	FH587q+RStZDu6Zrj6cGzKmM576ZPmA=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-16-QKnj20S4P42vxy8ZTeOxEQ-1; Thu, 04 May 2023 08:46:17 -0400
X-MC-Unique: QKnj20S4P42vxy8ZTeOxEQ-1
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-4346c6cac99so273263137.3
        for <alex.bennee@linaro.org>; Thu, 04 May 2023 05:46:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683204377; x=1685796377;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B9YqC0o9/qkX6yUGHRT52JjR4W4HUdj4HYbhRjn1iRg=;
        b=YSiyTTPHSqo3jpacWbO+gLpfR9d9r1Iqzu2sW2PEGAV1mCAEXhF83c8maTWeL70zZg
         YQxN4XlGzfpElv1oYailI61YmVGb6BHKbldwjcvMHf63zIXIcFnWhVLT8nUtnv2Yh/q1
         tpuATkW0cnOuYliKCr36uH7UppaA5klZr2uG2SZJFWcHsjQCpB0b3EWSTAs5O4SMZRE9
         5bK7rYkW1DDndPr25XnhdqDCyVn5X4ldukvdfy2IRoak8uyiKh2tpNt4nTAwpzKTvYIL
         5Pt1Jq88xUUvW5WFM8RjozCapA1M0iQS857WV9ev/inzEykx6EON/ez1+57EVQyTl5B8
         O4EQ==
X-Gm-Message-State: AC+VfDwKNCKlGAoRYfUF+CcE67vgAzo5MZEF1/U2Wtu8uCwwzf47jxZ8
	8HPTvzgpyRQWu5Wlx+r2NaoiAwhleGHi2kJ+cirdwqBdfu62djWDLVlvz7+hr6pykzlwwBCO4w8
	sMuXqQkThesVsbKsEp0b9Y5r2yL68pvXN
X-Received: by 2002:a05:6102:3668:b0:434:3aa0:ecaf with SMTP id bg8-20020a056102366800b004343aa0ecafmr2207007vsb.8.1683204376992;
        Thu, 04 May 2023 05:46:16 -0700 (PDT)
X-Received: by 2002:a05:6102:3668:b0:434:3aa0:ecaf with SMTP id
 bg8-20020a056102366800b004343aa0ecafmr2206998vsb.8.1683204376739; Thu, 04 May
 2023 05:46:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230503193833.29047-1-farosas@suse.de> <20230503193833.29047-2-farosas@suse.de>
 <3f8ed21a-6c05-e7a4-ab9a-c8f6ca041013@redhat.com> <CAFEAcA9y0tZVCSz93ziHkwYaM_whaEnCko2=Zzyb=BGFySJyRg@mail.gmail.com>
In-Reply-To: <CAFEAcA9y0tZVCSz93ziHkwYaM_whaEnCko2=Zzyb=BGFySJyRg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 4 May 2023 14:45:44 +0200
Message-ID: <CABgObfbBTUUAOmvKz9U2Esi3rmdYmbhw3uR5iouFYUwFGoG32Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] target/arm: Use CONFIG_SEMIHOSTING instead of TCG for semihosting
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Fabiano Rosas <farosas@suse.de>, qemu-devel <qemu-devel@nongnu.org>, 
	qemu-arm <qemu-arm@nongnu.org>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000f5d4cf05fadd8e22"
X-TUID: h58i3k5gw3Ii

--000000000000f5d4cf05fadd8e22
Content-Type: text/plain; charset="UTF-8"

Il gio 4 mag 2023, 10:59 Peter Maydell <peter.maydell@linaro.org> ha
scritto:

> On Thu, 4 May 2023 at 08:33, Paolo Bonzini <pbonzini@redhat.com> wrote:
> >
> > On 5/3/23 21:38, Fabiano Rosas wrote:
> > > When building --without-default-devices, the semihosting code will not
> > > be available, so check the proper config.
>
> I think the changes to the ifdeffery are conceptually
> fine (only do semihosting if it was configured in), but
> it sounds like there's a separate problem here.
> Whether we need semihosting depends on the accelerator (ie
> "is it TCG or not"), not on what set of devices we're building.
> So the problem seems to me to be that --without-default-devices
> is causing the semihosting code not to be built in.
>
> > Acked-by: Paolo Bonzini <pbonzini@redhat.com>
> >
> > for this change; however, there are two more related issues:
> >
> > 1) you still want to leave out the code if !TCG, because KVM is not able
> > to exit to userspace on semihosting calls as far as I understand
> >
> > 2) I am not sure why CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y appears in
> > config/targets/{arm,riscv32,riscv64}-softmmu/default.mak.
>
> Because those are the architectures which have
> "arm-compatible" semihosting ABIs ?
>

Yes but is there a reason to do it in configs/ where all the other symbols
are boards, or was it just overlooked and a "default y" (as I suggested in
the previous reply) or "imply" is better?

The latter would be

config ARM_COMPATIBLE_SEMIHOSTING
    bool
    depends on TCG

and under "config ARM/RISCV32/RISCV64"

imply ARM_COMPATIBLE_SEMIHOSTING

Paolo

>
> -- PMM
>
>

--000000000000f5d4cf05fadd8e22
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il gio 4 mag 2023, 10:59 Peter Maydell &lt;<a href=3D"=
mailto:peter.maydell@linaro.org" target=3D"_blank" rel=3D"noreferrer">peter=
.maydell@linaro.org</a>&gt; ha scritto:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">On Thu, 4 May 2023 at 08:33, Paolo Bonzini &lt;<a href=3D"mailto:pbonz=
ini@redhat.com" rel=3D"noreferrer noreferrer" target=3D"_blank">pbonzini@re=
dhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On 5/3/23 21:38, Fabiano Rosas wrote:<br>
&gt; &gt; When building --without-default-devices, the semihosting code wil=
l not<br>
&gt; &gt; be available, so check the proper config.<br>
<br>
I think the changes to the ifdeffery are conceptually<br>
fine (only do semihosting if it was configured in), but<br>
it sounds like there&#39;s a separate problem here.<br>
Whether we need semihosting depends on the accelerator (ie<br>
&quot;is it TCG or not&quot;), not on what set of devices we&#39;re buildin=
g.<br>
So the problem seems to me to be that --without-default-devices<br>
is causing the semihosting code not to be built in.<br>
<br>
&gt; Acked-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" rel=
=3D"noreferrer noreferrer" target=3D"_blank">pbonzini@redhat.com</a>&gt;<br=
>
&gt;<br>
&gt; for this change; however, there are two more related issues:<br>
&gt;<br>
&gt; 1) you still want to leave out the code if !TCG, because KVM is not ab=
le<br>
&gt; to exit to userspace on semihosting calls as far as I understand<br>
&gt;<br>
&gt; 2) I am not sure why CONFIG_ARM_COMPATIBLE_SEMIHOSTING=3Dy appears in<=
br>
&gt; config/targets/{arm,riscv32,riscv64}-softmmu/default.mak.<br>
<br>
Because those are the architectures which have<br>
&quot;arm-compatible&quot; semihosting ABIs ?<br></blockquote></div></div><=
div dir=3D"auto"><br></div><div dir=3D"auto">Yes but is there a reason to d=
o it in configs/ where all the other symbols are boards, or was it just ove=
rlooked and a &quot;default y&quot; (as I suggested in the previous reply) =
or &quot;imply&quot; is better?</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">The latter would be</div><div dir=3D"auto"><br></div><div dir=3D"=
auto">config ARM_COMPATIBLE_SEMIHOSTING</div><div dir=3D"auto">=C2=A0 =C2=
=A0 bool</div><div dir=3D"auto">=C2=A0 =C2=A0 depends on TCG</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">and under &quot;config ARM/RISCV32/RI=
SCV64&quot;</div><div dir=3D"auto"><br></div><div dir=3D"auto">imply ARM_CO=
MPATIBLE_SEMIHOSTING</div><div dir=3D"auto"><br></div><div dir=3D"auto">Pao=
lo</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">
<br>
-- PMM<br>
<br>
</blockquote></div></div></div>

--000000000000f5d4cf05fadd8e22--
