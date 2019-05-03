Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp825508wrh;
        Fri, 3 May 2019 10:29:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqymGsCpi518tIDjqLnGsq/kpgy0Nm0FVE7jt/14yRO/AFkbx26kfM2SB/GsytT80k8Xw11E
X-Received: by 2002:a1c:1941:: with SMTP id 62mr6836460wmz.100.1556904566560;
        Fri, 03 May 2019 10:29:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556904566; cv=none;
        d=google.com; s=arc-20160816;
        b=FTFQZdP5SItrWRB+IV5qV6yMeiC9Bf10fe5ZLABuRQMe1xlJ5W0aeQVK8wkmDFRKB3
         X+nK2x94MsBsOAx8hR+W58F4Ogr1PcEuPYLEKbHLk6A8bDne4DkVEdJofJRJZjWzsIjw
         cg7VPrpdM8bf1SQWzndf48h7Wc50xg39510ftsY35VmBAmKrawkpCaEiEh+cw/zFE6Wz
         +Mg13/f6mbLvduG8sPAlLWYKROpKo60C4F9YHxRs9moOh3GWFAwtor+bhl9elwqpjv8p
         4WeM5WDJo49pYntY5GV6neoQRMNHGgUZFpwvrgCu3cFaO2hZ/MiaeIXD+6MYxW+eFu7L
         OK4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=ikes8mF0FhZpHpSmoC8srS/5Qg8CHdYfjIF4dDnGaKQ=;
        b=rDpIlLBUz6ZRGKvypkjjeF2NiWDyJDFyvbSJ9bSwAFmnpAn4os2OO3m8NAzXhPXKZu
         f9GWTiLsQjUfu8U4jQv7xI9XJfjUEsX2t9XwGsl2PfdIIOu+bX221EhH1rIuSrlH3sZ1
         f4C4YuH83hLYvD4jutmzyuDlOPd11g1ywLJi9ZTl+SzII6b9OVpTMn0o4Hf+IkE+LJnJ
         iogXzV6Dqq0Ul/zmjo9HcrVVRQbuIZiH3wFIaRnmKCiMdh1w5YtbVQWfrZdF3EyVxG8r
         QQVOGhKtzqRwEmiuKeHJB8EcLv3sbqlUns5A+H/ujVZ+aNByB7VfziF7eIXN8AX6kZK/
         eM5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yOQlBFvu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d123si1695572wmd.21.2019.05.03.10.29.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 May 2019 10:29:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yOQlBFvu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:45078 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hMbzx-0007el-Ma
	for alex.bennee@linaro.org; Fri, 03 May 2019 13:29:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37485)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hMbzq-0007de-7W
	for qemu-arm@nongnu.org; Fri, 03 May 2019 13:29:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hMbzp-0008LJ-CW
	for qemu-arm@nongnu.org; Fri, 03 May 2019 13:29:18 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:41951)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hMbzp-0008KS-3t
	for qemu-arm@nongnu.org; Fri, 03 May 2019 13:29:17 -0400
Received: by mail-pg1-x541.google.com with SMTP id f6so3021821pgs.8
	for <qemu-arm@nongnu.org>; Fri, 03 May 2019 10:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ikes8mF0FhZpHpSmoC8srS/5Qg8CHdYfjIF4dDnGaKQ=;
	b=yOQlBFvu3tUcXVi2th81lIMPvyzlJQawRLk0FDtPGbzO6qQp/u2hRQquFWbmlLljYJ
	EDJweLhbLosF7d63inUJRU6EV4SByvwMXgaMtvARoQfYSx5NkaYchkSmRBjqIz8usuKW
	76laoZ01mjqa2aE6rfeJAYk30wl+VOx/s08vwgbDNIjcDvtQHNCjKm787FxH2s8hhmeD
	WjF0Idsn8vCJbaIFkQP7b+YjgKqJGYVIBLZ8paFa4hqAiu8o7+tQuIBBbOK5196gwI0h
	naaArEarwmeL3QlJ8yH+EFEDolQYY5NMbv+y7iq7idnGDtWz0Sw5UscH7uWLaJH1SpfG
	edYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ikes8mF0FhZpHpSmoC8srS/5Qg8CHdYfjIF4dDnGaKQ=;
	b=uMzqk9Z4+x9kuvNbeTLhkOS1uTIc1pbLFDnzkqh+jhXhK6EAAU1IlOS/PnasSxWsX5
	mw3iJSW6+ipvzdCBs94x0VZwL/mpsv4y+Z+xAvxmTEi0Um01CT71DwWGWQa6+knxZ5Ar
	C5VD6YLuarScaP+QtqUbBMFAR+vKsVX6JnU2X9emRoQp19OLUgaOR6wb4KtqYWm/PmIi
	hTioJjniEGtoZ+75LNrz4Kww3SK6qCREgx6/3/3tZIL2agPY8By6dSkqOYWzB7MDbmfl
	cTo09+LwDb0o9/JWhAie6PcqYqwwwqKEczVXzypEUDCyEhDX+U7qHw3KemdKLeQRgxY5
	AFpQ==
X-Gm-Message-State: APjAAAVmLCp/84/yPySDl4w4DB9qe86y3Y1U8ML65s27Q9YLh+cfv8Za
	XPnja6Mhuh/hzELIoW2l8ida/A==
X-Received: by 2002:aa7:9089:: with SMTP id i9mr12488571pfa.115.1556904555643; 
	Fri, 03 May 2019 10:29:15 -0700 (PDT)
Received: from [192.168.1.11] (97-113-189-189.tukw.qwest.net. [97.113.189.189])
	by smtp.gmail.com with ESMTPSA id
	s6sm3559036pfb.128.2019.05.03.10.29.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 May 2019 10:29:14 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190411153942.4533-1-peter.maydell@linaro.org>
	<53930e87-3bb1-fdd5-a8fe-8603c0adecc2@linaro.org>
	<CAFEAcA_GZPJj7OQ-jK1TX4wKS4hO6OR43OG0Y3eCuxVdiUtsnQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <b798a938-f26a-65df-c718-7a174dff7fb4@linaro.org>
Date: Fri, 3 May 2019 10:29:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_GZPJj7OQ-jK1TX4wKS4hO6OR43OG0Y3eCuxVdiUtsnQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] target/arm: Implement NSACR
 gating of floating point
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jkb/2iq4TFxX

On 5/3/19 6:13 AM, Peter Maydell wrote:
> On Sat, 13 Apr 2019 at 08:07, Richard Henderson
>> This one does do the right thing, but better to clear the bits on write to
>> NSACR.  This lets you avoid the change to fp_exception_el, and the missing
>> change to sve_exception_el.
> 
> Hi Richard -- I was just going through the review comments on this
> patchset, and I saw this bit. Could you clarify what you mean by
> "the missing change to sve_exception_el" ? Since SVE is AArch64 only,
> there can't be any configs where we have SVE and EL3 is AArch32,
> so I don't think these two features should be able to interact.

You're right.  I'm going to assume I had been insufficiently caffeinated at the
time.


r~
