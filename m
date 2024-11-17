Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp1992207njc;
        Sun, 17 Nov 2024 03:16:34 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXHGjNtfwvvmAWb2mmRZfH9x6tLA0+W5e/CwDErdUmyYAK4DlB2tMlMvChKus6VFSf1aAjPy5qw7zxITA==@linaro.org
X-Google-Smtp-Source: AGHT+IGsP0CR8nhw8QjqLUpkvvuRdEe1O8uz3Em9sMSB3TL0V4de5d29BmBCuhiJtXhnb67nvjz5
X-Received: by 2002:a05:622a:5919:b0:460:ad8e:f5ae with SMTP id d75a77b69052e-46363e063c0mr140179441cf.19.1731842194256;
        Sun, 17 Nov 2024 03:16:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731842194; cv=none;
        d=google.com; s=arc-20240605;
        b=TFOrBDwVmPtE/kIlrdFxe64I534Sh01kLS37EwxvV3IAYg6ihxSLPqFLNO5FP8jd/a
         Pmf6dH8k010xXg5eKpv1BLBl3LxLW3NiGi/HV0Ew8XFHGNihkP+0txNeklXsRs2DZmOY
         EMsNaVmPxjn61xeDQdPX8sh6pvd0h+FJWtQ7g5SYausXXntyW22YaCwwf0QQUVZxmzFS
         GV1tCJ61T7BNCISnh3kNHi3fpsiuctXddG+CV4BNwbLoAXJ7RV39bwq/XHUE14zuyG2S
         VLQJa69BTLk7xN+4Y6twqGBePcxxTfhEw8PPgsyjOIo43JCbb/D9PJgdvpC9sG3VJMFG
         K+tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Akw0Jpsvyllf2/gLpC1tMXDGBC/KDHr+UbcU6YPA/WU=;
        fh=g28+ku+iT7V5FiMGoxI3xD5fC0QcwFyoAM5HEvVgaEo=;
        b=AMm6eD8Ax8YAmaIaLXj1uBCJPAgHqEq7QrjWLEQ927KPkVMABllY16UH0NdOjqV3dx
         6vp05RmUpbwaPk+nUDyg4tRZ601wncmYZOPO2u1Qo0EQ/2HndMXjFMkNl3fUwfCMVMq2
         fvF/8Y7mY8URSZft3NNSDVOSfOVmq5Dw3a18VpuhUMlYMSIPuX1IfIX+ZH1AwJDDocRq
         kzd2TauDybKQ205acuKbO+TjHH++0IwWOI5oxMyHX9lDNiCBjZ38HKQ7KgrV6JRpJuyi
         MzYmS5A+IJY9xXwuLY3bbfkR7rEAfFCHHzdoqrbC5QLMxmrCS7juVQyHFa5OBM8Og9G9
         IsbQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="dzS0fg/c";
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7b35cab2633si811603585a.487.2024.11.17.03.16.34
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Nov 2024 03:16:34 -0800 (PST)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="dzS0fg/c";
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731842193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Akw0Jpsvyllf2/gLpC1tMXDGBC/KDHr+UbcU6YPA/WU=;
	b=dzS0fg/czVrXZfot5kKtCTPztS4qM4OkV0RRa6gRN9HDWAl9AenMOMxcf5JaQHeRmTQXMF
	BIP3r7DuXsmOp2hNi+LzZLGo13/6ebT0BcN3frupntfsbrnEqiAc5OlzAdgvIrLmRbEfLe
	kabEi4sy1g1aRVviV4MkTK9IqqB4g7k=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-182-Fw-_89rzM8SCYj7RlfeciA-1; Sun, 17 Nov 2024 06:16:32 -0500
X-MC-Unique: Fw-_89rzM8SCYj7RlfeciA-1
X-Mimecast-MFC-AGG-ID: Fw-_89rzM8SCYj7RlfeciA
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-382440c1f83so98592f8f.1
        for <alex.bennee@linaro.org>; Sun, 17 Nov 2024 03:16:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731842191; x=1732446991;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Akw0Jpsvyllf2/gLpC1tMXDGBC/KDHr+UbcU6YPA/WU=;
        b=uEyYFZogu5bLs7EbUTXOoorY34519Dj7LxjO8l2SCuYIgRHQPbu3P9V4Nzr6W92sbe
         h3uhuZUaMPstTXHrXZ9ZfZ4BTsUtWr3M/1lwtjrbffhR+2Uar2cVgI3EtxvwLC+U7nOG
         gMYuJv19Sh8KfKYG6mUWD6tUfjST4jBNv2AvYvDoSajQBhYn6idoBTOqEyLZJnYsXBOv
         wxIXzdJKmqbgck1aI0Zl0YOuxEg0T29hj94zqF8VV9NYnNmprPwE/IVHfoE58qZCJbxf
         z6Mjn7iBlHYY+akpY9U17lzlKMgp2Ip9vVV85XozARpulvdTxKZmdXLlUgroExphmdmP
         GKOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoPp4tugQ+CQuY9LdZBs07JXom8Peak5p6XeU+hmGrBKPwYLamS2V6pzWouHWq4F18ne6MSt0daiS/AQ==@linaro.org
X-Gm-Message-State: AOJu0YxH6ftYxpn/oypRqLBPDA9doIWqexHj9HB6T9rUOOK7lUM/moov
	7bRUw8xFyfRL9k1HSJ9MUwP5Tw0ii27RhADtbxSz5sAuZ3jjb4mUgnIklng6l8S2n01ylL4LuTE
	yYLtXpoQBtSro8LYdx1YAI7Y4Mpl4LlM0BsiALmL8SmHBuczs8OaDWyr09WMX7su1LQNkQIj4eT
	7jddAiH/WiGN5ijvy+bFnzYh8Ty4vW
X-Received: by 2002:a5d:59a2:0:b0:37d:47ef:17d0 with SMTP id ffacd0b85a97d-38224f861c6mr7780336f8f.13.1731842190817;
        Sun, 17 Nov 2024 03:16:30 -0800 (PST)
X-Received: by 2002:a5d:59a2:0:b0:37d:47ef:17d0 with SMTP id
 ffacd0b85a97d-38224f861c6mr7780320f8f.13.1731842190516; Sun, 17 Nov 2024
 03:16:30 -0800 (PST)
MIME-Version: 1.0
References: <20241116221757.3501603-1-manos.pitsidianakis@linaro.org>
 <CAFEAcA9m7EnMX+=T0TL2R_NCJqaPUPCUcoYzAo4P2oRUZbM6Kg@mail.gmail.com> <CAAjaMXZE+KKJnvcMpmpaH+dmO7MQVmJm7pD+i1yo_5Wb9-ERcQ@mail.gmail.com>
In-Reply-To: <CAAjaMXZE+KKJnvcMpmpaH+dmO7MQVmJm7pD+i1yo_5Wb9-ERcQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sun, 17 Nov 2024 12:16:16 +0100
Message-ID: <CABgObfadfaohQNf5AheVAUSL5G8i9+zeTOwXRPhOwC_6NpTvmQ@mail.gmail.com>
Subject: Re: [PATCH v2] rust/pl011: Fix DeviceID reads
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
	"open list:ARM SMMU <qemu-arm@nongnu.org>," <qemu-devel@nongnu.org>, "open list:ARM SMMU" <qemu-arm@nongnu.org>, qemu-rust@nongnu.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Gustavo Romero <gustavo.romero@linaro.org>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: y1aIIMKMAVjsWsf2u2IJFQN3eb3GjyYxA51AtciRvak_1731842191
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000092c2d5062719ee65"
X-TUID: CCwl9l1h/KJq

--00000000000092c2d5062719ee65
Content-Type: text/plain; charset="UTF-8"

Il dom 17 nov 2024, 11:21 Manos Pitsidianakis <
manos.pitsidianakis@linaro.org> ha scritto:

> This seems extremely verbose and rather obscures the fact that these
>> registers are a set of adjacent simple ID registers, compared to
>> the previous code which defined them as an array of values.
>
>
> One could abstract them with declarative macros to reduce the line count.
> WDYT about that approach?
>

No, this is just overcomplicating things. Like Peter said, just use arrays.
Copying from the V1 review for reference:

     const UART_PCELL_ID: [u8; 4] = [0x0d, 0xf0, 0x05, 0xb1];
     const ARM_UART_PERIPH_ID: [u8; 4] = [0x11, 0x10, 0x14, 0x00];
     const LUMINARY_UART_PERIPH_ID: [u8; 4] = [0x11, 0x00, 0x18, 0x01];

     /// Value of `UARTPeriphID0` through `UARTPeriphID3` registers
     const fn uart_periph_id(&self, idx: usize) -> u8 {
         match self {
             Self::Arm => ARM_UART_PERIPH_ID,
             Self::Luminary => LUMINARY_UART_PERIPH_ID,
         }[idx]
     }

     /// Value of `UARTPCellID0` through `UARTPCellID3` registers
     const fn uart_pcell_id(idx: usize) -> u8 {
         Self::UART_PCELL_ID[idx]
     }

Paolo

>

--00000000000092c2d5062719ee65
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><br><br><div class=3D"gmail_quote" dir=3D"auto"><div dir=
=3D"ltr" class=3D"gmail_attr">Il dom 17 nov 2024, 11:21 Manos Pitsidianakis=
 &lt;<a href=3D"mailto:manos.pitsidianakis@linaro.org">manos.pitsidianakis@=
linaro.org</a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><div dir=3D"auto"><div><div class=3D"gmail_quote"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">This seems extremely verbose and ra=
ther obscures the fact that these<br>
registers are a set of adjacent simple ID registers, compared to<br>
the previous code which defined them as an array of values.</blockquote></d=
iv></div><div dir=3D"auto"><br></div><div dir=3D"auto">One could abstract t=
hem with declarative macros to reduce the line count. WDYT about that appro=
ach?</div></div></blockquote></div><div dir=3D"auto"><br></div><div dir=3D"=
auto"><div dir=3D"auto">No, this is just overcomplicating things. Like Pete=
r said, just use arrays. Copying from the V1 review for reference:</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">=C2=A0 =C2=A0 =C2=A0const UART_P=
CELL_ID: [u8; 4] =3D [0x0d, 0xf0, 0x05, 0xb1];</div><div dir=3D"auto">=C2=
=A0 =C2=A0 =C2=A0const ARM_UART_PERIPH_ID: [u8; 4] =3D [0x11, 0x10, 0x14, 0=
x00];</div><div dir=3D"auto">=C2=A0 =C2=A0 =C2=A0const LUMINARY_UART_PERIPH=
_ID: [u8; 4] =3D [0x11, 0x00, 0x18, 0x01];</div><div dir=3D"auto"><br></div=
><div dir=3D"auto">=C2=A0 =C2=A0 =C2=A0/// Value of `UARTPeriphID0` through=
 `UARTPeriphID3` registers</div><div dir=3D"auto">=C2=A0 =C2=A0 =C2=A0const=
 fn uart_periph_id(&amp;self, idx: usize) -&gt; u8 {</div><div dir=3D"auto"=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0match self {</div><div dir=3D"auto">=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Self::Arm =3D&gt; ARM_UART_PER=
IPH_ID,</div><div dir=3D"auto">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0Self::Luminary =3D&gt; LUMINARY_UART_PERIPH_ID,</div><div dir=3D"auto=
">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}[idx]</div><div dir=3D"auto">=C2=A0 =
=C2=A0 =C2=A0}</div><div dir=3D"auto"><br></div><div dir=3D"auto">=C2=A0 =
=C2=A0 =C2=A0/// Value of `UARTPCellID0` through `UARTPCellID3` registers</=
div><div dir=3D"auto">=C2=A0 =C2=A0 =C2=A0const fn uart_pcell_id(idx: usize=
) -&gt; u8 {</div><div dir=3D"auto">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Self:=
:UART_PCELL_ID[idx]</div><div dir=3D"auto">=C2=A0 =C2=A0 =C2=A0}</div><div =
dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div></div><div class=3D"gma=
il_quote" dir=3D"auto"><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><d=
iv dir=3D"auto"><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
</blockquote></div></div></div>
</blockquote></div></div>

--00000000000092c2d5062719ee65--
