Received: by 10.28.91.67 with SMTP id p64csp1299238wmb;
        Tue, 13 Mar 2018 16:49:08 -0700 (PDT)
X-Google-Smtp-Source: AG47ELsZgYjg7Jvqhe3ofuaLhyOa3lW/gmeBcLBJ3oYdhVZ05szCL6n42iVzu65qQg8OcEFbNUpo
X-Received: by 10.55.106.68 with SMTP id f65mr3959441qkc.346.1520984948121;
        Tue, 13 Mar 2018 16:49:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1520984948; cv=none;
        d=google.com; s=arc-20160816;
        b=XVcwk7jdiwPUNgYUGRNhGHVR3EQensqtRSkA5Wdb/OiOIn6mUH5cHAxxooPoFf3q+V
         4rT/zgkoQJkcWJqWiX2PJKmgYpW+Y/jY2RtjEcJMxoD1qKMczzPyrN9rlpmWn2MH1Pk4
         ZYquk9q5wh+4oi1hiHiXtb3ZUEl2bnmCRVimYIK0PLXn6tJcDoF50qiXJkUEIaYF9dzK
         u7rvpSVh6A2OpAb0ugbNO+ziAvckz6x2++Zh856+vEYgvqxKMyZJqsLq1yctikcVNrUz
         NcpcLvNdLAcU0L1tYsOKtJG9wZUPvDjPOpxLkyyud1PBCGt0KwgI6ZpAQMwjC94uE8eD
         cyRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=e7zUyaczLiZaKu4xdEi8GQY5gCVgaqpSTB85U907o4w=;
        b=TW16Ny/ZP1rlMhMhnde+pJq7XlNUrbBbbpgBLvEtIp38APssd64S1IXsDKVEHBYBpX
         zG8wh6yk9CkI80HEYToECcdomHSxmiiJ2niOdxWZghIYgW4B72FBBc7IxevLCduAS1fd
         dKhOxD4mtwlF4X2A/pb/X2LRiRf4apmzjaWN4BTt9+xaWoMqfLfhb7AnzFOOCDDHjLqY
         iCh4bwf6FQuWrz1P6zq99ELiyVMI9RGilsTeFhDA3n0aFuNvskwyeNaXC3ZU4jIuAwXu
         jUEENeBwzLSPC9kdG7/SBChffHx2/LCg4ZvRIRgxxMvRP9lVEgo06JE2lSrB0H4LRX/5
         MuYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=omv5wVSB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h44si1482934qth.462.2018.03.13.16.49.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Mar 2018 16:49:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=omv5wVSB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43639 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1evtfH-0000Gu-GT
	for alex.bennee@linaro.org; Tue, 13 Mar 2018 19:49:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37992)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1evtGe-0003AI-L9
	for qemu-arm@nongnu.org; Tue, 13 Mar 2018 19:23:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1evtGd-0004OQ-Ja
	for qemu-arm@nongnu.org; Tue, 13 Mar 2018 19:23:40 -0400
Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242]:46272)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1evtGY-0004KT-Np; Tue, 13 Mar 2018 19:23:34 -0400
Received: by mail-wr0-x242.google.com with SMTP id m12so2591539wrm.13;
	Tue, 13 Mar 2018 16:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=e7zUyaczLiZaKu4xdEi8GQY5gCVgaqpSTB85U907o4w=;
	b=omv5wVSBwZpUMl6IvV7EHpuCyqaFC2Nu9GXx5hpwskV8H6PkMtzVR674GOoWFNBCr8
	iy2F7BXpRQ4QeDq/zdUg+krFn9mF/f4CcSFnPRXK2F0kXs4hKb+cDDN1PDhAvV54zd/S
	frSCNqeHNQZ7Z9RIzujphLxq381MO1Y/mkrxc+zM7kZrL5PBZq8RjgYvfFmi2ofpM5qY
	LK8k4+pL6C8AIsAy7xnV4XIpnrdZ85JS0HqKerr4/gkwSPgV5wNlriu6t6nsc9nID97w
	FdE08wqi9BAdKQZ9fq5Yfu+imivbFCXCFwpso9hCIVD+ZJpfT8C0NdE5dDd0INo2m/hO
	gYMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=e7zUyaczLiZaKu4xdEi8GQY5gCVgaqpSTB85U907o4w=;
	b=En81jPtGKLhQVCkwHHZLs+Qn4jjbqZAh6j5eXoTH8GYfEwZAo35i8GNvdoC256rHW3
	foriVD+/vM/Uf3NamJkx+XXVNsuUCf8v4Y19F4NKdY/jZUnjjkRvrRJ5YHBv8kAxEqBd
	NjGYCPwLcuSQT8oP+Fnle5mHeKDX5Mn1IzSGvBG/fxVIJRh9vGxL8u0yjPFKGBs68yXW
	NFmgIy3MwYp/U6gRSI4wlSYMSjftLfkxeLRVWPVZ40e39Inqer00yGyExQnYqxh0CWpv
	3L1/md3YWKD2UQjs0Dsi7gY3vhVCvVO+ZalQWJx7ad26rbxwom2PyqRk0/BU+qacaTE/
	cd9A==
X-Gm-Message-State: AElRT7Gj4ybt/zGbJGD25UJqgAWSdtQAquTbb1XhEQu4APH+PzqY9n15
	OmvDo99jzjvuBtr9vwdT70g=
X-Received: by 10.28.215.200 with SMTP id o191mr2131473wmg.84.1520983413688;
	Tue, 13 Mar 2018 16:23:33 -0700 (PDT)
Received: from [192.168.1.29] (AStrasbourg-554-1-221-65.w86-204.abo.wanadoo.fr.
	[86.204.94.65])
	by smtp.gmail.com with ESMTPSA id k2sm1645397wrk.41.2018.03.13.16.23.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Mar 2018 16:23:33 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180313153458.26822-1-peter.maydell@linaro.org>
	<20180313153458.26822-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <8e938ef7-85e2-cf5d-9c6b-3a201d8ad500@amsat.org>
Date: Wed, 14 Mar 2018 00:23:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180313153458.26822-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::242
Subject: Re: [Qemu-arm] [PATCH 2/9] hw/arm/boot: assert that secure_boot and
 secure_board_setup are false for AArch64
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
Cc: Pekka Enberg <penberg@iki.fi>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GgqOHmNg7+I9

On 03/13/2018 04:34 PM, Peter Maydell wrote:
> Add some assertions that if we're about to boot an AArch64 kernel,
> the board code has not mistakenly set either secure_boot or
> secure_board_setup. It doesn't make sense to set secure_boot,
> because all AArch64 kernels must be booted in non-secure mode.
> 
> It might in theory make sense to set secure_board_setup, but
> we don't currently support that, because only the AArch32
> bootloader[] code calls this hook; bootloader_aarch64[] does not.
> Since we don't have a current need for this functionality, just
> assert that we don't try to use it. If it's needed we'll add
> it later.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/arm/boot.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 196c7fb242..e21a92f972 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -720,6 +720,13 @@ static void do_cpu_reset(void *opaque)
>                      } else {
>                          env->pstate = PSTATE_MODE_EL1h;
>                      }
> +                    /* AArch64 kernels never boot in secure mode */
> +                    assert(!info->secure_boot);
> +                    /* This hook is only supported for AArch32 currently:
> +                     * bootloader_aarch64[] will not call the hook, and
> +                     * the code above has already dropped us into EL2 or EL1.
> +                     */
> +                    assert(!info->secure_board_setup);
>                  }
>  
>                  /* Set to non-secure if not a secure boot */
> 
