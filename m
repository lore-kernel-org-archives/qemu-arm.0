Received: by 10.25.0.6 with SMTP id 6csp384739lfa;
        Fri, 12 May 2017 12:05:21 -0700 (PDT)
X-Received: by 10.200.49.75 with SMTP id h11mr5282058qtb.13.1494615921681;
        Fri, 12 May 2017 12:05:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494615921; cv=none;
        d=google.com; s=arc-20160816;
        b=NGoymO1t2DL/74Dh+eghEJH/g7/inXZWHEXB/2hedj9/17SUwW6VYkunLKncjopVnP
         cce1aQWfk/99O97dShMJRhlbi5bW1Vxym9nhdYc6yYFkDuKej0MQG6vCwoJAK7KdMtzW
         cPcXb4iPwobISV7zgoFDarpmba4F9O1epWP0xksBdzS7VZ3EvoqpZazZk9faRq1401N1
         /q8jOydbaifnp1ABjr3PRPlybDCPkoTvW5bJtRGr9cwCa3AanDbqWPdcG0xJ06azLMqp
         7ytjg1pLbUKsocwXw3JT7JHVs2x6fhVyg7Hj6lQjMGr+Yj2wvoV7cwnV3FUTzSfzZ744
         uI9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=tqXUO9ewVKx4G7KeuGY5zgqVU7F5mFYiGABz3vleUp0=;
        b=Z1vu2Vf0aWWyejBHheuMP2pg4NkPwwvnBeOg+0wFzRE69q05yW1R1J/pTrU9lO9CRq
         LqNWoy5Aocrg3NFZvKNZljjjBoi+zZZj79McWbsjNIILkOtgqGlSdBuMcXkU1egg/eOv
         3A50b1Xscx2M7xjY7On/v/fUDnXv8wG1NDqH4Gtj9v9JOZsshrbZ5AXcFQ9TQQLAfqdZ
         AYZ4vuNT5yrjV7nF/mo46fQ4r1Kh3Rqnc8tR4nJz4va1hRAI7FDUb9QCFkDQi0NzyHw1
         VhhKfTJJZPTigzyqVYzLbBhXuSeKVmEZ0odxdXsOK1HakYPqylccFc+eDh2ISKVUqdWr
         LGAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 10si4360619qks.322.2017.05.12.12.05.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 May 2017 12:05:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54978 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d9FsN-0007IE-1e
	for alex.bennee@linaro.org; Fri, 12 May 2017 15:05:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35178)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1d9FsA-0007DC-MW
	for qemu-arm@nongnu.org; Fri, 12 May 2017 15:05:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1d9Fs9-00052c-W1
	for qemu-arm@nongnu.org; Fri, 12 May 2017 15:05:06 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:34853)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1d9Fs9-000520-Rc; Fri, 12 May 2017 15:05:05 -0400
Received: by mail-qk0-x244.google.com with SMTP id k74so9020741qke.2;
	Fri, 12 May 2017 12:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=tqXUO9ewVKx4G7KeuGY5zgqVU7F5mFYiGABz3vleUp0=;
	b=TXSK6F/YsKpYRSuFztoBzcpAIQd+ITreoBc1sZBAaCTr1MjjZR8cx9IcxkKslgHSd9
	pBDCiN0G0rc9LBKkCgriiJP4tfZFuc+eIiUDoH49y6Jzp9jm0FZAUReHyACDoEnk1XiM
	vs5TUgpxGQP79qn+EUfmh4EXnXux60ky5V47Y6B5g7Mf6Z1mxT4I3e3v2xtJAa+TQVTV
	PKoVwaeNqjNkRE8b27msbCScHGIFg0LBjbyf9bccuZNPt+sh7dZoINY6X2eW9HW7tfIp
	6pykYYVJh27GwU9r8VDcHP6x4hektXhs4fYbRPwdK6ELokDNOldBptcxOK6tmEVS8hMQ
	M/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=tqXUO9ewVKx4G7KeuGY5zgqVU7F5mFYiGABz3vleUp0=;
	b=WEY5Yee4DNMr8L2QZQ40tT8ZrQtV+yn4VqQhg91ZFN1Y1dl9x1K3D0pi74O6zpHUIh
	FOnWWMTznM73LAfLynSLLARLbTpogwkiDNszSyQxH/7wRytpcRqqRS9cLblgaqksZL+p
	pvzQjkQQUez/COQK23QXurgBOimbvkzVTtOfn15vrQN+tYUQSy6zEq/ZRsMuFIX9vWjr
	rhLlwKYLH7jcHV9r4ascrwQ4cqdJszCpsnb54M7imyo1BfmV0D8QY3THutMcdnSiqI5k
	6hw74D+ZuXjGpgirtGaVxFzU0nyREqrfopT6KZRDnSx+/dAaknkb8g1n8ux3QElYVzGb
	1/Yw==
X-Gm-Message-State: AODbwcAfEygXDqNumpY/EWmaLPXlDgL1WFv9YUomKILcOH4A0TpTnK6X
	zJPZYILNuVAyfw==
X-Received: by 10.55.3.10 with SMTP id 10mr5537804qkd.65.1494615904803;
	Fri, 12 May 2017 12:05:04 -0700 (PDT)
Received: from bigtime.twiddle.net ([2602:47:d954:1500:5e51:4fff:fe40:9c64])
	by smtp.googlemail.com with ESMTPSA id
	b77sm2821326qkj.47.2017.05.12.12.05.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 May 2017 12:05:03 -0700 (PDT)
To: Aurelien Jarno <aurelien@aurel32.net>
References: <20170512033543.6789-1-f4bug@amsat.org>
	<20170512033543.6789-3-f4bug@amsat.org>
	<f447c23f-f63c-f3bb-a1b9-f63e5aff4063@twiddle.net>
	<20170512182132.jdw4g2pd5gvf2dti@aurel32.net>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <aaa04be5-78d6-311b-609b-d02f18e9ef96@twiddle.net>
Date: Fri, 12 May 2017 12:05:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <20170512182132.jdw4g2pd5gvf2dti@aurel32.net>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: Re: [Qemu-arm] [PATCH v3 2/5] target/arm: optimize rev16() using
 extract op
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: L7uiiF+LkPPa

On 05/12/2017 11:21 AM, Aurelien Jarno wrote:
> +    uint64_t mask1 = sf ? 0x00ff00ff00ff00ffull : 0x00ff00ff;
> +    uint64_t mask2 = sf ? 0xff00ff00ff00ff00ull : 0xff00ff00;
> +
> +    tcg_gen_shri_i64(tcg_tmp, tcg_rn, 8);
> +    tcg_gen_andi_i64(tcg_tmp, tcg_tmp, mask1);
> +    tcg_gen_shli_i64(tcg_rd, tcg_rn, 8);
> +    tcg_gen_andi_i64(tcg_rd, tcg_rd, mask2);

It would probably be better to use a single mask, since they're not free to 
instantiate in a register.  So e.g.

   TCGv mask = tcg_const_i64(sf ? 0x00ff00ff00ff00ffull : 0x00ff00ff);
   tcg_gen_shri_i64(tcg_tmp, tcg_rn, 8);
   tcg_gen_and_i64(tcg_rd, tcg_rn, mask);
   tcg_gen_and_i64(tcg_tmp, tcg_tmp, mask);
   tcg_gen_shli_i64(tcg_rd, tcg_rd, 8);


r~
