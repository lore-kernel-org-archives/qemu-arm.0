Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3223985wrt;
        Mon, 7 Jan 2019 00:56:27 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7xqwIJFaeGfKwWKhFIW9iICdvZwq5WuMj2//Rq2D2AhDqmZxQVr10I/kflyYlutbXQu6Lh
X-Received: by 2002:adf:b243:: with SMTP id y3mr53454441wra.184.1546851387708;
        Mon, 07 Jan 2019 00:56:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546851387; cv=none;
        d=google.com; s=arc-20160816;
        b=eQybvB+46Z0lb+xKqZ3aEiDSgnGV5O760zA/c9o7Rs9bQ3xkMqtoFtBrcJP+u83gS1
         PSz8VZ9EE/Xvq0+eTOhfmIrftHXq3bl0LDmOTBlqAo9RerSOdpJOPCcnKNDI3R1e1WOh
         5//fhqfhPFSO7C7TpriakcTMRGFTFubKzu/dQvbTc6gNfUofoZP6gsZIyODOs94oVTT2
         pReG/T5aXzZ0QtdZRBaXkLu/h7SsZiY8MzkWL8bebfV8lCf9DqPvsaVt0ksna2TOnykA
         s2maT4JZNWgAwJB3XltRT6KKG+bxkiofhI12Bf5/1J/ktziRAhw8llFYCl8+YKXxTGWV
         A81A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:dkim-signature:dkim-signature;
        bh=j9HbdxYTkip9VZDGXKdYQpqs65G3B22OjQcBixPV7gc=;
        b=HykEupN5B5MHwaYl3SbwGVSrZmbvlIQv5laxDqFjUOegQ4//i2B6SkWwrar/PlxyTJ
         PhGYumf13TjpnZWEHrCYKLUXxbk93DU9oSfyQ9Sj6MnC10mUymEy0bAkW8P8jBERVljm
         UZd43f1kKFW8QrmTBTK5VQvmb4I0LkvYV5Qq+QwHoKU4eol48UILEs9KQPxYcmJFEIhQ
         0e9gOc/6ELRDvCb/Qpelvijg0Gl7O0Xjtno2SZpeEYwxF4qaWDzRxKT9iDvClVH6H+iJ
         8YAYHBMO7HPOu0skM2q5Fr9sAwuiBpanZD/fTPILDHf2HTP9WpDfxEWXwtMENp+AuXCH
         Augg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=eCdThLhL;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=AAvRgUC4;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=AAvRgUC4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a186si4758235wmh.134.2019.01.07.00.56.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 Jan 2019 00:56:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=eCdThLhL;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=AAvRgUC4;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=AAvRgUC4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:57492 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ggQhu-0004RB-OU
	for alex.bennee@linaro.org; Mon, 07 Jan 2019 03:56:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60823)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1ggQhj-0004Qg-Uv
	for qemu-arm@nongnu.org; Mon, 07 Jan 2019 03:56:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1ggQhh-0006Ai-ML
	for qemu-arm@nongnu.org; Mon, 07 Jan 2019 03:56:15 -0500
Received: from greensocs.com ([193.104.36.180]:45292)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1ggQhf-00069b-Ra; Mon, 07 Jan 2019 03:56:13 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 30F94641413;
	Mon,  7 Jan 2019 09:56:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1546851362;
	bh=ncjTQAFxQE6AdMBmcGS0D4HlEjjuH8CxCneUlyHoaz8=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=eCdThLhL3mauItYH2l8FVSxMkYJ3LlZry+FHPSdZlb+L8YUi3OOf5rE3md9J7xNCP
	904oF9BBtlUEiPXgsG/l1vQRJ9o0/gR5xUEzyITbXvzRU5HYqS17J0fHhyk4JlXnCG
	17f3F5P3d2L62/wTLqFHKr3LSCIIuCTqUgPDIdYM=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=AAvRgUC4;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=AAvRgUC4
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vB2Tv8jSdJJw; Mon,  7 Jan 2019 09:56:01 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 361EB64140F; Mon,  7 Jan 2019 09:56:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1546851361;
	bh=ncjTQAFxQE6AdMBmcGS0D4HlEjjuH8CxCneUlyHoaz8=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=AAvRgUC4lZFV8qTMnfX7PH05nt/e+R9dmUjql1C/CSNElLHsDhDNsAPuItVFVOGUq
	j8UuiGzewNVOXMlRcB16hKd5x2RT6ToGHNJK4IaV3ZCXO3L/bUHofabD6XTxfzXkoH
	u/bUHhciOam62zfIxEnyS2FGRDy6yN9EsUgNF4Dc=
Received: from [172.16.11.100] (antfield.tima.u-ga.fr [147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id C7A106413EF;
	Mon,  7 Jan 2019 09:56:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1546851361;
	bh=ncjTQAFxQE6AdMBmcGS0D4HlEjjuH8CxCneUlyHoaz8=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=AAvRgUC4lZFV8qTMnfX7PH05nt/e+R9dmUjql1C/CSNElLHsDhDNsAPuItVFVOGUq
	j8UuiGzewNVOXMlRcB16hKd5x2RT6ToGHNJK4IaV3ZCXO3L/bUHofabD6XTxfzXkoH
	u/bUHhciOam62zfIxEnyS2FGRDy6yN9EsUgNF4Dc=
To: Peter Maydell <peter.maydell@linaro.org>
References: <20181207090135.7651-1-luc.michel@greensocs.com>
	<CAFEAcA9F2q6fQV13EDWFzuPYiFTDvqSCx_4P9aD=zP2RR5Kp0g@mail.gmail.com>
From: Luc Michel <luc.michel@greensocs.com>
Openpgp: preference=signencrypt
Autocrypt: addr=luc.michel@greensocs.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <8b118f0c-b2e4-3821-5348-25a9abbd7948@greensocs.com>
Date: Mon, 7 Jan 2019 09:56:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.3
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9F2q6fQV13EDWFzuPYiFTDvqSCx_4P9aD=zP2RR5Kp0g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: Re: [Qemu-arm] [PATCH v8 00/16] gdbstub: support for the
 multiprocess extension
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
	Alistair Francis <alistair@alistair23.me>,
	Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QfI9Njf2+Nh3

On 1/4/19 4:12 PM, Peter Maydell wrote:
> On Fri, 7 Dec 2018 at 09:01, Luc Michel <luc.michel@greensocs.com> wrot=
e:
>> This series adds support for the multiprocess extension of the GDB
>> remote protocol in the QEMU GDB stub.
>>
>> This extension is useful to split QEMU emulated CPUs in different
>> processes from the point of view of the GDB client. It adds the
>> possibility to debug different kind of processors (e.g. an AArch64 and
>> an ARMv7 CPU) at the same time (it is not possible otherwise since GDB
>> expects an SMP view at the thread granularity.
>=20
> I've applied this patchset to target-arm.next, thanks.
> (I fixed up a few checkpatch nits about block comment style.)
Thanks!

>=20
>> To test this patchset, you can use the following commands:
>>
>> (Note that this requires a recent enough GDB, I think GDB 7.2 is OK.
>> Also, it must be compiled to support both ARM and AArch64 architecture=
s)
>>
>> Run QEMU: (-smp 6 in xlnx-zcu102 enables both cortex-a53 and cortex-r5
>> CPUs)
>>
>> qemu-system-aarch64 -M xlnx-zcu102 -gdb tcp::1234 -S -smp 6
>>
>> Run the following commands in GDB:
>>
>> target extended :1234
>> add-inferior
>> inferior 2
>> attach 2
>> info threads
>=20
> This seems a bit clumsy -- is it just the limitations of
> gdb here? I was expecting that just connecting to the
> remote would cause gdb to interrogate it and attach to
> all the inferior processes that it had.
AFAIK this is a "limitation" of GDB. In QEMU context it seems like a
limitation, but when you are connecting to a remote gdbserver that
exposes all the processes currently running on an OS, you probably don't
want to attach them all automatically.

Luc

>=20
> thanks
> -- PMM
>=20
