Received: by 10.28.153.193 with SMTP id b184csp24869wme;
        Thu, 18 Jan 2018 13:14:43 -0800 (PST)
X-Google-Smtp-Source: ACJfBosB5dVBxJw3wFbT6NzG3afFoxenPZbPkNQJDWlTcLU+cOIJCAOWb5Rb+dc0Z/nCvNGbTTkC
X-Received: by 10.129.69.24 with SMTP id s24mr6575965ywa.367.1516310083267;
        Thu, 18 Jan 2018 13:14:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516310083; cv=none;
        d=google.com; s=arc-20160816;
        b=rkkq7B7CeDGtawtchG1eWWjhVSCAW9Yl20HIsog0JbGtTDREK6C2nOtVXV3IUb8y0G
         pAooTx/k+rR290Dy6zkqERm8oqPjNHAY1bz4hmZRFG2rQZ7tGjSbRrAuprxJjjWIVDaa
         DdfyIGPRZecC0kAvIkj6rfSxBKvasdkMtMlrftXmag/Ry4kFxb3WzcU9+D6VtIOGZyBl
         i35QgLFNwod3jE7yYzwiCDlG4HjL5A6AhHpEMAWW2a7IEDvghjSp5WvT8g1KQdy0n4Mm
         FHwkBhQY1tESRJ8EQbU6LUYHe1b054y+l4Y46dHj39wb31QNuC+JHeuaIzbuutQ+S8yZ
         n1Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=/vm2L5C4outE+fKHHmB99G95oy4JFLXHD2Iz3D0Nmjw=;
        b=k3vsbIYCpCexbhOSPTJULeP+oi4jTjWwphmujtTY4JFwRRa6lnK4vUpD3nEr+2G3Eh
         nyeBJk9AqjgZd2luTlR0mz6mG1h/q5pCkVrHXEXQ+O1TUJvWllXaBHmOTQJ3ANulVoKq
         n+GJ1DMmfpxHHzhHXgtA6AErwbBGtyTzK4kA5Qnp81bKSswqIzQPjB+uqNFe9bdGDcwg
         zJd7naAy4IXIKJedAa7EBalOOS4l6HkJ+WLiKVYB+ytrAIfoyOTvKNE9nPSjLVfXZZ4g
         HhrN789m9qkmoVWcHFybAUfal5pTbmOO1MC9SmD19Ok6PWny/IQHTWHentfKw8eHN5oi
         +ACA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fiF0GGIG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s189si1940227ywc.720.2018.01.18.13.14.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Jan 2018 13:14:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fiF0GGIG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54840 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ecHWE-0005aB-K3
	for alex.bennee@linaro.org; Thu, 18 Jan 2018 16:14:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54468)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ecHT3-0002UG-QE
	for qemu-arm@nongnu.org; Thu, 18 Jan 2018 16:11:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ecHSz-0005SO-Pn
	for qemu-arm@nongnu.org; Thu, 18 Jan 2018 16:11:25 -0500
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:42737)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ecHSz-0005Ry-LI; Thu, 18 Jan 2018 16:11:21 -0500
Received: by mail-qt0-x241.google.com with SMTP id c2so33819647qtn.9;
	Thu, 18 Jan 2018 13:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=/vm2L5C4outE+fKHHmB99G95oy4JFLXHD2Iz3D0Nmjw=;
	b=fiF0GGIGb30iMupStaKrUCQbf63JlFDgBQjQ+tG7IaLKZ+VD6w9paEZk8z6WB+XTkw
	phdV1eyJ25ttrLcP0Stp2MK3xpnD5xJBJ4hqPSR1Zw8fG3FWEqpeDMwKeE1VA7beR7lJ
	UG8CBpH8pFIugmOES9lTCWQYdJzhdpT+w108IgM3iZJ7OpspxRKmBDy+WA6wB9meOV8W
	MvkM8Q3ELP6/Y0FmQoj9ZsOlkMVOLLLJlpx+ZdUTlgz7AeUBqUv3ecBAs54BXrWwpPGC
	xnXjlAHD2qXr/lHR0PXXfxQatWuNqhzdtByINFeN6eKjTBRRuU9RcwWGycCVavRExvm+
	Nk5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=/vm2L5C4outE+fKHHmB99G95oy4JFLXHD2Iz3D0Nmjw=;
	b=r2QL6892Ijzj34upBOhUdJPCVqe/yrC+BvN8xpzMFs5yAngnloZddq+z2bMYTf+y0z
	R2Hn4JKyNsefFfzHyUIufZgRu5pdx/f0x7s+UZ9igHocGNXqsJZ5S1AAvgcoP7De++or
	tVeeXXTFnc1Jz+a7hj/aI2/GkMt/R8oVDzTUacz/0sTAfjx5NnNAnedFkKmKSgH/lUpC
	/8MN2sevG1XmaDffTejeeOxvcpM0V81kWdac8snJjurpBKBiu/j7ZZMiZtj/SSs7f723
	6he/VDuevUAQv8KyInbo1alTxRUX5NejVRQ+2ZeXflquqVRurPd97K+NAgAz24IGwP3G
	MHxA==
X-Gm-Message-State: AKwxytfDRKzfxp7ZKeEtkc1d5XCeeen8z4sw9Av8DdhwxdaW9FuQjbA0
	tx6N1Ef/7N9TPfS+/bK95NKGyMdg
X-Received: by 10.55.136.129 with SMTP id k123mr46172325qkd.196.1516309881014; 
	Thu, 18 Jan 2018 13:11:21 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id
	g64sm4010784qtd.17.2018.01.18.13.11.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Jan 2018 13:11:20 -0800 (PST)
To: Alistair Francis <alistair.francis@xilinx.com>, qemu-devel@nongnu.org,
	edgar.iglesias@xilinx.com, edgar.iglesias@gmail.com
References: <cover.1516300623.git.alistair.francis@xilinx.com>
	<3ddf66fa53e18ba941908bdba5e056e67ccf854b.1516300623.git.alistair.francis@xilinx.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <77046075-c43f-17b7-40cb-6ecc28d0b9c3@amsat.org>
Date: Thu, 18 Jan 2018 18:11:17 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <3ddf66fa53e18ba941908bdba5e056e67ccf854b.1516300623.git.alistair.francis@xilinx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 1/9] microblaze: boot.c:
 Don't try to find NULL pointer
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
Cc: alistair23@gmail.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EBYoBGKC7N/t

On 01/18/2018 03:37 PM, Alistair Francis wrote:
> Previously if no device tree was passed to microblaze_load_kernel() then
> qemu_find_file() would try to find a NULL pointer. To avoid this put a
> check around qemu_find_file().
> 
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
> 
>  hw/microblaze/boot.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/microblaze/boot.c b/hw/microblaze/boot.c
> index 457a08a2fe..35bfeda7aa 100644
> --- a/hw/microblaze/boot.c
> +++ b/hw/microblaze/boot.c
> @@ -124,7 +124,7 @@ void microblaze_load_kernel(MicroBlazeCPU *cpu, hwaddr ddr_base,
>      kernel_cmdline = qemu_opt_get(machine_opts, "append");
>      dtb_arg = qemu_opt_get(machine_opts, "dtb");
>      /* default to pcbios dtb as passed by machine_init */
> -    if (!dtb_arg) {
> +    if (!dtb_arg && dtb_filename) {
>          filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, dtb_filename);
>      }
>  
> 
