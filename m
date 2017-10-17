Received: by 10.223.197.9 with SMTP id q9csp4565884wrf;
        Tue, 17 Oct 2017 05:51:25 -0700 (PDT)
X-Received: by 10.55.215.22 with SMTP id m22mr18760272qki.119.1508244685650;
        Tue, 17 Oct 2017 05:51:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508244685; cv=none;
        d=google.com; s=arc-20160816;
        b=Dh1VCk6d9pWEP4jxeNGa1r75ovAYV3KiBVHmlWoT/1FR/bMnKQPNAXIixvl8E/oUv6
         9OVKmK6Q85UWLoQ8sQBYWn81knZVvijWwNKmy1HbaK4ge6f+i7r1+9sVPgXW604QOxh7
         qrggLdxkUHg5UMRUHC83XEJWFYlZdsI+/egM+sz8tGP9grADoUqqLe1IQh7VN9gvRaY8
         b5pdYfbC8pX6h/gjT91fdmrF+daTFoPANFN9s7ib+MPTUj0sEZEWwgSb1KSDfMoXGB5W
         5TzGTgATkevqMn5U3iKpo8IW8CdHv+SNaHCXry5IBtJ3BMSDCllYjURkQH5jcE/plgwe
         +zRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=MLV+X0NvM92kGxR69QKwyUYlLRXz1+IzOtf1EBCUohc=;
        b=KF2AQVSetIqAjwAqks222GzdLKGt8n6F4AmlkfSpdFpgcfvzEhXG7vFzTUW07gq0VK
         QvK7Ulbh7vMFRNJBwZjGU95ZkDtA1mFS1UZXTiPglINybqeNe3ytWqc+aQMr71pxglrR
         m/9JjzLNHqNm8puAu3S+ZKBDccFI0haIYDfFn0OhwX0+xad7pFtuAQ8ylRl52zJ8JJA5
         ozbalgHpolX2jYuFFZewWWzGnmZDaurCkT6Qcvj8H7rnmYI4gz2Oz1aVU4qWh2fzznq4
         oYNtaqim+8b1+/YCuzrCUoCcLaYSZAuAocFeSiOgqiN4uGgsiaJTpHq+FLFg+4p6kUfk
         9HWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bXXdWOP9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 100si450215qkx.263.2017.10.17.05.51.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Oct 2017 05:51:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bXXdWOP9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38469 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e4RL9-0004vv-Ee
	for alex.bennee@linaro.org; Tue, 17 Oct 2017 08:51:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48124)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e4RK7-0004Yn-Ul
	for qemu-devel@nongnu.org; Tue, 17 Oct 2017 08:50:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e4RK6-0000CG-PJ
	for qemu-devel@nongnu.org; Tue, 17 Oct 2017 08:50:19 -0400
Received: from mail-wm0-x230.google.com ([2a00:1450:400c:c09::230]:45714)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e4RK6-0000BT-D7
	for qemu-devel@nongnu.org; Tue, 17 Oct 2017 08:50:18 -0400
Received: by mail-wm0-x230.google.com with SMTP id q124so3675273wmb.0
	for <qemu-devel@nongnu.org>; Tue, 17 Oct 2017 05:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MLV+X0NvM92kGxR69QKwyUYlLRXz1+IzOtf1EBCUohc=;
	b=bXXdWOP9Z3LQnxbeeyf8EiOwkEpvlvA1xhiiGS9XkD3v8jUPniTKfTBbzrEEs9QLlH
	0hOtOeVVWQ+eBtnys9/9Ip/oZWdGcQJ3UzuiGKbKpb0G1TTLrxkzMTUhqfaKt2O7jWnN
	tCPaB4a7vbT+OVYzqD1mmJDskYgq68byQpJf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MLV+X0NvM92kGxR69QKwyUYlLRXz1+IzOtf1EBCUohc=;
	b=BKnJJvwEj8psxYMKyT/C8CNfgsGYGwqXp0rfK6QvRop2wrLdKHsD4hAvIJsjcsWUwt
	2uEyuTRHXwxSBe24yQ1wUxMr3I8v45fcuYjCNyCPZEujEu7Jzc5LhND2TlY8lgoIDxqR
	zDcXe0JwOD6U7NRmn3vEKVNqKjILB2baS+OnaeBXybGi3cNG5UbtNRA1+weGJnMYcBCJ
	BgDeu4Fpi+8bk+ix0nlQOBp+48mS2OnQJNPb2YtxtqoH5IhD0iJp6SU51u2uUzjrt+qm
	Hti/gSXUNKhDysqZyETWbf0RpnoaNnx0OKj/CQcM+7ihJ+JMX/TSEWjXanEl2/1XH/3L
	9CIw==
X-Gm-Message-State: AMCzsaXXiUQB0xVrVamxJFL7WMvFQJt2czNfmhlvf0S5Z1sRN8L3rRfq
	htxAN5DInIwxH4H8NNx1MydMt1kPaaxmHCJU6Zs9zw==
X-Google-Smtp-Source: ABhQp+Sa9XgbVLlUnZdXUQupUHry6bguaCvlZLKVdfu6dVloQVvt+VKEOfx/AQeBGO9v9qFhyyPPDDhXIWvRGMbEz/M=
X-Received: by 10.28.236.203 with SMTP id h72mr3802335wmi.147.1508244617305;
	Tue, 17 Oct 2017 05:50:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.195 with HTTP; Tue, 17 Oct 2017 05:49:56 -0700 (PDT)
In-Reply-To: <1506737310-21880-3-git-send-email-alindsay@codeaurora.org>
References: <1506737310-21880-1-git-send-email-alindsay@codeaurora.org>
	<1506737310-21880-3-git-send-email-alindsay@codeaurora.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Oct 2017 13:49:56 +0100
Message-ID: <CAFEAcA_zwAu4Zt0-2Qy9euBzYQgD19EnnoWwa+ZNzidWwkmEcA@mail.gmail.com>
To: Aaron Lindsay <alindsay@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::230
Subject: Re: [Qemu-devel] [PATCH 02/13] target/arm: Check PMCNTEN for
 whether PMCCNTR is enabled
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
Cc: Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qTGHPA9KoUra

On 30 September 2017 at 03:08, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> ---
>  target/arm/helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 8be78ea..40c9273 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -964,7 +964,7 @@ static inline bool arm_ccnt_enabled(CPUARMState *env)
>  {
>      /* This does not support checking PMCCFILTR_EL0 register */
>
> -    if (!(env->cp15.c9_pmcr & PMCRE)) {
> +    if (!(env->cp15.c9_pmcr & PMCRE) || !(env->cp15.c9_pmcnten & (1 << 31))) {
>          return false;
>      }
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

I keep replying to your v1 patchset by mistake -- can you use
the git format-patch options to put make the subject prefix
be "[PATCH v3]" for the next round in all the patchmails to
help keep the versions distinct, please?

thanks
-- PMM
