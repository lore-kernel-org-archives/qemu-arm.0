Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp1059322wrh;
        Thu, 9 May 2019 10:44:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyrel9bbN2T0vt3UNACZW6IjouW+Bdp5nYeEONc8NgNKL4yTE5h9cK4Ms7udc2H2mO6obkh
X-Received: by 2002:a7b:c347:: with SMTP id l7mr3778069wmj.70.1557423887591;
        Thu, 09 May 2019 10:44:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557423887; cv=none;
        d=google.com; s=arc-20160816;
        b=EZzGY7+r6L5dsAqrQGCph+zvJzls6O1Sv5AAmV1vwZ1VPnQgSZOtwARtCLb7DNbm91
         aNpldlWPLIzUbvltZ0AA+ScKYfeGt18qY6sm9M+EZOEe0lhzRXsfstDsRreoWbso9xlB
         3R5SKpVD3M1RHm58bO/6rFQCdbtcbz27ZZ888FtpSPyF5Z5PPk7UJuzd+cviIxglzV7r
         iN+MI8760jPpb6Y6GUtcl5pU5Z0Q13w6TOxMNBZv39EQMU4iUaTqrIuReZcKqg6lwckX
         EYFwJnZEWFmIOvD2nQuGTElKTQgZJfa7adLctYUkiOGqB1YOSpxWhbdxEivtsljR0L4N
         Fztw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=nJ43tWRJUig84Sd0mCgeFZJeBtBNiVK/1hXUaueswrU=;
        b=Fhh4OL+K+GRJEa28lIE//4rLkBjxolJIdR/Th3A01AFk80qJ+GC5S0EN+nBxzYDL3C
         tj1nh5wDbp8yRXabWQTHEPSsObFjm6A0LXs9rS+uw6WlIlyF49PKH8gi3Kv3k9UG+xqD
         KqybdwMBrAJNXu1YrZ36qzeu0M965sEOWe3WBB2mMih3NBYCASQleNPZ51GN4WI/l8VD
         d0DFgw2jskvuAvakQM1+YG0AySe4TEOGHTYRXn6Z3WPM2LUBQ6Ct/ZGZXz8jEnzz6pO+
         Y80I0WGxuGpN3p/TR5+R083z99l22ydJGMXXUYR0EvrZlFLNn9lHYdnnJydZJGbOV1th
         qo8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g3si2047658wrq.304.2019.05.09.10.44.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 May 2019 10:44:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:58668 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hOn66-0006HU-MS
	for alex.bennee@linaro.org; Thu, 09 May 2019 13:44:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33044)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hOn5t-0006BP-T3
	for qemu-arm@nongnu.org; Thu, 09 May 2019 13:44:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hOn5r-0001gc-OP
	for qemu-arm@nongnu.org; Thu, 09 May 2019 13:44:33 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33865)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hOn5r-0001fo-Ic
	for qemu-arm@nongnu.org; Thu, 09 May 2019 13:44:31 -0400
Received: by mail-wr1-f66.google.com with SMTP id f7so4247896wrq.1
	for <qemu-arm@nongnu.org>; Thu, 09 May 2019 10:44:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=nJ43tWRJUig84Sd0mCgeFZJeBtBNiVK/1hXUaueswrU=;
	b=QPuGMdyf9PFO/r+2SrybmU+rPkIIJ6q7FbmPQa9nCxXCjMA+F/7eU263+NoAmz2Y7p
	nfEWWXBC3m2XNtnlIcXW6tr/EnuK+TOU4zRaCFNhz0B+IUFhqNmtKbbIEjdFoCDOShIC
	/dw8ZrHINq5kc+9gH2nOTV8NgBD9TP7WlzS6tkFzqMkx6zo+ccD7f8PPF9p2g01/rufG
	aaA47PaSJ80GUqzZiKV0trKNrO70oKgLCbGJdVmfrCQd+DkfUR68rOy5kdn/OgDLn5KB
	ToDj0Yc/5MZ3zXEA1GoYOCSudMTEiqMGEoBdPbwbw+rLBxKhBrscx7NmAmT6ixqtXkY/
	4t7g==
X-Gm-Message-State: APjAAAXBbYCczRk1ngcpfWkNx+QMOquiTQ+p673/SiwbLvATzE/AfwNZ
	QSGQPKGVqd1U1Hk4N+EtJ8xdHQ==
X-Received: by 2002:a5d:4712:: with SMTP id y18mr4011683wrq.23.1557423869787; 
	Thu, 09 May 2019 10:44:29 -0700 (PDT)
Received: from [192.168.1.33] (193.red-88-21-103.staticip.rima-tde.net.
	[88.21.103.193])
	by smtp.gmail.com with ESMTPSA id g5sm4970571wrh.44.2019.05.09.10.44.28
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 May 2019 10:44:29 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>
References: <20190507134521.31044-1-thuth@redhat.com>
	<CAFEAcA-j+wQXjPW+puxk=foi2T8O=MzXHtxdWJ6E5P7o89WQSg@mail.gmail.com>
	<c0cda8fc-cc68-eadd-0750-cc9eeca094a4@redhat.com>
	<CAFEAcA8RoJ-ZSsn3Lhzj5hd3oYOE7Uxy8MvUUWrzhNfBmD=AWQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <d9562f50-ad54-7a96-a2fc-7e5a3dfe0723@redhat.com>
Date: Thu, 9 May 2019 19:44:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8RoJ-ZSsn3Lhzj5hd3oYOE7Uxy8MvUUWrzhNfBmD=AWQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-arm] [Qemu-devel] [PULL v2 00/28] Kconfig for Arm machines
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	John Snow <jsnow@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VVKg+QoLJfJu

Cc'ing Paolo

On 5/9/19 6:54 PM, Peter Maydell wrote:
> On Wed, 8 May 2019 at 16:33, Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 08/05/2019 17.09, Peter Maydell wrote:
>>> On Tue, 7 May 2019 at 14:45, Thomas Huth <thuth@redhat.com> wrote:
>>>> ----------------------------------------------------------------
>>>> Kconfig settings for the Arm machines
>>>> (v2: Fix the dependency of q35 to AHCI_ICH9 in the second patch)
>>>> ----------------------------------------------------------------
>>>
>>> Hi -- this is still failing in the build test where I 'make clean'
>>
>> Very weird. What is running before the "make clean"? Could you provide
>> me with the content of i386-softmmu/config-devices.mak please?
> 
> Nothing runs before make clean -- my scripts effectively just do
> a git merge, then make clean, then make, then make check.
> 
> http://people.linaro.org/~peter.maydell/config-devices.mak
> is the i386-softmmu/config-devices.mak
> (it does not include AHCI_ICH9).
> 
> I notice that "make clean" does not delete config-devices.mak,
> and "make" doesn't cause anything to update it, either.
> 
> Further, if I "touch hw/i386/Kconfig" and then run make, nothing
> is rebuilt at all, so something seems to be wrong with our
> makefile dependencies somewhere.

Good finding.

> 
> It's kind of weird that it only shows up with the from-clean
> build and not with the incrementals, though.
> 
> thanks
> -- PMM
> 
