Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp6548535lfg;
        Thu, 4 Mar 2021 12:15:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyA7Qs2SN7aYOmEUlsClqwBd5ylhRFVsLbFWwN6SsD7MRjrEQUwjcJE8Y7QlkuK8dtBpAeV
X-Received: by 2002:a92:c567:: with SMTP id b7mr5540821ilj.25.1614888953631;
        Thu, 04 Mar 2021 12:15:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614888953; cv=none;
        d=google.com; s=arc-20160816;
        b=GoqG58LQ3pjE7/scAj9rCSYpgTRIV4MUaULbGEXSaltGTAwo9qj4BtENSvaEPX4Io2
         yJiQLOI22lDP4QIiyU3FASAyfe3wOB1YQ76Wb4Z1OAFzgsFGBESGNp+xmWCOLzm/XQNA
         Ue3CaMLpFGLCfM2NEd0+GsVpNoBBMm+cCDckmSUbnbHYASR/98FwKROAJ/YtplZQvnrF
         LWbYXiZqjwUtE8DUT0yHgYUH23o+NdKBy3Zs+apxvSMfHHtrPzE1QjTn3LCb+Jyc8rLB
         3ht1J/9YES+p8WeLeIuSlYxrit5Tivv8sPdA5zQk7SF2X0lpyTtLCI7bGzyqgDJutWvp
         6TsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=oNPBa7xiR3W6GR87zDkVzYGTmGcJlX+2fDprzhOkp7I=;
        b=z1VnI10mfVbWB7ke1EA94g9/5IiButK5LdnlXBDgUZ9+Z/MrqC1LGpbAQRevbW646X
         eJq1QbFhqDN0daWwa9aLAEYWmU8x+uKUNRyAn+5D/jTVTmJyLDUOa+SagnXYDdyZ6lPm
         uNZg+0pyNaLdQK4erpfIcLL+znSUA/LFh8ueTVaud6XMxRY4k6VTKc3XwJqkhwGEMpPP
         ZQLK5AXmjJ4wX//timsBTRLBB2gQkKpNzICkzdytelBPBMiogZppBqGR1PWLfAbadPPO
         K/A1hQcStgdWGjDmniuR+BBk3n6z+/R0cSFi2aeXjfeQM/8SvbpLjvPXRQfCNdCE7/hq
         wUXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P2XkrhJJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z9si248603ior.7.2021.03.04.12.15.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Mar 2021 12:15:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P2XkrhJJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHuO0-00089M-KE
	for alex.bennee@linaro.org; Thu, 04 Mar 2021 15:15:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHuNZ-00087y-QH
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 15:15:25 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:34260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHuNY-00055P-A4
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 15:15:25 -0500
Received: by mail-pg1-x52c.google.com with SMTP id l2so19666727pgb.1
 for <qemu-arm@nongnu.org>; Thu, 04 Mar 2021 12:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=oNPBa7xiR3W6GR87zDkVzYGTmGcJlX+2fDprzhOkp7I=;
 b=P2XkrhJJtPrrkU3q52o1b7Oru6IdR3djMAlBbwIi3BVF0jGsfD/DPQ4lNHsbuA1MU2
 jr8n9ZZdCY4GLb8VHxo/ZayMcZC1RzXGkGeczH0kPMwPDz3RBfzKZShfF2pvwdceVgge
 qijx4vbzqegIk90/+oJR3HJvafnWFGIDJxweQHH4FTb+Aq+TmL+b4ikS+/JfvTvh7YB1
 vkT0qKihLL7pabxUu9bL35FHTSFEFvMdnZyuOEf/HNJ2QuqohwKtB17OkVyM/rzBNvDE
 VaHv0ZWZyCtqD736gFgGTWUzb8zUlyE2YHPu/VXhDUeGEd0Ek4qp3wryqQl412Zxxl15
 DDlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oNPBa7xiR3W6GR87zDkVzYGTmGcJlX+2fDprzhOkp7I=;
 b=E3kwY4OLaeOSqPr7yF42DNbFXEdfS4m097Kkvp/1NNGcNKvNWiebnbHzfKRhQERVGU
 DAcKAEhlvV3Q9oMPVCAWyZwCtIgfhIUu1Rw3NvEmnGxdUXo03u2co0RaN1CGOY/2HH+B
 o2cyo+9bnw0vRW9tR5EeWpeFqQlujtWeG4z1dpua0n7MnBd6UIHkU7ib5HtZwXkdoxb2
 PNl+s0wAtWyWi3a6wVTV46G/vWQ2ihzBNP7nBcY/nRLSPNq2O8T5HgoZnACZsgDkrAWq
 rqTGJZeFem5iyZbbNgIGBW8B1e0tfEsDR/vOQ+bZ8nSI8KZQUgQTPOcRTELmnN3DhfHT
 e/tQ==
X-Gm-Message-State: AOAM5334hDmkRpxxuWHBITkgxQnA7CgQa9oFElPTdbncH5vb6SOFhP+O
 qxCUymfvzUEbNfktenXP7i6n+r7xI2wP0g==
X-Received: by 2002:a63:4956:: with SMTP id y22mr5153575pgk.309.1614888922843; 
 Thu, 04 Mar 2021 12:15:22 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id w2sm249038pgh.54.2021.03.04.12.15.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 12:15:22 -0800 (PST)
Subject: Re: [PATCH 25/44] hw/arm/armsse: Move watchdogs into data-driven
 framework
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-26-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bb573d99-5425-e9a2-5929-6ea2a4e943a8@linaro.org>
Date: Thu, 4 Mar 2021 12:15:20 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-26-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TGm19Hm+7FvS

On 2/19/21 6:45 AM, Peter Maydell wrote:
> Move the CMSDK watchdog device handling into the data-driven device
> placement framework.  This is slightly more complicated because these
> devices might wire their IRQs up to the NMI line, and because one of
> them uses the slow 32KHz clock rather than the main clock.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
