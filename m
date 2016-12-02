Received: by 10.25.159.131 with SMTP id i125csp77351lfe;
        Thu, 1 Dec 2016 20:48:56 -0800 (PST)
X-Received: by 10.200.36.171 with SMTP id s40mr35293674qts.142.1480654136255;
        Thu, 01 Dec 2016 20:48:56 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n80si2071167qkl.10.2016.12.01.20.48.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Dec 2016 20:48:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60614 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cCfmI-0006zT-V5
	for alex.bennee@linaro.org; Thu, 01 Dec 2016 23:48:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38781)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alastair@au1.ibm.com>) id 1cCflq-0006lU-MD
	for qemu-arm@nongnu.org; Thu, 01 Dec 2016 23:48:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alastair@au1.ibm.com>) id 1cCfln-0005kT-H2
	for qemu-arm@nongnu.org; Thu, 01 Dec 2016 23:48:26 -0500
Received: from 001b2d01.pphosted.com ([148.163.156.1]:32773
	helo=mx0a-001b2d01.pphosted.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alastair@au1.ibm.com>)
	id 1cCfln-0005k0-7b
	for qemu-arm@nongnu.org; Thu, 01 Dec 2016 23:48:23 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
	uB24iwNJ115381
	for <qemu-arm@nongnu.org>; Thu, 1 Dec 2016 23:48:21 -0500
Received: from e23smtp03.au.ibm.com (e23smtp03.au.ibm.com [202.81.31.145])
	by mx0a-001b2d01.pphosted.com with ESMTP id 272tsr0jnc-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-arm@nongnu.org>; Thu, 01 Dec 2016 23:48:21 -0500
Received: from localhost
	by e23smtp03.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-arm@nongnu.org> from <alastair@au1.ibm.com>;
	Fri, 2 Dec 2016 14:48:18 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
	by e23smtp03.au.ibm.com (202.81.31.209) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Fri, 2 Dec 2016 14:48:16 +1000
Received: from d23relay07.au.ibm.com (d23relay07.au.ibm.com [9.190.26.37])
	by d23dlp01.au.ibm.com (Postfix) with ESMTP id 489302CE8046;
	Fri,  2 Dec 2016 15:48:16 +1100 (EST)
Received: from d23av04.au.ibm.com (d23av04.au.ibm.com [9.190.235.139])
	by d23relay07.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	uB24mGne33095782; Fri, 2 Dec 2016 15:48:16 +1100
Received: from d23av04.au.ibm.com (localhost [127.0.0.1])
	by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	uB24mFUi010553; Fri, 2 Dec 2016 15:48:16 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
	by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	uB24mFq9010544; Fri, 2 Dec 2016 15:48:15 +1100
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id CE777A0138;
	Fri,  2 Dec 2016 15:48:14 +1100 (AEDT)
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-arm@nongnu.org
Date: Fri, 02 Dec 2016 15:48:14 +1100
In-Reply-To: <30622747-cc4f-4f02-320f-7b061476c0da@ozlabs.ru>
References: <20161130053629.23340-1-alastair@au1.ibm.com>
	<20161130053629.23340-5-alastair@au1.ibm.com>
	<6c328f0d-af92-4732-b1e2-5255c91536fc@ozlabs.ru>
	<1480637970.16973.3.camel@au1.ibm.com>
	<993b87ea-604a-b284-84e4-e98e6980d515@ozlabs.ru>
	<1480649425.16973.5.camel@au1.ibm.com>
	<30622747-cc4f-4f02-320f-7b061476c0da@ozlabs.ru>
Organization: IBM Australia
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.2 (3.22.2-1.fc25) 
Mime-Version: 1.0
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16120204-0008-0000-0000-000000EC8A7E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16120204-0009-0000-0000-000008A02608
Message-Id: <1480654094.23683.2.camel@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-12-02_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=0
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
	definitions=main-1612020082
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
	mx0a-001b2d01.pphosted.com id uB24iwNJ115381
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.156.1
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 4/6] hw/timer: Add Epson
 RX8900 RTC support
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
	qemu-devel@nongnu.org, Chris Smart <chris@distroguy.com>,
	=?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3PPndHg0vljX

On Fri, 2016-12-02 at 15:07 +1100, Alexey Kardashevskiy wrote:
> On 02/12/16 14:30, Alastair D'Silva wrote:
> > On Fri, 2016-12-02 at 13:48 +1100, Alexey Kardashevskiy wrote:
> > > On 02/12/16 11:19, Alastair D'Silva wrote:
> > > > On Thu, 2016-12-01 at 16:53 +1100, Alexey Kardashevskiy wrote:
> > > >=20
> > > > > On 30/11/16 16:36, Alastair D'Silva wrote:
> > > > > > From: Alastair D'Silva <alastair@d-silva.org>
> > > > > >=20
> > > > > > This patch adds support for the Epson RX8900 I2C RTC.
> > > > > >=20
> > > > > > The following chip features are implemented:
> > > > > > =C2=A0- RTC (wallclock based, ptimer 10x oversampling to pick=
 up
> > > > > > 	wallclock transitions)
> > > > > > =C2=A0- Time update interrupt (per second/minute, wallclock
> > > > > > based)
> > > > > > =C2=A0- Alarms (wallclock based)
> > > > > > =C2=A0- Temperature (set via a property)
> > > > > > =C2=A0- Countdown timer (emulated clock via ptimer)
> > > > > > =C2=A0- FOUT via GPIO (emulated clock via ptimer)
> > > > > >=20
> > > > > > The following chip features are unimplemented:
> > > > > > =C2=A0- Low voltage detection
> > > > > > =C2=A0- i2c timeout
> > > > > >=20
> > > > > > The implementation exports the following named GPIOs:
> > > > > > rx8900-interrupt-out
> > > > > > rx8900-fout-enable
> > > > > > rx8900-fout
> > > > > >=20
> > > > > > Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> > > > > > Signed-off-by: Chris Smart <chris@distroguy.com>
> > > > > > ---
> > > > > > =C2=A0default-configs/arm-softmmu.mak |=C2=A0=C2=A0=C2=A01 +
> > > > > > =C2=A0hw/timer/Makefile.objs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A0=C2=A02 +
> > > > > > =C2=A0hw/timer/rx8900.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 890
> > > > > > ++++++++++++++++++++++++++++++++++++++++
> > > > > > =C2=A0hw/timer/rx8900_regs.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0| 139 +++++++
> > > > > > =C2=A0hw/timer/trace-events=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A031 ++
> > > > > > =C2=A05 files changed, 1063 insertions(+)
> > > > > > =C2=A0create mode 100644 hw/timer/rx8900.c
> > > > > > =C2=A0create mode 100644 hw/timer/rx8900_regs.h
> > > > > >=20
> > > > > >=20
<snip>
> > > > > > +#define TYPE_RX8900 "rx8900"
> > > > > > +#define RX8900(obj) OBJECT_CHECK(RX8900State, (obj),
> > > > > > TYPE_RX8900)
> > > > > > +
> > > > > > +typedef struct RX8900State {
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0I2CSlave parent_obj;
> > > > > > +
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0ptimer_state *sec_timer; /* triggere=
d once per second
> > > > > > */
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0ptimer_state *fout_timer;
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0ptimer_state *countdown_timer;
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0bool fout;
> > > > >=20
> > > > > Is this "FOE" on the chip?
> > > > >=20
> > > >=20
> > > > No, it tracks the state of the fout waveform. I'll rename it to
> > > > fout_state.
> > >=20
> > > Since it is bool, fout_enabled makes more sense.
> > >=20
> >=20
> > No it does't, it's not an enabled control, but the phase of the
> > waveform.
>=20
> I do not mind that "enabled" may be bad name but you are not helping
> :)
>=20
> A "phase" can be false or true? What does "true" phase of a waveform
> mean?
>=20
> I cannot find neither "phase" nor "waveform" words in the spec.
>=20
FOUT outputs a 1, 1024 or 32768Hz square wave. We need to track the
current state of the wave so we know what the next state should be.

<snip>
> > > > > > +
> > > > > > +static void capture_current_time(RX8900State *s)
> > > > > > +{
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0/* Capture the current time into the=
 secondary
> > > > > > registers
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* which will be actually read =
by the data transfer
> > > > > > operation.
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*/
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0struct tm now;
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0qemu_get_timedate(&now, s->offset);
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0s->nvram[SECONDS] =3D to_bcd(now.tm_=
sec);
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0s->nvram[MINUTES] =3D to_bcd(now.tm_=
min);
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0s->nvram[HOURS] =3D to_bcd(now.tm_ho=
ur);
> > > > > > +
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0s->nvram[WEEKDAY] =3D 0x01 << ((now.=
tm_wday + s-
> > > > > > > wday_offset) %
> > > > > >=20
> > > > > > 7);
> > > > >=20
> > > > > s/0x01/1/ ?
> > > >=20
> > > > Weekday is a walking bit, I think hex notation is clearer.
> > >=20
> > >=20
> > > "1" is a pure one. 0x01 suggests a bit mask so it may be possible
> > > to
> > > shift
> > > some other value. I cannot think how 0x01 is clearer, I asked
> > > Paul,
> > > he
> > > cannot either ;)
> > >=20
> >=20
> > From the datasheet:
> > The day data values are counted as follows: Day 01h, Day 02h, Day
> > 04h,
> > Day 08h, Day 10h, Day 20h, Day 40h, Day 01h, Day 02h, etc.=C2=A0=C2=A0=
=C2=A0
>=20
> So it is not a mask. "1" it is.
>=20

I'm still not seeing your point, we are operating on raw binary data,
not a numeric. It is clearly defined as binary data in the datasheet,
and I consider hex/oct/bin notation to be the most appropriate for it
(even the datasheet authors use it). Yes, I understand that masks are
one type of binary information that is suitably represented by it, my
argument is that the use case is wider than you are asserting.

<snip>
> > > > >=20
> > > > > The RX8900 spec does not use word "offset" at all so I cannot
> > > > > make
> > > > > sense
> > > > > from the paragraph above - why exactly do you need 2 offsets
> > > > > ("offset" and
> > > > > "wday_offset") and why weekday cannot be calculated when it
> > > > > is
> > > > > needed
> > > > > from
> > > > > the current time + "offset"?
> > > > >=20
> > > >=20
> > > > The offsets refer to the difference between the host clock &
> > > > the
> > > > emulated clock. The weekday cannot be calculated as the RX8900
> > > > does
> > > > not
> > > > validate the weekday - the user can set the weekday to
> > > > anything.
> > >=20
> > >=20
> > > Ufff. Now I am totally confused. You say "the weekday cannot be
> > > calculated"
> > > but the comment says you defer its calculation. The comment needs
> > > an
> > > update.
> >=20
> > Sorry, my bad, the weekday cannot be calculated without the weekday
> > offset, as the weekday is not guaranteed to be correct for that
> > date.
>=20
>=20
> Short description of the whole weekday business in a comment would
> help.
>=20
Ok.=20


> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0break;
> > > > > > +
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0case WEEKDAY:
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0case EXT_WEEKDAY: {
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int user_wda=
y =3D ctz32(data);
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* The day f=
ield is supposed to contain a value in
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* the =
range 0-6. Otherwise behavior is undefined.
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*/
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0switch (data=
) {
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case 0x01:
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case 0x02:
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case 0x04:
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case 0x08:
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case 0x10:
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case 0x20:
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case 0x40:
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0break;
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0default:
> > > > >=20
> > > > > Instead of the switch:
> > > > >=20
> > > > > if (data & 0x80) {
> > > >=20
> > > > Weekday is a walking bit, the proposed check allows invalid
> > > > values.
> > >=20
> > >=20
> > > Ah, right, should have been if(data=3D=3D0x80).
> > >=20
> > > Actually you want to test that
> > > ((1<<ctz32(data)) =3D=3D data) && (user_wday < 7)
> >=20
> > It's short and clever, but the problem with clever code is it
> > requires
> > clever people to understand it. I had to stop and think about what
> > that
> > was doing.
>=20
>=20
> The only "clever" bit about it that it uses ctz() (which is not very
> common) but the code uses it anyway.
>=20
> You comment says "a value in the range 0-6" but the code does not
> actually
> compare with 0 and 6, and values up to 0x40 (way beyond 6) are
> allowed - I
> stopped to think why is that.

I've updated the comment to clarify the behaviour.

<snip>
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0snprintf(name, sizeof(name), "rx8900=
-interrupt-out");
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0qdev_init_gpio_out_named(&i2c->qdev,=
 &s-
> > > > > > >interrupt_pin,
> > > > > > name,
> > > > > > 1);
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0trace_rx8900_pin_name("Interrupt", n=
ame);
> > > > >=20
> > > > > I would just pass a string to qdev_init_gpio_out_named() and
> > > > > ditch
> > > > > @name
> > > > > from tracepoints as they use unique strings anyway. And I'd
> > > > > also
> > > >=20
> > > > The same trace is reused
> > >=20
> > > The first parameter of reused trace is unique anyway.
> > >=20
> >=20
> > Yes, but the name value-adds.
>=20
> Nope, not at all. See the comment below.
>=20
>=20
> >=20
> > >=20
> > > >=20
> > > > > ditch
> > > > > trace_rx8900_pin_name tracepoints as they do not seem very
> > > > > useful
> > > > > -
> > > > > they do
> > > > > not report an error or a success.
> > > >=20
> > > > It makes it easier when debugging to validate that your idea of
> > > > the
> > > > named interrupt matches the implementation.
> > >=20
> > > I am missing the point here. If the trace printed a string from
> > > i2c-
> > > > qdev,
> > >=20
> > > then yes, the trace could be used to tell if the actual name
> > > matches
> > > what
> > > you passed to qdev_init_gpio_in_named() but in this code the
> > > trace
> > > will
> > > always print the string you snprintf() 2 lines above. Quite
> > > useless.
> > >=20
> >=20
> > It was useful to me in development, it may be useful in the future.
>=20
> I seriously doubt it but it is not me whose "reviewed-by" you need
> anyway
> and Cedric gave you one, this should do it :)
>=20
>=20
> > Think of it as an announcement of "this is where you can find me".
>=20
>=20
> The "rx8900_pin_name" tracepoint name is pretty precise in this case
> already - only one function uses it and enabling it will give you 3
> lines
> of traces while one would do exact same job - tells you that
> rx8900_realize() is called. Again, it prints static strings only, and
> the
> strings are define right there.
>=20

I don't think we are going to reach alignment here, but it's a pretty
minor point.

--=20
Alastair D'Silva
Open Source Developer
Linux Technology Centre, IBM Australia
mob: 0423 762 819

