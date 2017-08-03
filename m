Received: by 10.25.221.202 with SMTP id w71csp1137154lfi;
        Thu, 3 Aug 2017 13:47:14 -0700 (PDT)
X-Received: by 10.237.35.81 with SMTP id i17mr133139qtc.19.1501793234203;
        Thu, 03 Aug 2017 13:47:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501793234; cv=none;
        d=google.com; s=arc-20160816;
        b=OCqy7X9CfZ4V6klo5rzR8rACOspTSaVyPbp6DFAUsHDPks8eEb0RYxp8OYz+mXXpvb
         Nza9YwzUVQJ2uu7wR+rAVb5xWtMrEm8ksP3scd9bl3KV9DqsukGrZE9+XsOeAepySUmi
         cM42vfDNUiNhbIT8PNb5bUCSxV7RQf5H+Q0YBVy4lXgL3T9D7obEkpIOuXHtSIQzdyyi
         GwkKwIGsNk4rYNMW9DkHSGZdQpkne1lnXC+a5W5qYu+IZ4SKohBUutW59uQKqqzzU3Ol
         ST4ntYk+Iy/yERVoATsw3t8j187CvWnmkMaD8MWDOQtdHQUlotFwiVlBPlWhKOmTmURL
         Zc/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=MyN/4gdpQJCvs7RFyf+EsvoiQk8U6pHEIKGUeTb+cpE=;
        b=qV8x8extyHHre0XokxK2iuY+iCU964adtGBuZzG3hV0BTilCy7iF4/H+XAV+BWK3wb
         bMuloyYBU93J+fDYJ3KShJ3hvn8ry6PJxb9ZbsGs7xGMO5yp3ACXRZe15TWQ2Faokjev
         xLy+RtEWFwGtx+K79NMhxnK8JaTYBK/1ooBoSkJP8TS6YA82Y1EOV3W4mKTbBhJA7QCa
         8xL5/T94XVAuW8Hf3lfUlo/+s7nJ0nlsyn1ohCrO72GI70Whzn/DIKOCCt3qi8VO5doJ
         oYQDGilkod/LhFU6Tsi1XdA27b0HkiVBGYLiI0LDfMwtgsrwvmvBzrH9/FiEuT19kn0b
         tDbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=LAYqzva0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i59si1385036qtb.371.2017.08.03.13.47.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Aug 2017 13:47:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=LAYqzva0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50586 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddN1T-00085K-JP
	for alex.bennee@linaro.org; Thu, 03 Aug 2017 16:47:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42264)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1ddN1M-00083n-Gg
	for qemu-arm@nongnu.org; Thu, 03 Aug 2017 16:47:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1ddN1L-0004dx-Sf
	for qemu-arm@nongnu.org; Thu, 03 Aug 2017 16:47:04 -0400
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:36553)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1ddN1H-0004VA-Qr; Thu, 03 Aug 2017 16:46:59 -0400
Received: by mail-pg0-x241.google.com with SMTP id y129so2467898pgy.3;
	Thu, 03 Aug 2017 13:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=MyN/4gdpQJCvs7RFyf+EsvoiQk8U6pHEIKGUeTb+cpE=;
	b=LAYqzva0JXpKhH9ifgUuQ0OcfwayEMYIvN9qcfvkqtS2qAR+RV0yoJ2sfp2h4030wH
	aVdov7ksDiDPDJyfEh+3JSrsA8IrE87Sh6nZ16KZD5NM2el5fPBXTFFwrsn4evLfnnxi
	6SkVbDnjJkPh/aXotvH4zHWwUBs+6Bq8GNIaGzoR6gpHD5aniDfY77lruA4NQBYFIrTa
	C1fsXO4tcHa3XXVPMQFdKaas9hkCg4dPHM8hw4cF5ma+35c3JenUalOvGvEUpfjz7IH5
	bcdyYH8N93I/Iw+bfdB4OZpQkYMJZ3YeHySNnhu+up/HTQojpbmDvEVaaFqWl+yG4nrH
	Ns3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=MyN/4gdpQJCvs7RFyf+EsvoiQk8U6pHEIKGUeTb+cpE=;
	b=XA2pKol06WMm+03aauJC4HuK74n6vsBZrr5F6Nsol30TKuQ2Oe6K+OAgoB2lUrv1g/
	St0JCymFMcmwWRyL1taQeUaz1cRDWmdRRwKnP8TCB14ZbOXd9zTqxNmd+47RRIaKnQ1+
	IyDzy5HKeTQLWwIXKM/vgqgLtJzEXzsRSDZH5VowFruVQXwd7p5sl7ULP+m0mX+LMCkt
	DC7BySmrx4BRaazLWZMI/FYL53UOZSe3zk9CqZJoihSAyd6EKW9mIzrE2Ndd5hZVLSNl
	pCzc1UOcxm/2opiJX4YTNGbl6s0wtk4s0TS5T5Xh5uqvyaJeZzw3zz1CrlHlRN2mqPzc
	8cAw==
X-Gm-Message-State: AIVw112+gZRCTr26hzgRLUzePUwU6IXXP6qkrZXuzsOZfLO801dvacd2
	pgw58/FO/6jNlw==
X-Received: by 10.84.205.70 with SMTP id o6mr91913plh.51.1501793218795;
	Thu, 03 Aug 2017 13:46:58 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net.
	[97.126.108.236]) by smtp.googlemail.com with ESMTPSA id
	204sm17836858pfu.118.2017.08.03.13.46.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Aug 2017 13:46:58 -0700 (PDT)
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
	<1501692241-23310-3-git-send-email-peter.maydell@linaro.org>
	<3f6ee028-b7f9-fbe0-1aea-eb1e6faab5a3@twiddle.net>
	<20170803204001.GX4859@toto>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <4e0cab0f-83ab-0742-988d-9b2615f6ef4b@twiddle.net>
Date: Thu, 3 Aug 2017 13:46:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170803204001.GX4859@toto>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 02/15] target/arm: Don't trap
 WFI/WFE for M profile
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: duPxkduDieMx

On 08/03/2017 01:40 PM, Edgar E. Iglesias wrote:
> I don't have the spec at hand but IIRC the trap should only happen
> if the processor would have entered the low-power state (i.e if
> there's no work).

  when SystemHintOp_WFE
    if IsEventRegisterSet() then
      ClearEventRegister();
    else
      if PSTATE.EL == EL0 then
        AArch64.CheckForWFxTrap(EL1, TRUE);
      if HaveEL(EL2) && !IsSecure()
         && PSTATE.EL IN {EL0, EL1} && !IsInHost() then
        AArch64.CheckForWFxTrap(EL2, TRUE);
      if HaveEL(EL3) && PSTATE.EL != EL3 then
        AArch64.CheckForWFxTrap(EL3, TRUE);
      WaitForEvent();

Ah, I see what you mean, since WaitForEvent is also
described as checking EventRegister.

Thanks.


r~
