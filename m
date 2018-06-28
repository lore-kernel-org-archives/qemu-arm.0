Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp7668770wrq;
        Thu, 28 Jun 2018 10:14:19 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfCVqvEPHzBNN9Q+hcQXqZkAWQ5VZ8VmogTYynm/udHymhk2dTBtDoMuG/DkQZ21poyoZQL
X-Received: by 2002:ac8:bc9:: with SMTP id p9-v6mr9792455qti.175.1530206059659;
        Thu, 28 Jun 2018 10:14:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530206059; cv=none;
        d=google.com; s=arc-20160816;
        b=IAj7lYmU8bnz0fI3aza1p7ujX2fcqSV9hVr1FxZdzsJ4hZgXlYEKgXkzYs1vT7Ib2l
         WjCwYZo+ZwAwydvkXbYJ0A/6TX6SSCAnM0oBuCj6GhIgul4o2SRwv1SclA/QcvLwYnTg
         tN/xV9F7DTEOwaMMdNnciLLaH7ZSXM5xtzZpHmycQWHkzN5YyOzZGvsIwFjC9OWSn8tP
         YlzY71WOBuR4wSmhPz5LSO6dYPdd8Nb5G6zkyuWREH6jaASEjOvBrmdMPTa3nWaoqnyO
         78MY+LejNsNKQGvc78fd1Qdy9OB/8o2livtBg7qDwrlEMQWkejY8PoUCJyHhoo+il3ck
         qdMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=T4PwR2eFKGVsS1tP84XZEHNOUShMUocqSuBJTMHQKvM=;
        b=eDMNHxDxEACoKejIsNh6xh+8Zj4YvOvE80gITpUZiSx9L4+7EPJA5WFtYrdAgtBJAZ
         BJ9vgh3Toxr3ZqkfTi+Vnvqmx5FCn3a+v9O4ledTUgUDROPzw0ZwcLbIRZfrdAANRuKf
         0ZkyUtMiREL0Na5uavAzAFtlMaKTIl+Ke9xXf0ONP9gXS76y+j2tssrZE88TSwoembxO
         X5gl4s9+gw/kbF8aSBgXrTOR+Vp399Kf3D++bQnJxwsD39sDaFpt2u0MyrkTJnOZDnnm
         r9kPaj1ph3tb4fXnxMQ4skGQ6cJx5WD92aeiOok2yCEP4DQ/T5EvIWQEJNl9AK7lwr2J
         lxHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AiXI2jKo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n89-v6si6741703qva.105.2018.06.28.10.14.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jun 2018 10:14:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AiXI2jKo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37715 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fYaUt-0002YB-5D
	for alex.bennee@linaro.org; Thu, 28 Jun 2018 13:14:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58702)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fYaUW-0002Wt-DE
	for qemu-devel@nongnu.org; Thu, 28 Jun 2018 13:13:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fYaUV-0001Jn-Hi
	for qemu-devel@nongnu.org; Thu, 28 Jun 2018 13:13:56 -0400
Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242]:35826)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fYaUV-0001IO-DD
	for qemu-devel@nongnu.org; Thu, 28 Jun 2018 13:13:55 -0400
Received: by mail-ot0-x242.google.com with SMTP id j8-v6so4200182otl.2
	for <qemu-devel@nongnu.org>; Thu, 28 Jun 2018 10:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=T4PwR2eFKGVsS1tP84XZEHNOUShMUocqSuBJTMHQKvM=;
	b=AiXI2jKoX08sMx6NZ6PfNoP37haH0O2j6nt2JYi1BpLBAYVJfHQ+jQKgAiUgc8BScd
	SKpIYle07KoyNIlM/agwcAfnbWvVprG4JhMgYY0G1soZTVQQvPN6v6Ws94igYnyWMtrB
	j8qN9C4HYhM/AtvQC/pl1D289eL/HTGuHcdU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=T4PwR2eFKGVsS1tP84XZEHNOUShMUocqSuBJTMHQKvM=;
	b=GeIODb9CPMPk9UkQ3lTK/x3XRF4ABXTW95yrn7LMyO45BAcDYQWjWPSWNusR+Stu+w
	2lTSECyNyzaPncsYONx1dc9AJfEBfeS/5mEZB7RTae5ZW2K7qSPxbu4qT65UySqB7LTP
	cWC0xc7W2NK0lg7raRzowC/4zvrTUHFL2zOyLInmB9oOKNFXPtXxeqBXUQ+ii8nHRBLj
	cSsOPjeZThCEZIQyrpInzGVd9mrgEdCSC/NYcTokK/zLcy3GuxXwGFvlHWcDClzKvZ+R
	W+8Y3gVYI1QI9hFFlxIN6NFktjpR5LGasgsITSvS0a/amjsGb29dKhK5G9XawykarCTU
	S0CQ==
X-Gm-Message-State: APt69E2w8IVVxJ77tz3JgoFXI19LR2c9Sm8uS/hL7hMb8hVAv7bjBRxD
	iC0tR99RviH/MoyNHbBoBkVh8cZz5GYG7cWHIIZyoA==
X-Received: by 2002:a9d:64c3:: with SMTP id
	n3-v6mr7035803otl.210.1530206034788; 
	Thu, 28 Jun 2018 10:13:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:902:0:0:0:0:0 with HTTP;
	Thu, 28 Jun 2018 10:13:34 -0700 (PDT)
In-Reply-To: <20180509034658.26455-2-f4bug@amsat.org>
References: <20180509034658.26455-1-f4bug@amsat.org>
	<20180509034658.26455-2-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jun 2018 18:13:34 +0100
Message-ID: <CAFEAcA-7xnkKYKP0YeY5GFuaknVpaUSiCaFiyUGQJOuRSgm05A@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::242
Subject: Re: [Qemu-devel] [PATCH v2 01/14] sdcard: Use the ldst API
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>, Michael Walle <michael@walle.cc>,
	"open list:ARM PrimeCell and..." <qemu-arm@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LxHjbhBA61RT

On 9 May 2018 at 04:46, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote=
:
> The load/store API will ease further code movement.
>
> Per the Physical Layer Simplified Spec. "3.6 Bus Protocol":
>
>   "In the CMD line the Most Significant Bit (MSB) is transmitted
>    first, the Least Significant Bit (LSB) is the last."
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

This is a nice cleanup so I'm just going to fish this patch
out of the series and apply it to target-arm.next.

thanks
-- PMM
