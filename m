Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp6594850njc;
        Mon, 11 Nov 2024 04:17:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWoM7yIAuWRctV5LeitYlGhF6o4ayA+Odp+UQnCP4cMsEusL/svy8iummqWxWtYyiJTAHQ4oMWOxF7ttw==@linaro.org
X-Google-Smtp-Source: AGHT+IENcrBuROuIYBFZHDmmjEmIHboVLK6NzGxjDKQwoWq6tCiZ5bWG5nYTqZceftKlzBGj0qBr
X-Received: by 2002:a05:622a:1b12:b0:460:ddc3:4dd2 with SMTP id d75a77b69052e-463093eea3fmr158494361cf.40.1731327445755;
        Mon, 11 Nov 2024 04:17:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731327445; cv=none;
        d=google.com; s=arc-20240605;
        b=AGQIuEb28Ak9jsYvoVGLqjQEtgHdaXurLPwS8PnUTtlxjU94oMboBQBZa72nT26qVN
         bE2RI4gYQzy1aK2VU2sCSM7kYTV+A7zEt7IsBGq3kfVtn2lrTKGiorSG93eFHmDgdCPW
         gtBnmUnDiCLl3TDfaxiodZ8UuGzQrVj1nVi4sep8SAZZf2ERuC2+OMckkltRejcpKq9I
         asSRka24PHJK2o0RuejDxf3gY+jZMS1VKtVrYFDOQVmU4yssUp+vOQo86vleUqkp2fSR
         VIfPnIk53SewyZfBjA+cgZSX+YrHk1dRB3PV5S9mdponXw965HSwSLS48lcRCq20fW0B
         mc9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=sTPGj85ERuOhRVMM4nEbKrBXRoZ3ZQoR0mJY3L1kuxU=;
        fh=1wTW/RWc6OrdcrjWPdaXFEdHzpGucStq4mfLT4H14Zo=;
        b=FMIJCWfT5t1Uc0Um2/GW7ZeUJ2uf1VA+OZDvg4qGIiZBTtQfG89ccvZYnLsqaGvcSZ
         BIMhEekw8kNjoRwLX1Uw1cJqU0eHrsXy680G557hHlgMjAtYO4SaPAmDMqtcs/IQUAXV
         DdTCUz1bUHN+kTpFjfitL4nMyHseTtOlsPwSw7ypRVNiKo9/acBgqOZDfAbHNq03PFTh
         5HEIEgHEMTgQLfrB0GGn/oB2TAoRni/FLoAXma472lJSAv98410wVmEOiFuCUKKCNCDw
         HX86KScXcJXR65ZnR765jHY9W0K3qwDk8FAS3MUIFqR1NQ+iC4tidjdZgWlDjsUp2r3Y
         AWIQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cb5fGzjr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4631a5b9865si56993961cf.651.2024.11.11.04.17.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Nov 2024 04:17:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cb5fGzjr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tATLx-0004gE-Ht; Mon, 11 Nov 2024 07:17:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tATLu-0004fT-I1
 for qemu-arm@nongnu.org; Mon, 11 Nov 2024 07:17:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tATLs-0000iY-Jc
 for qemu-arm@nongnu.org; Mon, 11 Nov 2024 07:17:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731327422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=sTPGj85ERuOhRVMM4nEbKrBXRoZ3ZQoR0mJY3L1kuxU=;
 b=cb5fGzjrfMhDHh3yRcDcZe+87r/JkLhTTFBhEBxkcCb1UVy+wSA5DL1pjhEFqKiICcB7k+
 Y0f4iCJl+UJDZDOAN2f5TV557Zp5MG2cH1vm3+fkU/rQD4y1f6P6cy+8r2m+m5HDh8nXF6
 /qW4+A7vuuixjG0ZtiTMmjE9C4sxLUM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-r-sXjieIPSKCy-SX9P6gpQ-1; Mon, 11 Nov 2024 07:17:00 -0500
X-MC-Unique: r-sXjieIPSKCy-SX9P6gpQ-1
X-Mimecast-MFC-AGG-ID: r-sXjieIPSKCy-SX9P6gpQ
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4314a22ed8bso31480175e9.1
 for <qemu-arm@nongnu.org>; Mon, 11 Nov 2024 04:17:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731327419; x=1731932219;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sTPGj85ERuOhRVMM4nEbKrBXRoZ3ZQoR0mJY3L1kuxU=;
 b=nbB/F7EeCoHYbEWKr47+EiDYsvkirca/6BiSkLav5YRpU5KHZBuEIY8+AjFWTJE3EF
 Ef5lwLqgOlwy4cTUpoVnOlsUYKBMCu++ywGeesN2lYcYeka2KAm03nARjHSdQTEvqUj0
 Id8b39UgF+CS+lz9bmoHyN2H95mNw3g/IgeTsCLfJNxpNGcmMtFzFnllbGe4Ci70SU3m
 s9XVY5tx/BxtONWjzhPQHZShZuZu7OX1Kn1KmcoQAdpmVoFPgU8J6dE6a7LCKKczu5kn
 644v98MijJ6jB9VD0A8xIc4rWPXXHlA36LXuhy3jPswxaqBkQPOnhBfK08iU5Ey6SgaL
 tvhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUxjTCPjZ+cfR6aRUJB3payHYYLOwQHg0I6ZN9GtfoHqkD0sJ1Pycm5zGRQTsjIparkuQbUcPzmg==@nongnu.org
X-Gm-Message-State: AOJu0YyIpO9nXoS4eYib00ZnByZphB/vqz/IS297jNFhKPUDkOtqlTrN
 NFvtql2rJ90nz13cXXTLL5WG5S6TQdvuTyFzfklxnC3zgbvbCrS+Mb0ixJUln/56bDwBA5nbCIO
 an95awfNVXH+1wyy9KE/yQMYRJJ4JC2grFbeGAhGOn7ZjBeDUsQ==
X-Received: by 2002:a05:600c:a04:b0:431:40ca:ce5d with SMTP id
 5b1f17b1804b1-432b75172d6mr96647885e9.23.1731327419596; 
 Mon, 11 Nov 2024 04:16:59 -0800 (PST)
X-Received: by 2002:a05:600c:a04:b0:431:40ca:ce5d with SMTP id
 5b1f17b1804b1-432b75172d6mr96647635e9.23.1731327419222; 
 Mon, 11 Nov 2024 04:16:59 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-51-55.web.vodafone.de. [109.42.51.55])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432b05302e1sm172155045e9.9.2024.11.11.04.16.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Nov 2024 04:16:58 -0800 (PST)
Message-ID: <f05d2890-a6fd-4529-bb4b-6cd4d72db178@redhat.com>
Date: Mon, 11 Nov 2024 13:16:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/17] hw/microblaze: Support various endianness for
 s3adsp1800 machines
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Anton Johansson <anjo@rev.ng>
Cc: Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, devel@lists.libvirt.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>
References: <20241108154317.12129-1-philmd@linaro.org>
 <20241108154317.12129-16-philmd@linaro.org>
 <cf73685f-df95-4165-a642-ddbbb5efb64e@redhat.com>
 <07782067-bd0a-44da-ab89-f3bbe443e349@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <07782067-bd0a-44da-ab89-f3bbe443e349@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RTQmi6v_nYxQeF7rof1HQkKywp-q6gqF0O7TQ-XMuu8_1731327420
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.118,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: WW6dinvvtvBE

On 11/11/2024 12.59, Philippe Mathieu-Daudé wrote:
> On 11/11/24 07:56, Thomas Huth wrote:
>> On 08/11/2024 16.43, Philippe Mathieu-Daudé wrote:
>>> Introduce an abstract machine parent class which defines
>>> the 'little_endian' property. Duplicate the current machine,
>>> which endian is tied to the binary endianness, to one big
>>> endian and a little endian machine; updating the machine
>>> description. Keep the current default machine for each binary.
>>>
>>> 'petalogix-s3adsp1800' machine is aliased as:
>>> - 'petalogix-s3adsp1800-be' on big-endian binary,
>>> - 'petalogix-s3adsp1800-le' on little-endian one.
>>>
>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>>   hw/microblaze/petalogix_s3adsp1800_mmu.c | 62 +++++++++++++++++++-----
>>>   1 file changed, 51 insertions(+), 11 deletions(-)
>> ...
>>>   static const TypeInfo petalogix_s3adsp1800_machine_types[] = {
>>>       {
>>>           .name           = TYPE_PETALOGIX_S3ADSP1800_MACHINE,
>>>           .parent         = TYPE_MACHINE,
>>> -        .class_init     = petalogix_s3adsp1800_machine_class_init,
>>> +        .abstract       = true,
>>> +        .class_size     = sizeof(PetalogixS3adsp1800MachineClass),
>>> +    },
>>> +    {
>>> +        .name           = MACHINE_TYPE_NAME("petalogix-s3adsp1800-be"),
>>> +        .parent         = TYPE_PETALOGIX_S3ADSP1800_MACHINE,
>>> +        .class_init     = petalogix_s3adsp1800_machine_class_init_be,
>>> +    },
>>> +    {
>>> +        .name           = MACHINE_TYPE_NAME("petalogix-s3adsp1800-le"),
>>> +        .parent         = TYPE_PETALOGIX_S3ADSP1800_MACHINE,
>>> +        .class_init     = petalogix_s3adsp1800_machine_class_init_le,
>>>       },
>>>   };
>>
>> Do we really want additional machine types for this? Can't we simply let 
>> the user set the machine property instead? (otherwise, all tests that run 
>> for each machine types (see qtest_cb_for_every_machine) will now be 
>> executed three times instead of only once). IMHO it should be sufficient 
>> to have a machine property for this and add proper documentation for the 
>> machine.
> 
> Machine property was my first approach but then I figured when merging
> the 2 binaries in one, it is confusing for the CLI users.
> 
> Having 3 more tests until we unify the endianness binary doesn't seem
> a high price to pay to me. Besides, not we are not exercising the same
> code path. We need to prove the tests are really duplicated so we can
> merge the binaries. If you really insist I can modify qtests to skip
> these machines meanwhile.

Ok, I don't insist, if unify the two endianness binaries into one in the 
end, that's a much bigger win, I think, so let's keep this patch as it is.

  Thomas

