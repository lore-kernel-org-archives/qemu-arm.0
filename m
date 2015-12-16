Received: by 10.182.158.201 with SMTP id ww9csp3442780obb;
        Wed, 16 Dec 2015 13:13:22 -0800 (PST)
X-Received: by 10.140.128.87 with SMTP id 84mr54813083qha.54.1450300402903;
        Wed, 16 Dec 2015 13:13:22 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 78si8177352qhb.120.2015.12.16.13.13.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 Dec 2015 13:13:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49387 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a9JNy-0007OX-9y
	for alex.bennee@linaro.org; Wed, 16 Dec 2015 16:13:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44753)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1a9JNv-0007KI-0x
	for qemu-arm@nongnu.org; Wed, 16 Dec 2015 16:13:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1a9JNu-0002EJ-3a
	for qemu-arm@nongnu.org; Wed, 16 Dec 2015 16:13:18 -0500
Received: from mail-lf0-x232.google.com ([2a00:1450:4010:c07::232]:33001)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1a9JNo-0002DI-U0; Wed, 16 Dec 2015 16:13:13 -0500
Received: by mail-lf0-x232.google.com with SMTP id p203so38967021lfa.0;
	Wed, 16 Dec 2015 13:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=l0C0etxjEgW4Vh2TQPq6c+pUglrLfZCPWJEy5G0eZ5Q=;
	b=Vhrkt1PwmCRgMnuHX7b6H55Krwh1IpSlFdWaNBaIhZU653LBk7xaNazrNsPzEKYWnP
	w6hsH8CocmKTSiWdtYA6r/JWWCochFVrN3ac9gqmVbZQrbRk+hG/3sN90twPRNkuPvOM
	PwxZSnoGOYn7SxAWmLsZXVOgvhGUEe0bVL+T0MYtAIHJKyyBEcWLMZnZS3q7+UCxuaFQ
	7mEiKgKziNtmjkCV/4Ov1G39yb1+qMegp5sHvTwq9Z/1K7vByXYHs6OdPh26QCJJ4ZMR
	f5wEt63JPLPESHDLzIr7Av5WD9eEHnvtO93UF5wPfEpa5pqdgDfdZNMSlBCt9tA0e8qp
	IgXA==
X-Received: by 10.25.88.208 with SMTP id m199mr19570478lfb.157.1450300391828; 
	Wed, 16 Dec 2015 13:13:11 -0800 (PST)
Received: from [192.168.0.65] (broadband-46-188-121-155.2com.net.
	[46.188.121.155]) by smtp.gmail.com with ESMTPSA id
	dz7sm1354312lbc.21.2015.12.16.13.13.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Dec 2015 13:13:11 -0800 (PST)
To: Richard Henderson <rth@twiddle.net>, qemu-devel@nongnu.org
References: <1449773244-17078-1-git-send-email-serge.fdrv@gmail.com>
	<566B5E9E.8040108@twiddle.net> <566C7D38.4040609@gmail.com>
	<566EEC05.2080702@twiddle.net> <56707FD3.20705@gmail.com>
	<56719970.9000106@twiddle.net>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <5671D3E6.2070808@gmail.com>
Date: Thu, 17 Dec 2015 00:13:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <56719970.9000106@twiddle.net>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::232
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Anthony Green <green@moxielogic.com>, Alexander Graf <agraf@suse.de>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Leon Alrae <leon.alrae@imgtec.com>,
	Aurelien Jarno <aurelien@aurel32.net>, Jia Liu <proljc@gmail.com>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] target-*: Get rid of "PC
	advancement" trick
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: gllb4G7azAW1

On 12/16/15 20:03, Richard Henderson wrote:
> On 12/15/2015 01:02 PM, Sergey Fedorov wrote:
>>> For that, I think it might be interesting to arrange for non-empty 
>>> TBs to
>>> exit prior to recognizing a breakpoint.  So that a breakpoint TB is 
>>> always
>>> just the one operation.  Except for the fact that "generate an 
>>> exception" has
>>> traditionally been a target-specific helper, we could almost make 
>>> the entire
>>> breakpoint generation be done in common code.
>>>
>>> I'd think something like a generic "must we end the TB now" 
>>> predicate would
>>> be the proper hook.  It would contain all of the usual stuff: 
>>> tcg_op_buf_full
>>> and checks for singlestep, but then add "is there a breakpoint at 
>>> the next pc".
>>
>> This could be a next step :)
>
> Or perhaps a first step, since the patch you posted doesn't seem to me 
> to be an improvement at all, merely a rearrangement of code.

I should give it a thought. The main motivation of this patch was to 
simply suppress useless disas log and the instruction length mismatch 
disas warning in case of an empty TB. The original reason was that there 
is a place in ARM translation with "PC advancement" tick missed.

Thanks,
Sergey
