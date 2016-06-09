Received: by 10.25.27.66 with SMTP id b63csp462508lfb;
        Thu, 9 Jun 2016 11:35:51 -0700 (PDT)
X-Received: by 10.200.36.89 with SMTP id d25mr11653352qtd.74.1465497351495;
        Thu, 09 Jun 2016 11:35:51 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x203si4108569qhx.53.2016.06.09.11.35.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Jun 2016 11:35:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36405 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bB4o2-00057z-Md
	for alex.bennee@linaro.org; Thu, 09 Jun 2016 14:35:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49501)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bB4gt-00005C-H0
	for qemu-devel@nongnu.org; Thu, 09 Jun 2016 14:28:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bB4gi-0002L8-KP
	for qemu-devel@nongnu.org; Thu, 09 Jun 2016 14:28:26 -0400
Received: from mail-vk0-x22c.google.com ([2607:f8b0:400c:c05::22c]:36186)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bB4gi-0002Kw-GJ
	for qemu-devel@nongnu.org; Thu, 09 Jun 2016 14:28:16 -0400
Received: by mail-vk0-x22c.google.com with SMTP id g67so66846238vkb.3
	for <qemu-devel@nongnu.org>; Thu, 09 Jun 2016 11:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=AewrCvEe0mdKh8VewabD5GnyDKTl5cJae4T0x06bTbo=;
	b=dKALWGDGwDPrhEaG2Au3FJMW36VbXKFmcYnwRaaV9QUeSIsYoxnjKnTojRI1eNjlJ1
	JtyQsTd7TFTYa0NA6m29ZJojdN21PSm+KCRZeD1N8pFUtLjITe6Po/m/bWLzJ/v0xOM3
	Qe1A8Wjrvznv3h0soBTZEwd3+fs55k5F5LBjY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=AewrCvEe0mdKh8VewabD5GnyDKTl5cJae4T0x06bTbo=;
	b=EhawX2zvlSN52j17r1a+tm/QBTJwwTTv5PY7lzqLhPzDSM5nBkCqRFavkliExjPGPi
	86Tlx2+Ibcefg0a2udtB19qwfd0ERGCq0zy0HlWulZ73MJHOBIyBgnIqHNqyi/EaWiiz
	/nourr8SSyrFHfidsBsW9s2PwGqqXGRDz8WXb6JqrBsTdA0AX4nWwUBaGj+70FMPH9jj
	OmvamivkPJxV72DCwdU0Hy82cnAYi5GHDrFYnRyex2tOrBG/GOBEN4gSkpR9gVhN/oyT
	v6UpUv5rkYrwkYRUwp1uSs6vvvXTUXGAUFr4PxXWjEZxk5Z4511hhu/Tw5tuNv6fQp36
	q4dg==
X-Gm-Message-State: ALyK8tISd0/AA8icax52tgZwSWQiszHO4mxJi572lHJ7UkBjfAV5rdBbgAxjvW0GA5RDyzH2qNCTMuvaV6kKWtDt
X-Received: by 10.31.0.6 with SMTP id 6mr5316408vka.82.1465496896100; Thu, 09
	Jun 2016 11:28:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.97.68 with HTTP; Thu, 9 Jun 2016 11:27:56 -0700 (PDT)
In-Reply-To: <1465410291-2971-2-git-send-email-drjones@redhat.com>
References: <1465410291-2971-1-git-send-email-drjones@redhat.com>
	<1465410291-2971-2-git-send-email-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2016 19:27:56 +0100
Message-ID: <CAFEAcA8LnC2Rf+6T73BJ7OyijEDtbTBb+=QKaf=HNU17p4rh3w@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22c
Subject: Re: [Qemu-devel] [PATCH 1/5] hw/arm/virt: separate versioned
 type-init code
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
Cc: Wei Huang <wei@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xmxM0MUNTdjG

On 8 June 2016 at 19:24, Andrew Jones <drjones@redhat.com> wrote:
> Rename machvirt_info (which is specifically for 2.6 TypeInfo)
> to machvirt_2_6_info, and separate the type registration of the
> abstract machine type from the versioned type.
>
> Signed-off-by: Andrew Jones <drjones@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
