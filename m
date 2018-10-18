Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2056831wrt;
        Thu, 18 Oct 2018 03:21:03 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63ZJPvik2U7QeQy6iT0eNSNBzlWBRNXYWpkmh6lDPdywgjmKjzxom/QyJxtn9VG7NfXjKgm
X-Received: by 2002:a0c:99e5:: with SMTP id y37-v6mr29509016qve.133.1539858063779;
        Thu, 18 Oct 2018 03:21:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539858063; cv=none;
        d=google.com; s=arc-20160816;
        b=ntQVwBs41P+jMeUKNWvrC6L+wD/zcvFdzgw14hTBQuc/ZO/YUKkHKMboxD8XoLrLuE
         jYmf6L0jiUu/vqqop8KeNwXYyDWlsvljYcWKjYPXH5woXcLArpnRFw6nzDTNQDEX8Sg/
         E9Gl0WfL0+yO0F+qahe0Bl85KFa1tkCplfogRqdr4G4inFyaYNNK+duEezmbkjetXQOf
         h9nIcytqBAhwxWaZWkit1qZHk+d1qWbtm+KS3vYpJ3xdp1dOon3xRtyVLrPEXSu7ekjV
         qk58dVHW56Snl1nk0db9Ucby3Qpn1MOqE6eoHoTub/M5LYFMtlU8SwJqtRIqdRPx3eDs
         kjAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=zV0uVxtrd58r6Up8ouAOQIVoUcQHsyCn0pFdforhIKM=;
        b=RVTaOXbHxzCBvPXTINfQODHeDfGls9EPj7oBANlwSdqb9p8t4v5HvO6Ci2O1HCeDba
         ngzKYIELOCEv1i/rdFH76vT6QWafFVUc6UER5dPObM14q+M2ZaBRzgkX9vQstoDy8YWn
         WACOwTJweZX4YjCpLCjrYBQ1MAaI3pq06sYPM/R6/+tguoO8R0RtIZpDq8u3k85JhJ23
         3gpNbpjQP+IRkk05xv7rmCVgTNDnrhBXXhJq0ShiPdTR/SlN0JgE9IZWHC4uBQwU6Dsh
         b1JZotUp6QO5Zxr56kbIbqLPe7jaoB2D602uR22gO/rniSY3ZsCtxGE8fDRHBmHXDQ+g
         OTCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kfb7xUrE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m19-v6si7766851qtg.144.2018.10.18.03.21.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 03:21:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kfb7xUrE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41469 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gD5QN-0005fB-A7
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 06:21:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52548)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gD5QA-0005eL-6j
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 06:20:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gD5Q9-0000Vb-5u
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 06:20:50 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:46865)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gD5Q8-0000Um-Mp
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 06:20:49 -0400
Received: by mail-ot1-x342.google.com with SMTP id o21so29186361otb.13
	for <qemu-arm@nongnu.org>; Thu, 18 Oct 2018 03:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zV0uVxtrd58r6Up8ouAOQIVoUcQHsyCn0pFdforhIKM=;
	b=kfb7xUrELh97Mbqk2CWuEv1sX86iWZiTpuS0f3S7HELinGv7d9MFzhvwUxD8qjwJeH
	D2ysRef5S9Yj5SPdBgmVAHAWZfncvI/VibEqhGHJb9ggffMF3B5YQcHFbvgRrIo7FHlb
	g5NWRa/hkfcIaFb33XDp0RFTyUn4RfKkUTTNw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zV0uVxtrd58r6Up8ouAOQIVoUcQHsyCn0pFdforhIKM=;
	b=m6/mIcv6jh/a1ouUwG+3Rbb786pkfHp0p0Hs+CuV5Hb0PIJgU01elmMNhoZM9hwD9Z
	X3aKHMrPbe26m4hs0XT47N304yQsE4xEQqcQoE/T66Dwq7OU/yspPIi/wGDKqvFP+kXW
	uc8CZTZVwEkaQNkf7Bs25Zpf5jVMG8XBtaerF+isbZ6J0DdUcPTIY/csGk+SliR4eV+J
	KkCNkMk++syHkkzinyrdBUbQBlILB0r/wuRkp3EcA9YQzHixzoCKyeq0GrXUIqaazuLq
	dNIai6LiTZYiPuz2y/udmR9S5EuBtLn5W6iKn7WYoGBDsVNuhYKZsQGgk2ZIQTdw+ERJ
	JAuQ==
X-Gm-Message-State: ABuFfoiiF6FvSATKeir1ZghxjOnZWwKCzNMYrwhLDfgR4jYPkTkjr7nj
	NvG25xe7Cr1JFzngbUO1JCPaQrsAIvkH62/gj9VDvg==
X-Received: by 2002:a9d:1ea3:: with SMTP id n32mr18123656otn.352.1539858047927;
	Thu, 18 Oct 2018 03:20:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:7c90:0:0:0:0:0 with HTTP; Thu, 18 Oct 2018 03:20:27
	-0700 (PDT)
In-Reply-To: <ddceb720-97d2-22fa-e58a-7283fb416c29@linaro.org>
References: <20181010203735.27918-1-aclindsa@gmail.com>
	<20181010203735.27918-13-aclindsa@gmail.com>
	<0fdcad4a-c8b5-3309-d2ce-f9be901ec52a@linaro.org>
	<20181017192013.GA25905@quinoa.localdomain>
	<31f327f4-42ee-55fc-596d-97d935803867@linaro.org>
	<20181017202505.GC25905@quinoa.localdomain>
	<ddceb720-97d2-22fa-e58a-7283fb416c29@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Oct 2018 11:20:27 +0100
Message-ID: <CAFEAcA8JAtBQC3GpjBOKYdtx9OC2r6bcZpkAjr3wyyik11efNA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 12/14] target/arm: PMU: Set
 PMCR.N to 4
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
Cc: Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Aaron Lindsay <Aaron@os.amperecomputing.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Aaron Lindsay <aclindsa@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6yCeqTp+9iEM

On 17 October 2018 at 22:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 10/17/18 1:25 PM, Aaron Lindsay wrote:
>> I suppose pmcrn (the local variable) should've been set to 0 before this
>> patch and updated here to be 4.
>
> That's plausible.
>
>> Anyway, by splitting these patches apart, my intention was to separate
>> the plumbing work from turning on the water. If you believe it is better
>> to do both in the same patch, I'll make that change for v7.
>
> Fair.  I'll let Peter weigh in for final decision.

No strong opinion -- rth has reviewed this set, not me.

thanks
-- PMM
