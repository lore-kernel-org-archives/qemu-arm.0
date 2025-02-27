Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp316953njb;
        Thu, 27 Feb 2025 07:52:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXY51beR6x3HEkf0N2U55tWIGtUaN/f/ADJ9CsCrc1Y8PbO6KvkGRUoqUMsRDNeCHvWd9qvVQnNep5ibw==@linaro.org
X-Google-Smtp-Source: AGHT+IE2hLBY9gmV1srTtMP5LagXjILBQ49lAllT+6PIdD9/t6VU3bWWjZ88BDpReL49BDxyNOOA
X-Received: by 2002:ac8:7f41:0:b0:472:2d4:5036 with SMTP id d75a77b69052e-473d8f3910emr54906201cf.2.1740671560575;
        Thu, 27 Feb 2025 07:52:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740671560; cv=none;
        d=google.com; s=arc-20240605;
        b=SwDrl+DZAuTDQKtqwsVrKC8JmN8xQBuaKi6A6zIqLJscPsG8i40ep75OdGHY4KqWyd
         uIvqyeqoVPzrsHP9ixfrtNPVAEaW6Poexy/srgbEOabzookbtqlqW3IIj7b0IFuMaTr/
         PDYnKfp3afbOqvgYq4wx5JA5U/W5vyLEmN2Sei/OXLcpgeATrXjXcRBk/k6ri/Ui+fkU
         3RgA7mT6eYaxQKsPQLn/4IEoQDV1WC9h5tpMv+iP0vZESeaWnsckQhIT4SjnPFWYrrT8
         4/TfI+/J5mL+ZbZaH9UlU6ZwToKtM5zaUSQbD088b34YAgFN434KcMjexlO8Pw/FQBix
         rWhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=MTO/pg8l5Vr26AuUe58rroRQkc9rGDddVuErXlIKOXA=;
        fh=Iazw4Q9WqhvM4EpVDS6gI12WWr4lYvGT0OcALJ+rqXI=;
        b=kAClq9L0MAGv0VoGRiCHhupQcE8aqHXKgsl1uzcryjf0i2eZwXUdgD1lhpgfF/av2M
         Pn5bUP1QUXp6QcSa6N/KT52Ff1/jq0tYYVQira4lWXAFFO5Zxhy60D7OM/fN3FOfTDu1
         zV0NhxBCrumi/HYJc19x0RsqfLK7FuVhSgAkSUXn2OJqgLRzEjOCeD90JKYdDUinwSRV
         Iz+H5quL7iG0DZroooc/6jEdKGYr74mbYcvY1ldz1EKtgfgmp8/fglO/+KThlRb6f+i4
         03IIeEY8FXiu5LEYnb1xDwnYQ2unqzZsSawyxM5JbHW5nNbV9vFYiiO60dkyFDY2OQBV
         d4PQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=regz246k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-474691aa9desi14753091cf.145.2025.02.27.07.52.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2025 07:52:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=regz246k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tngBd-0004vy-CW; Thu, 27 Feb 2025 10:52:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tngBb-0004s6-KI
 for qemu-arm@nongnu.org; Thu, 27 Feb 2025 10:52:31 -0500
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tngBX-0005b2-VN
 for qemu-arm@nongnu.org; Thu, 27 Feb 2025 10:52:30 -0500
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-e6087a8588bso1095331276.1
 for <qemu-arm@nongnu.org>; Thu, 27 Feb 2025 07:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740671546; x=1741276346; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MTO/pg8l5Vr26AuUe58rroRQkc9rGDddVuErXlIKOXA=;
 b=regz246kpBKPu2KAtI9e5inSCt9MLC112RYFU11h8Sx2fN2QXOUNTNwaGExA3opkhE
 IpwxEugMkCpBPEw88Jl4iRyMB6MhqSYqDyPmchq6U2oLClvcwRMaWYBM04C0uQMU2JwT
 bVd4LiFuG7jFLKjkJwrH3d4klm3h4zUpIhmmdZOkHm26TQdn8SQmEA8rMR0KKr+alt0O
 AjjQU7smky5FLpYdEt+2h1T/GLmDHE823WOC+4hE7NW44784teDavw8amCmjJXkBimlM
 xsbipLuj+OK8b+pmeSzmYGuF2Mrae8Uc9iugalCsqxEsh5QfBza7xrs7Q5nsrIyVjhKY
 Wxxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740671546; x=1741276346;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MTO/pg8l5Vr26AuUe58rroRQkc9rGDddVuErXlIKOXA=;
 b=M1JEji8GGQjiekDS2gFPmVBr7D8HXpaKuP/i1l8NbbqY0zlI0hRHXMfZUFEjQYfWV7
 DkEb+85uoxYkH2EWLAtsBkgLVvxRlGfr4Jc47ASRNd8JbcWRzoN4PmQ6lKuzrJKCOUCi
 Cwgd+PrQcAdw1V2U1zbh926IPWbFI3CHtnaljP6Tx//0D+EkLFUhQnWYWXOb3erTo/by
 M1fWl56sYeLpzR0ctG5DeSTK7N2uzNwEtkAEjPwLe9J5xODiOQhCOIeEHP2WQTEVWyHP
 IEj+FhhRecJfUOijyb1iiDSlZ4+GNKT68J/Sc1qhYj+HlBUaBwgADcw/XibCz2QqDHna
 ysOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVR2joLQF2+IeEDTgBIBbrc2SBEOa+2ei7kINPBDuMKrUfEGg/YYjC7TqxXcHeeUX+zBrL2rcXhzQ==@nongnu.org
X-Gm-Message-State: AOJu0YxtqUvxxT/lPiUkcU/FMXnhO9uz730H/uHpnzYZeMwzkZC4J6IT
 rWz0CS5wJBLmvbV38TVCcVoi61PAZJydX48ZZ81Fr0WIpYYjQ19yoDk7+J3l+Kx7L4q4SXppYWZ
 kJJODarNOkhdYx1mgb1JsDzkbbF3dL57swA8yNA==
X-Gm-Gg: ASbGncvyviB9Dd92eVAwPQAvUYsWdnxf3wq5RYDRgK7Rf0UwPK39TyVE8x+RqRcWCQJ
 gcdjQQAaWhw3wuavP1PrQujUPbct20pn4IFkBdvqFx9hy0oZVtmixM82I4uRAY6HEblppaIGUKP
 w8Jn88EBgC
X-Received: by 2002:a05:6902:72b:b0:e5b:33c2:5a03 with SMTP id
 3f1490d57ef6-e609eebe81amr3922277276.9.1740671545860; Thu, 27 Feb 2025
 07:52:25 -0800 (PST)
MIME-Version: 1.0
References: <20250227154003.1646017-1-venture@google.com>
In-Reply-To: <20250227154003.1646017-1-venture@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Feb 2025 15:52:12 +0000
X-Gm-Features: AQ5f1JrV_XZ-0UJSzn5b46MxdfzVyP4qP8KhXHWf71Xh1HxyeyCxw9u_KDbDEIQ
Message-ID: <CAFEAcA_wR-M3+BhZY0MFjv3OfoyL2gvukduvKZ6ksKwUKmdB6Q@mail.gmail.com>
Subject: Re: [PATCH] hw/net: npcm7xx_emc: fix alignment to eth_hdr
To: Patrick Venture <venture@google.com>
Cc: kfting@nuvoton.com, wuhaotsh@google.com, jasowang@redhat.com, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: CiuHDPsqKuMY

On Thu, 27 Feb 2025 at 15:40, Patrick Venture <venture@google.com> wrote:
>
> 'const struct eth_header', which requires 2 byte alignment
>
> Signed-off-by: Patrick Venture <venture@google.com>
> ---
>  hw/net/npcm7xx_emc.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/hw/net/npcm7xx_emc.c b/hw/net/npcm7xx_emc.c
> index e06f652629..11ed4a9e6a 100644
> --- a/hw/net/npcm7xx_emc.c
> +++ b/hw/net/npcm7xx_emc.c
> @@ -424,7 +424,12 @@ static bool emc_can_receive(NetClientState *nc)
>  static bool emc_receive_filter1(NPCM7xxEMCState *emc, const uint8_t *buf,
>                                  size_t len, const char **fail_reason)
>  {
> -    eth_pkt_types_e pkt_type = get_eth_packet_type(PKT_GET_ETH_HDR(buf));
> +    struct eth_header eth_hdr = {};
> +    eth_pkt_types_e pkt_type;
> +
> +    memcpy(&eth_hdr, PKT_GET_ETH_HDR(buf),
> +           (sizeof(eth_hdr) > len) ? len : sizeof(eth_hdr));
> +    pkt_type = get_eth_packet_type(&eth_hdr);

Maybe better to mark struct eth_header as QEMU_PACKED?
Compare commit f8b94b4c5201 ("net: mark struct ip_header as
QEMU_PACKED"). The handling of these header structs in eth.h
is in general pretty suspect IMHO. We do the same
"get_eth_packet_type(PKT_GET_ETH_HDR(buf))" in other devices,
so this isn't just this device's bug.

thanks
-- PMM
