Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp2728758wrq;
        Mon, 11 Feb 2019 09:45:16 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbEpDVWaQmFBm9eNoK29/oAfp585WX00aydjg/HssOziQxol4FoFbSjZQFbs+BkYKtnGDuv
X-Received: by 2002:a25:16c6:: with SMTP id 189mr29521096ybw.17.1549907116862;
        Mon, 11 Feb 2019 09:45:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549907116; cv=none;
        d=google.com; s=arc-20160816;
        b=XNCZLDw4tK5x7dWPpyWdnfUhc7eVYwaw/PWjXMFZkiENzv01dDEbO7p9C8p7wF759j
         XL7Vmy5sfQQgorhuxv7zowPCzyu1R+/ImaTzy5T7NhyHf84rTFdDcE0hZPEChAp5APfC
         7VpK/RFCZR2DW7gL31bXKXIww+Tse+2PnDDPE78UyPU4h48gCwyFDUSHT5eK7oEDSmOG
         j1Bbr/jmrMhnwyzwWmVDkOa2tQjJ7jeBCYcobGZVyp9SfkoeiFT9pyieqC7U17kV9cRG
         EXYlLLRcvBKLGXQn0TcrpWsU72rACmXsAxGrWsiknQMicJLBWVaejdVP2UVyW9rLFXf9
         OvZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=R2LA/wt/XSNWaWL2HbISV15gHG6CwXHQ1gwC4iJ6lms=;
        b=B+eEyYTl0u+gFBmSHJFTdLd9xDmRETgdE27BXsIagw9hQ1tZ/WFVXKh1sDGZRof+8g
         qFvQF01xlfbLRkTvdrArc6JJh00FoDgOtSokkCcKXpe7Ll8s86rGroEmnwcRMrEGkukd
         p91L4LG2gXelflQy7X8gMguBBTaxOEiUn0B6z/Hppv7vz8jYVfKQxUiDLLL7VlQPeSK5
         6EcqfxccHEa/xJ4GHWcp/kah24+MjTLEYvgGqehbQTKUqKPMdC0EKYINGJpEKNQgtLVU
         q9Da8kniM/bQEuWWNJVhB3rrpIYDZClbo2npVAyH/aOxgIJdRT9Pk95Vr9lKEpXZcQqW
         FA0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x7si6025328ybj.126.2019.02.11.09.45.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Feb 2019 09:45:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:53832 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtFds-0003Z0-Bp
	for alex.bennee@linaro.org; Mon, 11 Feb 2019 12:45:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39800)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gtFdj-0003YS-E0
	for qemu-arm@nongnu.org; Mon, 11 Feb 2019 12:45:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gtFdi-000090-Ly
	for qemu-arm@nongnu.org; Mon, 11 Feb 2019 12:45:07 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:54114)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gtFdi-00008i-G3
	for qemu-arm@nongnu.org; Mon, 11 Feb 2019 12:45:06 -0500
Received: by mail-wm1-f67.google.com with SMTP id d15so106383wmb.3
	for <qemu-arm@nongnu.org>; Mon, 11 Feb 2019 09:45:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=R2LA/wt/XSNWaWL2HbISV15gHG6CwXHQ1gwC4iJ6lms=;
	b=She9Rde5eRrrNeoaCTDKcNie6+jfOHsJpg93K5TbI6JI9eV/xgwy8edIITwYf6o2+F
	UHl7KYfndg2lPj+B9tfopuD4fUhtGfk8SP9RpMwOSt9iGAkK4g1r3tcp1MRLDYHmXvDU
	gusOvOfhIP8AuFhzAa2wiQcpd8zfxgsA6z3EFP9pVkyUTl3CLOK/Yk/95e0s4WGqWg9O
	N+55aVVVLTXkts4CF+NLuCIhSeOK9il16PPQszC9Xz9ysHhOyRWoeC0zqIVjzKpGusc6
	O6YfnXpNHAZ1uOEJ0D7MPmjCJ732jrIjlY2+9de8Z/x4fP5xEOK4oE+rwDC8GKWjIwXj
	vDpw==
X-Gm-Message-State: AHQUAuY254V8p1kMKM5QCQamlR2sWo8TF8Tky2fXsZKxwmhIc87AtAU3
	srgm8aaoEQlSABIEW280D+82cQ==
X-Received: by 2002:a05:600c:2:: with SMTP id g2mr474717wmc.109.1549907105409; 
	Mon, 11 Feb 2019 09:45:05 -0800 (PST)
Received: from [192.168.1.103] (10.red-83-35-153.dynamicip.rima-tde.net.
	[83.35.153.10])
	by smtp.gmail.com with ESMTPSA id y25sm6644773wma.6.2019.02.11.09.45.04
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Feb 2019 09:45:04 -0800 (PST)
To: Thomas Huth <thuth@redhat.com>
References: <1549694366-1284-1-git-send-email-thuth@redhat.com>
	<1549694366-1284-19-git-send-email-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <89cf88a6-d3c4-3034-02c2-13f1d0636f0c@redhat.com>
Date: Mon, 11 Feb 2019 18:45:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <1549694366-1284-19-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-arm] [PATCH 18/25] hw/arm: Express dependencies of
 canon-a1100 with Kconfig
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
Cc: yang.zhong@intel.com, pbonzini@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Antony Pavlov <antonynpavlov@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EMDKB8SzS2t2

On 2/9/19 7:39 AM, Thomas Huth wrote:
> Add Kconfig dependencies for the DIGIC / canon-a1100 machine.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  default-configs/arm-softmmu.mak | 2 +-
>  hw/arm/Kconfig                  | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index 6605786..20fcbcb 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -28,12 +28,12 @@ CONFIG_ASPEED_SOC=y
>  CONFIG_NETDUINO2=y
>  CONFIG_MPS2=y
>  CONFIG_RASPI=y
> +CONFIG_DIGIC=y
>  
>  CONFIG_VGA=y
>  CONFIG_SSI_M25P80=y
>  CONFIG_IMX_FEC=y
>  
> -CONFIG_DIGIC=y
>  CONFIG_NRF51_SOC=y
>  
>  CONFIG_FSL_IMX6=y
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 6b1522f..617a460 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -31,6 +31,7 @@ config CUBIEBOARD
>  config DIGIC
>      bool
>      select PTIMER
> +    select PFLASH_CFI02
>  
>  config EXYNOS4
>      bool
> 
