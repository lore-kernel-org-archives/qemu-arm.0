Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp3167861wrw;
        Thu, 8 Nov 2018 01:39:29 -0800 (PST)
X-Google-Smtp-Source: AJdET5c3+cWZHd9K9tGkNlmoL62QH6m2mJa9vLeiJxBrTpgt5941wMecfjDzrcsn6VSHvXRJBnaP
X-Received: by 2002:aed:39e8:: with SMTP id m95-v6mr3626965qte.30.1541669969765;
        Thu, 08 Nov 2018 01:39:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541669969; cv=none;
        d=google.com; s=arc-20160816;
        b=Eoqk4DjMSiz/J4DxSpFkPtQl8THeQ7iVgGyqOWiYRsZPQmciYRUPWra1BWAGk67glr
         VlQr+mC3Y1643zgWNQt9+IEC4IHrNywYSzfiMQWwWDrnrDElIWovgqEZjoFymcDJC8fb
         1qRbOW1OwvVrJPpecIMJX0vPZ4GsdsCuYwyTgTInUIG7lk0vZIZZ5CVbrByokf0Agc2a
         /+xKi0OnnIzDM27ho6jhdEkTIfssaHkE8J7UYNlHEjCHkFKT1ihU/AQ/qaxhWi2WR1KA
         nPBiaOhiVZtfEE6ASonlcbqJ5scOXXHVS0Tl8JMCU9xMFwFpQdY0ol6m03Qq8bw9NH0J
         HPhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=CAwTjtKvUjBlOwClxAXrFMf02ftZg15PWqF65UpD67s=;
        b=IZIGew0I4IK1eM9KwNioWNOqJdzqGVNKAEzsS1v2S3t9Byj9JS2Cj3iuvQthfkGHkN
         ZPcFLacB0eoKKO3C43rUFbEKiI/vA57zdA66S68IzGS1sf8ZyQg9cxOqV9ioJvdjMN+v
         MLjWxwPtnOh5k/wBLggyjnHWnwmZ+A2L9fultaqKWKduojHwDWNBN7cxh9sdAo3mt4B0
         FHE/rbar2Ls8PbmPjMrib/duLXwyLesTmLkZqLAJtzkShECj60rUtR/A0t2Wl5lX+LHo
         k4AfCn0OCjC7l/ROsD/byQntsJBbZyBjRCdRHw9XkJ1eUcOG9HPYxhhljNruhnyGYgcX
         7BWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JOAr07XA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j49si2779716qta.341.2018.11.08.01.39.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Nov 2018 01:39:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JOAr07XA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55387 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gKgme-0000Zb-MJ
	for alex.bennee@linaro.org; Thu, 08 Nov 2018 04:39:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56541)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gKgmT-0000Xq-Iv
	for qemu-arm@nongnu.org; Thu, 08 Nov 2018 04:39:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gKgmS-0006Lw-MF
	for qemu-arm@nongnu.org; Thu, 08 Nov 2018 04:39:17 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:38081)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gKgmS-0006IV-De
	for qemu-arm@nongnu.org; Thu, 08 Nov 2018 04:39:16 -0500
Received: by mail-oi1-x241.google.com with SMTP id v83-v6so16383881oia.5
	for <qemu-arm@nongnu.org>; Thu, 08 Nov 2018 01:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=CAwTjtKvUjBlOwClxAXrFMf02ftZg15PWqF65UpD67s=;
	b=JOAr07XA72mF3bv+czYaObm5OFEdInMMCtxk3DLMVDQS9A2anmahid3PS9micE2Mba
	lSyCXt2O8BR6WD7pJyPnlzoRdMFnksSUx8MmY7DESDjvXbyfNdVZB0OJAX4TdPxg+4C+
	9qTuuE34VeV4KfVxOw4tpWhqXOTwGoQUdVUsY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=CAwTjtKvUjBlOwClxAXrFMf02ftZg15PWqF65UpD67s=;
	b=hWyBXhXWe1gC9DT9e2mYyGl64jEp2mirsZ/hMP1o74iRwjXXYs6Es/NrlNHoDjNgCX
	2ESjd5Jgzk47YJ6KR9lPfl1bvCd3ZdBFE+NvJ2FD4IyeDu8j3kcQXgdFSgcKW4YslXg/
	h2w+SppNgtgMlK0kmnjNCpWDMMlZRK6ZhD6ZXuic7BCZCyn9YNpYC1Q5f2EhxIXPYS6P
	3nAJAIMISP/9VcZVmOT4vZqE09b88ayq/Ja7QkZ9Fjb0TsrfIRPMCLairBv/EgjcgWIy
	+twztwo8YrddMQljtLqJGaWGRNjnmZ+UpzuEHDRpfBAMIwLFTJqN/7DghXeioQmugY45
	OrRQ==
X-Gm-Message-State: AGRZ1gJ47TnDzWjWz15+EDuOMG6DUxxIdN70zMr/UZHVDcL3yi/PY35U
	qFkOFrLj2BpOERVWtyTv6yVJ20WO6EmxFG2r/zWDLw==
X-Received: by 2002:aca:fd12:: with SMTP id
	b18-v6mr2263030oii.337.1541669954804; 
	Thu, 08 Nov 2018 01:39:14 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP;
	Thu, 8 Nov 2018 01:38:54 -0800 (PST)
In-Reply-To: <467e77d8-48af-5361-3e31-b9eac79d968d@redhat.com>
References: <1540495397-88089-1-git-send-email-peng.hao2@zte.com.cn>
	<1540495397-88089-4-git-send-email-peng.hao2@zte.com.cn>
	<467e77d8-48af-5361-3e31-b9eac79d968d@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Nov 2018 09:38:54 +0000
Message-ID: <CAFEAcA-tkcsCFXQZmZyqLDXQKvXX9Am0dgNviVw=Ccq6tX+w_A@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-arm] [PATCH V4 3/5] hw/misc/pvpanic: Add the MMIO
 interface
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Peng Hao <peng.hao2@zte.com.cn>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4SauR4ZdoVQ/

On 25 October 2018 at 12:38, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
> Depending of the response to Peter's question [*]:
>
>     I'd also like some confirmation from folks more familiar with the
>     current state of the art in guest-to-management-layer communication
>     that pvpanic is still the recommended way to achieve this goal,
>     and hasn't been obsoleted by something else.

Paolo? Stefan?

thanks
-- PMM
