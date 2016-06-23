Received: by 10.25.21.96 with SMTP id l93csp658757lfi;
        Thu, 23 Jun 2016 11:22:47 -0700 (PDT)
X-Received: by 10.237.37.99 with SMTP id w32mr45689473qtc.95.1466706167406;
        Thu, 23 Jun 2016 11:22:47 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m64si1358072qkf.127.2016.06.23.11.22.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Jun 2016 11:22:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@yandex.ru;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=ya.ru
Received: from localhost ([::1]:38629 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bG9H4-0005pQ-NV
	for alex.bennee@linaro.org; Thu, 23 Jun 2016 14:22:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44995)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1bG9Cp-0001rq-K5
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 14:18:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1bG9Cl-0004K2-FA
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 14:18:22 -0400
Received: from forward3p.cmail.yandex.net ([77.88.31.18]:40422)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>)
	id 1bG9Ck-0004CQ-4w; Thu, 23 Jun 2016 14:18:19 -0400
Received: from mxback3g.mail.yandex.net (mxback3g.mail.yandex.net
	[77.88.29.164])
	by forward3p.cmail.yandex.net (Yandex) with ESMTP id C5F8820EB8;
	Thu, 23 Jun 2016 21:18:01 +0300 (MSK)
Received: from web16g.yandex.ru (web16g.yandex.ru [95.108.252.116])
	by mxback3g.mail.yandex.net (nwsmtp/Yandex) with ESMTP id
	2sXVLLbbdt-I1ZqSDi7; Thu, 23 Jun 2016 21:18:01 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1466705881; bh=462cs/1ptY5pDHaEi2WUw2AsZUBtd4WcWYcSWLmWIPU=;
	h=From:Envelope-From:To:Cc:In-Reply-To:References:Subject:
	MIME-Version:Message-Id:X-Mailer:Date:Content-Transfer-Encoding:
	Content-Type;
	b=lrlS7mrx/QCMTYffIRJqxTelVfbnh3qe2x/beorbKBn8agIEUb9YMyhJpYfVIIBAT
	7XysyDIrOaehFDH4dPdTWfCwK8sNrRIMMIB1ixBy5sc/riS8Q5D2gn4jkLasiCZeNf
	IAgh6qs/mcouKRfG8jMjr9cPGYvhqepfpaoctZ3w=
Authentication-Results: mxback3g.mail.yandex.net; dkim=pass header.i=@yandex.ru
Received: by web16g.yandex.ru with HTTP;
	Thu, 23 Jun 2016 21:18:01 +0300
From: Sergey Sorokin <afarallax@ya.ru>
Envelope-From: afarallax@yandex.ru
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
In-Reply-To: <1466692926-522819-1-git-send-email-afarallax@yandex.ru>
References: <1466692926-522819-1-git-send-email-afarallax@yandex.ru>
MIME-Version: 1.0
Message-Id: <798941466705881@web16g.yandex.ru>
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Thu, 23 Jun 2016 21:18:01 +0300
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 77.88.31.18
Subject: Re: [Qemu-arm] [PATCH v3] Improve the alignment check infrastructure
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
Cc: Claudio Fontana <claudio.fontana@huawei.com>,
	Alexander Graf <agraf@suse.de>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Vassili Karpov <av1474@comtv.ru>, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7Sxr0paMN2Q1

<div><span>I have sent=C2=A0</span><span>the fourth version of the patch.=
</span></div><div>=C2=A0</div><div><span>A build failure was fixed.</span=
></div>
