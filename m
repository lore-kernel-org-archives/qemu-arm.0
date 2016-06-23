Received: by 10.25.21.96 with SMTP id l93csp561734lfi;
        Thu, 23 Jun 2016 07:46:38 -0700 (PDT)
X-Received: by 10.55.116.195 with SMTP id p186mr43489495qkc.52.1466693198480;
        Thu, 23 Jun 2016 07:46:38 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q29si413748qkl.95.2016.06.23.07.46.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Jun 2016 07:46:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@yandex.ru;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=ya.ru
Received: from localhost ([::1]:37087 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bG5tt-0004la-QU
	for alex.bennee@linaro.org; Thu, 23 Jun 2016 10:46:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35616)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1bG5sq-0003xN-Li
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 10:45:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1bG5sm-0004KF-DZ
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 10:45:31 -0400
Received: from forward3o.cmail.yandex.net ([37.9.109.247]:60385)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>)
	id 1bG5sl-0004JX-3N; Thu, 23 Jun 2016 10:45:28 -0400
Received: from mxback6o.mail.yandex.net (mxback6o.mail.yandex.net
	[37.140.190.20])
	by forward3o.cmail.yandex.net (Yandex) with ESMTP id E7F9E20EBD;
	Thu, 23 Jun 2016 17:45:15 +0300 (MSK)
Received: from web2o.yandex.ru (web2o.yandex.ru [95.108.205.102])
	by mxback6o.mail.yandex.net (nwsmtp/Yandex) with ESMTP id
	3tXC01pmYQ-jFU4GnEr; Thu, 23 Jun 2016 17:45:15 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1466693115; bh=5eVvKbk1x+V58YzvirDenkmJTLLbflrECfaqlRrbcCs=;
	h=From:Envelope-From:To:Cc:In-Reply-To:References:Subject:
	MIME-Version:Message-Id:X-Mailer:Date:Content-Transfer-Encoding:
	Content-Type;
	b=wiDfLSLDoWTCtiGc7Clu6vOws74Y7WI4vnO3oY8V1RbMvVLBBxxFB4yzSpZlhi92E
	xoDKWeVNd9t/qzUIHXD+gYPsDD1e1gI1JLhB/sLLZrhcv2qtTUb47TSh7837rZr/bg
	YqdLc3dg8//s4entb/55fSk3ZAwtq87O9UGV59vw=
Authentication-Results: mxback6o.mail.yandex.net; dkim=pass header.i=@yandex.ru
Received: by web2o.yandex.ru with HTTP;
	Thu, 23 Jun 2016 17:45:15 +0300
From: Sergey Sorokin <afarallax@ya.ru>
Envelope-From: afarallax@yandex.ru
To: Richard Henderson <rth@twiddle.net>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
In-Reply-To: <200981466691221@web14m.yandex.ru>
References: <1466599029-3388432-1-git-send-email-afarallax@yandex.ru>
	<5d86b8ba-16e8-e94d-ba7f-e865cbcc938e@twiddle.net>
	<1793281466613020@web5h.yandex.ru>
	<6c24c820-4a26-848c-e62d-88ebce59125d@twiddle.net>
	<201241466676212@web21j.yandex.ru>
	<458f40bb-cb58-4e10-2237-a08cb35155bd@twiddle.net>
	<200981466691221@web14m.yandex.ru>
MIME-Version: 1.0
Message-Id: <307331466693115@web2o.yandex.ru>
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Thu, 23 Jun 2016 17:45:15 +0300
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 37.9.109.247
Subject: Re: [Qemu-arm] [PATCH v2] Improve the alignment check infrastructure
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
	Vassili Karpov <av1474@comtv.ru>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: P64npHlIaDDm

<div><span>I have sent=C2=A0</span><span>the third version of the patch.<=
/span></div>
