Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3326119wrt;
        Sun, 14 Oct 2018 09:12:41 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63RUaTp/TLixdpk5JZMH+96Txp+TJXO6S2LRksOs5E54Nl5EpjD3b5GGUoavAR/Xwp5m8H7
X-Received: by 2002:a37:d413:: with SMTP id l19-v6mr12616535qki.21.1539533561477;
        Sun, 14 Oct 2018 09:12:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539533561; cv=none;
        d=google.com; s=arc-20160816;
        b=h5Qmk9khhAnFUfDF8duWiJy+M3Tx6NrfhsT3hp/BLkeUqYFz26Sf24iFvcyfSQWJqx
         wcbM8f4pDrpQLOe/nHp7Du2KvQ74LxBfqBDV5aOOTd73fV+sow2wmh2jsvicKmtGr4lt
         blZJuQJc5JIgdlxjpSFoQUgibygMB5xJ9YeyvozXlMCsKlrQdMsgrjflicA876vThrqj
         YGATH27x19fbmZo80HC/O+dzfwQJ49HfAHLFPXKReWgVcmE3TCYmF/Asp/cFkH0Tj36M
         rUTLzqSMLJP6u9wqGHAXVnUHHmw3crR8cF6aQfWXTAfp92IxMSPfvTQ6c7BaQF4wW6xy
         GtJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=PiPy5D+1Lg+uv98ofBtyd+xIgHmoPXb1J0sfqMiBQN0=;
        b=ENyxzgIMd9CxxDfb2LQILb+OPseWQ4toejT3c7JZE1kscKIXI2mrXFtwBhSfu4/ajA
         BkbNkFyAewrVCXjHr1KZ38Zf4l4AEMu81oh6IFZgvpGhMgKjITwz0hRUJPpo7EXSN63W
         6ZY7R8C2tisFjgTHbCMpq2eE43QGlum9TgwdFRgF0fGEpwYQBhvqPl5cJKazBEtY/3KZ
         MQa6E41QvQfipBgDcAw76h0WOVruz5TPYHVe1ZyRgzEarr0704FRa85VITNJbHdUilkm
         e7izVMDSqZhI4EeXLscHc7SLpGsBKKF6IVmZDIw5siE4vES0A6PuIjRxtb7eGeKktY+D
         xI3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=H+duZUHw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m44-v6si679230qtb.280.2018.10.14.09.12.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 14 Oct 2018 09:12:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=H+duZUHw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48914 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gBj0S-0000RL-RB
	for alex.bennee@linaro.org; Sun, 14 Oct 2018 12:12:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44247)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gBj0H-0000L7-RS
	for qemu-arm@nongnu.org; Sun, 14 Oct 2018 12:12:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gBj0D-0005Q1-Ca
	for qemu-arm@nongnu.org; Sun, 14 Oct 2018 12:12:29 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:39555)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gBj0B-0005Nk-RT
	for qemu-arm@nongnu.org; Sun, 14 Oct 2018 12:12:24 -0400
Received: by mail-pf1-x441.google.com with SMTP id c25-v6so8455267pfe.6
	for <qemu-arm@nongnu.org>; Sun, 14 Oct 2018 09:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=PiPy5D+1Lg+uv98ofBtyd+xIgHmoPXb1J0sfqMiBQN0=;
	b=H+duZUHwigx3Ceg3CvSFmlsXANI7y81YgJ4H/IchYHaPEv9adp3bTq0/IXVKKw0ot9
	VGr9gK6jRLlK9AHcTXb5vqMko2Vp/8X9k6Wl9iExUQI2vn/Bwj67d4j1Zcs7jcI0/JQO
	RKRFPuife1E1wZYQ058DU0qYS7DQVHlD/IoL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=PiPy5D+1Lg+uv98ofBtyd+xIgHmoPXb1J0sfqMiBQN0=;
	b=Y8siHaaM8xnDAtFgvoQRQ9QU+Aebjlt5jDTJH2gIC/Rrel91ZsKsXR9hcORHKy+Z5b
	IsFu528T/p0oTtqIPjxBBSITCanhcIY/pMhqoN4SZhd9cimIkwLx4gqkR38IQM/zoq4I
	mEtnd8wC9jDoSn1ba8Qs76n+P5EjmdDr3op3ArH95LVxtYuu2Xz0/wV+HlJ2jlsZOqte
	3XXVag+QA++f8ZgBzCMOo2CKSS+SfmbssmB59bCBSmAfIx6D/oik+atjRarCQAdidtpn
	nogeB6EYcW1Xz3oLQcc3Qe0YzYvPq5xBaHCLJ18dsLdbK8UbwiX3qfkAmSF3vP8ek+t2
	ffWA==
X-Gm-Message-State: ABuFfohR5SBavNM/jFo4zU2XxhLsJER85ftpzSKUw2s8f9uqb6tZw9mE
	9mjb160UMWGO1XXaLpiPTla9bg==
X-Received: by 2002:a62:2542:: with SMTP id
	l63-v6mr14416559pfl.64.1539533538955; 
	Sun, 14 Oct 2018 09:12:18 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-8-179.tukw.qwest.net.
	[97.113.8.179]) by smtp.gmail.com with ESMTPSA id
	q24-v6sm13099598pfi.165.2018.10.14.09.12.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 14 Oct 2018 09:12:17 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20181012144235.19646-1-peter.maydell@linaro.org>
	<20181012144235.19646-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <0e04a02e-164e-f457-4d86-864fee60f251@linaro.org>
Date: Sun, 14 Oct 2018 09:12:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181012144235.19646-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 01/10] target/arm: Improve debug
 logging of AArch32 exception return
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
X-TUID: Ex8uzIqF5axu

On 10/12/18 7:42 AM, Peter Maydell wrote:
> For AArch32, exception return happens through certain kinds
> of CPSR write. We don't currently have any CPU_LOG_INT logging
> of these events (unlike AArch64, where we log in the ERET
> instruction). Add some suitable logging.
> 
> This will log exception returns like this:
> Exception return from AArch32 hyp to usr PC 0x80100374
> 
> paralleling the existing logging in the exception_return
> helper for AArch64 exception returns:
> Exception return from AArch64 EL2 to AArch64 EL0 PC 0x8003045c
> Exception return from AArch64 EL2 to AArch32 EL0 PC 0x8003045c
> 
> (Note that an AArch32 exception return can only be
> AArch32->AArch32, never to AArch64.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> +    static const char * const cpu_mode_names[16] = {
> +        "usr", "fiq", "irq", "svc", "???", "???", "mon", "abt",
> +        "???", "???", "hyp", "und", "???", "???", "???", "sys"
> +    };

Nit: Better as static const char cpu_mode_names[16][4].

For tiny strings like this, the pointer to a separate string is larger than the
string itself.


r~
