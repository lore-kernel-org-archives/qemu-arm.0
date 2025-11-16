Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E91CCD19A
	for <qemu-arm@archiver.kernel.org>; Sun, 16 Nov 2025 21:32:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vKkMA-00044J-Gt; Sun, 16 Nov 2025 16:32:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <bounce+7d9d16.7c7b8f-qemu-arm=nongnu.org@revolve.com>)
 id 1vKhiW-0008C1-JD
 for qemu-arm@nongnu.org; Sun, 16 Nov 2025 13:43:16 -0500
Received: from a44.a6e4cdb8.use4.send.mailgun.net ([198.244.49.44])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <bounce+7d9d16.7c7b8f-qemu-arm=nongnu.org@revolve.com>)
 id 1vKhiT-0005cr-Fv
 for qemu-arm@nongnu.org; Sun, 16 Nov 2025 13:43:16 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=revolve.com; q=dns/txt;
 s=smtp; t=1763318591; x=1763325791; 
 h=Message-Id: In-Reply-To: To: To: Cc: From: From: Subject: Subject:
 Content-Type: Mime-Version: Date: Sender: Sender; 
 bh=w5OvZC2cuFCCLnLP4PXBUxW66ilrdlxy98nZf+11cj0=;
 b=tIaJ9RkiaK+Hbo25YtA9BU/a4k2J9sxz5UdspSXMsXvnZnJK+WnhSKsxsRpVji5EFrojsP17dGFR4AIreVJGs3mZO1VjRumZaHzxxza0QBqmBHS2dbVP2hPjIonLen/3f5PZlI7f1Wrj4Z1LH8MdmRjVAFOR701T9FXz+pWWNg0=
X-Mailgun-Sid: WyIwZWQxZSIsInFlbXUtYXJtQG5vbmdudS5vcmciLCI3YzdiOGYiXQ==
Received: by 6130ff375f9780dfb3af950874568c4cc5e1d1d4ede81abf44958894a3eeb710
 with HTTP id 691a1b3e5548fd3d57d635e7; Sun, 16 Nov 2025 18:43:10 GMT
X-Mailgun-Sending-Ip: 198.244.49.44
Date: Sun, 16 Nov 2025 18:43:10 +0000
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="06de6f41cd2f09dd844a5d4a4c76c03c0d0680befda2e39f8bb61e67ddf3"
Subject: Re: [RFC PATCH] hw/dma: don't allow weird transfer lengths for bcm2835
Cc: yodel.eldar@gmail.com, qemu-devel@nongnu.org, peter.maydell@linaro.org,
 philmd@linaro.org, farosas@suse.de, lvivier@redhat.com, pbonzini@redhat.com,
 qemu-arm@nongnu.org, florian.meier@koalo.de, florian.fainelli@broadcom.com
To: yodel.eldar@gmail.com, alex.bennee@linaro.org, yodel.eldar@yodel.dev
In-Reply-To: <200584ab-1ce3-44bb-8911-59df9e9a8f37@gmail.com>
Message-Id: <c3qqgqdgQoK1xEReeO9GHw@revolve.com>
X-Mailgun-Variables: {"communicationId":
 "eyJvcmdJZCI6ImNQZTR5MjV6VGx5SlBjM2VvRHZTaGciLCJjdXN0b21lcklkIjoiZ1U4T0dULU1SY2FMN1YtNkVHeVhtZyIsImNvbnZlcnNhdGlvbkl0ZW1JZCI6ImMzcXFncWRnUW9LMXhFUmVlTzlHSHcifQ"}
Received-SPF: pass client-ip=198.244.49.44;
 envelope-from=bounce+7d9d16.7c7b8f-qemu-arm=nongnu.org@revolve.com;
 helo=a44.a6e4cdb8.use4.send.mailgun.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 16 Nov 2025 16:32:16 -0500
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
Reply-to:  REVOLVE <service@revolve.com>
From:  REVOLVE via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

--06de6f41cd2f09dd844a5d4a4c76c03c0d0680befda2e39f8bb61e67ddf3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Yodel,=20

Thank you for reaching out to us here at Revolve!=20
=20
Here is the direct contact for your inquiry: Buyers@revolve.com=20
=20
I hope this information was helpful! If you have any questions or concerns,=
 please feel free to contact us as we are more than happy to assist you.

Regards,=20
Sammie=C2=A0
Customer Service

How was your service? Please leave your comments https://www.revolve.com/r/=
CSFeedbackSurvey.jsp?type=3Drep&name=3DSammie%20O&c=3DgU8OGT-MRcaL7V-6EGyXm=
g=C2=A0

On Sunday, November 16, 2025, 6:33 AM "Yodel Eldar" <yodel.eldar@gmail.com>=
 wrote:

>=20
> On 14/11/2025 10:43, Alex Benn=C3=A9e wrote:
> > Yodel Eldar <yodel.eldar@yodel.dev> writes:
> >=20
> > (add Florians to CC)
> >=20
> >> On 11/11/2025 04:54, Alex Benn=C3=A9e wrote:
> >>> The datasheet doesn't explicitly say that TXFR_LEN has to be word
> >>> aligned but the fact there is a DMA_D_WIDTH flag to select between 32
> >>> bit and 128 bit strongly implies that is how it works. The downstream
> >>
> >> At the bottom of page 38, the datasheet [1] states "the DMA can deal
> >> with byte aligned transfers and will minimise bus traffic by buffering
> >> and packing misaligned accesses."
> >>
> >> IIUC, the *_WIDTH info fields are implied as maxima.
> >>
> >> [1] https://datasheets.raspberrypi.com/bcm2835/bcm2835-peripherals.pdf
> >=20
> > That reads ambiguously - you could start a misaligned n*WIDTH transfer
> > and the hardware will write bytes until aligned?
> >=20
> > If it does indeed work with byte accesses maybe we can just do:
> >=20
> >    if (xlen & 0x3) {
> >      .. do one byte ..
> >      xlen -=3D 1;
> >    } else {
> >      .. existing 32 bit code ..
> >    }
> >=20
> > but I guess we need to handle unaligned accesses as well.
> >=20
> > Florian,
> >=20
> > Can you help clarify what the datasheet means here?
> >=20
> > Thanks,
> >=20
> > <snip>
> >=20
> >>> rpi kernel also goes to efforts to not write sub-4 byte lengths so
> >>> lets:
> >=20
>=20
> Sorry for the lagged response: I was reviewing the datasheet and,
> failing to find clarity there, familiarizing myself with the AXI
> protocol spec and relevant driver code. Unfortunately, I'm still
> uncertain about how the DMA controller handles unaligned values in
> TXFR_LEN.XLENGTH, but below I've listed some of my abridged findings in
> the hope that it may be of some help. Given my ambivalence regarding
> the answer to the question, I defer to Alex and the community.
>=20
> In alignment with Peter's comment, the AXI spec clearly explicates
> support of unaligned start address transfers [1] but doesn't appear to
> require support of unaligned ending transfers, although, that doesn't
> preclude them either.
>=20
> On the other hand, we know the BCM2835 supports write strobes at least
> for triggering cache prefetching [2], and that this "allows memory
> structures to be implemented that can be written using byte and half
> word accesses" [3]. The specification also states "[a]ll [manager]
> interfaces and interconnect must provide correct write strobes" and
> that subordinate components can choose to: fully use them, ignore them
> (i.e., "treat all writes as being the full data bus width"), or detect
> unsupported write strobe combinations and provide an error response.
> Moreover, "[a]ny [subordinate] component that is providing memory-like
> behavior must fully support write strobes" [3]. To me, this suggests
> that the BCM2835 has what it needs to be able to invalidate the bytes
> past the TXFR_LEN bytes in the final beat of a DMA write transaction...
> but IIUC it's possible to forego that and remain AXI-compliant.
>=20
> Section 4.2 of {A}, Burst Length, also mentions the use of write strobes
> for partial write transactions and extends it to cover read transactions
> via discarding, too:
>=20
>      No component can terminate a burst early to reduce the number of
>      data transfers. During a write burst, the [manager] can disable
>      further writing by deasserting all the write strobes, but it
>      must complete the remaining transfers in the burst. During a
>      read burst, the [manager] can discard further read data, but it
>      must complete the remaining transfers in the burst. [4]
>=20
> As a counterpoint, however, perhaps only whole transfers of a read
> transaction can be discarded, or the BCM2835 forewent it altogether.
>=20
> Narrow Transfers, section 9.3, also mentions the generation of transfers
> that are narrower than the data bus of the manager [5].
>=20
> All of the above are taken from the AXI spec, but as mentioned earlier
> some of these features are opt-in, and the BCM2835 could have skipped
> them. So, lastly, let's consider TXFR_LEN from the datasheet [6]: It's
> described as "specif[ying] the amount of data to be transferred in
> bytes." Moreover, all of the bits of its bitfield are accounted,
> including TXFR_LEN[31:30]: "Reserved - Write as 0, read as don't care."
> It could be an unfortunate oversight that the authors' didn't describe
> TXFR_LEN[1:0] with the same description, or it could be intentional. If
> XLENGTH's two LSBs are always 0 (or just ignored), then couldn't
> TXFR_LEN simply indicate the number of transfers instead of the total
> number of bytes transferred in a transaction, like YLENGTH in 2D mode?
>=20
> I'm inclined to think that the line about the DMA dealing with byte
> aligned transfers means that both unaligned start addresses and
> a partial terminal data transfers via packing, buffering, discarding,
> and the application of write strobes on full-width transfers are
> possible, but without more precise language or a test on hardware (not
> planned anytime soon), I can't be sure. Also, please let me know if
> I misunderstood any of the source material or important details I
> may have missed.
>=20
> In the absence of certainty and for the sake of addressing the DoS issue
> that inspired the patch, perhaps it's better to leave the patch as is
> with a comment soliciting further investigation on actual behavior?
>=20
> {A} AMBA AXI Protocol Version: 2.0 Specification
>      https://documentation-service.arm.com/static/64256e84314e245d086bc88=
f
>=20
> {B} BCM2835 ARM Peripherals
>      https://datasheets.raspberrypi.com/bcm2835/bcm2835-peripherals.pdf
>=20
> [1] {A} (p. 10-2)
> [2] {B} (p. 51)
> [3] {A} (p. 14-5)
> [4] {A} (p. 4-3)
> [5] {A} (p. 9-4)
> [6] {B} (p. 53)
>=20
> Thanks,
> Yodel
>=20

--06de6f41cd2f09dd844a5d4a4c76c03c0d0680befda2e39f8bb61e67ddf3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="utf-8"

<html><head></head><body><div>Hi Yodel, </div><div><br/></div><div>Thank yo=
u for reaching out to us here at Revolve! </div><div> </div><div>Here is th=
e direct contact for your inquiry: Buyers@revolve.com </div><div> </div><di=
v>I hope this information was helpful! If you have any questions or concern=
s, please feel free to contact us as we are more than happy to assist you.<=
/div><div><br/></div><div>Regards, </div><div>Sammie=C2=A0</div><div>Custom=
er Service</div><div><br/></div><div>How was your service? Please leave you=
r comments https://www.revolve.com/r/CSFeedbackSurvey.jsp?type=3Drep&amp;na=
me=3DSammie%20O&amp;c=3DgU8OGT-MRcaL7V-6EGyXmg=C2=A0</div><div><br/><div><d=
iv>On Sunday, November 16, 2025, 6:33 AM &#34;Yodel Eldar&#34; &lt;yodel.el=
dar@gmail.com&gt; wrote:</div><div dir=3D"auto"><blockquote style=3D"margin=
:0.5ex 0 0 0.8ex;border-left:1px #ccc solid;padding-left:1ex"><div><br/>On =
14/11/2025 10:43, Alex Benn=C3=A9e wrote:<br/>&gt; Yodel Eldar <yodel.eldar=
@yodel.dev> writes:<br/>&gt; <br/>&gt; (add Florians to CC)<br/>&gt; <br/>&=
gt;&gt; On 11/11/2025 04:54, Alex Benn=C3=A9e wrote:<br/>&gt;&gt;&gt; The d=
atasheet doesn&#39;t explicitly say that TXFR_LEN has to be word<br/>&gt;&g=
t;&gt; aligned but the fact there is a DMA_D_WIDTH flag to select between 3=
2<br/>&gt;&gt;&gt; bit and 128 bit strongly implies that is how it works. T=
he downstream<br/>&gt;&gt;<br/>&gt;&gt; At the bottom of page 38, the datas=
heet [1] states &#34;the DMA can deal<br/>&gt;&gt; with byte aligned transf=
ers and will minimise bus traffic by buffering<br/>&gt;&gt; and packing mis=
aligned accesses.&#34;<br/>&gt;&gt;<br/>&gt;&gt; IIUC, the *_WIDTH info fie=
lds are implied as maxima.<br/>&gt;&gt;<br/>&gt;&gt; [1] https://datasheets=
=2Eraspberrypi.com/bcm2835/bcm2835-peri=
pherals.pdf<br/>&gt; <br/>&gt; That re=
ads ambiguously - you could start a misaligned n*WIDTH transfer<br/>&gt; an=
d the hardware will write bytes until aligned?<br/>&gt; <br/>&gt; If it doe=
s indeed work with byte accesses maybe we can just do:<br/>&gt; <br/>&gt;  =
  if (xlen &amp; 0x3) {<br/>&gt;      .. do one byte ..<br/>&gt;      xlen =
-=3D 1;<br/>&gt;    } else {<br/>&gt;      .. existing 32 bit code ..<br/>&=
gt;    }<br/>&gt; <br/>&gt; but I guess we need to handle unaligned accesse=
s as well.<br/>&gt; <br/>&gt; Florian,<br/>&gt; <br/>&gt; Can you help clar=
ify what the datasheet means here?<br/>&gt; <br/>&gt; Thanks,<br/>&gt; <br/=
>&gt; <snip><br/>&gt; <br/>&gt;&gt;&gt; rpi kernel also goes to efforts to =
not write sub-4 byte lengths so<br/>&gt;&gt;&gt; lets:<br/>&gt; <br/><br/>S=
orry for the lagged response: I was reviewing the datasheet and,<br/>failin=
g to find clarity there, familiarizing myself with the AXI<br/>protocol spe=
c and relevant driver code. Unfortunately, I&#39;m still<br/>uncertain abou=
t how the DMA controller handles unaligned values in<br/>TXFR_LEN.XLENGTH, =
but below I&#39;ve listed some of my abridged findings in<br/>the hope that=
 it may be of some help. Given my ambivalence regarding<br/>the answer to t=
he question, I defer to Alex and the community.<br/><br/>In alignment with =
Peter&#39;s comment, the AXI spec clearly explicates<br/>support of unalign=
ed start address transfers [1] but doesn&#39;t appear to<br/>require suppor=
t of unaligned ending transfers, although, that doesn&#39;t<br/>preclude th=
em either.<br/><br/>On the other hand, we know the BCM2835 supports write s=
trobes at least<br/>for triggering cache prefetching [2], and that this &#3=
4;allows memory<br/>structures to be implemented that can be written using =
byte and half<br/>word accesses&#34; [3]. The specification also states &#3=
4;[a]ll [manager]<br/>interfaces and interconnect must provide correct writ=
e strobes&#34; and<br/>that subordinate components can choose to: fully use=
 them, ignore them<br/>(i.e., &#34;treat all writes as being the full data =
bus width&#34;), or detect<br/>unsupported write strobe combinations and pr=
ovide an error response.<br/>Moreover, &#34;[a]ny [subordinate] component t=
hat is providing memory-like<br/>behavior must fully support write strobes&=
#34; [3]. To me, this suggests<br/>that the BCM2835 has what it needs to be=
 able to invalidate the bytes<br/>past the TXFR_LEN bytes in the final beat=
 of a DMA write transaction...<br/>but IIUC it&#39;s possible to forego tha=
t and remain AXI-compliant.<br/><br/>Section 4.2 of {A}, Burst Length, also=
 mentions the use of write strobes<br/>for partial write transactions and e=
xtends it to cover read transactions<br/>via discarding, too:<br/><br/>    =
 No component can terminate a burst early to reduce the number of<br/>     =
data transfers. During a write burst, the [manager] can disable<br/>     fu=
rther writing by deasserting all the write strobes, but it<br/>     must co=
mplete the remaining transfers in the burst. During a<br/>     read burst, =
the [manager] can discard further read data, but it<br/>     must complete =
the remaining transfers in the burst. [4]<br/><br/>As a counterpoint, howev=
er, perhaps only whole transfers of a read<br/>transaction can be discarded=
, or the BCM2835 forewent it altogether.<br/><br/>Narrow Transfers, section=
 9.3, also mentions the generation of transfers<br/>that are narrower than =
the data bus of the manager [5].<br/><br/>All of the above are taken from t=
he AXI spec, but as mentioned earlier<br/>some of these features are opt-in=
, and the BCM2835 could have skipped<br/>them. So, lastly, let&#39;s consid=
er TXFR_LEN from the datasheet [6]: It&#39;s<br/>described as &#34;specif[y=
ing] the amount of data to be transferred in<br/>bytes.&#34; Moreover, all =
of the bits of its bitfield are accounted,<br/>including TXFR_LEN[31:30]: &=
#34;Reserved - Write as 0, read as don&#39;t care.&#34;<br/>It could be an =
unfortunate oversight that the authors&#39; didn&#39;t describe<br/>TXFR_LE=
N[1:0] with the same description, or it could be intentional. If<br/>XLENGT=
H&#39;s two LSBs are always 0 (or just ignored), then couldn&#39;t<br/>TXFR=
_LEN simply indicate the number of transfers instead of the total<br/>numbe=
r of bytes transferred in a transaction, like YLENGTH in 2D mode?<br/><br/>=
I&#39;m inclined to think that the line about the DMA dealing with byte<br/=
>aligned transfers means that both unaligned start addresses and<br/>a part=
ial terminal data transfers via packing, buffering, discarding,<br/>and the=
 application of write strobes on full-width transfers are<br/>possible, but=
 without more precise language or a test on hardware (not<br/>planned anyti=
me soon), I can&#39;t be sure. Also, please let me know if<br/>I misunderst=
ood any of the source material or important details I<br/>may have missed.<=
br/><br/>In the absence of certainty and for the sake of addressing the DoS=
 issue<br/>that inspired the patch, perhaps it&#39;s better to leave the pa=
tch as is<br/>with a comment soliciting further investigation on actual beh=
avior?<br/><br/>{A} AMBA AXI Protocol Version: 2.0 Specification<br/>     h=
ttps://documentation-service.arm.com/static/64256e84314e245d086bc88f<br/><b=
r/>{B} BCM2835 ARM Peripherals<br/>     https://datasheets.raspberrypi.com/=
bcm2835/bcm2835-peripherals.pdf<br/><br/>[1] {A} (p. 10-2)<br/>[2] {B} (p. =
51)<br/>[3] {A} (p. 14-5)<br/>[4] {A} (p. 4-3)<br/>[5] {A} (p. 9-4)<br/>[6]=
 {B} (p. 53)<br/><br/>Thanks,<br/>Yodel<br/></snip></yodel.eldar@yodel.dev>=
</div></blockquote></div></div><br/></div></body></html>
--06de6f41cd2f09dd844a5d4a4c76c03c0d0680befda2e39f8bb61e67ddf3--

