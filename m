Received: by 10.28.71.27 with SMTP id u27csp406675wma;
        Wed, 24 Jan 2018 01:37:11 -0800 (PST)
X-Google-Smtp-Source: AH8x2277Faxmp3Nkq74M71X1i29JN3LHhniOzYKUV9BgRDCJ2IKmunqNBw36X46AHGRNdTTs5J5k
X-Received: by 10.129.123.133 with SMTP id w127mr4789923ywc.364.1516786631554;
        Wed, 24 Jan 2018 01:37:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516786631; cv=none;
        d=google.com; s=arc-20160816;
        b=iLhvrYulqU63xOydpYa1A2MXbc47W9aZ8KMu+yCHRaGA8zxDq3J56zK4M290b9Gbnh
         SDOh13jhmcTvmqsjWuZNWWrlEs3HDP72irbAa7VsN0oKB5eM0Bb6LJp1RhI0QQv+92a3
         m39YhNHHy+wq1VoKAtCANbf96DWcphUtq+jyOJXk93ejSjZ9WgTikNRxbxMA8zzTuGvA
         xxKM4pQ6rIA8TBTI7LE0AwvorS84H8GTrH5qDDhboFP1FrQB80HoVB32TBEeaJw+DF8S
         FC1sr3hTVIgxqY3igg8os5QaBMjjV61i7oW7Sm64mZFwPp4gmWZ5+2lt6behn5ve/Mow
         Zcgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=oS49sC2cs2x5yYm+YNFVGZnQap08s/bm8KD5a10LrDg=;
        b=h4YX5XRl/qRWjuzMxGqpA5Tj0vwREkEBx7CdE0zyXFoSkvhjKZAUpJ4Hf/yYiEakpR
         ijlIurYEdq/1fk70oTUOl/+Bcxwbj9ne5iD+K29ec5XqLenaJSoVOxg+M1nr2TWMzNsC
         BslqMlQQnhEmUsnYlnd1fptEVn49lX6LD6VpvZB1hBi435szZb3rd7QNVnpoVxVFSYVF
         hH0rJqA9PIyVzWobSaK8lo7XqjNFlZiXSHcLMzHQ2b4X3QWcBwkyZTLZJxbPqxdDk3nD
         3t7KW+KNaijpkrlxq0MTxF1kHhh4x6urrhi87Hj/Nojl4/TDwTVlsro0uiroL98gnR/0
         f4XA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g206si4580746ywc.475.2018.01.24.01.37.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 24 Jan 2018 01:37:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37201 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eeHUU-0001Um-Vq
	for alex.bennee@linaro.org; Wed, 24 Jan 2018 04:37:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40146)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1eeHUC-0001Qc-KW
	for qemu-arm@nongnu.org; Wed, 24 Jan 2018 04:36:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1eeHUB-00008R-9n
	for qemu-arm@nongnu.org; Wed, 24 Jan 2018 04:36:52 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:57473)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1eeHU6-0008IY-HW; Wed, 24 Jan 2018 04:36:46 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue006 [212.227.15.167]) with ESMTPSA (Nemesis) id
	0LgSLR-1fAbxO1ck1-00nznS; Wed, 24 Jan 2018 10:36:35 +0100
To: =?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>
References: <39441aea4e2d05cc505ed3a373e81d3869eb994a.1516785202.git.agx@sigxcpu.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <88c65afc-cbc5-9091-7c9e-535a242c65ed@vivier.eu>
Date: Wed, 24 Jan 2018 10:36:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <39441aea4e2d05cc505ed3a373e81d3869eb994a.1516785202.git.agx@sigxcpu.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:cnmMY/7ndHr7oP3BUoIbiilEJ9oBd7Qq8gebqCzyDqScH1M/JFM
	vqEP0cCAOLn8GjYNLFzLMp1LdxSqpYTDJOF6rEt9hS6bBadu62WRI24ENvG+hG/nRe+dSt7
	HjvDIP6FXoPVexzGWfoo+v0eR13lvUMRJ52nBXY7XRf+d9YG0X0z6T/a1rndB9xVdBmOZb9
	pCY259kY8cYvj0YEZQ6pQ==
X-UI-Out-Filterresults: notjunk:1;V01:K0:jSM9ZuUkCD4=:pTO5PGepIP8uVxW5s5UO3t
	Bmrl3FxYxhGX9B6slhLnpzRAAmSeMxSoukWjLBgQgl4/GbDf3/qEdTuVTiVG60Uom9JVsl22q
	IMbyEAAC2dAczKZw0I3r3TPdi0F2dUJxIGse9wZMsoixYP4oMyd6d+zRi9kwSuryKS5s3/qzE
	qIVnehUry5wXxnNctfcsBsHV4QwpNA+Pkcu5uDhKiuGYtjSH+0mdhf47XLN6LZnD8Tea8dxfh
	pwydBls/Cd7+bxrzCKPdFqeuTARxutw30ufIg3D3TyfiKCn97rHwg1KjCd/sf85ymgkYip7wq
	a+jz0rzQc6mSsP3AROvMm37ydP/XaBaafYPJqIYNuDFsgPbHo4lF8LazbcRNrQ3rkYy6JgmxY
	yO5CMtNx2oaoU7946DobZICD/H50m8ilPH7rTOYiDZAE35hnpzM58UkLa0BEUOySS6i6roSYY
	JP98M8BZsI37G/UO+a3pheUfiTdZsVmn7dlxq7tWeYEj5pBpyqM3jCVYgGkfqXZbwOO9DwI6Q
	jk7LgqzQLNR9Isfbq65kujLFLF4Zt602wwM8NBEC2ZewzDwG/L0witTVSK5ijUkiRDTBuu80B
	pNjJAPpQEL1IJiJKeMG/lQ6IqRXo5lGq654OyfKNju5p8FfjSEmp5QdGEkgPSN8HLRe87v5LA
	dmfyHw0VCOZ00p+SVGF7t9tKH+NVy7QJNvqqGebX/aZv5sEJ0FE+3YTmRyzRPW6Xt1oxWbk2F
	ZeGRFhg4qCQolb8YwNJIKtOb4AlpyAA27o5GxV1m3Ab2//YfRfWdbF5qgZM=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.126.131
Subject: Re: [Qemu-arm] [PATCH] linux-user: Fix register used for 6th
 syscall argument on aarch64
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
Cc: Riku Voipio <riku.voipio@iki.fi>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aifTHcRCH/95

CC: Richard has he wrote this code.

Thanks,
Laurent

Le 24/01/2018 à 10:14, Guido Günther a écrit :
> Unbreaks the testcase from
> 
>     http://lists.nongnu.org/archive/html/qemu-arm/2018-01/msg00514.html
> 
> Signed-off-by: Guido Günther <agx@sigxcpu.org>
> ---
>  linux-user/host/aarch64/safe-syscall.inc.S | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/linux-user/host/aarch64/safe-syscall.inc.S b/linux-user/host/aarch64/safe-syscall.inc.S
> index 58a2329b37..e4fbc31454 100644
> --- a/linux-user/host/aarch64/safe-syscall.inc.S
> +++ b/linux-user/host/aarch64/safe-syscall.inc.S
> @@ -36,7 +36,7 @@ safe_syscall_base:
>  	 *               and return the result in x0
>  	 * and the syscall instruction needs
>  	 *               x8 == syscall number
> -	 *               x0 ... x7 == syscall arguments
> +	 *               x0 ... x5 == syscall arguments
>  	 *               and returns the result in x0
>  	 * Shuffle everything around appropriately.
>  	 */
> @@ -47,7 +47,7 @@ safe_syscall_base:
>  	mov	x2, x4
>  	mov	x3, x5
>  	mov	x4, x6
> -	mov	x6, x7
> +	mov	x5, x7
>  	ldr	x7, [sp]
>  
>  	/* This next sequence of code works in conjunction with the
> 

