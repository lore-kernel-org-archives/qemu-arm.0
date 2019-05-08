Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp5051284wrh;
        Wed, 8 May 2019 09:44:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzVOV3R6jsWyx4laiHmzmRAI0oZ09bRpw4YzieXm9u1mRUEQE1XXBsukKsJTrCItGKdtdCB
X-Received: by 2002:a1c:a74f:: with SMTP id q76mr3779585wme.152.1557333848630;
        Wed, 08 May 2019 09:44:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557333848; cv=none;
        d=google.com; s=arc-20160816;
        b=okIZKJprRKuyNFdloemuVuXd5f/AJNK0lVOvlZ1v2qdGzTmHfpPpLFu9BtUpslqam7
         1acaESz5GkvRpIa/Dx1Lf2M7C8TKX6LtR9DkL1qVTiV5BC/LsfgC/1rXul8hGcV1y72O
         vha0HmBCuwgS4MusgxGdQrUBynSxcAt90NSzSLgmRRXabqps/MT1NF1+tAF0fZAYUzIU
         TDZnUxKL9kTjbMNOd0FXtRdx85pcH//3NePwKkl5hmoAlmvoN3+vBB84pTUqrbx87vTV
         Ui2HvciHRno5KiY7Z6BIV/5DDJdF+SPlWAzi5eX8ctqfA0Czn5st+SVCpb3azU66ltRr
         nVBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=lKNhsIceZwY3ep1rHjPXvF3bz7fagvLHaWLCvW54oUc=;
        b=WhfajWigp4h4VuyutxeQaMFncPb2ijVus+3zTsezZodxCWD5NI+ViIJbB0dHXr/bmw
         uPKEpfqm2ctGc+Cd45tvhUMnL6wK/7Q7XDzIgZGtUdWMbIcmyBIokcGkNWha2kgpJXgc
         y3FIS9feDm4c/Dgv8aHZ+Nz/tWtQl52/fPc8+3Rd+DCcFREY+sGCnkipNIFN/nLp1+/f
         O6ibWOuPy2Kp/O+Qaxo9xehr6CwTVWewXWADXPRM2MgJAhCl9dvcSMoze7OEzTdp/oHf
         gNv24X5TRRSx5DI43uU7FlOWbZ4sBXSgHsR2s+hOSvR+4AiC+s21qHB5eQNjCF5C3NnC
         KGHA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k4si12331180wru.297.2019.05.08.09.44.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 08 May 2019 09:44:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:40254 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hOPfr-0005TE-Oq
	for alex.bennee@linaro.org; Wed, 08 May 2019 12:44:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57949)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hOPfe-0005T2-6D
	for qemu-arm@nongnu.org; Wed, 08 May 2019 12:43:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hOPfc-0003sH-WA
	for qemu-arm@nongnu.org; Wed, 08 May 2019 12:43:54 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34610)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hOPfc-0003rn-Po
	for qemu-arm@nongnu.org; Wed, 08 May 2019 12:43:52 -0400
Received: by mail-wr1-f66.google.com with SMTP id f7so17765903wrq.1
	for <qemu-arm@nongnu.org>; Wed, 08 May 2019 09:43:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=lKNhsIceZwY3ep1rHjPXvF3bz7fagvLHaWLCvW54oUc=;
	b=Tz8K7yn0oUiEmtKiz3X9qsxHFUv5HD/MXGzKQSYUhAKA881SrtroVnddTg3IHge3mk
	wCaN85miUVqTVLQ+W5elLCyCLEXRpbwcosem9dkPw9L1TiTRcEe46fvMi0ikMyu40Uu4
	dtRVbkcDi5j1UTUyXZWci1n1iiEH26Q67N5vMiQMy9XShwvvfrm5BhRU47LmtWQSMWse
	7jCWD8kGfsYeyhbhiIHzqvixsErZkkft+ZEFsBK2BrpENoTC0tiSNQGv9lwZaRJz/HMF
	WX2iX18cFHviNhMr/bucBwzwnulZKbz8EUYUixZSYZE4tdoapRLyxaeD6p3b9fydak0E
	hU0g==
X-Gm-Message-State: APjAAAV7At6n3kezLYNPmEVhRxV/jafSvsplmA4UmRGuLRY8P4DBYyDo
	K7a3yAXxiJ7jHw5dwSJLydz/SA==
X-Received: by 2002:a05:6000:c2:: with SMTP id
	q2mr16721972wrx.324.1557333831729; 
	Wed, 08 May 2019 09:43:51 -0700 (PDT)
Received: from [10.201.33.53] ([195.166.127.210])
	by smtp.gmail.com with ESMTPSA id r9sm9757667wrj.57.2019.05.08.09.43.50
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 May 2019 09:43:50 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20190507134521.31044-1-thuth@redhat.com>
	<CAFEAcA-j+wQXjPW+puxk=foi2T8O=MzXHtxdWJ6E5P7o89WQSg@mail.gmail.com>
	<c0cda8fc-cc68-eadd-0750-cc9eeca094a4@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <b93b1eb4-d2ff-67cd-a293-5ceb4db9b957@redhat.com>
Date: Wed, 8 May 2019 18:43:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <c0cda8fc-cc68-eadd-0750-cc9eeca094a4@redhat.com>
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
Cc: qemu-arm <qemu-arm@nongnu.org>, John Snow <jsnow@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uCWzAWuPOEKU

On 5/8/19 5:33 PM, Thomas Huth wrote:
> On 08/05/2019 17.09, Peter Maydell wrote:
>> On Tue, 7 May 2019 at 14:45, Thomas Huth <thuth@redhat.com> wrote:
>>>
>>>  Hi Peter,
>>>
>>> the following changes since commit a6ae23831b05a11880b40f7d58e332c45a6b04f7:
>>>
>>>   Merge remote-tracking branch 'remotes/ehabkost/tags/python-next-pull-request' into staging (2019-05-03 15:26:09 +0100)
>>>
>>> are available in the Git repository at:
>>>
>>>   https://gitlab.com/huth/qemu.git tags/pull-request-2019-05-07
>>>
>>> for you to fetch changes up to 69f879e9fefab9aaf24893fe4ce23e07756d703c:
>>>
>>>   hw/arm: Remove hard-enablement of the remaining PCI devices (2019-05-07 15:01:47 +0200)
>>>
>>> ----------------------------------------------------------------
>>> Kconfig settings for the Arm machines
>>> (v2: Fix the dependency of q35 to AHCI_ICH9 in the second patch)
>>> ----------------------------------------------------------------
>>
>> Hi -- this is still failing in the build test where I 'make clean'
> 
> Very weird. What is running before the "make clean"? Could you provide
> me with the content of i386-softmmu/config-devices.mak please?

It worked for me after running 'git fetch --tags', maybe because Thomas
used the same tag?
