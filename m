Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp5006963wrt;
        Mon, 15 Oct 2018 15:06:10 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63jw46q6NnT+h5uTYmfEjromP8hf2C/Ce1ZAP2OfblZMMx8VeqTkYyIZOVqMNMKldvkG6CO
X-Received: by 2002:a0c:a983:: with SMTP id a3mr2918757qvb.53.1539641170654;
        Mon, 15 Oct 2018 15:06:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539641170; cv=none;
        d=google.com; s=arc-20160816;
        b=dAqbEFGb9a5tYLZ6iSFMv2mFb9slaX1ENVT4LCAf/j6VHTcX/fIhIx+rW6kDPBFUDW
         a0mdOtTFtzsArRgsBfwn9XW1Ix61FvWeEWDWyGD+LveFYDO9qKywEbi2YAHjJS+D0Y7b
         wNHainYz2kZSJfe+KU1fy1XBRJN4hPPy/73pzH2KS8GT4W7pDUYp81f5NXXrLZp5rtxk
         IcFEkpqRPxOlXVhUGl8S3wbuFHqp8dkVcH+YmNDuGEjId+J7jNWkHX8x1bZv4het4MkY
         htwH9dzOln9CcHfQFHV+U4bjUVgG5jpLYmFwa5zxXSmxIW5Iqoac2X2loC99+Y52IrXU
         fGzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=WXuHsAUJuUhz0qKa1D/CFRNn6XslFfvDQ12PzroYfvc=;
        b=nWh2Xf/XxGaq25EL/Nepu18KIIo6mFWv3Ne7OksFXISXdd0xUj2grj06AaA441w1Vx
         hI+BXApvOhBzJDDw6aBFBXb6q5PcVW2fBsUfudR+ogN1qh922jGcAsuTiuvDbjgjIiHH
         BXn6Beld8UFGiHOTQ9MNWJRFM+xrFVXlrIuIMB+BF0wS5mbNXe2SdTCEv7ilduKCvc+j
         r9vZQ5/2gmxhYR76SOnExDRyWYc5GXqqNGpuxdhUewzKd9siA61aXgY64PqHWLTIxRMd
         oduUX9HXgsHH7DX/dzf8fXUl3LcLO8BL6TCF24FOIfWxTcwIe35wWglr4tzaroqTtweW
         Zr5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 7-v6si2699380qto.215.2018.10.15.15.06.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Oct 2018 15:06:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55051 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gCB06-0003Dq-82
	for alex.bennee@linaro.org; Mon, 15 Oct 2018 18:06:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42153)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gCAzv-0003DJ-Ms
	for qemu-arm@nongnu.org; Mon, 15 Oct 2018 18:06:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gCAzs-0001OL-J0
	for qemu-arm@nongnu.org; Mon, 15 Oct 2018 18:05:59 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:44365)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gCAzs-0001MC-A3
	for qemu-arm@nongnu.org; Mon, 15 Oct 2018 18:05:56 -0400
Received: by mail-ed1-f65.google.com with SMTP id z21-v6so19316029edb.11
	for <qemu-arm@nongnu.org>; Mon, 15 Oct 2018 15:05:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=WXuHsAUJuUhz0qKa1D/CFRNn6XslFfvDQ12PzroYfvc=;
	b=J2LpBLLBnXVj30FBD14q2IMc92HuP9Lp01oYeMuaSff0SRmvSm6l3tXhTGCTLhUNOn
	x9fy/VyyqwTRgqVSfw+TxWUyqjfk5JBY5rSWM2nEsIKy0qPvWUfEbmGgksqsBeyX5yqw
	4FCOgc+ggp6Aj90qoYPHjoSKnOfPALYiVkSV73a/jQsfKrU/S37eJSR+lzaPVoAC4pIw
	Vih3vnsSm2fb1Vr9SHr2yLDdAGyuzXruTAV+OqZDCQ6J0gioqWVafPK1RILdIhH2M8xr
	WQwYbDgpG9fYPEcvPLWVloMz4jLJ88arQREqN8MdS2k/1gtmiD4e5W8wHFBZ36QiYzk5
	wWXA==
X-Gm-Message-State: ABuFfohyqHjVCtT6UkLf97Ax1gudNU0ATqzY4E9QR21aN+vjNqy6sdOj
	l6OMAazzBA/WaY7wTbem00Zi3Q==
X-Received: by 2002:a50:92fd:: with SMTP id
	l58-v6mr27061217eda.200.1539641154223; 
	Mon, 15 Oct 2018 15:05:54 -0700 (PDT)
Received: from [10.149.130.61] ([83.135.21.186])
	by smtp.gmail.com with ESMTPSA id
	f39-v6sm5226053ede.75.2018.10.15.15.05.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Oct 2018 15:05:53 -0700 (PDT)
To: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <40eb19fb56b24e10a5eaa99ccb78aff6@dornerworks.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <73dcea68-2342-63b7-9691-a151f00a42e8@redhat.com>
Date: Tue, 16 Oct 2018 00:05:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <40eb19fb56b24e10a5eaa99ccb78aff6@dornerworks.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.208.65
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm/boot: Increase
 compliance with kernel arm64 boot protocol.
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
Cc: Andre Przywara <andre.przywara@arm.com>,
	Julien Grall <julien.grall@arm.com>,
	Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yvdWuRUc0nWz

Hi Stewart,

On 15/10/2018 23:26, Stewart Hildebrand wrote:
> "The Image must be placed text_offset bytes from a 2MB aligned base
> address anywhere in usable system RAM and called there."
> 
> For the virt board, we write our startup bootloader at the very
> bottom of RAM, so that bit can't be used for the image. To avoid
> overlap in case the image requests to be loaded at an offset
> smaller than our bootloader, we increment the load offset to the
> next 2MB.
> 
> This fixes a boot failure for Xen AArch64.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
> ---
>  hw/arm/boot.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 20c71d7d96..559ddbcd53 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -919,6 +919,16 @@ static uint64_t load_aarch64_image(const char *filename, hwaddr mem_base,
>          memcpy(&hdrvals, buffer + ARM64_TEXT_OFFSET_OFFSET, sizeof(hdrvals));
>          if (hdrvals[1] != 0) {
>              kernel_load_offset = le64_to_cpu(hdrvals[0]);
> +
> +            /* For the virt board, we write our startup "bootloader" at the very
> +             * bottom of RAM, so that bit can't be used for the image. To avoid
> +             * overlap in case the image requests to be loaded at an offset
> +             * smaller than our bootloader, we increment the load offset to the
> +             * next 2MB.
> +             */
> +            if (kernel_load_offset < FIXUP_MAX) {

I don't understand how this is related to FIXUP_MAX...

> +                kernel_load_offset += 2 << 20;

You can use += 2 * MiB; which is easier to review.

> +            }
>          }
>      }
>  
> 
