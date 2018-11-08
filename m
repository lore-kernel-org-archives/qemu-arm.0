Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp3153816wrw;
        Thu, 8 Nov 2018 01:20:50 -0800 (PST)
X-Google-Smtp-Source: AJdET5fwkeX6OczoQeb/OsH3di8uhaMK7HjZ77jCVQd3mcIPBhPQnHS4gasy74msY/wIehGgWfyF
X-Received: by 2002:a37:688c:: with SMTP id d134mr3475282qkc.57.1541668850400;
        Thu, 08 Nov 2018 01:20:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541668850; cv=none;
        d=google.com; s=arc-20160816;
        b=Qct5dJnKNpWn+P5mbvJTlkF4xQqucmfgx4PjDgIysCcpzOMRbukT0Oh9Rfg5IxMVZ5
         7VJyOhb0NMS8Ud5L91XkqMqRqfkSwWqXhKhS8W34l8Ido1LRZgN6zebWxEoHkNBPQiuf
         gxgTZCAXfka01ck03VOoQkBATMiMZvDr/HBDvY7g7cA2NO+ZSGIUf8am8B5LOEut1V/H
         N58ubasz4BVruJ/ZOuTFbZLse0ggqZh1gQBUK1KKnQAMttqECeZXMXd/lLyHFSF4mAM0
         gnOPspXGKElHOX71gDlY3qw4V+JYDjADIQV//BJg2bpyLJPVXbjP3qRbCh6ELlB45QfI
         IU1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=Mp01TxZeHqe8aaEfC0YaGpdaTKAKOGBNPxiUVdgCedE=;
        b=t9QPs4P3xAPR2kbSf1gxhhrljdfHx7wVlXpqYfRHtcpBJGGe9DzLWwIvoiynNn60uz
         kVMHrm8RsrjNoJWD0RGDtKOTDmnntS2mT+2QwlGge6nS9MJA5RlWEmxGpv+c0OLGTiox
         ls5FTAKWJfsuaT8ayW+jSyZHscLauAARV7WvIpzRyxbJ0M1pQDBdUjNsuqPQrfm5l4gL
         xl5bEocPc1o7n7ayZVUZOAEppvxTcD1Qw2BiIcEQ/GY3wxEm211jjkUnPOa7Ux8En/xc
         lVpszYJp1ETAi4+9bEOC3ZRgqa8lgOfTS1d7Y+6zQg8RcVe6Wv0OGrd55Rk2uA/pnaX1
         Xw3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KT807Sm6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v20si674260qvc.134.2018.11.08.01.20.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Nov 2018 01:20:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KT807Sm6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55313 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gKgUb-0006tL-PX
	for alex.bennee@linaro.org; Thu, 08 Nov 2018 04:20:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51871)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gKgUH-0006ka-Om
	for qemu-arm@nongnu.org; Thu, 08 Nov 2018 04:20:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gKgUB-0008EF-O5
	for qemu-arm@nongnu.org; Thu, 08 Nov 2018 04:20:27 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:47028)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gKgUA-00083M-Fp
	for qemu-arm@nongnu.org; Thu, 08 Nov 2018 04:20:23 -0500
Received: by mail-wr1-x442.google.com with SMTP id 74-v6so20371540wrb.13
	for <qemu-arm@nongnu.org>; Thu, 08 Nov 2018 01:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Mp01TxZeHqe8aaEfC0YaGpdaTKAKOGBNPxiUVdgCedE=;
	b=KT807Sm68Zyz6JvMptcM90JHX2JuUJZzSRIgfNjHBeX6wCew4gWfrjRKBkN8RqN9kR
	lL7ZzNaiyhA4BvlpeVb5wPC6kEpapyRoviU4U/KkMAD1CxgXxne9MAPsWFKfU/7yFdBY
	gvjbShueYNA2yRwIHqNFB2XldcHqWcHLFzxII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Mp01TxZeHqe8aaEfC0YaGpdaTKAKOGBNPxiUVdgCedE=;
	b=f8nUJwKyn/a6aLajmqqDUXMWTfQzuEAi3JtQWbWc+H5GrtW3gCApEOBJ97u7/A41X5
	r+CBMMNtChoU30bkgTTk6N6vYyahiRJl+Y7m7godaWcmDXlkO7HFVvvZ3MMdtjs3ZyhG
	GuU7Rn3+yIBZQXLZR99THON/8dvW13tzhl+b0zJTS/MeAjF1CpB1N2Fw53OkC8wH9lUB
	T8r+OC8HooaHBWlNmfH9w+SRpuI6Wh8Le+A/fyFAYloydvfvNQAs53i5efmbgSyFC9oR
	JiPUdXSoXI545Apjg8XdlJWLX57+HIAYwz4FM5drds0UQLtOtM3m+rfTRcu6a83osDhE
	qbFg==
X-Gm-Message-State: AGRZ1gLV2UGY02CmYxtXNrbqW0DPOkyQ74Pd9slLhXYaqR76bmlAUKHr
	j7FCC37p/RfFasE/w8PabtbrZg==
X-Received: by 2002:adf:e307:: with SMTP id b7-v6mr3555831wrj.91.1541668812443;
	Thu, 08 Nov 2018 01:20:12 -0800 (PST)
Received: from cloudburst.twiddle.net
	(70.red-2-141-114.dynamicip.rima-tde.net. [2.141.114.70])
	by smtp.gmail.com with ESMTPSA id
	j18-v6sm8163517wmf.39.2018.11.08.01.20.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Nov 2018 01:20:11 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20181106164118.16184-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <caaa4dfc-f104-96b7-c221-1dc0f95f7112@linaro.org>
Date: Thu, 8 Nov 2018 10:20:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181106164118.16184-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-3.1] target/arm: Remove
 antique TODO comment
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
X-TUID: mzFsRU+lzyg6

On 11/6/18 5:41 PM, Peter Maydell wrote:
> Remove a TODO comment about implementing the vectored interrupt
> controller. We have had an implementation of that for a decade;
> it's in hw/intc/pl190.c.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

