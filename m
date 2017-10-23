Received: by 10.223.197.9 with SMTP id q9csp10578524wrf;
        Mon, 23 Oct 2017 06:50:17 -0700 (PDT)
X-Received: by 10.200.36.150 with SMTP id s22mr20212343qts.237.1508766617698;
        Mon, 23 Oct 2017 06:50:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508766617; cv=none;
        d=google.com; s=arc-20160816;
        b=N/DDWw4SgBPMNz5+DLBLPUzExTuY0cZ4vzNZe11qwbBfmXg4oOT6XLm0B6AvjDAC2T
         55BxCUeKv5W8lOP3Mxhz8Wh4jsVVE7NVx5SN1ueo/m0SQhylg3s9ASuFiieSNhGgVvxK
         LuX0oIbw7CqXQiP4DAfSnBCXkjJhv4nPnBPDEizSDb0666FXYd3L1JHe+pQrKaM/AP1g
         EvDBJ4Ifhq2GdAthzKiPUMIUmSHbTf40mCa2ZvlndrlCMydTRug00KVW3bS7o3JxNguA
         F0aLbzX8tQjYaE9kThTfnh7LO1A8ERzwDdm/nxayZKvq0xiiR08N0OdDI3yYZdcVFfJI
         guGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=JeEXtnQj1FHd00thyanoQBIJv2/hDOeaXKiuoid3jWQ=;
        b=f528MYl5I14WtlVyb3XLV41Z4NNJpFXXQlAQamQl/tkei5O4RN0nL94J/s7O8Psuai
         NpjFjRDPCnnbir7vHCQt6pdMLa2FjEK7gDdaVzPGL/uzB1/9nZ6W0bwskPF5ELUVuEZk
         6Xdpm9xjmIQxF54Beu+k77ylRtixo49tqtNlDJr5517FEcbgshEo+qmKf9ZTeZBAprcs
         K+CdzC92foYDXCgnsdy3iQp4qDY0IkybfL5iJG4cU4PX+MnG+lvpZW6b1f9Ezcs7BUEe
         Ag6ffNb/1+9kJJVmH9weoB4lL+aj84k+qeSPt9eqFtOw82iQChSE+/1M0u8e9IJwxFQa
         qyaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XHmACoNn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id c204si3993380qka.421.2017.10.23.06.50.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Oct 2017 06:50:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XHmACoNn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38916 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e6d7P-00033p-Lb
	for alex.bennee@linaro.org; Mon, 23 Oct 2017 09:50:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34639)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e6d6L-0002b8-U0
	for qemu-devel@nongnu.org; Mon, 23 Oct 2017 09:49:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e6d6H-0000lX-36
	for qemu-devel@nongnu.org; Mon, 23 Oct 2017 09:49:09 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:52020)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e6d6G-0000lN-UK; Mon, 23 Oct 2017 09:49:05 -0400
Received: by mail-qk0-x242.google.com with SMTP id 17so21944415qkq.8;
	Mon, 23 Oct 2017 06:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=JeEXtnQj1FHd00thyanoQBIJv2/hDOeaXKiuoid3jWQ=;
	b=XHmACoNnUYIPOKk5V97thcXYGj9wGAk6Qqy8zUo9RXc23Vg2l7vs5qH2KM0Cjsbq5E
	s+hCjb92WYgjmj0eDa/mIlIpHKyXsDcLecvMp6InQLXJ1SFqxwWPlfTKcNZtCvrxDM5e
	E/6uSAB2CAd6tjgHV6UefrU6QAPHUcSpfxYIzC+0rngd/ZMhrLLf6hSS9IRPBSGLEqRH
	4cY+x74AAvxVuONwj05BYhXtNNUJmp11QAAgvlADm2tohj9T/D3GzS0PFR4aWoeO6xzv
	/t84RUpU+KeR9GP0sEsraDk74RrccMaqomKFrVKJozXUvr2RoTxVPFQRKzP0lTl4pMki
	Rruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=JeEXtnQj1FHd00thyanoQBIJv2/hDOeaXKiuoid3jWQ=;
	b=eBfqQMv/VLhtRFmrUSffX2tILKj5U0/NbYJwt5Ttbcysvjr4K37l92Pk+SsGTgVQQa
	hk0C5kTUiFGs8MxTtRz7LREbIRD309bCwzuoWkWE47gt9v9RY1vrGn92HVCJItIwGqX7
	ngKeiGb7Uvt8FhhzALFzp2tCwfMuKkkcroDoWNNbJEWhu4uWJBtZrPdIiIjP02Tp+rVN
	FM1mNzbufEk1yLogGNgghcXSM/75WlrZ/7tdjG75zit0hHFDgT4MW/jta6Y4hN/hnX2b
	txxmhEQdxOTjHfTmkmZg3dR+AeaLYOGrTEx0MIGb2bpTO0aH6lhYG0F61wWc27pY/2bB
	pSZg==
X-Gm-Message-State: AMCzsaV6/Qk6vKGQOKqjOx1scBflkcOAOq2bJy/3MvWd7tSuyELo1a6X
	0p8Dwkqwxl6f3owMdYZXV3DPmvfh
X-Google-Smtp-Source: ABhQp+Ql153tT9/VP9enC7CDmbVbHWEpi/YL37SZUC8GOjmIO9XhTL+7oJy/o+m37xwKR0daqlg0Pw==
X-Received: by 10.55.125.66 with SMTP id y63mr20041794qkc.101.1508766544119;
	Mon, 23 Oct 2017 06:49:04 -0700 (PDT)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g8sm3220237qtg.23.2017.10.23.06.49.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Oct 2017 06:49:03 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20171023122719.17199-1-Jason@zx2c4.com>
	<CAFEAcA_PM5Fjx2Pk58h75p9vaZwFcusQdXuwy9tbDtc=EaoOJg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <10e16ca3-175b-9f34-65e7-031b883b7201@amsat.org>
Date: Mon, 23 Oct 2017 10:48:58 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_PM5Fjx2Pk58h75p9vaZwFcusQdXuwy9tbDtc=EaoOJg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH] hw/arm/virt: support 4 serial
 ports
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wMZZhrncqb8q

Hi Peter,

On 10/23/2017 10:11 AM, Peter Maydell wrote:
> This is really the documentation being wrong -- that is actually
> a PC specific thing. In QEMU generally, -serial can be used
> for as many serial ports as the machine model provides, up
> to a maximum of four.

FYI I'm still working on not having QEMU so tied to his PC origins.
I won't make it before soft freeze although :(

Regards,

Phil.
