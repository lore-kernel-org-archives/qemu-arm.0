Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp956216wrg;
        Thu, 16 May 2019 11:18:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwWvSnOS6cVGbhNa+2VFEeTYG8pV7OR44yoxi7Gf0xP+jAZN3TclmcxZB+3DI6prj0hcklr
X-Received: by 2002:a50:aef6:: with SMTP id f51mr52014974edd.225.1558030706129;
        Thu, 16 May 2019 11:18:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558030706; cv=none;
        d=google.com; s=arc-20160816;
        b=QppHwb9R1sYx+STFqV9vp9vjfYdQEFNI/jsrjqKGc5/uQtdF16wDvK+C5NIsm87cdl
         drIYmPBz99sc00L97gOiEdND4pJGb2rlp+HXNGQjfC0QIzH4py4zCMlJQ+dmJI0VKxfl
         Fxw0LY3jjuZMWpHutZXoCvMFgs368PA9VyU8tIcyMU7aGsl2FuCMihoj/hZ8n8g6yPLN
         FDLFyIRHruBwJU9WVuskFnXUwpDW2xR1AHYV9RG1DNWm7bMPMIv/6bWauVMVZLPmM1hO
         Ep4GXBU/Z688HpVWuNjEFHGksKOHnY9ECmSnE/KIcz5vTmDdgw/SaumkM/t7F9cmuae4
         j3EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=FtQCug/j+z9J2b4w9SVa+vZzBzyOXeaf8RdeKt3SbO0=;
        b=go/4ArGtm0VgAqwm2N8FtkWOcaVgjwqBzb2Gd5ywMvAxdYH9eykVGUv1CNE+s0jfk3
         YhLKGBeId/+hM6ZY4Wy123AJ8oTmacZml3/FDFBZr/wagTVxSYvKXlsh4JTC8myzuj+H
         1tk8vxxO61hnhBVgCt1fKBzymI2Ndj0qDBban6ROiZX7/kIsrIRBTXyx2wcd0c4m+yYZ
         908y1dmjL3rVlacByVki4XeEPN9x9CcdDp8unvTuGiGmAXCJl31wD2Bf8pi2EaXeuoLc
         7Q3r6jFQYc+vmTbAsFR//+U3xAcxRpc4epQYJSotMNDLHDi/E7uCa017XkPwMtZFYj2K
         cqKg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d15si2934989edb.84.2019.05.16.11.18.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 May 2019 11:18:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:33687 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hRKxV-0001Hj-5S
	for alex.bennee@linaro.org; Thu, 16 May 2019 14:18:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40764)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hRKxJ-0001Gw-6t
	for qemu-arm@nongnu.org; Thu, 16 May 2019 14:18:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hRKxI-0006sk-Bp
	for qemu-arm@nongnu.org; Thu, 16 May 2019 14:18:13 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:38225)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hRKxI-0006s0-5q
	for qemu-arm@nongnu.org; Thu, 16 May 2019 14:18:12 -0400
Received: by mail-wr1-f65.google.com with SMTP id d18so4446411wrs.5
	for <qemu-arm@nongnu.org>; Thu, 16 May 2019 11:18:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=FtQCug/j+z9J2b4w9SVa+vZzBzyOXeaf8RdeKt3SbO0=;
	b=pPVMMT3t516L3/dJpQoTggtJEsRLPO80EkbC+i+/3dj57kIDBe24qYE7C9rlpi3x+W
	6xlpyBYx6Bw5EHrWcIGC0yDtx0EfNxSbJBMx93ydKqeFpM99JEZFSCcH5vm00267/7A7
	F3+Zf9B6ngrkRR5IByArRnncKFn6Qqu8oQ84C8HlfE55i8DmmDxuXW6VkH4dkK8fh7gO
	w1qXAazBiSO7wJwb0lKyiaT1iIUBw+q28+lVhLv87hc0lQgCsjv5EC7VQSOdUBW4Gdo9
	GK+8rhzCgUBqZvUKRQRlntxwMb1HN5l7E5KSAEFW0iF5BV/FM+xKoTSnwGqVU/P3Y4t0
	/PEw==
X-Gm-Message-State: APjAAAXYuBQnjwmR/7OuAzeXZaoVUWR6fGrVI8lhLfi6VKnRYolIjANw
	JugJAunOYRGMlc75qPlfCBGgiA==
X-Received: by 2002:adf:db87:: with SMTP id u7mr20287931wri.245.1558030691264; 
	Thu, 16 May 2019 11:18:11 -0700 (PDT)
Received: from [192.168.1.43] (228.red-83-52-173.dynamicip.rima-tde.net.
	[83.52.173.228])
	by smtp.gmail.com with ESMTPSA id f6sm6868250wro.12.2019.05.16.11.18.10
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 May 2019 11:18:10 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190516163857.6430-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <d8c1a3f3-5dda-e1a6-64a5-9b0721a6f527@redhat.com>
Date: Thu, 16 May 2019 20:18:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190516163857.6430-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 0/3] arm: Clean up and rename
 hw/arm/arm.h to hw/arm/boot.h
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
X-TUID: gEaqDTSDZ/3k

On 5/16/19 6:38 PM, Peter Maydell wrote:
> The header hw/arm/arm.h used to be a general bucket for
> putting all kinds of arm-related declarations in. It now
> has mostly kernel-boot related declarations, with one
> exception: the declaration of the system_clock_scale global.
> This patchset:
>  * moves system_clock_scale to armv7m_systick.h (since that
>    is the only device that uses it)
>  * deletes some unnecessary #includes of hw/arm/arm.h
>  * renames it to hw/arm/boot.h, since it now only has
>    declarations relating to hw/arm/boot.c functionality

Yay \o/

> Since system_clock_scale is a weird thing, I have included
> in the first patch an expansion of the comment describing
> it to be clearer about what it does, and also a TODO note
> sketching out how we could go about eradicating this global.
> 
> thanks
> -- PMM
> 
> Peter Maydell (3):
>   arm: Move system_clock_scale to armv7m_systick.h
>   arm: Remove unnecessary includes of hw/arm/arm.h
>   arm: Rename hw/arm/arm.h to hw/arm/boot.h

Series:

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
