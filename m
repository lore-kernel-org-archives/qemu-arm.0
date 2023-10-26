Received: by 2002:a17:906:c785:b0:9bd:85f7:2662 with SMTP id cw5csp142478ejb;
        Wed, 25 Oct 2023 22:40:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG31ZXw5BouqeJD0Y3xrG95FlopFN4pwrlPoEwO/AfOk2B+ZEFt8tYBz15CJXtlV72rXwLJ
X-Received: by 2002:adf:d1c2:0:b0:32d:a2c2:bad with SMTP id b2-20020adfd1c2000000b0032da2c20badmr1580600wrd.2.1698298838924;
        Wed, 25 Oct 2023 22:40:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698298838; cv=none;
        d=google.com; s=arc-20160816;
        b=pRZA11EGQvGKA4URqJuOet+TaW/ksXrY5kcf35tIz8OTD42ztDMKTNVXYeP19rz8DU
         uk9DJ0WPta+qaGsucqZalpYwDjeDpw8AoiyBqunu+K6ZlAs7VRsmUn8VwjlSlygvbN8l
         evdGmWdVbA5fI+oDqUUP7hgHJznBud5hphxtNsbLGNMSxmrnGlFI8S7w/gNtCtJ4aWSq
         NCoj5DRiKpWGTERq9W1Oyz5k7ZiI531ZKJjF8rEPOHXW4nzcWNx9nS7wowjLOroMBAcb
         jY/OgBjOiXNpSz4pryZvuDsLNCEy8XRakICUei8nyuc+M8TyxhfL9XP3ygC6UQIQQz33
         Ri3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=7mHbrXxg9itLZ4Mk+3tlBIaUGwgfakt+/j2ZAc5eOPk=;
        fh=0zTg7JqpEkRv6PpnFgWax7BLxT45hIRqZHSy67B+2mI=;
        b=EfpqxSpvRFf9Ws1X8AHdHUyFyjyyXD2RbEj2pFQrSpH2NlANLvBNaM/eAj9NLMfOsU
         Sze+y9HawawIN+U0x2r8GVlH5zlmIRAQj5S3NIkQ5yZRoJa4uuN7LcwdOAWn9jIOizcT
         60dd06cC3fY02TWEbVPGgncF+ksx0Vb5KCCccA/D9KYBhVQJCR7z/0pOIv5jkKQgoZ6g
         +t/i8eFilPF/p546jws84CaJv6ahwxg9pJoGQ21rhUien+pUVrG6BnpX88at4wd7KyEK
         uKKGdxngPqXDHHZtYALaDphSrCTmzAx3YlETol/cUjY407jPgOkc8si+/DyTXMa35/ED
         tmzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NaB0w+pt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e20-20020a05600c4b9400b00406467a3a52si1068815wmp.160.2023.10.25.22.40.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Oct 2023 22:40:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NaB0w+pt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvt6j-0007Xd-2S; Thu, 26 Oct 2023 01:40:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qvt6a-0007Tf-FF
 for qemu-arm@nongnu.org; Thu, 26 Oct 2023 01:40:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qvt6X-0005wf-VZ
 for qemu-arm@nongnu.org; Thu, 26 Oct 2023 01:40:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698298825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=7mHbrXxg9itLZ4Mk+3tlBIaUGwgfakt+/j2ZAc5eOPk=;
 b=NaB0w+ptXxKn2ABTKw9cm/Davl5YoCR9rVjuWam+K8+mpPkS/u/bZI6+mWC3EHIlzCGHrx
 yAQAWm6VxCxTbtQCP+ANffMOe7+mQ8VnRPiHrg9D1L7tiQLxMuSVeOuZEnVAFEuKcgjswY
 G1ZOflXfdSZEPJIZ9E4LfgQm1NzY2pE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-104-cxosjTFyN9SVWH6N2WClJg-1; Thu, 26 Oct 2023 01:40:24 -0400
X-MC-Unique: cxosjTFyN9SVWH6N2WClJg-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-52310058f1eso1823902a12.0
 for <qemu-arm@nongnu.org>; Wed, 25 Oct 2023 22:40:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698298823; x=1698903623;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7mHbrXxg9itLZ4Mk+3tlBIaUGwgfakt+/j2ZAc5eOPk=;
 b=NjRC/po+K/yy0n4HQQaftlrYCCXEmKKaMLI4kyapLnpCltkITqDcLyBvlSDNFvjRGh
 9jcJmCcVOyXeAvdJ6NpsfcPPpjggrBA2XghvSTBC9lYV23TWc9sS8sfpXasjy5NJ4LPD
 mWH17yAUOxngEHfs6w1wOs15vy1EePpVru4YRzrSLDK5Onjr/ThZ1hRy4V0KDmnanA9S
 9OTFXUIKUi24+I8Kn0zRP69U87aLl+4YWLQ8DB3z9BrEaJDtw3T9UPvo+4AjJf9pD8TX
 naxmOR20TCqsmcW8x1qFfSjuU2ZTcNUtdWyqYUuUIUIG5VG/3OGrgWY/S2f/RPACNH54
 k0MA==
X-Gm-Message-State: AOJu0YzRhbQDppH3bHpDNGm8wNYUDa9o7KeQNXjJh4pEdjulAbaHXWNk
 7K0tHjBkiHVixrNhtbWmI54o10mxz0VUR5ai5oaqKW+E3KaTf/DiS6oC1yQxob7MjM7AQixqqfN
 nsjRsvBy+G4F2
X-Received: by 2002:aa7:de90:0:b0:53e:1207:5b69 with SMTP id
 j16-20020aa7de90000000b0053e12075b69mr1422214edv.10.1698298822749; 
 Wed, 25 Oct 2023 22:40:22 -0700 (PDT)
X-Received: by 2002:aa7:de90:0:b0:53e:1207:5b69 with SMTP id
 j16-20020aa7de90000000b0053e12075b69mr1422208edv.10.1698298822426; 
 Wed, 25 Oct 2023 22:40:22 -0700 (PDT)
Received: from [192.168.0.6] (ip-109-43-176-238.web.vodafone.de.
 [109.43.176.238]) by smtp.gmail.com with ESMTPSA id
 i18-20020a508712000000b00536ad96f867sm10845721edb.11.2023.10.25.22.40.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Oct 2023 22:40:22 -0700 (PDT)
Message-ID: <0c782489-d4ae-4cde-9545-b0c8303b2751@redhat.com>
Date: Thu, 26 Oct 2023 07:40:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 16/23] ui/vnc: VNC requires PIXMAN
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert" <dave@treblig.org>, Eric Blake <eblake@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20231025190818.3278423-1-marcandre.lureau@redhat.com>
 <20231025190818.3278423-17-marcandre.lureau@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20231025190818.3278423-17-marcandre.lureau@redhat.com>
X-Mimecast-Spam-Score: 0
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: aeJ6krlTtz6G

On 25/10/2023 21.08, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   meson.build    | 6 +++++-
>   ui/meson.build | 2 +-
>   2 files changed, 6 insertions(+), 2 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


