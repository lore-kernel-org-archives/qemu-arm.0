Received: by 10.25.21.96 with SMTP id l93csp2461696lfi;
        Wed, 22 Jun 2016 06:10:20 -0700 (PDT)
X-Received: by 10.55.142.132 with SMTP id q126mr35317361qkd.81.1466601020818;
        Wed, 22 Jun 2016 06:10:20 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id c2si51491616qtb.120.2016.06.22.06.10.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Jun 2016 06:10:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@yandex.ru;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=yandex.ru
Received: from localhost ([::1]:58147 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bFhvA-0002O5-5E
	for alex.bennee@linaro.org; Wed, 22 Jun 2016 09:10:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52887)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1bFhRK-0002Wg-Kn
	for qemu-devel@nongnu.org; Wed, 22 Jun 2016 08:39:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1bFhRI-0005Ck-OB
	for qemu-devel@nongnu.org; Wed, 22 Jun 2016 08:39:29 -0400
Received: from forward3p.cmail.yandex.net ([77.88.31.18]:58437)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>)
	id 1bFhR7-0005AK-E0; Wed, 22 Jun 2016 08:39:18 -0400
Received: from mxback2g.mail.yandex.net (mxback2g.mail.yandex.net
	[77.88.29.163])
	by forward3p.cmail.yandex.net (Yandex) with ESMTP id 74C2020EB4;
	Wed, 22 Jun 2016 15:39:05 +0300 (MSK)
Received: from web8g.yandex.ru (web8g.yandex.ru [95.108.252.108])
	by mxback2g.mail.yandex.net (nwsmtp/Yandex) with ESMTP id
	1d3T2KzIxz-d4hiGjAC; Wed, 22 Jun 2016 15:39:04 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1466599144; bh=qYj53x+uIjs2HVU5sUtOl7aw4mopN1ExJq7Zhl1l/Pc=;
	h=X-Yandex-Sender-Uid:From:To:Cc:In-Reply-To:References:Subject:
	MIME-Version:Message-Id:X-Mailer:Date:Content-Transfer-Encoding:
	Content-Type;
	b=Ed+0HRaCfO5GxE9oBrWdVSh8JsLr3DV0WfNbad3Na7WtJYzCcJcYVQaVpbPp9yIRw
	hPA8yEF/hLYxkba+K+oQrNZQzWJED0Y/O0YKyTkPbgOouapBeHmnKyW2y4Ugr9CrIt
	ICc8LltnBqvYitQJsx6Sipvydek5Tzgyv8djg7yo=
Authentication-Results: mxback2g.mail.yandex.net; dkim=pass header.i=@yandex.ru
Received: by web8g.yandex.ru with HTTP;
	Wed, 22 Jun 2016 15:39:04 +0300
From: Sergey Sorokin <afarallax@yandex.ru>
To: Richard Henderson <rth@twiddle.net>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
In-Reply-To: <6ef866a2-ba0c-4814-a2b8-fedd28be5599@twiddle.net>
References: <1466431017-123868-1-git-send-email-afarallax@yandex.ru>
	<ace0b2e6-613b-cc8e-aa05-f583ed43857b@twiddle.net>
	<44881466444025@web26m.yandex.ru>
	<6ef866a2-ba0c-4814-a2b8-fedd28be5599@twiddle.net>
Message-Id: <666431466599144@web8g.yandex.ru>
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Wed, 22 Jun 2016 15:39:04 +0300
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 77.88.31.18
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PATCH] Improve the alignment check infrastructure
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
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Claudio Fontana <claudio.fontana@huawei.com>,
	Alexander Graf <agraf@suse.de>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"Vassili Karpov \(malc\)" <av1474@comtv.ru>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JHX7Kw+kU2L8

   I have sentA the second version of the patch.

