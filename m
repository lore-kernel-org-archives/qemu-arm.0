Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp2103024lfa;
        Fri, 30 Oct 2020 20:01:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxnQ9DRkOFkrP5K2gT24qf39tvxn4QHpVlhN/ZxpvQZxoZtla526GlaLfdrefDvo6+ciwM1
X-Received: by 2002:a5e:961a:: with SMTP id a26mr4018823ioq.48.1604113315158;
        Fri, 30 Oct 2020 20:01:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1604113315; cv=none;
        d=google.com; s=arc-20160816;
        b=XhDtxMCPIpHpIt5Z6dtKN0He6NmECIuyK7IML2+ZBhPAkyzyXDusqHTvQM4VlkRfK8
         Ie6pdX2nDyQ+tsBo5di+DsHBesC/To4rr+CRHW3wcGudlypBJfZbnxRgZOBwqN1b7SwW
         N//2HbRrevKBVl75g/KHoIZS2NhVp7/DEIxmFyBRH05vVdrX+R9ypfcVM6uiSbILsi1M
         ujc5IJ/Q/PliTlA35dte6/9vb1NuVeamA6flSfPyCy+GgnlizScnQCYNtzGePcrdnKsX
         a9YGjONZ8ThZBO1ubtSHqHuoqGAjEd8S7EeiV68N160DiJDeAORHgmryPf/SahGHdAO+
         TqeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:references:subject:to:mime-version:user-agent:from:date
         :message-id;
        bh=pqiXjktkU63GONiqhG6kaAXTqLCLQ2neip5h9PhMdXE=;
        b=Rt9xB7B6j2iLIdrmNdPKPWBL63q63H+Phi7t3EmUJE4J8UTjyzVKr5x2tgFp3Zhzs0
         29dcu6Ao9Kc4qbCrj8CSfD7/FWHEGMgWJmxeR7oF05AIBIp1iocg0GozeFnv4tEuXIwo
         /7HfM2Icl+ZwShGQkHccruiPdIUbxTYWo9pWDOYjJZURA8VELLjscMlrAb0p7U7xGQi3
         3gyr8iZDGmeMYNErw1Z9RtTWuguiSOuoEW1rFMPAs7IMrF3AZmtmh0Lfsaq1Bz95RDb3
         rOqEUc2JaLJrmKbpMvZ6Il3fS/YhTizysXMUaJMlXmJ8tCJVqUt721NXnMaJhb40BXiv
         AmRg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v64si450587ili.39.2020.10.30.20.01.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Oct 2020 20:01:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kYh9O-0002To-Fa
	for alex.bennee@linaro.org; Fri, 30 Oct 2020 23:01:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kYh8z-0002TE-5D; Fri, 30 Oct 2020 23:01:29 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:2065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kYh8x-0000qj-Ct; Fri, 30 Oct 2020 23:01:28 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CNP8P4FHNzhcVB;
 Sat, 31 Oct 2020 11:01:25 +0800 (CST)
Received: from [10.174.187.138] (10.174.187.138) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.487.0; Sat, 31 Oct 2020 11:01:21 +0800
Message-ID: <5F9CD381.9010507@huawei.com>
Date: Sat, 31 Oct 2020 11:01:21 +0800
From: AlexChen <alex.chen@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.2; WOW64;
 rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] hw/display/omap_lcdc: Fix potential NULL pointer
 dereference
References: <5F9BE993.4050406@huawei.com>
 <CAFEAcA8hpb2UVd3PSY4XuEpKYeu1Am1+41DQ=gN48xbAv281TQ@mail.gmail.com>
 <CAFEAcA-WTw-0EvT1REbTrtgLB9sBbnJBuNW9LMh7eOtsXtrDTw@mail.gmail.com>
In-Reply-To: <CAFEAcA-WTw-0EvT1REbTrtgLB9sBbnJBuNW9LMh7eOtsXtrDTw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.187.138]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=alex.chen@huawei.com;
 helo=szxga06-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/30 22:57:53
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.253,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EM3et6VtpVyr

On 2020/10/30 22:35, Peter Maydell wrote:
> On Fri, 30 Oct 2020 at 14:29, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> On Fri, 30 Oct 2020 at 10:23, AlexChen <alex.chen@huawei.com> wrote:
>>>
>>> In omap_lcd_interrupts(), the pointer omap_lcd is dereferenced before
>>> being check if it is valid, which may lead to NULL pointer dereference.
>>> So move the assignment to surface after checking that the omap_lcd is valid.
>>>
>>> Reported-by: Euler Robot <euler.robot@huawei.com>
>>> Signed-off-by: Alex Chen <alex.chen@huawei.com>
>>> ---
>>>  hw/display/omap_lcdc.c | 3 ++-
>>>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
>> Applied to target-arm.next, thanks.
> 
> Whoops, spoke too soon. This doesn't compile:
> 
> ../../hw/display/omap_lcdc.c: In function ‘omap_update_display’:
> ../../hw/display/omap_lcdc.c:88:10: error: ‘surface’ may be used
> uninitialized in this function [-Werror=maybe-uninitialized]
>          !surface_bits_per_pixel(surface)) {
>           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> 
> because the early exit check
>     if (!omap_lcd || omap_lcd->plm == 1 || !omap_lcd->enable ||
>         !surface_bits_per_pixel(surface)) {
>         return;
>     }
> 
> uses 'surface' and this patch moves the initialization of that
> variable down below its first use.
> 

Oh, I apologize for this compilation error, I will fix it in my patch v2.

Thanks,
Alex
