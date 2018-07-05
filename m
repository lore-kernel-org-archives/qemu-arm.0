Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1736105wrq;
        Thu, 5 Jul 2018 08:28:57 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfVR2GIYAivbR4YSX4l+vHx9Sv+BfTm8gsGtb272B0jHgNrxTlRocAaRkeCa6SCezEEDZYs
X-Received: by 2002:aed:38a9:: with SMTP id k38-v6mr5639813qte.30.1530804537432;
        Thu, 05 Jul 2018 08:28:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530804537; cv=none;
        d=google.com; s=arc-20160816;
        b=sm57E81RlORBl9bLaxaCMLBJ7Icxm4rjWsg09Yl61oalvFMQbhQsuc3sKaNGYuPS4s
         6efz1H0ZVLvG+IVY7tAnPGsH0Mq9Q5Q1JUeWMU79LKC0XJwH1ystN77VuHPIiL9UET8d
         KOCc0TwDnrDsQdNFp5pzw6SL9Zs6/4zCwQGJgCipmq46+6Hhnsa6c9+oErW58wnl/HZV
         CFhlD5YDykLndikZuTbbQJudU92u75J9DbMKkq1HDicxxP8Xz5PmMBgl98xbO1IbAs+K
         By1961LH+1RoItzsG4AzDTRg7r0FQazyyatSW6N65ssGoCm6TpjZrmlxdFodj3UWQ8ow
         Fw5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=PHue2EOE9cnGQ8jnhqbxRFQ3HalBrMM7522mlWrA5xo=;
        b=B1ht7ITJx79sUZIBeqZMRH0FMs1U4eTKvk83kVE9AV6JqPHKmWroPqEVAAg+rBedb0
         K6hT+TpNFLpNwSgvuOKM2sFut7S23ySIVkfQdf+72blaux4uh04O/PaV+HoL1J5uVElt
         XWHR2x+QqnTw0+VYzDAKlNbaXvXYv+8zBTObyODRP/FY+fxOLT/+jYC2uJlCJxaQykgO
         uvhlI4AcjEsJBFuIiupTK0NLVObKmBrw47tCLDTp6YXdQ60Ctr48codIviyzP+a3lFkm
         gtdzoj7ybcB7uu6jOCwTkWo8OuHt65wrekHBI0Hy/z39sWQtJGOzpXTbZFkmFdlYU58Q
         CZww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kBTtFoc5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n39-v6si5339075qte.96.2018.07.05.08.28.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Jul 2018 08:28:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kBTtFoc5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53302 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fb6Bk-0002G8-Vk
	for alex.bennee@linaro.org; Thu, 05 Jul 2018 11:28:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46247)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fb6Be-0002Fv-5m
	for qemu-arm@nongnu.org; Thu, 05 Jul 2018 11:28:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fb6Bd-0003YN-GZ
	for qemu-arm@nongnu.org; Thu, 05 Jul 2018 11:28:50 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:36376)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fb6Bd-0003YA-AL
	for qemu-arm@nongnu.org; Thu, 05 Jul 2018 11:28:49 -0400
Received: by mail-oi0-x241.google.com with SMTP id r16-v6so17653101oie.3
	for <qemu-arm@nongnu.org>; Thu, 05 Jul 2018 08:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PHue2EOE9cnGQ8jnhqbxRFQ3HalBrMM7522mlWrA5xo=;
	b=kBTtFoc5Si2eQ9ZiPzyMyBXgfgOftNVCqqjBen3nY5UtpYnEKVOh+K5U4+gUbopDV/
	NTAKapJUbVPBsiKscuKXYYLuS3i2ckJaT+yaHI15c07hCCjQHDUnA2zoXvvLlu9wGppO
	Hkd7hH4o0OsuQScCjPuCTaqJGYdazQ7gS4Ido=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PHue2EOE9cnGQ8jnhqbxRFQ3HalBrMM7522mlWrA5xo=;
	b=NbOKgAYoCXfV03dHlr+4k6HZsLoMSULOsKT9xjJfET2X0fTNQ/bqB0cNhcbGwLvj2n
	81FHCRwTGJpPv8DnkFXq8sSGuBMSb0H9dLVoJIdMtQTdhSvhLS3f9QLHqIDGU7UjTEb4
	fAicdlYuVSMMNP2SPW8dHn7kPpLuWe2+UMpk43wMtY90IdBnUqiNCDMKH3itiRnjNDRX
	3gCjxvC7ZmjCUPXMyjbCsCGtmHuitPw+0FSKtYFuGra37CLE4tM7ewJeSRLyuEMfMIxc
	9iyFVXQ6b9ztqEqbW9MKHsm2TRjhTFhh47Tr73DqKgRQ2i4BiZACn00OUqkYVn5Z7BYo
	paAw==
X-Gm-Message-State: APt69E1p2aY/+A9p7kGd8Bb8TZhaqNnbH0JLSOX5BlHu42w8DUg5pfv0
	ITDjOsKE8AcjrE5WPnLmwlrGby4/m4QFilkCcKoFtA==
X-Received: by 2002:aca:bd84:: with SMTP id
	n126-v6mr6800063oif.337.1530804528597; 
	Thu, 05 Jul 2018 08:28:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:554d:0:0:0:0:0 with HTTP;
	Thu, 5 Jul 2018 08:28:28 -0700 (PDT)
In-Reply-To: <20180630091343.14391-4-stefanha@redhat.com>
References: <20180630091343.14391-1-stefanha@redhat.com>
	<20180630091343.14391-4-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Jul 2018 16:28:28 +0100
Message-ID: <CAFEAcA88Hv=kd3QV+EsqfBXO9+v4G=YqPcHDBOXa1pR0UmN=-g@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [PATCH v2 3/3] target/arm: add "cortex-m0" CPU model
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
	=?UTF-8?Q?Steffen_G=C3=B6rtz?= <mail@steffen-goertz.de>,
	Liviu Ionescu <ilg@livius.net>, Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TL7+wpA0J3qo

On 30 June 2018 at 10:13, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> Define a "cortex-m0" ARMv6-M CPU model.
>
> Most of the register reset values set by other CPU models are not
> relevant for the cut-down ARMv6-M architecture.
>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
