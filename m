Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2510040lfg;
        Mon, 2 Mar 2020 06:34:27 -0800 (PST)
X-Google-Smtp-Source: ADFU+vuI1HpVw/7wQ/9AAxTCIhtTqa7yxeJ1rtTi+b/gJUYGsosChB8h3ogQ8bYepv3iSpnsCIt4
X-Received: by 2002:ae9:c30a:: with SMTP id n10mr3969476qkg.444.1583159667796;
        Mon, 02 Mar 2020 06:34:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583159667; cv=none;
        d=google.com; s=arc-20160816;
        b=SJ54Iap9J4gKTWnWjv9OqzsmsYvAiDUN7lRaD8qs68vb0Rv3SgI49pulweUoQZsxDB
         AnVm49wWCiD39FpnCOSF1xGRxtmIpDzrJKTAIN6/yZxhXaWpqm3+WODlgYfm/4qnd6yC
         M41S066XrV2mb6mnhioQPAQsAIu33TQROIedgFdtfBUFAkVJs1KH6ZIudiavUAJoCClU
         VIIcj4Dv6Oalh83U5asPSIJNKFGe5XhLwWeaWQUwok/1dFOBwvG7uoItHxMqVH2K1b9j
         xrWbWd/KRFsKVbR/9BQrJbHUclmHBhjpzXFcmn37oWCxF449Th0pVzIW0VzqOVbkhMYY
         Ow6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M1SAdpnHlnp2nFwsIlXrlJg1ubDSCsvRgV/fwrX0nxU=;
        b=ZaC64CN99xY3PYkltuQLCd4JhGzPmeJnxN+KzwM5C1mysTp9J60k0wwkYFdP5VvGlx
         iTFpZDa6LlAri/cpmOKUUYAU7O8cFQOOqkO8md/PaeGiuFGJ2tzbbHZn3B3nmsNpihT8
         J8W6mIN0YhGMBdzYPws6Psk6XsG7Wl285vqp3OIrKs5XDXeUw7/YDFNZAJYiWqB/Wy6Y
         CguzGstTuiL9C/WvZfgAdh4A03o7u73/C++thpbVlXoK6y2jBSHDaTFQZYiBwfh5gobo
         uAR0QkznkuVqMGSD6zAIe0tU07wibHm4tYrKHkDY68MFJ2+hIynJ6xuglpBNZIOW41Gm
         Fvug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YVlF90l3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m23si5196391qkh.132.2020.03.02.06.34.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Mar 2020 06:34:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YVlF90l3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:33500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j8m9L-00074q-7d
	for alex.bennee@linaro.org; Mon, 02 Mar 2020 09:34:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43684)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bharatb.yadav@gmail.com>) id 1j8dOB-0004UR-Qh
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 00:13:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bharatb.yadav@gmail.com>) id 1j8dOA-0001bC-Cw
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 00:13:11 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:33303)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bharatb.yadav@gmail.com>)
 id 1j8dOA-0001ao-6E; Mon, 02 Mar 2020 00:13:10 -0500
Received: by mail-wr1-x441.google.com with SMTP id x7so10852019wrr.0;
 Sun, 01 Mar 2020 21:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M1SAdpnHlnp2nFwsIlXrlJg1ubDSCsvRgV/fwrX0nxU=;
 b=YVlF90l3OHMTH1iToYL33uiiHwu7hFYu1jvzOrvX8qVezM0wlUKbywSBjq/NAqOwIg
 XyIRR6g7IZSaNtHjEoMqUu5jceA5XYarQbp9I2B3WnmYGb3b0vJWX2Zwc9KoLYs/EM3q
 +7iZuQ/BsuRxkfb03q7+Lq8K0DTevv0o289YIG8oJBn8JWFK1eNXUHfnxG2xqdSF8o+i
 ry3oY0XmVD7FpFRHcmLDHpxEcBK1aicwszSpUkUoB/IfFcML4XTbJi1/rzGxXm0MBW13
 rcGnm1WusAmEdWfP6NQ234lpTc1MV6XEPEKBlKLYDcwpAXPYHRqAOPFiXempi0c/xCxD
 InqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M1SAdpnHlnp2nFwsIlXrlJg1ubDSCsvRgV/fwrX0nxU=;
 b=CJnG/wZSirpeO91kjPkgIDWBBR8mNMBGE8EQuIlLpxEGmow5Po9P5g8PrDaZnmm+Xp
 00+KlDUE84ZpTPeyIUjgpUERucMaZgv/mNbn7+Sx6PkBG+SFg6f8oHHkH8Ug8PqRA44t
 1b+uCe4R53ZX2N9/4tyxEVl9izP49Tip7eZAKR07RAAFI/jYzbz3tIjIUlqTPTarr0T/
 YZ0cW39OyMEoyM42u60XNQUcRJ8ANoCh0dgH9LIhjDjuA6T2UGvxnujUwXRHKldMsMPu
 EVxhHy+Vx+WM/+j/iPEFXX0Qyb2+NrnadT6mBAiXWmbj/Xo+QDrm/X5mJlkPcM30Fpjq
 OWTQ==
X-Gm-Message-State: APjAAAWXmZi/GPTsArvGsLZRMXbbl52Ie7+82kQIDlozgSuAiNf4R9cQ
 4CQ84rcV/MP9XRZ2Y65BYj2sXISz3Fqz6Zc2S7Y=
X-Received: by 2002:a5d:4fc9:: with SMTP id h9mr19775935wrw.400.1583125986941; 
 Sun, 01 Mar 2020 21:13:06 -0800 (PST)
MIME-Version: 1.0
References: <20181127064101.25887-1-Bharat.Bhushan@nxp.com>
 <2a788c05-cd9b-1e69-14dd-864633a1df95@redhat.com>
In-Reply-To: <2a788c05-cd9b-1e69-14dd-864633a1df95@redhat.com>
From: Bharat Bhushan <bharatb.yadav@gmail.com>
Date: Mon, 2 Mar 2020 10:42:55 +0530
Message-ID: <CAHS=5b3g_6rHzFvF4-RDu2cn_tsP4TmJp+rFxPgiWpo-2kdnYA@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH RFC v5 0/5] virtio-iommu: VFIO integration
To: Auger Eric <eric.auger@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000161e15059fd83e8c"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
X-Mailman-Approved-At: Mon, 02 Mar 2020 09:32:59 -0500
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "drjones@redhat.com" <drjones@redhat.com>,
 Tomasz Nowicki <tnowicki@marvell.com>, "mst@redhat.com" <mst@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "peterx@redhat.com" <peterx@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Bharat Bhushan <bharatb.linux@gmail.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "linu.cherian@cavium.com" <linu.cherian@cavium.com>,
 "linuc.decode@gmail.com" <linuc.decode@gmail.com>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f6UjpN/ASlAc

--000000000000161e15059fd83e8c
Content-Type: text/plain; charset="UTF-8"

Hi Eric,

On Fri, Feb 28, 2020 at 3:06 PM Auger Eric <eric.auger@redhat.com> wrote:

> Hi Bharat,
>
> On 11/27/18 7:52 AM, Bharat Bhushan wrote:
> > This patch series integrates VFIO with virtio-iommu. This is
> > tested with assigning 2 pci devices to Virtual Machine.
> >
> > This version is mainly about rebasing on v9 version on
> > virtio-iommu device framework from Eric Augur.
> >
> > This patch series allows PCI pass-through using virtio-iommu.
> >
> > This series is based on:
> >  - virtio-iommu kernel driver by Jean-Philippe Brucker
> >     [PATCH v5 0/7] Add virtio-iommu driver
> >     git://linux-arm.org/kvmtool-jpb.git virtio-iommu/v0.9
> >
> >  - virtio-iommu device emulation by Eric Augur.
> >    [RFC,v9,00/17] VIRTIO-IOMMU device
> >    https://github.com/eauger/qemu/tree/v3.1.0-rc2-virtio-iommu-v0.9
>
> Now we have the driver and the base qemu device upstream we may resume
> this activity to complete the VFIO integration. Do you intend the
> respin? Otherwise let me know if you want me to help.
>
>
Yes Eric, I am planning to respin the changes.

Can you please point to latest changes (qemu/Linux both).

Thanks
-Bharat

Thanks
>
> Eric
> >
> > v4->v5:
> >  - Rebase to v9 version from Eric
> >  - PCIe device hotplug fix
> >  - Added Patch 1/5 from Eric previous series (Eric somehow dropped in
> >    last version.
> >  - Patch "Translate the MSI doorbell in kvm_arch_fixup_msi_route"
> >    already integrated with vsmmu3
> >
> > v3->v4:
> >  - Rebase to v4 version from Eric
> >  - Fixes from Eric with DPDK in VM
> >  - Logical division in multiple patches
> >
> > v2->v3:
> >  - This series is based on "[RFC v3 0/8] VIRTIO-IOMMU device"
> >    Which is based on top of v2.10-rc0 that
> >  - Fixed issue with two PCI devices
> >  - Addressed review comments
> >
> > v1->v2:
> >   - Added trace events
> >   - removed vSMMU3 link in patch description
> >
> > Bharat Bhushan (4):
> >   virtio-iommu: Add iommu notifier for iommu-map/unmap
> >   virtio-iommu: Call iommu notifier on attach/detach
> >   virtio-iommu: add virtio-iommu replay
> >   virtio-iommu: handle IOMMU Notifier flag changes
> >
> > Eric Auger (1):
> >   hw/vfio/common: Do not print error when viommu translates into an mmio
> >     region
> >
> >  hw/vfio/common.c                 |   2 -
> >  hw/virtio/trace-events           |   5 +
> >  hw/virtio/virtio-iommu.c         | 190 ++++++++++++++++++++++++++++++-
> >  include/hw/virtio/virtio-iommu.h |   6 +
> >  4 files changed, 198 insertions(+), 5 deletions(-)
> >
>
>

-- 
-Bharat

--000000000000161e15059fd83e8c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div>Hi Eric,=C2=A0<div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 28, 20=
20 at 3:06 PM Auger Eric &lt;<a href=3D"mailto:eric.auger@redhat.com">eric.=
auger@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">Hi Bharat,<br>
<br>
On 11/27/18 7:52 AM, Bharat Bhushan wrote:<br>
&gt; This patch series integrates VFIO with virtio-iommu. This is<br>
&gt; tested with assigning 2 pci devices to Virtual Machine.<br>
&gt; <br>
&gt; This version is mainly about rebasing on v9 version on<br>
&gt; virtio-iommu device framework from Eric Augur.<br>
&gt; <br>
&gt; This patch series allows PCI pass-through using virtio-iommu.<br>
&gt; <br>
&gt; This series is based on:<br>
&gt;=C2=A0 - virtio-iommu kernel driver by Jean-Philippe Brucker<br>
&gt;=C2=A0 =C2=A0 =C2=A0[PATCH v5 0/7] Add virtio-iommu driver<br>
&gt;=C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://linux-arm.org/kvmtool-jpb.g=
it" rel=3D"noreferrer" target=3D"_blank">linux-arm.org/kvmtool-jpb.git</a> =
virtio-iommu/v0.9<br>
&gt; <br>
&gt;=C2=A0 - virtio-iommu device emulation by Eric Augur.<br>
&gt;=C2=A0 =C2=A0 [RFC,v9,00/17] VIRTIO-IOMMU device<br>
&gt;=C2=A0 =C2=A0 <a href=3D"https://github.com/eauger/qemu/tree/v3.1.0-rc2=
-virtio-iommu-v0.9" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/eauger/qemu/tree/v3.1.0-rc2-virtio-iommu-v0.9</a><br>
<br>
Now we have the driver and the base qemu device upstream we may resume<br>
this activity to complete the VFIO integration. Do you intend the<br>
respin? Otherwise let me know if you want me to help.<br>
<br></blockquote><div><br></div><div>Yes Eric, I am planning to respin the =
changes.</div><div><br></div><div></div><div>Can you please point to latest=
 changes (qemu/Linux both).</div><div><br></div><div>Thanks</div><div>-Bhar=
at</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Thanks<br>
<br>
Eric<br>
&gt; <br>
&gt; v4-&gt;v5:<br>
&gt;=C2=A0 - Rebase to v9 version from Eric<br>
&gt;=C2=A0 - PCIe device hotplug fix<br>
&gt;=C2=A0 - Added Patch 1/5 from Eric previous series (Eric somehow droppe=
d in<br>
&gt;=C2=A0 =C2=A0 last version.<br>
&gt;=C2=A0 - Patch &quot;Translate the MSI doorbell in kvm_arch_fixup_msi_r=
oute&quot;<br>
&gt;=C2=A0 =C2=A0 already integrated with vsmmu3<br>
&gt; <br>
&gt; v3-&gt;v4:<br>
&gt;=C2=A0 - Rebase to v4 version from Eric<br>
&gt;=C2=A0 - Fixes from Eric with DPDK in VM<br>
&gt;=C2=A0 - Logical division in multiple patches<br>
&gt; <br>
&gt; v2-&gt;v3:<br>
&gt;=C2=A0 - This series is based on &quot;[RFC v3 0/8] VIRTIO-IOMMU device=
&quot;<br>
&gt;=C2=A0 =C2=A0 Which is based on top of v2.10-rc0 that<br>
&gt;=C2=A0 - Fixed issue with two PCI devices<br>
&gt;=C2=A0 - Addressed review comments<br>
&gt; <br>
&gt; v1-&gt;v2:<br>
&gt;=C2=A0 =C2=A0- Added trace events<br>
&gt;=C2=A0 =C2=A0- removed vSMMU3 link in patch description<br>
&gt; <br>
&gt; Bharat Bhushan (4):<br>
&gt;=C2=A0 =C2=A0virtio-iommu: Add iommu notifier for iommu-map/unmap<br>
&gt;=C2=A0 =C2=A0virtio-iommu: Call iommu notifier on attach/detach<br>
&gt;=C2=A0 =C2=A0virtio-iommu: add virtio-iommu replay<br>
&gt;=C2=A0 =C2=A0virtio-iommu: handle IOMMU Notifier flag changes<br>
&gt; <br>
&gt; Eric Auger (1):<br>
&gt;=C2=A0 =C2=A0hw/vfio/common: Do not print error when viommu translates =
into an mmio<br>
&gt;=C2=A0 =C2=A0 =C2=A0region<br>
&gt; <br>
&gt;=C2=A0 hw/vfio/common.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 =C2=A02 -<br>
&gt;=C2=A0 hw/virtio/trace-events=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A05 +<br>
&gt;=C2=A0 hw/virtio/virtio-iommu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 190 =
++++++++++++++++++++++++++++++-<br>
&gt;=C2=A0 include/hw/virtio/virtio-iommu.h |=C2=A0 =C2=A06 +<br>
&gt;=C2=A0 4 files changed, 198 insertions(+), 5 deletions(-)<br>
&gt; <br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">-Bharat</div></div></div></div>

--000000000000161e15059fd83e8c--
