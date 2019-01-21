Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6233393wrt;
        Mon, 21 Jan 2019 08:21:30 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7Zz/PEwPipRE4vw3ZNItFR4UFjcfUwm7OkJIv4QMMb4++tT3toulG0UjduW6obxtVoPS/2
X-Received: by 2002:a5d:4382:: with SMTP id i2mr28638995wrq.172.1548087690033;
        Mon, 21 Jan 2019 08:21:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548087690; cv=none;
        d=google.com; s=arc-20160816;
        b=PD/L2o9x33qR2QujeIb+TnYLhkA6dkJgfXTQlcjVjp47qteTe44QHObED/uujEnTao
         mqCGzYtc3Y5K+C/nJKc/GbS/kEo7UQzM/+MkJQ0mpzGfGMFt8Mng5fx4nRADXDV3h89S
         55zCxT4l8V4rBl8UfA2FsQfDw9pmzN75uR5nZeWWRJ2h3QAGlLbuueKlBaCALm5/hIvu
         QtKuM2nZvrn59N+AIWO+DnbYToQy77GpLIrisV4YMkl7Z1prygxNwbKTzpf227i30Fp/
         xdsOiQeA/R38OnS1lLOK9d1o/xhiugMXkwGCyIOi7Le+Zg9VVXMq+phmEYb/ngC6NF2D
         Rykg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=nWplIrysv2uFuaR0yrDXiJ4+9nW1S4A4k+fI7HxYP2w=;
        b=VeDmU8pwZNQ/gu7h6+mUY47D+bs+RZmBhL8VTnsGwTRVvGl37i7VKnAQXGwGaZxcGd
         hXSRwBCLHg0FGVNXTgKtmmXg7RoGe4xPds4LbX7ghQR4BpTzFQecdvkKrKm9m/jiLWIs
         tcA3bj8cog1TtM/lAIwfxUJoOvi6nBPahdtEErVnJN40muJRXHc98cCB9XiGsrwvkPy0
         mGbSdJJzn+V/cVfhTugMTdk12qLjDI0VgTaRzwml8xOH/qDG4tmsz+vKPis3k+9TWfhm
         r2QInK5bOtUdmbt/syLPSVCBzCE2vD6LMonHFf8h0NJCmszxcxB+UhOUL2Xw1adMGjrv
         Assg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aLNF7I9N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g64si19549416wmf.113.2019.01.21.08.21.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 Jan 2019 08:21:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aLNF7I9N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:55845 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1glcKH-0004Cx-2t
	for alex.bennee@linaro.org; Mon, 21 Jan 2019 11:21:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57924)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1glcK5-0004Bv-38
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 11:21:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1glcK4-0006Kg-81
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 11:21:17 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:45581)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1glcK4-0006Jd-0G
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 11:21:16 -0500
Received: by mail-ot1-x344.google.com with SMTP id 32so20957883ota.12
	for <qemu-arm@nongnu.org>; Mon, 21 Jan 2019 08:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=nWplIrysv2uFuaR0yrDXiJ4+9nW1S4A4k+fI7HxYP2w=;
	b=aLNF7I9Nz+djRlCP5tz6rGu7zm1MDqXHCn3TNHrFpr7oAiPTYRDet21t9elSp25Mt2
	E4ziNRZx4tKNQWs1NdK9AD+pcg1ir91Fi9nyiC39Najv+lZcNVDaznCIVQGNsEum7lkz
	Qh3xytJ6XMsqwsbe+YF+wUqBxyEHGdpo/pDb0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=nWplIrysv2uFuaR0yrDXiJ4+9nW1S4A4k+fI7HxYP2w=;
	b=KFOjGEDjkAvhClUMbWdc6sJkpdd7jPY2vjQW8mSTbFL6ljUBl67fLkLpKZwffOOG45
	A2KxJW08FExMuCSVCTchDAzgi59awV95z9i7xcjz39Jexqu0Bew8v9mYlLaIo6GzkorY
	8dbHYQRzi3JRX+d3SBiDYm/+7HMpm4G623IfrClpMrHqe9MtWg9pdf9FbVv/8XhoXrRU
	SL1KdgrL1SGh4pFgLlVUZzk3hhyfqArMCOSWOt+NhlsjqVwwVXXOy1JdDUaKfYO6PV7d
	edCkXy1+akJupWXfUn9CMq84ZcUZapOAjCcrGm1ZxeXZisTYnJ+8t1xNop0u3qc1PPNG
	Tkug==
X-Gm-Message-State: AJcUukdyXfwM68skS99QwENTK/hzQQfpJvYUlvDKMWgd4IYUTQeFZ9Ds
	upZWMNiVZFbhp0jYxsboXS+ydN3AkVYXJqYb7ANIjg==
X-Received: by 2002:a9d:4b0f:: with SMTP id q15mr5764971otf.201.1548087674926; 
	Mon, 21 Jan 2019 08:21:14 -0800 (PST)
MIME-Version: 1.0
References: <20190110094020.18354-1-stefanha@redhat.com>
In-Reply-To: <20190110094020.18354-1-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Jan 2019 16:21:03 +0000
Message-ID: <CAFEAcA8bz7ViuZeZqCBZHy49=dbYxW7Q04MbuVKapEfT5K56ug@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH v2 0/2] arm: Stub out NRF51 TWI
 magnetometer/accelerometer detection
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
Cc: Laurent Vivier <lvivier@redhat.com>, Jim Mussared <jim@groklearning.com>,
	=?UTF-8?Q?Steffen_G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nOfb+BDOfFZK

On Thu, 10 Jan 2019 at 09:40, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> v2:
>  * Move stub code into a separate device [Peter]
>  * Instantiate stub from microbit board instead of nRF51 SoC since this i=
s
>    microbit-specific.  Other boards using the nRF51 wouldn't necessarily =
want
>    to see these TWI/I2C devices.
>  * Add test case
>
> This series stubs out the microbit's TWI/I2C devices so the microbit-dal
> firmware boots successfully.  The accelerometer and magnetometer are prob=
ed at
> startup.  If they are not found the firmware panics.
>
> Stefan Hajnoczi (1):
>   tests/microbit-test: add TWI stub device test
>
> Steffen G=C3=B6rtz (1):
>   arm: Stub out NRF51 TWI magnetometer/accelerometer detection
>
>  hw/i2c/Makefile.objs          |   1 +
>  include/hw/arm/nrf51.h        |   2 +
>  include/hw/arm/nrf51_soc.h    |   1 +
>  include/hw/i2c/microbit_i2c.h |  42 +++++++++++
>  hw/arm/microbit.c             |  15 ++++
>  hw/i2c/microbit_i2c.c         | 127 ++++++++++++++++++++++++++++++++++
>  tests/microbit-test.c         |  44 ++++++++++++
>  7 files changed, 232 insertions(+)
>  create mode 100644 include/hw/i2c/microbit_i2c.h
>  create mode 100644 hw/i2c/microbit_i2c.c

Applied to target-arm.next, thanks. Can you provide a
MAINTAINERS file update for the new files, please?
(You can send that separately or stick it in another
nrf51 series if you're sending one.)

thanks
-- PMM
