Received: by 10.25.21.96 with SMTP id l93csp603923lfi;
        Thu, 23 Jun 2016 09:13:14 -0700 (PDT)
X-Received: by 10.200.54.142 with SMTP id a14mr44604616qtc.100.1466698394281;
        Thu, 23 Jun 2016 09:13:14 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p66si123138qkl.167.2016.06.23.09.13.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Jun 2016 09:13:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37834 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bG7Fh-0007ll-HW
	for alex.bennee@linaro.org; Thu, 23 Jun 2016 12:13:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37570)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bG7Fb-0007hr-Ia
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 12:13:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bG7FX-0004j6-Im
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 12:13:07 -0400
Received: from mail-qk0-x22f.google.com ([2607:f8b0:400d:c09::22f]:33763)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1bG7FX-0004j2-DG; Thu, 23 Jun 2016 12:13:03 -0400
Received: by mail-qk0-x22f.google.com with SMTP id a186so112924463qkf.0;
	Thu, 23 Jun 2016 09:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=By2AhiT0q8ZNuApmlblhSDHat2rurJ8E04xf776n1Zc=;
	b=MJMXk9ZarcuJO1bvACGBt/roLvCBO9Q/ot7rrKLrJ794kW3UggF9AXSI0vcuVqKKXl
	wcFruDnOGSLatqNYTSieIumD0sda5EdWuSwy147pGSkrzYxnrxr+4UbepChNFwDgYv1F
	xUhGl98VuaQIugK2r9QCXOPO33CgcuQDJ0rOs/MWaoiZ7v5ZOy9aJm4KuMrC2JFmPIkE
	K5DssWaHgcesIbWR+EGSo5+2xoK0ysV8q7hxyvIXlmgxSUnj7bxBlLlsenY4bDy9pqjf
	KgntB/o6/lnRaOqvWMrfjnFZunFoWu9QlXaMLZbW8w1+wLzZO/pWoGNJbl6PWZBCDEsP
	JPPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=By2AhiT0q8ZNuApmlblhSDHat2rurJ8E04xf776n1Zc=;
	b=jfjpRFoMrppXFvSAM16L/MQT0+wQOkaa3iqP6U0Bj3ju3eRgmky0pc8FlFeBfQXn/3
	VxlLAx8bEXgaFh5SgYDWigiACxVgZcE5sHqfXcZK6DVh4vk+h9EttFlcgmaJ7fpisO2z
	o45FOSve2EWCTOKZlvUk5OfQP8J7VQqVbxXETwoziuT6IJD5b/7rvgOKm75KmBdCX6Gw
	Ao1qzBiYWeAqjIJLB+DScuoXR6MUumOEjLh0yF6jRdPp/OfR1BUDQD5WxKPDEtbFZNC5
	yG0QS0IzpCkrV/CSfoSGRj+12lF9GJ9Ty94uFmdQrORDOD33PuHuKE/RvpEoB6fctkz5
	wp0Q==
X-Gm-Message-State: ALyK8tL3bxPLvSBFFdvomgv1i0yvcY0Y5aruCZAxJAr55HlJGDhaNtPtmcvFsFDpNVc6Dw==
X-Received: by 10.55.25.155 with SMTP id 27mr47086757qkz.61.1466698383082;
	Thu, 23 Jun 2016 09:13:03 -0700 (PDT)
Received: from bigtime.twiddle.net (71-37-54-227.tukw.qwest.net.
	[71.37.54.227]) by smtp.googlemail.com with ESMTPSA id
	g25sm352807qte.1.2016.06.23.09.13.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Jun 2016 09:13:02 -0700 (PDT)
To: Sergey Sorokin <afarallax@yandex.ru>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <1466599029-3388432-1-git-send-email-afarallax@yandex.ru>
	<5d86b8ba-16e8-e94d-ba7f-e865cbcc938e@twiddle.net>
	<1793281466613020@web5h.yandex.ru>
	<6c24c820-4a26-848c-e62d-88ebce59125d@twiddle.net>
	<201241466676212@web21j.yandex.ru>
	<458f40bb-cb58-4e10-2237-a08cb35155bd@twiddle.net>
	<200981466691221@web14m.yandex.ru>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <d021833e-312d-5dad-1a77-5800fadb733a@twiddle.net>
Date: Thu, 23 Jun 2016 09:12:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <200981466691221@web14m.yandex.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::22f
Subject: Re: [Qemu-arm] [PATCH v2] Improve the alignment check infrastructure
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
Cc: Claudio Fontana <claudio.fontana@huawei.com>,
	Alexander Graf <agraf@suse.de>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Vassili Karpov <av1474@comtv.ru>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ibAKfMYNYj4C

On 06/23/2016 07:13 AM, Sergey Sorokin wrote:
>>
>> I think we ought to check this in tcg-op.c, rather than wait until generating
>> code in the backend.
>>
> I think it's better to check this in one place in get_alignment_bits() function
> because there can be a direct call of helpers from softmmu_template.h.
>

I'm talking about the asserts in tcg/*/tcg-target.inc.c.  Those asserts are 
better done in once place in tcg_canonicalize_memop.


r~
