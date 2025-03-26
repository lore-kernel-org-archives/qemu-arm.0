Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp3125940njc;
        Wed, 26 Mar 2025 00:08:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVpfRtPs9Qun8Ly+eni9xoKIGbDJOIq3jtCvcEvnsflqY0jHHmxPvxVCXfZvP6onxEcu3tSEC4A8xhB7A==@linaro.org
X-Google-Smtp-Source: AGHT+IHFQJ5SzzAdJlSLaPez9n9Ncydc8jV9XoxPI/AjHTJG8+jHiaf5mMyNIF4qLWphny3zehaL
X-Received: by 2002:a05:622a:4cc8:b0:476:6a3d:de2e with SMTP id d75a77b69052e-4771dd7b51fmr305214161cf.14.1742972924202;
        Wed, 26 Mar 2025 00:08:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742972924; cv=none;
        d=google.com; s=arc-20240605;
        b=fQz9IvCh+zRIc7R+7P37haIVLStV++w5xdMTyKjR4b507frKErRQHjRb+vz36AVk8R
         9urWn9iUhv6z1oVSLtL2RWi82FmOHP/w8pQlpIzFkMcu/4a++aXhiFD3PD/8gaSXi9Zi
         tNHpm69f9tqkyIGQvi/EJs7f7k3/Q29eKwoUG7e4A4CUESV3uUbPYZordJaaCdu6MIQn
         z2e1KQsuLuJ++7Puem/355EyQ29Vjb+m0ubKlHA1TZ4rQ0VkFBrQ5IGBrfZ2xj0l+Xvh
         UicrXO0xxq+UqtXQ8tszTqsg/90d4plYMGnpjUH77vLxU54bRBH+uBA9Tw7m+x4qDvDO
         YSAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=tQnS6nyEQ0TREGeJZ0Vc5XZMQe1Yf+GKltcexw19h2Y=;
        fh=Zzyx/dfxncqyVtSgcA2oSZxAlXz82ncR4jlO3x+jGEA=;
        b=GZ4lWAbHa5scdGJP4S6QX7Qpn1duZxWuUtEvkDZ4gUmEOBHs+8RO/r9wf1zcaI/0n7
         Jr0orPi7RlNbges7byn7ALEvLn/Txq5VwhlWn6AQluvIZhmZfGQx/FDFY1LVLAEk6muQ
         FswBu4CPRgBMDAKgVf1vaIubaRqLlVJmUekjaAei60WcsZpEmuss1eySSnfxY1yXaicz
         c6/0mZaKo+Lpb67dl9LlMnDVpHFVsJiDddsmJ2W3KrfOO81KbIvpuSZ/J/pWRA4MnLJR
         Pv06o/FXgJI0D7uBD6Bf6PQdOhi0FsMTIn2TpAn/IEu3vzYw+io1KJ+tQBrPQw7xokrS
         deww==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KmTQlWgK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4771d15c950si107439151cf.125.2025.03.26.00.08.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Mar 2025 00:08:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KmTQlWgK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1txKrz-0003Tl-FY; Wed, 26 Mar 2025 03:08:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1txKrx-0003SP-Me
 for qemu-arm@nongnu.org; Wed, 26 Mar 2025 03:08:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1txKru-0008Tn-Ta
 for qemu-arm@nongnu.org; Wed, 26 Mar 2025 03:08:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742972886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=tQnS6nyEQ0TREGeJZ0Vc5XZMQe1Yf+GKltcexw19h2Y=;
 b=KmTQlWgKNyrB0AsTzTEecMJ/xCPXEspRvAi9rfnpgMzbry7vyw0z2zwbg4Rr9a6MCJyRbe
 Tahwlb9ADbm/5PzYK7psU0KddbdeXdnn02PUU5/qe13qOZ9sC9IHoupWRUb2/Mr+ZDddNN
 ofez8mfevHqMKI4itgoI7tAmmadKGbs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-19-4QimNjEIP-OFhw7MwGHHnw-1; Wed, 26 Mar 2025 03:08:04 -0400
X-MC-Unique: 4QimNjEIP-OFhw7MwGHHnw-1
X-Mimecast-MFC-AGG-ID: 4QimNjEIP-OFhw7MwGHHnw_1742972884
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-39143311936so2571664f8f.0
 for <qemu-arm@nongnu.org>; Wed, 26 Mar 2025 00:08:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742972883; x=1743577683;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tQnS6nyEQ0TREGeJZ0Vc5XZMQe1Yf+GKltcexw19h2Y=;
 b=c8HOCmnMpnw8jAMqYmYvUXM/4ts+/WXzpYPQPJ/lgUuvm6SemuHjKZKL8gm5PLmsC1
 imDWQFa3HZs0Zj0iQDInEjNLglSK7WLYXb2StuLfrgRNrg7bZ4b+/bWTHmagqIuc6gsB
 UuZ1SaZH0Cr+z3DCYmy9+Cv7YSCX61muiQotf8X7gfv1VxlwAJpdjKkchp9+rdL8Z+1E
 zM/1aHj4egzwIVO8qTPe+PCcTBJ8Y0Lg1NLCkVtxMpgy4mT5/moY4VkU8UvO5/6j0tG2
 7EIlUGLyoHY4S4mq8t9MFZPahbATkKuSLvB7ZngyQdMJoW0AppfhuIZM3TYNEpAlnMxm
 Y5uQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU30+ZErOm2G9WNR7t4XvzquYe5lHir+9zc8cm9UuEA+4bxkZcOLfbqrF755PRbamweVFpZp6FZGw==@nongnu.org
X-Gm-Message-State: AOJu0Yw2bhBfuOaGEzLgGKJm2V6UMY0Hkb4Xz4ILejwQR4B72pH3JdDM
 RZyb4pCi9pFKmfh79eMNeP32Cm9Mx5IO/6Tqm2hIbKYzUictiUBoKE5DTEO8Qy+C0XPBMJgyDgQ
 a56LGgoY9H6XKNLVhkHp1b3yWNXwzE49SJbEFKkFKszXoBYKUkw==
X-Gm-Gg: ASbGnctptlAJjNdODOQYSlonii/+9m7y1VtavvhvM01yQnLDIdlehunqhvGyDUnCX9b
 juWGleyXGnqCl8NbUF5tF5pBkzPIEDqGj8ue1fNSn78+9A9HAOEIReovAp+PwFcA2gcbk1W+MiE
 e+k6GQe7i2qbwNqxwVrtVPkH27Vu0/ol02tK9/VD0FO4Aqpsp7oPhbdMwiAAQ3sd3oQKygvI7/m
 cy5abEBdwrM6DTXUaWaFCffoy+l5OvxnmNuW3jS5NYTe0DQKm64XQ0AAbBbD/oV3kCdO1B6DEAf
 wogPJ9wlG4VHUPdb1EfDW9cXmh53qs2qQcZgV+ceWT60HLw=
X-Received: by 2002:a05:6000:2103:b0:391:2954:de27 with SMTP id
 ffacd0b85a97d-3997f93c2b0mr13726037f8f.45.1742972883557; 
 Wed, 26 Mar 2025 00:08:03 -0700 (PDT)
X-Received: by 2002:a05:6000:2103:b0:391:2954:de27 with SMTP id
 ffacd0b85a97d-3997f93c2b0mr13726012f8f.45.1742972883167; 
 Wed, 26 Mar 2025 00:08:03 -0700 (PDT)
Received: from [192.168.0.7] (ip-109-43-49-206.web.vodafone.de.
 [109.43.49.206]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9b565bsm16165021f8f.58.2025.03.26.00.08.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 00:08:02 -0700 (PDT)
Message-ID: <dc996e2a-e161-49b9-81b6-5b49e29a596d@redhat.com>
Date: Wed, 26 Mar 2025 08:08:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.0 07/12] hw/misc/axp2xx: Categorize and add
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
 <20250325224310.8785-8-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250325224310.8785-8-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cEQ7KX_KlJKD_WzSRy7hd_CK3ei8sC2W7IwZ9Cld9nE_1742972884
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
X-TUID: XLVBLm05TX2q

On 25/03/2025 23.43, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/misc/axp2xx.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/hw/misc/axp2xx.c b/hw/misc/axp2xx.c
> index af646878cd2..747af430479 100644
> --- a/hw/misc/axp2xx.c
> +++ b/hw/misc/axp2xx.c
> @@ -232,6 +232,7 @@ static void axp2xx_class_init(ObjectClass *oc, void *data)
>       ResettableClass *rc = RESETTABLE_CLASS(oc);
>   
>       rc->phases.enter = axp2xx_reset_enter;
> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);

That should not be necessary - since I2C devices are in the MISC category by 
default.

  Thomas



>       dc->vmsd = &vmstate_axp2xx;
>       isc->event = axp2xx_event;
>       isc->recv = axp2xx_rx;
> @@ -250,7 +251,9 @@ static const TypeInfo axp2xx_info = {
>   static void axp209_class_init(ObjectClass *oc, void *data)
>   {
>       AXP2xxClass *sc = AXP2XX_CLASS(oc);
> +    DeviceClass *dc = DEVICE_CLASS(oc);
>   
> +    dc->desc = "AXP209 power system management";
>       sc->reset_enter = axp209_reset_enter;
>   }
>   
> @@ -263,7 +266,9 @@ static const TypeInfo axp209_info = {
>   static void axp221_class_init(ObjectClass *oc, void *data)
>   {
>       AXP2xxClass *sc = AXP2XX_CLASS(oc);
> +    DeviceClass *dc = DEVICE_CLASS(oc);
>   
> +    dc->desc = "AXP221 power system management";
>       sc->reset_enter = axp221_reset_enter;
>   }
>   

