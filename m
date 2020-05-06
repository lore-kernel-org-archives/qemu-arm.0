Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp909692lfb;
        Wed, 6 May 2020 04:40:19 -0700 (PDT)
X-Google-Smtp-Source: APiQypI3oNAXHY770IC6NJrOslknM7Q9W7HiOleKJ39g1wgZ6o0UVixmLAN69fQ2cii+zKTAqxGq
X-Received: by 2002:a05:620a:10a5:: with SMTP id h5mr8424195qkk.388.1588765219449;
        Wed, 06 May 2020 04:40:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588765219; cv=none;
        d=google.com; s=arc-20160816;
        b=eD0WynQLeAFZCci3cLlSHblQqs403qYHZ7RpA/yCfeA4l3eqTprGGfejXp9R3RW6VL
         M1GLoAAaMMK7WUbBjIq4zNxbvUHTkKKQYXLO/UqCoUwsO0PBheDd8xDwx23lF+2cFcfz
         EwF4Shrs49XQVdTXFWQYeZdp8ujP6kMOWPj2Jh1gonAFE6KUwaFN8nuJogVND/u+Cw8A
         q+YLGDI9MPp1fyqWSaMfGyMdpWgmyuCOdCISGyr4VotokzuOeUoe3HLejOMPSCib3qdo
         zmx3XOODPXd3USX4tHBlUnCsBlGFJNol+kOGUho3hozIqY3joPA05q4oxOc4Hcra5r7r
         AHDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=KKHgCP+iHc+SKiHkbPN/nSorkFA7/T4CCDdYvJxSM0o=;
        b=plUBj/mnnYK6vpovafO/5e5e51HKuRt67NYJmbgAyNyqnT01vMT3EvAs5RggpNLLe/
         gxAhCQqlbqRZ6bOFW4JJusFgnTJS0B4SXlM37JemRBY7+P+4wEllRVNyuyQFez0lHMwx
         6f6hgcb+pMc+3aEEgf2DrBi89hwixwOK++7WEjCkYIZrHSxJNBkkyY+DxOFtwhb8LYKm
         sAjTrmlYu883SatDytJ9GD9npu3zgH4gAKX66m8KrgHzUPUUaPNTiPya/G2q9g5Y2Eof
         9PWJX+a2hxFQE0vS2m3D/1RU+AUM1AbG2Qb3XvTAGHfROslPQqZSGndopTwvzShAUkZ3
         7kOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=D8kedB2c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id v192si584424qkb.259.2020.05.06.04.40.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 May 2020 04:40:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=D8kedB2c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:54650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jWIPS-0002LR-Su
	for alex.bennee@linaro.org; Wed, 06 May 2020 07:40:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jWIOx-0001uM-Bo; Wed, 06 May 2020 07:39:48 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:44187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jWIOw-0000GT-Lw; Wed, 06 May 2020 07:39:47 -0400
Received: by mail-wr1-x443.google.com with SMTP id y4so1773382wrm.11;
 Wed, 06 May 2020 04:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KKHgCP+iHc+SKiHkbPN/nSorkFA7/T4CCDdYvJxSM0o=;
 b=D8kedB2c+9xqws30YyBhXuuAGviEaZYWuCWaWWc9QHYCHFWT1W5fBj3JTC7Ujx5S19
 dFpaa0rzfYp9k6gpB7I99qTvh8dtH4wpAVRHykpw8S5KSNy+plmIADWzyw1iqKVL/Kvn
 F0gwwid4fkNyzGa8kKEBJ3TvWOjlG2QkyfnUUDnLrU79AmlPAgWO+xhcVlbgt5Ruzgxe
 85QaIn1BXj4BvwuU/SkxcTNt5TOrx0GEHrd/6CmlY0uDVwWgG4qwD5SHyYGeR9RgUtp2
 BmyZzaNO79jfOESfawvz/0X89f4sU+wTAKuyVXgYTFanac9Dh5Y+KBsDf2wfObyCySsC
 ZE8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KKHgCP+iHc+SKiHkbPN/nSorkFA7/T4CCDdYvJxSM0o=;
 b=X3UPsci2FQyJ2/9U0vX70WFd+IUMUI5wuDkPxCBKQNrIkto3SZt05YHO0J4OG63+Ho
 n71I49OsSc/dV0AQcwuztiSLg4HgiVavWlLvBjKf5PS/JonvLKLnxHWWjQyc8UiwlwSh
 AmVz03AszuLtmLnuu4Ohs5DpPib+hG/D6kWjKbufTvlRDkpVaCPPTQvIlLqE2Sf9ZT8M
 R/X/lcih3VZOcvTce1Ufhg9PoE+Lw+OKjOltfkh8rNiBsbH1Du4nAb13M6YmE2hn8Fin
 NxIlLa6SkYJ4zGQpBvyEPVxtwDK/99oFOCPLzW39RP6MQT+ZMHs5jQt6MZMGQRykFI+y
 Ls/A==
X-Gm-Message-State: AGi0PuZgkDMY74A/fTp7PM53VhHV9YwW+96eKR5HJ4L5dzoRDykDMaUJ
 lS31gi9vsGDNHw1vY1z+AJk=
X-Received: by 2002:adf:fa92:: with SMTP id h18mr5667802wrr.260.1588765182558; 
 Wed, 06 May 2020 04:39:42 -0700 (PDT)
Received: from [192.168.1.37] (26.red-88-21-207.staticip.rima-tde.net.
 [88.21.207.26])
 by smtp.gmail.com with ESMTPSA id 88sm2389294wrq.77.2020.05.06.04.39.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2020 04:39:41 -0700 (PDT)
Subject: Re: [PATCH v2 3/9] hw/net/xilinx_axienet: Remove unncessary cast
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
References: <20200506082513.18751-1-edgar.iglesias@gmail.com>
 <20200506082513.18751-4-edgar.iglesias@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8022a626-f81e-a39d-f6f9-9259e2c99267@amsat.org>
Date: Wed, 6 May 2020 13:39:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200506082513.18751-4-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: damien.hedde@greensocs.com, peter.maydell@linaro.org,
 sstabellini@kernel.org, edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, jasowang@redhat.com, alistair@alistair23.me,
 frederic.konrad@adacore.com, qemu-arm@nongnu.org, figlesia@xilinx.com,
 luc.michel@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SJx7SqjeLqBF

On 5/6/20 10:25 AM, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Remove unncessary cast, buf is already uint8_t *.

Typo "unnecessary" here and in patch subject.
Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> No functional change.
> 
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>   hw/net/xilinx_axienet.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
> index 84073753d7..c8dfcda3ee 100644
> --- a/hw/net/xilinx_axienet.c
> +++ b/hw/net/xilinx_axienet.c
> @@ -918,7 +918,7 @@ xilinx_axienet_data_stream_push(StreamSlave *obj, uint8_t *buf, size_t size)
>           uint16_t csum;
>   
>           tmp_csum = net_checksum_add(size - start_off,
> -                                    (uint8_t *)buf + start_off);
> +                                    buf + start_off);
>           /* Accumulate the seed.  */
>           tmp_csum += s->hdr[2] & 0xffff;
>   
> 
