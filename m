Received: by 10.25.159.19 with SMTP id i19csp206023lfe;
        Wed, 27 Jan 2016 23:10:24 -0800 (PST)
X-Received: by 10.140.32.97 with SMTP id g88mr1672472qgg.40.1453965024335;
        Wed, 27 Jan 2016 23:10:24 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 36si10832996qgk.10.2016.01.27.23.10.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Jan 2016 23:10:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54312 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aOgik-0002Fm-He
	for alex.bennee@linaro.org; Thu, 28 Jan 2016 02:10:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39090)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <p.fedin@samsung.com>) id 1aOgih-0002Fc-Ob
	for qemu-arm@nongnu.org; Thu, 28 Jan 2016 02:10:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <p.fedin@samsung.com>) id 1aOgic-0000bA-56
	for qemu-arm@nongnu.org; Thu, 28 Jan 2016 02:10:19 -0500
Received: from mailout4.w1.samsung.com ([210.118.77.14]:48652)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <p.fedin@samsung.com>)
	id 1aOgib-0000aT-Uy; Thu, 28 Jan 2016 02:10:14 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
	by mailout4.w1.samsung.com
	(Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May 5
	2014)) with ESMTP id <0O1N00BF4IKWZMA0@mailout4.w1.samsung.com>; Thu,
	28 Jan 2016 07:10:08 +0000 (GMT)
X-AuditID: cbfec7f4-f79026d00000418a-0b-56a9bed047ad
Received: from eusync4.samsung.com ( [203.254.199.214])
	by eucpsbgm1.samsung.com (EUCPMTA) with SMTP id F8.9F.16778.0DEB9A65;
	Thu, 28 Jan 2016 07:10:08 +0000 (GMT)
Received: from fedinw7x64 ([106.109.131.169])
	by eusync4.samsung.com (Oracle Communications Messaging Server
	7.0.5.31.0 64bit (built May  5 2014))
	with ESMTPA id <0O1N007C7IKVIK20@eusync4.samsung.com>; Thu,
	28 Jan 2016 07:10:08 +0000 (GMT)
From: Pavel Fedin <p.fedin@samsung.com>
To: 'Eric Auger' <eric.auger@linaro.org>, eric.auger@st.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	alex.williamson@redhat.com, pranav.sawargaonkar@gmail.com,
	pbonzini@redhat.com, agraf@suse.de
References: <1453902715-25304-1-git-send-email-eric.auger@linaro.org>
	<1453902715-25304-7-git-send-email-eric.auger@linaro.org>
In-reply-to: <1453902715-25304-7-git-send-email-eric.auger@linaro.org>
Date: Thu, 28 Jan 2016 10:10:06 +0300
Message-id: <00a901d1599a$eba575a0$c2f060e0$@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
X-Mailer: Microsoft Outlook 14.0
Thread-index: AQJIwth0Uwm4fytvz77fNuFLp70Z2gHR86CJnhMfveA=
Content-language: ru
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJIsWRmVeSWpSXmKPExsVy+t/xa7oX9q0MM/h8Ws7ixJV/jBbf/vew
	WRz/8ZXN4sVrIHf+ljOsFlc3n2Wy2L/tH6vFnDMPWCyezpnNYrGgeyFQXe8OFouJPxYwOvB4
	tF76y+bx73A/k8fOWXfZPe5c28Pm8eTaZiaP9/uusnk8/bGX2WPz6eoAjigum5TUnMyy1CJ9
	uwSujKerWQu+sVfc3rSKuYGxka2LkZNDQsBE4vXeKywQtpjEhXvrgeJcHEICSxkl3s28zQrh
	fGeUWHrtFRNIFZuAusTprx9YQBIiAs8YJU5tfMgKkmAWiJOY13mGCaKjkVFiwbfzYB2cAm4S
	xz/dBLOFBZwl5mzvBdvHIqAqcbNlAVicV8BS4vGylewQtqDEj8n3WCCGakms33mcCcKWl9i8
	5i0zxK0KEjvOvmYEsUUErCTebZzMCFEjIjHt3z3mCYxCs5CMmoVk1Cwko2YhaVnAyLKKUTS1
	NLmgOCk911CvODG3uDQvXS85P3cTIyQCv+xgXHzM6hCjAAejEg8vQ9TKMCHWxLLiytxDjBIc
	zEoivIrVQCHelMTKqtSi/Pii0pzU4kOM0hwsSuK8c3e9DxESSE8sSc1OTS1ILYLJMnFwSjUw
	Tsy90Tol7AfbngtRG5185th1uEzj6Z7kstxAYrPLmuLqi+6XT3M2/+WoP+cnt0ykcLmK6PzS
	p+5fD+rWXnT8LJqz55n/1ibbc/IuL9iTffV9nip0bSm8/Nxp2Zwn/WHvrI5XqmwQ+cbS/czt
	m9zZVPOPFa+Ppz8+VhRR6ypcfnfn1IB68Q3nlFiKMxINtZiLihMBRVLs4LwCAAA=
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 210.118.77.14
Cc: Bharat.Bhushan@freescale.com, suravee.suthikulpanit@amd.com,
	christoffer.dall@linaro.org
Subject: Re: [Qemu-arm] [RFC 6/7] hw: arm: virt: register reserved IOVA
	region
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: esTIYfEKORdH

 Hello!

> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 3839c68..7eaf8be 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -125,6 +125,7 @@ static const MemMapEntry a15memmap[] = {
>      [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
>      [VIRT_SECURE_UART] =        { 0x09040000, 0x00001000 },
>      [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
> +    [VIRT_RESERVED] =           { 0x0be00000, 0x00100000 },

 Looks like with this approach we would need to add this to all machine models which make use of PCI. But is it a good idea? As far
as i understand, the only requirement for this region is not to clash with guest RAM addresses. So, can we instead have some code,
which automatically finds some place, based on the size? For now we hardcode the size to 0x00100000, but in future we could query
the host for the size, because it's still host's MSI controller.

Kind regards,
Pavel Fedin
Senior Engineer
Samsung Electronics Research center Russia


