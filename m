Received: by 10.28.91.67 with SMTP id p64csp2065307wmb;
        Thu, 1 Mar 2018 09:04:40 -0800 (PST)
X-Google-Smtp-Source: AG47ELttOENUJEZPn8+bIwfov1Q0Pz2OhULRDQhkPqE6YN4m7lvPlC1cymAXzjh5TtjMZtGcy//e
X-Received: by 2002:a25:ba4f:: with SMTP id z15-v6mr1722925ybj.472.1519923880878;
        Thu, 01 Mar 2018 09:04:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519923880; cv=none;
        d=google.com; s=arc-20160816;
        b=ee+D3A5ANRXCHEmZ6x+jfAqMYyA94m8oYLq1zFm2/MKdAmkz+8SuSIGKHWox/U4c90
         bAq4jpFk9uQAW33y63MURMe/Ev3aAHPqzQ0GzRqQ0zFIosIexYpNaiVWrPfreWrN7ocl
         ow6+7XHO8dP6sZ+wof9SeQtZFj7s+XloYbn50SAoYS5sLUm2wmFuyOpAJCzyXkQcj3bg
         rTHGufd9yYtF+3NtxtCal3xp76bNrhe5A1grZWacCv1j9dtsydwglIuStLPVUg4XAhre
         RjkHvnFODJf9SxHWhlH5KXFfBPwYBLmENeSkzbhjdOxxVtRas91JvNur7oXn/sKJl7JK
         Qj8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=9o4G05SljRk2lTnvcUnPl4v24sthCC0QcSiyvXnP3y4=;
        b=hjJPmKKmb9hrh1KK0uEsR3ChUsgnlh2Tuf4E4Ll7uN+dRPMyCfFSLYALuPsf5CPY+x
         iU+agrwmtu+/66NYRasIhMAk52iBk0Lzb+6I7r8K72TGOFg4MFfGe9Z80DLJSDRDL5TO
         Nj9ZL2/8SfV/nGzWy2/oVh6YoViNEccS2oPi0K98JE05JEHKCevMYlyZyFdnc+hnq2fT
         XFmukPcFRoOyBNwoTE9JQAcgpoAdRbmkgx45wJGrb4ZsHQqMezDHNZnBbAH+ESKZ0o0c
         2cY0wP6560KpegoANFwTr5eTyXCaOo2ta9AWBMY62qoB6m8wsRUgrfEu7Yg0gESKC8cB
         lRKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CbAsaBVX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f131-v6si712272ybb.34.2018.03.01.09.04.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Mar 2018 09:04:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CbAsaBVX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58207 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1erRdH-0004Mp-Vz
	for alex.bennee@linaro.org; Thu, 01 Mar 2018 12:04:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54352)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1erRaU-00030g-EI
	for qemu-devel@nongnu.org; Thu, 01 Mar 2018 12:01:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1erRaO-00054u-U1
	for qemu-devel@nongnu.org; Thu, 01 Mar 2018 12:01:46 -0500
Received: from mail-pg0-x234.google.com ([2607:f8b0:400e:c05::234]:42464)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1erRaO-00054V-Lg
	for qemu-devel@nongnu.org; Thu, 01 Mar 2018 12:01:40 -0500
Received: by mail-pg0-x234.google.com with SMTP id y8so2545279pgr.9
	for <qemu-devel@nongnu.org>; Thu, 01 Mar 2018 09:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=9o4G05SljRk2lTnvcUnPl4v24sthCC0QcSiyvXnP3y4=;
	b=CbAsaBVXpx0L0GXp5Ks9IL76r4x+340d3Get0EMfSv4OPhIJVsLXC/jN1SdDoQT/0U
	xpu2oivpHN4G+jE4R8Dv67SE8Jb0NK0+w/6hkBK3Hcq/9Y0SVWZTzHN6eRfbaV5BsJLX
	+NTCj3TLNliyt2zmXlo765EiW4hXNNdmfqV98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=9o4G05SljRk2lTnvcUnPl4v24sthCC0QcSiyvXnP3y4=;
	b=YpM+pXZMdDxHdW0KM5oRkvlGjPiZUwoslOxOfzlO6OJosb/5VcHYDqaHnWfpAffp0z
	vYpSF76A48LAznpjVdM6zKBnNZKGYSyksot89LvrlNgE52MOYMm/L6CNxIPwvYbowl4s
	4s1F7rAbkwQ5B3+Zg5VgIFHBdZlHkOKl2eaVlAKxlN2Jwdx/sR117/hbvqtQkvgCn/0S
	4/GHaQfYS47TjoiIgPgOZEeAHouazjqWxVtjTXZWRugOZcBjxEfvJog5HgTmADEfYkjH
	DpNLrDzzNWobQfGgN0DArpQmm/SM+MIN5RS+YznJM4Mp6AWbVhlzu8zMVPup8Vs3pibW
	IewA==
X-Gm-Message-State: APf1xPDFjvAO5thagM6ii2J53Pqq0TSbkTCUf2rnakdvt+MVFPbujhYG
	Z20fbZBTb6+JH7YGnkFQPzj65g==
X-Received: by 10.99.121.140 with SMTP id u134mr2030706pgc.89.1519923699042;
	Thu, 01 Mar 2018 09:01:39 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net.
	[97.113.169.147]) by smtp.gmail.com with ESMTPSA id
	a138sm9736044pfd.47.2018.03.01.09.01.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Mar 2018 09:01:37 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180228164816.24110-1-richard.henderson@linaro.org>
	<20180228164816.24110-3-richard.henderson@linaro.org>
	<CAFEAcA_SsRZAsTvUjSYHQcGMUYUDFvr0jdVBdjdczssDmExPgg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7599a4e6-a0bf-961e-6272-a3835b202c15@linaro.org>
Date: Thu, 1 Mar 2018 09:01:35 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_SsRZAsTvUjSYHQcGMUYUDFvr0jdVBdjdczssDmExPgg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::234
Subject: Re: [Qemu-devel] [PATCH] decodetree: Propagate return value from
 translate subroutines
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3nd9dcNmgiJM

On 03/01/2018 03:59 AM, Peter Maydell wrote:
> On 28 February 2018 at 16:48, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>> Allow the translate subroutines to return false for invalid insns.
>>
>> At present we can of course invoke an invalid insn exception from within
>> the translate subroutine, but in the short term this consolidates code.
>> In the long term it would allow the decodetree language to support
>> overlapping patterns for ISA extensions.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>
>> Since this makes an ABI change to the translate functions called by the
>> decode function, let's make it now before there are any in-tree users.
>>
>> My SVE branch over-decodes in quite a lot of cases -- e.g. things like
>> the 2-bit size field must be 1-3 for fp operands, and so size==0 is
>> unallocated.  Returning false for these cases allows the actual call
>> to unallocated_encoding to be done in one place instead of hundreds.
>>
>> Longer term, I'm thinking of how to handle decode of overlapping ISA
>> extensions.  One could allow (specific) overlapping patterns and
>> prioritize them in some way (e.g. first in file is first matched).
>> My thought is that trans_insn_a would check a cpu feature bit and
>> return false if not enabled.  Then trans_insn_b would be given its
>> chance to handle the insn.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> I'll put this into target-arm.next, unless you'd prefer it to go
> in via some other route.

That's fine.  Thanks!


r~
