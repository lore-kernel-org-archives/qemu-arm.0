Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5481503wrq;
        Tue, 12 Jun 2018 08:43:19 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKL7Q/byFsgycarUf1Ikz/vRNIZT1KNWW+34TYN4N2lYLE5CFYARpVV/pSebUa+kBRwwKAuR
X-Received: by 2002:a0c:e610:: with SMTP id z16-v6mr985741qvm.246.1528818199637;
        Tue, 12 Jun 2018 08:43:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528818199; cv=none;
        d=google.com; s=arc-20160816;
        b=EtjYDMbe3SwGWMRgTP0R7+ca4oIVWr6XZQY36lcW0Z6vuUv5lmUlMf9EyJWyLlWgpu
         fuQ9QgT+oGrmMjdqUbL2iSfIWQcrSHA2Xl13doYlsqK6iK0iz/bMwcaUg+unBz1Y+/cP
         EbPqqwnjOUQ86ez+N4QIs6YqCkgVkHe4jA9BMpCUIMcDgVZuAKpRvxhT4DQEoPc8d4gb
         W0H9hkO20Bf9DWLxKu86WVK7eyDnn1RMjNOqszTKjQKFL+TMcj1Qe/WDOmfCnA2t1/pf
         CuENWW0SpecG4fApmR2tNrpysw7Kdn1Fyaa0bzhjVV4jo159Yl9+RdbWzsIeP5h/BDpW
         MT5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=eYUAzgPu+F3gPCHisWvB64gCFyq1mH+/BukWwyRXjyY=;
        b=vxgZ+BdPYcWG9ECPidZt4sNXU9QrzYMe6x2b/A0I9+JkDFPyJiNSnuwJL5iyrP59mY
         aLWeFxt27AUAvQit/q/gt3ueiGGH0AcXDdMlT/Z18ht45kD2YWVmb/Od4laNYsbjb+41
         ifUwY2WgN7Aq0DnHcoFek7dij6EJ2uYZyHY8DEargjBtZBlTRLFtGfkIK5BIgUHiRv7U
         5sKI7ovLl1hf+OWA/htvWSa3mISDbR/kVrFQ8id1Ah+tUi865ROxGE81qQ6Ey9VD1wM4
         QIggvhJq5EcyyovXvzW6PhocDkG2/gKE5OVlqwVW9YbCFsprh1Lfqay5ONnoT5nOILQl
         zfbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JR9363i3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i23-v6si463575qkh.374.2018.06.12.08.43.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Jun 2018 08:43:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JR9363i3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56981 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fSlS3-0003Gp-5C
	for alex.bennee@linaro.org; Tue, 12 Jun 2018 11:43:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44932)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fSlRm-0003F7-54
	for qemu-arm@nongnu.org; Tue, 12 Jun 2018 11:43:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fSlRl-0003J8-C1
	for qemu-arm@nongnu.org; Tue, 12 Jun 2018 11:43:02 -0400
Received: from mail-ot0-x231.google.com ([2607:f8b0:4003:c0f::231]:42213)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fSlRk-0003Ic-US
	for qemu-arm@nongnu.org; Tue, 12 Jun 2018 11:43:01 -0400
Received: by mail-ot0-x231.google.com with SMTP id 92-v6so28571368otw.9
	for <qemu-arm@nongnu.org>; Tue, 12 Jun 2018 08:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eYUAzgPu+F3gPCHisWvB64gCFyq1mH+/BukWwyRXjyY=;
	b=JR9363i38DMy0mdep57pIc+MP18hCOsjQ6wDZESY1dk1uMH5Tfk3D064V4FSTp+zwQ
	Smq+9mKkARm9sOMXTBFBZBXBQSqTcZFPMToGBg/DZbz5vVxnJ9mn+xL0KTrPVu4f9Jmh
	xk7HRn+GFtuJHL+1IRNfro0b/w4NOempyWxvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eYUAzgPu+F3gPCHisWvB64gCFyq1mH+/BukWwyRXjyY=;
	b=DkP0h4BffYwWv9NCT9sSFBx29X1DRiPkx/P/e4+MvljqgofGz/CbmFo3GgsV4w78Le
	fW8pjzV/iR6I64pVhH5eru2yI66XbGWZ9rWwRVfhlf9Ec7irkCpyWj5lOCqG7ntkJWFQ
	JRYAdUuP5pPwITDTIXq4U0tMTGP+4CBWp83WsjDeHDcEa5dW9W8N9Ojyheyismj5kWvg
	H6oRFYijEGXtyvXB4pI4HGQRm/BGlAK9R9BTko+qvPMMuNiJQJBMFhrhEeSkLhx1Bp+t
	xvGPvu/QAe3j3vp8/Sx4I05a1IaIgeIV4M8iFHiogu0C7ASdzHXAfaJniwjErduorkiJ
	6OPQ==
X-Gm-Message-State: APt69E1N66wne/JMkWFp7ZEOe1ZblGdsYR39a0+RMRp0pHQJSYh0UdCM
	2Rfldv8jMzgDd2vZdxL+6vGZvHg+YPx6eZ43d1onog==
X-Received: by 2002:a9d:34db:: with SMTP id
	t27-v6mr690307otd.316.1528818180187; 
	Tue, 12 Jun 2018 08:43:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Tue, 12 Jun 2018 08:42:39
	-0700 (PDT)
In-Reply-To: <20180612104430.25745-1-kraxel@redhat.com>
References: <20180612104430.25745-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Jun 2018 16:42:39 +0100
Message-ID: <CAFEAcA9SWjaB-CxwJTH=jtkw6dYdWNhhW40v+fnz+9vZXzKF8A@mail.gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::231
Subject: Re: [Qemu-arm] [PULL 0/8] Usb 20180612 patches
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
Cc: Corey Minyard <minyard@acm.org>, Alistair Francis <alistair@alistair23.me>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Li Zhijian <lizhijian@cn.fujitsu.com>, Jason Wang <jasowang@redhat.com>,
	Zhang Chen <zhangckid@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0RirGPFMOVLX

On 12 June 2018 at 11:44, Gerd Hoffmann <kraxel@redhat.com> wrote:
> The following changes since commit 2afc4e3df80d947dd1bd42ce80278f591b35c74a:
>
>   Merge remote-tracking branch 'remotes/maxreitz/tags/pull-block-2018-06-11' into staging (2018-06-11 15:31:20 +0100)
>
> are available in the git repository at:
>
>   git://git.kraxel.org/qemu tags/usb-20180612-pull-request
>
> for you to fetch changes up to 3c969a6022438cf59de10d2dc3c58f4807788f98:
>
>   usb-mtp: Return error on suspicious TYPE_DATA packet from initiator (2018-06-12 12:08:12 +0200)
>
> ----------------------------------------------------------------
> usb: bug fix collection, doc update.
>
> ----------------------------------------------------------------

Applied, thanks.

-- PMM
