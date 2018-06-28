Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp7600742wrq;
        Thu, 28 Jun 2018 09:08:20 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdVNVMI3ZmrOPuCVrGGVH0HA2tPS0G3Q94/x5L/qSElIL6h3t1Y1JLiMeYpoSpL383iS6VK
X-Received: by 2002:a37:1614:: with SMTP id g20-v6mr9333024qkh.64.1530202100707;
        Thu, 28 Jun 2018 09:08:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530202100; cv=none;
        d=google.com; s=arc-20160816;
        b=vSeK9cpME4Sat+cNR5i9emiQxUDCb68T6yOJfPN0MzxyG+v8WeeTRM7ussgXseWMgy
         wpG7MBKSafonkHX1LacqWgS3e/o1uBqySlldVCLJpZsZflkiYaScby6OeDersBS8zuBv
         ewzI6C93+zvokESJxjIOSDvHhIoWHsHjfXOFqck4Ip1o5UzSO8q8jVE71mbN84by0YoT
         ZbDK2lsfLMCXKNviAIYvy9grlguiMSOtjrh3fjRmI2x+W0onuKX1Wtp1QhuMfn4mRJag
         lxdpCF6JwLGoqtdM0mMg69D1ed4XXUSP98o2fV3BEJxqNRGYLQh/GRdOf5X9PCwFs1p6
         WuoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=QBnwbG7/mmrB6Ixzi7AQostKFEztNWN0+b1bnAJElbU=;
        b=JXH3F55K/tCZnxCGrs/aXRXArz3t9rA0NB3nUvHeEKA9RLJkH78Qr3nZJ7jtMnx8Dd
         DTH5y/8Adu69hFcaaRqBhbEe8gA11VcWV8K0GazeHyZlbAP2LSfPCDtmEbN6rakvv4um
         YNxecPiFOL0e6dopvhlBvM+Kmmj4eAcLNJLM/p3S9SZX4fKAnN8t3jYgn9Xl+A9UL/wr
         Bpx4ixxjS+rB4PDIN+egaillbXZ36ruLDugeGNhsYCmILVsfSIHRJIH7+hu+oBsP/wEi
         aUYbkYAF+ZZOBIJFj4kcmqTHWQZqNFUX5/mnUPp95tPk2VGf5UQ1mHws8MJrEmFqbftp
         YWhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="bGtV1Y/Z";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u11-v6si4793234qvk.231.2018.06.28.09.08.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jun 2018 09:08:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="bGtV1Y/Z";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37440 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fYZT2-0007YP-33
	for alex.bennee@linaro.org; Thu, 28 Jun 2018 12:08:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44418)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fYZSr-0007WO-C9
	for qemu-arm@nongnu.org; Thu, 28 Jun 2018 12:08:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fYZSq-0006qr-HV
	for qemu-arm@nongnu.org; Thu, 28 Jun 2018 12:08:09 -0400
Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242]:32936)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fYZSq-0006p6-C2
	for qemu-arm@nongnu.org; Thu, 28 Jun 2018 12:08:08 -0400
Received: by mail-ot0-x242.google.com with SMTP id h6-v6so6740446otj.0
	for <qemu-arm@nongnu.org>; Thu, 28 Jun 2018 09:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QBnwbG7/mmrB6Ixzi7AQostKFEztNWN0+b1bnAJElbU=;
	b=bGtV1Y/Z68378TxUfPGliXwarQVvs7++QTMHDW3g2ZTv/QjRHliPg3NIQxvQbMjrRP
	6LBNBlUslUF/gang+dA9y/VDpbJAT6dCPr1iB1VentZjaSp/rbgycwDLdJZBKf4JWoTg
	Q24WzjtnMF/CTwchqWDFCLjpMKEd0rYbjfiPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QBnwbG7/mmrB6Ixzi7AQostKFEztNWN0+b1bnAJElbU=;
	b=Tj3uu1gMIGZAjveLk4YgK89tpbGyMERiLvNAoelvNe90+3J/BVQkEtbOk9I8rDWpSq
	Ao/WOWic2M+MgVfZPGX2ia+35d38o6IE5bVaxLzGURoyYiFTypYWTrgofh7n7OuOCAZJ
	bbVOS5dwgF9xz2fKIdnWNumeb/wMa20SLIkn6SwsGsMV/scbmIRAkRL2pJdRvc0ad5Vd
	NWezSe6B8p7es4kU93ujUCfa/ImcQexlty3CFpuYJuD7V0qBCT3itEZ42vn9HBiJspIV
	XouJYNRh7KAwNEyMcsg5zDNX9d89YnUZgjzX3mzWnrugNvwQtSc3BHPZL19KFYqK+aM1
	AGww==
X-Gm-Message-State: APt69E2Nc20t8i9mD8Nfm3rJPuDgWqn41f3oQNrMRQqCSBepxsSZouBd
	NWawjwSVAoa0wGT+RgoSTFi6SFanCXhN1b6Jp6CBrg==
X-Received: by 2002:a9d:1a0b:: with SMTP id
	a11-v6mr5945785ote.205.1530202087385; 
	Thu, 28 Jun 2018 09:08:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:902:0:0:0:0:0 with HTTP;
	Thu, 28 Jun 2018 09:07:46 -0700 (PDT)
In-Reply-To: <8c0706a5-6601-9945-9312-c3a0775c3d83@linaro.org>
References: <20180627043328.11531-1-richard.henderson@linaro.org>
	<20180627043328.11531-34-richard.henderson@linaro.org>
	<CAFEAcA_ZfQ1y0=sWBqLGSbd5qoBvhSthUy_udDi-aE5U66DLLg@mail.gmail.com>
	<8c0706a5-6601-9945-9312-c3a0775c3d83@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jun 2018 17:07:46 +0100
Message-ID: <CAFEAcA9zoojsDy+5NRSd693GVfVCqQOVCQ=15jhFWx8bXB_FFQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::242
Subject: Re: [Qemu-arm] [PATCH v6 33/35] target/arm: Implement SVE dot
 product (indexed)
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
X-TUID: I9X9wK5YDfXf

On 28 June 2018 at 16:57, Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 06/28/2018 06:07 AM, Peter Maydell wrote:
>>>  # SVE integer dot product (unpredicated)
>>> -DOT_zzz         01000100 1 sz:1 0 rm:5 00000 u:1 rn:5 rd:5
>>> +DOT_zzz         01000100 1 sz:1 0 rm:5 00000 u:1 rn:5 rd:5 ra=%reg_movprfx
>>
>> Shouldn't this have been in a different patch ?
>
> Dammit, you pointed this out last time and I missed it
> when going back through all of the nits.
>
> Do you want me to re-spin all or part of the patch set?

No, I've just made the fix locally in target-arm.next.

-- PMM
