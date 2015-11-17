Received: by 10.182.158.201 with SMTP id ww9csp437645obb;
        Mon, 16 Nov 2015 17:37:19 -0800 (PST)
X-Received: by 10.31.155.131 with SMTP id d125mr1118704vke.86.1447724239479;
        Mon, 16 Nov 2015 17:37:19 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g201si844156vkf.173.2015.11.16.17.37.19
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Mon, 16 Nov 2015 17:37:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro_org.20150623.gappssmtp.com
Received: from localhost ([::1]:55160 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZyVCx-0001Kc-0h
	for alex.bennee@linaro.org; Mon, 16 Nov 2015 20:37:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50276)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1ZyVCu-0001J9-IG
	for qemu-arm@nongnu.org; Mon, 16 Nov 2015 20:37:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1ZyVCq-00035S-B5
	for qemu-arm@nongnu.org; Mon, 16 Nov 2015 20:37:16 -0500
Received: from mail-wm0-x232.google.com ([2a00:1450:400c:c09::232]:36614)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1ZyVCq-00035H-4C
	for qemu-arm@nongnu.org; Mon, 16 Nov 2015 20:37:12 -0500
Received: by wmww144 with SMTP id w144so134248114wmw.1
	for <qemu-arm@nongnu.org>; Mon, 16 Nov 2015 17:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro_org.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=YQxjO4ASSQhjma2MM70Pi3IcyK9/IlL+E/68IMlA31M=;
	b=e8U9/iXRbOInRq3TG5uwLKaGgLj9VP2e8YlVqzL6tUxydysQOeDmdGkWTPc8meSe49
	jgrizhsVOzrw9rF3/6r/I3p7vEgg01a0f43gGALRgUf+3nyEecloAEkFq7+ktuGHc8k7
	xA/Ul+K+PAGXi5PQDGu7ta7KBYAO9itwCsWi857WJx1jO6w8HD4caHeSdHCxAedzJhZH
	LlxPgAhzn4dksvPnGK1KG0XltgeADoAbT04gxd6r9t+b8zgOjmnXK7nzhGnGkSHAo1hF
	RnV5gAIA54RUO1sdjPYEgls3JPdMtQiyQPsyrZVOtQWhyY9Vtjp7wjkSzwYLw+eBsx2F
	v0kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=YQxjO4ASSQhjma2MM70Pi3IcyK9/IlL+E/68IMlA31M=;
	b=hIPpCvI6/3XZoEVUjbb8WjxJ0gfTLExkED0KEWYBRLfNgyywLgxUQa7zvu3RShnSAH
	n5Jm6Mx3bOdzCjQz8bzNaabf0iq/Q1AvtqkcyVrbknvzwiyhb9Ga+qqsNB2hKdTz76Ew
	RvOFS5tgHx5f1ua3noc3cjsRALiWg3k/Po7hFdnr0hXFr+kgTZIY1MTF6XN4TO07Ls5r
	N4R2VF+iazZVpxIuzU8Je2TPIFw4Cvx1bENTf7cj5X+9/pEC23ZrpMd0j3Zvlw15o3Jz
	5tDMQKuf+nuVcxNw6Ix9aNgM+S0MR91XAE+VeM/ZzBcfs/cudKdeHkkKxaJcDeTqW2vB
	VleQ==
X-Gm-Message-State: ALoCoQlmKpQE8B/tWeIczY24vLD71ZJ6PvBqbquM5rNASMrR7G/nhELAFPIRNkRwFYjyPwmLvQ9x
X-Received: by 10.194.90.169 with SMTP id bx9mr39928512wjb.1.1447724231363;
	Mon, 16 Nov 2015 17:37:11 -0800 (PST)
Received: from [10.15.9.90] ([78.129.251.54])
	by smtp.googlemail.com with ESMTPSA id
	l128sm21171012wmf.10.2015.11.16.17.37.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Nov 2015 17:37:10 -0800 (PST)
To: qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
	imammedo@redhat.com, wei@redhat.com
References: <1447680189-2128-1-git-send-email-shannon.zhao@linaro.org>
From: Shannon Zhao <shannon.zhao@linaro.org>
Message-ID: <564A84BD.3070905@linaro.org>
Date: Tue, 17 Nov 2015 09:37:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1447680189-2128-1-git-send-email-shannon.zhao@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c09::232
Cc: zhaoshenglong@huawei.com, qemu-devel@nongnu.org, graeme.gregory@linaro.org,
	peter.huangpeng@huawei.com
Subject: Re: [Qemu-arm] [PATCH v3 0/8] Add system_powerdown support on ARM
 for ACPI and DT
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5lP1Qvd5r0xU

Hi,

On 2015/11/16 21:23, shannon.zhao@linaro.org wrote:
> [1] https://git.linaro.org/people/shannon.zhao/qemu.git/shortlog/refs/heads/PowerButton_v2
Sorry, this link should be
https://git.linaro.org/people/shannon.zhao/qemu.git/shortlog/refs/heads/PowerButton_v3

> [2] https://lkml.org/lkml/2015/9/30/392
> [3] http://people.linaro.org/~shannon.zhao/ACPI_ARM/QEMU_EFI.fd
> [4] https://wiki.linaro.org/LEG/Engineering/Kernel/ACPI/GPIOPowerButton

-- 
Shannon
