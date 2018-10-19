Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4081163wrt;
        Fri, 19 Oct 2018 09:48:14 -0700 (PDT)
X-Google-Smtp-Source: AJdET5fxkPPFzXboOV9u0w5KU19PWNNzwjnwX1GBwmi3pujsaQag+0y+G3yfsbBDp//WIR6NcKRr
X-Received: by 2002:ac8:13c6:: with SMTP id i6-v6mr3720285qtj.357.1539967694518;
        Fri, 19 Oct 2018 09:48:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539967694; cv=none;
        d=google.com; s=arc-20160816;
        b=hz7WREhZTIJpWISeuDY1eHPn55HAUZquoTvE0+Q3uDnQ57YXyPDNne58Bvk1WUjZr/
         Tm+RF4onK0RsMuZow7IUhLgbWGDfXrIKvlwEAOCSjpoGyG16Z8JXxa5xdx9w+qLTITSe
         wiClhQ3noXay8YAJK6ltnywCqSFlPYzIYUifbX3f1dGAepLAiqi+7iPSBIFAxihHwInq
         dLO80jsV8YNoWx6yz0EL3Pm/K7cG0U9wtaSAqyjuCn2z7KiVx6+68VOCNDsX/FBG4lFu
         U+1M7ms2yYpuAPHOaK0EhoPDVF6dL5LfmdcCAolh1GOHmBlhF+ELXv0vzYnISrcFpFsE
         JflA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to;
        bh=VTWnV+Jmj50qmlaIIh+4mdg9HPjYvGnugV4B70Te4CQ=;
        b=MZ4V6FwErimEPqp4tb3PcBpCl7l50H129HjQTxSlusYWLC7J1gf0nNLzbLIobAyUXn
         xTKtPH594RmBlCKL0dpcHUWF8a6mbS3w+WTJnM5zvnVoHT3He+hddgifszGjrxjzBm1k
         0AznAXVgxAYajtv8bs7sDW2MkmpMqN9O0yGbXnw7tv31m0vOlY9PQs6KAVXjGg7EqvBy
         MEkwWmJR8WUyVSMxGMsYMOb7vfdHg4KEqrMc59Spu+KWLLtG9wYNfHzTvFWR4I1Da4u3
         UQuFTUcypwAG6Holg53rgoqVRwS/vDLlBnNHqbU51N0MEQVEmg2KtANuf3rnbps7UoiU
         hn+g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j79-v6si1619590qkh.142.2018.10.19.09.48.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Oct 2018 09:48:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51608 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDXwc-0001Mz-1x
	for alex.bennee@linaro.org; Fri, 19 Oct 2018 12:48:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42795)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1gDXtU-0007p3-0q
	for qemu-devel@nongnu.org; Fri, 19 Oct 2018 12:45:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1gDXtS-0007Og-QX
	for qemu-devel@nongnu.org; Fri, 19 Oct 2018 12:44:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50190)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1gDXtQ-0007Mw-RZ; Fri, 19 Oct 2018 12:44:57 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 12A9488E58;
	Fri, 19 Oct 2018 16:44:56 +0000 (UTC)
Received: from [10.36.112.30] (ovpn-112-30.ams2.redhat.com [10.36.112.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 12C345D77E;
	Fri, 19 Oct 2018 16:44:52 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>
References: <1539954845-26716-1-git-send-email-thuth@redhat.com>
	<1539954845-26716-5-git-send-email-thuth@redhat.com>
	<CAFEAcA-ahq3Y4sgs=Vijq_fsDPgX4JuG0gGdMwE5oOLOrsvxjQ@mail.gmail.com>
	<a6b421a6-439e-ac87-0f96-b28ca349bc70@redhat.com>
	<CAAdtpL4M9zD3LPOMgQNtN50pKzZAsoKn0c_uBe5vajPFwUMJvQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=pbonzini@redhat.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <b43a36a4-bb35-77e4-42e3-d15aebd618f9@redhat.com>
Date: Fri, 19 Oct 2018 18:44:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CAAdtpL4M9zD3LPOMgQNtN50pKzZAsoKn0c_uBe5vajPFwUMJvQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 19 Oct 2018 16:44:56 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 4/5] configs: Add a CONFIG_UNIMP switch for
 the "unimplemented-device"
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org list:PowerPC" <qemu-ppc@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: t0TWOvjlgkTv

On 19/10/2018 18:25, Philippe Mathieu-Daud=C3=A9 wrote:
>=20
> First because I'm using it heavily on MIPS and PPC boards, when no
> datashits are available.
> I'll submit that during the next merge window, although the MIPS tree
> seems now reluctant to that kind of hobbyist work.
>=20
> Second, because it is very clean when you implement a SoC to first
> start with an empty UNIMP region and a cpu core,
> then declare the mmio regions for each device (still UNIMP), then you
> can slowly add devices one at a time.
> This let you (me, so far) push at most a dozen of tiny patches in a
> working series, instead of a small series of a dozen of huge patches,
> or a series of 100 tiny patches.

I don't see however why it's a problem to add/remove CONFIG_UNIMP to
default-configs though (in the Kconfig world the board would "select
UNIMP").

Paolo
