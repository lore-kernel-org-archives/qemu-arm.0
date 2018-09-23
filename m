Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1744757wrd;
        Sun, 23 Sep 2018 11:03:08 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63Uj35nhM5klr38gu31TaBHCMfGnPEXylfUy/q7R6CLouCmbk0dsyBLUKKQKKSy7m6Bz+d4
X-Received: by 2002:ad4:514a:: with SMTP id g10-v6mr4533863qvq.19.1537725788701;
        Sun, 23 Sep 2018 11:03:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537725788; cv=none;
        d=google.com; s=arc-20160816;
        b=OEFkx1WWdvYcSKsDgz7eAPUQZZUFh18Qa6Ol2IXNpEH1xzMZftJMIdPVgCDokRqW6T
         Dg4NzCoPTcBFbARVpIeieIMN+K4cxyZELnQiiNODe3KmecUlzxxWoc2rym23ZAauovg6
         CKiy1cF6nqM/d+/7qkj0vYPXEjPp6js6a+mSM97bS9/74tL2njnU5r0+iyZp35L8w+gZ
         b9rg1coe/dBsGMTr6SFJvOC4s6DIJuRmN2s6TQZxb7O/j8AKTw/z66rYRrBokHsBBAEx
         Egny4HP4bC8ABgeczSNn9HIEg4rRXBAL8aVUM5kZaUbQKtyN40gSWi5XDcFDEh2Bhvte
         YBaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=UhW2j0xM1q2KhsHaa4LCUdduvhEgSTo5pW/aWEzSHOY=;
        b=bLc+ZtHgpSvbAoELauV2v6GzQI3RPHDOr+3WtQiG22OO3Z2jAz/RcIVJBeCCNMl16w
         VU2ZskDVjMC0aBMtXlnaoQPUiy0X1H09oy/fBY018sGJ5/+ecMl37BapiFcvsd2cfVCZ
         Usvrb+1lTraFswqF86l19jVpED9pCcJig+qc9XlsTwe4/WvriYB0zb4G9ha9y794pG3A
         iJWnngDP6XU4ewK3Ces+QSFBi6Qrjq5/f4mn9hZtxkTEwS/sN8/eJ56QiiYQBNjqW+2x
         kdKg521aQnHXVjogkfZTC+xB4tAGwblJ69qcsaFTUaFB9r1FdbiWRt6R3fACSe9nyMXM
         sZVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YhyL5u6p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 35-v6si8706482qtc.171.2018.09.23.11.03.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 23 Sep 2018 11:03:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YhyL5u6p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41974 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g48iq-0005qc-A4
	for alex.bennee@linaro.org; Sun, 23 Sep 2018 14:03:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37479)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g48iY-0005mw-MA
	for qemu-arm@nongnu.org; Sun, 23 Sep 2018 14:02:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g48iX-0001Qi-TL
	for qemu-arm@nongnu.org; Sun, 23 Sep 2018 14:02:50 -0400
Received: from mail-oi0-x22f.google.com ([2607:f8b0:4003:c06::22f]:36976)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1g48iX-0001Od-Nh
	for qemu-arm@nongnu.org; Sun, 23 Sep 2018 14:02:49 -0400
Received: by mail-oi0-x22f.google.com with SMTP id n1-v6so2641367oic.4
	for <qemu-arm@nongnu.org>; Sun, 23 Sep 2018 11:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=UhW2j0xM1q2KhsHaa4LCUdduvhEgSTo5pW/aWEzSHOY=;
	b=YhyL5u6p7DzA1l43qvOTEYQ8L4ZYYMsLmazYcYYfCdTNrMSnT81+L9X46bw9uTrgZX
	b1deoUZelePfM84xnVx13PRRlM/3/JTX/u0kFMvG5WEYR19U0jmDWQCwHE1M1nip4YcK
	sZdRajmOVJl7ewN3XByDMKIEu62EiwIu7cKbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=UhW2j0xM1q2KhsHaa4LCUdduvhEgSTo5pW/aWEzSHOY=;
	b=DYek+n6PDW6P8AIvgtD0vU3uM5wJ3RBa011+183vNh8+f+p4uqok4lb1j3wUpdh9W/
	YtWPyX14xvMmjDOZ4bzyHuuw+cisBq7YaN+U/ECjdHYeK1+/5mPESxuPbcJOlzysbAFh
	Wo94+iOCvhcLaOt61kjTd4PjskGpDGrgZ3hfS6GeFBpfToCWCD7iqoCF7DBbjtbtDqEv
	XxxkphG1CLHNZa/bsXlUjqKjDJOmciyhJs8PR4YM0yYuB1/93bUU8g6Mk13SwjIay8wl
	q9NjVtiJueTdfPMKdVupjlZmsUFD3deGJcvm8k/DAWPGwrbHcCUJPWPK/dUmIu/axbDL
	2tvQ==
X-Gm-Message-State: APzg51DDo56qaTYANns3KDjb75D5FKeMQAD0rco4XZYc4Syj7eQ1Afgz
	1T2PgxnEkMbZxkdJvu/OhVdP65AwX+Gw8s2B5cmj5w==
X-Received: by 2002:aca:6898:: with SMTP id
	o24-v6mr3523776oik.44.1537725768639; 
	Sun, 23 Sep 2018 11:02:48 -0700 (PDT)
MIME-Version: 1.0
References: <F594E1D2-CAB1-48DF-9A78-66C3DC66F41E@gmail.com>
	<CAFEAcA-QWubs8FWWYuD9KjDnkjuVodtx++8DtHvsCC2AbDZSKg@mail.gmail.com>
	<9DF52029-EEB1-4ECA-B1B0-0F7B1ACAE83A@gmail.com>
	<CAFEAcA9KwO=U99wKi-7pMJB5wwUAs1yEX98XR=RY0YTPZSvXKg@mail.gmail.com>
	<7FECCB75-9B28-4AB7-8ED1-B37FEC14C644@gmail.com>
In-Reply-To: <7FECCB75-9B28-4AB7-8ED1-B37FEC14C644@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 23 Sep 2018 19:02:36 +0100
Message-ID: <CAFEAcA97va60jAsiKC4h0O6yP-BjMZoh98TGEnVU73AnKVKN0A@mail.gmail.com>
To: karthi mohanraj <karthimohanraj.in@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::22f
Subject: Re: [Qemu-arm] Arm Cortex A-72 Emulator not able to configure
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
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hQVgtw662mZX

On Sun, 23 Sep 2018 at 17:20, karthi mohanraj
<karthimohanraj.in@gmail.com> wrote:
>
> Hi Peter,
>
> As i have gone through CentOS documentation qemu-system-arm is the only b=
inary which is used for 64 bit and 32 bit arm emulation. There is no separa=
te qemu-system-aarch64 binary in CentOS. Please correct me if i=E2=80=99m w=
rong.

I'm pretty sure you're wrong. In particular the error
message you quote is saying there's no support for
the 64-bit cortex-a53 CPU in the binary you're using,
which means it's the wrong binary. Either it's too
old a version of QEMU, or Centos is like every other
distro and you want qemu-system-aarch64.

thanks
-- PMM
