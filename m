Received: by 10.25.44.15 with SMTP id s15csp2037764lfs;
        Thu, 27 Jul 2017 06:50:07 -0700 (PDT)
X-Received: by 10.237.63.131 with SMTP id s3mr3867142qth.90.1501163407146;
        Thu, 27 Jul 2017 06:50:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501163407; cv=none;
        d=google.com; s=arc-20160816;
        b=nbzaQrvbBCEkSb4qloFuX76DSSS89R0yZahqHSNNe1Js07yBtQspFBMhio3jjTVlPg
         O9QYUv67YYNkCocmgE3+yy9SjQ3nAPJ1Yw0tlLmfWkK9xaDQZuQeZrtESQkvHmSGtyv2
         NC66oasImpaKjoTknnsId1K0W7vo/f2+T0V/lHpyezhJK5NP9dbqt5H80ucgaOz7fIvI
         cZ32WmNXb2hc0yNndE/v4eRTdoKROWWP3TioCNnQY9YYaEnzPFQ9TofCNu5D/xbb0651
         HQR+hTIfH3slZH8g0FPfH7LpU1vnbYPC8284j4LnXIr/Zy+LnW6jm9JVWhzs96RrePTh
         v9hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=jSjGSqxPcGSUImvZ6h4WjAkiTfmVYamE4rjMSvTIibk=;
        b=XeFna8HmZ8ch4Ynutkmc/jxb5PW5Pc9/YIcLR5xBlhwRnsJ6jxo9lbOtKokkYrO+Ww
         cGfHk60SAvFh8NU60FHCKw01x8gS4WEK8WbwucHM67MC7L8hfqSLJUcX0JteAY9Sv3hF
         87Ouhipp2ZvZgxuY7TUIwcxv+9KcbKRDCS6QJ9LSlDSObVQ0NK0p7Ls5uhNTX6c8VW3l
         Q3vHDY7MpzjN3KMDOmT67ZYFEl/ZY2k3pSvroqGE5WOqZAYcAKRO6KBcRUStgAD6Cb13
         IzNv8L2gJ8y3ia7JPEDb5LNjtrG4B15+EY5+QxVPElD29k0pnlKJNtEVU5OGeSGanu3A
         swFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=YsH6eBVv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m88si15331100qtd.363.2017.07.27.06.50.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 27 Jul 2017 06:50:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=YsH6eBVv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43105 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dajAy-0004JK-CJ
	for alex.bennee@linaro.org; Thu, 27 Jul 2017 09:50:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52835)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daj9W-0003ND-2a
	for qemu-devel@nongnu.org; Thu, 27 Jul 2017 09:48:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daj9S-00022v-S7
	for qemu-devel@nongnu.org; Thu, 27 Jul 2017 09:48:34 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:35719)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daj9S-00022f-OD; Thu, 27 Jul 2017 09:48:30 -0400
Received: by mail-qt0-x243.google.com with SMTP id t37so6934952qtg.2;
	Thu, 27 Jul 2017 06:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=jSjGSqxPcGSUImvZ6h4WjAkiTfmVYamE4rjMSvTIibk=;
	b=YsH6eBVv5tsTuHZLCX2ebEIyVrKcHi9EMz7lXH9ZP41EnJofC/VvumAMkTdz9cMidN
	n+bgUf0x3+psawuC1GCGfT+gnRWD/9IjeVapDTuQRN2K2lz6FVkpNe3Do6KTXXdrvLDt
	mDp/eOSfI3pigD60Wi4lcXR9pJ74lBNnFJ0AFHUz4+/swElVXJ6n+/tDzG3ZQh+5lUQY
	1H29pvY9dMpybxvHHa5KStm0/p5OR74tYaJKWtb9u23LtnEB7Sc3M05LrOHJvN2aPVcN
	J264KrsDQtlDIwbIhPNr3/9XqY1WdDGgtIZS+J98cHijOQ+9/j0r0uMKwV6SSqecf8Qo
	N+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=jSjGSqxPcGSUImvZ6h4WjAkiTfmVYamE4rjMSvTIibk=;
	b=QgScWXc3sPnr34t/X0HLWo4O3k9sFNsg/Q85rn8daXMt1SIS/S9V1kMuDCoIZ6EPCk
	Kqp/WdY+5wzhCPYJs6a5LUlQf8WCoNsGvKbD+X2lShsxWxn1ypjxFjuCy/rWsIMCIRW7
	A59l4CZh3mI+5Xa2zNyROP0tBFXIJ4ZRZ4DJ/FPtxi79UWsqkyHPmYP99q1nIMSAXnoc
	KO2jQVE6fO7RBLlWNh0IbMhs+70VA42pSl05JBYZVpYZh51rGSLfNT6hSaS0u+BGlQkK
	ZmOvOzRm/QJGop/8VWeEJasCtJANEdnwQmI2v+LyQ0fBp1M1/atkxxzrL4a2rdtqglRR
	tYSA==
X-Gm-Message-State: AIVw110tygVElf3l3BNg8dpn1j8pFm/6iY0YB5kxFr+YZvi7Clls9hYD
	jjMysoskmvy9uw==
X-Received: by 10.200.4.170 with SMTP id s42mr3547826qtg.304.1501163310057;
	Thu, 27 Jul 2017 06:48:30 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	33sm14358073qtv.76.2017.07.27.06.48.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 06:48:29 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20170717133010.12784-1-f4bug@amsat.org>
	<CAFEAcA_rhoCup57nYYW4HN6Qsz3sp-cxY-OwsK-x=fYtfJ31aQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b48b8728-7cb3-3d6e-745f-1aee5c2038e6@amsat.org>
Date: Thu, 27 Jul 2017 10:48:26 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_rhoCup57nYYW4HN6Qsz3sp-cxY-OwsK-x=fYtfJ31aQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-devel] [PATCH] hw/arm: use defined type name instead of
 hard-coded string
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
Cc: Rob Herring <robh@kernel.org>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cQlGBJVSkhnp

On 07/27/2017 09:36 AM, Peter Maydell wrote:
> On 17 July 2017 at 14:30, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>
>> Hi Peter, this patch is waiting the IDE queue to enters since it depends of
>> commit de09efcc7b67ada3593354711b12a03dea23a9d0 to fix AHCI includes.
> 
> There's no commit with that hash in master -- do you have
> a commit subject or something that I can use to find out
> whether it's landed or not?

Oops I guess the IDE queue was rebased between this patch and the merge, 
or I messed my copy/paste :)

The dependent commit is 70e2337030f and has how entered /master, do you 
want me to send an v2 with fixed message? Anyway I delayed this patch 
for 2.11 since this is not a bugfix.

Regards,

Phil.
