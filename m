Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2790597wrt;
        Thu, 11 Oct 2018 10:12:50 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63B+zs4F16zpDuJDMy0HkhUqHROpzVdyv0vsAfmDNbWwYl/LpfF54xXXfKpzO6KawKV6wvd
X-Received: by 2002:aed:2b43:: with SMTP id p61-v6mr2513350qtd.107.1539277969655;
        Thu, 11 Oct 2018 10:12:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539277969; cv=none;
        d=google.com; s=arc-20160816;
        b=BDFh7X3XK51VPEvhiXUo0lmdqwSVLEsW7NR2Pn+i+SuFq0ujXniRx1NBQeBZqBpXAN
         zD5et3Q3jCP/wDawgrUzAKvQBVexsYpzXDTRU59a0Pw2yrMMTlvmSPZZJH32aWVynLk5
         OvwSqBKBwzxXZ/Xstsyfg/RqP0SOeG0mFENgSxa3ZV5L3KbS87OkMN69lbGfYwalLb58
         eIZEXo+1qxwaXabO8uMJFuH+K9fOFGy71VlW5SCVjVE7g7/npZzfaxErhwVpXmq+fx9I
         dr5ikg6bpIOuXDdYK8bcjKY+5UDg1h3hUGcR0UO2lJ7Yc7gjAcEwly7R9zalpvtMHUtR
         Ic3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=gf325dtQ+FmobrTqvAXJk6vr7qHXJhWoc2mRie6NmaM=;
        b=hwjeHZCwmV/AD+a5HorBeAMKoBLQkirO9tN005VW4EfzIlb/+vL7DRvVS3Lgojc35n
         kz4DJt7sV3ptF+jvtgTuCv62u8yZ1mi7PDYeBqk0sMxZhmuw8vvg1xpst2F9p7Br3kd5
         AoUm3xEIsAjZtlCHGI6Tqj9ijWP6OY08kUl+6aWrJczk0nVMzQvbSXWjiqJnH17sAGVc
         8NG4Tv65NbSH1Cs5omFC/u5W9l53SjHImNHHPrsskjJJpBExWnNABf1pWYOE5+092dtB
         cpFYsuHD+D1G5VDEhAFvNmS8LsWgQnw8NkPp7leqQzgRhFZsWDcINTYm8AhLw1TbJPKF
         IUFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=N91RIMws;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d65-v6si7068295qkf.59.2018.10.11.10.12.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Oct 2018 10:12:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=N91RIMws;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35622 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gAeW1-00029f-4y
	for alex.bennee@linaro.org; Thu, 11 Oct 2018 13:12:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36186)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gAeVk-00025i-3z
	for qemu-arm@nongnu.org; Thu, 11 Oct 2018 13:12:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gAeVh-0005Sw-WC
	for qemu-arm@nongnu.org; Thu, 11 Oct 2018 13:12:31 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:33021)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gAeVf-0005Ne-NS
	for qemu-arm@nongnu.org; Thu, 11 Oct 2018 13:12:29 -0400
Received: by mail-ot1-x344.google.com with SMTP id q50so9687356otd.0
	for <qemu-arm@nongnu.org>; Thu, 11 Oct 2018 10:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=gf325dtQ+FmobrTqvAXJk6vr7qHXJhWoc2mRie6NmaM=;
	b=N91RIMwsnqcDZ2n84kkYRh7gTbJa/TPyiOB6BfqZ9SCbYGkvXgLsDkYyNPq9i6VXG5
	H8CFjXlkRRmRjJPT3ns8C3CayH/5gRSBKM7awSYPi4pFWGnINc6z3+6qa6r+/5ajqvfT
	YG4TzyB2vPQBF7sjcfvK9msj0QsSa7u3bRCSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=gf325dtQ+FmobrTqvAXJk6vr7qHXJhWoc2mRie6NmaM=;
	b=DqQJ73oZXPj4Yf6vl1QqIMSVI0x5M0pH26QHfNcCjG23dC4tHWiLsCAuksHdqcbGZy
	07+4Ge9h6XZV5HNW7FTCJTxflqvFDtsgjkjzdmBPMhqXXJjwYkrySbe6liPJtSfpKWGR
	TEYXG6/CFihpaWPQ7WXEGjSIpO6WogHSEjJwbhEImYiftCK8GgNd+lO/Erj/XyA4y30z
	bA1wtMeNRPT85il+5PH4noT1m1xftfjwDENzgvFfgLzOlsXpocVACJ89VIaYmUGii+4C
	Ygf37Q0jywKvMZX7YexDe/UYQMgdrQxPZjVNO87LD2sbS3k3P5YMtsq5jNxxtaatLEjw
	9HwQ==
X-Gm-Message-State: ABuFfoisX1F7VYnyUTQpBzr0fdIfvBi0pircwX0w2fVa4kJj1TmaNAUq
	t5ww4ja+pJ/+dkkk/hJKVnE9LeW+WpSMGA1a8O8dsw==
X-Received: by 2002:a9d:420c:: with SMTP id q12mr1650757ote.317.1539277944039; 
	Thu, 11 Oct 2018 10:12:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP; Thu, 11 Oct 2018 10:12:03
	-0700 (PDT)
In-Reply-To: <8bee981b-298c-10ab-7f0d-4d0c2d2c8e02@redhat.com>
References: <20181002142443.30976-1-damien.hedde@greensocs.com>
	<08d9d1e0-3c37-4b69-bb68-bf993b91289a@redhat.com>
	<2dddf6d3-4362-9ed1-18b5-f927e850c10f@greensocs.com>
	<CAFEAcA-mv2k=fe_QoBpdow4afm6QR2BPAAaD+aC3hdxEfvcPAw@mail.gmail.com>
	<8bee981b-298c-10ab-7f0d-4d0c2d2c8e02@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Oct 2018 18:12:03 +0100
Message-ID: <CAFEAcA8y0X-7njxMj5j6q4v7UGP0FVsn0Gy1oty2e95xa22-xw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 0/9] Clock framework API.
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
	Edgar Iglesias <edgar.iglesias@xilinx.com>, Thomas Huth <thuth@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, konrad@adacore.com,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N4aB9jmgclSd

On 11 October 2018 at 18:00, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
> On 11/10/2018 18:23, Peter Maydell wrote:
>> How many devices have a clock and nothing else that would cause
>> them to be non-user-creatable (ie no GPIOs, no IRQ lines, no
>> memory-mapped memory regions) ?
>
> I'm not sure I understood your question.

Sorry, let me try rephrasing.

We started with the question of whether devices with clocks should be
marked not user creatable. It's already the case that devices with any
of IRQs, GPIOs or memory-mapped registers can't be user created.
(In particular, any sysbus device is not user-creatable by default.)
So the question was intended to ask how often it matters whether
we can't wire up devices with clocks on the command line.
Are there any devices which would have clocks, but aren't *already*
ruled out of being user creatable for other reasons? If there
aren't any, it doesn't really matter much that we don't have
a mechanism for command line clock wiring.

So I think the answer is:
 * almost all users of this API framework are going to be
   sysbus devices; those are already not user-creatable
 * any device that uses this framework, and which is not
   a sysbus device (but instead a plain old qdev device)
   will need to mark itself as not-user-creatable by hand,
   the same as if it uses the qdev gpio APIs

thanks
-- PMM
