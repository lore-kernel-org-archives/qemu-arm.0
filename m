Received: by 10.28.71.27 with SMTP id u27csp791619wma;
        Wed, 7 Feb 2018 06:34:07 -0800 (PST)
X-Google-Smtp-Source: AH8x2241XZhk1NmB4QP6c0ePr7bf400CtxlfWX7bX4GKpND0PZHSA9bWeqH4ZHRA4LShQQWMi6F9
X-Received: by 10.37.214.9 with SMTP id n9mr4176079ybg.73.1518014047366;
        Wed, 07 Feb 2018 06:34:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518014047; cv=none;
        d=google.com; s=arc-20160816;
        b=VahSiN7EV2HLjTzDSXgu3Idq/rKPh6bXfcBOj9J9N95pSwCT+hPPDlZAaZAGF983Cw
         iQzV9O+VjkApu5DELE6JzCWmNAK+PfWpmz4bVgWv09HJMJhHBYBuBJekDitz/ikpG78a
         m8DwTSZiepROPzKMMu2CL4j/nzD8U91gdI0lXSsLEt83tw7NslpEog9CfZ/pxY9N4eX4
         UVa2NCKS5cX43Sdm3K+xuYVMxuupYSQQ5CyAMtcmz41p8I0Qm2Z6TV4s1UQklaRqM+5P
         o/z1FPaxHL5uejGaQ/Fwc1/9Hw/lsFlx55cJHxykAD3dCIFZUy+4YMqQuN+kmt3WHN46
         lKww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=eySqKAWq707cc81GfGG7o/3v7t6zCKCOU0DNuZwNno4=;
        b=RkUC+rL4LsnKTkOeeQOw9c5VX6YmrFUkBDqQ1kGaybvyKz+TmyMxn6vilD4EQaFTrf
         Geio4irLi463pnGyLm2StBcTI8RQFU27OCE7vVmuBrfDihlpJsBHwZttBA8kWGMx/koX
         DsSwVVxoWrhfQF8xnjwSetNroqDQNVIXYW2MDh5/3Gx46s4burayFV0N8OXsJM/UcuTs
         KSmFgDIjTwUioTtU6AGjORLW6FPp/RWYVlMYGnwXpcC9DhPMk1TbFnkI6+bXUD2040c/
         pyXrZPhR2oTCTQNLI8RT8y6jEPxGK+ePnk+xM4FD8DZnw0PmvxfDvsX2+oeeDLZXP8pW
         i8Vg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=NXjY8DUZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o142si285893yba.186.2018.02.07.06.34.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Feb 2018 06:34:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=NXjY8DUZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45443 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ejQnW-0005ua-J9
	for alex.bennee@linaro.org; Wed, 07 Feb 2018 09:34:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56220)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ejQj4-0002m1-Er
	for qemu-devel@nongnu.org; Wed, 07 Feb 2018 09:29:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ejQj0-0003Aw-En
	for qemu-devel@nongnu.org; Wed, 07 Feb 2018 09:29:30 -0500
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:34433)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ejQj0-0003Ab-9h; Wed, 07 Feb 2018 09:29:26 -0500
Received: by mail-qk0-x241.google.com with SMTP id m130so1303268qke.1;
	Wed, 07 Feb 2018 06:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=eySqKAWq707cc81GfGG7o/3v7t6zCKCOU0DNuZwNno4=;
	b=NXjY8DUZf1GOuc5WvkBsXmaUU45faDNUw2PsMBLS+HIBcFdZYaXzkrw64uh3McJDbf
	KzPeiTNgW0c0AKtnk9EtkoBtkIiashhbAeeRbNg4jN9AbDV3xAdWx99f3ab1ojqduIdP
	u3tGOgBKei9uBN5shQncxm4UbXtn0GWGQlrBYQrcpdidYR9xR1UlGJ4f5X12kwKzQNff
	gJ+cOGWG1guLpZdhXcIbIUTcC+GcDVpkhzTRPbTVGd0drVxFgsO9QCErYfN2wYDSH4oK
	y/hjYbol2GmUov65cOwKhK6Aqfd6bXKYUbX9RdGvRwV4LgYRCTN36U7rAcO9uBs0Hie+
	NmGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=eySqKAWq707cc81GfGG7o/3v7t6zCKCOU0DNuZwNno4=;
	b=CCDS/Sc7HvFQH+rzzNoLg17rvZsorjZEXsWV8YRK891kJCmSVQekr5bhhLLS3g5A4A
	ymiRr6uwNPzlMP0ZOfKG6Eb+Bn8Cot/IQJ2zGuQ5hQH/CjGcwWscb6aBpqwFpSuCsDId
	bBDQXPrg97c7ysr52o/ptofseOlhwzcvleoFK0uWqUXZZWJasg4niqxxjrQvuWTp4sj2
	xNKWPvVsxNlUBO4st6mUUihlvXN06q3U3lf7MWppZgb70SD8TvhI5jdqmQFC+CnK+CQ2
	8qxzSlFffkF0TBsOrNy++Fh/ukwas8ad5wugUmVr9a8MpbQQSIW0mrl8wixn7HsamPaT
	5ZEQ==
X-Gm-Message-State: APf1xPCiK8jgbr/1pENKmwMVtfy4eOnvS5yz7c5lyjrT7nm0fx4VkubA
	ydu+SssCZfRIc7Lc6BHvpVE=
X-Received: by 10.55.100.68 with SMTP id y65mr9253504qkb.229.1518013765843;
	Wed, 07 Feb 2018 06:29:25 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id e26sm786900qkm.26.2018.02.07.06.29.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Feb 2018 06:29:25 -0800 (PST)
To: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org
References: <20180207042438.15422-1-andrew.smirnov@gmail.com>
	<20180207042438.15422-10-andrew.smirnov@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <c705ee13-168f-1e96-99cf-ef0028b3d758@amsat.org>
Date: Wed, 7 Feb 2018 11:29:21 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180207042438.15422-10-andrew.smirnov@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-devel] [PATCH v5 09/14] pci: Use pci_config_size in
 pci_data_* accessors
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@zoho.com>,
	qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SwUpmU5hkT2e

On 02/07/2018 01:24 AM, Andrey Smirnov wrote:
> Use pci_config_size (as opposed to PCI_CONFIG_SPACE_SIZE) in
> pci_data_read() and pci_data_write(), so this function would work for
> both classic PCI and PCIe use-cases.
> 
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Cc: Marcel Apfelbaum <marcel.apfelbaum@zoho.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: yurovsky@gmail.com
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/pci/pci_host.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/pci/pci_host.c b/hw/pci/pci_host.c
> index 5eaa935cb5..ea52ea07cd 100644
> --- a/hw/pci/pci_host.c
> +++ b/hw/pci/pci_host.c
> @@ -89,30 +89,35 @@ uint32_t pci_host_config_read_common(PCIDevice *pci_dev, uint32_t addr,
>  void pci_data_write(PCIBus *s, uint32_t addr, uint32_t val, int len)
>  {
>      PCIDevice *pci_dev = pci_dev_find_by_addr(s, addr);
> -    uint32_t config_addr = addr & (PCI_CONFIG_SPACE_SIZE - 1);
> +    uint32_t config_addr;
>  
>      if (!pci_dev) {
>          return;
>      }
>  
> +    config_addr = addr & (pci_config_size(pci_dev) - 1);
> +
>      PCI_DPRINTF("%s: %s: addr=%02" PRIx32 " val=%08" PRIx32 " len=%d\n",
>                  __func__, pci_dev->name, config_addr, val, len);
> -    pci_host_config_write_common(pci_dev, config_addr, PCI_CONFIG_SPACE_SIZE,
> +    pci_host_config_write_common(pci_dev, config_addr,
> +                                 pci_config_size(pci_dev),
>                                   val, len);
>  }
>  
>  uint32_t pci_data_read(PCIBus *s, uint32_t addr, int len)
>  {
>      PCIDevice *pci_dev = pci_dev_find_by_addr(s, addr);
> -    uint32_t config_addr = addr & (PCI_CONFIG_SPACE_SIZE - 1);
> +    uint32_t config_addr;
>      uint32_t val;
>  
>      if (!pci_dev) {
>          return ~0x0;
>      }
>  
> +    config_addr = addr & (pci_config_size(pci_dev) - 1);
> +
>      val = pci_host_config_read_common(pci_dev, config_addr,
> -                                      PCI_CONFIG_SPACE_SIZE, len);
> +                                      pci_config_size(pci_dev), len);
>      PCI_DPRINTF("%s: %s: addr=%02"PRIx32" val=%08"PRIx32" len=%d\n",
>                  __func__, pci_dev->name, config_addr, val, len);
>  
> 
