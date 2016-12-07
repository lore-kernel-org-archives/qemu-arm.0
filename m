Received: by 10.25.159.131 with SMTP id i125csp548274lfe;
        Wed, 7 Dec 2016 13:36:01 -0800 (PST)
X-Received: by 10.200.36.125 with SMTP id d58mr60060005qtd.126.1481146561656;
        Wed, 07 Dec 2016 13:36:01 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id x16si15472209qta.203.2016.12.07.13.36.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Dec 2016 13:36:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@dgtlrift-com.20150623.gappssmtp.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42317 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cEjsf-0003al-5y
	for alex.bennee@linaro.org; Wed, 07 Dec 2016 16:36:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56357)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jhanley@dgtlrift.com>) id 1cEjsa-0003aU-Cr
	for qemu-arm@nongnu.org; Wed, 07 Dec 2016 16:35:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jhanley@dgtlrift.com>) id 1cEjsX-0003uf-8h
	for qemu-arm@nongnu.org; Wed, 07 Dec 2016 16:35:56 -0500
Received: from mail-ua0-f195.google.com ([209.85.217.195]:35556)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jhanley@dgtlrift.com>)
	id 1cEjsX-0003uZ-25
	for qemu-arm@nongnu.org; Wed, 07 Dec 2016 16:35:53 -0500
Received: by mail-ua0-f195.google.com with SMTP id 50so40753313uae.2
	for <qemu-arm@nongnu.org>; Wed, 07 Dec 2016 13:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dgtlrift-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9blUmASFDzqKsYbPq3T2TINQ/9BhbEyrx6qShvzo4r0=;
	b=1oYAi6jQxybSSkYoUz3cFyzETCymyg3tP9IPRFmZql13mnGvig0j/sGP40/oWeL2jM
	y+Mc9IW75UPKXegcX5Q+xtyXwq5Ff9xgbmnmEXet5bpXgasXRtrDD8sDWkLz1lw1sRr6
	eKB9/lxuyoZsxginytVDFWVWnR9DTwfwFMYjjwCpAjhR6az1XGWysv9P8TPNtFiLVtOp
	xjwdRgRYn1DjthX2rTUnvza3gX8B/1dTILmYeKpYHRVlU11a/gkW9YT+Q990wWodIwYr
	BoLFZ/SJns76xvV1yufhw3x07eXgqIZEFTNG/H11xOsWI/uior6+4TqEpekMibPCaqcW
	xSeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9blUmASFDzqKsYbPq3T2TINQ/9BhbEyrx6qShvzo4r0=;
	b=gkzJNRLCHBdus1It55eddyHedgNRy9xc87woFT7n/mwzRDVzt/BnkRG6qCneOX/CLi
	OJmkstQ+h3qBOlwAOQRAupdNT54kcCYRqWxV2s+Q32Pnc0gNiQOu0l1063cF9XtBYp2N
	RnamAxXjpwmM8APspsbAbFvU82uGIDBVBBY9r4Fsit6f0ms/6ibLXBNsTyKafH9xhbOA
	19YFBRWSc0OJiKeYx0fsCNMaWaAjSU+Cn6Qvud2aGKxrSwa3Hvx+wWHZmqHKij8zPsUt
	udZZj9FTjVlABdqKsNTGqGTjyPQeQJR5X/HPHWg1M2nVzdoiV8p9QJgdxHvbwT2VlsmO
	dO+g==
X-Gm-Message-State: AKaTC01VVQTWYTK5+20PhGi409yu5jCsFHl5s/wwElU+EFb6MW9/pxREYZebCJZwkpmWwUJHfPKsd50FnQ7u6Q==
X-Received: by 10.176.84.147 with SMTP id p19mr9012458uaa.76.1481146492393;
	Wed, 07 Dec 2016 13:34:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.103.129.151 with HTTP; Wed, 7 Dec 2016 13:34:51 -0800 (PST)
In-Reply-To: <CAFEAcA9guoF-ija--JO1E0pfUG2d4HNSB343GiY9ojO837TAXQ@mail.gmail.com>
References: <CAF++6AOJ_kiPyeCO3WO84d4UTrV9v=iK8CJx72ERJ5N_AKj64g@mail.gmail.com>
	<1dda2994-dc9d-d8f6-fb42-856f2b992484@redhat.com>
	<CAF++6APMs+eshFxV=wxV9N9zmyyLtU8Gz0v0CAgCWkOnC88dpg@mail.gmail.com>
	<CAFEAcA9guoF-ija--JO1E0pfUG2d4HNSB343GiY9ojO837TAXQ@mail.gmail.com>
From: James Hanley <jhanley@dgtlrift.com>
Date: Wed, 7 Dec 2016 16:34:51 -0500
Message-ID: <CAF++6APdGepcjuT5A_HT=LsGR_35DjDtu-+7-DtpTwcwesx4Bw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary=f403045cce7a8a9ffd0543184ae2
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.195
Subject: Re: [Qemu-arm] [Qemu-discuss] Custom board with DTS/DTB
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hwE6DCZ/DeOY

--f403045cce7a8a9ffd0543184ae2
Content-Type: text/plain; charset=UTF-8

Thanks - I'm using the -device option to load the binaries, but have run
into another issue with setting the program counter.

qemu-system-arm: -device loader,cpu-num=0,addr=0x00400000: cpu_num must be
specified when setting a program counter

I believe the error isn't precise since the token defined in the
generic_loader_props is
DEFINE_PROP_UINT32("cpu-num", GenericLoaderState, cpu_num, CPU_NONE),
I'm just not sure why it's not capturing the cpu-num parameter.

On Wed, Dec 7, 2016 at 4:25 AM, Peter Maydell <peter.maydell@linaro.org>
wrote:

> On 5 December 2016 at 17:51, James Hanley <jhanley@dgtlrift.com> wrote:
> > I'm moving my query to QEMU-Arm since it seems more applicable here.
> >    1) It seems that the -dtb option is not what I thought it was, but
> would
> > something like what I thought was the intent of the option be of value to
> > QEMU, that is to define the board support package for the system using
> DTC
> > to compile and pass into QEMU to define a generic board from the tree,
> > rather then defining the hardware within the code base of QEMU?  I
> > understand that there will always be some need for device support and
> > deginition from within the codebase, but this was more to allow the user
> to
> > define hardware board profiles without having to change source code.
>
> The problem is that DTC is not designed for that job. It describes
> those aspects of the hardware that the kernel cares about, which
> overlaps with but isn't the same as the information that you would
> need to build a complete model of the hardware. So the idea has been
> suggested before but I think it would in practice be pretty unreliable
> (and for 99% of dtb files it would just not work anyway, because QEMU
> doesn't
> model the devices that the dtb describes).
>
> >    2) Right now, I'm trying to run our embedded application (EmbOS RTOS
> with
> > DLib with our application support all targeted for Cortex-M4 MPU) and it
> > seems like QEMU (at least from variable names) wants to believe that
> under
> > boot.c and loader.c that the passed in application (using --kernel
> option)
> > is linux.
>
> M-profile is different and doesn't generally use boot.c -- the board
> model code ends up calling armv7m_init() which treats kernel_filename
> as a random ELF file. (A profile --kernel will also treat an ELF
> file as an ELF file, it just has special casing to handle Linux kernels and
> assumes a raw binary is a kernel.)
>
> If you're running one of the 2.8 rc candidates you can also use
> -device loader to load an arbitrary file (see docs/generic-loader.txt).
>
> thanks
> -- PMM
>

--f403045cce7a8a9ffd0543184ae2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks - I&#39;m using the -device option to load the bina=
ries, but have run into another issue with setting the program counter.<div=
><br></div><div><div>qemu-system-arm: -device loader,cpu-num=3D0,addr=3D0x0=
0400000: cpu_num must be specified when setting a program counter</div></di=
v><div><br></div><div>I believe the error isn&#39;t precise since the token=
 defined in the generic_loader_props is</div><div>DEFINE_PROP_UINT32(&quot;=
cpu-num&quot;, GenericLoaderState, cpu_num, CPU_NONE),</div><div>I&#39;m ju=
st not sure why it&#39;s not capturing the cpu-num parameter.=C2=A0</div></=
div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Wed, Dec 7=
, 2016 at 4:25 AM, Peter Maydell <span dir=3D"ltr">&lt;<a href=3D"mailto:pe=
ter.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On 5 Decem=
ber 2016 at 17:51, James Hanley &lt;<a href=3D"mailto:jhanley@dgtlrift.com"=
>jhanley@dgtlrift.com</a>&gt; wrote:<br>
&gt; I&#39;m moving my query to QEMU-Arm since it seems more applicable her=
e.<br>
&gt;=C2=A0 =C2=A0 1) It seems that the -dtb option is not what I thought it=
 was, but would<br>
&gt; something like what I thought was the intent of the option be of value=
 to<br>
&gt; QEMU, that is to define the board support package for the system using=
 DTC<br>
&gt; to compile and pass into QEMU to define a generic board from the tree,=
<br>
&gt; rather then defining the hardware within the code base of QEMU?=C2=A0 =
I<br>
&gt; understand that there will always be some need for device support and<=
br>
&gt; deginition from within the codebase, but this was more to allow the us=
er to<br>
&gt; define hardware board profiles without having to change source code.<b=
r>
<br>
</span>The problem is that DTC is not designed for that job. It describes<b=
r>
those aspects of the hardware that the kernel cares about, which<br>
overlaps with but isn&#39;t the same as the information that you would<br>
need to build a complete model of the hardware. So the idea has been<br>
suggested before but I think it would in practice be pretty unreliable<br>
(and for 99% of dtb files it would just not work anyway, because QEMU doesn=
&#39;t<br>
model the devices that the dtb describes).<br>
<span class=3D""><br>
&gt;=C2=A0 =C2=A0 2) Right now, I&#39;m trying to run our embedded applicat=
ion (EmbOS RTOS with<br>
&gt; DLib with our application support all targeted for Cortex-M4 MPU) and =
it<br>
&gt; seems like QEMU (at least from variable names) wants to believe that u=
nder<br>
&gt; boot.c and loader.c that the passed in application (using --kernel opt=
ion)<br>
&gt; is linux.<br>
<br>
</span>M-profile is different and doesn&#39;t generally use boot.c -- the b=
oard<br>
model code ends up calling armv7m_init() which treats kernel_filename<br>
as a random ELF file. (A profile --kernel will also treat an ELF<br>
file as an ELF file, it just has special casing to handle Linux kernels and=
<br>
assumes a raw binary is a kernel.)<br>
<br>
If you&#39;re running one of the 2.8 rc candidates you can also use<br>
-device loader to load an arbitrary file (see docs/generic-loader.txt).<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div><br></div>

--f403045cce7a8a9ffd0543184ae2--
