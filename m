Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp1392862ejk;
        Wed, 31 Jan 2024 02:57:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGB0JLwBjpReJ8CKzJpycr1Tn2rhVV6M7RFQIVu7+fdmhnwhw6Ip5wcUZFTrxkDQ/Cxa04D
X-Received: by 2002:a05:620a:102b:b0:783:c318:4e3a with SMTP id a11-20020a05620a102b00b00783c3184e3amr1027047qkk.78.1706698658605;
        Wed, 31 Jan 2024 02:57:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706698658; cv=none;
        d=google.com; s=arc-20160816;
        b=0oIhUy4Nd4aTNizP0pny4higd6+blxUF96nCXvGYTpRIObdcli3FHPjZ52ib1Xe+k6
         JHkMh6nV471iwixa1qf64BN6SvbZ3Dcni2NpTot5Yj+SRQ1yAJpoS/qmchohmqxxtctj
         t8ur4GLz7FHud1qaHNV6UGdA2HzbJo4FQRxl/ZDkxqQjd7bLxU+2n+QdihNKuX8xY16D
         msA0A/meXISbQxgxPSq4JXZIZhDDXWYIUjGEoUDgIrSXK+s9oOBowDco3Mn80wb/P8uo
         jFmqFe0+sDIE0domCvgNa0BDSYQMdPW3PpSGvTSU2wKqbF2QkrPmRp9Uj4ylZtSzMvvc
         5z8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F7eUTK3i1NIMAuLIW4bp5ACd6b+u/xSL9W12jjh5hsc=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=CHI6xSCtOIwtaWG2bP81rvoBRUill/4g1ZOIU1p1zz6D1a1QJcbaqKFMaIg2yRlO1O
         j/3GoGZxBBVpqLfpqEp0wrGxfwhzXCUDyi+EJhK32osiE73hUZ0Dk2XgY23iFyjbexJ5
         VfBG5Eg/jwrnR8zBiVIA/FJoX2ZgYRHfwfmBv1C7dTJ5WIsM+ZCM4MtDg4p6QO++ZX5M
         Shj4jPhDujukH4Tjw4tmJrITpH85VdT5bKAKGRNOn3Pivqsdq87CVAbjazrn5nrhqrCr
         SZRkjEdEnEB//A5n79LfHm2yFkvKBLY0XZXvv8lZi19OFc+mjV0V/dSJ/0/pyJEY5+uf
         9htw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=KJRiT8EM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cz53-20020a05620a36f500b0078341830e2esi11781833qkb.337.2024.01.31.02.57.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Jan 2024 02:57:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=KJRiT8EM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rV8HM-0005wo-Ut; Wed, 31 Jan 2024 05:57:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sanj27272@gmail.com>)
 id 1rV8HJ-0005us-K6; Wed, 31 Jan 2024 05:57:14 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sanj27272@gmail.com>)
 id 1rV8HF-0001lM-Ct; Wed, 31 Jan 2024 05:57:11 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-2909a632e40so2786436a91.0; 
 Wed, 31 Jan 2024 02:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706698627; x=1707303427; darn=nongnu.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F7eUTK3i1NIMAuLIW4bp5ACd6b+u/xSL9W12jjh5hsc=;
 b=KJRiT8EMF6MkehMAF+1BDA8iuTveNhTHEix2OnIs8gNoJQzP51NF2tUbbZD7Zp4Icm
 3Pr3cEBo8M7RlLHC426aT/6uTCLBMTcuNyBk+TQ9Nul5Rt0oBvEmhQO6N04IgoyHCZC2
 /bzqI86nd6eH7j9sT9I8JyHd1JT/YNp/Zxv6TnQfgvNTmLxSHGFv0t+j5lIOVL8nWQUu
 swupGtWIuT2egNi8z6/eRKo0iksALROZ7EuEOokXeoWSvD483IKmvAmga7rVP68TlP/4
 P4UEnhqlkiTOX8uBOmkli11rkzDtYHVc/QoGqR9Ih8H4fkJkRTcreJb9BvGqJz+Vkus8
 Syaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706698627; x=1707303427;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F7eUTK3i1NIMAuLIW4bp5ACd6b+u/xSL9W12jjh5hsc=;
 b=d9aM4ATUGiLD8B0DJBbYQpJ4lVw7m2mhIMs9eu1mfR/9FJHUxcJdII9GdJ0W2chM/7
 BdFBDjMA8XspdaXKRf1Wbyp8/DKyFJu1IghEgd1eHQfyKI1ZmKztl76x8fCAVNQlJTJ2
 KkOHctHfGav+5IYK3US5FDe6jg6pZBoaAJylflg4NhaXxX2i+mVvPaAVRfvQdKKgZjYt
 bF6tpjeagqGD2dc/LB5QD580VIt1XaPph5o0Ck/yMM70F1Ci6HdJGBRqFHxlLrqSfWnX
 axcaltdFmjJPyxB15rRUF47jC0iTikG3VPqrJhlYr4368x+pQHkiEBOAy5DuZlg5jBoZ
 UJHg==
X-Gm-Message-State: AOJu0YwH8HoWYin0/Ek4Y6MbWXUe8JuAs4BnCCWJJ/CDiwZtt5FpdRQM
 hDk2Qo7cXzTpmrMnM3xHSja/QJlDzGU7vS5B6XnHvXNbBihDwXvdGFXwmMejKoEnxNsgRxsCwVx
 YLFtpBXGM+Qk81yEBk3NaNrigqRv3pozI
X-Received: by 2002:a17:90b:101:b0:294:13c9:b008 with SMTP id
 p1-20020a17090b010100b0029413c9b008mr1313646pjz.20.1706698626853; Wed, 31 Jan
 2024 02:57:06 -0800 (PST)
MIME-Version: 1.0
References: <CA+ji3pGBJBp+trjM-RhgkYjOs8rrtLJgHsaNvf=EyGtWB4gAow@mail.gmail.com>
 <CAFEAcA-L2vepWXfgaHW=ogLAvAZjJd5yv1hm6dBU6dsEOS_gCA@mail.gmail.com>
 <CA+ji3pGVBmDAeUoPM9Zk8pOtpxcR+92XeUBN8G=Mmmyi4Eh8-g@mail.gmail.com>
 <CAFEAcA9AeqbWt1Q5QM_HEwi+A2KYXFs1ZEqfFJcqdktYwWujTQ@mail.gmail.com>
 <CA+ji3pH4ZapKAZ+vCSw6P=svWUtfsWt8aqoTFZX_CV5DzPoOyg@mail.gmail.com>
 <CAFEAcA-Hsm1b2-2r=c0n0g+pJUWxLNjhGwdeomBt6=1XqZux=Q@mail.gmail.com>
In-Reply-To: <CAFEAcA-Hsm1b2-2r=c0n0g+pJUWxLNjhGwdeomBt6=1XqZux=Q@mail.gmail.com>
From: sanjana gogte <sanj27272@gmail.com>
Date: Wed, 31 Jan 2024 16:26:55 +0530
Message-ID: <CA+ji3pGDUqTyAExK5zYJHdw3ZwfZvDsht-C24OoZipjDCbuDKA@mail.gmail.com>
Subject: Re: Assistance Required for QEMU Hardfault Error with Cortex-M33 on
 MPS2AN505
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000064706106103bbd34"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=sanj27272@gmail.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: x5Q8O+W7yRrQ

--00000000000064706106103bbd34
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you Peter. I will reach out to someone from Xilinx.
Do you have insights on how I could use a Qemu emulated core ( M profile )
with a Virtual Prototype ( System C IP ) ?

Thank you.

On Tue, 30 Jan 2024 at 15:59, Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Tue, 30 Jan 2024 at 07:48, sanjana gogte <sanj27272@gmail.com> wrote:
> >
> > I wanted to express my gratitude for your insightful solution concernin=
g
> the INVSTATE fault I was encountering. After recompiling my code with the
> -mthumb compiler flag, the exception is no longer being raised, which mar=
ks
> a significant step forward in my project.
> >
> > However, I've encountered another challenge while working with a
> specific version of QEMU (QEMU emulator version 7.1.0,
> v2.6.0-55433-g23b643ba16). While the code runs flawlessly on QEMU version
> 8.1.50 (v8.1.0-2375-g516fffc993), the earlier version throws a hard fault=
,
> which is critical to my use case.
> >
> > The use case involves attaching a remote port to the MPS2-AN505, and fo=
r
> this, I need to utilize Xilinx=E2=80=99s fork of QEMU, which is based on =
version
> 7.1.0 (v2.6.0-55433-g23b643ba16). The error I encounter during emulation =
is
> as follows:
> >
> > Loaded reset SP 0x0 PC 0x0 from vector table
> > Loaded reset SP 0x10080000 PC 0x10000009 from vector table
> > Taking exception 3 [Prefetch Abort] on CPU 0
> > ...at fault address 0x10800000
> > ...with CFSR.IBUSERR
> > ...taking pending secure exception 3
> > ...loading from element 3 000000c
> > ...loaded new PC 0x10000011 of secure vector table at 0x1
> > Taking exception 3 [Prefetch Abort] on CPU 0
> > ...at fault address 0x10800000
> > ...with CFSR.IBUSERR
> > qemu: fatal: Lockup: can't escalate 3 to HardFault (current priority -1=
)
> >
> > Observations: When I trace it using the GDB:
>
>
> > It goes to prefetch abort as soon as I step into reset handler and the
> connection gets closed.
> > What I do not understand is:
> >
> > 1) Why is my PC going to address 0x10800000?
> >
> >
> > 2) When I use Qemu version 8.1.50 (v8.1.0-2375-g516fffc993), the PC goe=
s
> to the right address and does not throw a prefetch abort.
>
> This strongly suggests you're running into a QEMU issue
> which we've fixed in some QEMU version after 7.1.0.
> For bugs in Xilinx's fork of QEMU, you should talk to Xilinx.
>
> In terms of why your PC is going to 0x10800000, it is
> almost certainly executing a lot of NOPs from some point
> until it runs off the end of the flash memory. If you
> use the gdb 'si' command to single step single instructions
> you'll probably find this is less confusing than using
> the 's' command, which steps an entire C source line.
>
> thanks
> -- PMM
>

--00000000000064706106103bbd34
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you Peter. I will reach out to someone from Xilinx.=
=C2=A0<div>Do you have insights=C2=A0on how I could use a Qemu emulated=C2=
=A0core ( M profile )=C2=A0 with a Virtual Prototype ( System C IP ) ?=C2=
=A0<br><br>Thank you.=C2=A0</div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Tue, 30 Jan 2024 at 15:59, Peter Maydel=
l &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.org<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">O=
n Tue, 30 Jan 2024 at 07:48, sanjana gogte &lt;<a href=3D"mailto:sanj27272@=
gmail.com" target=3D"_blank">sanj27272@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; I wanted to express my gratitude for your insightful solution concerni=
ng the INVSTATE fault I was encountering. After recompiling my code with th=
e -mthumb compiler flag, the exception is no longer being raised, which mar=
ks a significant step forward in my project.<br>
&gt;<br>
&gt; However, I&#39;ve encountered another challenge while working with a s=
pecific version of QEMU (QEMU emulator version 7.1.0, v2.6.0-55433-g23b643b=
a16). While the code runs flawlessly on QEMU version 8.1.50 (v8.1.0-2375-g5=
16fffc993), the earlier version throws a hard fault, which is critical to m=
y use case.<br>
&gt;<br>
&gt; The use case involves attaching a remote port to the MPS2-AN505, and f=
or this, I need to utilize Xilinx=E2=80=99s fork of QEMU, which is based on=
 version 7.1.0 (v2.6.0-55433-g23b643ba16). The error I encounter during emu=
lation is as follows:<br>
&gt;<br>
&gt; Loaded reset SP 0x0 PC 0x0 from vector table<br>
&gt; Loaded reset SP 0x10080000 PC 0x10000009 from vector table<br>
&gt; Taking exception 3 [Prefetch Abort] on CPU 0<br>
&gt; ...at fault address 0x10800000<br>
&gt; ...with CFSR.IBUSERR<br>
&gt; ...taking pending secure exception 3<br>
&gt; ...loading from element 3 000000c<br>
&gt; ...loaded new PC 0x10000011 of secure vector table at 0x1<br>
&gt; Taking exception 3 [Prefetch Abort] on CPU 0<br>
&gt; ...at fault address 0x10800000<br>
&gt; ...with CFSR.IBUSERR<br>
&gt; qemu: fatal: Lockup: can&#39;t escalate 3 to HardFault (current priori=
ty -1)<br>
&gt;<br>
&gt; Observations: When I trace it using the GDB:<br>
<br>
<br>
&gt; It goes to prefetch abort as soon as I step into reset handler and the=
 connection gets closed.<br>
&gt; What I do not understand is:<br>
&gt;<br>
&gt; 1) Why is my PC going to address 0x10800000?<br>
&gt;<br>
&gt;<br>
&gt; 2) When I use Qemu version 8.1.50 (v8.1.0-2375-g516fffc993), the PC go=
es to the right address and does not throw a prefetch abort.<br>
<br>
This strongly suggests you&#39;re running into a QEMU issue<br>
which we&#39;ve fixed in some QEMU version after 7.1.0.<br>
For bugs in Xilinx&#39;s fork of QEMU, you should talk to Xilinx.<br>
<br>
In terms of why your PC is going to 0x10800000, it is<br>
almost certainly executing a lot of NOPs from some point<br>
until it runs off the end of the flash memory. If you<br>
use the gdb &#39;si&#39; command to single step single instructions<br>
you&#39;ll probably find this is less confusing than using<br>
the &#39;s&#39; command, which steps an entire C source line.<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>

--00000000000064706106103bbd34--
