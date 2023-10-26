Received: by 2002:a17:906:c785:b0:9bd:85f7:2662 with SMTP id cw5csp220396ejb;
        Thu, 26 Oct 2023 01:45:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/gA5hQVk5GGyrJPnx7ujZwSiqSJyHu+UWgm6bFG9DEIb0oK1UlmSmXv0Umc4DbEO/DwFT
X-Received: by 2002:a05:6000:1109:b0:32d:a41b:bd47 with SMTP id z9-20020a056000110900b0032da41bbd47mr13147299wrw.59.1698309948838;
        Thu, 26 Oct 2023 01:45:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698309948; cv=none;
        d=google.com; s=arc-20160816;
        b=U4u3P0HnnolvZrMK6/3SUbBa60HTR1l5W9swqO1TrTYQEWbkSs9Q6n+wmUBrDQc0oO
         CJddL8KpRSLbHk1atb9TOBTbQ8AjYrG3cS4/UcYpxhb0SuiuoVoh7FrB+O+Jq/+kNKMW
         LheLsafeH1IW7QbHu2UCEGUUECR9DIy4JhQdVvFdvNSsjNJxgWA3WmfJ1VniBGFUnN8J
         /gGVZaxpBm0iBFp/48fu05t+848dYNGGX3mIKTMp7XAUzL5a4v7suwh2l4Lw/MovmnQa
         cLaDSAgf/zNAW/lPZypLYsxpgxNfxVTghF2MJ1RgrrglFBMDFH97GZ7j7QfMZePuPgxm
         KPxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=D8yHzVlwxhOyUyZx/CNYzpSz7Sti9RHU5svhTzGIDjc=;
        fh=5BUS2PCSm2nFNPOL6oRx/PUrf8tFxJ7Wy3BRN7xsIww=;
        b=j7M57wZvBU0j9I/Wy9YUUc7JKxgLaHuaKvhrngexz8qjghJKUjKVqhPra/1hvmZ+9q
         MJmJeO8VSFDUemJlBOi3jQieIbjMuj8+latdcgYy5KUBXgHVPC/5EHvvkTsjObeiPhEI
         S/RT97LUUCVXmmn/xagpQ4RV8SkCcvEu+ubvbEBUa34x1UNh/Bi3xQQwD8poQ8ayfjwv
         eJLW2x/krRF1QkfZ+sIlaQvQPOEhA4D7fmDB40VdzFQzUTHZs/583L/yD+7f7mhu5Wpn
         PWdwLc5Q909mryr9i8FVK4FL7RaNDxIZpKf6xUnykBZFDuzDGiBPpFGEM9WGlyp7uyuJ
         iw3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ghWdQQ+i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w12-20020adfec4c000000b0032da1287dc2si8893915wrn.382.2023.10.26.01.45.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Oct 2023 01:45:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ghWdQQ+i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvvzp-0007Sn-T0; Thu, 26 Oct 2023 04:45:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qvvzn-0007O3-OG
 for qemu-arm@nongnu.org; Thu, 26 Oct 2023 04:45:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qvvzk-0000yM-VO
 for qemu-arm@nongnu.org; Thu, 26 Oct 2023 04:45:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698309932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=D8yHzVlwxhOyUyZx/CNYzpSz7Sti9RHU5svhTzGIDjc=;
 b=ghWdQQ+ifuDvaPdSS1SW93/HzwKKkz8i/JSP/GSrLRzOjYqho+695Qhh2wEVEp8ZmuqfCn
 LF4VU8YCb16RHvxD+sLoUE9IhQcq9JYoRlvxHljUu8hn8Y4nnGc3K1EzHIzyJVCoTH6Rwp
 fWcK4PEnFGpXlMkKOks41wgm3VDMNuc=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-547-_iT9yLB9N4euXnSGueZuIg-1; Thu, 26 Oct 2023 04:45:27 -0400
X-MC-Unique: _iT9yLB9N4euXnSGueZuIg-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-66d0b251a6aso9050996d6.2
 for <qemu-arm@nongnu.org>; Thu, 26 Oct 2023 01:45:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698309927; x=1698914727;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D8yHzVlwxhOyUyZx/CNYzpSz7Sti9RHU5svhTzGIDjc=;
 b=H15P9zCSiQ9QaTuNJHPlPkJFxu5Pd41jYvHafhuZ98IPDYIUAssVL0mtBGInXF2qXR
 AGhb+P9VOn48G81vIpEXTdCjdVMovf12JRdHOgzOgrdpmXGKGByCc6NlJUzx3oDK20q0
 mfbv7DN6komCHhdBIlBKyFF+uRUGeYzz3SFnqDRJ09/xl2EO6VTO2RXxRO2rDiPaXnkb
 CKBw4jCMW6a1yaVUhn2kPef7h//+0uZtzwMGze8mX3CZZlSWyErZg5bN48dSfgRT3L59
 yR5tHx5wyMFTgx/xGmAzZXSpkXM5FbUHG6Z5PnbbQ7GkSbUkBEHfpWbO/nXEPt2CUaqk
 x0Sg==
X-Gm-Message-State: AOJu0Yw2sTg6YzeWPcrgZk8h9+2QC7UqN9QO6JN1ac4VJRhO9kMVV/8s
 VCpHkVysb5j8CroJJh3XyLoGNTjU+1K8EU2Ev1RFEm/Ai6UDEHhFiNfkUzBgufhKyJnxcJEy2oX
 RHH6VZG4jxC4W
X-Received: by 2002:a05:6214:5004:b0:66d:9d4d:683 with SMTP id
 jo4-20020a056214500400b0066d9d4d0683mr19650689qvb.57.1698309927324; 
 Thu, 26 Oct 2023 01:45:27 -0700 (PDT)
X-Received: by 2002:a05:6214:5004:b0:66d:9d4d:683 with SMTP id
 jo4-20020a056214500400b0066d9d4d0683mr19650671qvb.57.1698309927085; 
 Thu, 26 Oct 2023 01:45:27 -0700 (PDT)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 jy12-20020a0562142b4c00b0065823d20381sm5062574qvb.8.2023.10.26.01.45.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Oct 2023 01:45:26 -0700 (PDT)
Message-ID: <d41aa305-6d3d-478a-82c7-e9a8789bdfce@redhat.com>
Date: Thu, 26 Oct 2023 10:45:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 15/23] ui/gl: opengl doesn't require PIXMAN
To: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert" <dave@treblig.org>, Eric Blake <eblake@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20231025190818.3278423-1-marcandre.lureau@redhat.com>
 <20231025190818.3278423-16-marcandre.lureau@redhat.com>
 <4b2a7827-b0a0-4cd5-81a4-d4129a53ac82@redhat.com>
 <CAJ+F1C+q1N0MWGHH=L82iyL-gCp__U+eELo9=y5fz0rexUFptQ@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <CAJ+F1C+q1N0MWGHH=L82iyL-gCp__U+eELo9=y5fz0rexUFptQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: YlBlXHHiM+0E

On 26/10/2023 10.09, Marc-André Lureau wrote:
> Hi
> 
> On Thu, Oct 26, 2023 at 10:44 AM Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 25/10/2023 21.08, marcandre.lureau@redhat.com wrote:
>>> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>>>
>>> The QEMU fallback covers the requirements. We still need the flags of
>>> header inclusion with CONFIG_PIXMAN.
>>>
>>> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>>> ---
>>>    ui/meson.build | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/ui/meson.build b/ui/meson.build
>>> index 3085e10a72..7c99613950 100644
>>> --- a/ui/meson.build
>>> +++ b/ui/meson.build
>>> @@ -60,8 +60,8 @@ endif
>>>    system_ss.add(opengl)
>>>    if opengl.found()
>>>      opengl_ss = ss.source_set()
>>> -  opengl_ss.add(gbm)
>>> -  opengl_ss.add(when: [opengl, pixman],
>>> +  opengl_ss.add(gbm, pixman)
>>
>> I don't quite get the above line (sorry, meson ignorant here) ... does
>> "pixman" simply get ignored here if it has not been found?
>>
> 
> Yes, when it is 'not_found", it's simply ignored. Essentially, this is
> making pixman from required to optional to build the opengl source
> set.

All right, then I think the patch is fine:

Reviewed-by: Thomas Huth <thuth@redhat.com>

But one more cosmetic question:

+  opengl_ss.add(when: [opengl],
                  if_true: files('shader.c', 'console-gl.c', 
'egl-helpers.c', 'egl-context.c'))

Do we still need the "when: [opengl]" part here? ... there is already the 
"if opengl.found()" earlier in this file, so it looks like this is not 
necessary anymore now?

  Thomas

