Received: by 10.28.4.212 with SMTP id 203csp591340wme;
        Fri, 27 Apr 2018 03:28:12 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrPytZ6Q3b+WINixPnz+CM7Uw9OiqAEaW9k38nkB9h6eGSFubs4kuwCSCGvheSENEVCcn6P
X-Received: by 10.55.173.25 with SMTP id f25mr1282366qkm.362.1524824891959;
        Fri, 27 Apr 2018 03:28:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524824891; cv=none;
        d=google.com; s=arc-20160816;
        b=yiynVqYJm1fXBLhFKharN95KjgQMVDUVlgEpqldK8AH/Q+9uogI8RxZoDgPoq+n+GQ
         +5OFGbytEb+nk4G0yzniAEODsQi8afvqrUjmQVDiUwd/ziuI7VLaQm3z7SUZSVDuPBGf
         52WXOkKrdO++kNE3LRQH1d9YstWk8MS/SVzH5DFFpfngOwSvITWrQk7QQB/QVNx0sfV1
         s8RqCCi56nl2PRrqjvx/sBhki+lMoRGxsB+TXjZFJdxBbTWoMYR7f23c9cWHzcF6uVh9
         dsICNdwqwANusR6M8QVzrA7pOG3YDWFwA1kZKjCrj+d5MeXV7LswCAIWyebaddurD7iD
         C3Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=ANa1HMc4a2TEtE+mma212efo4rwYPKt+OJr8B1EPNS4=;
        b=m+sDMVyMNCceXvsGs0k6tZ/8jOxoAq8Xi/dScI09hZkL+yxP7eBKOHdXFcU1mFarpU
         IPDaqAIX8suXwK1XpfyIT2kuSVpnxb+rEn6wFuTl4g39oQ83j5njAaQlFLGSuC2akEz8
         jptCjiCtNm6JJGBNGCcTLsV386USDRHCp70faE0BmRJapEGVZ32TNRv3PEW/y5I8s0Sl
         OaW/99NZDPb12APYnS6hn6tvKJx+fKyhUeybKfAigxu3xOL5WU0VLsOKMo9ANEM7vxbi
         Ennh6ssi0pqr3Y4/9RIKIYzkw0IhYclDpARSOEd8YHZnOfD7gkucs4JIACw/+rbS5EWq
         U0zQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hpTijPN1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b27-v6si1050093qtc.70.2018.04.27.03.28.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Apr 2018 03:28:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hpTijPN1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47121 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fC0br-0006Eq-Ej
	for alex.bennee@linaro.org; Fri, 27 Apr 2018 06:28:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47955)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fC0V4-0007Tc-RX
	for qemu-arm@nongnu.org; Fri, 27 Apr 2018 06:21:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fC0V4-0003Xb-0l
	for qemu-arm@nongnu.org; Fri, 27 Apr 2018 06:21:10 -0400
Received: from mail-oi0-x22e.google.com ([2607:f8b0:4003:c06::22e]:41790)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fC0V3-0003X8-SY
	for qemu-arm@nongnu.org; Fri, 27 Apr 2018 06:21:09 -0400
Received: by mail-oi0-x22e.google.com with SMTP id 11-v6so1121412ois.8
	for <qemu-arm@nongnu.org>; Fri, 27 Apr 2018 03:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ANa1HMc4a2TEtE+mma212efo4rwYPKt+OJr8B1EPNS4=;
	b=hpTijPN18g620pEozDrgeGgIn11urQXPP4ocMgnsUOo5UXWeBMMOnCERT2q4KvndYy
	d2njsDLW/+81Wj2Se1P4MKdj4hb53LGRam3h/n1lrh/uG+ps3YuNiqXzvOdjX1GCsQnR
	2cvhkbaesCo9B9xrKm6anhcs9v+geIJGEIIAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ANa1HMc4a2TEtE+mma212efo4rwYPKt+OJr8B1EPNS4=;
	b=TA6bLB8raL3dzV1CX7CSXTD6x0vqRAMCz49EV5pJ41PPJY1ctGhToD6BgzpOFrkUJf
	hV/p0arc7Y6wnGbQg1Ob56x2KP7X//th7c5ASJEyA8+QaCujAttpXZQ/BljlY/TqumFj
	XvTW2ITQLxV/lLV4R1ofJy5kRmxiyiHcLOeDlpQaMD7zoahDHsJtYsIOwYgP8LvUQufW
	UwbjogbT9aHQRUc+KD85GERJjDKDSShv1lIhYtSR3g9hzHdXnE/oSpWUTLnHHcSP2u7a
	cLzetVT6h1sxAvhn5DGtqhE5rHwcA9T2Xdj/Wg44rRGOEvKESRkjt7kufM1E2UEkSo7v
	Kqcw==
X-Gm-Message-State: ALQs6tDC6VzMPimKS6GsI2LtsCGbpFKUffczvyl+EVGNA6WskdxguoCI
	iBGXWqJVUbKnEM/2DCJqRPgawjsB9IlznB6V2zE9wQ==
X-Received: by 2002:aca:d447:: with SMTP id
	l68-v6mr936419oig.102.1524824469276; 
	Fri, 27 Apr 2018 03:21:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Fri, 27 Apr 2018 03:20:48
	-0700 (PDT)
In-Reply-To: <099d2af4-8fe3-f80c-693f-495accb26a17@redhat.com>
References: <1521452376-25099-1-git-send-email-thuth@redhat.com>
	<87in8qf2w3.fsf@dusky.pond.sub.org>
	<62dba5cf-b497-1a98-0af5-971e169a3458@redhat.com>
	<877eou2nek.fsf@dusky.pond.sub.org>
	<099d2af4-8fe3-f80c-693f-495accb26a17@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Apr 2018 11:20:48 +0100
Message-ID: <CAFEAcA_VAckXDgARe5dJdxe9N19quUD5Dn+Dseuj=itLbFmG0g@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::22e
Subject: Re: [Qemu-arm] [Qemu-devel] qom-test (was: [RFC PATCH]
 tests/device-introspect: Test devices with all machines,
 not only with "none")
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HuBlkXHJEJsF

On 27 April 2018 at 07:06, Thomas Huth <thuth@redhat.com> wrote:
> On 26.04.2018 13:54, Markus Armbruster wrote:
> [...]
>> Actually, a worse offender in the "waste everybody's time via redunancy"
>> department could be qom-test.
>
> Shall we change qom-test to also only test with the "none" machine in
> the normal "make check" mode and only do the full test with all machines
> in "make check SPEED=slow" ?

We definitely want something that tries to instantiate every
machine, because that does catch bugs.

thanks
-- PMM
