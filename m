Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3741125wrx;
        Tue, 23 Apr 2019 10:41:43 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzgaJ9qeqpqNgMZ5GIt+XRd5P3qDgOnYiA/a00eeAZ4KDvCkNABQ+SSwvHV3x8Ea4bhpLJU
X-Received: by 2002:a1c:44d7:: with SMTP id r206mr3106353wma.129.1556041303754;
        Tue, 23 Apr 2019 10:41:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556041303; cv=none;
        d=google.com; s=arc-20160816;
        b=vQmA1wHznZ64ZvIU/zS3onHh1TSqt9VQdZerYDWFrWFV8ZgHh66ICVvFyhjU0Kg221
         lO9XV12Y78eauAp9j1rrvU9yvykjJ53AhIdAfMkvzD3u2TTf/6w5VZhGrIVX7MB+BZ/9
         kuqrLo7aiD5ViMJfn8ksUS4/jUtMsvSCCBm3JaJlvb9iuiA2bvPJMBYc4ZhwvLVYKHOr
         95om+bELPv9d1s6ZJ+Qz36yMVw9qyZyezPopnlwafz1j0Z3vkDnv6dZQtiK3eSR511cH
         QcHG8zKwblDKVoyOu8ZuFrRK7zTBOOHbrMFjQ4RroilFKlyWDT6Qpz6xzVZiy6IH7RAr
         mI1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=TsCIcrycmaSg8HmxkWfUSgJX2WZTKpsR7mOS83Fw07I=;
        b=n9aDM5SsSvqXT5rVzvnHBAcbbMDZCgrqAo2SZJer/v7aSld9z/wuxvGAw4/Q3ARHUq
         H/DUlQUSRUfdqXMTJAigN4o3IdGaM6rGAtIIF/E4h9AO1+Ca+K8neDZW5UlZ5BIqn29D
         bpjq8qUCnxgUFxyL7h8yIPJuFuv4Yp3y/y7U7z+GiBS8F8EpL0fyXjrdpFuC2zfmTfvI
         sKb6hqgXX2lXLKrhy2kD99+gm/75tEqAjaz8af447e+eoxviVocgXiW+d3+4XCoRrLp9
         fPs7oojXG5L1zSElTo7NJVYuMmoMaO3ytSdWLL9oJQPrQOCATD4v4j1tmYIddET4AHQW
         CLbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JcooNEeX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o9si6191222wrn.130.2019.04.23.10.41.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Apr 2019 10:41:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JcooNEeX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:57327 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hIzQM-0003FZ-Q9
	for alex.bennee@linaro.org; Tue, 23 Apr 2019 13:41:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51524)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hIzMf-00083E-FB
	for qemu-arm@nongnu.org; Tue, 23 Apr 2019 13:37:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hIzCl-0001NL-FX
	for qemu-arm@nongnu.org; Tue, 23 Apr 2019 13:27:40 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:36004)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hIzCl-0001HP-6G
	for qemu-arm@nongnu.org; Tue, 23 Apr 2019 13:27:39 -0400
Received: by mail-pg1-x543.google.com with SMTP id 85so7960322pgc.3
	for <qemu-arm@nongnu.org>; Tue, 23 Apr 2019 10:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=TsCIcrycmaSg8HmxkWfUSgJX2WZTKpsR7mOS83Fw07I=;
	b=JcooNEeXVZ4IKVC0dvAfYHad0OPAYQDymBSB9uavukCV8h+yhTIoiv1rMYMiGIqGul
	T7ydTBYcVkyHU1YiMQGK+uvzuieiV6G0T9X+87eEzRFZN5lkGBtiof+COZgwuDyYRkEC
	eWsIbPoSO0DzFgaWrr8cQ7K8wkxT8FgSvfw+/EoNGWzEFdleFCWw7WwZuXEcPiQgpx86
	h9gwr62OdZ7dHSRVvz2qw5fxD38x4o8OeAhx/zIWd4onS7zFoaoGJHGDLeZkt9qEEfx5
	Br+iCW36BDCW7+cf52GLWCnF32FcKCe7l1vOPR/c7raquBOt0mAhdcmH2/T+jxjCBCPu
	Vitg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=TsCIcrycmaSg8HmxkWfUSgJX2WZTKpsR7mOS83Fw07I=;
	b=Ch7mYqEbO194l/0udZ0KYBFC3maMcNkJedwA4dAzX+ZrfHC0gkSnwfeHVUrUIW48CY
	J4vxP33nxKMLc0b9Mpt7dCAb6mdjp8Y574b5GjXVuEBgh8v/mDB41lDDqcoGlwyqhl1x
	UF2R+SG4mnBShinos3GuoMQ7UU4pTd+qDkW0Z7OkzQNZaWPeKHzw2+zBpI68M6BPYPcf
	u5nkN208sTQ2IEnsNGcSufsQf+oUs5/YpdyYNvd4u0LpaSL5khj2LCP06FPYpoPpK+id
	5bAPjPXTbNgM8lgeuOFXgLbYxh9gcbJz4LeAMeazwBEbef8K0R6ZVyz4L8tRzvpf7Jf+
	Nc6A==
X-Gm-Message-State: APjAAAUD3KbBpX0yV6YbcYyCje6VHYGShzOLKQsKoXXW08e8tFbeHzQX
	ZI2cfyBAjv47HQttmC0oIjYcgg==
X-Received: by 2002:a62:2fc7:: with SMTP id v190mr27319315pfv.10.1556040457478;
	Tue, 23 Apr 2019 10:27:37 -0700 (PDT)
Received: from [192.168.1.11] (97-113-179-147.tukw.qwest.net. [97.113.179.147])
	by smtp.gmail.com with ESMTPSA id
	w21sm22130387pfn.48.2019.04.23.10.27.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Apr 2019 10:27:36 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190416125744.27770-1-peter.maydell@linaro.org>
	<20190416125744.27770-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <4a3a72f6-a450-b074-b8da-26fe6615ae59@linaro.org>
Date: Tue, 23 Apr 2019 10:27:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190416125744.27770-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 02/26] hw/intc/armv7m_nvic:
 Allow reading of M-profile MVFR* registers
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YFND0Zv+94R1

On 4/16/19 5:57 AM, Peter Maydell wrote:
> For M-profile the MVFR* ID registers are memory mapped, in the
> range we implement via the NVIC. Allow them to be read.
> (If the CPU has no FPU, these registers are defined to be RAZ.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/armv7m_nvic.c | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

