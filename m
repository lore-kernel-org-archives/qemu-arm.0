Received: by 10.25.150.194 with SMTP id y185csp1598171lfd;
        Tue, 8 Nov 2016 05:47:54 -0800 (PST)
X-Received: by 10.202.50.133 with SMTP id y127mr1995392oiy.101.1478612874723;
        Tue, 08 Nov 2016 05:47:54 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o70si17964015ota.190.2016.11.08.05.47.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 Nov 2016 05:47:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33146 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c46kj-0004Y3-EQ
	for alex.bennee@linaro.org; Tue, 08 Nov 2016 08:47:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43098)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1c46jb-00045g-7r
	for qemu-devel@nongnu.org; Tue, 08 Nov 2016 08:46:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1c46jW-0000FG-7u
	for qemu-devel@nongnu.org; Tue, 08 Nov 2016 08:46:43 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:50434)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1c46jV-0000F2-Ur; Tue, 08 Nov 2016 08:46:38 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue102) with ESMTPSA (Nemesis) id 0LxfAZ-1csnQZ2KmR-017G2R;
	Tue, 08 Nov 2016 14:46:32 +0100
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <1478607473-25851-1-git-send-email-thuth@redhat.com>
	<1478607473-25851-4-git-send-email-thuth@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <4a2c93db-875c-e64f-2ecb-253e6a15c834@vivier.eu>
Date: Tue, 8 Nov 2016 14:46:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1478607473-25851-4-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:mvioyfPB+KTBwsqqMjicO9FWuRTocVzCnSI5h1u3KkIGQ0z8Wd9
	ppUVha8oLhFghsaH1ZxrcYDlw/27eX4HiUmOp5IgYskEWq4YgqYjdhAGxNRj/qcUrnx+9g+
	NLk4+cnljYF9jHMlNx5i29Bhy5G1YFY9P5B1zrRDlAjqvc8PIoY2QjQg9sm+YUaP8dLHeVR
	wlvbzKDkQ8Axsk9X3FGjQ==
X-UI-Out-Filterresults: notjunk:1;V01:K0:vZg30VqKza8=:WxEf/HKpfq043UPrdZafU3
	lvWmhFPgkKu8B4PgPOuHGg7wdrFeSQ127O3WWmDr82s6fMhMw8HB7hGIIy8DLCm3t6EwGqYm7
	cWoqYU+Yyv7xTHU/TRirX+9y47TcfWYxrC2NZtoE9qQbzcZuCQt8Ogg1mPPuriG4XFF+4Tsoy
	NuS+qCGDcpn+T7SNwbCcKUUN2oQZJNe8PDymAq2Au6okivSqV9v/t0z0V42XNQh6tg9ExYxeG
	rII8RW1gpDW2fAuFSdInNHL8pizVlvcKvNItOfpaoKjTME6HcW8QxTBb+erC6YTuav2MKWNTL
	8qKKUWCs6vvRYtNkVMNnJAT2uAFx+Vx7io3WoKYG82N+wjW7Lb91R6c4LFGXeZuiSHgsYHKmE
	KqijQhABM24cmDwbjywLtMG7fXVhqEWQM6us3HtbcDyxni+qSafmnClVLE8Gpfwuh7Xjccsyu
	S2gVs9vgi5lEuIzyuuT7RZXFgsXULm/m32vOcbZD+0hgz+ZbcN71M99U9VL2nrWXzCctei3HV
	hujZ0XSkJaUlHWWKSud0kgQaKigHu0q8sEdfXweCzJx44JuFVWR3QHTR9xPl9kkiQ66Lh25Tp
	dVofbEo58Plm5ed1wX5dAUl1ZXwVNrOnFAu1uBg73rF9NTf7R3W7nCaSfGCjH3ks9Lfqca3gN
	8JIXrqVXDmnJSPVvYAx6PW15KGNRce7BUX9+tB2pfPZeUWHSn59VEeWkFYEiZz9aDOfPUna8v
	pVtERMdcf7+D4eCP
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.24
Subject: Re: [Qemu-devel] [PATCH v2 3/5] m68k: Update the 68k sections in
 the MAINTAINERS file
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
Cc: Fam Zheng <famz@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XomGYi+N7FpE

Le 08/11/2016 à 13:17, Thomas Huth a écrit :
> disas/m68k.c obviously belong to the m68k CPU section in
> the MAINTAINERS file, but remove the hw/m68k/ directory
> here since it only contains machine (not CPU) related
> files, as requested by Laurent. Add the machine related
> files to the right machine sections instead.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

> ---
>  MAINTAINERS | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 451e7cc..5d8b584 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -148,7 +148,7 @@ M68K
>  M: Laurent Vivier <laurent@vivier.eu>
>  S: Maintained
>  F: target-m68k/
> -F: hw/m68k/
> +F: disas/m68k.c
>  
>  MicroBlaze
>  M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
> @@ -550,6 +550,7 @@ M68K Machines
>  an5206
>  S: Orphan
>  F: hw/m68k/an5206.c
> +F: hw/m68k/mcf5206.c
>  
>  dummy_m68k
>  S: Orphan
> @@ -558,6 +559,9 @@ F: hw/m68k/dummy_m68k.c
>  mcf5208
>  S: Orphan
>  F: hw/m68k/mcf5208.c
> +F: hw/m68k/mcf_intc.c
> +F: hw/char/mcf_uart.c
> +F: hw/net/mcf_fec.c
>  
>  MicroBlaze Machines
>  -------------------
> 

