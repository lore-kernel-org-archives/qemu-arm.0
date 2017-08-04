Received: by 10.25.221.202 with SMTP id w71csp2467817lfi;
        Fri, 4 Aug 2017 12:24:10 -0700 (PDT)
X-Received: by 10.237.35.67 with SMTP id i3mr4936586qtc.212.1501874650441;
        Fri, 04 Aug 2017 12:24:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501874650; cv=none;
        d=google.com; s=arc-20160816;
        b=PywcNhSdr3SJUmqL5C9NTU4Si7q4i3qr8PXnTG+Og3oiQn+iLTfzRQ/XaRKpzDwAnN
         kfJf/QLzJwUiTizNckFEV+koCdtPDxqEMsinof5KYPB0fbR5l2MUKvAMiIOZ3dSwKLng
         W921MCVUmn1/N0HKQxxYS0ObMxsubV2SbyZA1zMthar7wZczwvglhfvf/lU6vLMUz6NO
         EsKKPYE7iXM8V2FHVAsdaNFV0F8+3nZmbtqAMlFUjJoQrwaMpu/ajRKy7UNwNyhwTrm6
         UcDizDqQdCL+EWAvYmW6tcTDE5617Z/Naecg6OGY+UaeeaquJIg6PzgqaVl78frbYWZq
         ohsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=13Jor6y1EcNYr/L3fBR/oYcDp81QqM4MT7Yu1l7kfZE=;
        b=EjCSv2ybRzbK5WEPhfI0Tn5Tuznq4K9NX/aFdSDyt6AVLc5gSJ1tvLlVXpKR38NSyC
         uaycJ++XQAHJjV7TRyK+HpE/RIs6GNW5ufscJiOEzraXaUPZByieNwG8krGO8zdKX9pk
         4oZaXQv7nYOEccUjhEqbWzpHe957Rrx9DVZMcKyqu4n8WBXqEIwMsZirykZ1csrppMyC
         13d4IoFum/TWre5yOglhXjzV44CKBOJk5nG8fnOHeADa+ltDwUx/Tc2jmQvnSTqbX0PD
         6vH38wmYcWSe2AXdLTTkL40+Lfwm2Hj22aYpmddravnWdPXsJvJ5ef47ckTfQXuuIM9X
         Uk7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.b=ZUe53ztD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 5si2120336qkk.420.2017.08.04.12.24.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Aug 2017 12:24:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.b=ZUe53ztD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49487 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddiCd-0002qF-Qy
	for alex.bennee@linaro.org; Fri, 04 Aug 2017 15:24:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49712)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ddiBn-0002Wm-Mf
	for qemu-devel@nongnu.org; Fri, 04 Aug 2017 15:23:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ddiBj-0007lI-QJ
	for qemu-devel@nongnu.org; Fri, 04 Aug 2017 15:23:15 -0400
Received: from mail-pg0-x231.google.com ([2607:f8b0:400e:c05::231]:38301)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ddiBj-0007kv-Ki
	for qemu-devel@nongnu.org; Fri, 04 Aug 2017 15:23:11 -0400
Received: by mail-pg0-x231.google.com with SMTP id l64so11395223pge.5
	for <qemu-devel@nongnu.org>; Fri, 04 Aug 2017 12:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=13Jor6y1EcNYr/L3fBR/oYcDp81QqM4MT7Yu1l7kfZE=;
	b=ZUe53ztDID80/jABAVVqVMZSUmUmD9GXSwZvsMwYfMdK2kkr4ydHIThAeWMRVnd+Ho
	sQbgBVaXV+hreBWbber34cMV05lt6tOcZ7tIRewD6H/jnePHeT10SsCrF9PUZjcX7vOq
	bA5ZzRvNCLx9vPl60cNbXZRMMe9T6lbnV62SM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=13Jor6y1EcNYr/L3fBR/oYcDp81QqM4MT7Yu1l7kfZE=;
	b=te8vQT02ZzWTHCcRdkXdE1g0NtTtoPEWP++2/f/WDJXHE2GRSBEwSXrsDlPMefhtDR
	epkiV0x9mWUr96rZEW5quRSFFGSEIMTAcRwJervSZUTgQ7KmStL4UUQOddwFYXp/qwEh
	XBLf+RlwBO/qoS9KyGrIX7C311N8UraQIBx0uPTt6aaJMq1Gl2nrXhiZ5Fu7i/kAbK+Z
	pBWVpNSQ8Mxke77NQtcmZgmaYssv8oEWoda9kxARONg40zn4rK/6ISlpv+24wYTiISL0
	uTf3UWkOBq+ZTZCbOkZuDOpgq2V7FmUZZjpbk5jAUlZWJy+ZBBIWrXaV7D7RIXdkwr+a
	s8cw==
X-Gm-Message-State: AIVw111LF/u0IpimhLbuydDn4tpVM2NF4S8cctX4NuC38fc4lsgkj6TZ
	OmQ8H1TD6G//IQJD8lJpvA==
X-Received: by 10.99.42.141 with SMTP id q135mr3410928pgq.175.1501874590440;
	Fri, 04 Aug 2017 12:23:10 -0700 (PDT)
Received: from anchor.twiddle.net (97-126-108-236.tukw.qwest.net.
	[97.126.108.236]) by smtp.gmail.com with ESMTPSA id
	o14sm3857353pfi.158.2017.08.04.12.23.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Aug 2017 12:23:09 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1501867249-1924-1-git-send-email-peter.maydell@linaro.org>
	<1501867249-1924-5-git-send-email-peter.maydell@linaro.org>
	<50d6ba4d-cfa3-5b5f-5da1-dca2326d4f5d@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c38728a0-da49-635e-2954-1030b223e3c9@linaro.org>
Date: Fri, 4 Aug 2017 12:23:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <50d6ba4d-cfa3-5b5f-5da1-dca2326d4f5d@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::231
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 4/8] boards.h: Define new flag
 ignore_memory_transaction_failures
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SkH7wOcyuART

On 08/04/2017 11:09 AM, Philippe Mathieu-Daudé wrote:
> Since create_unimplemented_device() register overlapped with low priority, why
> not register it as default device directly, over the whole address space?

That's a good suggestion.  It makes more sense to me than adding a flag on the
MachineClass.


r~
