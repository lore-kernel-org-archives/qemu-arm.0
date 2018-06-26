Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5177262wrq;
        Tue, 26 Jun 2018 08:51:53 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeTZw5I9FFofkERP39EzbYwh1QgI45tiddLWNXyFoOzQwQ9jEAe9Vw+DB8hkA7d4t2WWP13
X-Received: by 2002:a0c:d7c6:: with SMTP id g6-v6mr1956728qvj.85.1530028313508;
        Tue, 26 Jun 2018 08:51:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530028313; cv=none;
        d=google.com; s=arc-20160816;
        b=Ud4VcciNQoo9fVqC016YWRbOOGHU1/sqkRP1S2QbxHe/9IeJnCgj3laoW06JXdIExQ
         1d7b3hTGoZWJkJpNy6kUvJK/75A1vWQieBf3a93RE52IG1CM9bTvfM/q0RtnUdJb/5Va
         KDWd46gFhm0SNC7636C03jBTTIPixv2Be58cgU5K1XRrYOm0UeMM8mtPeKeNcdkM+4w6
         a/MLFlGp6GUC+cm4G7pz3mcfhI/iAttZgm77LIITZqCsdWO1D0JmCgQa23mdnlmC6ZC4
         NVngt5P2FY0wNkTOdBBI+XYr/fhRdwxuXgEwjEQE00zxemRzV3O/6GfNIJojZ5Qia3uV
         /BJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=mGkFZMaYaBytsLRPdHFHmanFj711L0QEl3YubsLYvPw=;
        b=0TjNwyTP99NUh+VmL2MJ6klAKsKcd6DfAtdyvVU6HDEQeXQOO6BU3YQnKnVR2ZJ1rg
         KZTYZMzk6mcf4+isTsI/7VWMAC4/IMuDicyQ8FFsMr7+LsAckZIWqCyi/8bFYHChStDy
         wPManKPqZ0qGlSnQSIKkVXA60rDTpSyt2mdFct84lxkcGekYoAbshf3DJOepl0B95yyk
         7hbuGlWE9Ih9LjvdoXYlj0FcveihKDw/rzBfabsU5TB+hIa++p53vZRdzYXeGzl7/naf
         8/eeWJeD8PwXqeoocIWRBubWvmOXBRBENEOifZsTxe9iViunnQGlXnFGVMuMbd3qymKl
         rYUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BQdyXb9f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b187-v6si512964qke.333.2018.06.26.08.51.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jun 2018 08:51:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BQdyXb9f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53516 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fXqG1-0005Bv-1K
	for alex.bennee@linaro.org; Tue, 26 Jun 2018 11:51:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36701)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fXqFn-0005B4-1l
	for qemu-arm@nongnu.org; Tue, 26 Jun 2018 11:51:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fXqFm-0001Ya-5f
	for qemu-arm@nongnu.org; Tue, 26 Jun 2018 11:51:39 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:37092)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fXqFl-0001YE-VC
	for qemu-arm@nongnu.org; Tue, 26 Jun 2018 11:51:38 -0400
Received: by mail-oi0-x242.google.com with SMTP id k81-v6so2416134oib.4
	for <qemu-arm@nongnu.org>; Tue, 26 Jun 2018 08:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=mGkFZMaYaBytsLRPdHFHmanFj711L0QEl3YubsLYvPw=;
	b=BQdyXb9fnRp4tOGY58TUmLjYRqdXEc3ketZO46wv3FM3W6L7Pfr6GK+zGQKCaGN8LI
	nwtr2uiHvUirXP/C5MUsl4k1pfJjcBNSyz4t6OpztupW3pdB3S1EfExROdqvbtr96jF+
	9ZWvv7lWGLX0f4XwIQlb1jPNOw1DJLPTTuUEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=mGkFZMaYaBytsLRPdHFHmanFj711L0QEl3YubsLYvPw=;
	b=jlwqKJub6ha6QxkWqfgh87smQ7eNOjxdXcdH1HYz+1mmbCQ5P3RFFvcCNzWi8sb3pv
	rnQPLUAklmhBaEfM1Vd/3DkdcNdkPzjcbqqNlJwHyYRBDdxYP6sqd9rB+wS7KrnHAwO/
	5pLwDw2M2Rr6q9mspWpJr4i5QOEi8iNrM3QzzWx41M3V60BZHCRxROOP16mEQJnRTAnX
	fwl0KJyOd07W7D1sTXPLLipoCN9JGLGDc01hMTRiVDPVasIAy4xzCKV5wjuH4apvW0G1
	Q9qLSvvBS6YR/0fFlCWpj+42FQvA2RtK+1fIhK2gMEEW3hZB3sd+pdvdOajKRLTQrCHt
	DmuA==
X-Gm-Message-State: APt69E2IvpIEJJJoSUEJ9TmUkJznHg7XywF1A4ZRN2nqfqtKmn7f4EjN
	HyZgjEpRIDVbMAgI2ZyUnlefAdlEaI7W2uOVCI0DGw==
X-Received: by 2002:aca:a846:: with SMTP id
	r67-v6mr1217000oie.12.1530028297183; 
	Tue, 26 Jun 2018 08:51:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:902:0:0:0:0:0 with HTTP;
	Tue, 26 Jun 2018 08:51:16 -0700 (PDT)
In-Reply-To: <20180624040609.17572-1-f4bug@amsat.org>
References: <20180624040609.17572-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Jun 2018 16:51:16 +0100
Message-ID: <CAFEAcA96og6eWt2EpmfAnYWGDhouGV8MrDVQ4ADzWv9xC2=_Qw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] [PATCH v3 00/16] hw/arm: use qemu_log_mask instead
 of fprintf
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
Cc: Thomas Huth <thuth@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, Jason Wang <jasowang@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wqDxamRYqysg

On 24 June 2018 at 05:05, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wro=
te:
> Hi,
>
> This series is another collection of trivial patches from
> different stagnating branches, OMAP and Stellaris. Time to
> share before loosing them.



Applied to target-arm.next, thanks.

-- PMM
