Received: by 10.25.208.211 with SMTP id h202csp712369lfg;
        Sun, 3 Apr 2016 08:05:54 -0700 (PDT)
X-Received: by 10.140.250.4 with SMTP id v4mr8042321qhc.9.1459695953886;
        Sun, 03 Apr 2016 08:05:53 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d185si19085657qhd.101.2016.04.03.08.05.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 03 Apr 2016 08:05:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53824 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1amjb7-00005z-C5
	for alex.bennee@linaro.org; Sun, 03 Apr 2016 11:05:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38070)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Aleksandar.Markovic@rt-rk.com>) id 1amjb3-00005a-CL
	for qemu-arm@nongnu.org; Sun, 03 Apr 2016 11:05:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Aleksandar.Markovic@rt-rk.com>) id 1amjb0-0003Mp-2Y
	for qemu-arm@nongnu.org; Sun, 03 Apr 2016 11:05:49 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:40921 helo=mail.rt-rk.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Aleksandar.Markovic@rt-rk.com>)
	id 1amjaz-0003LB-Ng; Sun, 03 Apr 2016 11:05:45 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.rt-rk.com (Postfix) with ESMTP id D83801A1164;
	Sun,  3 Apr 2016 17:05:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: by mail.rt-rk.com (Postfix, from userid 492)
	id 3D7841A118C; Sun,  3 Apr 2016 17:05:18 +0200 (CEST)
User-Agent: SOGoMail 2.2.5
X-Forward: 127.0.0.1
MIME-Version: 1.0
from: "Aleksandar Markovic" <Aleksandar.Markovic@rt-rk.com>
message-id: <78c-57013100-1-639ee000@97078574>
to: "Leon Alrae" <leon.alrae@imgtec.com>
content-type: multipart/alternative;
	boundary="----=_=-_OpenGroupware_org_NGMime-1932-1459695918.227686-0------"
date: Sun, 03 Apr 2016 17:05:18 +0200
in-reply-to: <56FEC6F0.9000803@imgtec.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, proljc@gmail.com,
	mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org,
	kbastian@mail.uni-paderborn.de, agraf@suse.de,
	blauwirbel@gmail.com, jcmvbkbc@gmail.com,
	miodrag.dinic@imgtec.com, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, petar.jovanovic@imgtec.com,
	pbonzini@redhat.com, gxt@mprc.pku.edu.cn, afaerber@suse.de,
	aurelien@aurel32.net, rth@twiddle.net
Subject: Re: [Qemu-arm] [PATCH 2/2] target-mips: Implement IEEE 754-2008
	functionality for R6 and MSA instructions
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
X-TUID: fWEg6OO9AP1E

------=_=-_OpenGroupware_org_NGMime-1932-1459695918.227686-0------
content-type: text/plain; charset=utf-8
content-length: 5105
content-transfer-encoding: quoted-printable


Hello, Leon, thank you very much for the kind feedback. Let me clarify =
my take on the involved issues.

1) Class operations

I am going to correct the code as you hinted.

The reason I wanted separate handling of MSA class operation is code an=
d module decoupling. Handling of MSA instructions (in file msa=5Fhelper=
.c) and regular instructions (in file op=5Fhelper.c) have many overlapi=
ng areas - however, my understanding is that the designer of MSA module=
 wanted it to be as independant on code in other files/modulas as possi=
ble. Handling class operation is on of the rare instances where code in=
 msa=5Fhelper.c relies on the code in op=5Fhelper.c., and it made sense=
 to me that this dependence should be removed, for the sake of consiste=
ncy within MSA module - even if the functionalitied are virtually ident=
ical. That said, I will anyway listen to your advice, since you most pr=
obably see more than myself regarding this, and I am going to revert to=
 a single handling of class operations, for both MSA and regular versio=
ns.

2) Flush subnormals

My impression is that his set of features should be treated and impleme=
nted separately, at some later point in time.

Although the implementation seems not to be too complex (defining FCR31=
=5FFS, invoking appropriately=C2=A0set=5Fflush=5Fto=5Fzero() and=C2=A0s=
et=5Fflush=5Finputs=5Fto=5Fzero() on CPU init, plus special exception h=
andling, like it is already done for MSA equivalents), it looks to me t=
hat it would have added a lot of risk into a patch series that is alrea=
dy touching a lot of sensitive areas, and therefore introducing a lot o=
f risks. Once this patch series is hopefully intergrated, flush subnorm=
als will be much easier to integrate, since it will be mips-only issue.=
 Therefore, if you agree, I will leave it for the future. I will defini=
tely mention it in commit messages though (as a limitaion), for future =
reference.

Thanks again for your consideration of this matter.

Sincerely yours,
Aleksandar


-------- Original Message --------
Subject: Re: [PATCH 2/2] target-mips: Implement IEEE 754-2008 functiona=
lity for R6 and MSA instructions
Date: Friday, April 1, 2016 21:07 CEST
From: Leon Alrae <leon.alrae@imgtec.com>
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>,<qemu-devel@non=
gnu.org>
CC: <qemu-arm@nongnu.org>, <qemu-ppc@nongnu.org>, <aurelien@aurel32.net=
>,<peter.maydell@linaro.org>, <rth@twiddle.net>, <afaerber@suse.de>,<pb=
onzini@redhat.com>, <ehabkost@redhat.com>, <edgar.iglesias@gmail.com>,<=
proljc@gmail.com>, <agraf@suse.de>, <blauwirbel@gmail.com>,<mark.cave-a=
yland@ilande.co.uk>, <gxt@mprc.pku.edu.cn>,<petar.jovanovic@imgtec.com>=
, <miodrag.dinic@imgtec.com>,<jcmvbkbc@gmail.com>, <kbastian@mail.uni-p=
aderborn.de>
References: <1458910214-12239-1-git-send-email-aleksandar.markovic@rt-r=
k.com><1458910214-12239-3-git-send-email-aleksandar.markovic@rt-rk.com>=



=C2=A0On 25/03/16 12:50, Aleksandar Markovic wrote:
> +#define MSA=5FCLASS=5FSIGNALING=5FNAN 0x001
> +#define MSA=5FCLASS=5FQUIET=5FNAN 0x002
> +#define MSA=5FCLASS=5FNEGATIVE=5FINFINITY 0x004
> +#define MSA=5FCLASS=5FNEGATIVE=5FNORMAL 0x008
> +#define MSA=5FCLASS=5FNEGATIVE=5FSUBNORMAL 0x010
> +#define MSA=5FCLASS=5FNEGATIVE=5FZERO 0x020
> +#define MSA=5FCLASS=5FPOSITIVE=5FINFINITY 0x040
> +#define MSA=5FCLASS=5FPOSITIVE=5FNORMAL 0x080
> +#define MSA=5FCLASS=5FPOSITIVE=5FSUBNORMAL 0x100
> +#define MSA=5FCLASS=5FPOSITIVE=5FZERO 0x200
> +
> +#define MSA=5FCLASS(name, bits) \
> +uint ## bits ## =5Ft helper=5Fmsa=5F ## name (CPUMIPSState *env, \
> + uint ## bits ## =5Ft arg) \
> +{ \
> + if (float ## bits ## =5Fis=5Fsignaling=5Fnan(arg, \
> + &env->active=5Ftc.msa=5Ffp=5Fstatus)) { \
> + return MSA=5FCLASS=5FSIGNALING=5FNAN; \
> + } else if (float ## bits ## =5Fis=5Fquiet=5Fnan(arg, \
> + &env->active=5Ftc.msa=5Ffp=5Fstatus)) { \
> + return MSA=5FCLASS=5FQUIET=5FNAN; \
> + } else if (float ## bits ## =5Fis=5Fneg(arg)) { \
> + if (float ## bits ## =5Fis=5Finfinity(arg)) { \
> + return MSA=5FCLASS=5FNEGATIVE=5FINFINITY; \
> + } else if (float ## bits ## =5Fis=5Fzero(arg)) { \
> + return MSA=5FCLASS=5FNEGATIVE=5FZERO; \
> + } else if (float ## bits ## =5Fis=5Fzero=5For=5Fdenormal(arg)) { \
> + return MSA=5FCLASS=5FNEGATIVE=5FSUBNORMAL; \
> + } else { \
> + return MSA=5FCLASS=5FNEGATIVE=5FNORMAL; \
> + } \
> + } else { \
> + if (float ## bits ## =5Fis=5Finfinity(arg)) { \
> + return MSA=5FCLASS=5FPOSITIVE=5FINFINITY; \
> + } else if (float ## bits ## =5Fis=5Fzero(arg)) { \
> + return MSA=5FCLASS=5FPOSITIVE=5FZERO; \
> + } else if (float ## bits ## =5Fis=5Fzero=5For=5Fdenormal(arg)) { \
> + return MSA=5FCLASS=5FPOSITIVE=5FSUBNORMAL; \
> + } else { \
> + return MSA=5FCLASS=5FPOSITIVE=5FNORMAL; \
> + } \
> + } \
> +}

Duplicating the class operation is unnecessary. We can just have common=

function for FPU and MSA which takes additional float=5Fstatus argument=
.

Also I noticed that this patch series doesn't provide Flush Subnormals
(the FCSR.FS bit), but probably this functionality can come later...

Leon


=C2=A0
------=_=-_OpenGroupware_org_NGMime-1932-1459695918.227686-0------
content-type: text/html; charset=utf-8
content-length: 6028
content-transfer-encoding: quoted-printable

<html>Hello, Leon, thank you very much for the kind feedback. Let me cl=
arify my take on the involved issues.<br /><br />1) Class operations<br=
 /><br />I am going to correct the code as you hinted.<br /><br />The r=
eason I wanted separate handling of MSA class operation is code and mod=
ule decoupling. Handling of MSA instructions (in file msa=5Fhelper.c) a=
nd regular instructions (in file op=5Fhelper.c) have many overlaping ar=
eas - however, my understanding is that the designer of MSA module want=
ed it to be as independant on code in other files/modulas as possible. =
Handling class operation is on of the rare instances where code in msa=5F=
helper.c relies on the code in op=5Fhelper.c., and it made sense to me =
that this dependence should be removed, for the sake of consistency wit=
hin MSA module - even if the functionalitied are virtually identical. T=
hat said, I will anyway listen to your advice, since you most probably =
see more than myself regarding this, and I am going to revert to a sing=
le handling of class operations, for both MSA and regular versions.<br =
/><br />2) Flush subnormals<br /><br />My impression is that his set of=
 features should be treated and implemented separately, at some later p=
oint in time.<br /><br />Although the implementation seems not to be to=
o complex (defining FCR31=5FFS, invoking appropriately&nbsp;set=5Fflush=
=5Fto=5Fzero() and&nbsp;set=5Fflush=5Finputs=5Fto=5Fzero() on CPU init,=
 plus special exception handling, like it is already done for MSA equiv=
alents), it looks to me that it would have added a lot of risk into a p=
atch series that is already touching a lot of sensitive areas, and ther=
efore introducing a lot of risks. Once this patch series is hopefully i=
ntergrated, flush subnormals will be much easier to integrate, since it=
 will be mips-only issue. Therefore, if you agree, I will leave it for =
the future. I will definitely mention it in commit messages though (as =
a limitaion), for future reference.<br /><br />Thanks again for your co=
nsideration of this matter.<br /><br />Sincerely yours,<br />Aleksandar=
<br /><br /><br />-------- Original Message --------<br />Subject: Re: =
[PATCH 2/2] target-mips: Implement IEEE 754-2008 functionality for R6 a=
nd MSA instructions<br />Date: Friday, April 1, 2016 21:07 CEST<br />Fr=
om: Leon Alrae &lt;leon.alrae@imgtec.com&gt;<br />To: Aleksandar Markov=
ic &lt;aleksandar.markovic@rt-rk.com&gt;,&lt;qemu-devel@nongnu.org&gt;<=
br />CC: &lt;qemu-arm@nongnu.org&gt;, &lt;qemu-ppc@nongnu.org&gt;, &lt;=
aurelien@aurel32.net&gt;,&lt;peter.maydell@linaro.org&gt;, &lt;rth@twid=
dle.net&gt;, &lt;afaerber@suse.de&gt;,&lt;pbonzini@redhat.com&gt;, &lt;=
ehabkost@redhat.com&gt;, &lt;edgar.iglesias@gmail.com&gt;,&lt;proljc@gm=
ail.com&gt;, &lt;agraf@suse.de&gt;, &lt;blauwirbel@gmail.com&gt;,&lt;ma=
rk.cave-ayland@ilande.co.uk&gt;, &lt;gxt@mprc.pku.edu.cn&gt;,&lt;petar.=
jovanovic@imgtec.com&gt;, &lt;miodrag.dinic@imgtec.com&gt;,&lt;jcmvbkbc=
@gmail.com&gt;, &lt;kbastian@mail.uni-paderborn.de&gt;<br />References:=
 &lt;1458910214-12239-1-git-send-email-aleksandar.markovic@rt-rk.com&gt=
;&lt;1458910214-12239-3-git-send-email-aleksandar.markovic@rt-rk.com&gt=
;<br /><br /><br />&nbsp;<blockquote type=3D"cite" cite=3D"56FEC6F0.900=
0803@imgtec.com">On 25/03/16 12:50, Aleksandar Markovic wrote:<br />&gt=
; +#define MSA=5FCLASS=5FSIGNALING=5FNAN 0x001<br />&gt; +#define MSA=5F=
CLASS=5FQUIET=5FNAN 0x002<br />&gt; +#define MSA=5FCLASS=5FNEGATIVE=5FI=
NFINITY 0x004<br />&gt; +#define MSA=5FCLASS=5FNEGATIVE=5FNORMAL 0x008<=
br />&gt; +#define MSA=5FCLASS=5FNEGATIVE=5FSUBNORMAL 0x010<br />&gt; +=
#define MSA=5FCLASS=5FNEGATIVE=5FZERO 0x020<br />&gt; +#define MSA=5FCL=
ASS=5FPOSITIVE=5FINFINITY 0x040<br />&gt; +#define MSA=5FCLASS=5FPOSITI=
VE=5FNORMAL 0x080<br />&gt; +#define MSA=5FCLASS=5FPOSITIVE=5FSUBNORMAL=
 0x100<br />&gt; +#define MSA=5FCLASS=5FPOSITIVE=5FZERO 0x200<br />&gt;=
 +<br />&gt; +#define MSA=5FCLASS(name, bits) \<br />&gt; +uint ## bits=
 ## =5Ft helper=5Fmsa=5F ## name (CPUMIPSState *env, \<br />&gt; + uint=
 ## bits ## =5Ft arg) \<br />&gt; +{ \<br />&gt; + if (float ## bits ##=
 =5Fis=5Fsignaling=5Fnan(arg, \<br />&gt; + &amp;env-&gt;active=5Ftc.ms=
a=5Ffp=5Fstatus)) { \<br />&gt; + return MSA=5FCLASS=5FSIGNALING=5FNAN;=
 \<br />&gt; + } else if (float ## bits ## =5Fis=5Fquiet=5Fnan(arg, \<b=
r />&gt; + &amp;env-&gt;active=5Ftc.msa=5Ffp=5Fstatus)) { \<br />&gt; +=
 return MSA=5FCLASS=5FQUIET=5FNAN; \<br />&gt; + } else if (float ## bi=
ts ## =5Fis=5Fneg(arg)) { \<br />&gt; + if (float ## bits ## =5Fis=5Fin=
finity(arg)) { \<br />&gt; + return MSA=5FCLASS=5FNEGATIVE=5FINFINITY; =
\<br />&gt; + } else if (float ## bits ## =5Fis=5Fzero(arg)) { \<br />&=
gt; + return MSA=5FCLASS=5FNEGATIVE=5FZERO; \<br />&gt; + } else if (fl=
oat ## bits ## =5Fis=5Fzero=5For=5Fdenormal(arg)) { \<br />&gt; + retur=
n MSA=5FCLASS=5FNEGATIVE=5FSUBNORMAL; \<br />&gt; + } else { \<br />&gt=
; + return MSA=5FCLASS=5FNEGATIVE=5FNORMAL; \<br />&gt; + } \<br />&gt;=
 + } else { \<br />&gt; + if (float ## bits ## =5Fis=5Finfinity(arg)) {=
 \<br />&gt; + return MSA=5FCLASS=5FPOSITIVE=5FINFINITY; \<br />&gt; + =
} else if (float ## bits ## =5Fis=5Fzero(arg)) { \<br />&gt; + return M=
SA=5FCLASS=5FPOSITIVE=5FZERO; \<br />&gt; + } else if (float ## bits ##=
 =5Fis=5Fzero=5For=5Fdenormal(arg)) { \<br />&gt; + return MSA=5FCLASS=5F=
POSITIVE=5FSUBNORMAL; \<br />&gt; + } else { \<br />&gt; + return MSA=5F=
CLASS=5FPOSITIVE=5FNORMAL; \<br />&gt; + } \<br />&gt; + } \<br />&gt; =
+}<br /><br />Duplicating the class operation is unnecessary. We can ju=
st have common<br />function for FPU and MSA which takes additional flo=
at=5Fstatus argument.<br /><br />Also I noticed that this patch series =
doesn&#39;t provide Flush Subnormals<br />(the FCSR.FS bit), but probab=
ly this functionality can come later...<br /><br />Leon</blockquote><br=
 /><br /><br />&nbsp;</html>
------=_=-_OpenGroupware_org_NGMime-1932-1459695918.227686-0--------
