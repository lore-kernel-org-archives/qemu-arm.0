Received: by 10.25.221.202 with SMTP id w71csp3331711lfi;
        Mon, 7 Aug 2017 13:59:23 -0700 (PDT)
X-Received: by 10.55.79.77 with SMTP id d74mr2623604qkb.183.1502139563516;
        Mon, 07 Aug 2017 13:59:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502139563; cv=none;
        d=google.com; s=arc-20160816;
        b=Hb2pdvRQc86xtynYOTkmFNJz4iNBkhCGevqDtvCb9TRrblnH47snnHELpeMyoBKZwM
         NRR0YzPwPvLDVQKtRb2tJwU7AM/w0sRiKcpe/S1bgPc3PkqlG99xR9E4u+WgjEczPhMQ
         GFG4UldWs+oziZCpeMah2bFX6A9vbfk7S6slMiak0/iIVnsQ7nx1K5RI8Arj274yLLNx
         iWyk8qJ+7GqghGRtJ9UWVeQNNKPxbcun5vLgmdcFAsnjZTPU0f5+Kraliz3jHIOQ6iWn
         mq+JAyeuot0l8oeziK8hU29jhCJVJRIQhlB3gfZegcuRvEr2fFWtUQemeOO4iMW5MAkG
         YEGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=j/sUL0k2MWSH4SoGsDtT+wceoeOcecB2CSHMT4nDxaQ=;
        b=VZfVdzyHT3lg9Ku1gr8OtEby1NWzs5GGWuLOJrUdsL6nUWEx+f38QdG3fVKvVu7tiM
         Epc1T5eqp1v1y+W2NBGb6Eyd811yf1g4PA9pKDEnDYxbSNtQm7GO2HmxkCAKSoyvLdOJ
         YAdnJAdSpaQhi9wrfNH65FGqn5pt6VMp1P0LvBeC1Zgmhm9kpVgckt2JiS4tjK5XCiqi
         B00UfJ2cVnVcOoJsfqZ5wv2/WglV/H80LCleL/T/DAQmCwiNWAhUlkZBXsB+/hFwi/YD
         2gSiwiz8B6NuY9zvbdlycOXlBTl+8bi9pBvoxAuj3k6QUslHIGBdMJKi/jnkt9mTUJTw
         PhPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=OhL3UGF4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p41si558790qte.548.2017.08.07.13.59.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 Aug 2017 13:59:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=OhL3UGF4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39547 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dep7Q-0001y5-T8
	for alex.bennee@linaro.org; Mon, 07 Aug 2017 16:59:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58789)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dep7I-0001uR-N2
	for qemu-arm@nongnu.org; Mon, 07 Aug 2017 16:59:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dep7D-0006Oj-Se
	for qemu-arm@nongnu.org; Mon, 07 Aug 2017 16:59:12 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:38894)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dep73-0006GF-In; Mon, 07 Aug 2017 16:58:57 -0400
Received: by mail-qt0-x244.google.com with SMTP id p3so1653805qtg.5;
	Mon, 07 Aug 2017 13:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=j/sUL0k2MWSH4SoGsDtT+wceoeOcecB2CSHMT4nDxaQ=;
	b=OhL3UGF4v4986oCWcVdLz8o5X4Gp3ktbzJl8G9JAKfzqjtRQ2cLetpZIMJBDO4Z5EW
	h2mJVXkaKfc4DY44DwL6nOLm+hGYLSYUIutZZVF+yyql5d+STgWAkUxzIigAO8hqPMcF
	vyaOgkLdhmP28lOhGTOWf+rR+xsihLjBzUD2VLXU1BTfB/6cawHU1vMxBwfJMIqN0/dn
	OhT9q3C0U9bf/jRWyEF9klYMSrlVwNngLUulyA1xLXccUUtlJGERveEbS/TGjheTSrom
	gb7WMVkmHsUPZ3VMWiLYat0ZQ7wn/lip2+3EhX+tk+IL1ufnV0A/VMt9s7Sr61C9ycbZ
	aiGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=j/sUL0k2MWSH4SoGsDtT+wceoeOcecB2CSHMT4nDxaQ=;
	b=V+2Sgth4mvv/fxgNzPL66/lkjOJdTpk46lNVZ2ztZMyKFMXd3BWJ4OacdAK9d5674Y
	mD4HXxUEDtp3OTdic2HzkvEyj8U3w3C0bu+yktRpcgnQrSCmDsNbsNs1nbYbpvU4vDJD
	BxM0fRvymOWTUexQcmI0FkHWp3m8PrMRcODCyIze1CutzqL2YzkG8tL22v4EA6/GIgYj
	JoyMyitFMX10vU0QzITwEa5r39YtFOa+S1I6saylYGRCtuoTBxHnDPpA71peEm69AKzv
	mh+JE8CUPFjYIQYIMr7dAGBZLz6Gie4SY/6uYsaxfS1dvVBQLEoO7nOurvrIYrTHIZP8
	eeOQ==
X-Gm-Message-State: AHYfb5iPT/HsaNfXEpcOuLO8Ae97CjXAWPk0bmQXDysciS7qGXE9U48U
	2uKi9MbsSziEGQ==
X-Received: by 10.200.3.195 with SMTP id z3mr2679325qtg.185.1502139536919;
	Mon, 07 Aug 2017 13:58:56 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	z30sm4175935qta.84.2017.08.07.13.58.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Aug 2017 13:58:56 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1502116754-18867-1-git-send-email-peter.maydell@linaro.org>
	<1502116754-18867-3-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3913adf1-78be-e668-57d6-5f9ba2910962@amsat.org>
Date: Mon, 7 Aug 2017 17:58:52 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1502116754-18867-3-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-arm] [PATCH 2/2] loader: Ignore zero-sized ELF segments
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
Cc: Hua Yanghao <huayanghao@gmail.com>, patches@linaro.org,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +a2ieSTxdIGA

On 08/07/2017 11:39 AM, Peter Maydell wrote:
> Some ELF files have program headers that specify segments that
> are of zero size. Ignore them, rather than trying to create
> zero-length ROM blobs for them, because the zero-length blob
> can falsely trigger the overlapping-ROM-blobs check.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>   include/hw/elf_ops.h | 24 +++++++++++++++++-------
>   1 file changed, 17 insertions(+), 7 deletions(-)
> 
> diff --git a/include/hw/elf_ops.h b/include/hw/elf_ops.h
> index 2e526d3..d192e7e 100644
> --- a/include/hw/elf_ops.h
> +++ b/include/hw/elf_ops.h
> @@ -451,14 +451,24 @@ static int glue(load_elf, SZ)(const char *name, int fd,
>                   *pentry = ehdr.e_entry - ph->p_vaddr + ph->p_paddr;
>               }
>   
> -            if (load_rom) {
> -                snprintf(label, sizeof(label), "phdr #%d: %s", i, name);
> -
> -                /* rom_add_elf_program() seize the ownership of 'data' */
> -                rom_add_elf_program(label, data, file_size, mem_size, addr, as);
> -            } else {
> -                cpu_physical_memory_write(addr, data, file_size);
> +            if (mem_size == 0) {
> +                /* Some ELF files really do have segments of zero size;
> +                 * just ignore them rather than trying to create empty
> +                 * ROM blobs, because the zero-length blob can falsely
> +                 * trigger the overlapping-ROM-blobs check.
> +                 */
>                   g_free(data);
> +            } else {
> +                if (load_rom) {
> +                    snprintf(label, sizeof(label), "phdr #%d: %s", i, name);
> +
> +                    /* rom_add_elf_program() seize the ownership of 'data' */
> +                    rom_add_elf_program(label, data, file_size, mem_size,
> +                                        addr, as);
> +                } else {
> +                    cpu_physical_memory_write(addr, data, file_size);
> +                    g_free(data);
> +                }
>               }
>   
>               total_size += mem_size;
> 
