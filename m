Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp3517896wrd;
        Fri, 21 Sep 2018 12:40:01 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZOwHN0aVec9EAE82awWpLFS/AfBQDIw/j3U73lBQ5DPwIGE4LihFbmKUvf0+UAf4qPD/jj
X-Received: by 2002:a37:d7c5:: with SMTP id t66-v6mr8011755qkt.336.1537558801092;
        Fri, 21 Sep 2018 12:40:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537558801; cv=none;
        d=google.com; s=arc-20160816;
        b=y4efPve3kTDgpVfxYOLU9WUQA1sIbuav57SaExhNsew59jKcKVqhp74D7AzFz+V2Fy
         CFkfwTOEnNAIU3+/bGlIViVmNgXPKjy0vpXqeQFPenDW8sXy5YLEut1Il+6G8pbCwwOh
         1PYMWuAKJH+imUAwJxc93sl3gXffr7aZO0QkVJdUzRxSjG2YvU9qjoURThuYGdYvV8w+
         gm0xmQ5YRwzTTbvrd20P8tedFl1ZwerHHAZ2d0jyoH8e1/bXYdKkUWSypfi5L1A/FWEW
         q6bWnTacZVC3G9r63oVgJYGlYc9RFI3LYE/upb3Buh1qNwLkAYzJMRUvDdphOeCP65bG
         eBJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=NVwhxkCcgEirZW8QQ+TnQZilIsyQe9z6JIRw/GjaoMM=;
        b=twigTu/Jc0R+mGW7tKg5S0eJljj6nlXCxrpkG9LD9+3fBlouuYn9HcAy9ys2yx1J2S
         gFYmDEELhF9j3aQy/S4JG/3yHozHP1gDLbt5t+uE5LR/zN3ytSOnmz1frFtKK4laH1Cv
         Sen9rZwizC7ZgcysO54X5JtjF3rbID/u6JQ/f4f8jWJ6N/2plHvE3OTrKf2jlms7Sf5i
         Cvk+2facaB7KGbWylRz2zdqR5UjUIexbfVhPjj2wXlyv54+ygBdziQ8pR6z28LlfbvJd
         Yu6oh964SVlICMn9Tu/h85CjdStaQw6LCNU+EZaLRlSm50S3uuUldjuUWe8SKH9vWeUm
         CItw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YGGLbDSv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b190-v6si63622qkc.304.2018.09.21.12.40.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 21 Sep 2018 12:40:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YGGLbDSv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57110 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g3RHU-0003m9-MO
	for alex.bennee@linaro.org; Fri, 21 Sep 2018 15:40:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60460)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g3RHN-0003lj-I6
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 15:39:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g3RHM-0002Tp-OB
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 15:39:53 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:46997)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1g3RHM-0002SM-4p
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 15:39:52 -0400
Received: by mail-oi0-x244.google.com with SMTP id y207-v6so12336114oie.13
	for <qemu-arm@nongnu.org>; Fri, 21 Sep 2018 12:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=NVwhxkCcgEirZW8QQ+TnQZilIsyQe9z6JIRw/GjaoMM=;
	b=YGGLbDSvlh/4nWskaDs+RpJdNCgO+AtNsfX6wHiH7yAOtJQYxUb4tbBTy4GGq7jriR
	wZwe85OouGGzgF22icVCxg09iNPOW6ibOf17/WTFcY7zR9q+CYDpFKRD35PpkkJmGDag
	tSCA9gpq3SfEXCvXWkslBaIPaSjV6uNxkhIyg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=NVwhxkCcgEirZW8QQ+TnQZilIsyQe9z6JIRw/GjaoMM=;
	b=iuebhXDG8p+UZY9q942vLqtcoIDGiq8QJEBZbyC8y8fykQUtvwtE6k63AIKrMRXtqA
	NSrlOFBJU8NPwqIwUvJkS3tTMUHbtSVkFpO5cw/rzeEWTagVPI3WHI5MKvdsmOrKXr7U
	AArK0U+lTTeqV1NXx045zeEXA738Pzg0R2CFmEX9jbDIe8XpwkKUo0rD2MlTtDsdSRs5
	42hWT0a4ZhlzprGaqtrXKiw6LN+BNFbgBI6jCFrslHiazMbVjgfHPNx5ZsefxElmiXec
	3w4ZcSV0KzpIdxfLJbRMZqptoCsmVXjsZI8oSjjd+5fg9b4oN16DACTU0YJG7xLytYUc
	/5fg==
X-Gm-Message-State: APzg51DtWTCp2AXTpP/IMd/PdaBqxT/KTVub7KBbRVlSd0bU5MiVn36x
	rg4qmFtf2v6YJBvZQAaSYeuFAAwQmV9fZuohV3fD/g==
X-Received: by 2002:aca:3bc2:: with SMTP id i185-v6mr8070oia.156.1537558791192;
	Fri, 21 Sep 2018 12:39:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP; Fri, 21 Sep 2018 12:39:30
	-0700 (PDT)
In-Reply-To: <F594E1D2-CAB1-48DF-9A78-66C3DC66F41E@gmail.com>
References: <F594E1D2-CAB1-48DF-9A78-66C3DC66F41E@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Sep 2018 12:39:30 -0700
Message-ID: <CAFEAcA-QWubs8FWWYuD9KjDnkjuVodtx++8DtHvsCC2AbDZSKg@mail.gmail.com>
To: karthi mohanraj <karthimohanraj.in@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] Arm Cortex A-72 Emulator not able to configure
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
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nIP9RXPiwwYd

On 21 September 2018 at 11:04, karthi mohanraj
<karthimohanraj.in@gmail.com> wrote:
> Hi All,
>
> I=E2=80=99m new to Qemu Environment. I was trying to setup a Arm (64 bit)=
 emulator
> for getting hands-on and need to setup an development environment. I was
> not able to find any document or any working article for setting up
> the ARM Emulator using KVM. Can someone help me to point in right directi=
on to proceed?

https://translatedcode.wordpress.com/2017/07/24/installing-debian-on-qemus-=
64-bit-arm-virt-board/
To use KVM on an Arm host you should just be able to pass
"-cpu host -enable-kvm" instead of "-cpu cortex-53" (by
default it will use emulation, which will work but be slower).

> can this be achieved in Nested Virtualization?

You'll need to be clearer about what you mean here, but in general
nested virt is not yet implemented for arm hosts.

thanks
-- PMM
