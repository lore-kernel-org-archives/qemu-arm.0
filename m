Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE06D6B088
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Jan 2026 16:14:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vlUcI-0008IH-Vf; Thu, 29 Jan 2026 11:11:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1vlUcH-00086S-Uf
 for qemu-arm@nongnu.org; Thu, 29 Jan 2026 11:11:33 -0500
Received: from mail-dl1-x1236.google.com ([2607:f8b0:4864:20::1236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1vlUcF-0007e3-NF
 for qemu-arm@nongnu.org; Thu, 29 Jan 2026 11:11:33 -0500
Received: by mail-dl1-x1236.google.com with SMTP id
 a92af1059eb24-124877d78a6so1445069c88.1
 for <qemu-arm@nongnu.org>; Thu, 29 Jan 2026 08:11:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769703089; cv=none;
 d=google.com; s=arc-20240605;
 b=H6jL8Kz5IqK9uUPmiqG6eyPakIx2DKFiVo5d8ePbkZWk5yFd5mf+IqsVb8Q79/64eC
 mFDiWIQ/WMQ5OsMZX6reSyJLkXh/3GiBXiodTf6ssDO/0yOITe8k9rJeSUXvw31qumpJ
 wvwcVOvuq8ifaKjlGpfRVgiKO49PY3K6mn05Hem4Tb1qZkvw9lEfXFixFXbfXB3MdPh4
 Zctw50/xPetZ8Pzzm/7/dQnwT8VmmEm9GiIsrvILEMiUk34zKv8Dy8f5P+V3Ha81jduk
 EgsbYFAOgwUkXGh8TOInwTAEvSKdiJj9bk12XO7lMYQ2YNnpG/RbGdFVX8wj1b3LgAcd
 MIuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=xi6t+aW4Hag+eyczycHOvScRaHbt6BUPslNeKXuOCMs=;
 fh=EJW3j3dcDZoClPeagO5AVTRagWe5QKKYbpiBVGb6B0o=;
 b=cfMDDSjsKi2Ipc2XumBcmqupZK5GZ1LXlXkAJ+2Oot4kxTW41XX0ISAmdWwOFniUXX
 DhWz4Tz4E1aaDlqjJjWuibtbeKYFHleXp1Kh+smH/lOla1PNxoJbd0bjNQ1lj+GqA0br
 3iWHYUu/qHrzpyrh62rKCE/pNPcnA/5Sbnt0dhDpY8EKIUbjrv9K3t4J25dBdeqB4wyi
 iYRPhhXjBVgWgr2XqEOG91zBGFJ44iw0ZYn7QeLv90VNwOiC55foygQW7FITb+YQ2033
 XwqQugN5D2GJHnNiRIlGGyE3fsHTlLGra/5PsIF8FgX8yCaLWXgKtnBQWlAhDx31KrRF
 8tuQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769703089; x=1770307889; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xi6t+aW4Hag+eyczycHOvScRaHbt6BUPslNeKXuOCMs=;
 b=c6vC/BxCwmbU/PVHZYu8BkS5o8waijTTBOC2KOlwl8g2hFKt4cZlWlRgyFLtv3guQv
 ThLSk/1Ek4WKLIVPWODo6IAnTxwGumA4PAgHSHbjBKSFIGaF+3SwwHNj8kz6MwQeRYxF
 61cP4m4U+o0xDFIc8K41WaGBzANZj9Zmk1FM4YhDPX/+LeHqLO2tVx6VSd7sHnHE/ipr
 zdyMAF2U23tOnMup/lMiFtEkUx3CzT9L8JShvt6YMopC8yP7VS+k17D+1JKbZ2qf7Uw3
 HQNEpvIM5j/99RhkAM5xQoi/+ogz0mXTvQ9tzFri+Xc/GyzlUPFChue1Lu6v+Xg4rs5Z
 dlzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769703089; x=1770307889;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xi6t+aW4Hag+eyczycHOvScRaHbt6BUPslNeKXuOCMs=;
 b=bQdQ3xe4W00Fh7diqs1XUS5R5V1w4gtALlKcwoNf3yOwSX6QCTlAza4lhvYPglLYFf
 rGaKbF1KcW4s0M+225dOdIKVb98K4FU3jsWGpiTCS/RfBw8lPWzU/uLdohZm7nU1TNP3
 dg90PilcGUsGHz1+NYxrBOPB3J8JOYHUE2mwPkWl+lb4kwG2/jkfxFnwhYU4K0yOxEfz
 po/vJLsnpyZQJBTmsYwhSjmKM+dWcz53ajK3p/5h/cgsg1Dpnr2k6DQtgyAXVvliDmYs
 cf9F6Rh6MgsouVr37OVqgJDO8JAnEJCZLctzURd49uc7lc0g6rFuIPOxDOVTDFxKEo3P
 CPvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFCMpMFvHRHWmsaWVZwNqarFFKjGIniLEQV+cillzsSUDNBeQoL+hx0B5wQQUN4/AiNyHDoGeSsg==@nongnu.org
X-Gm-Message-State: AOJu0YwQ+KGdGHjjiviE2Amsk08mULVLv13Y2talT+doV0qBmgUs2XPx
 BFc2qywk6fTNjNOIBoW7qf0QPzYLb3SJZ7+G7l88iMRAIHkX2/mo1SUY9Pxv4RSMQnNi7tRvbpw
 AsGl5m/qiCjpSsQwWrqhfxEW6TDhYFEE=
X-Gm-Gg: AZuq6aJgDHOGupXe+rU6mlScTAuEJ0X09fiFZMgiyQDvggNpZslg6qe+YpX8wXL5qHo
 rvbYJZv8xG9O4O+mrzAFxGGWp+vC0jVtCnDs5vi8DzGcwhJvy39mMCqyymRbjoCcIG3H7iVWdHX
 5sxdIF42k5KHORTeXKALjgT+/NKbILPIlcNXIE6RnadPfNjjK0eZRYCNclGW85UyRKGJrQgjwTJ
 AzabBlF56vnypoZL2vMSO4MJyNSLGGVDJgnjmNDfvFRH/CcvtqNERSq29aMi0u2gSpuuAI9Ng==
X-Received: by 2002:a05:7022:a98:b0:122:8d:3680 with SMTP id
 a92af1059eb24-124a00d5c0dmr4827088c88.40.1769703089409; Thu, 29 Jan 2026
 08:11:29 -0800 (PST)
MIME-Version: 1.0
References: <20260126174313.1418150-1-ruslichenko.r@gmail.com>
 <CAFEAcA9NEjaUBX19sdw9TRCKcKn8CQfvoVNZ+VaXOcNZ8kf24g@mail.gmail.com>
 <CAN-aV1EjYwSRfV87YQdtfqU5CH8Bsssr3EvStPWL2_VFOs4N4w@mail.gmail.com>
 <87ecn9aas7.fsf@draig.linaro.org>
In-Reply-To: <87ecn9aas7.fsf@draig.linaro.org>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Thu, 29 Jan 2026 17:11:16 +0100
X-Gm-Features: AZwV_QjKbz0UQNo9ba8Swu37xasHiajLSk_86kIHMNaAJiCPkvYAYWWqRAcgzdo
Message-ID: <CAJy5ezogj36BfEV6m4d4YT3gwXPuMzXddJsO73sJouTtVo9Zgg@mail.gmail.com>
Subject: Re: [PATCH 00/27] hw/arm: Add generic FDT-based machine and
 infrastructure
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Ruslan Ruslichenko <ruslichenko.r@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, artem_mygaiev@epam.com, 
 volodymyr_babchuk@epam.com, takahiro.nakata.wr@renesas.com, 
 Ruslan_Ruslichenko@epam.com
Content-Type: multipart/alternative; boundary="0000000000000091460649891cee"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1236;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-dl1-x1236.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--0000000000000091460649891cee
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 28, 2026 at 11:48=E2=80=AFAM Alex Benn=C3=A9e <alex.bennee@lina=
ro.org> wrote:

> Ruslan Ruslichenko <ruslichenko.r@gmail.com> writes:
>
> > On Tue, Jan 27, 2026 at 11:03=E2=80=AFAM Peter Maydell <peter.maydell@l=
inaro.org>
> wrote:
> >>
> >> On Mon, 26 Jan 2026 at 17:43, Ruslan Ruslichenko
> >> <ruslichenko.r@gmail.com> wrote:
> >> >
> >> > From: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
> >> >
> >> > This patch series introduces new ARM machine model, arm-generic-fdt,
> and the underlying infrastructure required to instantiate a QEMU machine
> from a Device Tree.
> >>
> >> I'm afraid this has been a feature that has been suggested from
> >> time to time, but which I don't think is workable in general.
> >>
> >> Device tree files are designed to provide enough information to
> >> the guest kernel to allow it to find non-probeable hardware. They
> >> are not designed to provide enough information to QEMU to allow
> >> it to create and wire up all the hardware present on the system.
> >>
> >> There are specific niches where it can be made to work -- I think
> >> Xilinx have or had a setup where they were generating an FPGA
> >> model and a device tree and a guest kernel all from the same
> >> single data source, so they could put everything necessary into
> >> the dtb, for example -- but I don't think it works in the
> >> general case. As one simple example, the DTB doesn't generally
> >> have any information about how the Secure world works in an Arm
> >> system, because Linux doesn't care about the Secure world. It
> >> also doesn't usually have information that the guest OS can
> >> probe for itself at runtime.
> >>
> >> There has been periodic discussion of more flexible user-driven
> >> board creation, but that has generally been with the idea of using
> >> the QMP monitor to orchestrate creation and connection of device
> >> models.
> >>
> > I agree that a guest Device Tree is insufficient for describing a
> > complete QEMU machine model.
> > However, we separate the guest configuration from the machine
> > definition. The -hw-dtb option allows the user to provide a
> > QEMU-specific system description.
> > Those hw-dtb would not be passed to Linux Guest VM.
> >
> > The fact that this workflow has been successfully used in production
> > by AMD/Xilinx demonstrates that FDT is a feasible format.
>
> Where are the extensions to the FDT used for hw-dtb documented? How does
> it deal with PCI devices and the Secure world?
>
>

Hi,

When we first started using this, we tried using the kernel bindings but as
people have already noted on this thread those are not a good fit. So we
changed the approach to something more like a 1:1 mapping between FDT and
QOM. FDT compatible properties match on QOM device names, properties are
set more or less 1:1 with some exceptions.

Interconnects and TZ are modelled by instantiating memory regions, mapping
the selected set of "target" devices and connecting bus masters (CPUs or
DMA) "memory" links.
In addition to that, memory transaction attributes can be used for devices
that differentiate things on a per transaction basis.
This is all the same as you would do in C code with QOM/Qdev.

PCI is modelled the same way as with QOM/qdev.

Cheers,
Edgar


> > In contrast, QMP usage may end up even more complex and less
> > maintainable for the task of full system modeling.
> > To my understanding, this would need to generate too long configs,
> > which may eventually require some intermediate format by itself.
> >
> > I am proposing to use FDT as a serialization format to describe a
> > machine configuration. Theoretically we can use other formats, like
> > XML, but in my opinion FDT perfectly matches the requirements.
>
> The QMP interface is self-documenting and introspectable and used for
> the management of QEMU including things like hotplug. It is also QOM
> aware so a natural fit for dealing with the underlying QOM machinery.
>
> Previous discussions have entertained the idea of making the parsing of
> hw-dtb an external script which would then translate into QMP commands
> to build up the machine.
>
> >
> > BR,
> > Ruslan Ruslichenko
> >
> >
> >> thanks
> >> -- PMM
>
> --
> Alex Benn=C3=A9e
> Virtualisation Tech Lead @ Linaro
>

--0000000000000091460649891cee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 28,=
 2026 at 11:48=E2=80=AFAM Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.benne=
e@linaro.org">alex.bennee@linaro.org</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">Ruslan Ruslichenko &lt;<a href=3D"mailt=
o:ruslichenko.r@gmail.com" target=3D"_blank">ruslichenko.r@gmail.com</a>&gt=
; writes:<br>
<br>
&gt; On Tue, Jan 27, 2026 at 11:03=E2=80=AFAM Peter Maydell &lt;<a href=3D"=
mailto:peter.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org=
</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Mon, 26 Jan 2026 at 17:43, Ruslan Ruslichenko<br>
&gt;&gt; &lt;<a href=3D"mailto:ruslichenko.r@gmail.com" target=3D"_blank">r=
uslichenko.r@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; From: Ruslan Ruslichenko &lt;<a href=3D"mailto:Ruslan_Ruslich=
enko@epam.com" target=3D"_blank">Ruslan_Ruslichenko@epam.com</a>&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; This patch series introduces new ARM machine model, arm-gener=
ic-fdt, and the underlying infrastructure required to instantiate a QEMU ma=
chine from a Device Tree.<br>
&gt;&gt;<br>
&gt;&gt; I&#39;m afraid this has been a feature that has been suggested fro=
m<br>
&gt;&gt; time to time, but which I don&#39;t think is workable in general.<=
br>
&gt;&gt;<br>
&gt;&gt; Device tree files are designed to provide enough information to<br=
>
&gt;&gt; the guest kernel to allow it to find non-probeable hardware. They<=
br>
&gt;&gt; are not designed to provide enough information to QEMU to allow<br=
>
&gt;&gt; it to create and wire up all the hardware present on the system.<b=
r>
&gt;&gt;<br>
&gt;&gt; There are specific niches where it can be made to work -- I think<=
br>
&gt;&gt; Xilinx have or had a setup where they were generating an FPGA<br>
&gt;&gt; model and a device tree and a guest kernel all from the same<br>
&gt;&gt; single data source, so they could put everything necessary into<br=
>
&gt;&gt; the dtb, for example -- but I don&#39;t think it works in the<br>
&gt;&gt; general case. As one simple example, the DTB doesn&#39;t generally=
<br>
&gt;&gt; have any information about how the Secure world works in an Arm<br=
>
&gt;&gt; system, because Linux doesn&#39;t care about the Secure world. It<=
br>
&gt;&gt; also doesn&#39;t usually have information that the guest OS can<br=
>
&gt;&gt; probe for itself at runtime.<br>
&gt;&gt;<br>
&gt;&gt; There has been periodic discussion of more flexible user-driven<br=
>
&gt;&gt; board creation, but that has generally been with the idea of using=
<br>
&gt;&gt; the QMP monitor to orchestrate creation and connection of device<b=
r>
&gt;&gt; models.<br>
&gt;&gt;<br>
&gt; I agree that a guest Device Tree is insufficient for describing a<br>
&gt; complete QEMU machine model.<br>
&gt; However, we separate the guest configuration from the machine<br>
&gt; definition. The -hw-dtb option allows the user to provide a<br>
&gt; QEMU-specific system description.<br>
&gt; Those hw-dtb would not be passed to Linux Guest VM.<br>
&gt;<br>
&gt; The fact that this workflow has been successfully used in production<b=
r>
&gt; by AMD/Xilinx demonstrates that FDT is a feasible format.<br>
<br>
Where are the extensions to the FDT used for hw-dtb documented? How does<br=
>
it deal with PCI devices and the Secure world?<br>
<br></blockquote><div><br></div><div><br></div><div>Hi,</div><div><br></div=
><div>When we first started using this, we tried using the kernel bindings =
but as people have already noted on this thread those are not a good fit. S=
o we changed the approach to something more like a 1:1 mapping between FDT =
and QOM. FDT compatible properties match on QOM device names, properties ar=
e set more or less 1:1 with some exceptions.</div><div><br></div><div>Inter=
connects and TZ are modelled by instantiating memory regions, mapping the s=
elected set of &quot;target&quot; devices and connecting bus masters (CPUs =
or DMA) &quot;memory&quot; links.</div><div>In addition to that, memory tra=
nsaction attributes can be used for devices that differentiate things on a =
per transaction basis.</div><div>This is all the same as you would do in C =
code with QOM/Qdev.</div><div><br></div><div>PCI is modelled the same way a=
s with QOM/qdev.</div><div><br></div><div>Cheers,</div><div>Edgar</div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; In contrast, QMP usage may end up even more complex and less<br>
&gt; maintainable for the task of full system modeling.<br>
&gt; To my understanding, this would need to generate too long configs,<br>
&gt; which may eventually require some intermediate format by itself.<br>
&gt;<br>
&gt; I am proposing to use FDT as a serialization format to describe a<br>
&gt; machine configuration. Theoretically we can use other formats, like<br=
>
&gt; XML, but in my opinion FDT perfectly matches the requirements.<br>
<br>
The QMP interface is self-documenting and introspectable and used for<br>
the management of QEMU including things like hotplug. It is also QOM<br>
aware so a natural fit for dealing with the underlying QOM machinery.<br>
<br>
Previous discussions have entertained the idea of making the parsing of<br>
hw-dtb an external script which would then translate into QMP commands<br>
to build up the machine.<br>
<br>
&gt;<br>
&gt; BR,<br>
&gt; Ruslan Ruslichenko<br>
&gt;<br>
&gt;<br>
&gt;&gt; thanks<br>
&gt;&gt; -- PMM<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
Virtualisation Tech Lead @ Linaro<br>
</blockquote></div></div>

--0000000000000091460649891cee--

