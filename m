Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD5DCCA476
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Oct 2025 11:54:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v7Bgv-0008Nt-7f; Fri, 10 Oct 2025 07:53:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v7Bgt-0008NQ-1f
 for qemu-arm@nongnu.org; Fri, 10 Oct 2025 07:53:43 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v7Bgk-0006E6-UM
 for qemu-arm@nongnu.org; Fri, 10 Oct 2025 07:53:42 -0400
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-b4736e043f9so289155366b.0
 for <qemu-arm@nongnu.org>; Fri, 10 Oct 2025 04:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760097204; x=1760702004; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5HX2bit+Q+N9hc9RuZAdnMfGq8JDdUCV45g1a41Zdsg=;
 b=G5VmDzCW0qza+dBX93yF95Oug1y+k2gPAXEsyJfEjOn2yb6ZYUIc3HPoJWTyp8XqbD
 +8J0zMMeFs853Tz7IKZQ3cUMGP44VQgLzx8F1Cf9lpHjRAoCd92VT/kneO2gNZs5o96C
 1X66+pCMSEBuf38QJYjYdR1AViVNBVJHHtuMMONWddmgw1Vu46lqjDSvG3RCeeeu4zhO
 HcsiwIPvy9JDwBJCURBVIEThCOWxjzqXUQFy6XmTiMpcIxoUknH7Q22syZ8xUzYZ70KH
 n7PqBgZ1hDmXHhNlo4ji4yXdP+op5E+KdCWrQ+wkkQM0dhlHrHXIqNmQYYSITV1jfbE/
 UsDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760097204; x=1760702004;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5HX2bit+Q+N9hc9RuZAdnMfGq8JDdUCV45g1a41Zdsg=;
 b=Pozk87X0Tvcd6AnZOmcPG0hNBGTHNaWrb+PwsfQeyTd4IRc1XE+rIt3NfKRIKmtd4K
 F3FxQApB140w90ImPXnZuk7RDPkqhuDSikprWl/VPiDvzyl9sNLQ/V4aRUy7ZEnYU4qk
 LckNj+dA0EJ6W1Y9DG9ROd/PMkF/6Pq4/XULWJx6i3lA9qrsAgqKAaVMN1VaykOfgJd8
 ADygGEcWvZJngNzXuLAR8InWYFHCn8ryEVQIqUkwf7G+FjeMDzJaQkqcsz49530SfqAs
 XY/o1V+lFUJ/BZ5c0vzPjEkp74yhDfCrflXRi6MGyh70fL8rliACAFo+uWgVPpwIcrjy
 55SQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtLlAVSDXvaOiFnCgiiALa+l4r+GZ+T0vd1U8ueM5Wg181OFmAszFW0+Q3L+8JP7zbNWm/Rs8pAg==@nongnu.org
X-Gm-Message-State: AOJu0Yxii05/gq9baEkD5Bq0RfkwlTQQqvEPkkt38BgTY7iiqSxst4DZ
 9O9YUUyXgxMVWkaoR1jE8OpgMbBMQBKDYZhyKKQuINEfVt6j5qurZqbh7z2mA5e3QNA=
X-Gm-Gg: ASbGncu6oAbGvN8at6ZUCaBkTZAEuxyDg2f26yuGwjCT6w+BG4DAwyAuxKYv9v12zNh
 HvYRjd887G/YS6j8mdtxWidLcePTtZON0x1WSDuyyd6ToajGfN/bz5hNN5X/YUFfl745Wo1wnps
 UjVtPq8DTtX6pntVX9GaKcQ0WfOGhkBOdmk0h/p0Mgg9/o4bZhvqo4T9RwvI4Gwlhp5UJVmtc9I
 C/FP/Yf8qKZhruwK3y0BMKga6NgzgA7HlLbYv1DjxH2ZRa/YD+9sIWgr1h2fdFyn9ADYMidnQVe
 5BG3Do+w5Aq6Zz7wVGQyE1mYbxO6kgyW3pAQ97/2xxdOftZwYnCvXRy4bN/CjIQQk7aD5goi7eS
 rffIsI4QicrDdQbvR56hHsiM8sFWl9NYcT/Wdmzs5jaqj/g==
X-Google-Smtp-Source: AGHT+IE8zIQzkifg4Ebek3jDvHwN8mDWe3akQYP14n6E6xMsnt8wpS93jQH0QRD0Epl7+w/RkKk9pQ==
X-Received: by 2002:a17:906:7313:b0:b41:297c:f7bb with SMTP id
 a640c23a62f3a-b50aaa9b6f8mr1244720466b.26.1760097203747; 
 Fri, 10 Oct 2025 04:53:23 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d61d04dfsm216300466b.22.2025.10.10.04.53.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Oct 2025 04:53:22 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 2641A5F7F6;
 Fri, 10 Oct 2025 12:53:22 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Daan De Meyer <daan.j.demeyer@gmail.com>,  qemu-devel@nongnu.org,  Gerd
 Hoffmann <kraxel@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, qemu-arm@nongnu.org
Subject: Re: [PATCH] Add support for zboot images compressed with zstd
In-Reply-To: <CAFEAcA-iQkqxR5jPtGC1EAtcH4FYD5y71x6RFSWC3vP05krScw@mail.gmail.com>
 (Peter Maydell's message of "Fri, 10 Oct 2025 11:05:43 +0100")
References: <20251008191716.3005164-1-daan.j.demeyer@gmail.com>
 <CAFEAcA-iQkqxR5jPtGC1EAtcH4FYD5y71x6RFSWC3vP05krScw@mail.gmail.com>
User-Agent: mu4e 1.12.14-dev1; emacs 30.1
Date: Fri, 10 Oct 2025 12:53:22 +0100
Message-ID: <87sefrvuq5.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Peter Maydell <peter.maydell@linaro.org> writes:

> On Wed, 8 Oct 2025 at 20:17, Daan De Meyer <daan.j.demeyer@gmail.com> wro=
te:
>>
>> Signed-off-by: Daan De Meyer <daan.j.demeyer@gmail.com>
>> ---
>>  hw/arm/boot.c       |  2 +-
>>  hw/core/loader.c    | 36 ++++++++++++++++++++++++------------
>>  hw/nvram/fw_cfg.c   |  2 +-
>>  include/hw/loader.h |  2 +-
>>  4 files changed, 27 insertions(+), 15 deletions(-)
>>
>> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
>> index e77d8679d8..c0dec0343a 100644
>> --- a/hw/arm/boot.c
>> +++ b/hw/arm/boot.c
>> @@ -826,7 +826,7 @@ static uint64_t load_aarch64_image(const char *filen=
ame, hwaddr mem_base,
>>      ssize_t size;
>>
>>      /* On aarch64, it's the bootloader's job to uncompress the kernel. =
*/
>> -    size =3D load_image_gzipped_buffer(filename, LOAD_IMAGE_MAX_GUNZIP_=
BYTES,
>> +    size =3D load_image_gzipped_buffer(filename, LOAD_IMAGE_MAX_DECOMPR=
ESSED_BYTES,
>>                                       &buffer);
>
> I would either not bother renaming this constant, or else do
> it in a preliminary patch of its own in the series. (That
> makes the part of the patch which is making the functional
> change easier to read and review.)
>
>> @@ -882,14 +887,6 @@ ssize_t unpack_efi_zboot_image(uint8_t **buffer, ss=
ize_t *size)
>>          return 0;
>>      }
>>
>> -    if (strcmp(header->compression_type, "gzip") !=3D 0) {
>> -        fprintf(stderr,
>> -                "unable to handle EFI zboot image with \"%.*s\" compres=
sion\n",
>> -                (int)sizeof(header->compression_type) - 1,
>> -                header->compression_type);
>> -        return -1;
>> -    }
>> -
>>      ploff =3D ldl_le_p(&header->payload_offset);
>>      plsize =3D ldl_le_p(&header->payload_size);
>>
>> @@ -898,8 +895,23 @@ ssize_t unpack_efi_zboot_image(uint8_t **buffer, ss=
ize_t *size)
>>          return -1;
>>      }
>>
>> -    data =3D g_malloc(LOAD_IMAGE_MAX_GUNZIP_BYTES);
>> -    bytes =3D gunzip(data, LOAD_IMAGE_MAX_GUNZIP_BYTES, *buffer + ploff=
, plsize);
>> +    data =3D g_malloc(LOAD_IMAGE_MAX_DECOMPRESSED_BYTES);
>> +
>> +    if (strcmp(header->compression_type, "gzip") =3D=3D 0) {
>> +        bytes =3D gunzip(data, LOAD_IMAGE_MAX_DECOMPRESSED_BYTES, *buff=
er + ploff, plsize);
>> +#ifdef CONFIG_ZSTD
>> +    } else if (strcmp(header->compression_type, "zstd") =3D=3D 0) {
>> +        size_t ret =3D ZSTD_decompress(data, LOAD_IMAGE_MAX_DECOMPRESSE=
D_BYTES, *buffer + ploff, plsize);
>> +        bytes =3D ZSTD_isError(ret) ? -1 : (ssize_t) ret;
>> +#endif
>> +    } else {
>> +        fprintf(stderr,
>> +                "unable to handle EFI zboot image with \"%.*s\" compres=
sion\n",
>> +                (int)sizeof(header->compression_type) - 1,
>> +                header->compression_type);
>> +        return -1;
>
> Moving the "unrecognized compression type" error path down to
> here means that we have moved it below the g_malloc() of the
> data buffer, so we now need to g_free() to avoid a leak.

Could we not declare:

      g_autofree uint8_t *data =3D NULL;

and drop the cleanup?

>
>> +    }
>> +
>>      if (bytes < 0) {
>>          fprintf(stderr, "failed to decompress EFI zboot image\n");
>>          g_free(data);
>
> Otherwise I think this looks OK.
>
> thanks
> -- PMM

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

