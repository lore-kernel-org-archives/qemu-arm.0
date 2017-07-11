Received: by 10.12.150.144 with SMTP id a16csp5571241qvd;
        Tue, 11 Jul 2017 13:45:17 -0700 (PDT)
X-Received: by 10.200.39.24 with SMTP id g24mr391712qtg.163.1499805917037;
        Tue, 11 Jul 2017 13:45:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499805917; cv=none;
        d=google.com; s=arc-20160816;
        b=zfL7LbIIgFUwK5lLcGfg38QE3yLeolLhzPCk1HtUY+UvElNTWNjGZgxKcK4514ZJA3
         nZP1m/xo/xEiSmfXce7LjNUbvnnPt7edNLSQFlKLK21msoBGYeqWdJi7Eok9l3D9tbp7
         bCCcir843LUfPuLMeLWAp5o+WM5pC12NZPVp/U8Q/j8K09gtR6pKQPKxjIa9DUS0SvuY
         i0HCJ3nwYH0wQlysE59VnlfVDhtrRaqY0D+o1VtuzwM57cpjJ7uHGCKPO3uLFLAGNaSU
         8CB4xHFGDRl8ojdm/Ee6bucVzxxPv8bM35yKzwBKFoQgqElDQ/AZelvD06WWrdyLwajn
         swEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=RzxnkEHuAPxzHZ1UBMditnLTKyVKKh3SPD76MCm6q2M=;
        b=YW7wCLIVEBGHbTA010GCTrXh4Zn87tOG77hubRbS5fxCc1Jcw+YQjuhCXC9OUWWcu2
         MZgIAVzDFz53yZIl0/hlkYQCl8GxTNpXmeyUeRO9qArHeoHrIocuIxQCTXJL/SjDyCjd
         oR3vIPIjbMWpiDni2cz9ScHvdz3n5nvHlBHE6hNz0O4T5xsUMl5kcV9WY6bMWPp09mh1
         EnsFiieaWrVJ0uWaMIp5f4D2a3THwrGfZGpkzMRRdUL0fCJkaRZWlj2OmZehCpGd4Qkq
         LAqW7VP6AQxd+mkn3S42c/WF3v/SB4In3hR5mDbtEckzA6dbvUAQ7yWjeCf7L9bIPVyM
         lKsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=ZRAUPWce;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id t35si344800qtb.353.2017.07.11.13.45.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Jul 2017 13:45:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=ZRAUPWce;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48879 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dV21y-0001aF-FE
	for alex.bennee@linaro.org; Tue, 11 Jul 2017 16:45:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41767)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dV21G-00011A-OI
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 16:44:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dV21F-0006pe-S0
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 16:44:30 -0400
Received: from mail-qk0-f194.google.com ([209.85.220.194]:33608)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dV215-0006nA-6M; Tue, 11 Jul 2017 16:44:19 -0400
Received: by mail-qk0-f194.google.com with SMTP id p21so555184qke.0;
	Tue, 11 Jul 2017 13:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=RzxnkEHuAPxzHZ1UBMditnLTKyVKKh3SPD76MCm6q2M=;
	b=ZRAUPWcetN4TG2yfW3OkaHoDy3ghh7ixPctV+B20YBK3qiEPpVPFd0cQ6Eyx7kNsep
	mWfG2rt0ELYsZxlei4ZIx+6ZJ7TvyBRHpwABqngsTsWGHhWxVjzMUzZE2g+uG0/yHw6v
	4UlXwwOqzB69lrfqM9CzRWDwOfHgZHnvMVQkcYJlRugQdl6+jT7zIyGhflvz11d3zSxH
	hYasp6mzgBwFnF7KhyEK1VF5+i/CcLb6aYZcJIkmmfT1+dzKAiQ7wgn96Nqyc569n/Hy
	G3LUdjM4/ZppUdVh0SGYAebNU6TUj6Q8n8qOTrKDv2wvoKT/PK5/GynKsND3C7cFOQIT
	j8ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=RzxnkEHuAPxzHZ1UBMditnLTKyVKKh3SPD76MCm6q2M=;
	b=rxWKpteKo8/P32Rkcc6uKNKCSMGzNimxDQYfbqGy/CYsp4XzuCup2Cf9BUIis7ifsK
	ibqdgJhiO1RWjCsPhMSwiKJqAryipBfDMKHtvrHvywJ7LPfWA9Wh4Mr8Dsn1l+tEs/i1
	IMTjm/GwUJelCupox0iup+afLz7RWNwPoA+R3GbDNKifEdG0ivZB4cHK9ELg6co6uK4r
	KVIs4k03bAi+W0hCQBs07g5nKHWd+AokSssQ+Eg1I5DAwVsh6opHP7VgiV5k9e9/+PhH
	vxJA9LiULkJusYSy9fjAChZvu7x+65DgoQEaKATnd1+eg53qQkYOxQGoACocgn41Kx2p
	3Ucw==
X-Gm-Message-State: AIVw113sAbinPebGm5IdX+1tJcJY41lI2YfDfeR0RpE1/lz32XolWru5
	iBMogDDBo/pdBQ==
X-Received: by 10.55.76.193 with SMTP id z184mr2188070qka.146.1499805798529;
	Tue, 11 Jul 2017 13:43:18 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id q40sm280784qtf.42.2017.07.11.13.43.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Jul 2017 13:43:02 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1499771839-32518-1-git-send-email-peter.maydell@linaro.org>
	<1499771839-32518-3-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6cee176b-a624-4f1d-aba6-e1c9fa011209@amsat.org>
Date: Tue, 11 Jul 2017 17:42:59 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1499771839-32518-3-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.220.194
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/7] hw/char/cmsdk-apb-uart.c:
 Implement CMSDK APB UART
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
X-TUID: 0NSxMJyScIrz

Hi Peter,

There is probably no need yet, but we could model a generic APB slave 
with this code, as an overlapping subregion (device top 0x30 bytes).

For now only PID0 differs, but since all ID are 8bit the device could 
even instantiate the subregion with some u64 PID, 32 CID args.

(thinking about watchdog and dualtimers).

Regards,

Phil.

On 07/11/2017 08:17 AM, Peter Maydell wrote:
> +REG32(PID4, 0xFD0)
> +REG32(PID5, 0xFD4)
> +REG32(PID6, 0xFD8)
> +REG32(PID7, 0xFDC)
> +REG32(PID0, 0xFE0)
> +REG32(PID1, 0xFE4)
> +REG32(PID2, 0xFE8)
> +REG32(PID3, 0xFEC)
> +REG32(CID0, 0xFF0)
> +REG32(CID1, 0xFF4)
> +REG32(CID2, 0xFF8)
> +REG32(CID3, 0xFFC)
> +
> +/* PID/CID values */
> +static const int uart_id[] = {
> +    0x04, 0x00, 0x00, 0x00, /* PID4..PID7 */
> +    0x21, 0xb8, 0x1b, 0x00, /* PID0..PID3 */
> +    0x0d, 0xf0, 0x05, 0xb1, /* CID0..CID3 */
> +};
> +
[...]
> +static uint64_t uart_read(void *opaque, hwaddr offset, unsigned size)
> +{
> +    CMSDKAPBUART *s = CMSDK_APB_UART(opaque);
> +    uint64_t r;
> +
> +    switch (offset) {
[...]
> +    case A_PID4 ... A_CID3:
> +        r = uart_id[offset / 4 - A_PID4];
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "CMSDK APB UART read: bad offset %x\n", (int) offset);
> +        r = 0;
> +        break;
> +    }
> +    trace_cmsdk_apb_uart_read(offset, r, size);
> +    return r;
> +}
> +
[...]
> +static void uart_write(void *opaque, hwaddr offset, uint64_t value,
> +                       unsigned size)
> +{
> +    CMSDKAPBUART *s = CMSDK_APB_UART(opaque);
> +
> +    trace_cmsdk_apb_uart_write(offset, value, size);
> +
> +    switch (offset) {
[...]
> +    case A_PID4 ... A_CID3:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "CMSDK APB UART write: write to RO offset 0x%x\n",
> +                      (int)offset);
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "CMSDK APB UART write: bad offset 0x%x\n", (int) offset);
> +        break;
> +    }
> +}
