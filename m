Received: by 10.80.163.71 with SMTP id 65csp640978edn;
        Mon, 19 Sep 2016 05:17:01 -0700 (PDT)
X-Received: by 10.237.36.93 with SMTP id s29mr29200131qtc.114.1474287421476;
        Mon, 19 Sep 2016 05:17:01 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b39si17487542qtc.150.2016.09.19.05.17.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 19 Sep 2016 05:17:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54786 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1blxVM-0002fr-Rj
	for alex.bennee@linaro.org; Mon, 19 Sep 2016 08:17:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53204)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vilanova@ac.upc.edu>) id 1blxTa-0001le-Sj
	for qemu-devel@nongnu.org; Mon, 19 Sep 2016 08:15:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vilanova@ac.upc.edu>) id 1blxTZ-0005nk-Vh
	for qemu-devel@nongnu.org; Mon, 19 Sep 2016 08:15:10 -0400
Received: from roura.ac.upc.edu ([147.83.33.10]:47557 helo=roura.ac.upc.es)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vilanova@ac.upc.edu>)
	id 1blxTU-0005e6-AU; Mon, 19 Sep 2016 08:15:04 -0400
Received: from gw-3.ac.upc.es (gw-3.ac.upc.es [147.83.30.9])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id u8JCEEHl015213;
	Mon, 19 Sep 2016 14:14:14 +0200
Received: from localhost (unknown [84.88.51.85])
	by gw-3.ac.upc.es (Postfix) with ESMTPSA id D1422B3;
	Mon, 19 Sep 2016 14:14:14 +0200 (CEST)
From: =?utf-8?Q?Llu=C3=ADs_Vilanova?= <vilanova@ac.upc.edu>
To: Richard Henderson <rth@twiddle.net>
References: <147342618684.13303.1583142856242164602.stgit@fimbulvetr.bsc.es>
	<147342619232.13303.3267934500669032492.stgit@fimbulvetr.bsc.es>
	<7d457b8c-6ea2-8bf9-6078-0dd0fcb72208@twiddle.net>
Mail-Followup-To: Richard Henderson <rth@twiddle.net>, qemu-devel@nongnu.org, 
	Peter Maydell <peter.maydell@linaro.org>, Eduardo Habkost
	<ehabkost@redhat.com>, Peter Crosthwaite
	<crosthwaite.peter@gmail.com>, Bastian Koppelmann
	<kbastian@mail.uni-paderborn.de>, Anthony Green
	<green@moxielogic.com>, Mark Cave-Ayland
	<mark.cave-ayland@ilande.co.uk>, Alexander Graf <agraf@suse.de>, Max
	Filippov <jcmvbkbc@gmail.com>, Michael Walle <michael@walle.cc>, "open
	list\:ARM" <qemu-arm@nongnu.org>, "open list\:PowerPC"
	<qemu-ppc@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>, David
	Gibson <david@gibson.dropbear.id.au>, Paolo Bonzini
	<pbonzini@redhat.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Leon Alrae <leon.alrae@imgtec.com>, 
	Artyom Tarasenko <atar4qemu@gmail.com>, Jia Liu <proljc@gmail.com>
Date: Mon, 19 Sep 2016 14:14:14 +0200
In-Reply-To: <7d457b8c-6ea2-8bf9-6078-0dd0fcb72208@twiddle.net> (Richard
	Henderson's message of "Fri, 16 Sep 2016 16:01:04 -0700")
Message-ID: <87oa3kgk89.fsf@fimbulvetr.bsc.es>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 147.83.33.10
Subject: Re: [Qemu-devel] [PATCH v2 1/6] Pass generic CPUState to
 gen_intermediate_code()
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
	Eduardo Habkost <ehabkost@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Anthony Green <green@moxielogic.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>,
	Max Filippov <jcmvbkbc@gmail.com>, Michael Walle <michael@walle.cc>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	"open list:PowerPC" <qemu-ppc@nongnu.org>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Jia Liu <proljc@gmail.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Leon Alrae <leon.alrae@imgtec.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JZbQ+MYOj6t+

Richard Henderson writes:

> On 09/09/2016 06:03 AM, Llu=C3=ADs Vilanova wrote:
>> -void gen_intermediate_code(CPUAlphaState *env, struct TranslationBlock =
*tb)
>> +void gen_intermediate_code(CPUState *cpu, struct TranslationBlock *tb)
>> {
>> -    AlphaCPU *cpu =3D alpha_env_get_cpu(env);
>> -    CPUState *cs =3D CPU(cpu);
>> +    CPUAlphaState *env =3D cpu->env_ptr;

> Why the variable renames?  I.e. why CPUState *cpu instead of CPUState *cs?

It's the naming convention used on almost all other generic code in QEMU.

Cheers,
  Lluis

