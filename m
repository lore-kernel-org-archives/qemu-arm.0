Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1019843wrd;
        Thu, 13 Sep 2018 11:40:02 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZPRqnt58wqOfmudQLkaoaa6ScxKpiiA0YBflxALDuBDgpAgBBW1CkxQOzqbfvwg+E4if+H
X-Received: by 2002:a0c:9281:: with SMTP id b1-v6mr6371559qvb.45.1536864002751;
        Thu, 13 Sep 2018 11:40:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1536864002; cv=none;
        d=google.com; s=arc-20160816;
        b=hUeRLW39i1C7ITL7aD9Qr7EDbGlUfjGjijqCxnr0MenejR88t1Remlc7bmZC4v5SbL
         hqDwoulaGQD0cqXcEGuQzJy9hFSzSJZyR9gq/7Z0r7J12acPsotQBG/3J5Apat0mZ50M
         TDmmABPemfZLVaN19kwoDxQ7QqLJOaPxjofInKKH43e0LOoWOPB7DoavajtkzZI6esD9
         CDjEUrIebUEdc9V5LT2qiZTCva/78BTQRYmwQSMcRKgyRZ7DCWufJ6gBH5EQCcLucuju
         z7+y/ziFoz6+h3ACoI7t4C0G9j4nZWWPzncXexB7nkJb+lDe1V6dYaGjxe+dd5HP8rxE
         W4TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=/fKUzftmUnWdnKpH2OIZiBpkxi4xxLqjIsfcULsUV+c=;
        b=o4krVE/38c7BhD33XYvyzZS2t9TR8RshMbmUfXpI8WZpOOwJfNvrIFXbLnxG1UDo8F
         OYudyzxPK757SiawNbZcHlKIGQvQRh1QQk6mNPRcTD5SlmHGlxsUqF+GX5csCWzo9siZ
         LqNVf8V47iIzPZrBPNdVvQ4tjhKMdanreI4oxTMBQMXNXiflttA6ilP89/OQlzFVEUft
         JcMNhhGpYDBKd/GBr2E9lAlrUd18iJUpGBTsF0Vaczr3mCMW9CfWUGrL4KbDMknmQqS9
         QToZ3Wud6sqlq4pZmYAS6xQ5qYZXg45WctE5FamcibOoGzsePxTbmVVD081NrnlWMBWv
         e+DA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i+GaRKsY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l62-v6si92841qkb.0.2018.09.13.11.40.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Sep 2018 11:40:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i+GaRKsY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43891 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g0WX4-0002no-AL
	for alex.bennee@linaro.org; Thu, 13 Sep 2018 14:40:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33806)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g0WWx-0002nT-Gu
	for qemu-arm@nongnu.org; Thu, 13 Sep 2018 14:39:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g0WWw-0002jn-OA
	for qemu-arm@nongnu.org; Thu, 13 Sep 2018 14:39:55 -0400
Received: from mail-oi0-x236.google.com ([2607:f8b0:4003:c06::236]:42719)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1g0WWu-0002Zb-TH
	for qemu-arm@nongnu.org; Thu, 13 Sep 2018 14:39:54 -0400
Received: by mail-oi0-x236.google.com with SMTP id v198-v6so10397403oif.9
	for <qemu-arm@nongnu.org>; Thu, 13 Sep 2018 11:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/fKUzftmUnWdnKpH2OIZiBpkxi4xxLqjIsfcULsUV+c=;
	b=i+GaRKsY8+4dwIFf4SdV1ObFf4EwDGtzfqxTdrUhOV1JoSDxBJ+mem/8wo4gAOZyAQ
	SNpbDwQx1Nt17uQrWydcbcmnQzFhHhYPrwtlP5tAYOGiI5/uNHKTwZJZNQsVI2Rwt3ZF
	hFBK14VUOogESZBQqkXfcW07nA6a189QbNKEM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/fKUzftmUnWdnKpH2OIZiBpkxi4xxLqjIsfcULsUV+c=;
	b=UzXc5VlLnSsDcgm0648FGp9iOZW0Xn3yvt43/y15uzBl3GX0trzUkXZFKIZDb0lchK
	DpzJIm+ld2d+o2ktKt8M09yAB9G+34AeYMFYAc1+AaOfjw8n1BK2GOzwD0k5gKXlYWR4
	1lKgJsRGg+9xdfui28Rffaiym/aY6kmW9huHeXZeMMfSf93xg7/iRMOTyE4L4GBueDYM
	+5Vq/kvBv86ZSASOR5H67R2K8GPaOxeQRon216PekHikyglVz1REMpYIpwtBqbRxJg+1
	krV+ib5h9ljipDmAht1OPMkwmQo3WmfxaWWkIUy/FrSxbrtvMGdgYIFopJRsCT/47jOx
	w3zQ==
X-Gm-Message-State: APzg51B1Ff4pjV85IinjGgjkK1nZhzu1vkohwfzT5d7dPzzlsf2CxJme
	zI9/ToyAhxwWjO88zqOFRko+RQItYW/WQhCIN8wHLQ==
X-Received: by 2002:aca:4204:: with SMTP id
	p4-v6mr6889677oia.242.1536863982269; 
	Thu, 13 Sep 2018 11:39:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP; Thu, 13 Sep 2018 11:39:21
	-0700 (PDT)
In-Reply-To: <CAEmUw+VwJBw7m-6ne2AxN7XYyhzMYYOs6aghUpgUiY+RWu5NtA@mail.gmail.com>
References: <CAEmUw+VwJBw7m-6ne2AxN7XYyhzMYYOs6aghUpgUiY+RWu5NtA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Sep 2018 19:39:21 +0100
Message-ID: <CAFEAcA_dxq-9gTNabTGJ8_XGMw61B0cQqUKMr4iupqpZrLSc4Q@mail.gmail.com>
To: Varun Gohil <gohil.varun@iitgn.ac.in>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::236
Subject: Re: [Qemu-arm] Getting guest's register values in QEMU
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
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gRl76ItmXA6j

On 13 September 2018 at 18:30, Varun Gohil <gohil.varun@iitgn.ac.in> wrote:
> Hello,
>
> Is there a way to get the register values for ARM ISA when ARM is the guest
> architecture.

Yes:
 * connect an arm-aware gdb to QEMU's gdb stub, and use gdb commands
   to stop the guest and look at registers and memory
 * connect to the QEMU monitor and use monitor commands to stop
   the guest and look at registers and memory

thanks
-- PMM
