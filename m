Received: by 10.28.71.27 with SMTP id u27csp2958705wma;
        Thu, 15 Feb 2018 10:09:49 -0800 (PST)
X-Google-Smtp-Source: AH8x225jXXUcHV+YdZoryywt3FMQRkuM5qkoHd10y4lnYLgDGHSdjX+PwvQoZhxRMI1kiJGwxPaU
X-Received: by 10.37.215.88 with SMTP id o85mr2668090ybg.462.1518718189188;
        Thu, 15 Feb 2018 10:09:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518718189; cv=none;
        d=google.com; s=arc-20160816;
        b=tOyNHDrMZD3iWMNITcWtFh6flBD/n90o/8wV5wResWcyTWjNjeMZ6wz4PQsriP0bqr
         PD4B0urfPyYRyf6LmXfV28CpaYaasmsQ31R/I8bkEcod08Pt43+2hsoxE0fPk1o5mjnd
         wY6FJg8GTB8oa4P013rdfavwy/MHgG4YIko6B8wsw97ISi1qTUoPKVGN2PlsxsH8c28Y
         lElW2EFM6SeeROUnmrkfdlnu+3KQAcmpYqXmS73fS/BRfZkwMAuXv8eZTinxmhcBllFH
         2j6nhLA/J34J+TxuHS4EnWGSEdWqWxu3fKGnStuMCgxuhuqz0ZfwZkgny0EamtwxN4rO
         PeIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=Lt7b17cjdpF6JFCAzeIP9dSbozSR40jIEy3XBkEXWg0=;
        b=Pr+UokzXJgfNh5uGnK/0p3AnitYG847ZxEjffx5iReVODQ93qVLBC9I7ctx2j4Vljj
         HZCk2QPUHxRB2n+LQ3Qu4Al8zmzqr11gNWhRbuI43o1hNlcU4/1AkS0+hvt26Pspwdds
         AwvGT0m5JAoBpJ05FFzsUcKo+dWg8CHtJBblam4Yi4X/mBfqyAMBftJr3BCeMIenCW6K
         /Un+Wc3D71KIkjHI083TqZmk1tU5H+W9raIU3Ab1Zawx7Vb0Bi6LqopUWBmOSceYXF4g
         lGpNhUXkM+HqCXA8aX0YL4rsYY3X9IKwJH7UAtdPPKaJlJy5lnpxF0pb+yVDBCrfaeo+
         OVCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=T29v7ppo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r10si300655ybk.460.2018.02.15.10.09.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Feb 2018 10:09:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=T29v7ppo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45140 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1emNye-0002Wn-I8
	for alex.bennee@linaro.org; Thu, 15 Feb 2018 13:09:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58043)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1emNwm-0001FB-Mj
	for qemu-devel@nongnu.org; Thu, 15 Feb 2018 13:07:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1emNwj-0004cR-F6
	for qemu-devel@nongnu.org; Thu, 15 Feb 2018 13:07:52 -0500
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:42947)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1emNwj-0004cI-9M; Thu, 15 Feb 2018 13:07:49 -0500
Received: by mail-qt0-x241.google.com with SMTP id k25so705714qtj.9;
	Thu, 15 Feb 2018 10:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Lt7b17cjdpF6JFCAzeIP9dSbozSR40jIEy3XBkEXWg0=;
	b=T29v7ppozGbCju9WkFS0wuNRfNCHGUSBQpl603s/xtVfF70HhjcvXjvDuhBDz0hT+s
	VJ3GPUfn8ptaP96oeyTTi461KZFEF/ZHCtfrr3j+WCaXOz72AXwMZaAsnSlqZyF9Es2z
	JtPYtDmPLqgkHCoAIKRaDU4bAqxuJ2brqbmoJxunxtDPUozFY3VkEjOksRd9xtzP3gYg
	2j7LTaS3k19+54WSmU1G3On6Ze1MBzsDmR+jhwTcBpoYlaYJ99a/PyhIkbrsTBwHpR9L
	1n9xxVnvuWuFXrjfQItEpeRq4O+hCM+cg0bVCccDuoQfO082q70vXVEIiU7IKNvfLDq5
	P5jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=Lt7b17cjdpF6JFCAzeIP9dSbozSR40jIEy3XBkEXWg0=;
	b=IjiJDUoyeDe8iiGUrsEPcz75qqchRN5UfiakbeCQbjiXdOuAg4v9oL82uEDIfW6cft
	h2Eedz73s4JkoL0ubKriPOGyzDr0nhPg6xaHPgjeIEljCwgSZN0z+oTiFA4jNDG/k1zF
	cAzYlJRZg00/XC3V2Spwx5v6v+ip735gJPngryHKm1pnqe2ITxyGRfxyoPB/ZJ30P8kI
	jN2jseXB3EgsfiKXgogMpG1CqQ/x2fMag/D6go3q8iJwEUMWGV2HVYekgbYCGgKZT66y
	XF6uJXpEaJEpNnyO62ZIqy+DkJqIw288oeg47lxQ9zNH5uHxVF5C344PD3Y9tNqXRfLT
	IDOQ==
X-Gm-Message-State: APf1xPAp+sQZjJuVMGyhLj8B+R1K7+uifYYLeNqVb+Jb9ZbMCREsB2lA
	W4BhFbOKNExOseipFd5uVbI=
X-Received: by 10.200.41.139 with SMTP id 11mr5529120qts.247.1518718068782;
	Thu, 15 Feb 2018 10:07:48 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id
	g57sm12233636qtk.54.2018.02.15.10.07.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Feb 2018 10:07:44 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180215175707.15491-1-peter.maydell@linaro.org>
	<20180215175707.15491-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <220f4302-838e-f367-f52b-8e2a2ca105e6@amsat.org>
Date: Thu, 15 Feb 2018 15:07:41 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180215175707.15491-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 1/3] loader: Add new
 load_ramdisk_as()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IeeQxqs6eLXp

On 02/15/2018 02:57 PM, Peter Maydell wrote:
> Add a function load_ramdisk_as() which behaves like the existing
> load_ramdisk() but allows the caller to specify the AddressSpace
> to use. This matches the pattern we have already for various
> other loader functions.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  include/hw/loader.h | 12 +++++++++++-
>  hw/core/loader.c    |  8 +++++++-
>  2 files changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/include/hw/loader.h b/include/hw/loader.h
> index 355fe0f5a2..1fd4256782 100644
> --- a/include/hw/loader.h
> +++ b/include/hw/loader.h
> @@ -163,16 +163,26 @@ int load_uimage(const char *filename, hwaddr *ep,
>                  void *translate_opaque);
>  
>  /**
> - * load_ramdisk:
> + * load_ramdisk_as:
>   * @filename: Path to the ramdisk image
>   * @addr: Memory address to load the ramdisk to
>   * @max_sz: Maximum allowed ramdisk size (for non-u-boot ramdisks)
> + * @as: The AddressSpace to load the ELF to. The value of address_space_memory
> + *      is used if nothing is supplied here.
>   *
>   * Load a ramdisk image with U-Boot header to the specified memory
>   * address.
>   *
>   * Returns the size of the loaded image on success, -1 otherwise.
>   */
> +int load_ramdisk_as(const char *filename, hwaddr addr, uint64_t max_sz,
> +                    AddressSpace *as);
> +
> +/**
> + * load_ramdisk:
> + * Same as load_ramdisk_as(), but doesn't allow the caller to specify
> + * an AddressSpace.
> + */
>  int load_ramdisk(const char *filename, hwaddr addr, uint64_t max_sz);
>  
>  ssize_t gunzip(void *dst, size_t dstlen, uint8_t *src, size_t srclen);
> diff --git a/hw/core/loader.c b/hw/core/loader.c
> index 91669d65aa..2b9e7394a1 100644
> --- a/hw/core/loader.c
> +++ b/hw/core/loader.c
> @@ -729,9 +729,15 @@ int load_uimage_as(const char *filename, hwaddr *ep, hwaddr *loadaddr,
>  
>  /* Load a ramdisk.  */
>  int load_ramdisk(const char *filename, hwaddr addr, uint64_t max_sz)
> +{
> +    return load_ramdisk_as(filename, addr, max_sz, NULL);
> +}
> +
> +int load_ramdisk_as(const char *filename, hwaddr addr, uint64_t max_sz,
> +                    AddressSpace *as)
>  {
>      return load_uboot_image(filename, NULL, &addr, NULL, IH_TYPE_RAMDISK,
> -                            NULL, NULL, NULL);
> +                            NULL, NULL, as);
>  }
>  
>  /* Load a gzip-compressed kernel to a dynamically allocated buffer. */
> 
