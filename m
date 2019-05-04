Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp410227wrh;
        Sat, 4 May 2019 04:53:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxfWugKgSzFwLBW2uOzLo56KaYhhy30oJm+mZuEEShAxwXtw8MAQ010X3k7fhApn5x+3nNG
X-Received: by 2002:a05:600c:2208:: with SMTP id z8mr9508467wml.89.1556970789555;
        Sat, 04 May 2019 04:53:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556970789; cv=none;
        d=google.com; s=arc-20160816;
        b=S6diquTGkZzr6vW+vIdbxMgwkHCtQF4GnqFIE2GaUDxafD6fVO/ZawioKY4FxYXH/Y
         iSza+0L78wu0PEJz25HbLqOFW6UfHV+d1dU3rXvQGMpTcommaa48249e9CpuvkJsturT
         rijhTZf6Aee1Sxm9dDkTC2UAjLVT1iQsEIafDXRC7rhpiTYZZhPRwftHWwK4gITSsR5s
         C8RjEf2aFwQrOc9xUK+ewsZ/o4En+qlWKKkOimAXIIP7A4jOHkiu99jbyVLSPCQFP/P2
         hGMu1NGOrw2IYoWVUjzpl1/wFUnTfXn8hJRNhC509KY/LWl02xs6hOfxEatVrVMPN+i/
         yQeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=yWuzI25mfazZ9/4FDgDKKezBoaaReNKxvhm7fIUTb0M=;
        b=ES3gRiYTdAFAwDAZivDAWONDlD8fTlRvYiqAsp7JV6o97wfLyFXX5hkVNl+/NnZ04r
         NgG6JGcsoVjgqjxIdBn/Va8N/MGrXZl9ucT5cY4libm3vdROQZJRwfwF6cUFq3D64h8n
         yOs2oPiKb2rEjCLSZhJ9o/jzUxTipyYIxA+n6S4hEoXB/skiiE0w82fUfhhaEozLBvWK
         z5RTFtVzhM8pBjDg70Iyg0LtPFUv21SK0opvu4OLaQUYyTSWPUa0a0qkvkfX4sf6LPGv
         B/uXT8oNfx4t72cvpnfc4+OWdx0McPs/JvqjeYsQ1FFUUf7ygM9nsXyBujkaWUiSdHQS
         jIlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x3si3666547wrm.87.2019.05.04.04.53.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 04 May 2019 04:53:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:55081 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hMtE4-0003HM-Kr
	for alex.bennee@linaro.org; Sat, 04 May 2019 07:53:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47769)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hMtDs-0003Gs-Ms
	for qemu-arm@nongnu.org; Sat, 04 May 2019 07:52:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hMtDr-0003zK-P4
	for qemu-arm@nongnu.org; Sat, 04 May 2019 07:52:56 -0400
Received: from mail-wr1-f49.google.com ([209.85.221.49]:40310)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hMtDr-0003yl-Jm
	for qemu-arm@nongnu.org; Sat, 04 May 2019 07:52:55 -0400
Received: by mail-wr1-f49.google.com with SMTP id h4so11078759wre.7
	for <qemu-arm@nongnu.org>; Sat, 04 May 2019 04:52:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=yWuzI25mfazZ9/4FDgDKKezBoaaReNKxvhm7fIUTb0M=;
	b=dnY+y2VH4akfzF/6hVl5sKqc9jy7Ns6cXXCq3KvG7SlESV1dVES0CGhtJ2FNQr3y45
	IXpMj4hQe5+C3F1cDcg9Sl0liODnoWVj5ycId3czCDaPHD2AN4IFrJxexaz/qOSMuc4X
	o8hgl7GeWn1YAViCV1VuoQb2tjDOmOLB3ciKJMSWNnFo9gBIHP+gwu9sstZhXkU6Tca/
	5QxirBFYD0Yp1qUtpv5+akpZvCMqe3InF51ISBS+proToU7nj8HZaIN6G2bWGcYGCDuN
	e40E2fNp4mEPcMFOO62pNgE14j076bXHgGxAf2Rb5WKoqDGwa82V42//atZR0JRb6QZ3
	OWVA==
X-Gm-Message-State: APjAAAU4mfwEQLsROASZv+MfD2VPf893fR07qAh7XLzUp5KxhXJtVol4
	9Cvd7BPAim5e9tgLG02OICljLA==
X-Received: by 2002:adf:e88b:: with SMTP id d11mr11025771wrm.327.1556970774134;
	Sat, 04 May 2019 04:52:54 -0700 (PDT)
Received: from [192.168.1.33] (193.red-88-21-103.staticip.rima-tde.net.
	[88.21.103.193])
	by smtp.gmail.com with ESMTPSA id f2sm13151053wmh.3.2019.05.04.04.52.51
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Sat, 04 May 2019 04:52:52 -0700 (PDT)
To: Cleber Rosa <crosa@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
References: <20190312234541.2887-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <d5d84efd-ef8c-4e0d-d48a-6996d91832e7@redhat.com>
Date: Sat, 4 May 2019 13:52:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190312234541.2887-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.49
Subject: Re: [Qemu-arm] [PATCH v2 0/2] Acceptance Tests: Test the Raspberry
 Pi 2 board
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZuU1Jr90JkAq

On 3/13/19 12:45 AM, Philippe Mathieu-Daudé wrote:
> Add the raspi2 to the list of boards tested by the
> boot_linux_console Avocado test.
> 
> Based on "Acceptance Tests: target architecture support" v5:
> https://lists.gnu.org/archive/html/qemu-devel/2019-03/msg04111.html
> Based-on: <20190312171824.5134-1-crosa@redhat.com>
> 
> Philippe Mathieu-Daudé (2):
>   BootLinuxConsoleTest: Let extract_from_deb handle various compressions
>   Boot Linux Console Test: add a test for the Raspberry Pi 2
> 
>  tests/acceptance/boot_linux_console.py | 34 ++++++++++++++++++++++++--
>  1 file changed, 32 insertions(+), 2 deletions(-)

I was hoping this series would be included in "Acceptance Tests: target
architecture support" by Eduardo (removing the 'print' debug line) but I
just realized I forgot to Cc him :S
