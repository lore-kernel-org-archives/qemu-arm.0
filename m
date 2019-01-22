Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp7645137wrt;
        Tue, 22 Jan 2019 12:19:08 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7m6n9Xfy1ZhYzkDRQlAV7CRitTiF8xJfiUYAMb25zr9cxAwuhQ+e0BRDYCE8Z08+MD7Utz
X-Received: by 2002:adf:fc09:: with SMTP id i9mr31918456wrr.299.1548188348782;
        Tue, 22 Jan 2019 12:19:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548188348; cv=none;
        d=google.com; s=arc-20160816;
        b=bMkWfq93pKFZJSbnDLkBVLW2E056fm1RK5qe9NX5h3hvAJapFjMbw2/TJACFdfR702
         /8hVkpU1+1bfiHBarNyIrrO9DTIjjA5MKvOZGdicLcyl+szzV7zUBe0+D7LAWfSaHL3d
         9l5BD8MQakc1i1kn5qM1/J90Pu13njy8HjdiBVceVx6Pg94fgYAKRQJFc9GdzgVAxR9P
         mhmX+R6XuQqdkkIx/tvLWF541tnG4/BvDgv9x0eNP/hKWni+PY/FZ02FyEdHj/5rsLA+
         AyMqOaZGkQXGX/K50p6oN0U2zytq93Qff5q0iXQm1UoWk04TNIKE9WNCRVYDlrXSTOGQ
         RFRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=ji2G27Bxfj7L00m3qBb6ZtKzNCZ9f1ZmUhHQaR4m6BE=;
        b=eKtr/93atkYSRtL8SbXkduk5yCuSzXuymliTjlHHeq00SXKqjv5BiDi16oNv94B4Kc
         ha01WI9JDjGtZY5WXWD6UCESUq+ZPjFsFMBjePOgZxT+DPgeGrmUwZZs8oozoQvTdlBh
         8ZQhq2hYASZpfruzy5vbzwO1WsqJDxKvrYyLKN8nHmLlYldq0Oa5b9U4Q16xbpuThrOq
         dGvPnfPjB+8+wDJyD5GWv0SAa0DIj4DBe7jJLeuajr4NARjEnapQ2MqO1GT2Tl9vc+ge
         Ije0i1ulALtAYETcAoKE3vVWXeSuPBbvPSnMRqOFKbiD/DJkDTXL2/2njAtuGkQ3PHAZ
         p9vg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DyREvDPW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x17si73235979wrq.288.2019.01.22.12.19.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Jan 2019 12:19:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DyREvDPW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:48810 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gm2Vn-0006VP-PV
	for alex.bennee@linaro.org; Tue, 22 Jan 2019 15:19:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45024)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gm1nK-0007fN-EY
	for qemu-arm@nongnu.org; Tue, 22 Jan 2019 14:33:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gm1jz-0002Sn-1i
	for qemu-arm@nongnu.org; Tue, 22 Jan 2019 14:29:44 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:43797)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gm1jy-00025r-Pp
	for qemu-arm@nongnu.org; Tue, 22 Jan 2019 14:29:42 -0500
Received: by mail-ot1-x344.google.com with SMTP id a11so24699656otr.10
	for <qemu-arm@nongnu.org>; Tue, 22 Jan 2019 11:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ji2G27Bxfj7L00m3qBb6ZtKzNCZ9f1ZmUhHQaR4m6BE=;
	b=DyREvDPWPzk4oQlepHc0jAoYhu+Cgxmqds9VnmAeCka2Vf82rIRFuI0xwU93XeLG/J
	NtFh2NZUL0xUwgFvjvPkb38vmosC3+48Se+tgCwitY+/urLLNWTENSmxVkwcOZyxu2jJ
	o4oyw0J8cagzuvxwW7l+K7JRE4j0xagd9gslY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ji2G27Bxfj7L00m3qBb6ZtKzNCZ9f1ZmUhHQaR4m6BE=;
	b=OP+FDLowpmycECLXSaYjGARpRZ8JUzkCOXhYx5fiXTLBJ8qSBV1qGI1xyKrJuFfDpW
	AhG0/VDhK4SGd6GaTE5I+EB+V3sb9pvKBvA9tUGuw6or3J0Om+sko9IlIdmsLap3i5mQ
	+wvMEPqAdbPP9Dye7K6+JDgSrIMwrMMT8J9R8Z43bqQl7YboeaaxbYLLFlvr26PshLgp
	EJrRrqlmctnsbmTSVPcLUyNUdIG3ZPtIJ8a9lcnpIEP/JT5cbS0iv82LGnRbMoiUkW5k
	7Q7lNWE5luFBO7LFu1qKKluexT2MYa2eiPnWxqmqwLIWowbKmqLvAH4c+ogn2UHUGYz+
	8d7g==
X-Gm-Message-State: AJcUukc7AgywLwHE8ftuX+uEpEfIvbqU53AQFAOW9RN5IR26aBidRn0Q
	7yIAkNPgRK7qAlxgyfBy+5ZEtbFfcy4lGMg4JmVVFFcb
X-Received: by 2002:a9d:5617:: with SMTP id e23mr21019171oti.151.1548174931578;
	Tue, 22 Jan 2019 08:35:31 -0800 (PST)
MIME-Version: 1.0
References: <20190120143452.21683-1-stefanha@redhat.com>
	<20190120143452.21683-5-stefanha@redhat.com>
In-Reply-To: <20190120143452.21683-5-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Jan 2019 16:35:19 +0000
Message-ID: <CAFEAcA9Y=g4SapAtH50Twxmj6L92SARNUY79JgP_V+dV7EMoUQ@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH 4/4] tests/microbit-test: Add tests for nRF51
 NVMC
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
Cc: Jim Mussared <jim@groklearning.com>,
	=?UTF-8?Q?Steffen_G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Paolo Bonzini <pbonzini@redhat.com>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WlKtXEQ4jchE

On Sun, 20 Jan 2019 at 14:35, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> From: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
>
> Signed-off-by: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
