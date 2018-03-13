Received: by 10.28.91.67 with SMTP id p64csp1294664wmb;
        Tue, 13 Mar 2018 16:41:50 -0700 (PDT)
X-Google-Smtp-Source: AG47ELu/rjiZaeIg17r63y/96m5woh80YokBb+s+xLR8A4nYML02rESF7MdIUJ3fmEC3Ff87AyzL
X-Received: by 10.55.192.20 with SMTP id o20mr3667281qki.257.1520984510753;
        Tue, 13 Mar 2018 16:41:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1520984510; cv=none;
        d=google.com; s=arc-20160816;
        b=QzurVasP8wMICDNYZ8S7nByTmLhl3JWfBD61rjwEutvMukDp5wNYUEgf8iBdXzvwb7
         5qCOz+DFwBKhmlyiG96XZ1lalwtkQYQXuI7aNzo1+yLQySLZ13EKQSUa+Vj68mWSxczM
         wY6pVGz3bjzWfcVT4yZnWesMh3QQF1cGv8K6P1Lt2dOYJfoPNg+G+SwNCbuP0af4qDnR
         23zmF8MUGBnt45pW4LMxh+xQbkX8b7SWKZirjAmXgxjvOVO8lSh+SvU+EVQvXCeTgx72
         iOiFVmgvby4922kw5OuEw+a2JUUdAITZdlXmZ40DGJiek0dOninf4IEVORqrYDGKYw6s
         mxfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=ok9K/kmR05ycITh156gQcy9SU86daOmAla2A2ul4p/0=;
        b=IUNb0vBKsF0rkD3kHI7ZsuyD8mRHSCTwRUbG3v3+MuPyjNSOTdRgIiJRnP/eiT/yPC
         1AasVTpPO17lNYIoujIdntcsh1vBLz8Q626s5chqdX1vflYVKYpEav4dshHnnUX+inuZ
         v+8D/K/byHslf4ERdGbDCQKo5yinb43+exAozczlUKlX+bq9GcTfoXNcSZkluqCPfb+G
         Sh3whrcHCSyWtCidu/3AYzSAklYwYRH/lWFJKgLqzqf7VWInYWCe6nfLdPsRku34weZc
         XZ+Ab1bqSvHdS0EcB5IPfHjQ79sx27McpAm/M2bOmQT0PHmOKxcIyR3+CiwswyYJ05dd
         BPpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KZ+lP1SF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t43si1371034qte.455.2018.03.13.16.41.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Mar 2018 16:41:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KZ+lP1SF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43576 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1evtYE-0001XQ-8G
	for alex.bennee@linaro.org; Tue, 13 Mar 2018 19:41:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33977)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1evsxz-00039N-Ig
	for qemu-devel@nongnu.org; Tue, 13 Mar 2018 19:04:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1evsxv-0004Tu-Dm
	for qemu-devel@nongnu.org; Tue, 13 Mar 2018 19:04:23 -0400
Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243]:44091)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1evsxv-0004TV-74; Tue, 13 Mar 2018 19:04:19 -0400
Received: by mail-wr0-x243.google.com with SMTP id v65so2527536wrc.11;
	Tue, 13 Mar 2018 16:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ok9K/kmR05ycITh156gQcy9SU86daOmAla2A2ul4p/0=;
	b=KZ+lP1SFXkFd0M6j3Q5UCqmUshLFapQhJh6MBsTB7o3+wpeWI8OYlAuc+fXzWMLk19
	pZ99QMecMrGjf4F3mJk7429tSQfXmDIMGbHayIcCKbWIOsI8eRSMQQAZ2ov5oyE2goWj
	PNucmoXcEyNE+yKSDjBACEoEKgixdb+cVtNXgxA1cR6iq1ycbfNCChLYCdQ2cQaKZOQl
	NnC6fdzFIEqkocWGH0rCZYVIKPGiaEzPSnNhPJvJ7cof8hYFZgliQ20GJt9w5zM4BWrm
	W+x1OIgk6SMKKq49fe1hVq5h/7DO5doFIhhYuCpS69MpliQ61VK49sIZF+r5x13wmplv
	XL3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=ok9K/kmR05ycITh156gQcy9SU86daOmAla2A2ul4p/0=;
	b=J/Su4J6fKiQ4+IatiXxXv2aNa6RbleJlvhu1AVhN03odRYXRx84RRcGq0JgespEWmE
	dERiZiyHxhNKyflyFVdgeu9r8TxFl6A5W1hvxYCmOSi4lp9sqA+Kr52FNafn8a+PO41X
	Tam7Rt0H4+py4mKHMN4vzI7k1nD8qwh2s7d70cciwWHYl+cOqKsLzWjY3Rb3f5wEjoX6
	BsDbtS5neHuXL3rWq43s6BMdDSRNprZ9nGmIjoHrk5QyoOkfEHsk9lB+uO5RBVIzMn46
	zfTzX/VytYTYC3wbR+6RyQrUSFv6VhCUQLWKVQ23To8uPekUog45rX+6E8L5L84L5EQh
	ksoQ==
X-Gm-Message-State: AElRT7GCGWY/O+8HvG9SNNdsmOVPuI1+txkuk7nTHOoY0RqKsihkWuqY
	kj9gT/QFqbMKwSB5C2N73XE=
X-Received: by 10.223.151.129 with SMTP id s1mr1986770wrb.206.1520982258001;
	Tue, 13 Mar 2018 16:04:18 -0700 (PDT)
Received: from [192.168.1.29] (AStrasbourg-554-1-221-65.w86-204.abo.wanadoo.fr.
	[86.204.94.65]) by smtp.gmail.com with ESMTPSA id
	140sm1584307wmy.38.2018.03.13.16.04.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Mar 2018 16:04:17 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180313153458.26822-1-peter.maydell@linaro.org>
	<20180313153458.26822-5-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <8d743296-5c80-6a3c-5632-4067828e9b94@amsat.org>
Date: Wed, 14 Mar 2018 00:04:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180313153458.26822-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::243
Subject: Re: [Qemu-devel] [PATCH 4/9] hw/arm/bcm2386: Fix parent type of
 bcm2386
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
Cc: Pekka Enberg <penberg@iki.fi>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +AxzhnCKsk4P

On 03/13/2018 04:34 PM, Peter Maydell wrote:
> The TypeInfo and state struct for bcm2386 disagree about what the
> parent class is -- the TypeInfo says it's TYPE_SYS_BUS_DEVICE,
> but the BCM2386State struct only defines the parent_obj field
> as DeviceState. This would have caused problems if anything
> actually tried to treat the object as a TYPE_SYS_BUS_DEVICE.
> Fix the TypeInfo to use TYPE_DEVICE as the parent, since we don't
> need any of the additional functionality TYPE_SYS_BUS_DEVICE
> provides.

I once wondered if we can dump the whole devices hierarchy (xml format)
and check consistency, or generate hyperlink doc and graph for the wiki...

> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
> I noticed this when I tried to make the type into one which
> has its own class struct, because we hit the assert that the
> child's class struct had better be bigger than the parent's.

Yeah once you understand this obscure assert(), it is VERY useful.

> ---
>  hw/arm/bcm2836.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
> index 40e8b25a46..9266f27c14 100644
> --- a/hw/arm/bcm2836.c
> +++ b/hw/arm/bcm2836.c
> @@ -165,7 +165,7 @@ static void bcm2836_class_init(ObjectClass *oc, void *data)
>  
>  static const TypeInfo bcm2836_type_info = {
>      .name = TYPE_BCM2836,
> -    .parent = TYPE_SYS_BUS_DEVICE,
> +    .parent = TYPE_DEVICE,
>      .instance_size = sizeof(BCM2836State),
>      .instance_init = bcm2836_init,
>      .class_init = bcm2836_class_init,
> 
