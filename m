Received: by 10.25.208.137 with SMTP id h131csp647944lfg;
        Thu, 12 May 2016 04:43:57 -0700 (PDT)
X-Received: by 10.140.89.202 with SMTP id v68mr8735155qgd.95.1463053437793;
        Thu, 12 May 2016 04:43:57 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d21si8283499qkb.86.2016.05.12.04.43.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 May 2016 04:43:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56967 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b0p25-0002q1-CN
	for alex.bennee@linaro.org; Thu, 12 May 2016 07:43:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45367)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1b0p21-0002lZ-1z
	for qemu-arm@nongnu.org; Thu, 12 May 2016 07:43:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1b0p1w-0004zy-PP
	for qemu-arm@nongnu.org; Thu, 12 May 2016 07:43:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58895)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1b0p1w-0004zr-Jk; Thu, 12 May 2016 07:43:48 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8B1B23DD47;
	Thu, 12 May 2016 11:43:44 +0000 (UTC)
Received: from [10.36.112.65] (ovpn-112-65.ams2.redhat.com [10.36.112.65])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4CBhAhY011725
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 12 May 2016 07:43:12 -0400
To: =?UTF-8?Q?Llu=c3=ads_Vilanova?= <vilanova@ac.upc.edu>,
	qemu-devel@nongnu.org
References: <146299653361.5203.4475655460859700214.stgit@localhost>
	<146299653947.5203.13161479377215549869.stgit@localhost>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <57346C4D.20006@redhat.com>
Date: Thu, 12 May 2016 13:43:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.1
MIME-Version: 1.0
In-Reply-To: <146299653947.5203.13161479377215549869.stgit@localhost>
Content-Type: text/plain; charset=utf-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 12 May 2016 11:43:46 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 1/2] exec: [tcg] Track which vCPU is
 performing translation and execution
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Jia Liu <proljc@gmail.com>, Anthony Green <green@moxielogic.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Alexander Graf <agraf@suse.de>, Blue Swirl <blauwirbel@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>, Michael Walle <michael@walle.cc>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	"open list:PowerPC" <qemu-ppc@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Leon Alrae <leon.alrae@imgtec.com>,
	Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0kb4s9sm2pmB



On 11/05/2016 21:55, Llu=C3=ADs Vilanova wrote:
> =20
> diff --git a/translate-all.c b/translate-all.c
> index 8329ea6..1c16b14 100644
> --- a/translate-all.c
> +++ b/translate-all.c
> @@ -1092,6 +1092,8 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
>      ti =3D profile_getclock();
>  #endif
> =20
> +    tcg_ctx.cpu =3D ENV_GET_CPU(env);
> +
>      tcg_func_start(&tcg_ctx);
> =20
>      gen_intermediate_code(env, tb);
>=20

I prefer to also set this to NULL outside translation.

Paolo
