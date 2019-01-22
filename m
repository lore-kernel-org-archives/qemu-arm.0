Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp7647056wrt;
        Tue, 22 Jan 2019 12:21:20 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4sAwPOwxEAoP9t7OZi//hWN+LQ7BuuT8FG5cSsvnHd36+0Vgh0QJgWa1xgD72Wb8JYYndF
X-Received: by 2002:a19:2584:: with SMTP id l126mr21042428lfl.69.1548188480557;
        Tue, 22 Jan 2019 12:21:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548188480; cv=none;
        d=google.com; s=arc-20160816;
        b=gvbaZPZm4/8/bvoi5hB/vbdlHT4jlIKjJ84gSTxd8GYSsoDIG65GRcTO04aEuxDcdt
         MLOlxYXGn4CKTw6ae9APDyVEF+Ql559V0OO2xli8ASUiRgxKWtk+7jIuANuOWfQqY74J
         e+MyxRxQLvTtNZZuVRrVqmh7Eu6HN/PmlbahCMVpfBJpsm9BITApt6p1j87s82w7IKPU
         UkBStesQnbIaGTH4JskwGr4QGVFERNNKGx+jzyhIvTJ/dQdDcdN5xt2qiMqCwPOBIblu
         F4Kp0NSjo3mmSZysFZuscF7pi6GsvR9NEakFz9+ws4kdPDB9DiG0kzVmu5n71h4RiO8K
         TjPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=Do4KrDISmazn1d2ZZzAlJ/eDZN8/KMFCpmDNaZliw/s=;
        b=H02x2R7UGlm518gQcmrsCvlUSF9HM0TFAau+u8Z1fAnI/UNECymTKQL/QFD2eUcvxu
         d0jY9fp2QNXZdm65lsD9EUlIcMX7CymuyyDgh1yU4o5uaC0pc86pY3ianaZgPRUSdl4J
         Z2bZtm192fGeD8OdZmzRqNPgohGYx8bzGjKdkibx7+/raZntQq8E9yTZDib4IsHgOyW/
         e5mazoc1QOqyMgNlZONEuDou0GArSQy4ZoPdz8v0bhjLRRu2FyR8GWN/qPJQfNmeMKyS
         zuJxWeu/ehdv9m0A8dBBIZ81aZQA9g1BKt4uJSv3ewdtvXYrJBHMTdYIepuqFlDjPqNs
         dvBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iCV27lF3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x62-v6si876367ljb.39.2019.01.22.12.21.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Jan 2019 12:21:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iCV27lF3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:48865 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gm2Xa-00089d-6w
	for alex.bennee@linaro.org; Tue, 22 Jan 2019 15:20:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36071)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gm1Tf-0000V1-JQ
	for qemu-devel@nongnu.org; Tue, 22 Jan 2019 14:12:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gm1Te-0003sS-Lh
	for qemu-devel@nongnu.org; Tue, 22 Jan 2019 14:12:51 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:41364)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gm1Te-0003hl-EU
	for qemu-devel@nongnu.org; Tue, 22 Jan 2019 14:12:50 -0500
Received: by mail-ot1-x342.google.com with SMTP id u16so24675729otk.8
	for <qemu-devel@nongnu.org>; Tue, 22 Jan 2019 11:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Do4KrDISmazn1d2ZZzAlJ/eDZN8/KMFCpmDNaZliw/s=;
	b=iCV27lF3XlspbJCfm4MrOEWtnYG4UddGAKixl77S7JaASZY4ElPrsxp/6M6rDf6CP7
	ueROw0TVWzJ+v4uGOTTcAzpaVj0Pd+bOUz2GCUNInwl2sh1bmgNBDlLtL+Z0mmjO32ju
	luMhmF6fChreGIat1zs+ntgi/dvZgfi7GtWRU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Do4KrDISmazn1d2ZZzAlJ/eDZN8/KMFCpmDNaZliw/s=;
	b=SO7E4qxKY2FVPQrfoSEWL+SmZaRRQS5RafTp3b7JYwOnLV6w649RtNHjAtXitYNB6S
	oyJdOX6Rz8KZBnDRt5s2sKrgQbRkhdN52Xm85ZW1HL068eE8+cYEdX2OCjMKHGQT4pRp
	ntj4qdtMiLc0bT+CdIquxCYvCs624JiYj6eDFYcvu3BxjPlYKSzC1cUm3uAZlCrLBJoN
	p3hdsv5TUfjmfM5DVtts88cqfhKUrqvU40rZmhyRVAMCfbkglLiD/BX1UGy4D9nNLHzl
	R0eGPuq+BlVKPpjRkEBYWmva7yeqYyb9XNe0VNhrKYCfZoSeYvYhR9FrLb1M5zi4WA3p
	JuUg==
X-Gm-Message-State: AJcUukeLIfmGBAAfxAfW41FStlNGKJeYRcAwjG93hnkNC4+gkXpPhG1J
	j9OD0Y5GG52efVERvKutN8cW6edioR+KUQXj9E5fP5hN
X-Received: by 2002:a9d:5617:: with SMTP id e23mr21017386oti.151.1548174886014;
	Tue, 22 Jan 2019 08:34:46 -0800 (PST)
MIME-Version: 1.0
References: <20190120143452.21683-1-stefanha@redhat.com>
	<20190120143452.21683-3-stefanha@redhat.com>
In-Reply-To: <20190120143452.21683-3-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Jan 2019 16:34:34 +0000
Message-ID: <CAFEAcA94tq-8EMOewoxAzgg0i+sbf-+giMrThyHEBY2NawqDjQ@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-devel] [PATCH 2/4] hw/nvram/nrf51_nvm: Add nRF51
 non-volatile memories
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
Cc: Jim Mussared <jim@groklearning.com>,
	=?UTF-8?Q?Steffen_G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Paolo Bonzini <pbonzini@redhat.com>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IcL2KjCnMuDj

On Sun, 20 Jan 2019 at 14:35, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> From: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
>
> The nRF51 contains three regions of non-volatile memory (NVM):
> - CODE (R/W): contains code
> - FICR (R): Factory information like code size, chip id etc.
> - UICR (R/W): Changeable configuration data. Lock bits, Code
>   protection configuration, Bootloader address, Nordic SoftRadio
>   configuration, Firmware configuration.
>
> Read and write access to the memories is managed by the
> Non-volatile memory controller.
>
> Memory schema:
>  [ CPU ] -+- [ NVM, either FICR, UICR or CODE ]
>           |      |
>           \- [ NVMC ]
>
> Signed-off-by: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  * Fix device-introspect-test segfault due to missing owner when
>    initializing FICR and UICR memory regions [Peter]
>  * Fix off-by-one assertion checks [Peter]
>  * Fix missing whitespace at end of comment [Peter]
>  * Clear UICR on reset - we'd need a block device for true
>    non-volatility [Peter]
>  * Use memory_region_flush_rom_device() to dirty/invalidate memory
>    [Peter]
> ---


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
