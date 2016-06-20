Received: by 10.25.21.96 with SMTP id l93csp1595736lfi;
        Mon, 20 Jun 2016 12:16:31 -0700 (PDT)
X-Received: by 10.55.94.135 with SMTP id s129mr15001483qkb.70.1466450191294;
        Mon, 20 Jun 2016 12:16:31 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id n61si20718139qtd.25.2016.06.20.12.16.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Jun 2016 12:16:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45849 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bF4gQ-0001B8-Nw
	for alex.bennee@linaro.org; Mon, 20 Jun 2016 15:16:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53645)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bF4g7-0000p8-LN
	for qemu-arm@nongnu.org; Mon, 20 Jun 2016 15:16:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bF4g3-0007GU-DM
	for qemu-arm@nongnu.org; Mon, 20 Jun 2016 15:16:11 -0400
Received: from mail-qk0-x22c.google.com ([2607:f8b0:400d:c09::22c]:33841)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1bF4g3-0007GO-9A; Mon, 20 Jun 2016 15:16:07 -0400
Received: by mail-qk0-x22c.google.com with SMTP id t127so53840322qkf.1;
	Mon, 20 Jun 2016 12:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=1VQhrx1W9Ap8YzgJ9MwPOIvpTVC+ayzj0pTmfYp0t7Y=;
	b=Qapp1iM17/KSdXiULzzM/H6/3Pm+E3xa8h8103coQbSvjKvUAeXdqNnS6Dr+j3sPxB
	Cglc8lncr5jN7IhPOhMAotI+xCBHQ7OKo5K6t/oeejWuZ15Z1oDrIB34HBfFiBYvpDf8
	AthdreR4+l+JCMOJR6A/A0pSTv1CA22NC81Z5wQok9sFEiJlViUYzAk7Imhbf7FDn+rY
	sNFoxJcAXAotQxseVb9FQ5VW5TbOIbrJ3eFPqXfh/Tmb9Ttdk6tIPVaRG8m0LYMvENeg
	k+t7+gzUw53sVu4HHjwhiRvr1VPOMnxNVU4w6gdhHYX0BZ8M5mf39lOWRIjIyZKJ4iRz
	ft2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=1VQhrx1W9Ap8YzgJ9MwPOIvpTVC+ayzj0pTmfYp0t7Y=;
	b=cycJQPdY1VDJqIWyOHoW4dSUDM1m7MzAUh0Hch6Rmv/GKf71/ggzB1SpMsQ5WO2DNB
	F1BkuvfMuLo6TFq6wR/fZ6pjZ5ndiJq2frFWp0zWUy3JRCY4BjjvTTbp6hxAJHfWbmdo
	uVkkIBamtHkNleY/Cn2paKW9mjm9h/l/6gIZ9kvVnxRKqAC9CvnLzREDCcvFvyoIjiCI
	jnOcTieaejbPUgeWXPBs4zYhtTiPexiXaDLB30RcA7HhjvmlqmiotMDgd96OuPoCQcOR
	8f0T/JMhcrHaIPhIfFaBEn+CBDZn0njxgvwUZ2B8008uFSOUQcijFKB7EeUHeSikIE+O
	vflA==
X-Gm-Message-State: ALyK8tL+14nzikfPypyRL+Yn3FVtzTiggamkHOdR+k90MXwSlxssOJw8/hXt39gR6EMgCg==
X-Received: by 10.55.59.196 with SMTP id i187mr480287qka.167.1466450166700;
	Mon, 20 Jun 2016 12:16:06 -0700 (PDT)
Received: from bigtime.twiddle.net (71-37-54-227.tukw.qwest.net.
	[71.37.54.227]) by smtp.googlemail.com with ESMTPSA id
	j62sm8404043qtb.35.2016.06.20.12.16.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Jun 2016 12:16:06 -0700 (PDT)
To: Sergey Sorokin <afarallax@yandex.ru>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <1466431017-123868-1-git-send-email-afarallax@yandex.ru>
	<ace0b2e6-613b-cc8e-aa05-f583ed43857b@twiddle.net>
	<44881466444025@web26m.yandex.ru>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <6ef866a2-ba0c-4814-a2b8-fedd28be5599@twiddle.net>
Date: Mon, 20 Jun 2016 12:16:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <44881466444025@web26m.yandex.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::22c
Subject: Re: [Qemu-arm] [PATCH] Improve the alignment check infrastructure
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
	"Vassili Karpov \(malc\)" <av1474@comtv.ru>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /AxhqaFwwIVH

On 06/20/2016 10:33 AM, Sergey Sorokin wrote:
>> I'm thinking of the AVR target currently under review which requires
>> TARGET_PAGE_BITS == 8 in order to support the memory device layout.
>>
> What is maximum alignment size for AVR? I think it's possible to implement some
> checks for this maximum.

It's an 8-bit microcontroler -- maximum alignment is 1.  ;-)


r~
