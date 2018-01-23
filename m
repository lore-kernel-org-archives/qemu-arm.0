Received: by 10.28.71.27 with SMTP id u27csp4173394wma;
        Tue, 23 Jan 2018 07:23:59 -0800 (PST)
X-Google-Smtp-Source: AH8x227I/1nQxektkkfdE6JUfiVM9O+4wwViNqnXxFwVFD2p5ywvayVUtKfUFOA8Mlg8htgfEciF
X-Received: by 10.37.81.3 with SMTP id f3mr2701148ybb.99.1516721039299;
        Tue, 23 Jan 2018 07:23:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516721039; cv=none;
        d=google.com; s=arc-20160816;
        b=JsD+bvyWXsPs2o2RK7SNZgMbM9FWpftiGSCLuvk1bZjXmYkayRS7kHLZPm6TB1ntUU
         1q0dqu9Qps4Y/QThMJ8nzxQ3Y9Go4iaiWBCepgCu+xk2eMEfY6U6QjMlv2yqDAul8w7U
         uK6UfPlANkHKL8ebN/zg/zU+1iZXHzO0IjUWJZT8WAM6ScMw+qemmuV35t+4NlAOdCmW
         t/YS//oFaTyvvid6ydtcNp6TjmvFFANNmA36MfZz+YXqtCaisKR4tQMWlV56ITsW7aNb
         0zDhkWb4Pveocgtka3PS8sk5mDbIqu5lvCLx/N5R99YRHXjfildokf50JCG6ZtetNH67
         qYIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=6uM2mxswo6KjXXmTxtdGkilY4hXHkR7RtGMY5Om8jew=;
        b=IOItYmPiPzqyWtswBv+5P7ruUPTWJsgDDsKj/1RM0EVhVajbThnh3jOG2U8yCMjxTa
         wFhwT70T7StZWT5pwK3Lq+JHnZrRgBZhu+XgmIDyofebfdDGvpjq2UDSKKWzHTn2HhBL
         /EhBqZRvP9A2SklYEUVyfz2CmawFDeeL2KpeCQ5F0aiLhXuVbe+0MTX5wyPzKUX0Wwko
         0ZXL2wcq7zDXJu+88ChxyO8Ak/oiOvkOcgvJ0zx6xLMFXCudMTdMoobkeL7MT4fdUsS5
         cZGXEy944p5hMXqUG9ecO3t2NYfO5naS6APYWRRki61H35TsPN0aNu7fbN7C2fF6DIj2
         BB/w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g1si2517357ybe.459.2018.01.23.07.23.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Jan 2018 07:23:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35308 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ee0QY-00058N-OZ
	for alex.bennee@linaro.org; Tue, 23 Jan 2018 10:23:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57191)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agx@sigxcpu.org>) id 1ee0QO-00056x-OA
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 10:23:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <agx@sigxcpu.org>) id 1ee0QK-0007QT-EO
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 10:23:48 -0500
Received: from honk.sigxcpu.org ([24.134.29.49]:44927)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <agx@sigxcpu.org>)
	id 1ee0QK-0007Pc-6j; Tue, 23 Jan 2018 10:23:44 -0500
Received: from localhost (localhost [127.0.0.1])
	by honk.sigxcpu.org (Postfix) with ESMTP id 2EBEFFB03;
	Tue, 23 Jan 2018 16:23:42 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
	by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mcBifvOSE4Hc; Tue, 23 Jan 2018 16:23:40 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
	id C138C45883; Tue, 23 Jan 2018 16:23:39 +0100 (CET)
Date: Tue, 23 Jan 2018 16:23:39 +0100
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Message-ID: <20180123152339.GA23245@bogon.m.sigxcpu.org>
References: <20180123145222.2487-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20180123145222.2487-1-f4bug@amsat.org>
User-Agent: Mutt/1.9.2 (2017-12-15)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 24.134.29.49
Subject: Re: [Qemu-arm] [PATCH] linux-user/syscall: let recvfrom(struct
 sockaddr *) use abi_ulong
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
Cc: Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aeaAn+TDxruw

Hi,
Thanks for having a look!

On Tue, Jan 23, 2018 at 11:52:22AM -0300, Philippe Mathieu-Daud=E9 wrote:
> Currently recvfrom() is restricted to handle 32-bit pointers,
> remove this limit for 64-bit hosts.
>=20
> This fixes:
>=20
>   31572 socket(AF_NETLINK, SOCK_RAW, NETLINK_AUDIT) =3D 3
>   ...
>   31572 sendto(3, {{len=3D124, type=3D0x454 /* NLMSG_??? */, flags=3DNL=
M_F_REQUEST|NLM_F_ACK, seq=3D1, pid=3D0}, "op=3Dtest:message acct=3D\"?\"=
 exe=3D\"/tmp/nl-bad-addr\" hostname=3Dlocalhost addr=3D? terminal=3D/dev=
/pts/2 res=3Dsuccess\0\0\0"}, 124, 0, 0xfffffa3897d0, 0) =3D 124
>   31572 ppoll([{fd=3D3, events=3DPOLLIN}], 1, {tv_sec=3D0, tv_nsec=3D50=
0000000}, NULL, 0) =3D 1 ([{fd=3D3, revents=3DPOLLIN}], left {tv_sec=3D0,=
 tv_nsec=3D499993180})
>   31572 recvfrom(3, 0x112a50eb4, 8988, MSG_PEEK|MSG_DONTWAIT, 0xfffffa3=
897e0, 0x42) =3D -1 EFAULT (Bad address)
>=20
> Reported-by: Guido G=FCnther <agx@sigxcpu.org>
> Message-id: 20180123120541.GA14216@bogon.m.sigxcpu.org
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> ---
>  linux-user/syscall.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 11c9116c4a..28805b1785 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -4032,7 +4032,7 @@ static abi_long do_recvfrom(int fd, abi_ulong msg=
, size_t len, int flags,
>      if (!host_msg)
>          return -TARGET_EFAULT;
>      if (target_addr) {
> -        if (get_user_u32(addrlen, target_addrlen)) {
> +        if (get_user_ual(addrlen, target_addrlen)) {
>              ret =3D -TARGET_EFAULT;
>              goto fail;
>          }
> @@ -4053,7 +4053,7 @@ static abi_long do_recvfrom(int fd, abi_ulong msg=
, size_t len, int flags,
>          }
>          if (target_addr) {
>              host_to_target_sockaddr(target_addr, addr, addrlen);
> -            if (put_user_u32(addrlen, target_addrlen)) {
> +            if (put_user_ual(addrlen, target_addrlen)) {
>                  ret =3D -TARGET_EFAULT;
>                  goto fail;
>              }

Ahh...I saw these and was wondering how this would work on
64bit. Unfortunately the patch doesn't change things:

    4824  recvfrom(3, 0x1401f8eb4, 8988, MSG_PEEK|MSG_DONTWAIT, 0xffffe10=
a8620, 0x42) =3D -1 EFAULT (Bad address)

If you want me to report qemu -strace or s.th. please let me know.
Cheers,
 -- Guido
