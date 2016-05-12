Received: by 10.25.208.137 with SMTP id h131csp807391lfg;
        Thu, 12 May 2016 11:04:56 -0700 (PDT)
X-Received: by 10.55.102.7 with SMTP id a7mr11678117qkc.69.1463076295907;
        Thu, 12 May 2016 11:04:55 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d21si9299649qkb.86.2016.05.12.11.04.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 May 2016 11:04:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59206 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b0uyl-00071y-E3
	for alex.bennee@linaro.org; Thu, 12 May 2016 14:04:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51043)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vilanova@ac.upc.edu>) id 1b0utH-0000Y6-6D
	for qemu-arm@nongnu.org; Thu, 12 May 2016 13:59:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vilanova@ac.upc.edu>) id 1b0utB-0005qz-0B
	for qemu-arm@nongnu.org; Thu, 12 May 2016 13:59:13 -0400
Received: from roura.ac.upc.edu ([147.83.33.10]:38194 helo=roura.ac.upc.es)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vilanova@ac.upc.edu>)
	id 1b0ut9-0005q8-Op; Thu, 12 May 2016 13:59:08 -0400
Received: from gw-3.ac.upc.es (gw-3.ac.upc.es [147.83.30.9])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id u4CGRRc4032685;
	Thu, 12 May 2016 18:27:27 +0200
Received: from localhost (unknown [84.88.51.85])
	by gw-3.ac.upc.es (Postfix) with ESMTPSA id 5C1E879F;
	Thu, 12 May 2016 18:27:27 +0200 (CEST)
From: =?utf-8?Q?Llu=C3=ADs_Vilanova?= <vilanova@ac.upc.edu>
To: Paolo Bonzini <pbonzini@redhat.com>
References: <146299653361.5203.4475655460859700214.stgit@localhost>
	<146299653947.5203.13161479377215549869.stgit@localhost>
	<57346C4D.20006@redhat.com>
Mail-Followup-To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org, 
	Peter Maydell <peter.maydell@linaro.org>, Eduardo Habkost
	<ehabkost@redhat.com>, Peter Crosthwaite
	<crosthwaite.peter@gmail.com>, Jia Liu <proljc@gmail.com>, Anthony
	Green <green@moxielogic.com>, Mark Cave-Ayland
	<mark.cave-ayland@ilande.co.uk>, Alexander Graf <agraf@suse.de>, Blue
	Swirl <blauwirbel@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Walle <michael@walle.cc>, "open list\:ARM"
	<qemu-arm@nongnu.org>, "open list\:PowerPC" <qemu-ppc@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>, Bastian Koppelmann
	<kbastian@mail.uni-paderborn.de>, "Edgar E. Iglesias"
	<edgar.iglesias@gmail.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>, Leon
	Alrae <leon.alrae@imgtec.com>, Aurelien Jarno <aurelien@aurel32.net>,
	Richard Henderson <rth@twiddle.net>
Date: Thu, 12 May 2016 18:27:27 +0200
In-Reply-To: <57346C4D.20006@redhat.com> (Paolo Bonzini's message of "Thu, 12
	May 2016 13:43:09 +0200")
Message-ID: <8760ujnswg.fsf@fimbulvetr.bsc.es>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 147.83.33.10
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 1/2] exec: [tcg] Track which
 vCPU is performing translation and execution
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jia Liu <proljc@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Anthony Green <green@moxielogic.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>,
	Blue Swirl <blauwirbel@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Walle <michael@walle.cc>, "open list:ARM" <qemu-arm@nongnu.org>,
	"open list:PowerPC" <qemu-ppc@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Leon Alrae <leon.alrae@imgtec.com>, Richard Henderson <rth@twiddle.net>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Aq7SlW0otSQS

Paolo Bonzini writes:

> On 11/05/2016 21:55, Llu=C3=ADs Vilanova wrote:
>>=20
>> diff --git a/translate-all.c b/translate-all.c
>> index 8329ea6..1c16b14 100644
>> --- a/translate-all.c
>> +++ b/translate-all.c
>> @@ -1092,6 +1092,8 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
>> ti =3D profile_getclock();
>> #endif
>>=20
>> +    tcg_ctx.cpu =3D ENV_GET_CPU(env);
>> +
>> tcg_func_start(&tcg_ctx);
>>=20
>> gen_intermediate_code(env, tb);
>>=20

> I prefer to also set this to NULL outside translation.

Do you mean after the call to gen_intermediate_code()?


Cheers,
  Lluis

