Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2992629wrt;
        Mon, 14 Jan 2019 04:41:54 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6Bsz+pL4NbSOVsITSrpQsTgZprBTD7dnaqL2hUouOLodHjuK6fdx/wZiU1Q+XcUB14Faw6
X-Received: by 2002:a1c:6a16:: with SMTP id f22mr11873597wmc.25.1547469713959;
        Mon, 14 Jan 2019 04:41:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547469713; cv=none;
        d=google.com; s=arc-20160816;
        b=WcMb+X3rlyN94l6Ak/fMd2JuDNgigi6M+T0dAVmcZMHBYAfnUyizkr8EBxMCnBAdz5
         W4u9nXKDlOzs5c/pQVjnVrmKSiYfWYEBgwxEnPeG+QJDeRm31IDeAKPY+3Q/op7lhwBu
         ReV7aNetBvq1DvrUx3sVnL4yhDpGHgXSILlOg0knzCkjQzGBDtck7CwLwc2UW4nPWZEX
         bZjJYZMmz29UMFRsb8CMn/rVm6pjR3ABmJ+frPBiYi6FWXyfBWjezJHP9qWFPC5T5XwQ
         4ofmYTz36gRvH4vJcDfH8tcklI5hJAuRuh0+uyE8HwR3tEeFfW2ZNMxaY7BZ1YPc2D3+
         eQ0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=Lq8wR9BfJy2QImbJHwfjZKY0NbypCNJNSlu0VHJwdpE=;
        b=0HylfHhefCX1gTcXM96G5qXu5qTzgNRK3B72nY5jvwc7jD4Ld2xuSDajlApZxOd2ju
         Yw3b+HFA9bXAc+jVhiULF3S7v7R+gQqiLQhtzlv21k82QvdWK9SUC3xw5Z4nMQbsJSOy
         YitGc10DN9laIc9mjjpqSZcHWenWXLCnOGnZl4o62dNT2e3n/HD78uvs6JaQLcFVfjSo
         eHGlPoomCYosUh4scQC67KWRQtdacRR+nuYOCsEiOevhr1uTyofMoXpJKiQsemBm30y9
         qOVlieqCItVSh+9loGhFczO50I/agVl0DXcKj239C7oX9x41cGUoeJhtCeI/7CHJepaI
         W1Uw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z17si49592776wrp.53.2019.01.14.04.41.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 14 Jan 2019 04:41:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:40511 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gj1Yv-0001rU-16
	for alex.bennee@linaro.org; Mon, 14 Jan 2019 07:41:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57478)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gj1Yf-0001pD-2p
	for qemu-arm@nongnu.org; Mon, 14 Jan 2019 07:41:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gj1Ya-0002tx-Jh
	for qemu-arm@nongnu.org; Mon, 14 Jan 2019 07:41:35 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:37229)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gj1YX-0002rU-Kd
	for qemu-arm@nongnu.org; Mon, 14 Jan 2019 07:41:31 -0500
Received: by mail-wm1-f68.google.com with SMTP id g67so8671602wmd.2
	for <qemu-arm@nongnu.org>; Mon, 14 Jan 2019 04:41:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Lq8wR9BfJy2QImbJHwfjZKY0NbypCNJNSlu0VHJwdpE=;
	b=odVJ2EnxAzpoAybGmNbbmsQuvTUbgNGt+7ZLOMXsntMto2s0lYfPHslALO/X5ABm8X
	fGjBIFIdTeFpyBpY93BEae3zRE9TL/+KxNwCj+ZaQZ1I+bBNsYxErp6nxsqrQxC94w4a
	QejHZUWblr7ukF9rgr+ZM5SPHLfs3t9ilh82HzRUKuQZ97OlsywcrzdevDFrobQYxS7g
	MpVhjT5zg7B+Rhz3eMWoldc0VKHz/flk61lgW6fueUf4rsSoe1nqxr8F+SZVouO0aZZm
	rTYB4hM6+Qi6dVGfmpNiPrpwOvoGk1WyRlOZuOqLY/4WaZ9hZufbJJVrhRF44/KKDVp7
	oe0Q==
X-Gm-Message-State: AJcUukeBkjL+NVcA0knTDtHcJbeZWlKa8c6FCidGLYpAZUluT1uwnrcu
	1f1XTshuR+Z7uaNKDLk7HgrTBA==
X-Received: by 2002:a1c:63d5:: with SMTP id
	x204mr11478602wmb.137.1547469684169; 
	Mon, 14 Jan 2019 04:41:24 -0800 (PST)
Received: from [192.168.1.33] (110.red-83-51-161.dynamicip.rima-tde.net.
	[83.51.161.110])
	by smtp.gmail.com with ESMTPSA id t4sm76097266wrm.6.2019.01.14.04.41.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jan 2019 04:41:23 -0800 (PST)
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20190111140857.4211-1-philmd@redhat.com>
	<20190111140857.4211-16-philmd@redhat.com>
	<8a7ef73f-97a4-d270-9836-3936b7be1046@redhat.com>
	<f91cbbae-c3a0-d182-6de9-4ddd0c3892fc@redhat.com>
	<20190114123531.isddusgjtnl47wiv@sirius.home.kraxel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <63e2b2bb-c4ba-3d3c-0656-f5e10a8fd3f3@redhat.com>
Date: Mon, 14 Jan 2019 13:41:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20190114123531.isddusgjtnl47wiv@sirius.home.kraxel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-arm] [RFC PATCH 15/15] ui/console: Add "ui/pixelformat.h"
 to declare PixelFormat
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LIGhQ2vrJtRe

On 1/14/19 1:35 PM, Gerd Hoffmann wrote:
> On Mon, Jan 14, 2019 at 11:24:14AM +0100, Philippe Mathieu-Daudé wrote:
>> On 1/11/19 6:32 PM, Paolo Bonzini wrote:
>>> On 11/01/19 15:08, Philippe Mathieu-Daudé wrote:
>>>> PixelFormat is used by "ui/console.h" and by "ui/qemu-pixman.h".
>>>
>>> ui/console.h already includes ui/qemu-pixman.h, just move it there?
>>
>> That was my first though but then noticed pixman seems a bit
>> different/unrelated. If Gerd is OK I will do it. (I should have written
>> that in the commit).
> 
> console depends on pixman anyway, so that move would be fine.

Good.

> 
> BTW: Should not be that hard to remove PixelFormat altogether, or move
> the bits which are still needed to vnc which is the only user left
> (beside deprecated sdl1 which should go away soon).

I can help there once SDL1 got removed.

Thanks,

Phil.
