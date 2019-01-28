Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3268775wrt;
        Mon, 28 Jan 2019 05:22:30 -0800 (PST)
X-Google-Smtp-Source: ALg8bN42iWLnUo5EG+uTp3ceJ0C0/eY8x2vlo0BT/JILxA3Oin8xV15yzRkfJiMv2fBDNgCSwc62
X-Received: by 2002:adf:91a3:: with SMTP id 32mr19830398wri.99.1548681750898;
        Mon, 28 Jan 2019 05:22:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548681750; cv=none;
        d=google.com; s=arc-20160816;
        b=gPuwRoXd9vsc8gdJBTgXRFdn+17sH9iU035z8MRgODS3YIMGP6uX4xW4K7z5beAvyd
         z/vKTfYrcYwcjA9KLJd5+huB3EAvrk4Ujgmtl9kDRlOmCS4BSz3BvrM3cRh/S+R9RfiP
         D52HPf49K8gEwW6VhyCfgfcQ3Rl8QWez1c6hZ/nM7MzxR6Z/rivVruEOq6jrWC2qIp9k
         Q/Tu25m6kn/2CloOjY7TjalEREnqNLtnrRMIKutdhX/aBBfc2VTeFjsOtlliBuuLfSJQ
         F9GAdPYgyRNMCtmQft7r0o2girAKCkj+Iwmg95X9B+SduOjT7GCWdoiQGqmKJ/HoVyU9
         u5Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=ZGytNZf7uLA14XHLQk7vezKeaL3f8X3F1SJTxAqFMtw=;
        b=m1EWVLL6VUlI3+STK/E8Pd6T/5ptbY4DO+MJN/rwzZyIL5wttBHC1KxMBu2ALvHhYJ
         IujF+tQjFYvSpua4uKZiPDyTsCGG1gPf0qHI+9L50daJso7XibdSFxPTUp6HC2ydPAcb
         qaRIFELJvy057L1TJnNo83mAFL3FwVR80upVcsFa/ddBQhuBuE9kI3jNk6vxtM3le3s5
         on7Y6E8A6OrtNfpQUvpyQh67q+mFMJ1UDMjCLCDx2uQ3uGBO24/Jl+9SmwlI3Y6Q6gs9
         eXpXUC6VHIgmcI+dUEUilbcvZFpCrh7E+FPbicn9gQHZ5Rl8DItMVOTqON/O+W+0S4V5
         i/FA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=W41Kh+GB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t5si37690194wmb.51.2019.01.28.05.22.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Jan 2019 05:22:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=W41Kh+GB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:60153 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1go6ru-0006xu-0H
	for alex.bennee@linaro.org; Mon, 28 Jan 2019 08:22:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55872)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1go6rj-0006xg-V7
	for qemu-arm@nongnu.org; Mon, 28 Jan 2019 08:22:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1go6rj-0003P1-3v
	for qemu-arm@nongnu.org; Mon, 28 Jan 2019 08:22:19 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:43000)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1go6ri-0003Mk-Tr
	for qemu-arm@nongnu.org; Mon, 28 Jan 2019 08:22:19 -0500
Received: by mail-oi1-x243.google.com with SMTP id w13so12945960oiw.9
	for <qemu-arm@nongnu.org>; Mon, 28 Jan 2019 05:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ZGytNZf7uLA14XHLQk7vezKeaL3f8X3F1SJTxAqFMtw=;
	b=W41Kh+GBxZ8Ejdw9RvF1tyH7XXV6cq51O3BB1pwwLdChzVY/NDU8735ohzhSsBfZVZ
	nW+MiV0gEHvfCQyq668pyatYRefF4bl9QLccFU6Cmwqz3Dp4DYkPK3Eh0w2Cvrx7JqOW
	yQCZYn0mZFICvIrJ4rrYdGDMEu7GwV6PvxCZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ZGytNZf7uLA14XHLQk7vezKeaL3f8X3F1SJTxAqFMtw=;
	b=KeUZjg1Zl/U7IXy3S4+GA+f5uIctfsYwFjQ8+FiKPven66nw3oBFlO7X1KBZ7O8FR4
	KHY2wkHTiifDAWi/w6zGRKLuK493GbGD9cOaA9O+ZCmE0iS5hlvRa+h/iUjXHfTd9P6S
	qEq8Vuc6LURFp6W3x+bUEqLMEEUvaUEeNgbddpsqW8Qucmn/8z0SBO2ATR91EYkSRUc9
	vUOV5msG/Jgp3yddckAJdFAeD9CUiQ2fN0ajS+FUoIslJs5sZhLhyC23oV8oBmxCecPS
	S0cCrMLTkoluHW61NK7OydFsLLCkMPwsfTVc4iyFqesm9hcEUsnPfNE1NarR3JUQSi/S
	2nzw==
X-Gm-Message-State: AJcUukc8fy8QJ5624ItR7edbDEXdUj66YqcNAJHVCEN5gABQmRD1/oTt
	5F85odKl5SbE1RYkNwC9NKjbdbsnyFDh0mqXCA6nig==
X-Received: by 2002:aca:1e17:: with SMTP id m23mr6230193oic.332.1548681737557; 
	Mon, 28 Jan 2019 05:22:17 -0800 (PST)
MIME-Version: 1.0
References: <20190124141147.8416-1-stefanha@redhat.com>
In-Reply-To: <20190124141147.8416-1-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Jan 2019 13:22:03 +0000
Message-ID: <CAFEAcA_-BJFvz+gynbPsWpTvT4hiOsPPN6Ten3tn4v5CMDcuMg@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-arm] [PATCH] tests/microbit-test: Add tests for nRF51 NVMC
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
	=?UTF-8?Q?Steffen_G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	Jim Mussared <jim@groklearning.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Paolo Bonzini <pbonzini@redhat.com>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ajJzxBdXjzju

On Thu, 24 Jan 2019 at 14:11, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> From: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
>
> Signed-off-by: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
> This resolves the conflict with Julia's UART test series due to
> global_qtest removal.
>
>  tests/microbit-test.c | 108 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 108 insertions(+)



Applied to target-arm.next, thanks.

-- PMM
