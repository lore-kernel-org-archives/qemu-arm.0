Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp361775wru;
        Tue, 31 Jul 2018 22:53:51 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpf1pkPqmeXhYYaJWFLjyfUMTT6rE9tKSBVSndunI1KQhOpbZ82GwuaLcfllKPYWjBTNM5hh
X-Received: by 2002:a37:a4d:: with SMTP id 74-v6mr23773677qkk.148.1533102831031;
        Tue, 31 Jul 2018 22:53:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533102831; cv=none;
        d=google.com; s=arc-20160816;
        b=HhAu/l5Rt9mz4hedYDXGuoxJXxvUBgzKZPH4Y34IyqDjLOtd9icrlVHe+GsRveExrf
         +NKott96mvZnfzHS3v0SHU6KXH1kiyDc+hAhrBT6hebZSfJzUnL5IDcKKN9RbUQCiPhz
         nUN5AiVZKkwo6qFZacZ8zzx3C9Sr9aDdDGz/BAl8S+2Aqyph6Z5qXUMxLuqn6wCS2Scp
         33qJBCEV5qCtrzJZch23u9LMLXyWF51piv5MFulBYH1Ia1c3uvH5TedAS0akZ2jhKH4S
         aDItgKoHV4PgqC7J2PAWiLuH2gu/9CeCMqhmXmI0WlAIM6XuADPUeScN7tRWDRO9Y+qR
         6GOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Jokt3wbNhW4HgguFnPhT/jr98L3qUBwA4/HiLkwJfHc=;
        b=UVIh/WmsqlNsYte6wrFYxn+670XN+eBSrIauhCRX8uDOA/6xxIyvMnzYw/InMeKi9E
         G9kX9TIS9PBx77ObnBBa/OKkSJRJjBHMD4XIX1oBvW5nlakP4tUNO8PKKnZdRtY9lliI
         kqYuzqOjTg06+qZObZvaSDSpSe3ytIeOae2KYDlZMh9W8sqf5MY6P9VAURT4IJtBtse7
         ZsuWeETuR8QgXbE6V7IGKQZJFo2Eb8lfDr266A1d2dKlpJ0t8j/O73YWipix2nHosAOz
         0oAg37AFpvKsYrtpyyB5e/AdcFT2o4sGG0f4+ueVKnPfEPmAVd5fEHUkjcX8oAOX5VUa
         7+Zg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TJ9NU63E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k7-v6si6393366qtb.53.2018.07.31.22.53.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 31 Jul 2018 22:53:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TJ9NU63E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:33619 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fkk50-00080B-Il
	for alex.bennee@linaro.org; Wed, 01 Aug 2018 01:53:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54915)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1fkk4n-0007zC-MZ
	for qemu-arm@nongnu.org; Wed, 01 Aug 2018 01:53:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1fkk4m-0002Xy-MW
	for qemu-arm@nongnu.org; Wed, 01 Aug 2018 01:53:37 -0400
Received: from mail-qt0-x235.google.com ([2607:f8b0:400d:c0d::235]:41813)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent.desnogues@gmail.com>)
	id 1fkk4j-0002X6-6T; Wed, 01 Aug 2018 01:53:33 -0400
Received: by mail-qt0-x235.google.com with SMTP id e19-v6so18653356qtp.8;
	Tue, 31 Jul 2018 22:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Jokt3wbNhW4HgguFnPhT/jr98L3qUBwA4/HiLkwJfHc=;
	b=TJ9NU63EEXY3rywpBmoZx0XbrP/IBYjBLrRQnHcFcArZTB+lIYAfKDvX03QtHSC27D
	EdIMxQ0NmyTs31gnaMPWvz2BTMeOwR+5TJbKHunESfUiSk9PlSX2PWCNbrBbUd/tEkbf
	BU/JBaI6RbGnH2mVLTGV0lx+Vq/rcY5fUjisR576VQWP1aGnRZsdylHmnUL2LvghRL8Q
	NaBYbvcO+QEbd5biU2vLsyGeDl2A05HrZbvGG0SOkZWJs8IFeEGWyWETK/9oF1OKoaAp
	wSvIasje1frYaGH1fasQw4gjHemfUV1Tzupqm0GRlPN54jrlTEutJSJNM6N4O+ji9sNL
	vtnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Jokt3wbNhW4HgguFnPhT/jr98L3qUBwA4/HiLkwJfHc=;
	b=PCrqimAf8CczAT7pyrPHNUdd5BENXO/13tggmi6L31VeukmnIJ+JWGex2+mLk5zWiu
	N/GzQAuL98cdvq69umJEYREFdkv9dgyzs49p2WxQm32KkQvqrC5DjB9+d5baryMcnUPS
	vdPovhFp8xI/0WrUEEgT+uItr6tlMPThONJLozGkY1EN8xcbCdlxlEcy64wPPQFsxsSg
	gdo4A7nkLuz974z1L6ECuREwpKCV+fhchPEtxvJdyPyV/BQwuJjdyRnJ8KzRY4tLYvw+
	DCm/JqOvAgDQXsyKvGKCtjpvdnx011Qhb++2m+wFtUaonCOv1theXHpnNGweAyAfWvxF
	2OJA==
X-Gm-Message-State: AOUpUlEGVm99x9wBBUQCl/rwh5yQ5dsSuMT7vH9HUu8V+mZpkgwa2qrA
	6TKD5ZDvaB/AyyJ21BzGS7AxTHcnb/Q+H6uY8MQ=
X-Received: by 2002:ac8:6790:: with SMTP id
	b16-v6mr24725459qtp.66.1533102811885; 
	Tue, 31 Jul 2018 22:53:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac8:12c6:0:0:0:0:0 with HTTP; Tue, 31 Jul 2018 22:53:31
	-0700 (PDT)
In-Reply-To: <b29881c1-ae9f-d6c1-9dbf-eec3051d65a7@linaro.org>
References: <CABoDooME+KJVWJQcodVC-Mo2qpZhmYA3LVBLQcTj88qW1i5h5g@mail.gmail.com>
	<b29881c1-ae9f-d6c1-9dbf-eec3051d65a7@linaro.org>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Wed, 1 Aug 2018 07:53:31 +0200
Message-ID: <CABoDooOQN7_5Qa3Mz__GywTHj2eSG6965h5renG_4xk2ORZkQg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::235
Subject: Re: [Qemu-arm] ARM: SVE while issue
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eKhbVmFxVoXz

Hello,

On Tue, Jul 31, 2018 at 6:36 PM, Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 07/31/2018 09:52 AM, Laurent Desnogues wrote:
>> Hello Richard,
>>
>> according to SVE specification, whilels/whilele instructions have a
>> special case where if the second operand is the maximum (un)signed
>> integer then the result is an all-true predicate.  The current code in
>> trans_WHILE doesn't seem to capture that requirement.  I'm afraid the
>> fix won't be as trivial as for the other two bugs I reported :-)
>
> Still not too bad.
> Testing a fix for my branch now.

I gave it a look and tested it, it works fine!

Thanks,

Laurent

> Annoying that risu didn't randomly generate this case,
> and I totally mis-read the documentation for this.
>
>
> r~
>
