Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp23575160lff;
        Mon, 6 Jan 2020 08:36:57 -0800 (PST)
X-Google-Smtp-Source: APXvYqzkIvHqbvHx+71nxjsz6JQsGUqcKoPIOyoUnX31H7q9VDFucMOdCPeC10O9yj4J3VKhw8go
X-Received: by 2002:a50:8ada:: with SMTP id k26mr106594688edk.255.1578328617340;
        Mon, 06 Jan 2020 08:36:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578328617; cv=none;
        d=google.com; s=arc-20160816;
        b=cFE7sZvQJGZpG36M5vf67+Sqsgjf+V1SoCh3EtUVZ5fA4bq4AeYXeQLqPF5rjHkWpX
         e6viaWD79n9Lh+3zqwLOk9CWGb3De54ABLor5J9bTSIU+zJoCsUYsahf0WYs8iPszEjv
         9ObrkmmG+VWZpRy8Onc3hzojVRiieZw9Ws4QSd3O4U5UnI/wq0VZ8wgNGTxAK64NKHcS
         SMj4J2t94QU+RLRvCuSYUbCjrKMKP8ytIPpoiQwx783LpkUYUs7YbzLsxWpzjIbhP0pO
         LIMr/XMvNYttAkvzhTBE70jbIhMc0+2HD+eMCUShAHeiUCxNbEzvh3oRs6WnUWO4iSfo
         7qPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=0blC2g41qc6jf6yQhJLvwZ/gkOMm5mH+yWeZc5WWkbc=;
        b=w8n+pIT3IRBNHBVYRJOVw0JDL5zQ487cLAYfIIN/2He0lmvAVTlm5IT9zcjV30S1/N
         q2blK0j8halDi1XnOKBTCTsFYOTBrGyoCEpE9QlrhRAYoeRD5pBa5csdhgp5+cBV9Dt0
         hVl/qLfTL4L3dqsLjOCqqNozq7DbXu66SZwC8pzXsIDTThpheQ+GV6imk2xd4LXDjJra
         6VKYHFj67X2Iis0vOFhvqIzPTMe4C/G3Lss2mCu5hzNTNUt9L+yye2F9Kt+bQFGl3whe
         0LyPMQu7zff+BOltw07sf2Kr8zM8JLFuTtOwpW+b2XyNSvSmE9B8EjmKOSIDsGOPfi7c
         dMvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VQLJNg7O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cf17si37488812edb.181.2020.01.06.08.36.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jan 2020 08:36:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VQLJNg7O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ioVNA-0006hC-2S
	for alex.bennee@linaro.org; Mon, 06 Jan 2020 11:36:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45319)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ioVMx-0006eC-7X
 for qemu-arm@nongnu.org; Mon, 06 Jan 2020 11:36:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ioVMw-0004JS-5r
 for qemu-arm@nongnu.org; Mon, 06 Jan 2020 11:36:43 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:22920
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ioVMw-0004In-2w
 for qemu-arm@nongnu.org; Mon, 06 Jan 2020 11:36:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578328601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0blC2g41qc6jf6yQhJLvwZ/gkOMm5mH+yWeZc5WWkbc=;
 b=VQLJNg7OYAsbhSyOb/HzRpv6PeVkaEzsSGD8NOSqpcYfZwrQ8tePUf4zDiEl0uvZbc7XxA
 /zT1L2+hz72AuPdm4H3uZzTri3ep0abS9cN91ndXlMvjr6PYExalUGCGPXOlFQXCmVolFB
 SNYibg0m6/1e9ly6ZiFQW/w0vo3PIt8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-v3vXt1loPJOUqbbuVHstmA-1; Mon, 06 Jan 2020 11:36:37 -0500
Received: by mail-wr1-f69.google.com with SMTP id c6so17983857wrm.18
 for <qemu-arm@nongnu.org>; Mon, 06 Jan 2020 08:36:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MY9sljiDNM4Ih//dCNSRNDlHAjYNfvOEdQ5FMq5WzfE=;
 b=LVG3DZq+bareBC0RO+eKYzRJVZEAUpiWtgQAHLrwhDk5Qd1aQej64SOHnx/d1f5bOy
 963lQMfh9cWIqTalwl8NM79rCwLlGv4I0q8VMu+wIq5QTX1i8tK699h6XSqXA6MxdF89
 L2HhqPtSUiICsm67CccD4spxj0iT9k2/8IqtO+L+ZrPHdg8mr8kT0lNSZqNb49t6xX81
 CM4/x8jbS6+dP0/xPvUj04nPLrYhtF+uzBfCu9KQ9X+ID+nrpj4TbWN1lJ1HvSaCAg1J
 XRvLFjSkjwNDpSoEsS+ZK4mtoNZN8N2SV97Tp5t5Ks5mohyd34SD4oqMgwuk+olBzSjU
 sAFA==
X-Gm-Message-State: APjAAAUlkg3MXrMAEwCBlzvpcTvjfslNxNFaTFaKNdaYnaEUGSc7AtRl
 3Lyd1ZNJZX8HyrozyqPxov7/h+Bak1dKYyXMjEE84aer/XymTrrGZgzGyurUX88RwNgITuyRebh
 fLER9N0U7Qn4z
X-Received: by 2002:adf:eb0a:: with SMTP id
 s10mr109197969wrn.320.1578328596601; 
 Mon, 06 Jan 2020 08:36:36 -0800 (PST)
X-Received: by 2002:adf:eb0a:: with SMTP id
 s10mr109197939wrn.320.1578328596387; 
 Mon, 06 Jan 2020 08:36:36 -0800 (PST)
Received: from [192.168.1.35] (34.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.34])
 by smtp.gmail.com with ESMTPSA id a5sm23568558wmb.37.2020.01.06.08.36.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2020 08:36:35 -0800 (PST)
Subject: Re: [RFC PATCH 6/6] hw/arm/cubieboard: Disable unsupported M-USB in
 device tree blob
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20191230110953.25496-1-f4bug@amsat.org>
 <20191230110953.25496-7-f4bug@amsat.org>
 <CAFEAcA_MTPuvHvijgeFkeLu2e96Tn90iAop0Lp5eER=7QnU_Nw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <092926a0-cc84-a9b4-4e7d-61219388a6f5@redhat.com>
Date: Mon, 6 Jan 2020 17:36:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_MTPuvHvijgeFkeLu2e96Tn90iAop0Lp5eER=7QnU_Nw@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: v3vXt1loPJOUqbbuVHstmA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VRuY8NTBp504

On 1/6/20 5:07 PM, Peter Maydell wrote:
> On Mon, 30 Dec 2019 at 11:10, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>>
>> We do not model the Sunxi Multipoint USB.
>> The Linux kernel OOPS when booting:
>=20
>> This is not critical but confusing. To avoid the Linux kernel to
>> probe this device, mark it disabled in the device tree blob.
>>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> ---
>> I'm not sure if this is a QEMU anti-pattern or bad practice.
>> I know we prefer to be as close to the hardware as possible,
>> but here the hardware is not changed, the dtb is. However
>> this makes the guest behave differently. At least we don't
>> have to manually edit the dts. If this is only annoying for
>> acceptance testing, we might consider manually editing the
>> dts in the tests setup().
>=20
> In general I'd definitely prefer it if we avoided editing
> the DTB for things like this (we have very few boards that
> edit the DTB and none of them do it as workarounds for
> buggy/missing device emulation).

Yes I understand (I was expecting this answer, but better to have it=20
explicit).

> Is it possible to have
> at least a dummy implementation of the controller that's
> enough to make the probe function fail more cleanly?

Niek gave some pointers. Anyway The kernel is not crashing, it is just=20
oopsing, so this is not fatal (the VM is still usable).

Thanks!

Phil.

