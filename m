Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1911982wru;
        Thu, 16 Aug 2018 07:21:23 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPyyyBF6Ds80t5q61WfeTcJ78A/p0KdfkpTYRdcabXJuAfDiKtRZdjzNlZ2tV6rwU0C67Ehh
X-Received: by 2002:ac8:302e:: with SMTP id f43-v6mr29846532qte.217.1534429283623;
        Thu, 16 Aug 2018 07:21:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534429283; cv=none;
        d=google.com; s=arc-20160816;
        b=ukFOJI+tmKC/q5JlYYCMmM17ecYpDMDFqtNPOFuPZBKkFjOZkAOY795xN3BKwQnWyM
         gtereKYst1rt4wkCTGICaaMrFOlYE2KajwEjj6LgZSvmI5Gi0s2/3s6LJRnwt7mF8VDh
         jlDVWhimyMeYRp1A6wccsbfr6bv39fx+GwkLJ0S/LQoV/NH5ks1roDZKO1CZ+xxrP26j
         UanZQAL/x/BzxQEWxh4MoqvmQTJBsqAsFSb7YngzAYRYfG0aQk9TvcHPrPCyKP+oHP+c
         rXG2IzKT56TWZvV4AVs7+kcur/B83m0oV7U7aYki29qFra/nXetrptqDbBPUi87RBWtH
         CfAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature
         :arc-authentication-results;
        bh=iQguSEp6V88IMwpjzGWMuPuPVHhglPd5R1h35myUV9Q=;
        b=awz0C0/O+gEh3/rh2+ToZzBqNfTpRNsF61hFnFZkkJb3AP7aQwcoOVhGseKzlUIgVO
         yeDZOGKIEuUBHJuB6SRTEgWfXPlK5EFZYdJdgqUMcBoKAfO9ttFO5hGEUyoeb4N1i19V
         69bKI5Arjndn771IZeEMQ05HzLa0/HQ10kCJANBaSrvxwCNfzculLyx6zncSgDOvU8KN
         MDo7zQ6NsNcLmTei50QRAtvrx+4bq+W/Di5ZY28sHNQ1obtm9ln3ft0Y049xAt2CgKPl
         +oMcWzNxUmnhC3TsqSfvRlJVJXbbGi/dogqyr6AIYmXD+5vBkAtbgDzopxW04CHtrufZ
         OzDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=sNP5qzCw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k43-v6si2622809qtf.286.2018.08.16.07.21.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Aug 2018 07:21:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=sNP5qzCw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55983 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fqJ9P-0003lP-5O
	for alex.bennee@linaro.org; Thu, 16 Aug 2018 10:21:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40447)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1fqIwr-0006u6-J7
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 10:08:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1fqIwn-0007Mn-P0
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 10:08:23 -0400
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:36922)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1fqIwg-00077d-RU; Thu, 16 Aug 2018 10:08:15 -0400
Received: by mail-wm0-x243.google.com with SMTP id n11-v6so4461246wmc.2;
	Thu, 16 Aug 2018 07:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=iQguSEp6V88IMwpjzGWMuPuPVHhglPd5R1h35myUV9Q=;
	b=sNP5qzCwpgaczQ5anoA7E196YthhNbjpyOnMi3ry7cHb1YZUKIjjLaKZP2NxpnNgng
	f6byGtFuhVLWkuaHQSizzBHkofKozdMI32HfckTiE9r7nB+cRyOwTDnrZQ1KuCXU2KrV
	auJrL24Gux0IZmX670HP/JxT7pY0AXiUKzwDGQWTlF8+8Kesuhou8OrK57mHAmJ6NFI4
	xEa8Q3MzOs3dbEgALxqVj2xylXN0aEHu9ID8/MwXCyC8r1pisrWvDjmmg64IKpaVDp3A
	irIaRpdo70uimiSOdBLq8cvmREl6h5mPg9pCBxcXJzBSNKOVxkvwrhlSY3xcJKMaFkEm
	7UhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=iQguSEp6V88IMwpjzGWMuPuPVHhglPd5R1h35myUV9Q=;
	b=htoGObBYzDRquVUuon4RE9G5ACs+3KokWwZnnHirypITMXDSo2CPNP+QgXzrXjoUYS
	OxulThpuraRdbBZlSunm5iFshSe9C1UtUb1pVlHgOqpOIt/yTJeIv+fcIlG7CL2lqkI+
	Go2pNtQ00JcvboeEbIRFVCmDAmYrc0g2gxilhZJuG3+MTK8wLhve1+QDJCW6PELC2SUk
	8JjbXbFVdr3+I+doTVyZV+Gw1K2zjvB2YP/RlkmSavGmQRoRuuav7CQNcOYv1yi4JDYh
	nL+mqlrNurl0hfESbSD6H1dFLr7wsnmJBiKmLhIyt44vfA+/dpHcDAIuKJdpkcUdaIxs
	2qZQ==
X-Gm-Message-State: AOUpUlEdjB0jqQ5Ci+LSnUaOkp0z3dSPGuMVhy6GjYJM1XUlG2sOokwV
	8Xeqpf8BVXfnfqKv4k+aJMT+pwY0XinJVBTnpec=
X-Received: by 2002:a1c:af53:: with SMTP id
	y80-v6mr15472975wme.55.1534428493840; 
	Thu, 16 Aug 2018 07:08:13 -0700 (PDT)
MIME-Version: 1.0
References: <20180814162739.11814-1-stefanha@redhat.com>
	<CAFEAcA8p=e-C_U+wqjLjLyc9-nCC7R094_xD-xY06tzJCOz8dg@mail.gmail.com>
In-Reply-To: <CAFEAcA8p=e-C_U+wqjLjLyc9-nCC7R094_xD-xY06tzJCOz8dg@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 16 Aug 2018 15:08:02 +0100
Message-ID: <CAJSP0QXAMHYZfrUdnjNNWJtAxu6U0Y6-Xw0GHPjTFjeEFrvW9w@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 0/6] arm: add Cortex M0 CPU
 model and hex file loader
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
Cc: Jim Mussared <jim@groklearning.com>,
	=?UTF-8?Q?Steffen_G=C3=B6rtz?= <mail@steffen-goertz.de>,
	Liviu Ionescu <ilg@livius.net>, Alistair Francis <alistair@alistair23.me>,
	qemu-devel <qemu-devel@nongnu.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	=?UTF-8?Q?Steffen_G=C3=B6rtz?= <qemu.ml@steffen-goertz.de>,
	=?UTF-8?B?6IuP6Iiq?= <suhang16@mails.ucas.ac.cn>,
	Joel Stanley <joel@jms.id.au>, Stefan Hajnoczi <stefanha@redhat.com>,
	Julia Suvorova <jusual@mail.ru>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZRBR9iQV+2vK

On Thu, Aug 16, 2018 at 1:39 PM Peter Maydell <peter.maydell@linaro.org> wrote:
> On 14 August 2018 at 17:27, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > This patch series:
> >  * Makes bitbanding optional on ARMv7MState.
> >  * Adds a "cortex-m0" cpu type which can be used with ARMMProfileState.  This
> >    works thanks to Julia's Cortex M0 emulation patches, which are now all
> >    merged.
> >  * Adds Su Hang's Intel HEX file format loader so that micro:bit and other
> >    microcontroller firmware images can be run using -kernel.  The micro:bit
> >    development tools typically only emit .hex files and not ELFs.
>
> Applied to target-arm.next, thanks.
>
> I notice that the change to generic-loader doesn't include an
> update to docs/generic-loader.txt -- could somebody do a followup
> patch for that? Currently the docs say
>
> # The loader device also allows files to be loaded into memory. It can load raw
> # files and ELF executable files.  Raw files are loaded verbatim.  ELF
> executable
> # files are loaded by an ELF loader.
>
> but looking at the code we also support uImage files and HEX files.
> We should mention all of these, and be clear about which ones
> require the <addr> to be specified, and what the PC will be set
> to in the case where <cpu-num> is specified.

Thanks, I will take a look and send a patch.

Stefan
