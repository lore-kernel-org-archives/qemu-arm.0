Received: by 10.223.172.38 with SMTP id v35csp447014wrc;
        Thu, 7 Sep 2017 09:34:09 -0700 (PDT)
X-Received: by 10.55.0.213 with SMTP id t82mr4853951qkg.286.1504802049769;
        Thu, 07 Sep 2017 09:34:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504802049; cv=none;
        d=google.com; s=arc-20160816;
        b=SKPr7X0Pmo1uhljmSxtAcoYQMHSSaKOznkB3nsRzEyZGhlozHXo//H8O1xZ+LF/V8j
         ksdJq62PdCx5P84qrNOcke7fAbfrsT1lPTZew2z1FulBF0pyZJzNAqbfnxneso3PWbho
         Jdsa6gOhBfnbqFcw74VK0TYk1mU7XwMNqnta1nPSLN40UDwzBNgrTubz3f6q8EKjd4gS
         8y9sD5Q4904KZUooDLBEEHFbNS3+7hX4jtARZIGQf0deilUyfz2BwXazlkff/TAKXB4p
         G5+KB5rxlRGUA8yg18QfBBRW275+0QcyOFGw1geZiYVdQNmK0AdFLRBXwZktYawlpL5R
         Q+fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=JtPJEepu3f11/B1EH/T7wX+li4rVIvr1qzf6bNvvKEY=;
        b=WXp7kQiTXLwocj7qFLaYhW2q5L9XmL3GgAFQvy5mE/kG1ZDvjSMLKy/NTmXA+My06o
         9ECJyPyDe4d5nGV3cu2pWzqxWURydgdGGbxMOK3Nt71OYDK/xTXMR3GD9b6Q6gkOEW1P
         Y+x6IMIoBefrM3AJ5E2z8KxvrNnIhB6A+9qTG04e5kiKoxbtiub1x5NFJCkjFCLilCyC
         U24jOvRGflclpe1slO1BBFIMLymx+zxNaNWiEhuH4FofoDFoxMTNp2bAQfPknVihxf90
         Up0YWwHfXnp2nXeryBp1OD50ip3+HMWA7J/vGW6ECYck2/m42WpYvOnyQUqV2rLZimys
         vWjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=apKz6uP7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e65si50765qkc.525.2017.09.07.09.34.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Sep 2017 09:34:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=apKz6uP7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41307 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dpzkl-0001qZ-IY
	for alex.bennee@linaro.org; Thu, 07 Sep 2017 12:34:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51914)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dpzkd-0001q4-RJ
	for qemu-arm@nongnu.org; Thu, 07 Sep 2017 12:34:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dpzkZ-0005ep-A6
	for qemu-arm@nongnu.org; Thu, 07 Sep 2017 12:33:59 -0400
Received: from mail-wr0-x233.google.com ([2a00:1450:400c:c0c::233]:36312)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dpzkZ-0005eG-3J
	for qemu-arm@nongnu.org; Thu, 07 Sep 2017 12:33:55 -0400
Received: by mail-wr0-x233.google.com with SMTP id o42so449719wrb.3
	for <qemu-arm@nongnu.org>; Thu, 07 Sep 2017 09:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JtPJEepu3f11/B1EH/T7wX+li4rVIvr1qzf6bNvvKEY=;
	b=apKz6uP7yzo2CiMKBKGr26tbs4k5ZFVDcsvgOrFP4ZXWcEvmI61sn0PVHTdjOaSROz
	tA/Z2GBwEcBoJV497goKeobX+xR18J7tHGBrc9xX4thW1vuv8VBuFqb8iG1CGpablT1G
	B60hJjwKmohU4/CghInCh+QPClWWUCuHALKf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JtPJEepu3f11/B1EH/T7wX+li4rVIvr1qzf6bNvvKEY=;
	b=Hcf5FnRf9FavpBulxMETGMFnb4QEjL5RuB+HoVxLqDde3wVGCdWoqUmb5APr80zL7l
	xtBE6nK8IicauskoJjM1wfFpm0xZXU4Nf6vhrBgM/1vJZ7f3hS09E7Cvsu83CAHZg/LZ
	9H598tyo5IBfJ1nmc+Eq6dBdxy7EjF3lFfX+FSL5zuZMlkxxWvvygmaVtfdJBwXiZNlm
	qJDMd3xki7Y+U8Y9MkKwCB06eANEroNDImv8h723lVJUkANbqWGPT1EcG027xmd21INm
	FQ+/qADDCVpu7oVZdzYo5PS59Tuncp2ksnojK7KpD3vFYnWzA5y/Gc4oJXHgdadyRSLR
	fUUA==
X-Gm-Message-State: AHPjjUjlKG2cMqRhpV1vyGqPRPnJOR9xxL42CXV8DR/9PJ6hoYVey+8W
	j9dUNdvcQkiQKzV3ZCsn7rLn2EBtpqX7
X-Google-Smtp-Source: ADKCNb4Dj+ICsLnIA45AS2FmzlJEQKDRWUK6wMTf2I4/ZCgvk2LrTvkgPVbkuv9ipk+lx2JIgYYoEf/WQUf9dCPTAl0=
X-Received: by 10.223.187.211 with SMTP id z19mr2207137wrg.97.1504802033959;
	Thu, 07 Sep 2017 09:33:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.159.68 with HTTP; Thu, 7 Sep 2017 09:33:33 -0700 (PDT)
In-Reply-To: <CAKmqyKPSm4UHL7K0ZBGF28Z+wZ0qtMLd7CSvF9W94LwsXfN9zQ@mail.gmail.com>
References: <cover.1504222314.git.alistair.francis@xilinx.com>
	<CAFEAcA8TSpNkz3ew+wk6K0vu18B5RCr=0vbkihcaDz8v2zUN8g@mail.gmail.com>
	<CAKmqyKMd0JcEtkqiajLd5sbWP9WpjS8XqwfGGWPuANchE5Ej3A@mail.gmail.com>
	<CAKmqyKPSm4UHL7K0ZBGF28Z+wZ0qtMLd7CSvF9W94LwsXfN9zQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Sep 2017 17:33:33 +0100
Message-ID: <CAFEAcA_0FyFFqJ2GOtUw5CPBKTj1YR9ykroyL-7WCYfbgR0hAg@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::233
Subject: Re: [Qemu-arm] [PATCH v2 0/5] Expose the secure and virt properties
 to the
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LOVVS8SXQIpo

On 7 September 2017 at 17:29, Alistair Francis
<alistair.francis@xilinx.com> wrote:
> It looks like patch 1 and 3 still didn't make it through. I see them
> leaving the corporate network and going through to my personal email.
>
> Can anyone see anything on the QEMU mail server side? Any logs might
> help me push IT to investigate.

Unfortunately we don't really have much visibility into what
the mail server is doing, because it's run by nongnu.org.
It does seem to have a habit of occasionally eating patches
(maybe it thinks they're spam or something).

thanks
-- PMM
