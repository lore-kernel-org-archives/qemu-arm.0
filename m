Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp3675153wrh;
        Mon, 29 Apr 2019 09:06:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxbqSFkNIPV1GPjRZa+2cijXwbLQws3+a3ECEkub8TGTyRQP9n9KY4x9C0hTrfSRhDBs5YS
X-Received: by 2002:adf:b641:: with SMTP id i1mr449484wre.288.1556554011699;
        Mon, 29 Apr 2019 09:06:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556554011; cv=none;
        d=google.com; s=arc-20160816;
        b=uRF649CCr1OeuLjNScSH+vuRwtWmN9n4tP4ASAXLjFXpJn29ukShDoU9yTr0Kg3e69
         CM3wjnZTpAGWmJCmvq38n33TnoRQMB1XFpYDKgdMZIUg+wbCQC3+eCM0JH2CXeopxluq
         9Kx9Wd1dupDf+12zsE+D9Qh+ZwI9h6YX36IayLOUcazwo9nya+7T/kfG9Mm5WjeEjT9J
         ejp04bb0RLwcpFn0meXW+apfgpKyk5PXLFb5JSA8hD5Gr9nAcn8B3xTQbSoTfgYx/pXx
         MIUCbflgS8kDrr2cBt4pTct9+iYz881CAvYvBVgISRuWsyrl2hdt6lDeSWb6BiyVZuP5
         4jOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=TMYY+oUbqasXkRpsVOksYkBugkZpbpTbPgd076eEaNI=;
        b=DrHFmjnuOTjtJYcyd1sCZ3nDW1dq6LNJJ6nD7Bo0OI5gLz9OKk5J0kK+fMyqH1QRJG
         xB6jnPFDDOkciz/0t6bIhJ0NUSmmykuEVSdB2LU8SAlwQFcFhYHmUYy/qsETh9QD7rGT
         sOPZJopvWQfqD9iTXcGA+RI6EVYnsVXKkxKtSwB2xnx6UQC/uz4hw3p0TeOkQDbczRab
         WoouTczKfzLKmXGLgxaopLhs1rQpPonvV4KZui0tsj/mAI+I5FsN0GWWwHAfuA8u8njL
         sS8BX6DwbX1iKf3jJqTPBDZSAU77OzoX6RFAosqoQHEAPd7WxjYHiHGPQRLswamPr+Ze
         a/Rw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j16si24030052wrp.168.2019.04.29.09.06.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Apr 2019 09:06:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:59987 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hL8nq-0006kP-My
	for alex.bennee@linaro.org; Mon, 29 Apr 2019 12:06:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47106)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hL8nb-0006iW-LO
	for qemu-arm@nongnu.org; Mon, 29 Apr 2019 12:06:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hL8nX-00007f-JF
	for qemu-arm@nongnu.org; Mon, 29 Apr 2019 12:06:35 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37778)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hL8nX-000078-B0
	for qemu-arm@nongnu.org; Mon, 29 Apr 2019 12:06:31 -0400
Received: by mail-wr1-f68.google.com with SMTP id r6so16874291wrm.4
	for <qemu-arm@nongnu.org>; Mon, 29 Apr 2019 09:06:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=TMYY+oUbqasXkRpsVOksYkBugkZpbpTbPgd076eEaNI=;
	b=XZ9RUZtbrttaqMqSgMKH73KyQYbFxNSGCRP8QanSSiJxrLXfv/uzAAk/zTfOKXqtm+
	ZSZmLPd7nQYIHqz1nANP6+JdodZO+5falEGlwKd5TYhoCevziivmYuEvp6lGWrDkn47n
	X6ImH0ZUeVXyyxzqUnw/SK3HrXjfXrAh8w4tR0f29MHHzQ/oY/Tha5oNG/CmzCT8o2Na
	8abkI9cOuD0uO3Hp+1GXN8dqW2dlJWh/HHqtBqZRijrFJvKEBFbQMk0mqLW9EDxCekZs
	EAzrI9F1LqHM4AJDcEvAIGSDgs6L7B/VCf/2WE9j3oGvlQnNUK4Jameg7lDUHpPY64vy
	wirA==
X-Gm-Message-State: APjAAAUZH964+DUloaNckHrNSSTOHE4oxPIZdnbwTR7OnSaw+YasOmBa
	jtxsxLTMmGCNopwyu6uIH7evHg==
X-Received: by 2002:a5d:4ec2:: with SMTP id s2mr26535966wrv.160.1556553990335; 
	Mon, 29 Apr 2019 09:06:30 -0700 (PDT)
Received: from [192.168.1.33] (193.red-88-21-103.staticip.rima-tde.net.
	[88.21.103.193]) by smtp.gmail.com with ESMTPSA id
	a12sm12008034wrh.46.2019.04.29.09.06.28
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Apr 2019 09:06:29 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20190418180057.3593-1-thuth@redhat.com>
	<20190418180057.3593-17-thuth@redhat.com>
	<98855a34-ff5a-896f-7959-480b89d62833@redhat.com>
	<b78d5517-5f23-6028-6726-b60f916f22fd@redhat.com>
	<CAFEAcA8xWTwbU6RSBbQkF2j5OfozEq9g3Pq83KyYG_J1CqGM-A@mail.gmail.com>
	<3f8cad24-3eb9-4c05-063e-196e27184f90@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <399a3be9-332e-fe3a-570b-4c1e43cbe2d9@redhat.com>
Date: Mon, 29 Apr 2019 18:06:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <3f8cad24-3eb9-4c05-063e-196e27184f90@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-QEMU-4.1 v5 16/29] hw/arm:
 Express dependencies of the virt machine with Kconfig
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
Cc: Jan Kiszka <jan.kiszka@web.de>, "Michael S. Tsirkin" <mst@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Yang Zhong <yang.zhong@intel.com>, Rob Herring <robh@kernel.org>,
	Qemu-block <qemu-block@nongnu.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Antony Pavlov <antonynpavlov@gmail.com>, Joel Stanley <joel@jms.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	Peter Chubb <peter.chubb@nicta.com.au>,
	Cedric Le Goater <clg@kaod.org>, John Snow <jsnow@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Philippe Mathieu-Daude <f4bug@amsat.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Andrew Jeffery <andrew@aj.id.au>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oA20/hnS11k5

On 4/29/19 6:02 PM, Thomas Huth wrote:
> On 29/04/2019 17.53, Peter Maydell wrote:
>> On Mon, 29 Apr 2019 at 16:34, Thomas Huth <thuth@redhat.com> wrote:
>>>
>>> On 25/04/2019 17.53, Philippe Mathieu-Daudé wrote:
>>>> Hi Thomas,
>>>>
>>>> On 4/18/19 8:00 PM, Thomas Huth wrote:
>>>>> Dependencies have been determined by looking at hw/arm/virt.c
>>>>>
>>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>>> ---
>>>>>  default-configs/arm-softmmu.mak | 11 +----------
>>>>>  hw/arm/Kconfig                  | 19 +++++++++++++++++++
>>>>>  hw/arm/Makefile.objs            |  3 ++-
>>>>>  3 files changed, 22 insertions(+), 11 deletions(-)
>>
>>>> Without -nodefaults I get:
>>>> qemu-system-aarch64: Unsupported NIC model: virtio-net-pci
>>>> This is expected.
>>>
>>> Yes, it should still work with "-nic none" or "-nodefaults".
>>
>> Er, if you need either -nic none or -nodefaults after this
>> patch then this would be a change in behaviour, which seems
>> wrong to me.
> 
> No worry, this only applies to compiling builds where you run "configure
>  --without-default-devices". For normal builds, virtio-net should still
> be included fine. ... at least I hope this is what Philippe was talking
> about ... but for me it's working fine when I run "configure" normally.

Yes, I tested both cases, without --without-default-devices it works as
expected (no behaviour change). With --without-default-devices (this is
a new configure switch) it is probably required to run QEMU with
-nodefaults.
