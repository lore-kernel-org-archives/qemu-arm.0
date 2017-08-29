Received: by 10.223.188.70 with SMTP id a6csp6179013wrh;
        Tue, 29 Aug 2017 09:14:47 -0700 (PDT)
X-Received: by 10.200.57.97 with SMTP id t30mr6384853qtb.36.1504023287224;
        Tue, 29 Aug 2017 09:14:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504023287; cv=none;
        d=google.com; s=arc-20160816;
        b=wK9lfTSsYTPA3ySkVyqmXnx2goZs+lP3SQlBnCQwKQIBz8vqHD5wvyUiG250VYdjVj
         LUNb8fHLlKpQaSgl6qrlPGQ/cBYqDlJkuM8f4Za38tGCf0MgcblW9aziSJHN0i8w7Ma/
         VQnP4c8kHF2M9wGw8/7noiw4HdMnS2E8o+dwUvUvDeYJykjst2YN2vbWVN62dSfhSMxR
         X09rLdRA1bpRCLa4qDXMuBzlArqYy15gacIpVDKaK5OT5uNyz4s0uidTAMOmBT9I9l+l
         3fDFMEco+bleC0n/hgeuUkIt+amciJqVLYikWFlTsy9Apvwh9Kxp2OO2w3Xin4L3qQc5
         //5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=jbCgybhAV2ZhJZe/vZv8426ein4z0XCjc4IhTMt9noE=;
        b=GzFS0ELg57iuLYEp7kmdlDQ3DU3ArVbqcTzsx635e46IsBiDsDxZRPkhXi2lm1EKdU
         xmUIj8oz15Xx+A3dOBInhpP1m0tB0uDaQOtm2L3DrBhzpil7yVhg0BWPCn1w0OL1f3kF
         G70nr0F0wUTAmftkaLWLPg33BeFBXyJwlYnvQmWndEnvtdmDXzv52cIFDgZp6YzchngR
         398L71JC6q8X1eg/G0iQD5lYJeB10Aoccx5MqD6m3AV6A61vxUglcLjVlRVFn+J8OXJn
         RuWmdiNZx12y4hlO0b329GsFh3NQ6veioneY9x/8cyFd+1oiKmGwEsD7gESf/5AKN4Zt
         jwJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yu2CVoRh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m124si3128811qkf.48.2017.08.29.09.14.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Aug 2017 09:14:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yu2CVoRh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45896 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dmjA4-0006zs-H7
	for alex.bennee@linaro.org; Tue, 29 Aug 2017 12:14:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34451)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dmj8A-0005pC-Mc
	for qemu-devel@nongnu.org; Tue, 29 Aug 2017 12:12:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dmj86-0006XX-TE
	for qemu-devel@nongnu.org; Tue, 29 Aug 2017 12:12:46 -0400
Received: from mail-pg0-x22d.google.com ([2607:f8b0:400e:c05::22d]:33751)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dmj86-0006X3-OM
	for qemu-devel@nongnu.org; Tue, 29 Aug 2017 12:12:42 -0400
Received: by mail-pg0-x22d.google.com with SMTP id t3so12171141pgt.0
	for <qemu-devel@nongnu.org>; Tue, 29 Aug 2017 09:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=jbCgybhAV2ZhJZe/vZv8426ein4z0XCjc4IhTMt9noE=;
	b=Yu2CVoRhwOTavLNRMNcUF+F0lMnY6gS7wmqBJVKV4vPA91oRcl4hnbdy/RiCJnY+Ve
	ScU1tomZgShi5l2UdpGmQeCj/oi4n3aYkC5KLbjuQIy3rpXOKeyNUjFy/GlWriFRKX6i
	7KLAgQafA2wIaEhuFNxihNq+MYWUrOnB4KzXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=jbCgybhAV2ZhJZe/vZv8426ein4z0XCjc4IhTMt9noE=;
	b=ZNZUJXvVRAYPKWCzzOs6ebmkWShMjBhEbqo9UbImkURKP+PKKONImqTgGWH7o93NTp
	qVuxTwNHXNfwWgARvbRfsyPE8sETQYQ1DIZhtyKNvK7PnJSq+BCvkZ0/TQTQJr7F6ir3
	vkMgj+kfaxR6n06d6Z0yuNO0zgWC6x+oEptx3oIu2TglnnFami5qUtiweMOgdimZS9nI
	vVGaQAN7qYyJiT57MoezfxdM5b2eeZCkE5dnKVLmCC0A6aZis9bDMRGL4qsR8r/IkA08
	FyYN2zVm6uo7qY2HE0Ealn+ZsKALA+w/S1v9iD6a7VPRZFP6LNS1iDhYZ08W6KNAl+Iy
	NfEA==
X-Gm-Message-State: AHYfb5jUswxKh/xsH4Ecg2yagC6bAU2BK1mRBE3++hhB5pZTogeYCWoQ
	inQrYoX3cSRF550AV9z78g==
X-Received: by 10.99.55.22 with SMTP id e22mr852870pga.101.1504023161905;
	Tue, 29 Aug 2017 09:12:41 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net.
	[97.126.108.236])
	by smtp.gmail.com with ESMTPSA id t29sm6311560pgo.4.2017.08.29.09.12.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Aug 2017 09:12:40 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
	<1503414539-28762-19-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4cdccf07-6786-2e01-04c1-1c06151acd5a@linaro.org>
Date: Tue, 29 Aug 2017 09:12:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1503414539-28762-19-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::22d
Subject: Re: [Qemu-devel] [PATCH 18/20] target/arm: Make CFSR register
 banked for v8M
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FDJ0/BHjZsEq

On 08/22/2017 08:08 AM, Peter Maydell wrote:
> Make the CFSR register banked if v8M security extensions are enabled.
> 
> Not all the bits in this register are banked: the BFSR
> bits [15:8] are shared between S and NS, and we store them
> in the NS copy of the register.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h      |  7 ++++++-
>  hw/intc/armv7m_nvic.c | 15 +++++++++++++--
>  target/arm/helper.c   | 18 +++++++++---------
>  target/arm/machine.c  |  3 ++-
>  4 files changed, 30 insertions(+), 13 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


