Received: by 2002:a05:7022:418a:b0:98:ef4:7e76 with SMTP id i10csp3034455dli;
        Wed, 26 Mar 2025 00:02:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX5US1tc8wElJTIFtrqg0ZZ378wx7DhPWywVzp5/Hl15YSlSGD6w7lTxi3ZqtBGHLd5giritgOciF9ohg==@linaro.org
X-Google-Smtp-Source: AGHT+IF1GOjiL528OWj4gDzmjKFgZsYEnS+o3CJVrtpGPkXx8fD26FSsmWgGV046+Y9kkuQzgbHj
X-Received: by 2002:a05:622a:8cb:b0:476:78a8:435c with SMTP id d75a77b69052e-4771dd88d84mr322555121cf.16.1742972540928;
        Wed, 26 Mar 2025 00:02:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742972540; cv=none;
        d=google.com; s=arc-20240605;
        b=YkH56EDhPiZT9SYStWiJyhV+rSMimChGZCWt4/N5WBPstAr3rW3J8OatMljkjB+l0B
         G9DY87x3qBcTaHuJ4/C/TfvV8uuDF/528BwWLtFT0/PEMP3uSotVaK1NHPWUI9r6EXRZ
         PFxj6g4uEE1/f23CZ+lHTX4k+llJfluOzYJOV3A4tVqUt8nQ98LOKiJ1ybDBFpSU1C4I
         KaqqgGFMauplwbl0QRbCTv6iVhQ3Poj21GX00+Anq1mdiUR6UIn0FnHv/yLseGvbUR1n
         HHjcATJADD8wW1Ep0FjxdC9QjQ+rWGdb7kOyvW0ms/c0cvN4msPpVsJa6mGjiTL2qVhM
         k07Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=cwI4kN4d6EhahWzWKQoQcV95NzHBntr4dj9JSzJqlts=;
        fh=oUe3GHtgrsioetQwW6AOyphcAjcUdaEoNk8awA+o8F8=;
        b=BdjaOES1eSVZLy7SM/3UZ3JJ4Va0qplNuxxVkMM5ALkg6JZDYfrf2x5QtWmJ5UOMb7
         /qPYHhJWmD72xEXYJy+YRSj9kLWYh/tQzBWLFGh2tRv7qqZXN+7cqRx/Fp+dBQEKHov6
         VhF4ee2mgHGzRoYhDm0z5Z70K+jz7iGLgl1ZpxcXs7/ENq/CXGYPzl3BgTb0BE2FoKJ/
         13YbkKNFjDsBHN4oDB+GMjAg64f497HK9XVHorLDkiSaHA888huug7khdULEzJg9ojXh
         lk/nDyjPMvUy8U/zlpL2CS8DwQ83uItMHAYBG8le0c7h4L2B5UGFJKwHtkXPc1xYzqZW
         Ksfw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YQGPhhTz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4771d6393fdsi112823061cf.488.2025.03.26.00.02.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Mar 2025 00:02:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YQGPhhTz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1txKln-0007zB-2L; Wed, 26 Mar 2025 03:01:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1txKlY-0007ul-1D
 for qemu-arm@nongnu.org; Wed, 26 Mar 2025 03:01:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1txKlU-0007fc-KH
 for qemu-arm@nongnu.org; Wed, 26 Mar 2025 03:01:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742972484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=cwI4kN4d6EhahWzWKQoQcV95NzHBntr4dj9JSzJqlts=;
 b=YQGPhhTzP8LGEQRcZSl7UQ0uibW3A2KT2Vn8Fi6fcCth4cxCf4ZIO653+0W0ArebL9FnjU
 4oJHStp0F4jU/MlYAe+uZ2Ueetu58XhPhn1lqhwplSNmMsXU/NmuYcC3JqrZ4qLy1DqRu+
 hRVIQBhmlAfUHH2iOjMFzr82uFTIZPc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-320-PLcRxoykNWCQ-2W6A1-lcg-1; Wed, 26 Mar 2025 03:01:23 -0400
X-MC-Unique: PLcRxoykNWCQ-2W6A1-lcg-1
X-Mimecast-MFC-AGG-ID: PLcRxoykNWCQ-2W6A1-lcg_1742972482
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-ac2db121f95so492399366b.1
 for <qemu-arm@nongnu.org>; Wed, 26 Mar 2025 00:01:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742972482; x=1743577282;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cwI4kN4d6EhahWzWKQoQcV95NzHBntr4dj9JSzJqlts=;
 b=J24GwMo0/pJEWFIZ7o36WUMR9KsL8szeyyVjw2MOPxDz+9cC7wtY+wbWgXaTdm6xrV
 P6d5QIbB0Zy4YUJkOQeKZ4FKiLj3c6WAfESQZsHWDcKgGksEPaEKyQp/0tDPq6cwS7w/
 CkOL//mU40/wji1nFDalBQnjF3wOvfgWkSuOVITPEF8V+LHqm1VEgYE3LQnrliUNACbC
 cPUa5bso1peME8a4FkRPfZDEoYzZmgR1FH3TlIL5kk9ivstwG3zBlgF6WpgurMrhjpTm
 GgLwssiAICrZ3qOn/VZ/TFM/NafXNrZmWlqKOyWgwqwTyaQ5egZk3+pXbGUOvR02aCvG
 j5Ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdNuLBjjrYnAhCqybxBYC1Q68jaSYAowkwMN0MRoFOuh8YqRg/x4kIbkkwmAJ24L1k7zzBNOZuBQ==@nongnu.org
X-Gm-Message-State: AOJu0YwaYYi/eU2D2+mXB0HXxQ0QOU2rp7aAR+PQ1GJjlboebEcEXck0
 vzXRBtxQ3swcN7AFKmodWmYwn+D1e+XYTEjif52b6a/DEYwn65sYm45bYiKgLnN4uyvYV8eIRvo
 nMBLBuUiiovUxy/gxzqwUq4CTp8yTPosNP296W7YJGVfmqWaDCA==
X-Gm-Gg: ASbGnctE5Y1XtqOx8XWODVr6B53+iWWpdRgX3fZuhfGlC2+EtUFVc5QHiEG13DnRrJR
 +R1phMOdMUmYcYIT3lj1APm5Z6c5RrDvddLAsZ5QsiQ8Due0AXJ5Ijm82FSOFi8Wk2epJmE6rJQ
 Ow8gOAc2qfTuGXjtmDts29X1brQ+HuZ5jYGio1zFfXMMzC2Qk0yjXLSjTarSIIfHysVch8KagZG
 Sbli1B0sk8F4ueDE5L2a8PEjSzNt8kVkgKm4qrE7/jvV199sy6ux/br0jv1FaHm+Ab/U5Oy2LLw
 nDY6H4R/1SKD8qHKq1xsllw+hY4eOKoL1QL2QY+z2HJ0zVY=
X-Received: by 2002:a17:907:7289:b0:abf:6b14:6cfb with SMTP id
 a640c23a62f3a-ac3f20d8b45mr2128262366b.5.1742972481870; 
 Wed, 26 Mar 2025 00:01:21 -0700 (PDT)
X-Received: by 2002:a17:907:7289:b0:abf:6b14:6cfb with SMTP id
 a640c23a62f3a-ac3f20d8b45mr2128256566b.5.1742972481358; 
 Wed, 26 Mar 2025 00:01:21 -0700 (PDT)
Received: from [192.168.0.7] (ip-109-43-49-206.web.vodafone.de.
 [109.43.49.206]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3efbde4a9sm983186166b.141.2025.03.26.00.01.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 00:01:20 -0700 (PDT)
Message-ID: <74345aa8-f44c-49a7-b1b1-d5962f61c5e6@redhat.com>
Date: Wed, 26 Mar 2025 08:01:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.0 03/12] hw/display/dm163: Add description
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
 <20250325224310.8785-4-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250325224310.8785-4-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zuT7YHlFrW881RA-qCjlDvhwnteWSPrTBWMg4sQCw8s_1742972482
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
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
X-TUID: KmGer//MobYL

On 25/03/2025 23.43, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/display/dm163.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/display/dm163.c b/hw/display/dm163.c
> index 75a91f62bd3..f6f0ec0c632 100644
> --- a/hw/display/dm163.c
> +++ b/hw/display/dm163.c
> @@ -330,7 +330,7 @@ static void dm163_class_init(ObjectClass *klass, void *data)
>       DeviceClass *dc = DEVICE_CLASS(klass);
>       ResettableClass *rc = RESETTABLE_CLASS(klass);
>   
> -    dc->desc = "DM163";
> +    dc->desc = "DM163 8x3-channel constant current LED driver";
>       dc->vmsd = &vmstate_dm163;
>       dc->realize = dm163_realize;
>       rc->phases.hold = dm163_reset_hold;

Reviewed-by: Thomas Huth <thuth@redhat.com>

