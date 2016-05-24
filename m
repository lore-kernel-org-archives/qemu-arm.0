Received: by 10.25.30.65 with SMTP id e62csp845962lfe;
        Tue, 24 May 2016 10:13:43 -0700 (PDT)
X-Received: by 10.55.174.68 with SMTP id x65mr4550829qke.184.1464110023349;
        Tue, 24 May 2016 10:13:43 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q84si3364783qkc.225.2016.05.24.10.13.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 May 2016 10:13:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54452 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b5Ftm-0008Fd-KV
	for alex.bennee@linaro.org; Tue, 24 May 2016 13:13:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42097)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@xilinx.com>) id 1b5Ftj-0008Ep-LN
	for qemu-arm@nongnu.org; Tue, 24 May 2016 13:13:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@xilinx.com>) id 1b5Ftf-0006UL-MA
	for qemu-arm@nongnu.org; Tue, 24 May 2016 13:13:38 -0400
Received: from mail-cys01nam02on0040.outbound.protection.outlook.com
	([104.47.37.40]:22720
	helo=NAM02-CY1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1b5Ftf-0006UE-DX; Tue, 24 May 2016 13:13:35 -0400
Received: from CY1NAM02FT035.eop-nam02.prod.protection.outlook.com
	(10.152.74.53) by CY1NAM02HT094.eop-nam02.prod.protection.outlook.com
	(10.152.74.226) with Microsoft SMTP Server (TLS) id 15.1.497.8;
	Tue, 24 May 2016 16:57:51 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT035.mail.protection.outlook.com (10.152.75.186) with
	Microsoft SMTP Server (TLS) id 15.1.497.8 via Frontend Transport;
	Tue, 24 May 2016 16:57:51 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:59507
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1b5FeP-0001Eu-Ni; Tue, 24 May 2016 09:57:49 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1b5FeQ-0001fY-Ig; Tue, 24 May 2016 09:57:50 -0700
Received: from xsj-pvapsmtp01 (mailhub.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u4OGvnCJ030275; Tue, 24 May 2016 09:57:49 -0700
Received: from [172.19.5.101] (helo=localhost)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1b5FeO-0001fK-Kp; Tue, 24 May 2016 09:57:48 -0700
Date: Tue, 24 May 2016 18:57:47 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20160524165747.GR3731@toto>
References: <1463698459-31312-1-git-send-email-edgar.iglesias@gmail.com>
	<1463698459-31312-2-git-send-email-edgar.iglesias@gmail.com>
	<CAFEAcA-mBjS2tuQD1irUnaWD7qa1nrgMRL8LS66DdaTJmtEBHA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAFEAcA-mBjS2tuQD1irUnaWD7qa1nrgMRL8LS66DdaTJmtEBHA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22342.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(2980300002)(438002)(189002)(199003)(24454002)(9170700003)(6806005)(77096005)(57986006)(106466001)(63266004)(11100500001)(189998001)(9686002)(54356999)(2950100001)(47776003)(76506005)(1076002)(83506001)(19580405001)(1220700001)(19580395003)(5008740100001)(586003)(15650500001)(50986999)(76176999)(9786002)(92566002)(23726003)(33656002)(8676002)(8936002)(36386004)(97756001)(81166006)(4001350100001)(86362001)(46406003)(4326007)(87936001)(110136002)(50466002)(33716001)(2906002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1NAM02HT094; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; MLV:sfv; MX:1; A:1; LANG:en; 
X-MS-Office365-Filtering-Correlation-Id: 18dc50b9-43de-4694-612d-08d383f48ae1
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501002);
	SRVR:CY1NAM02HT094; 
X-Microsoft-Antispam-PRVS: <bde1ed9767b4473ea00cad07c7c4af60@CY1NAM02HT094.eop-nam02.prod.protection.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13024025)(13023025)(13018025)(13017025)(13015025)(8121501046)(5005006)(10201501046)(3002001)(6055026);
	SRVR:CY1NAM02HT094; BCL:0; PCL:0; RULEID:; SRVR:CY1NAM02HT094; 
X-Forefront-PRVS: 09525C61DB
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2016 16:57:51.1522 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1NAM02HT094
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.37.40
Subject: Re: [Qemu-arm] [PATCH v1 1/5] xlnx-zynqmp: Add a secure prop to
 en/disable ARM Security Extensions
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vzwXIItx/w2m

On Tue, May 24, 2016 at 05:30:54PM +0100, Peter Maydell wrote:
> On 19 May 2016 at 23:54, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> > From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> >
> > Add a secure prop to en/disable ARM Security Extensions.
> > This is particulary useful for KVM runs.
> 
> "particularly"
> 
> > Default to disabled to match the behavior of KVM.
> 
> This is a change in behaviour, though, right? Is that OK?

IMO it's OK. But I don't have a very strong opinion. We
didn't have EL3 in this machine to start with, it came in when
we enabled it on the a53. We don't have a big user-base that
really depends on either default I'd say.

Best regards,
Edgar


> 
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> > ---
> >  hw/arm/xlnx-zynqmp.c         | 3 +++
> >  include/hw/arm/xlnx-zynqmp.h | 3 +++
> >  2 files changed, 6 insertions(+)
> >
> > diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> > index 4d504da..965a250 100644
> > --- a/hw/arm/xlnx-zynqmp.c
> > +++ b/hw/arm/xlnx-zynqmp.c
> > @@ -238,6 +238,8 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
> >          }
> >          g_free(name);
> >
> > +        object_property_set_bool(OBJECT(&s->apu_cpu[i]),
> > +                                 s->secure, "has_el3", NULL);
> >          object_property_set_int(OBJECT(&s->apu_cpu[i]), GIC_BASE_ADDR,
> >                                  "reset-cbar", &error_abort);
> >          object_property_set_bool(OBJECT(&s->apu_cpu[i]), true, "realized",
> > @@ -370,6 +372,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
> >
> >  static Property xlnx_zynqmp_props[] = {
> >      DEFINE_PROP_STRING("boot-cpu", XlnxZynqMPState, boot_cpu),
> > +    DEFINE_PROP_BOOL("secure", XlnxZynqMPState, secure, false),
> >      DEFINE_PROP_END_OF_LIST()
> >  };
> >
> > diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
> > index 2332596..38d4c8c 100644
> > --- a/include/hw/arm/xlnx-zynqmp.h
> > +++ b/include/hw/arm/xlnx-zynqmp.h
> > @@ -84,6 +84,9 @@ typedef struct XlnxZynqMPState {
> >
> >      char *boot_cpu;
> >      ARMCPU *boot_cpu_ptr;
> > +
> > +    /* Has the ARM Security extensions?  */
> > +    bool secure;
> >  }  XlnxZynqMPState;
> 
> thanks
> -- PMM
