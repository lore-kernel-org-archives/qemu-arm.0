Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1023954wru;
        Wed, 8 Aug 2018 11:53:11 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPwtn9I8XeTExCVm21cwc3e3yO0+TFN9XU3B2fCDreDG4+FcXaUqe4/eRV9foDkQ572sdk0z
X-Received: by 2002:a0c:9a0f:: with SMTP id p15-v6mr3694608qvd.126.1533754390947;
        Wed, 08 Aug 2018 11:53:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533754390; cv=none;
        d=google.com; s=arc-20160816;
        b=JXVeSGfCVS9OBnpk6aqUqjt3ToMsuupbHIzODrt7R+RPCds2iV2mBs6vsjBiR9bciy
         94aoZI3rMKsO19rZ/Hx96Bc0FLN2eMQnM2OtsiCc/Bd2Q275Nn2glazB6YDwhk88gF0y
         ZvGfnX0DxIGG+YrDwYVBjJ3gqahWw+XE02e6uDSTLrG7S0toru+LUtxzHrYVy9cHftFM
         nnC2deHXZ87TWIgmn8GFtQ8dB+Fo1kauJM0RNXNnDriR1pe5J77TKx8PLBWxjgKS1XJv
         YIaifvSeRZyldLQ4dcbs1MEIBpaLO+Tz9+2qv7GY3CkU0iW4YzMB6STkKdZERSPQdzdL
         OquQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=eM2JDEWmgXcxN2Ps0CN2EWP2KjYTmrwzmd7a7cBzkik=;
        b=Dqti+1xYls44jV+BNnUAM7kLEAVkKw2p0WqWvo3fmkcdU8W72eZC+60VsA8MkklLdE
         pWFvGsosHdreV1TH17bpFHmdX7ffJHPqnk226klCKhVfhygQLrPxk2dsEMBwuzDucPp/
         XEmWYqRjyqbTfCJylOtvGhX8P+ggqaoXfEjhDWvP9GpI0FfJtO+py4Yn+MRKmbNfd1RV
         K8JuRrJ6ME8JoSrwy8lQDF2XWrWRd4E/NvLQhpgRRZWYI3Om697eCJhsgFQt5tAqPi8q
         EC1sKFUYTfd10QtnjZjlJivsFWVa8h/WTRgoe9xC4LvxatxK0odBX+HxIA9O6884VswP
         zpnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BcQ4tS2i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l44-v6si4849189qtb.119.2018.08.08.11.53.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 08 Aug 2018 11:53:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BcQ4tS2i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45066 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fnTa2-00070X-Hv
	for alex.bennee@linaro.org; Wed, 08 Aug 2018 14:53:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45460)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fnTZv-0006xI-RE
	for qemu-arm@nongnu.org; Wed, 08 Aug 2018 14:53:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fnTZu-0001zo-Sg
	for qemu-arm@nongnu.org; Wed, 08 Aug 2018 14:53:03 -0400
Received: from mail-oi0-x234.google.com ([2607:f8b0:4003:c06::234]:35341)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fnTZu-0001zi-MA
	for qemu-arm@nongnu.org; Wed, 08 Aug 2018 14:53:02 -0400
Received: by mail-oi0-x234.google.com with SMTP id m11-v6so5592024oic.2
	for <qemu-arm@nongnu.org>; Wed, 08 Aug 2018 11:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eM2JDEWmgXcxN2Ps0CN2EWP2KjYTmrwzmd7a7cBzkik=;
	b=BcQ4tS2i8Ieu/QaE2R3bXeGLWDBVNFtoyzx6+IGU61nEgXzjKWM/MrSiG6eyZhmqGZ
	kJyfclvCyX/05VNHM+3KIflqlAn76HJ8TQbpYvjpaaPhN2ccqcSHahQNEN+26b8NrSTv
	jN9hh8Pdf5TPVTasoxaY4Dn9n/HCB/cKSsGD4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eM2JDEWmgXcxN2Ps0CN2EWP2KjYTmrwzmd7a7cBzkik=;
	b=Jr9zhfWDc/ZF1hl8T/wW91SIfExF9Vusjwfe5ZaCRP/IStOFKCb8v6LwUXxNMKJwiI
	kfp2xudJz55N3NRNOEhg1YzmDuxKTvHa5Mn61flmsWKkxH2RMm1Dv503Ts0lPLF8yADS
	FBsovigOBfz7N6i7bBdSw61Np/jieY23vuwIf6CTVElk4a4HsWGOu8goiakHF+H0m7se
	Ch4JE5gAD4SLjBdBzIHAh98FfL9VO3Nuxy7j6eQKfRG5kEwPrlpy6atLldt4PwIspFwY
	SuvQQvkISbTiRcoNteIY52SAnNP1B+TGG7yHhKLecxYz9Wyev1RcdR00IIokS+kjwX3y
	Yjzw==
X-Gm-Message-State: AOUpUlF9BKEi4+nwaAuGd2jImwWmlDJG0WjE0msm7heXDXVQQ2/qhhXk
	9MybkNmN+BPquo0a3yRBKqONrVMj39KUL4/SGwIuwg==
X-Received: by 2002:aca:f5d1:: with SMTP id
	t200-v6mr4240733oih.12.1533754381816; 
	Wed, 08 Aug 2018 11:53:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP;
	Wed, 8 Aug 2018 11:52:41 -0700 (PDT)
In-Reply-To: <CALxeBVBJxfD_UNE=9JZ0qn_VXF1fYU=m0WyFQqwJhCbqN7-k5Q@mail.gmail.com>
References: <CALxeBVBJxfD_UNE=9JZ0qn_VXF1fYU=m0WyFQqwJhCbqN7-k5Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 8 Aug 2018 19:52:41 +0100
Message-ID: <CAFEAcA-C9AXLqFj9_8QQmnZ=2+KbSWqgpgySsbbYMTJ-u79KAg@mail.gmail.com>
To: Sayandeep Saha <sayandeep.iitkgp@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::234
Subject: Re: [Qemu-arm] Regarding some issues with gdb
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
X-TUID: 8rMFYZ6s6d6T

On 8 August 2018 at 17:50, Sayandeep Saha <sayandeep.iitkgp@gmail.com> wrote:
> I successfully made all these changes on my X86-64 Intel machine. However,
> for ARM I tried with QEMU. The test case was a simple C program for
> calculating factorials using loops. I ran the following commands:
>
> Compilation:
> arm-linux-gnueabi-gcc -g -static -Xlinker -N -mthumb -masm-syntax-unified
> factorial.c -o factorial
>
> Run:
> qemu-arm -g 1234 -L /usr/arm-linux-gnueabihf/ ./factorial
>
> Next, I invoked gdb-multiarch from another shell to debug the program.
>
>
> However, when I try to change some instruction using "set" command of GDB,
> it says "The memory location cannot be accessed".
> Surprisingly, I can print the already existing contents of those memory
> locations using gdb's print command. Also, I could modify register values
> successfully.
>
> I am really confused and wander whether it is possible to change memory
> contents within QEMU, or not. If it is possible, what is the step by step
> procedure for that.

I don't think that this should vary between guest architectures.
Is the memory area you are trying to modify actually writable?
If it is part of the ELF executable you are running, then it
might depend on what the memory permissions the ELF file sets up
are (ie if it's read-only). I haven't checked that.

thanks
-- PMM
