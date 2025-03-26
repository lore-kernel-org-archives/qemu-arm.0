Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp3124956njc;
        Wed, 26 Mar 2025 00:06:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXHCAoHFp8wNf7qvVr8TE4abEJj7Vrq2Dx46mCvAmzfSPLLynA1X4rFmd+MnXbzOeVj9SK+2WBqgbusiA==@linaro.org
X-Google-Smtp-Source: AGHT+IFBfVde9X+BomUWFZ+/I0naHKwA3g4+kUaj96TuJUcDKeh1KYDAltFvQTw+fjoXWFxO4a28
X-Received: by 2002:a05:620a:2406:b0:7c5:5f38:ba4b with SMTP id af79cd13be357-7c5ba13af52mr2920486885a.10.1742972790047;
        Wed, 26 Mar 2025 00:06:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742972790; cv=none;
        d=google.com; s=arc-20240605;
        b=SF7TG/Mle8DXG2idZwWThyuAeQuZQA3KJVU3ebV6+4H82glf2syJCKDh+LrlYflxRH
         BuKXdkpZGmkiz/Ue7ndm18G6O4NAGTfQHcWPxGKMnqUg8BqNr+oAmeB4i3MIJHnTc7aU
         i3Gj4im2hUaRRMLkkORJ3bcJJUIpsZdxUPp5OitvbsN54QRc2wg7g9n95Z4retktLCmK
         VEQS57QtJAwIOALORPtTtsLGTHJCDkcfhUXs0nJeRUjm0p8G4kYyj46FYpeoWRn0mocr
         OTWbKh3EFTkkYKpLL1fvTT59i2B08DYhhnvWtr7RGGnJkvdKuu8bPZcWzr8WxoPigVVn
         RnTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=drJ9+jtEwKa7/rVBzT5hbtbRJRAyz2Nu3xD0dZ9wXoI=;
        fh=mmt0IsjY/VjpUD5+kO1pCVmWfCjLhUZtR2FJgtOG4/c=;
        b=NCTbDVPPIjFy1AO+It77nIVEUbHYnrnFteYghO8UhUtTgX/ZFo96sLLERt9EHuCHtg
         u9UATAngLXA4UU2O0GflYrLnaT/kjDO3T5TT+MgXAnqrlllBeJESFksFqNTjQs9Z5H6M
         iMH3bILkDZbcQDdIjuGQ7FeYmRU9A+vGbMHyqT++XXx5oIFDkAYR0lNWMfdpBjYD84/Z
         KN2Y3r/lsI8wxp+36w4BNECnjza2qYCEDwJ17RFmOkqAoODqTVj1MHPDO5RJF13N0aLR
         cmt6sHi/c6MabdMTd4XWIqTXyP8Q/AGVV1Z3/yi64YP1dJkI3nXcJb7+UBGZYMGMHbdi
         uUyA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=H5A5ALq4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c5b9362a85si1080720785a.568.2025.03.26.00.06.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Mar 2025 00:06:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=H5A5ALq4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1txKqH-0002Wo-8J; Wed, 26 Mar 2025 03:06:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1txKqF-0002Vh-Bh
 for qemu-arm@nongnu.org; Wed, 26 Mar 2025 03:06:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1txKqD-0008NJ-QJ
 for qemu-arm@nongnu.org; Wed, 26 Mar 2025 03:06:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742972781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=drJ9+jtEwKa7/rVBzT5hbtbRJRAyz2Nu3xD0dZ9wXoI=;
 b=H5A5ALq4K14+D+axp9Nq+PcHnAgfBAL2CqMhzz8vGgJiHr2wT7TviLuWe2/rc0CI0VzxCC
 ZqqiBpQmd8mffjS0R8bukG/EkRfgUgol8zzgCjuP/8Cr9hulfdhtDNMjNv/zRacEJGZgiv
 XyUbTd+Qm3LwyyjHyUO8ph1B1sApG8Y=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-3-8AuT8q5_NhWc2spDo1cdfg-1; Wed, 26 Mar 2025 03:06:19 -0400
X-MC-Unique: 8AuT8q5_NhWc2spDo1cdfg-1
X-Mimecast-MFC-AGG-ID: 8AuT8q5_NhWc2spDo1cdfg_1742972778
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-39ac9b0cb6aso1010292f8f.2
 for <qemu-arm@nongnu.org>; Wed, 26 Mar 2025 00:06:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742972778; x=1743577578;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=drJ9+jtEwKa7/rVBzT5hbtbRJRAyz2Nu3xD0dZ9wXoI=;
 b=QQ1I6NgsvifiA5uetQvSRq39uPJXEV8t+LhHgvaKLHOXeP2Ch6c6LsqgjVSkwyQw9I
 xUvVPvYGImn/r+ZqD7unbFMC6HydN82BTZxxw6le98IKeBGjENeOdlKy/CAvsAnRNfWK
 NnEpLL7Ht+YC3nH2HvTWK/Fbu5IriqbPvKlDBtr1TiLxA2fgt6ig8SbBCvZPaowyjNo/
 biwRjuvjUXN28FvbQ91pKwtdawV94vxBdLFiwkMcQKdB3bJEh57T2/psNKDn50R7iBsh
 IwnLcqLS6lwo4AYo3zWvxWMGy4FSESPjOPQK9ih8HOT5bt72E6rr7oMi9D1cG+Gv11NR
 iMUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOvO2nyxjR00B8FxGOgsyUUjuGduDc9sSOzcN/WNVVi7Pya0akk5KNEu/oIQNAWMQsCw5G5hmorg==@nongnu.org
X-Gm-Message-State: AOJu0YygcpLwdCQBtOhv+fYHs98FlGN6SIYx3UjKZkqdFnCv6Vcy3cvG
 8/n+q0KNJR0Opykrp3s2aIoTxikbRMYPmXSwpZXdUz2aSDUMEnSRHd7KnFiGEj32qEoYcnPRmym
 RL/E8qHYoeDn33IEW9ms9vePWgxcxzXNW/qQ4J85gUiiRLFFiCw==
X-Gm-Gg: ASbGncsxT83pshXupxEpNm5NUlVd04Kr7Fpphn/nAdLDk9m6QKx0it6LIPzp+EKRtGB
 cwmOt5s2gC5kbuyZy1vZsJor/aA5TiQplbC3ObyL5zNFOPbdIWljAn5UdQ+ZfvOEtfrQybp2vXx
 /2niPLAbWw9joKPDeCrWaLv3GiCvn1NLpMMy1UoVLlYrhWLqOav2DAUneB7iGSCuvqWtbjMqjaI
 FnJ9QaPtllS5aIJw5YIhCnPT2scZiIcBM7dDjJWCHgujJ7pmPF4G8VJLujKXs3xss2Fy3z7CK7t
 J38js/1MG/GgLlmht533BDpxnR8bwPslP0QPJd4NHgydk6E=
X-Received: by 2002:a5d:59a2:0:b0:38f:6287:6474 with SMTP id
 ffacd0b85a97d-3997f8fc43dmr17769715f8f.15.1742972778412; 
 Wed, 26 Mar 2025 00:06:18 -0700 (PDT)
X-Received: by 2002:a5d:59a2:0:b0:38f:6287:6474 with SMTP id
 ffacd0b85a97d-3997f8fc43dmr17769660f8f.15.1742972777995; 
 Wed, 26 Mar 2025 00:06:17 -0700 (PDT)
Received: from [192.168.0.7] (ip-109-43-49-206.web.vodafone.de.
 [109.43.49.206]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43f55c3dsm224273005e9.23.2025.03.26.00.06.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 00:06:17 -0700 (PDT)
Message-ID: <3ebe072b-f94b-4a59-9683-0c4af2891393@redhat.com>
Date: Wed, 26 Mar 2025 08:06:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.0 06/12] hw/i2c/pca954x: Categorize and add
 description
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, BALATON Zoltan
 <balaton@eik.bme.hu>, =?UTF-8?Q?Herv=C3=A9_Poussineau?=
 <hpoussin@reactos.org>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Glenn Miles <milesg@linux.ibm.com>,
 Samuel Tardieu <sam@rfc1149.net>, qemu-block@nongnu.org,
 Patrick Leis <venture@google.com>, David Hildenbrand <david@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Tyrone Ting <kfting@nuvoton.com>, Eric Farman <farman@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>, Halil Pasic <pasic@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Bernhard Beschow <shentey@gmail.com>, Hanna Reitz <hreitz@redhat.com>,
 Hao Wu <wuhaotsh@google.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org
References: <20250325224310.8785-1-philmd@linaro.org>
 <20250325224310.8785-7-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250325224310.8785-7-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZsuaW3h1FezgZjd71dWh7h8Xm7uDzpqW60TmDSRVA80_1742972778
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: xSEhrlPNhASx

On 25/03/2025 23.43, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/i2c/i2c_mux_pca954x.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/i2c/i2c_mux_pca954x.c b/hw/i2c/i2c_mux_pca954x.c
> index 779cc4e66ed..100b8d86093 100644
> --- a/hw/i2c/i2c_mux_pca954x.c
> +++ b/hw/i2c/i2c_mux_pca954x.c
> @@ -175,12 +175,18 @@ I2CBus *pca954x_i2c_get_bus(I2CSlave *mux, uint8_t channel)
>   static void pca9546_class_init(ObjectClass *klass, void *data)
>   {
>       Pca954xClass *s = PCA954X_CLASS(klass);
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->desc = "PCA9546 I2C multiplexer";
>       s->nchans = PCA9546_CHANNEL_COUNT;
>   }
>   
>   static void pca9548_class_init(ObjectClass *klass, void *data)
>   {
>       Pca954xClass *s = PCA954X_CLASS(klass);
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->desc = "PCA9548 I2C multiplexer";
>       s->nchans = PCA9548_CHANNEL_COUNT;
>   }
>   
> @@ -226,13 +232,13 @@ static void pca954x_class_init(ObjectClass *klass, void *data)
>   
>       rc->phases.enter = pca954x_enter_reset;
>   
> -    dc->desc = "Pca954x i2c-mux";
>       dc->realize = pca954x_realize;
>   
>       k->write_data = pca954x_write_data;
>       k->receive_byte = pca954x_read_byte;
>   
>       device_class_set_props(dc, pca954x_props);
> +    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);

Clear DEVICE_CATEGORY_MISC ?

  Thomas

