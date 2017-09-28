Received: by 10.223.173.107 with SMTP id p98csp413788wrc;
        Thu, 28 Sep 2017 01:35:08 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDQyAfMbnnaPGjkQpFsqjOjuTkKFb53eq3NUOMs1FOxbiI4WTJReXbe6o8q/YtNBubv7JhA
X-Received: by 10.200.53.67 with SMTP id z3mr6018858qtb.145.1506587708377;
        Thu, 28 Sep 2017 01:35:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506587708; cv=none;
        d=google.com; s=arc-20160816;
        b=B53w4+DXhWZpijoV0gdTSoqGhWBiBYK6kkjPN5OYUxnoiSSbj/2EymXDRMFYrHmyu2
         HaUKlSArq1u2bKMmN6slMp+bW2z8XEQWtwnpmhvNcT2qaQ2PNVpy+mDVo2zHJIL5bP0f
         /uSLgs5tWOeAh/5sWcAcfAXCHlT+0iPjtDALPEe0/An1QqBmd0a5dh4228FYgkId44Nc
         mWv7ybVeNFm6qlkYP/0eAkPSYIate6pcDPMsNcx7ZzIP74DrL3+p1HPsoHbMJrITOAGJ
         N3BFQgtikI4V5ItCF8HqPMJfHURXdPc6NbfZCak44QNz76KVum4vO2DaHEDK4dQ0X1dq
         QPVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:content-disposition
         :content-transfer-encoding:mime-version:in-reply-to:references:to
         :from:date:message-id:arc-authentication-results;
        bh=dGOHEm9XZrAnQcNcYuRPPmmIqQAMyI7TU94cwBwMj90=;
        b=rIMw0Cwq/hTsIAvtdEOVfZZcEjgHk3nUjFQwooJHX9L9o1a31vqDO98N5W8hIlfKNA
         tsdKqk3op2exgbxFQX5Dt1m4gs2Yhh25QATbA2Oich5OQxHDN03GjjAdJmNCD9p3ygnV
         hbuvA4IT1TYYesXZfHJeRIjxgavIKLLKTqH1eyeD5NTO0OXCi1JwVhGd8u9YFTyjLZVh
         c9yQTtxydJwVJJ7Asooo+a2ZhcF+5sIfXYFH7O9mCbEJGXrAUayeYryAaMkAHfMYeLqC
         70FNLNtY6I9hBIQ1iEucN+OPXeHQ0LsALh6ZZ/nbCdoIcP2Ug+y6GVS05ygTGj1ytLFI
         Lwog==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x19si1132941qth.249.2017.09.28.01.35.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Sep 2017 01:35:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57965 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dxUHi-0003fA-6K
	for alex.bennee@linaro.org; Thu, 28 Sep 2017 04:35:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50186)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <JBeulich@suse.com>) id 1dxUGp-0003KD-3I
	for qemu-devel@nongnu.org; Thu, 28 Sep 2017 04:34:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <JBeulich@suse.com>) id 1dxUGo-0008JV-CH
	for qemu-devel@nongnu.org; Thu, 28 Sep 2017 04:34:11 -0400
Received: from prv-mh.provo.novell.com ([137.65.248.74]:40782)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <JBeulich@suse.com>)
	id 1dxUGh-0008GB-EE; Thu, 28 Sep 2017 04:34:03 -0400
Received: from INET-PRV-MTA by prv-mh.provo.novell.com
	with Novell_GroupWise; Thu, 28 Sep 2017 02:34:00 -0600
Message-Id: <59CCD0150200007800180507@prv-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 14.2.2 
Date: Thu, 28 Sep 2017 02:33:57 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Eduardo Habkost" <ehabkost@redhat.com>
References: <20170927195635.16014-1-ehabkost@redhat.com>
	<20170927195635.16014-5-ehabkost@redhat.com>
In-Reply-To: <20170927195635.16014-5-ehabkost@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 137.65.248.74
Subject: Re: [Qemu-devel] [Xen-devel] [PATCH v2 4/5] pci: Add
 INTERFACE_CONVENTIONAL_PCI_DEVICE to Conventional PCI devices
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	David Gibson <dgibson@redhat.com>, Jiri Slaby <jslaby@suse.cz>,
	Hannes Reinecke <hare@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
	Alexander Graf <agraf@suse.de>,
	=?UTF-8?Q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
	Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Jiri Pirko <jiri@resnulli.us>,
	Marcel Apfelbaum <marcel@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm@nongnu.org, Laine Stump <laine@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Yongbok Kim <yongbok.kim@imgtec.com>,
	Alistair Francis <alistair23@gmail.com>, John Snow <jsnow@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: niJt4C7MwnDT

>>> On 27.09.17 at 21:56, <ehabkost@redhat.com> wrote:
> --- a/hw/xen/xen_pt.c
> +++ b/hw/xen/xen_pt.c
> @@ -964,6 +964,10 @@ static const TypeInfo xen_pci_passthrough_info =3D =
{
>      .instance_size =3D sizeof(XenPCIPassthroughState),
>      .instance_finalize =3D xen_pci_passthrough_finalize,
>      .class_init =3D xen_pci_passthrough_class_init,
> +    .interfaces =3D (InterfaceInfo[]) {
> +        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
> +        { },
> +    },
>  };

Passed through devices can be both PCI and PCIe, so following
the description of the patch I don't think these can be statically
given either property. Granted quite a bit of PCIe specific
functionality may be missing in the Xen code ...

Jan

