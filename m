Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D15CA5FA2
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 20:59:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBIRK-0004yg-M1; Mon, 28 Sep 2026 16:59:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xBIRG-0004yF-Ef
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 16:59:06 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xBIRE-0004bn-5S
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 16:59:05 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-488885c3844so177561f8f.0
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 13:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790629142; x=1791233942; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id
 :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=0iNexZlLTdailoVev8WPHfukVq5p0Bf8UlA559SmjVM=;
 b=hhCpOs17fEjDY34iktpXqi2fe7vLzLGMB4woscJiWk1Vl70Ge/5aAyX99d3LyzXijD
 aGYYLHV7ewcxs91a3U1Gky6rpVuYN7swwFsUtTmSicm+SDI/yLfyW5Ga93fGX0ZaT0Jt
 RiM0FSkNRF162VZTm6NPwP1EtiWtQAx4N9kUtzt7LVIROGpJmQKpktVCVaDa9PADrWMy
 Yx/4WyE6UXYBmfiS41PtiMxoTl92bpCntmjy0ts8UFYk3FBRwcFbt6OhmEA9k4NNEew2
 LeB2TX1FR23Uye0BWVOmmlDkdTjl5rxunDIGBlElPjUXpPwO+MgIf59+NH5z7hCPI3gP
 qvXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790629142; x=1791233942;
 h=content-transfer-encoding:content-type:mime-version:message-id
 :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=0iNexZlLTdailoVev8WPHfukVq5p0Bf8UlA559SmjVM=;
 b=bHA0Ljb1gY8ayOqurI+5b+bCPJSGhEAraiRUkZPgGLEpDWneI4V3MLyQoI7BvNF/39
 wObmnGtRSfFbwghclSqybxFrr+P399f0XMpDQIfsi+6bfhAiw21SXT6hHjsnp5hb5PrL
 E1kZUwTcn8WMjjNkxb+Z9X5oaAvNWLR8U+5TtRtvktK8J7KgSAsMC6CjLHfcocXqXsIF
 pB8F3iZzxSK/92sHrhd5G19P0ur1JaiGRAnJcz2bIp3bhvGsNFr7D1NGkg4TzIZy42nu
 0IwFQgmSOYhgfu6Xy7tQi/xB0IQGMAx2SCmz0c/WZmKurq4v4/7cyy06UA1lCqFXbRNN
 Y3ZA==
X-Forwarded-Encrypted: i=1;
 AKwUvByvEcscnAcJ5i8GlYrinfhwMSK2ESumwF3pOULnJnDp30ZCxKjTUy2B1udToyDKFFryY8wsM2+2Zg==@nongnu.org
X-Gm-Message-State: AFq9FYIoNBgL+XCXjbWnOcWIva214aRNSiLylO+oe8tNysug999KAFm4
 VQkv2VmrzDMUhTyEvSmjhoYMtIAycHNhlz6iGn2ZeE4FXbK2yL4exdux
X-Gm-Gg: AYBFou1l/NaVCSfPdCB05QcN4ONovsj7pgZlzk+T49H+2xqSqCl/dpJUXUrDuyPz25A
 MCm5LP35u7SqI5gcw8DsaexjqZH2mCOl9We/qqWywNVqvRa7QxlcKddO8Ius3lUf03XrNhTDUG0
 qhP1EoPMlANbAJKmKY36hJa2i2rRHPvVmoOWDxRGVk6o4rzEV+MtFWu8V89RSU4X427Gbv3TqGE
 GvVKR+4m22icmz2AdrU+nBj8YuUreSJfGHq76o1JJuw7hshEt8SWl+eIXgGEk7d84eZzrwFGgg8
 E9NwLHV5njpl7CdypgYvwYa9zWcaIVB5H7Fem4dxsq7kAsBjMrlyuH7XnbZLK/8EvrKvxBdGHlB
 XPbA3SxDI4Zefn4iGvo6YYL4zPDfOCDQv7FG2N1RZEYCuX7axyYLkKXzsTDGLxs6WVa8YJEeADF
 O1q16c2PuS7U+/k7gqQmqLqH2KlHc7TYOiSt6wrcYdtsUj4fReB0uZVpgIrkbTbd7V++8f4Pu9Q
 8CxqempCBZBg07o70IKWu7oQfSejK7uwahEzvYJITGZ16HI5EMVl2uML7rXL8g7odWYOflIvC7l
 AMZw90gH1Qhobf/cQt8=
X-Received: by 2002:a05:6000:4905:b0:487:1577:9e33 with SMTP id
 ffacd0b85a97d-48af1ba6b1emr711821f8f.25.1790629142279; 
 Mon, 28 Sep 2026 13:59:02 -0700 (PDT)
Received: from ehlo.thunderbird.net
 (dynamic-2a02-3100-1844-bb00-d99b-d42d-2461-dbe0.310.pool.telefonica.de.
 [2a02:3100:1844:bb00:d99b:d42d:2461:dbe0])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4887a746c57sm28834114f8f.35.2026.09.28.13.59.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Sep 2026 13:59:01 -0700 (PDT)
Date: Mon, 28 Sep 2026 20:58:59 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
CC: qemu-devel@nongnu.org, Phil Dennis-Jordan <phil@philjordan.eu>,
 Alistair Francis <alistair@alistair23.me>, Alexander Graf <agraf@csgraf.de>,
 Jason Wang <jasowangio@gmail.com>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?ISO-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_04/42=5D_hw/arm/mcimx7d-sabr?=
 =?US-ASCII?Q?e=3A_Ignore_memory_transaction_failures?=
In-Reply-To: <CAFEAcA_+nmV0WvoD0OCExmJ7sQdY2T3dvd7ZipbkNuj-RuZQug@mail.gmail.com>
References: <20260921214710.29422-1-shentey@gmail.com>
 <20260921214710.29422-5-shentey@gmail.com>
 <CAFEAcA_+nmV0WvoD0OCExmJ7sQdY2T3dvd7ZipbkNuj-RuZQug@mail.gmail.com>
Message-ID: <5BD5FF6A-CD85-4A7F-989A-60399F5E4FEF@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



Am 28=2E September 2026 18:05:11 UTC schrieb Peter Maydell <peter=2Emaydel=
l@linaro=2Eorg>:
>On Mon, 21 Sept 2026 at 22:47, Bernhard Beschow <shentey@gmail=2Ecom> wro=
te:
>>
>> When using mcimx7d-sabre with newer Linux versions such as 7=2E0, the
>> machine fails to boot=2E This happens due to memory transaction failure=
s
>> since the address space is not fully covered with unimp devices=2E Fix
>> booting by ignoring memory transaction failures in the machine=2E
>>
>> cc: qemu-stable
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>>  hw/arm/mcimx7d-sabre=2Ec | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/hw/arm/mcimx7d-sabre=2Ec b/hw/arm/mcimx7d-sabre=2Ec
>> index 65fdb19c06=2E=2E8d223fca6c 100644
>> --- a/hw/arm/mcimx7d-sabre=2Ec
>> +++ b/hw/arm/mcimx7d-sabre=2Ec
>> @@ -83,6 +83,7 @@ static void mcimx7d_sabre_machine_init(MachineClass *=
mc)
>>      mc->max_cpus =3D FSL_IMX7_NUM_CPUS;
>>      mc->default_ram_id =3D "mcimx7d-sabre=2Eram";
>>      mc->auto_create_sdcard =3D true;
>> +    mc->ignore_memory_transaction_failures =3D true;
>>  }
>
>This flag is in QEMU strictly to allow us to preserve
>backwards compatibility of behaviour with the older QEMU
>versions which pre-dated the suport of transaction failures
>(and where therefore we expected that if we just enabled it
>globally that we'd break previously-working user setups
>because we were missing some devices)=2E It should not be
>newly set for any board model that isn't already setting it
>(and in an ideal world we would eliminate it from all those
>old board models, except that's a lot of work for mostly
>ancient hardly used machine types)=2E
>
>Instead the fix here is to identify which devices we need
>to provide as at least unimplemented-device stubs, and add
>them to the board/SoC=2E

Okay, then let's drop this patch from the series=2E The functional test sh=
ould still succeed=2E

Best regards,
Bernhard

>
>thanks
>-- PMM

