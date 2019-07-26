Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp11774854wrv;
        Fri, 26 Jul 2019 04:10:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyCW/5ARmH3dpJ6ttsxTHV62V1Nc2rVhv4Uoxxg/h37gErVdFD2kAPIrnZeOD1Ofb/bIIuG
X-Received: by 2002:a17:906:3018:: with SMTP id 24mr73810242ejz.187.1564139420036;
        Fri, 26 Jul 2019 04:10:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564139420; cv=none;
        d=google.com; s=arc-20160816;
        b=G1PGCpkRjJXSWdC7Rd69jNLoxopZ36ai3qtqH5SEweMTM4BGDchmNT1SVwG/5xV7kJ
         wwKr5jmXa87bms8qDOST0sOIJaOk92XB9Dd+6vPYaEXswgR8C8q1eyZXDZ14fdI//gC2
         O5vsxY7mXI740gASImBNvovn+TJnTMQ4rxp9aM3UpwTtsSLWdj87kAcejsunjD2sqLye
         TkeSBQNTmaBVXBhMEvQd6uB88YCMW6N6wfiCoKkWKTM+QLfTxlGx04o/EUe/Hb3k68UM
         VWZafK3+odu31XpzPPuh4IlpJQyZIJUvhKMObbX5nj/ujjfGDi3ymzI2cuQ+oZIxyLWb
         Lzfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=ounZOwkyFGqC14lRdJqbAGk6COTUDq2tI4pk26+DExo=;
        b=VDBLkiy2uJ/a8et6ZIopViwnApC5Y2cucACP4CJl/fHLZXJla9KkSHxrvp2T54RSJM
         ID987jrC7p7XWMPZZpWjUKwlb7I0VetiZlLhtwLY4n4ozaU/IFRj1X0TnqWNIFvLTQm/
         gZN7phoSKEwi+bcUR41sUu7WoALKP/wphCmiQD9tnUMdQ9bfI38Um7JRtkJdCdW9N/hJ
         ibzMZq4PhYTlehpWv9u31X/WmMeYqndqjOiZ24CFk2DpSXVE7xFM22aZixQepCLheIof
         r+81t7GVhIqgRafPZCoEKzHScwkFu0luqnpzmVOqK7Bbd8UyMJ64i1XIp3lBaPPj3pn+
         1J3w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o21si11927978edc.65.2019.07.26.04.10.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jul 2019 04:10:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hqy78-0002fh-Tz
	for alex.bennee@linaro.org; Fri, 26 Jul 2019 07:10:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57146)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hqy73-0002T7-Va
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 07:10:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hqy6z-0001Uw-0T
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 07:10:10 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40417)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hqy6u-0001FX-Kq
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 07:10:06 -0400
Received: by mail-wr1-f66.google.com with SMTP id r1so54002543wrl.7
 for <qemu-arm@nongnu.org>; Fri, 26 Jul 2019 04:09:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ounZOwkyFGqC14lRdJqbAGk6COTUDq2tI4pk26+DExo=;
 b=My3kVqZTbxB/KmIZgAxSc42e11MYxNPO7Ihxmqx19/sXFP050ONx5NzZxInXmDB/0F
 0aRIV5ifzllc17KYbIyrldpXqA3K/w6XIh45ZTOFdK663KV5DqcJbjXOtqksqPiDlwap
 0mCXjGE/2gadgW6kQ82NgOTPkumy5KzsEol9yNhKDRp5Koj+wjuSKZFICUaScE8LfE6h
 Hs4ts+m9sHhG57teoesixsJYT3eQZKwcXSyM56BT0VhoOMoUV5VXyei1EClVXXVcYWm8
 mZ+GSmVc1+StC3tY3rYRAJrRxMlv32+n3bi+K3jK9Yk06etuUyd8CRRFIO/ruxzjc4Y5
 ZLOA==
X-Gm-Message-State: APjAAAW7LXm/xwpIuBbZWsoagZ08TM9jE9pBVCiod4q4cNK1K+WLWP5O
 8iobsLzOqVp1lyhm8+FrtmvDJw==
X-Received: by 2002:adf:ed8a:: with SMTP id c10mr104400859wro.33.1564139385344; 
 Fri, 26 Jul 2019 04:09:45 -0700 (PDT)
Received: from [192.168.50.36] (243.red-88-26-246.staticip.rima-tde.net.
 [88.26.246.243])
 by smtp.gmail.com with ESMTPSA id 4sm120347700wro.78.2019.07.26.04.09.44
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jul 2019 04:09:44 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190722151804.25467-1-peter.maydell@linaro.org>
 <20190722151804.25467-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <4f431fd5-bd06-c784-4cd8-fd53d8ee9aca@redhat.com>
Date: Fri, 26 Jul 2019 13:09:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190722151804.25467-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-4.1? 1/2] hw/arm/boot:
 Rename elf_{low, high}_addr to image_{low, high}_addr
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zTu5yn2JEhAw

On 7/22/19 5:18 PM, Peter Maydell wrote:
> Rename the elf_low_addr and elf_high_addr variables to image_low_addr
> and image_high_addr -- in the next commit we will extend them to
> be set for other kinds of image file and not just ELF files.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/boot.c | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 1fb24fbef27..b7b31753aca 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -986,7 +986,9 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
>      int kernel_size;
>      int initrd_size;
>      int is_linux = 0;
> -    uint64_t elf_entry, elf_low_addr, elf_high_addr;
> +    uint64_t elf_entry;
> +    /* Addresses of first byte used and first byte not used by the image */
> +    uint64_t image_low_addr, image_high_addr;
>      int elf_machine;
>      hwaddr entry;
>      static const ARMInsnFixup *primary_loader;
> @@ -1014,24 +1016,24 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
>          info->nb_cpus = 1;
>  
>      /* Assume that raw images are linux kernels, and ELF images are not.  */
> -    kernel_size = arm_load_elf(info, &elf_entry, &elf_low_addr,
> -                               &elf_high_addr, elf_machine, as);
> +    kernel_size = arm_load_elf(info, &elf_entry, &image_low_addr,
> +                               &image_high_addr, elf_machine, as);
>      if (kernel_size > 0 && have_dtb(info)) {
>          /*
>           * If there is still some room left at the base of RAM, try and put
>           * the DTB there like we do for images loaded with -bios or -pflash.
>           */
> -        if (elf_low_addr > info->loader_start
> -            || elf_high_addr < info->loader_start) {
> +        if (image_low_addr > info->loader_start
> +            || image_high_addr < info->loader_start) {
>              /*
> -             * Set elf_low_addr as address limit for arm_load_dtb if it may be
> +             * Set image_low_addr as address limit for arm_load_dtb if it may be
>               * pointing into RAM, otherwise pass '0' (no limit)
>               */
> -            if (elf_low_addr < info->loader_start) {
> -                elf_low_addr = 0;
> +            if (image_low_addr < info->loader_start) {
> +                image_low_addr = 0;
>              }
>              info->dtb_start = info->loader_start;
> -            info->dtb_limit = elf_low_addr;
> +            info->dtb_limit = image_low_addr;
>          }
>      }
>      entry = elf_entry;
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
