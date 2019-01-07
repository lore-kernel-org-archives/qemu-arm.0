Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3183393wrt;
        Sun, 6 Jan 2019 23:55:08 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6KJcUCa7fUVyrz404RD3SeV1xivD7d/RZOEAaoa3lYXeSU4891dQ0kFTnUDn9vG9BBRsIj
X-Received: by 2002:adf:e54a:: with SMTP id z10mr48865086wrm.238.1546847708316;
        Sun, 06 Jan 2019 23:55:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546847708; cv=none;
        d=google.com; s=arc-20160816;
        b=HpxoOtlxq39qx1ZwxwgiodemA9horvozGFaDaXs6ehlxLHYcuOvOk/wkiIr9gAWybp
         un6P4hXxgk1h/+emBWf/YWHTk4lIDIKq0dgM7TFRyB3Efx7BIH2z8+mmh+GUy00ehaX9
         lX6EX7Zxkt5IML2i7oYCzAI/6KFbqXF67Tmqa2LI90aFj2nznGhc8K3OKJVwif5dtIox
         9a76lia5TP25Pt/wuFu17mcZY6dW4hwJ84MSiI70jtq5Xsqmk9aGVuWtx9VzoICcGKyN
         kYO9cxTBlhledYxiwMRAILQpiBMUH2qnXc533JUHJm60B0i1CcaVFBRQbHaoxXwNHLju
         N5Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature;
        bh=ncD7ezlr3+tfWqi7QHyF1WHWZZfXlHZ7qQMG4mLPRo8=;
        b=WN8ppRgUV6aCmv2HpwGPOoXZoKuUKydwKqCxdm0jnWSvkE5Q8GkpD/YcSK/iJGEeHL
         gbOqCViU0eLmtlNWYOYrsx8xOD7rpUemWdHqdTH/CtXF1I/7XSHETRVv09pgDQmKnvt3
         pb3kkCjfGcntM3shUgUC7n4/vfxR8VLgMmHZb1ZQXx/ZA36/WmZhCV5u7U87aKmiq1y5
         qgtjLY4FZEzpL33V9i3AdqXV6rwjU8CblkI66WGX8Ex5g/TEkjHKJlBtZt+l5Qv3M3yv
         wrp4JxIkQHlE7BParVcelm5egBL2Bfp/pUpVoN8iAbtC/4lGmG0UcH8eKyljX9exZsGt
         oNYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=azkRhUFd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o2si4592544wmf.162.2019.01.06.23.55.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 06 Jan 2019 23:55:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=azkRhUFd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:40512 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ggPkZ-0002ZV-E6
	for alex.bennee@linaro.org; Mon, 07 Jan 2019 02:55:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39855)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <nicholas.a.hudson@gmail.com>) id 1ggPkQ-0002ZG-Tl
	for qemu-arm@nongnu.org; Mon, 07 Jan 2019 02:54:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <nicholas.a.hudson@gmail.com>) id 1ggPkQ-0005Dd-4f
	for qemu-arm@nongnu.org; Mon, 07 Jan 2019 02:54:58 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:52762)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <nicholas.a.hudson@gmail.com>)
	id 1ggPkP-00058b-RH; Mon, 07 Jan 2019 02:54:58 -0500
Received: by mail-wm1-x342.google.com with SMTP id m1so6227886wml.2;
	Sun, 06 Jan 2019 23:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ncD7ezlr3+tfWqi7QHyF1WHWZZfXlHZ7qQMG4mLPRo8=;
	b=azkRhUFdH7O6M89zgkoSLDGewapy9tiREKKNCdjB08t/8yvjz038tbNhpQfkH6yDaC
	759vEmyn1KOuxs3DMF7dcO7fuZINqBAhH9figH6uecmfjhlYhkaHk934YHqXOV6Mdt4b
	ZWkSZDni4BHkdyEiI9yrnmaYa6jfnQ31VJuhhm1wgBapL56Yh9Lj2lQ/tyaeKGoZ3gJU
	dWIgkvrVSvaiUFBBZFg4GCobIZvGYbgpVYRid/BfLnPOit9x9QGpFbfKGZ5Tmp8wBj4U
	Ae2Ov/WbVWNtg85uSFfw1sWm8WXotkk0fV6VGxxS5WbUTU/F2/ALKUdo79T5HrxzJA6E
	tEdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ncD7ezlr3+tfWqi7QHyF1WHWZZfXlHZ7qQMG4mLPRo8=;
	b=oG24MQ7btZxn5ZdCIKaXjM0unegoBmj32mEqP3p4mZaFQEo0gy5p0j1rJ2BP/99y+p
	mqZwRbCE17eXMgVXhmlVS5WOcOdsGKXahJGy8HSIE8wIzMgCz0mZP4GTrfSePUOSKxn6
	49TohreXGqBj1bkIl3UwLCOdp/zlnM12EMsriAIgGAr/cHCBiAJ5amyuI+q9qDNB0Bns
	ZASnuOhRNM3vs5Ugjw4rYfOmb5AMxJZVIkfZbCUgVCHkCGAriniHTepCCN+FHEkyXm6j
	IvM2cut0a11+ud4zvjbmvFDxTMJTWHCNX+riIpwAcHE2dkB6eIDiZ41GDugI4pBDrAUA
	FSkQ==
X-Gm-Message-State: AJcUukc8ftLSQ7QhtZ9uJSVL0/WUh7veZldWynhmzsLghwlxSbGYVvXX
	CLZKKBAPGhn2sh0aCw4Z9DbhnnAdN5M=
X-Received: by 2002:a1c:6607:: with SMTP id a7mr7621089wmc.129.1546847695957; 
	Sun, 06 Jan 2019 23:54:55 -0800 (PST)
Received: from ?IPv6:2a02:c7d:8625:5a01:7503:9d7c:2958:5e7d?
	([2a02:c7d:8625:5a01:7503:9d7c:2958:5e7d])
	by smtp.gmail.com with ESMTPSA id
	g16sm52045917wru.41.2019.01.06.23.54.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 06 Jan 2019 23:54:55 -0800 (PST)
To: qemu-devel@nongnu.org
References: <154681539681.475.7900177304020568757@02a1dbf831e2>
From: Nick Hudson <nicholas.a.hudson@gmail.com>
Message-ID: <45bd563b-881a-5308-dca8-9aaad94b7ebb@gmail.com>
Date: Mon, 7 Jan 2019 07:54:52 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <154681539681.475.7900177304020568757@02a1dbf831e2>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4] Support u-boot noload images
 for arm as used by, NetBSD/evbarm GENERIC kernel.
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
Cc: fam@euphon.net, peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ACd8DaEuc+1j



On 06/01/2019 22:56, no-reply@patchew.org wrote:
> Patchew URL: https://patchew.org/QEMU/d19529f5-841e-ea06-fe7d-86ccfd528817@gmail.com/
> 
> 
> 
> Hi,
> 
> This series seems to have some coding style problems. See output below for
> more information:

The files being touched have lots of coding style problems already.  I'm
avoiding i) fixing these in the same diff for clarity and ii) in the
case of IH_TYPE_KERNEL_NOLOAD, following existing formatting.

I'll send v5 with the loadaddr api documentation formatting fix.

Nick
