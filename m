Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp2726146wrq;
        Mon, 11 Feb 2019 09:42:16 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ib96JxqBjdEujzuRVFp3Joy/NOlmiZIw/C7rt9hve/l63mavjMy6FPSlsOVFj9Gisi+ksTF
X-Received: by 2002:a25:1682:: with SMTP id 124mr29500841ybw.346.1549906936741;
        Mon, 11 Feb 2019 09:42:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549906936; cv=none;
        d=google.com; s=arc-20160816;
        b=Cft87cbDc3KXhBdJ7/A7loxMyAyttjGAmLfDiYEr/yMweoEgpDg0n4pq/sYtQreimS
         cKarb3eBPGQInElPCOAJHCQglpIeqEBr3mfjolZViZWBuCv/Z6DAPzEU3+cp29vXkNgO
         k9TeOkdBLVChzrMTfeKpQU9KQtXEuhHXJ1DzbeuNME9NKA5kdQb9irGuWRqZb0Ywxz+V
         U3KK3jN+uTf4KoBLJB6F41HlkNfLqTdgaoKaEjKSxp2UpuqJi8j6heiX/iV8JWZ1vKuh
         ZXigtDe3YlnR231miCGvo8GAH90GT2mRuMy8PvOgQH90BV9RDwCEO4/xP7nnyHxGrwnm
         +0mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=7lWxvS5jtvPgI6G+Cl0V6GbMLZQhzMZWFkPsmFa07/A=;
        b=MkCvZ5gl/EN5qca8VRKTsxAlNMuA3uEQMfZYG7Iu+I3TafgFdsIpB2bscfgAmOGmTX
         g9uAsSZvD1tYfeMwM+PUUGJhl7SYuiDQJAzjQPb7lisrvyKFbczsmfMGr3TMTOe0aM8f
         SmSr+k5NhkeNW04chJDv7X4Oz7f1sroWOV2Lmb9j8ua8Bm+9k34THUab2P81wprjvDVS
         FugKUkALEESkyC01Z4CHCX1m8UCQVJ8LwQrFpBdGf8XQJP8YW3uLkHEc8CIuQah2Sy/F
         J1J6//2lwgDo8mPM1Ank5Nt4knL1mGIMCC+6muHdpMl5XWnvQ9NLqaLDL3+3TFGBA3gY
         vjZw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v5si6259739ybc.344.2019.02.11.09.42.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Feb 2019 09:42:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:53792 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtFay-0002RM-7t
	for alex.bennee@linaro.org; Mon, 11 Feb 2019 12:42:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39059)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gtFan-0002QI-IB
	for qemu-arm@nongnu.org; Mon, 11 Feb 2019 12:42:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gtFam-0007Ux-Pk
	for qemu-arm@nongnu.org; Mon, 11 Feb 2019 12:42:05 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:55444)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gtFam-0007UG-JX
	for qemu-arm@nongnu.org; Mon, 11 Feb 2019 12:42:04 -0500
Received: by mail-wm1-f68.google.com with SMTP id r17so84622wmh.5
	for <qemu-arm@nongnu.org>; Mon, 11 Feb 2019 09:42:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=7lWxvS5jtvPgI6G+Cl0V6GbMLZQhzMZWFkPsmFa07/A=;
	b=BnXACp9pVyGMxG2r4c1eDiy9Pgf0d4yR6b2Dzr3rsimpvppmYTHfSTWyHtqeEM+WM3
	SLR86omzX/dLICIX9ys7IyGmbU6P57bL/yl0w8y6to2ob/k9U74NggeY7VjIMOwyGXAY
	fnnIjZyh6jgtpXD06VLiCh26OjPHgnTHgDEwz0bmBgeQxpPcKsCibCQiGDHqW1eRLfKG
	lucsehn2h56zslpiyYJiSD9LpjIDCCAL7wJ3UswQJ3ZrypzGpl2JPCwtaIOIpeirfaSC
	QueR1pL8rseOkHmV40lkFUPhRUKkNl4On0mJA6CXsj+obX9pxeU1m9fRS/LAwiGFVd0C
	T/+w==
X-Gm-Message-State: AHQUAuYZZLCrXGXnFmj4fVj5KB5UCePBs+eYvksloS/dS663aatadCqX
	79wKMIlEMnAOyr/S2hEA9l2gfA==
X-Received: by 2002:a1c:9cce:: with SMTP id f197mr456635wme.135.1549906923354; 
	Mon, 11 Feb 2019 09:42:03 -0800 (PST)
Received: from [192.168.1.103] (10.red-83-35-153.dynamicip.rima-tde.net.
	[83.35.153.10])
	by smtp.gmail.com with ESMTPSA id y1sm2461120wrh.65.2019.02.11.09.42.01
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Feb 2019 09:42:01 -0800 (PST)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, pbonzini@redhat.com
References: <1549694366-1284-1-git-send-email-thuth@redhat.com>
	<1549694366-1284-21-git-send-email-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <7aefa814-491d-2a5b-e940-5a7c3e6fbde5@redhat.com>
Date: Mon, 11 Feb 2019 18:42:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <1549694366-1284-21-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-arm] [PATCH 20/25] hw/arm: Express dependencies of the
 MSF2 machine with Kconfig
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
Cc: yang.zhong@intel.com, qemu-arm@nongnu.org,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qvB1b8f+25qE

Hi Thomas,

On 2/9/19 7:39 AM, Thomas Huth wrote:
> Add Kconfig dependencies for the emcraft-sf2 machine.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  default-configs/arm-softmmu.mak | 3 +--
>  hw/arm/Kconfig                  | 4 ++++
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index f6193b1..729e4b8 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -30,9 +30,9 @@ CONFIG_MPS2=y
>  CONFIG_RASPI=y
>  CONFIG_DIGIC=y
>  CONFIG_SABRELITE=y
> +CONFIG_MSF2=y
>  
>  CONFIG_VGA=y
> -CONFIG_SSI_M25P80=y
>  CONFIG_IMX_FEC=y
>  
>  CONFIG_NRF51_SOC=y
> @@ -45,5 +45,4 @@ CONFIG_PCIE_PORT=y
>  CONFIG_XIO3130=y
>  CONFIG_IOH3420=y
>  CONFIG_I82801B11=y
> -CONFIG_MSF2=y
>  CONFIG_PCI_EXPRESS_DESIGNWARE=y
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index d98d39e..7823a16 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -362,7 +362,11 @@ config NRF51_SOC
>  

I'd split the SoC:

>  config MSF2
>      bool
> +    select ARM_V7M
>      select PTIMER
> +    select SERIAL
> +    select SSI

from the board, moving SSI_M25P80 to:

config EMCRAFT_SF2
    bool
    select MSF2
    select SSI_M25P80

>  
>  config ZAURUS
>      bool
> 
