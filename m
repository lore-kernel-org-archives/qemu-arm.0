Received: by 10.223.172.38 with SMTP id v35csp5786389wrc;
        Mon, 11 Sep 2017 09:41:15 -0700 (PDT)
X-Received: by 10.55.162.7 with SMTP id l7mr11895541qke.154.1505148075886;
        Mon, 11 Sep 2017 09:41:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505148075; cv=none;
        d=google.com; s=arc-20160816;
        b=NBQbs63jgKP63d1W5cxj4KGNYr2a8ixPvx31VznxJPh6G4HJrxtAh2VIhoJA+5kcID
         RFCASTt9dRQKBnYvdW34m+zHq2uI9ErTEJTXuknrtxozwpPQ06IgsIMxHb/sIv/waHRv
         4xbII2ezeLGWi6jaPrTG1wFND8OR2D0pxbQVaxp8g27oo/M233gceIT4YQSl94YlpACg
         9qYNG4GKeqwGlpV0GWwpYDAexJuufF8Efv0jkjcc61zjCt4QCL0V4/pJeDz0ljgrIppd
         3nxUHs5JAM2C0BTCtNV62hDcce19yO05ZYjdPXLXhacQeYCMrbG+WvFbY7JTtsvAnAXq
         9NRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=dRf+NPrFemHVCx7JAlwzW/eCa3eMomUCws1bobJX29s=;
        b=arBBhmJWg9sBOrq8T9ac04LcUrlsVqnZmI3cg2o7LAINQTUCUAcR8kaxmxBEoipnf+
         2lvfgk2eVHDx52bU7GgO0Yvvr/hzh5DMaDbmhotcb26LtkFZW8cu5V8qo9g9YoDHGl/E
         7cAiAXiXbdRsIiwq/YNaRCEg+R1tsUyY0WKtF7iZQoFbF75wiRDEtb4OMg+Qv8LvMGL5
         0odjMm/Stmfg+//nAnmtqlrgl5cVDvoXYS/rU4NOQfmKY4PESGMH6tox/A0GdZ3vUkjh
         7fOwbLxtMLb2FVKwzcYJ0knHtieMXtofLqPqeuPlcHnc2rbEcaL4E4CgZXoQc5nyHXWX
         Q4Vg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SE+q8EyC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f68si9373849qkc.474.2017.09.11.09.41.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Sep 2017 09:41:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SE+q8EyC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58966 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drRlp-0003hZ-Go
	for alex.bennee@linaro.org; Mon, 11 Sep 2017 12:41:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49352)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1drRlf-0003fn-If
	for qemu-arm@nongnu.org; Mon, 11 Sep 2017 12:41:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1drRle-0005BO-PE
	for qemu-arm@nongnu.org; Mon, 11 Sep 2017 12:41:03 -0400
Received: from mail-wm0-x231.google.com ([2a00:1450:400c:c09::231]:43277)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1drRle-0005Ai-Io
	for qemu-arm@nongnu.org; Mon, 11 Sep 2017 12:41:02 -0400
Received: by mail-wm0-x231.google.com with SMTP id a137so10206027wma.0
	for <qemu-arm@nongnu.org>; Mon, 11 Sep 2017 09:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dRf+NPrFemHVCx7JAlwzW/eCa3eMomUCws1bobJX29s=;
	b=SE+q8EyCnYgQD+yeSppZmxQwsdbFTzcPbviNWrVXRQ/snTYwfxnzda52tEqx3J9XxM
	3kuKLF+h4QgcFGU8lbLyI1M57fHVk8HKCtrRZ/hU8YQ+TqP2DC3lmxPFTi72zWDnQAVf
	kT7yVrygPJeOQjGSwhacOTmVveUn9Jj6Dk9ZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dRf+NPrFemHVCx7JAlwzW/eCa3eMomUCws1bobJX29s=;
	b=ov9KaHEZ6H5aDtE+fffUwoanKu9vU/nm6VfAkvhxuwtCmAfisz4TQE38b53z2A30P6
	924LZz8f11QpvVPzOQWAsen9WoiiLeTj0ACwxz+fdeBfnNYV0xyEv48fZYD/lT6tmF72
	CGGb7WcNSl/yu7BBim0P51bQdL/hkGAQ6alffUkE29rToEfgJ8nBrs5+1Jwz1KXrJaZa
	VCLv5scAXK5Qz2yLy7Xg2Vu6VmzQVTmDAp3YLJAT7dOTpzuAiDzqSc28P0r3NfqTHwbB
	NZnUToUa1twi1rgA95hTmyOp06aabJhF9i/s4bt1qynSoYm9aqdxMNd8sRLk+c/J7eUE
	xpiA==
X-Gm-Message-State: AHPjjUiZcu6CvEk9dLDMXO1RJcPP6f8KahR0APZnJEWomYW4fZJj7P+5
	/FjEZvBDYndDGIcu7dB7uZJg/UjP6l6o
X-Google-Smtp-Source: AOwi7QCrqBcRAdiai6YDJ+z1KY/X3aYtY7iPXzr3W1RpuG/wZJK1U1rAdJvWh0mWP9gAJnPXaNy7r4HVM/JlYQpPYj4=
X-Received: by 10.28.166.135 with SMTP id p129mr4860250wme.147.1505148061445; 
	Mon, 11 Sep 2017 09:41:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.215 with HTTP; Mon, 11 Sep 2017 09:40:40 -0700 (PDT)
In-Reply-To: <889d6ce7-073f-7860-e091-619c1202b1cd@redhat.com>
References: <20170911142056.15643-1-lvivier@redhat.com>
	<20170911142056.15643-3-lvivier@redhat.com>
	<CAFEAcA_G8mEzB0Mox0TTz578LQKXgvhNHeZ8Bk7OwC4NbqiXPg@mail.gmail.com>
	<889d6ce7-073f-7860-e091-619c1202b1cd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Sep 2017 17:40:40 +0100
Message-ID: <CAFEAcA9Wmq+G6H78NdsVs5mKDrMcUkB30yY2d=3+KOnbT-pmAQ@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::231
Subject: Re: [Qemu-arm] [PATCH v2 2/3] hmp: fix "dump-quest-memory" segfault
 (arm)
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
Cc: Laurent Vivier <lvivier@redhat.com>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	Greg Kurz <groug@kaod.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YlEO1AT3eowm

On 11 September 2017 at 15:45, Thomas Huth <thuth@redhat.com> wrote:
> On 11.09.2017 16:39, Peter Maydell wrote:
>> On 11 September 2017 at 15:20, Laurent Vivier <lvivier@redhat.com> wrote:
>>> Commit fd5d23babf (hmp: fix "dump-quest-memory" segfault)
>>> fixes the problem for i386, do the same for arm.
>>>
>>> Running QEMU with
>>>     qemu-system-aarch64 -M none -nographic -m 256
>>> and executing
>>>     dump-guest-memory /dev/null 0 8192
>>> results in segfault
>>>
>>> Fix by checking if we have CPU.
>>>
>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>>
>> It seems a little arbitrary to assume that if there's no
>> CPU what you wanted was a 32-bit little-endian dump.
>>
>> Why do we have a machine without a CPU anyway ?
>
> The "none" machine is always started without a default CPU.

If it has no CPU then how can we create a core dump for it?
We don't (in theory) even know whether it's x86 or ARM.
(One day we may support multiple CPU architectures in
one QEMU binary...)

If the theory is hotplug-later then we're a bit stuck
because we need to know information now that we can't
know until the CPU is actually hotplugged.

thanks
-- PMM
