Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp2718761lfh;
        Mon, 30 May 2022 05:13:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBx5fqvRICf35Xcv3e6MbUCbuxTKis9dJLjzqAGQbC5KjRth0bEjX8DHoKhnYQojRmEArd
X-Received: by 2002:ac8:7d8e:0:b0:2f9:3bd1:9d6c with SMTP id c14-20020ac87d8e000000b002f93bd19d6cmr29067206qtd.186.1653912788178;
        Mon, 30 May 2022 05:13:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653912788; cv=none;
        d=google.com; s=arc-20160816;
        b=ZkLAkrmXBxfSJDqe/oWaTq0QovqsZpd3LIZzfHlb2NlPrtbYaFdj/SL8K0ImM0j/xc
         lN8ib+IiOklUDDx7Jskxmn309CNzFYzVrW/QwrJQ808T/N/y8BVsvGwhSC75c7NYpiSJ
         DackTOrT4SF2/ByYT4wZgYZfCCyupK/W18vj2BD+kXdSh+zD6htNeZYbFfl1BVOSADFW
         PonAj+2KA/NzLrkg8HWPla2nObTbbBGCQyn5n71UV6AtRgMxq2DNR/0QZ/BJm/ZCZDBt
         suZLc8sanGyQB1X5iKW8QITKzuq9qrkBSnrK0+3MVR8mAiurNLaV0p8RzRa/O9+jP97d
         jN4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:cms-type
         :content-transfer-encoding:in-reply-to:from:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:dkim-signature
         :dkim-filter;
        bh=OHYn4y66qoHR6yvqJ2oT6WKgjVr5WW9hB7peN/MMXWc=;
        b=Lk6qtiQ6zVCACxwzw9LMLr5JgIp3qsX1If5LR4AuTFyLX8MFLAutxqu0HhVfbsD284
         ie72lt/WIX402Z9QrrgLDBOvkf0C0CNam9Spc9hczkAivuzSYNCWcIN1fZOssp8hy94o
         uvoCQWPU7nK2dXuySIbkn2B7jR9vw3j8zv8Eync/arVqE4p7X4kzXZ2XlZPVbHWJV65U
         HBsg+Xt8YlFWTVEFjeRbNBBsFf+h9LVJAMlWFI4uGkb6j4ZmqlXGueQvBQDl6d3Di/4P
         gN6BrR3LAaY93qDYz20vM6d3LxV95Pz7gRvRtiOCnMLyaHaAtTiid2GWkNjFaccrWcfR
         jGHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@samsung.com header.s=mail20170921 header.b=clfOrroz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=samsung.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u13-20020ad45aad000000b0045e7223a123si6141855qvg.51.2022.05.30.05.13.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 May 2022 05:13:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@samsung.com header.s=mail20170921 header.b=clfOrroz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=samsung.com
Received: from localhost ([::1]:47084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nveGh-0001zn-Ge
	for alex.bennee@linaro.org; Mon, 30 May 2022 08:13:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.kotrasinsk@samsung.com>)
 id 1nve6Z-0004Lk-53
 for qemu-arm@nongnu.org; Mon, 30 May 2022 08:02:39 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:42608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.kotrasinsk@samsung.com>)
 id 1nve6S-0007oI-Dn
 for qemu-arm@nongnu.org; Mon, 30 May 2022 08:02:38 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20220530120225euoutp014a6b41d13eecb90329bee5144ac362ba~z4FVXgs5Y1076610766euoutp01v
 for <qemu-arm@nongnu.org>; Mon, 30 May 2022 12:02:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20220530120225euoutp014a6b41d13eecb90329bee5144ac362ba~z4FVXgs5Y1076610766euoutp01v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1653912145;
 bh=OHYn4y66qoHR6yvqJ2oT6WKgjVr5WW9hB7peN/MMXWc=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=clfOrroz3RmnpuUlRhDieeMgHj5s6XyDr7Fs+5LNW3GmJ2uCLFBqpxJhQhPciDfSq
 gFMlHkoU7yuQK6rH0A8eBLuu9uKCygIWcBr9s7ZaJ/mnMeeqisFr0sPsUyioi8AE2V
 Hd25oQwlUeygvoUvZbuUlXrC13oD05tXlmeUQ3jg=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20220530120225eucas1p222cbb108857722a1640807a25560f155~z4FVPmCEV0209302093eucas1p2I;
 Mon, 30 May 2022 12:02:25 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id C0.12.09580.152B4926; Mon, 30
 May 2022 13:02:25 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20220530120224eucas1p2a079fbbf4f0704f830e5691ab226b0a4~z4FU0v9vF0226602266eucas1p28;
 Mon, 30 May 2022 12:02:24 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220530120224eusmtrp26944850818bd61409198eb0df326e4f2~z4FU0FuBX2597625976eusmtrp2J;
 Mon, 30 May 2022 12:02:24 +0000 (GMT)
X-AuditID: cbfec7f5-9adff7000000256c-f5-6294b251146f
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 17.90.09038.052B4926; Mon, 30
 May 2022 13:02:24 +0100 (BST)
Received: from [106.210.134.115] (unknown [106.210.134.115]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20220530120224eusmtip2670eaf417e50a1d67d89fbef1b126f53~z4FUl_-4l0984809848eusmtip2v;
 Mon, 30 May 2022 12:02:24 +0000 (GMT)
Message-ID: <b3d8f8b5-3976-8bb6-41b1-8b557524665a@samsung.com>
Date: Mon, 30 May 2022 14:02:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.1.2
Subject: Re: Help: NVIC, level-triggered interrupts and interrupt pending
Content-Language: pl
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
From: =?UTF-8?Q?Igor_Kotrasi=c5=84ski?= <i.kotrasinsk@samsung.com>
In-Reply-To: <CAFEAcA90R49A6txYhP_vFHoa=XPV+g6XxoZdVXmHcS2EPW__Ew@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrCIsWRmVeSWpSXmKPExsWy7djPc7qBm6YkGey9y24x58wDFosF3QvZ
 HJg87lzbw+bx5NpmpgCmKC6blNSczLLUIn27BK6MDcsfMRecEqroOXyCtYHxN18XIyeHhICJ
 xJypm5i6GLk4hARWMEp0/nrICJIQEvjCKHF9ezlE4jOjxJrPZxlhOjbu/ssOkVjOKLF17neo
 9o+MEounLmIFqeIVsJNY+W4GO4jNIqAqMXvaHEaIuKDEyZlPWEBsUYEkiamT+9hAbGEBT4ml
 j6+D1TALiEjceNQCZosI6Ehcub6ZCSIuLjFx6kmgXg4ONgEniUmrpEDCnAKBEtNen2CBKJGX
 aN46mxnkHgmBhRwSPc0PmCGudpFoPjoZyhaWeHV8CzuELSPxf+d8Jgi7WGLJ2R0sEHaNxPnu
 lVA11hK7jneD7WUW0JRYv0sfIuwoce/6UbCwhACfxI23ghAn8ElM2jadGSLMK9HRJgRRrSYx
 7dceZpilyxofsUxgVJqFFCazkPw+C8kzsxD2LmBkWcUonlpanJueWmycl1quV5yYW1yal66X
 nJ+7iRGYME7/O/51B+OKVx/1DjEycTAeYpTgYFYS4W1InpgkxJuSWFmVWpQfX1Sak1p8iFGa
 g0VJnDc5c0OikEB6YklqdmpqQWoRTJaJg1OqgSklc7LYgkd3XRTVuPbOuFp8R9b64sTF35k4
 5xTn6f6bEXbE4Ae7HeexYPFT6v9OxnGv4unZ1T+12sb05P2gXTGdJim9Eo+Sb0l9kndVVErf
 Iu6t/uxg2CWJu7W1JcLsj+fXMbyUPTjlUyuHVqvV/imSTmbrPyzJ5th6e5VXzG6hF6/4r26J
 cek8Y3Zw0ySNR98uT0t+c2m/u2vRyw3vFpc5fFk+Za3booLJXfOWnZeI/Zq4RMRx17TnGs2u
 NUt4D14WkX9hP3eDUcaBix27+Y4mR9S6H//f8SDP6dBj8U0SqWeCP92cwf+LTTTMe3nZEvGn
 pcePJ/5Y6s9fePpW78bEiRKPlIsv7UnaYGgQVF+vxFKckWioxVxUnAgAcrYsqIcDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeLIzCtJLcpLzFFi42I5/e/4Pd2ATVOSDPbcVbeYc+YBi8WC7oVs
 Dkwed67tYfN4cm0zUwBTlJ5NUX5pSapCRn5xia1StKGFkZ6hpYWekYmlnqGxeayVkamSvp1N
 SmpOZllqkb5dgl7GhuWPmAtOCVX0HD7B2sD4m6+LkZNDQsBEYuPuv+xdjFwcQgJLGSVWnjzO
 DpGQkfhxeg0bhC0s8edaFxtE0XtGiR29i1lBErwCdhIr380Aa2ARUJWYPW0OI0RcUOLkzCcs
 ILaoQJLE8e0QNcICnhJLH18Hq2EWEJG48agFzBYR0JG4cn0zE0RcXGLi1JMsEMuuMkl8//AF
 aBkHB5uAk8SkVVIgNZwCgRLTXp9ggag3k+ja2gU1U16ieets5gmMQrOQnDELybpZSFpmIWlZ
 wMiyilEktbQ4Nz232EivODG3uDQvXS85P3cTIzBOth37uWUH48pXH/UOMTJxMB5ilOBgVhLh
 bUiemCTEm5JYWZValB9fVJqTWnyI0RQYFhOZpUST84GRmlcSb2hmYGpoYmZpYGppZqwkzutZ
 0JEoJJCeWJKanZpakFoE08fEwSnVwDRne4iRVgSX26STCya2FAf/Vj97wdLtcMoVr+maT00/
 7BPPiDw8VXr2o69zreKnqGr8TpDtvKr03FrW9PP0xkaRJAW7njSXndmWj362FAkaaE6+EK9r
 u5aDR+Pw3tylpS2Pvv5YN8e08uoBhVWBy8O+XtV4f7rfd4/Uk4Mxi65M/83aJ7Ruvki1Sewt
 3c2Hdx191/alZvuSp93Xxfsez90T33zsyTamVwtmrN2cqihpc+C/4HvT3qPSTirWDPPFV5xo
 ULSOs2Lb7LfgNmv1UaGQN4+8m2V2/TA37vzfLBgw5fj8H9+0WGSv5YbLTLFWYtB8f9TWTdt7
 D98ZfU+Fb46hM5Ilf24pOrdj+753W32UWIozEg21mIuKEwHoZSYMHAMAAA==
X-CMS-MailID: 20220530120224eucas1p2a079fbbf4f0704f830e5691ab226b0a4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220530093333eucas1p2c05b46a5f9c66704919743236753858f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220530093333eucas1p2c05b46a5f9c66704919743236753858f
References: <CGME20220530093333eucas1p2c05b46a5f9c66704919743236753858f@eucas1p2.samsung.com>
 <e3573c25-1ba6-cb57-f813-99c538a2d254@samsung.com>
 <CAFEAcA8EqCh0LDS=N+5W8fPnF2Fj-Z7r=wssDAD-V5tBWRM85w@mail.gmail.com>
 <5a05e699-d050-adae-ca14-c68b5534f214@samsung.com>
 <CAFEAcA90R49A6txYhP_vFHoa=XPV+g6XxoZdVXmHcS2EPW__Ew@mail.gmail.com>
Received-SPF: pass client-ip=210.118.77.11;
 envelope-from=i.kotrasinsk@samsung.com; helo=mailout1.w1.samsung.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
X-TUID: NmvYaE1O27dn



On 30.05.2022 13:54, Peter Maydell wrote:
> On Mon, 30 May 2022 at 12:34, Igor Kotrasiński <i.kotrasinsk@samsung.com> wrote:
>>
>> On 30.05.2022 12:49, Peter Maydell wrote:
>>> On Mon, 30 May 2022 at 10:33, Igor Kotrasiński <i.kotrasinsk@samsung.com> wrote:
>>>>
>>>> Hi,
>>>>
>>>> I've been hacking on QEMU recently, adding support for a custom Cortex-M
>>>> board. One of the devices that I'm emulating is using level-triggered
>>>> interrupts, for which I assume qemu_irq_raise/lower is the right tool.
>>>> However, I'm having trouble receiving interrupts for my device which I
>>>> *think* are caused by interaction with setting/clearing
>>>> interrupt-pending status.
>>>>
>>>> The way I'm handling my interrupt currently is as follows:
>>>>
>>>> 1. The device raises an interrupt with qemu_irq_raise.
>>>> 2. In interrupt handler, I set the clear-enable nvic register and queue
>>>> a handler.
>>>> 3. In handler, I read data from the device and set a register that
>>>> lowers its interrupt with qemu_irq_lower.
>>>> 4. Then I set the clear-pending nvic register.
>>>> 5. Finally I set the set-enable nvic register.
>>>
>>> You don't say in this sequence where "return from the interrupt
>>> exception handler" happens, which is an important part of the
>>> sequence. (That is, I'm not sure whether your design has only
>>> step 2 in the CPU exception handler with the "queued" handler
>>> being run after exception-return, or whether all of 2-5 are
>>> in the CPU exception handler for the interrupt.)
>>>
>>
>> Sorry, I lied a bit here. I'm running someone else's code and I misread
>> it a bit. The exact sequence here is:
>>
>> 1. The device raises the interrupt.
>> 2. Interrupt handler sets the set-pending register, then the
>> clear-enable register, then returns.
>> 3. A handler running outside exception context reads data from the
>> device and lowers the irq.
>> 3.5. The device raises the irq again.
>> 4. The handler sets the clear-pending register, then the set-enable
>> register.
> 
> Does this code work on real hardware?
> 
> Do you have a test case image you could provide?
> 
> thanks
> -- PMM
> 

The code works on our board which uses a Cortex-M35P, unfortunately I 
don't have a test case image I can share. I'll try to prepare a minimal 
example that runs on mps2-an505 or such.

Igor
