Received: by 10.223.188.70 with SMTP id a6csp6122829wrh;
        Tue, 29 Aug 2017 08:30:21 -0700 (PDT)
X-Received: by 10.55.221.201 with SMTP id u70mr6282405qku.267.1504020621587;
        Tue, 29 Aug 2017 08:30:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504020621; cv=none;
        d=google.com; s=arc-20160816;
        b=KG1zOoEHKvrvopznyTDO5bl46KmQnYkoHvHjM4S0eUxaCLPXvHWdafNtGVVIwItuTu
         +J2mBcSjVEZVIBSPVaRrO0lCZCD8rmy/KFELXvWFMrtI1L1cwx8B2+Bt3jCToABslpnU
         xJWT3KlkZLD3hj4nydoD4TdZ0g6+871QsOUBhRP2OnRYJp0YN/n395Qi8G8q/fOegZre
         nSUAktT4WEeZkz8kzbA0vJk3p9ujGbKh3dT6xueplSSi4D0p6zYIruSetCD3bgNhcJij
         +PBLrdiUIwtKC0MbSIzsIQGsRvmCdXawdeZU8FkvFAO1rZo8Ujb0E728V+Wt3OVKDWsy
         X52g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=rv5kE7AHaY3Uyg3Te8j9gugxfMHxFd8j++m8sBEOCRA=;
        b=SdW5XY+303vxi7Aw9f4FC742eOOMjTHY8T433w+fw2Q2AqBqx28xVIR3syxrnVKk68
         9Rx4BMJ3orKDgz9yfp5WosrU41E7UgCy7p+7UCCVS1b8M012XQOMmG2rn90nFRylsSKG
         FcuxGLCK4ELM3s44TcL/Y6knwE4qM/UyjwrCm/0Mhtfe8QMypMiGMUygUeTdu7c+mL5u
         xwF+y+zGlEP5/6hYYWDQZy9JWIuH6kqhjnJpaNdUfvwobTwMMIy+upFMprxiy5CnEBK1
         5p5RA7O1TzXTxHQsvOgdniAA6W5hfziBAFNHlVegQXwwDQRVKs2i14yAtlTPE0C1tXS0
         ADpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QbyUPrHs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y6si3056381qty.4.2017.08.29.08.30.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Aug 2017 08:30:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QbyUPrHs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45509 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dmiT5-0001HZ-4B
	for alex.bennee@linaro.org; Tue, 29 Aug 2017 11:30:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46178)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dmiRc-0008MK-Og
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 11:28:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dmiRZ-00021H-Le
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 11:28:48 -0400
Received: from mail-pg0-x22a.google.com ([2607:f8b0:400e:c05::22a]:34739)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dmiRZ-00020u-Eg
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 11:28:45 -0400
Received: by mail-pg0-x22a.google.com with SMTP id y15so11828925pgc.1
	for <qemu-arm@nongnu.org>; Tue, 29 Aug 2017 08:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=rv5kE7AHaY3Uyg3Te8j9gugxfMHxFd8j++m8sBEOCRA=;
	b=QbyUPrHsmIzPLwmf3mOxSL/0nhfoAj50laG9NKlA48scFvNM+oVzDoCZ3ZRDPzW8HO
	2U1wEVmYk7fvW7FDJaF1THSiy23wflvw2CKD/YliNX9nGhanslqEW+j6ZdU9zCfA4vSb
	zQM49cud4kVLGR22AvvnzOAlOt/MzQFVt3l6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=rv5kE7AHaY3Uyg3Te8j9gugxfMHxFd8j++m8sBEOCRA=;
	b=GPwSMb/9cpQL5mbdAa+rtlilS+Ce5rVy/lPHSSBV6/LW1aBGLI8MGulqNU+V3nsM/Y
	Gflgm4XKYaOZdvAAxYAYzu2slq79SZWCYxj3AdgeRevtcwpKe2Zp/EPQTvI+PVuFGmEz
	NaLKn0xcKygCPc5zHj5e0RIcCkLpurTgAtRfvEYf0MByRShe6MITf3i6B2BHiLdBxbDw
	2r5XDNe82muJzr/4i8MILZmDK4yVVFDQTmROB5sO/23xth2XBsMrgCWFFrepFV37HLmH
	J1ZmFfviB9GjYCpO64ScKbl7p29uYcJ1ccjIXVEsE0oshYTc/ove/3TvOfKqj/5f84Fx
	S8EQ==
X-Gm-Message-State: AHYfb5jiZyPPdbPz6Gv1HmbjKRBbA/yZEDpNKwqMXYf5YkWX/qn3huTM
	6wCtTA+5Y7eX83cd08Z+AA==
X-Received: by 10.99.100.65 with SMTP id y62mr666588pgb.233.1504020524523;
	Tue, 29 Aug 2017 08:28:44 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net.
	[97.126.108.236]) by smtp.gmail.com with ESMTPSA id
	y70sm6491689pfg.53.2017.08.29.08.28.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Aug 2017 08:28:43 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
	<1503414539-28762-4-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9af3401e-031a-3ae3-d2fc-315dab3ef9e1@linaro.org>
Date: Tue, 29 Aug 2017 08:28:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1503414539-28762-4-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::22a
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 03/20] target/arm: Add state
 field, feature bit and migration for v8M secure state
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PFDAGHBAumY8

On 08/22/2017 08:08 AM, Peter Maydell wrote:
> As the first step in implementing ARM v8M's security extension:
>  * add a new feature bit ARM_FEATURE_M_SECURITY
>  * add the CPU state field that indicates whether the CPU is
>    currently in the secure state
>  * add a migration subsection for this new state
>    (we will add the Secure copies of banked register state
>    to this subsection in later patches)
>  * add a #define for the one new-in-v8M exception type
>  * make the CPU debug log print S/NS status
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h       |  3 +++
>  target/arm/cpu.c       |  4 ++++
>  target/arm/machine.c   | 20 ++++++++++++++++++++
>  target/arm/translate.c |  8 +++++++-
>  4 files changed, 34 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

