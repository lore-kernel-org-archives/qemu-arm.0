Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp4005588wrx;
        Tue, 23 Apr 2019 16:01:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyMRZXgS69LbCdUlA07mzUmd/t1AWt3PPzkb+lwCvV50EKaB8vGvAVa6RAz6sz7vSb1SG93
X-Received: by 2002:a1c:9691:: with SMTP id y139mr3771819wmd.64.1556060514789;
        Tue, 23 Apr 2019 16:01:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556060514; cv=none;
        d=google.com; s=arc-20160816;
        b=wj7OHcdBH6WyXEuZ+8mMT4plX50g6//1sSTqfssq/Ocdt2ysqkKJ5bzJiBxooxFnlM
         OW8PZyuzErr2fCygtrzQaPBuzBesjcQvvayPp6IkAlZrejn2sd7laDgOk+4UmVZGUhQf
         ScXNEZJmo/zqSs6E7SNfI+AGHSBimRY8lrnx/kTnfy9rqn8c3Q6U30KyrS6WRWWfDp41
         30NcAAmuFrrVm2Fi3c6b03S6zpj6UWbTsigv/dhkk4HLUPOAzyad5noP+HxzRegwsjyl
         AJzTqHbMd5Juv7S6bA1yZMBb+JNh1+a7yzErEtvA9aYJUPnkOy/DySublH0pMOYsgqe7
         n5NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=X6Qg0UxUwsh7DxVq8KHeKxEs4+PVKw2QcqHUsUh4EEU=;
        b=RQOPA+WM+mCcghmZ0sN2r5hHzPNqnrdDrZ61MoM93IO2DRtQkgNMCPg5tPYDUusk0e
         GXNEaTZtT4HU6Q0XAPDqDO9RQ06puHkM1F5fsloND9HqfE0Spk0AQJP+wW8LXl6D9rFs
         e71zd2tJdsD0tfdiV2IHhEBlyQ80pQDHlqfK3Jm3RnHssnPTqd5WfQfqAZmppeFPVz/J
         qX54D6V9xCpG9WAChJXfi8F/3LbbfvFyrncqMhdfL136GYyCFPDtJb7hm+xnpfG67F8B
         CSBJ3l3OSxsrKMoaPZRGjDhk2kykQWwLUqpzh9x8DA8J43PNr1lO2NCS/A9Ijs6gcPgP
         9siw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YoPDTzQq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x6si11856570wmk.43.2019.04.23.16.01.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Apr 2019 16:01:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YoPDTzQq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:60734 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hJ4QD-0003VL-UG
	for alex.bennee@linaro.org; Tue, 23 Apr 2019 19:01:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60021)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hJ4PM-0003Fc-18
	for qemu-devel@nongnu.org; Tue, 23 Apr 2019 19:01:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hJ4FI-0006jb-BV
	for qemu-devel@nongnu.org; Tue, 23 Apr 2019 18:50:37 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:43551)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hJ4FI-0006h4-1O
	for qemu-devel@nongnu.org; Tue, 23 Apr 2019 18:50:36 -0400
Received: by mail-pl1-x642.google.com with SMTP id n8so8212396plp.10
	for <qemu-devel@nongnu.org>; Tue, 23 Apr 2019 15:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=X6Qg0UxUwsh7DxVq8KHeKxEs4+PVKw2QcqHUsUh4EEU=;
	b=YoPDTzQqOBt6uQD0eYXr4sNjgNb60VU7SkS75XGKbbhiv0MhyUWv1FW5F7cIcgNApt
	r8pX69+zUpiYwI8CSKDIXL4as3Ok0/TwdJhFu+lfyWEtLHRrls1NlipkmyK+1BgWP6j7
	NtMXVgW8RINa5DqEE2fusCitUoKeeWUeQyWA2dTLiH8b+QOsxxhNo/uQAO8TkC2y1cq0
	FJRduwCD5nikck4VJ57CHvPpiigP7Nj/YPTNGBSlM552lJiUsDn6FFHdOdGqptoKVRXC
	NnIL3HaXG4birqaBYIiLqnSvWKRnUvjIx0rmTtuqSASx/6AIEFKwy014bRe+GAa8e1Hk
	jfcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=X6Qg0UxUwsh7DxVq8KHeKxEs4+PVKw2QcqHUsUh4EEU=;
	b=er7vgwhX5EABZ3DRTA1gblTb3KyUf7PtzQ6sAYB1O9QnSY3dyzsnx+pTweCzFwBqUL
	G9cht19LLUlyyvb9EuZXnlAduW2bOyUNOVqReGg9jVAgmxkqy0p7RgCpxZCCy6SNFizm
	upaYkRaRd9fDpn9Mp8Aa7KQ4G9wZjVxLvUO2LKALX7nOqA690eBkjl4H3w3ntnSlpv1g
	9s43aQFHBCrPP4HvUTkK8Zewxr0cSfzcoK25MBheVMJTIMpVSguLmthcXDwMftHhMXop
	AUHIt833A/XjTFQHCaexHWtkuds5CkcuiE1+eZy7lxMBQUEDrlTZarWeQTdXCBiDylpV
	cHCw==
X-Gm-Message-State: APjAAAWo6DLsJPMgU6XtHS4/5Sg5ZGN97xBwFJMZgwuvBI+5TKf9iU2+
	ZK4wjKB8HeoI+3JuAlx+YWLZMjckNDA=
X-Received: by 2002:a17:902:2a:: with SMTP id 39mr28524637pla.64.1556059834592;
	Tue, 23 Apr 2019 15:50:34 -0700 (PDT)
Received: from [192.168.1.11] (97-113-179-147.tukw.qwest.net. [97.113.179.147])
	by smtp.gmail.com with ESMTPSA id
	p3sm22089176pfn.167.2019.04.23.15.50.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Apr 2019 15:50:33 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190416125744.27770-1-peter.maydell@linaro.org>
	<20190416125744.27770-13-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <67aeb166-5e80-668a-33aa-3c556a843ecd@linaro.org>
Date: Tue, 23 Apr 2019 15:50:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190416125744.27770-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: Re: [Qemu-devel] [PATCH 12/26] target/arm: Clear CONTROL.SFPA in
 BXNS and BLXNS
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
X-TUID: O2JN+hsC1oUi

On 4/16/19 5:57 AM, Peter Maydell wrote:
> For v8M floating point support, transitions from Secure
> to Non-secure state via BLNS and BLXNS must clear the
> CONTROL.SFPA bit. (This corresponds to the pseudocode
> BranchToNS() function.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

