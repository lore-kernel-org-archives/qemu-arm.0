Received: by 10.25.21.156 with SMTP id 28csp2031716lfv;
        Fri, 5 Aug 2016 14:47:52 -0700 (PDT)
X-Received: by 10.237.60.112 with SMTP id u45mr15371156qte.27.1470433672147;
        Fri, 05 Aug 2016 14:47:52 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m67si10176235qkb.53.2016.08.05.14.47.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 05 Aug 2016 14:47:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47233 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bVmy7-0003g4-GI
	for alex.bennee@linaro.org; Fri, 05 Aug 2016 17:47:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45929)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lv.zheng@intel.com>) id 1bVmy1-0003eR-9T
	for qemu-arm@nongnu.org; Fri, 05 Aug 2016 17:47:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lv.zheng@intel.com>) id 1bVmy0-0006ED-EV
	for qemu-arm@nongnu.org; Fri, 05 Aug 2016 17:47:45 -0400
Received: from mga01.intel.com ([192.55.52.88]:22766)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lv.zheng@intel.com>)
	id 1bVmxv-0006Cn-O8; Fri, 05 Aug 2016 17:47:39 -0400
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 05 Aug 2016 14:47:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,475,1464678000"; d="scan'208";a="1009292203"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
	by orsmga001.jf.intel.com with ESMTP; 05 Aug 2016 14:47:21 -0700
Received: from FMSMSX109.amr.corp.intel.com (10.18.116.9) by
	FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Fri, 5 Aug 2016 14:47:20 -0700
Received: from shsmsx102.ccr.corp.intel.com (10.239.4.154) by
	fmsmsx109.amr.corp.intel.com (10.18.116.9) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Fri, 5 Aug 2016 14:47:19 -0700
Received: from shsmsx101.ccr.corp.intel.com ([169.254.1.8]) by
	shsmsx102.ccr.corp.intel.com ([169.254.2.147]) with mapi id
	14.03.0248.002; Sat, 6 Aug 2016 05:47:15 +0800
From: "Zheng, Lv" <lv.zheng@intel.com>
To: Igor Mammedov <imammedo@redhat.com>
Thread-Topic: [Qemu-devel] [PATCH] debugcon: Add -debugport option to allow
	changing debug console port number
Thread-Index: AQHR7wL4V1YYDepyhEaeEKGeQ9GwZKA5rFEAgAE5f+A=
Date: Fri, 5 Aug 2016 21:47:13 +0000
Message-ID: <1AE640813FDE7649BE1B193DEA596E883BC0AAFB@SHSMSX101.ccr.corp.intel.com>
References: <24044757332cd427e378053739e6f49980e0ac5d.1470392366.git.lv.zheng@intel.com>
	<20160805125758.2453e28e@nial.brq.redhat.com>
In-Reply-To: <20160805125758.2453e28e@nial.brq.redhat.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMTg4YmZiYTYtMzhkOS00ZTZlLTlmNDYtOWFiMjIwMzFhMDI1IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX0lDIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE1LjkuNi42IiwiVHJ1c3RlZExhYmVsSGFzaCI6ImcrMGYxaW9aTFwvN0RRMkMzV2FVSmZoem40VWFIcVhLKzIzdWR5MExJWTJvPSJ9
x-ctpclassification: CTP_IC
x-originating-ip: [10.239.127.40]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.88
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] debugcon: Add -debugport option
 to allow changing debug console port number
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Lv
	Zheng <zetalog@gmail.com>, "armbru@redhat.com" <armbru@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f2SLiqfCItb3

Hi,

> From: Igor Mammedov [mailto:imammedo@redhat.com]
> Subject: Re: [Qemu-devel] [PATCH] debugcon: Add -debugport option to
> allow changing debug console port number
>=20
> On Fri,  5 Aug 2016 18:19:39 +0800
> Lv Zheng <lv.zheng@intel.com> wrote:
>=20
> > Changing debugcon port to 0x402 allows the seabios AML table pre-
> defined
> > DBUG() control method to be able to dump the AML debugging
> information to
> > the re-directed debugging console.
> >
> > If the debug port number is configurable, users can further specify a
> > proper IO port number for it to make external BIOS's debugging
> > facility functioning.
>=20
> there is no need for yet another CLI option that is being added here,
> just use usual '-device isa-debugcon,iobase=3D0x402,chardev=3Dseabios"
>=20

[Lv Zheng]=20
OK, thanks for the information.

However, I feel that there are still improvements we can do here:
1. synchronizing DSDT's DBG operation region to debugcon iobase in acpi-bui=
ld.c;
2. the readback should be automatically corrected by the isa-debugcon.iobas=
e.
What do you think of this?
And if one of the above stuffs is useful, do you need me to send a revised =
patch?

Cheers
Lv

