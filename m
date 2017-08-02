Received: by 10.25.44.15 with SMTP id s15csp58062lfs;
        Wed, 2 Aug 2017 14:50:23 -0700 (PDT)
X-Received: by 10.200.39.206 with SMTP id x14mr35628666qtx.259.1501710623309;
        Wed, 02 Aug 2017 14:50:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501710623; cv=none;
        d=google.com; s=arc-20160816;
        b=etNMGqdPthIfwFb4PRnUz8g5QAOUteJky3AwXlPzr4OeWW3423lJo6ZqWFW6I2FeZN
         k2vdUcGUb2fXX8W/SqMbUV99jPIDOGiHzQnx9JAlJl7nJzXgXj/BagKv0H2hhbrqAnr9
         7lg10fHh7mqyx+W2cc7CXROa3OvKxp2Gq2g2QgAO3jCz8PVUEIDZ+Md2MOL/qfRgXNJS
         A3TP1DxnnJMO+RLa65+U6iT7am/Rxgpow+3mLaw81r7L3KZUFty0lhGY/sQwic8Pyv4c
         FyhmFW1zHJ0TGLmmKnZxBc2rb2tZM/Ch5O66WEP3S+2nlNUxW61orCStPhbhKGEV2J39
         k5sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=OOX77wjwMZXmqch69YiLuoCKvHduHh2K3N8aWKdD19M=;
        b=L3C3TjpSQkRuXesXHOTH61yllHdmAvgqO4dVkvDoOUEIhe9WNnybl0uczdu4nHdh/+
         LkpoiyXTAyRXUW9FgdSIG+U5J/eSeMYiMsM+uaQSxhrYxW34VPUIE4Pij0MTwY9fYrZg
         lbbFX8Nefl16Krua18uO+kVJhcfD4bLNiDNwoVjh9btErPN87EWbyg3I5B7BDqPb2H2m
         XA98ExbEo0NIaalgtFvqrKeES7kZsaHZE4URPs2eNE3hpWpz0o0Ii1xfoj1KTzC8XbEZ
         L4jHt2qHToyM7tM/K8Xqr1NbPvWqXM7IVJ7u6g2kPdqtgee8DDBl4J50pqYK2Ygzl2j+
         bNfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=WqG14tDA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l5si12363368qkd.177.2017.08.02.14.50.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Aug 2017 14:50:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=WqG14tDA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50686 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dd1X2-0001Fe-Hh
	for alex.bennee@linaro.org; Wed, 02 Aug 2017 17:50:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50887)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dd1Vy-0000jo-7A
	for qemu-devel@nongnu.org; Wed, 02 Aug 2017 17:49:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dd1Vx-0000hC-9p
	for qemu-devel@nongnu.org; Wed, 02 Aug 2017 17:49:14 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:38881)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dd1Vx-0000gz-5Q; Wed, 02 Aug 2017 17:49:13 -0400
Received: by mail-qk0-x244.google.com with SMTP id m84so5881720qki.5;
	Wed, 02 Aug 2017 14:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=OOX77wjwMZXmqch69YiLuoCKvHduHh2K3N8aWKdD19M=;
	b=WqG14tDAzn8oEzfDqvgq0K7gM/sYXjOx/uUcxHHrf4UlBZU0b8UpcBNonTtRAQBrvr
	1YEA/T3KH9qBTFs8su6vBds3rhxd3isui+8OHXEdTjDcNl/XphERLGjH0vu/wqYtNx6l
	TMejDNICP51uQ49cKFb9Mn5dbXrmRkuqPfb0Ph4SNodOTfp0Z6lEhJzoqQ/SJ/xvEhHB
	91k+SqIWSJz5AL+58CObxOsi+VdUHw0aYXhwhQVVPORmprXNOqIue1QZhhPbRsyxv+zk
	W5HbIy4KDZ8G5jqxzJgEysS0H1/efw/H2v7cAjHwpPdJFU7uGYdW01IjZAHFypWzsqqg
	SitQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=OOX77wjwMZXmqch69YiLuoCKvHduHh2K3N8aWKdD19M=;
	b=EZwsMda4fB2zanIfwUQBvab+BV9Ng/K9cKGL4byrFgOVQD6V/ikjGSgTAZ83ONwiWv
	54gfNgWVCVvWRgYwtRl7OD9dcwqPQeIFG9YyDdfdJjeXAkoJxcY9a0nk3Yfz0gs0YDMc
	aG5RSptr474ws9VX8flDqvRp1oXf/rHBT01s0WZ322bOthqDOd4UlysO/J4ghepSiLf/
	Qw6pkciboh/dpVXaGqbQohUpP8ZUZ91smmiIfq5uOw6XrT7/+PbDEcaFs7P7OljJuS/a
	a8C47LVYgUyE+OWaV6+inVasqYnsxDoaLE0rKRukf8G0h8ZjXRlLIo5cCVng6p/Ygu7Z
	psXA==
X-Gm-Message-State: AIVw113po/6VbrABDsIfdtTqjaV35smIKyTmPofB1hMbTezfBK1aV4FH
	+qBLuJ4OO699SA==
X-Received: by 10.55.113.5 with SMTP id m5mr31581381qkc.88.1501710552542;
	Wed, 02 Aug 2017 14:49:12 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	m123sm24029925qke.12.2017.08.02.14.49.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Aug 2017 14:49:11 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
	<1501692241-23310-15-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <988ce89c-4e6c-5cf3-f040-7797a9f7902d@amsat.org>
Date: Wed, 2 Aug 2017 18:49:09 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1501692241-23310-15-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 14/15] armv7m_nvic.h: Move from
 include/hw/arm to include/hw/intc
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
X-TUID: mqJDX7I1Iiel

On 08/02/2017 01:44 PM, Peter Maydell wrote:
> The armv7m_nvic.h header file was accidentally placed in
> include/hw/arm; move it to include/hw/intc to match where
> its corresponding .c file lives.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>   hw/intc/armv7m_nvic.c                  | 2 +-
>   include/hw/arm/armv7m.h                | 2 +-
>   include/hw/{arm => intc}/armv7m_nvic.h | 0
>   3 files changed, 2 insertions(+), 2 deletions(-)
>   rename include/hw/{arm => intc}/armv7m_nvic.h (100%)
> 
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index 343bc16..5a18025 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -17,7 +17,7 @@
>   #include "hw/sysbus.h"
>   #include "qemu/timer.h"
>   #include "hw/arm/arm.h"
> -#include "hw/arm/armv7m_nvic.h"
> +#include "hw/intc/armv7m_nvic.h"
>   #include "target/arm/cpu.h"
>   #include "exec/exec-all.h"
>   #include "qemu/log.h"
> diff --git a/include/hw/arm/armv7m.h b/include/hw/arm/armv7m.h
> index a9b3f2a..10eb058 100644
> --- a/include/hw/arm/armv7m.h
> +++ b/include/hw/arm/armv7m.h
> @@ -11,7 +11,7 @@
>   #define HW_ARM_ARMV7M_H
>   
>   #include "hw/sysbus.h"
> -#include "hw/arm/armv7m_nvic.h"
> +#include "hw/intc/armv7m_nvic.h"
>   
>   #define TYPE_BITBAND "ARM,bitband-memory"
>   #define BITBAND(obj) OBJECT_CHECK(BitBandState, (obj), TYPE_BITBAND)
> diff --git a/include/hw/arm/armv7m_nvic.h b/include/hw/intc/armv7m_nvic.h
> similarity index 100%
> rename from include/hw/arm/armv7m_nvic.h
> rename to include/hw/intc/armv7m_nvic.h
> 
