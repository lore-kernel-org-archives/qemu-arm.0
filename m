Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp5097201wrh;
        Tue, 30 Apr 2019 12:27:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzCfSFZxlIX2Db8qTW3bE98zGYjMkdbUcchkdlW5+jlBvhm1pncNmM+Vn7RKzjqI3FB+FIH
X-Received: by 2002:adf:e288:: with SMTP id v8mr10114181wri.7.1556652434954;
        Tue, 30 Apr 2019 12:27:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556652434; cv=none;
        d=google.com; s=arc-20160816;
        b=k4OOUpyteLFwOSbEWmVlU4iN7S3rvZasP9zg7/jI4nzfflO0LwvB6cC2QFyAJIyBR2
         +djoEfyGwhPVUUfdBml90g1GJnIZYVFoxzJnQHxEmieYy9s4zkfOvAWb0ji55RNBrEKj
         9QB0pWKRiz7hXQYg3/grYzaoj0uItrY0OBdSZT8czVGP5enLUVq3DECoqwYCzS7hIb2W
         VgiBsJRDXaLKDOfDp/jfVn/UtRsPqCq7ur/bETYjNy4i6G2FUPhdw8arSuqcA5lqM4Nj
         YjghLawk+NbMcEjmFlFtMPhFiN7Pp5ZdT2o/7Lms4rbnMst79bNGT/kgNjjDNdoJh5hL
         MdUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=2RDFs8S85oa4FrDYgpGFvUVS8sKHDV8ZSoNqkO72bts=;
        b=0nKtxknV9aXUD0vWlsSgAxUJu4pGbCTnMs5SLvSMaRsqbXNL5k3i3clD7MEfdH4caF
         p/5OfPcbuo8pTSt8OhmGosUAUpGUzcfNRjpIhx8zcOMVbK2DJiiw2y6JKExTHchUGX1X
         DX/pKSm2Mfml0Nah0PXNok/cyy92AwJ3hFWM8lKajiC6+7FQNdSUyyWiAc9TNoyP+i4b
         qAVcjyIn2Mxe2E5oF+qSFKAmJINWM6TbhCsiz4lLrLFzrVD6JxtB0saQR17M5sAtG16R
         vvQ+VFQF2wXI+T1EK0XWWcv+AfzbV5UIqbSyW5n04G/+ZPQTOZCbTfFpZUhoHWUGxlSX
         YxPg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b74si2097402wmd.29.2019.04.30.12.27.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Apr 2019 12:27:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:52193 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hLYPJ-0005XL-Dt
	for alex.bennee@linaro.org; Tue, 30 Apr 2019 15:27:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40973)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hLYNG-0003W9-38
	for qemu-arm@nongnu.org; Tue, 30 Apr 2019 15:25:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hLYAl-0004d9-GX
	for qemu-arm@nongnu.org; Tue, 30 Apr 2019 15:12:12 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:54346)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hLYAl-0004cb-At
	for qemu-arm@nongnu.org; Tue, 30 Apr 2019 15:12:11 -0400
Received: by mail-wm1-f67.google.com with SMTP id b10so5016080wmj.4
	for <qemu-arm@nongnu.org>; Tue, 30 Apr 2019 12:12:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=2RDFs8S85oa4FrDYgpGFvUVS8sKHDV8ZSoNqkO72bts=;
	b=rNqm+SrkuW8RTJAecrE05Va6a0603kN5cuKbMI7OFlyq5WLIqKf0oEj6i5bcdBM11S
	//HVGIK3AIWJY0m6ppzq08sO9om75W9WOtA0Zgv6WXFkqLXzwxB6CYEpIHNNhgtYxpu2
	ej6GtscrVM+JzIxnJUNtbjjEbrewti0QTEnVFOl8WeZVRjOQ7bQMFQwJGoN0T8pIySs2
	TaRocNctJbsnobd4JjzuvLW+FxLnzR1rFnhKCm2qr3N6cETOp+vtgz2ENYHRm1GLRKnB
	R+FfyuRbdBRqtWpYm2LSImeo0lwJiQiZ15J/FNu4kJ7THKZnJO/BYjj8hEy+BVqNH/1U
	8AKA==
X-Gm-Message-State: APjAAAWRpqW6tFuyvwC3VS7hW8gamikh3Jl+q9LoO3yE+ME3wXAJP0Va
	TCyu92zr+jngIkUPc5jw43SZasQcQ2c=
X-Received: by 2002:a1c:44d7:: with SMTP id r206mr3996708wma.129.1556651529913;
	Tue, 30 Apr 2019 12:12:09 -0700 (PDT)
Received: from [192.168.1.33] (193.red-88-21-103.staticip.rima-tde.net.
	[88.21.103.193]) by smtp.gmail.com with ESMTPSA id
	u17sm4256862wmu.36.2019.04.30.12.12.09
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Apr 2019 12:12:09 -0700 (PDT)
To: Cao Jiaxi <driver1998@foxmail.com>, qemu-devel@nongnu.org,
	qemu-arm <qemu-arm@nongnu.org>
References: <20190430181326.1314-1-driver1998@foxmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <c794f5a4-470a-3f49-c5df-bd37d97d711a@redhat.com>
Date: Tue, 30 Apr 2019 21:12:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190430181326.1314-1-driver1998@foxmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 3/4] util/cacheinfo.c: Use
 uintptr_t instead of unsigned long in AArch64 arch_cache_info()
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vChwkU6Jjl9e

On 4/30/19 8:13 PM, Cao Jiaxi wrote:
> Windows ARM64 uses LLP64 model, which breaks current assumptions.
> 
> Signed-off-by: Cao Jiaxi <driver1998@foxmail.com>
> ---
>  util/cacheinfo.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/util/cacheinfo.c b/util/cacheinfo.c
> index 3cd080b83d..ce6f0dbf6a 100644
> --- a/util/cacheinfo.c
> +++ b/util/cacheinfo.c
> @@ -107,7 +107,7 @@ static void sys_cache_info(int *isize, int *dsize)
>  static void arch_cache_info(int *isize, int *dsize)
>  {
>      if (*isize == 0 || *dsize == 0) {
> -        unsigned long ctr;
> +        uintptr_t ctr;
>  
>          /* The real cache geometry is in CCSIDR_EL1/CLIDR_EL1/CSSELR_EL1,
>             but (at least under Linux) these are marked protected by the
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
