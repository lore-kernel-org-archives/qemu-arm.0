Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2796147lfm;
        Mon, 29 Jun 2020 02:01:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6c44gTmSU/7v19Xua/VPKkoaL6pU2BN6jy43t/tgTQj0ykJlYIL6xks62SEWC3y0G8IEj
X-Received: by 2002:a25:d0ce:: with SMTP id h197mr25059044ybg.465.1593421301762;
        Mon, 29 Jun 2020 02:01:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593421301; cv=none;
        d=google.com; s=arc-20160816;
        b=asFNK9ifw+vUE0cOYoIOsld3stKfP9zXZJSh71pLJ+X9F6E+TZYuJEXrBWEIr2IgQR
         onMexOgMpVnJrVH9dZ+1ZAzdE2Ylt+Ur3MJBFDdg7RTp1e0gSk7WGzcth2T7bLll2Wrz
         +bQekPSAztiVhHV2lqM2fetwUqu6VUVJoVzr8LU7mpygul/a91dvhlvdFIlxeEtoTqsM
         DMTXZy16yDb7ZE+7GloXvbgxQRI8dyOBkRfiN2tun9BlnfN1Irbff5n0n3M+XWEcGvLO
         5Xv5zGucnB3HzGKAT2gCJ15DdWAhQEaM3ryEqZ57WJdQNN0J5d2za0wKBPOYR/cUznXP
         fldA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject:dkim-signature;
        bh=mUE8aci4sTKmJp1XWkkNp+havphEVYf8+XamSJws19k=;
        b=lp3TZYdP7X2nEPakC95lkPHEphYpDSlM64GsgAtCMh0CSnMWmsq+yttImJ1W1RG3rA
         yLmyDohyZdpM5T5ScbKQboPGN3Q+mVKVyuCtQR2MPShjRRGOvfQ3siCpfbtRy1ciaStF
         +4Pb/ESgwPM5CnqE5w8dAvyQdj13tFyDwNRESy/34FbyeNMZf0nJz9076pWxRQY8DLxY
         U0JjBBduJkhjS3byMApSAo2ECbgB2W1WOSJ8CYz2BXncAMXX+wjyV8gjnJTqyuxLFlBb
         OWwyIqnpYBspQaJ0ISfOpGh0WwOm1fIhkei1GsVF4KMtvMv40em8+rT4UmQTYx06pEVJ
         ukZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=DtNz7fM0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d11si31960556ybs.21.2020.06.29.02.01.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jun 2020 02:01:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=DtNz7fM0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jppfZ-0001D7-1o
	for alex.bennee@linaro.org; Mon, 29 Jun 2020 05:01:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jppfO-0001C5-HT
 for qemu-arm@nongnu.org; Mon, 29 Jun 2020 05:01:30 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:45818
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jppfM-0002Uw-Rz
 for qemu-arm@nongnu.org; Mon, 29 Jun 2020 05:01:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593421287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=mUE8aci4sTKmJp1XWkkNp+havphEVYf8+XamSJws19k=;
 b=DtNz7fM0B9xHdCTjERZCxC5zZaSNIhU5kDdqSP+q+87wQeUgj48i4jGm1Pucq0QFb3jkBT
 XhVYAByl4M7XJK2oiB/5b/D5jySddv3bGPBy9G+8xDWyGma6pq2NRu5hxFCaK1lXblWhRd
 zKKErmsGX+XH1T3Nep3Jrb6k/huZ0AE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-L-kteRpGPp-gr68KcrH7Kw-1; Mon, 29 Jun 2020 05:01:24 -0400
X-MC-Unique: L-kteRpGPp-gr68KcrH7Kw-1
Received: by mail-wr1-f70.google.com with SMTP id c18so8809806wrp.15
 for <qemu-arm@nongnu.org>; Mon, 29 Jun 2020 02:01:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=mUE8aci4sTKmJp1XWkkNp+havphEVYf8+XamSJws19k=;
 b=hs+R36qtMdrU05Hs44mD6KSXzvA4lpFSKnaHXJIynohjzfoUDwEvjxuyNPUPNxJNTN
 IzWKoLb/8tGR+DqPxTcGf3VfvKCQKaSkO4TRXq9FOGVCHxVTVKnzHkCKuIZSJJYeJs5J
 KMTeLmtWyKPf5I/9Q127q188eMf5jNlIk/daThON1aWgyDyjhhaCN6aQ1mhaUG1KzyeK
 FmxvmOFkf3nIwNrG3EasBpVvuoT0GqTMcEoGG0YYxALSs/reJyT03WW03GLq47e1loks
 jj6V94hevB8H2sFKoPr/aAbUL+fXxSE0UpXV1xi6zb9kPdPx9xR8+B5Ad2SgNgPrq8m0
 vvpw==
X-Gm-Message-State: AOAM531FD9bAbO4+MmyRp2aBCx9knB3D12mOdlsgxrgX0Yo9etU7jovf
 j9dPRQcaS7KMgzDlzUS8823b7yZ9ikhQ/jvYIsv0ZYdUByfR311p+iRDCKju5x4SY4hltC2HrFE
 ++8X5XfVauU+p
X-Received: by 2002:adf:ab4a:: with SMTP id r10mr17307383wrc.103.1593421282900; 
 Mon, 29 Jun 2020 02:01:22 -0700 (PDT)
X-Received: by 2002:adf:ab4a:: with SMTP id r10mr17307341wrc.103.1593421282622; 
 Mon, 29 Jun 2020 02:01:22 -0700 (PDT)
Received: from [192.168.1.37] (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id h29sm50731973wrc.78.2020.06.29.02.01.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2020 02:01:21 -0700 (PDT)
Subject: Re: [PATCH 06/17] hw/misc/max111x: provide QOM properties for setting
 initial values
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200628142429.17111-1-peter.maydell@linaro.org>
 <20200628142429.17111-7-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <ff3227d3-2648-3a4b-824a-74f8c41bdd78@redhat.com>
Date: Mon, 29 Jun 2020 11:01:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200628142429.17111-7-peter.maydell@linaro.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/29 01:10:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: Alistair Francis <alistair@alistair23.me>,
 Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TUzpzIo7bfS6

On 6/28/20 4:24 PM, Peter Maydell wrote:
> Add some QOM properties to the max111x ADC device to allow the
> initial values to be configured. Currently this is done by
> board code calling max111x_set_input() after it creates the
> device, which doesn't work on system reset.
> 
> This requires us to implement a reset method for this device,
> so while we're doing that make sure we reset the other parts
> of the device state.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/misc/max111x.c | 57 ++++++++++++++++++++++++++++++++++++++---------
>  1 file changed, 47 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/misc/max111x.c b/hw/misc/max111x.c
> index 2b87bdee5b7..d0e5534e4f5 100644
> --- a/hw/misc/max111x.c
> +++ b/hw/misc/max111x.c
> @@ -15,11 +15,15 @@
>  #include "hw/ssi/ssi.h"
>  #include "migration/vmstate.h"
>  #include "qemu/module.h"
> +#include "hw/qdev-properties.h"
>  
>  typedef struct {
>      SSISlave parent_obj;
>  
>      qemu_irq interrupt;
> +    /* Values of inputs at system reset (settable by QOM property) */
> +    uint8_t reset_input[8];
> +
>      uint8_t tb1, rb2, rb3;
>      int cycle;
>  

An eventual improvement is to make 'inputs' a class property:

  MAX111xClass {
      SSISlaveClass parent_obj;

      unsigned input_count;
  }

"eventual" because from a QOM point it is cleaner, but we'd have
to add more boiler-plate casts, so code less clear.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

