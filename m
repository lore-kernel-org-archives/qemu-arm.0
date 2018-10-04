Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1303586wrt;
        Thu, 4 Oct 2018 13:01:46 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60kHM7JJvmzn5VjXD7H+m0DykjzY7OwB1jviVVZVX8WZ3qlIrj5I37S0Aat8XQVgE8YQgb5
X-Received: by 2002:aed:23d8:: with SMTP id k24-v6mr745215qtc.39.1538683306582;
        Thu, 04 Oct 2018 13:01:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538683306; cv=none;
        d=google.com; s=arc-20160816;
        b=dzEe55lqv7jlq5Bfo1EeEI0EGu0xMO68V2d8oRry+R5K4EcYY9m9S/JPL7DXFfYtnf
         zfgySql2sutW1TUevXM5kJpHbHlmDwSfS5PBTWJAACkCUyFHXds9vw1glt+fzx53BESO
         V+yGukL6ngEz6MxEugnXJK2VgjQlT0kUWazofh0rKqmp6pdSeN04ODZU+z9l3LYUiBYK
         iq7crP7oDVi1cKL+aPCi6WH416uryJzTX9d7WFxW1ZxM29qJX6ry3OQmiwPY5iU+1+JN
         V63x29AyzqG9rzrWy2NUbxgYOaA1YfWqVnbR8joSQEKskH9jaHuMEPJQt5eekODul7Qv
         q3nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=j4qQZf2etb0/3hgq54VEReqXJ2o7ulFVCuaoW0qltYA=;
        b=fIdtQ3+Tjfu+lkjF9bnw8nd15LOtG9v5MfmLtv0mvXyc87HMH7zYb8NIYg36Ke1Qta
         xouykRBKD317kCGlH151sy5HxhX58IBQPwGS1BLEMNiAUeTQCmaFJskb3mRT1q2Q3V8p
         8k6g1jUmujmQLKPyDJg+kjg+8TLtecdPJ74HYTuqK4b5zpjtaLdQHFwj+7RcFEuTeYBt
         k/Cu747cxqyypidnNfH7TvSPfEML8LSNFI57PPrtDY5JApVmsQV4+F7x6duZLpaCf/Bs
         +ujvUd5I3b4jkeIyhNu+iS2pEDlbT2qAUvFnecjVjpqiKBnPZNPfL2pFpU+H14+ytMzQ
         iknw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PWznYkE5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x36-v6si836010qtd.243.2018.10.04.13.01.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 04 Oct 2018 13:01:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PWznYkE5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58757 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g89of-0006pP-Vn
	for alex.bennee@linaro.org; Thu, 04 Oct 2018 16:01:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37022)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g89oR-0006op-U5
	for qemu-arm@nongnu.org; Thu, 04 Oct 2018 16:01:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g89oR-0004S7-7F
	for qemu-arm@nongnu.org; Thu, 04 Oct 2018 16:01:31 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:38349)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1g89oQ-0004RI-Ky
	for qemu-arm@nongnu.org; Thu, 04 Oct 2018 16:01:31 -0400
Received: by mail-ot1-x344.google.com with SMTP id h15-v6so10439283otj.5
	for <qemu-arm@nongnu.org>; Thu, 04 Oct 2018 13:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=j4qQZf2etb0/3hgq54VEReqXJ2o7ulFVCuaoW0qltYA=;
	b=PWznYkE5EAHLBihqF1tK0K5I7XhDV+R6EzJvnpmC57uVLItTzlwXphLS6QLlp3wTRs
	5yA70+9JR1cIa/67ilWN0nwkhUyn3MHhrJmS2rDw/7+NP6Bv3CaX+T2agrV7dSYjyKkB
	4/m9vqHlRuGgfQm/eWW65vT6YGoRz5S8qtapA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=j4qQZf2etb0/3hgq54VEReqXJ2o7ulFVCuaoW0qltYA=;
	b=IT+Z2pu6gjv4W0uarHYeRIiE3tmdQET1EbWodPOum4P5XEUuyp/KKQR4jJtpdCOL6Q
	cbJBYM8A97rwNnLOnqfBHrgYql4p5j3wYNQHxN+XmpEdoTgkBeZN2eXL/43TA4FUq/JI
	uzM057ykakw606tpQSSc8fgcPz2SUxLvr1uGWUrPvCozWCUm8Oji+cDt36w74ACg5mG1
	zBrPmhCCh0reAdUmKv/pjGPWB6AWua4X5dRftXCVhQe4haALoIc2SRWwvLXcU2KpK+g0
	LuPAQhRD2nNAWS7B0z62GnmLDk7fTtW0dM7FKfOvXNVsDy26MlM7hkXPatBP7/KR8jLC
	koUw==
X-Gm-Message-State: ABuFfohqqdW5F7rJdZvCxAOHu4+63+F15sifdtL5wkizVFdZtdQpknJW
	77rpJJ8i8o5OBiF6LGNpkElTwC6A2VvokCz7NaU9nw==
X-Received: by 2002:a9d:cd8:: with SMTP id o24mr4383293otd.363.1538683289584; 
	Thu, 04 Oct 2018 13:01:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP;
	Thu, 4 Oct 2018 13:01:09 -0700 (PDT)
In-Reply-To: <20181004195225.GV5738@habkost.net>
References: <20181001115704.701-1-luc.michel@greensocs.com>
	<20181001115704.701-16-luc.michel@greensocs.com>
	<35ffbd68-f783-b6f4-18a2-dd995819c046@redhat.com>
	<CAFEAcA9vHi=qrV-Aj5ptgBQntafLGwL6VezxnmOuuR=6=Pr8cA@mail.gmail.com>
	<33c3ea72-652a-53b2-4865-830f3d7f2c3a@greensocs.com>
	<3d459f14-b701-02b6-d231-fc48c509640f@redhat.com>
	<20181004195225.GV5738@habkost.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Oct 2018 21:01:09 +0100
Message-ID: <CAFEAcA9tT5iFAo5DG=3dyBYNjBVN9u2qEK6Bo9Rf2MAPMBC6bg@mail.gmail.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 15/15] arm/xlnx-zynqmp: put
 APUs and RPUs in separate GDB groups
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
Cc: Thomas Huth <thuth@redhat.com>, Alistair Francis <alistair@alistair23.me>,
	Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jvzJF8NkwEbe

On 4 October 2018 at 20:52, Eduardo Habkost <ehabkost@redhat.com> wrote:
> Changing the object hierarchy based on GDB groups doesn't seem
> right, but I don't think it would be a big deal if we have the
> board code explicitly telling the GDB code how to group the CPUs.
>
> If you really want to do it implicitly, would it work if you
> simply group the CPUs based on object_get_canonical_path()?
>
> If a more explicit GDB grouping API is acceptable, what about
> just adding a INTERFACE_GDB_GROUP interface name to (existing)
> container objects that we expect to become GDB groups?
>
> I'm not sure which way is better. I'm a bit worried that making
> things too implicit could easily break (e.g. if somebody changes
> the CPU QOM hierarchy in the future for unrelated reasons).

I don't want things implicit. I just don't want the explicitness
to be "this is all about GDB", because it isn't. I want us
to explicitly say "these 4 CPUs are in one cluster" (or
whatever term we use), because that affects more than merely GDB.

thanks
-- PMM
