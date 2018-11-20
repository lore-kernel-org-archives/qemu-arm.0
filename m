Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp373945wrt;
        Tue, 20 Nov 2018 02:09:24 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UL525pX2dcMA0kWsUVZLlDagWhh6QPti5n+x68yfy3mEl4NVg7/k5H63kizP8jmcykoKiD
X-Received: by 2002:a25:378d:: with SMTP id e135-v6mr1111953yba.94.1542708564716;
        Tue, 20 Nov 2018 02:09:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542708564; cv=none;
        d=google.com; s=arc-20160816;
        b=WFWdLLdJSSMx/tu5B6T6AJvmX/onpBgavzX2tx2NpipIMDr7n1ELrOy35ZVzJnYCDz
         9jO9Y/0DkJwpIqvMudvmzxJ6I0O1tgw6B7PjOK8Mm78eq7BSvi67X/Lsl7GgTPXuECoY
         6pP4b9RbyBhDHFTM8vQ8Eh3c11GrIENroeV+kemGKC77jOWZltxy4WoABeg9EZpZMY3N
         qrHVKE43U99LOeG51WrUZGc8V8ht4DUwhapwQrFZq32/vVr+nKlRlq8imGWBSflsV0p/
         zJHJ2O5mnkMWuo/yzGio7dZIVd0/QEmM/OEkzop5C+TGby0mm8aZvzc+z9NONiw880+9
         NBoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=2iH2KWe/JDpvyzH1xkjjA5ll6kEQ+uEFVE2fyQUcCRk=;
        b=piY/sIMnciyoG6fz9e7b9V2xCFWgiqqGAtJ8SfHy52Mv3snzQN6zhfnOl8Tq+bjAaF
         FbJHSHA7A8acn8LIwFsWPIcl5NEAqDAQCFrrc1cEXYXEyggDHWf/O7lIcsZGM3T373GT
         T+7D7HBZioY3WtsLmMO42l3Bv2gj1z45rpc+V6fszoCGjhk4soHkuHpjHEapXZ6EgBw2
         liEgvanZAgj/widVrv0kdDZeMvGML8huySlPb8m2dbhE4JLCCOiHL+HFubpSSALT4dov
         0tePzyH3Nu+pwg48m447lPil1orUBr8QWmSL4BlnkwQCJSHvc2tsPJ5f6IieXztMQQjl
         fgrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LAQbkenR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u8-v6si25297103ybm.356.2018.11.20.02.09.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Nov 2018 02:09:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LAQbkenR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:32851 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gP2yC-0000Pk-3m
	for alex.bennee@linaro.org; Tue, 20 Nov 2018 05:09:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59035)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gP2xz-0000My-Oe
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 05:09:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gP2xq-0006XL-EY
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 05:09:11 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:46161)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gP2xm-0006T1-MB
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 05:09:00 -0500
Received: by mail-oi1-x242.google.com with SMTP id x202so1008044oif.13
	for <qemu-arm@nongnu.org>; Tue, 20 Nov 2018 02:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2iH2KWe/JDpvyzH1xkjjA5ll6kEQ+uEFVE2fyQUcCRk=;
	b=LAQbkenRSlk4MSJfISLWNGGiCsYlqIUC73aLwmLEWkhTRd3PfNbYY2Zn6MKslG2WI5
	0ozzD8ZyjBOiyuXBm6JheS90G9p2kYeCu/TkcyKOKZx/e9t0wGIescR0/iUYQmil2EpY
	FmmGeKQFUwSWQwPmqM75ggaAdBLZ48Vy/YPBY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2iH2KWe/JDpvyzH1xkjjA5ll6kEQ+uEFVE2fyQUcCRk=;
	b=KkwxI0f01fMMKdXeBOEBOSN5bXuk1OrPkuU/MYJCq4oRdVTJZcoNsU5EvHXO6OqIlm
	4fpwArJgop4hhA4l2CKgFLhqaz40+IYflKP3BcBj4YBg0BHnB+7VrOsLMpw+QJ3okTi4
	ettw16rsn90S0N6wz3+EAIVKKpkxdbt9OkqTSZa/mHiTQmP9Eow9s+JU4VgkeGHp3gwu
	e6y0drZwFBkqNP3H3/JFdZxgHh8heGJJ9F16MuUHqfoXL05R3iPh4lwt/jTfjXvky0nu
	S13a+9xEZX+Hs4IqjQQUoe2bwASXJgQXY1McFqPyP6Ozqm/A+jqO01ecz8kQxIR7L13E
	pdug==
X-Gm-Message-State: AGRZ1gKpS7ffKLlHa1m+/pVzpjyaEPs+o2QAPI8iekKf/cPj54mTvHfX
	8nR/W7fZh01j2NJGB7e2NnzjUACG98dWXLZcPNKs0Q==
X-Received: by 2002:aca:b68b:: with SMTP id
	g133-v6mr756619oif.25.1542708534227; 
	Tue, 20 Nov 2018 02:08:54 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP; Tue, 20 Nov 2018 02:08:33
	-0800 (PST)
In-Reply-To: <CAHmME9qhe0ZemTkc2jkEO=_hu6PhvKUKGHC9QYTj2j+QHhNf8g@mail.gmail.com>
References: <CAHmME9qhe0ZemTkc2jkEO=_hu6PhvKUKGHC9QYTj2j+QHhNf8g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Nov 2018 10:08:33 +0000
Message-ID: <CAFEAcA8fYaKTZkLR8Ja3P590bSWy1cu61-gSxyf6+wXCfCLoxA@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-arm] more serial ports on arm?
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h0dB1FPsQNEJ

On 19 November 2018 at 23:46, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> Hey guys,
>
> I sort of lost track of the discussion, but what ever happened to
> adding an extra serial port to the arm virt machine? I'm still
> carrying around the attached patch to run build.wireguard.com and I'd
> of course like to see a real solution upstream.

It's still stuck, because unconditionally adding a second serial
port to the virt board breaks some commonly used existing guest
code (UEFI + Linux), and it's not clear to me what the best
command line UI is for allowing the user to request the second
serial port.

thanks
-- PMM
