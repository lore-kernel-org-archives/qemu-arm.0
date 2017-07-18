Received: by 10.25.44.15 with SMTP id s15csp5609792lfs;
        Tue, 18 Jul 2017 00:19:15 -0700 (PDT)
X-Received: by 10.55.18.103 with SMTP id c100mr243163qkh.232.1500362355268;
        Tue, 18 Jul 2017 00:19:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500362355; cv=none;
        d=google.com; s=arc-20160816;
        b=xDdn/6VAjoeqVdR2V7kmEXbwJou4iCY1tR4BLoXf7oE3spE69zuFGJ6piP3H4rXMKX
         rgemw81DWvdIcCX6/nscRSWPveYswfuR9iUmip/9/YdLDg8KQ6gdpyJDFWV2VKDRLr8Q
         iPAlKGPECoqkfWX1DWAc7vP0136czu9b6oYjHpHFv3wHSL6TMgJY8MqSDvRSluLnyU+E
         1O7+Sd98rjQ+wfT3OyFVneDO1PmVVQEOZPVrKJWju1hWJBBXzVgVRf1DVaofoj6rGp88
         Rfznv7k3QoXcG0peZ1e0xanBcTPXlMAq3GLtBzcWxfPQtQyyDCudFAAc53ygIL5iN7+d
         XCwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:to:from:date:arc-authentication-results;
        bh=gUP8XSuUiQMEYmS/5moO5aszs0ra8Th5vqhrXQwSyEk=;
        b=A0O9451x5U3n+II41TpFoOQiemFpYC7LtYsJimahzUKsdc9dIY2GsPCW3CwoIf5q6D
         fooVGNxNX3qHpu6tUxgCNb4PthD1lMQlB9CZU2+PFSouSECGKxHcnRcHn222pdGyLALt
         vrCvVU604hKGiaQ7bgtqn0b8EVGRustmD9xvvukrFDUe633p6b4HM6E33z/pxI6rKE4y
         AlyU267E4Guh7J16xA1rq8K7N95nmJvQlQP5ws0RsIhTr9HZMQjTmWCL+YycH5pxBieM
         LPWZTLcFbuNyfRzTge/YUX6iFRyh07hg+/shW+kuowjAEK2IS58DeOFOtV6PG9KmT27S
         wtmA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u22si1398994qtb.313.2017.07.18.00.19.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 18 Jul 2017 00:19:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54475 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dXMmm-0006Za-Qt
	for alex.bennee@linaro.org; Tue, 18 Jul 2017 03:19:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45081)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1dXMlY-0005wZ-1A
	for qemu-devel@nongnu.org; Tue, 18 Jul 2017 03:17:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1dXMlT-00054r-SG
	for qemu-devel@nongnu.org; Tue, 18 Jul 2017 03:17:55 -0400
Received: from hall.aurel32.net ([163.172.24.10]:39936)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aurelien@aurel32.net>)
	id 1dXMlT-0004ku-L8; Tue, 18 Jul 2017 03:17:51 -0400
Received: from ohm.aurel32.net ([2001:bc8:30d7:111::1000])
	by hall.aurel32.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <aurelien@aurel32.net>)
	id 1dXMip-00077E-By; Tue, 18 Jul 2017 09:15:07 +0200
Received: from aurel32 by ohm.aurel32.net with local (Exim 4.89)
	(envelope-from <aurelien@aurel32.net>)
	id 1dXMia-00058g-Dn; Tue, 18 Jul 2017 09:14:52 +0200
Date: Tue, 18 Jul 2017 09:14:52 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Richard Henderson <rth@twiddle.net>
Message-ID: <20170718071452.4hlhpelfposv6eye@aurel32.net>
References: <20170718045540.16322-1-f4bug@amsat.org>
	<20170718045540.16322-4-f4bug@amsat.org>
	<628617ba-12f6-97ad-6818-1d7d0c63f558@twiddle.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <628617ba-12f6-97ad-6818-1d7d0c63f558@twiddle.net>
User-Agent: NeoMutt/20170113 (1.7.2)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 163.172.24.10
Subject: Re: [Qemu-devel] [PATCH v5 03/10] target/arm: optimize aarch64
 rev16() using extract op
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
	Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>,
	qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
	Philippe =?iso-8859-15?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: q9xrrB5A0Lch

On 2017-07-17 20:25, Richard Henderson wrote:
> On 07/17/2017 06:55 PM, Philippe Mathieu-Daud=E9 wrote:
> > Aurelien Jarno denoted this function could be implemented more effectiv=
ely using
> > the aarch32 rev16() pattern.
> >    [http://lists.nongnu.org/archive/html/qemu-devel/2017-05/msg03180.ht=
ml]
> >=20
> > Done with the Coccinelle semantic patch from commit 58daf05d07dd
> >      (see scripts/coccinelle/tcg_gen_extract.cocci)
> >=20
> > Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
>=20
> I'm dropping this patch and replacing it with the much smaller code
> mentioned in the message quoted above.

In that case, could you also get the corresponding aarch32 patch:
http://lists.nongnu.org/archive/html/qemu-devel/2017-05/msg03887.html

It has already been reviewed.

--=20
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net
