Received: by 10.25.21.96 with SMTP id l93csp345943lfi;
        Fri, 1 Jul 2016 08:16:53 -0700 (PDT)
X-Received: by 10.13.221.204 with SMTP id g195mr9975873ywe.238.1467386212306;
        Fri, 01 Jul 2016 08:16:52 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k68si471363ybk.241.2016.07.01.08.16.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Jul 2016 08:16:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33958 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bJ0BX-0000Cl-L9
	for alex.bennee@linaro.org; Fri, 01 Jul 2016 11:16:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50500)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bJ0BS-0000AK-7W
	for qemu-arm@nongnu.org; Fri, 01 Jul 2016 11:16:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bJ0BQ-0002mI-3o
	for qemu-arm@nongnu.org; Fri, 01 Jul 2016 11:16:45 -0400
Received: from mail-vk0-x235.google.com ([2607:f8b0:400c:c05::235]:36007)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bJ0BP-0002mB-Vj
	for qemu-arm@nongnu.org; Fri, 01 Jul 2016 11:16:44 -0400
Received: by mail-vk0-x235.google.com with SMTP id m127so97520547vkb.3
	for <qemu-arm@nongnu.org>; Fri, 01 Jul 2016 08:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=R5yzO0JQO9EotidkW/H2weDUfjMQIR3aLJHdW//Uif8=;
	b=GCbYsGgQWVlReTfn86FDTLoCxjlg53S0ft4qA1qVUlxq+ptBqiXtf2B2xYO2xqirVn
	ywe1qj7vtu8shZTuoGOfiusXTj59fmqOO0Q7QmfZJfdtoQ7DQ2khrg/gzFmvi0LXdpAI
	VOjOixTjjmTZ5zxQYfgobOHwsasvL4mSzxk/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=R5yzO0JQO9EotidkW/H2weDUfjMQIR3aLJHdW//Uif8=;
	b=JYApm1EHv88BVVUa63p6Apx3JQyX9xXm0EzLHP9cexWsfz/xunP0VkPoUUf21d8WK4
	iyXfrUg5CbTzYbS3eRNy/hdZC9auJo8hg9kr81ZbFyjmHFfb3j6/Je/LuDm2sgbZSLsU
	g8YDnwh8Si+uIoUXNNDCFxzodueeCmhCSajDw5h/x/UEcHwY3ixHI9NpX2qFyqp/2UM3
	xKp7s514o1QtPz/jVLIaqzcsdPhlL0fUnlbkhCVMj2tgzKN5pi4L5EmYfqayrf2mBbTf
	jZEDMF/ZHYF4Rh5GOuUgxZzpbxT5TomnLZv0q0wH1rd7RD7lj/0W2u6q3EweO2ktT2YA
	9VQA==
X-Gm-Message-State: ALyK8tL6kowWqZvkCRGOtkpHydFnYg0DFLSrQ6yiMy5kuqNUblogrXRri8G/dW0cALBFEBIxNWgaT00lmha/Gl/q
X-Received: by 10.176.65.106 with SMTP id j97mr10056178uad.64.1467386203610;
	Fri, 01 Jul 2016 08:16:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.157.141 with HTTP; Fri, 1 Jul 2016 08:16:24 -0700 (PDT)
In-Reply-To: <1467138270-32481-2-git-send-email-clg@kaod.org>
References: <1467138270-32481-1-git-send-email-clg@kaod.org>
	<1467138270-32481-2-git-send-email-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Jul 2016 16:16:24 +0100
Message-ID: <CAFEAcA9Hw8EZRJnFHNSSauv6r5untnL=HBzWsw2SwDsmfxnETg@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::235
Subject: Re: [Qemu-arm] [PATCH v5 1/9] ssi: change ssi_slave_init to be a
 realize ops
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
Cc: Kevin Wolf <kwolf@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
	Markus Armbruster <armbru@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jmbFNz0FZQWG

On 28 June 2016 at 19:24, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> This enables qemu to handle late inits and report errors. All the SSI
> slave routine names were changed accordingly. Code was modified to
> handle errors when possible (m25p80 and ssi-sd)
>
> Tested with the m25p80 slave object.
>
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
