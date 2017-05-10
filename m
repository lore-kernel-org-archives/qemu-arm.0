Received: by 10.25.0.6 with SMTP id 6csp472155lfa;
        Wed, 10 May 2017 13:21:33 -0700 (PDT)
X-Received: by 10.55.73.151 with SMTP id w145mr7163493qka.60.1494447693036;
        Wed, 10 May 2017 13:21:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494447693; cv=none;
        d=google.com; s=arc-20160816;
        b=gNXE9bo/9YwRswbl9ZmpIwFNWA7l7adTGCGrV3U5aOdP3UQ99WnX7nHqNhl6BRGIkx
         gT8560kJks85FWZdwoIIQgwuA3FfYSiSI8hEWdi1mXPrJnfPMYSJ5wEPVHpkRZzzqjBW
         99Kjzxj//m+L27hZPXRmRCP+tXR4AiFL8W/7H2lXN95SNfAANKrhSun+KK0REq8RkUTu
         +3ZSoHpMxDY+Gso8q+L36QiEutfDVSJlJDkr+/dLcw4/JhLesCla3RdIs8Srnwa65i5W
         PvFji7KPS4bccbwOIG0qVYk/CsO4+Vkg/ThWl1XmUYtNs4QZAGX6U3mn+3QBhU7Z9M3v
         0a2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=EPg5lhkIZrEK5PAJM030Ya0jvKMGxqpDllUIyO8ireg=;
        b=NN7SM+I6k1g2vvCp56salGF6jj/NYNWffNDRF1I0PdDmiRn5VXIUm2WYoVvMgVCRXC
         c20F9Jg9C+whIDFD14RDPxbH7Vr3DbNXxrLXPPaq/4aXSn89Xom/+CbxkTIHQ2YOifRP
         7pnJaJEYeKIoAKyrNp95HrobGepBSyPTaX/77Z6kZkyWtplOtom0ZiDQajkqUtLBTuOH
         NteJOKso7BPMe7aUzKK37zHgUtQ5hfiOoJ1quxBBZkWkoDF8t9egtNbliCP7fbWAKWgS
         t/ryHdOAsZUSxhfHRDZmIOI10H8XZjGXX7ZU5nc95sDZuAYKXEEEdlQZtfU16kzd/nKR
         wxFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a29si28098qte.51.2017.05.10.13.21.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 May 2017 13:21:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44678 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d8Y72-0000bN-E2
	for alex.bennee@linaro.org; Wed, 10 May 2017 16:21:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37641)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1d8Y6E-00005x-Ny
	for qemu-arm@nongnu.org; Wed, 10 May 2017 16:20:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1d8Y6D-0003KD-Vi
	for qemu-arm@nongnu.org; Wed, 10 May 2017 16:20:42 -0400
Received: from mail-qk0-x22f.google.com ([2607:f8b0:400d:c09::22f]:33146)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1d8Y6D-0003K4-RA; Wed, 10 May 2017 16:20:41 -0400
Received: by mail-qk0-x22f.google.com with SMTP id y201so6455424qka.0;
	Wed, 10 May 2017 13:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=EPg5lhkIZrEK5PAJM030Ya0jvKMGxqpDllUIyO8ireg=;
	b=Z9gmRrBSknuFhDFrj+G2wsl/13IDmKhheToYT3CyrS+3dQKdfboAuweeqQEIdJIzav
	13fo9MnNMkUBEvj8W3HD8WXRSZrUFDFVhWRcOW87P3v1yh2xbv8XRnci6PxvsMIMYjM+
	ERZap8mId6C8UWKHEgmvUP7pSglW7bs2+fb3edrjQQRUpX0ZeXg4jO2iHEugcWmTCxt4
	ivxo7BTY8PTflH6hviY5SfeePggWYnB6ypIAtISpfo0h5c6RJ4mQQ6h02esbajZ9axmL
	uTdV9wG5Ax74acaFb47S0QQJyb6NYgy6CrUffD1sdOBq6wOHOrVhDjJAllAxNaav0WM6
	yODg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=EPg5lhkIZrEK5PAJM030Ya0jvKMGxqpDllUIyO8ireg=;
	b=GlDuVbyxqYPYQX6Up6PdxRCZfvkOiRD4Kcc2k5yN+8O0quAkM/BtFnp2XpHm2D3zXg
	wzxX8Gfbr2n5r7KymFPPLkF8qdQu5gerF23M9iwzwL1KL5/iMIemJTMvLNpwCyDYFEc9
	1FjYGDK+nf5Awr/bmwdGox6Gjoo7p94Iy0MlVMoUxgDrSlIHUaFAZsamAUGenLDafuqW
	UUPhoONHe0EL3FEBXTy3XeZQbuzHh+MSdW/aXtT8CS0TT0sGjRPbP3HW3pKDlXzoZW+F
	siEv5WmChijZBaGHj4Fie6WL8ksUhhdAokH2N60ii+1kH5BQMacc5vPOzA4kCYvcu7r4
	whGA==
X-Gm-Message-State: AODbwcCvOziQZXdpuXIpNAaQmILGSZs2u8aVygtSzoRUSW9WPNui+2XN
	a/pLAgyj91q8Tg==
X-Received: by 10.55.175.67 with SMTP id y64mr7066404qke.130.1494447641352;
	Wed, 10 May 2017 13:20:41 -0700 (PDT)
Received: from bigtime.twiddle.net ([2602:47:d954:1500:5e51:4fff:fe40:9c64])
	by smtp.googlemail.com with ESMTPSA id
	l47sm10255qtb.14.2017.05.10.13.20.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 May 2017 13:20:40 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org
References: <20170510200535.13268-1-f4bug@amsat.org>
	<20170510200535.13268-3-f4bug@amsat.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <b258b01d-74f9-e412-5367-d8e1d72eb159@twiddle.net>
Date: Wed, 10 May 2017 13:20:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <20170510200535.13268-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::22f
Subject: Re: [Qemu-arm] [PATCH 2/8] target/arm: optimize smul_dual() and
 neon_trn_u8() using extract op
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
X-TUID: QDvpPuiSGgys

On 05/10/2017 01:05 PM, Philippe Mathieu-Daudé wrote:
> -    tcg_gen_shri_i32(t1, t1, 8);
> -    tcg_gen_andi_i32(t1, t1, 0x00ff00ff);
> +    tcg_gen_extract_i32(t1, t1, 8, 0x00ff00ff);

This is very wrong.  See my previous comment.


r~
