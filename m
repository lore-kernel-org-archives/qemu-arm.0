Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7513CEE34C
	for <qemu-arm@archiver.kernel.org>; Tue, 18 Nov 2025 19:32:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vLRQW-0003ik-Cy; Tue, 18 Nov 2025 14:31:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vLRQR-0003hy-5J
 for qemu-arm@nongnu.org; Tue, 18 Nov 2025 14:31:41 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vLRQP-0002RG-CQ
 for qemu-arm@nongnu.org; Tue, 18 Nov 2025 14:31:38 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-477a219dbcaso24144965e9.3
 for <qemu-arm@nongnu.org>; Tue, 18 Nov 2025 11:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763494295; x=1764099095; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JowzO5siOncdgACQ9vYiobblXdrzT5n/2tzSKg/Sbqw=;
 b=Wy1CY1KlK86vuQdJdwn38GBMQwdsvfuR/V6+TV+NEQR/Sb8pyFuOwbG68IcAJV+hmA
 g1VYaGXjZ3GDtPbFqNaKOL1G5AbvXq8YeyetSWL+kGSfcVId1UGMbAeS6+cKBz/4XVZJ
 2DA79aUxTFoLwE1lJVZBeZthIn4oiVn2ZwP4yzP1lGAr3sUFE1OK2tR/VKeDyGFW0asT
 Gt7PCAQomWmZ/iWvR1czbz3G22gZMck8qewImvFhMHHJN5+7qYOVeKm8MJlPz1xm0vRA
 Jrgqm/zhAkzTaLtJwnR3gVN9fTSSNWlvRqGHelqU+cIPxYpI1wjk7y3QN0GB5bdAXf7d
 YJrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763494295; x=1764099095;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JowzO5siOncdgACQ9vYiobblXdrzT5n/2tzSKg/Sbqw=;
 b=YJ6GpY57PuSTdh8dNJn3oz/bq24mEvKg6V7nWEQhsghN2sG9e8cNAePWMYNc+QwMEI
 IsPtS7ZgSZxtkz4zxPUf6sIzL5wRMRc4g5zdlSahshxkjMYu60Zpjt8kqACB4ZHbKPlb
 m6b9qdDBKlCB11crOA4pKVkZBFBKedL8ekV2eaEQqeP6wK5KFi6R3SMv1wkMqWheRUO6
 qYb2//XKV6brE1g2LRaCuKzwTgU9pSyqiIl+Befh8Y0f5O+uJ1HsM1YG8OprZCq/FbTv
 6wwMNZkGCx8G9yat9vCpSQaSO70H2/LOHn7kUSnJkea+Ny09NBZYm/tmJxktgh8y3n0K
 9k9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpoUqzmtC+p9vD3qab8ZhpQqv9l4/PzrpFEtZZrCNXVjYRU8OjwZaFnL4tQtHzqFy6JG1rDnlbQw==@nongnu.org
X-Gm-Message-State: AOJu0YwcP3dggYk9O4/CCsboIVna3ZyB77v/PI94J824Vjo+uAHvV2fd
 K6j1j1zRF8/YeV6OCQxqws5MI+37RUCbDq3jHBYeO3FrZBIIxnVaESUo
X-Gm-Gg: ASbGncv6bP3gtAZ2HPj156xuuyfeOiX6HnL/CgpjNB/Tc6/Yz2TBp9KVJ1ob/0vbOF3
 Ht9Ml4yDJ/ottySEjHP9TurWSotXA4qpEjw/aTakzAD6b6uTSHgurmbDLT1ol7QxR8JrVBssy+o
 A25GsKcIkVeqHKQFZCex3No2sIarZtK6GKy8xf9BUvIlSQMxRo7RUPcry+QRKh6cGNHcjAtupFW
 mFe8W6WSbU16J5on3dAMIh/YX0ml9sNsxI5FQcMvYfK3ApkNyyyDES9p/o6F8Q+oooVe4c9XGD8
 i4up6V6RGK7PCvZv5m5rtnJGxiSeN5GrSa63MX+W84544YF/k6TZHCqeOAtVAyHSJ6urhLYuruJ
 wC65RDv3QInrL1lBT5+OIojv0W6fWzQC8KEqRCtGPVFZ6fdlyhjPrvDOqKpy3bi44m4Os22QHvI
 QjfS2sXMeLk3zhXQswdr87HckCGR8x+O67NHF6OD9s+IP1KDFzBttfvER/RIbX8QLQOcxBp/p2t
 +6HyoSTpWGiFrrXvnND6u5JPAHMJdm0+CFzWhv5Bi4zEg==
X-Google-Smtp-Source: AGHT+IHObUN55W7VwC56MjpJPw74JgZZzOJ2vCt6wu8V5ZioBD4MEZuP01c2fuZU0okzePFK3crd3Q==
X-Received: by 2002:a05:6000:1ace:b0:429:d33e:def1 with SMTP id
 ffacd0b85a97d-42b59378443mr17666397f8f.29.1763494295255; 
 Tue, 18 Nov 2025 11:31:35 -0800 (PST)
Received: from ehlo.thunderbird.net
 (dynamic-2a02-3100-2347-cb00-b035-e04d-2428-fe36.310.pool.telefonica.de.
 [2a02:3100:2347:cb00:b035:e04d:2428:fe36])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b53f0b62dsm33835931f8f.24.2025.11.18.11.31.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Nov 2025 11:31:34 -0800 (PST)
Date: Tue, 18 Nov 2025 18:40:22 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>
CC: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?ISO-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH v3 1/2] hw/arm/imx8mp-evk: Add KVM support
In-Reply-To: <8a86dfaf-eba5-4348-8885-58c520355e47@linaro.org>
References: <20251101120130.236721-1-shentey@gmail.com>
 <20251101120130.236721-2-shentey@gmail.com> <87v7j8r399.fsf@redhat.com>
 <CAFEAcA_XORdwONC2YbVKPois6BLPEr0dFt_QjTHE=UWmiCiv-g@mail.gmail.com>
 <2EAC1B70-89DE-4694-A4E8-350DC6F9C343@gmail.com>
 <8a86dfaf-eba5-4348-8885-58c520355e47@linaro.org>
Message-ID: <E00A0067-F368-4148-8C0C-E332B6E32780@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x335.google.com
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



Am 18=2E November 2025 11:24:44 UTC schrieb "Philippe Mathieu-Daud=C3=A9" =
<philmd@linaro=2Eorg>:
>On 18/11/25 10:49, Bernhard Beschow wrote:
>>=20
>>=20
>> Am 17=2E November 2025 17:38:03 UTC schrieb Peter Maydell <peter=2Emayd=
ell@linaro=2Eorg>:
>>> On Mon, 17 Nov 2025 at 17:13, Cornelia Huck <cohuck@redhat=2Ecom> wrot=
e:
>>>> Running current master (resp=2E with this patch applied), I'm getting=
 make
>>>> check failures on an aarch64 (Mt=2E Snow) host ("qemu-system-aarch64:
>>>> unknown type 'arm-gicv3'" while using this machine); going back right
>>>> before this patch, everything works fine=2E Haven't tried to debug th=
is
>>>> yet (maybe I'm the one with the weird config again=2E=2E=2E)
>>>=20
>>> Is this a KVM-only config (no TCG) ?
>>>=20
>>> I think this happens because the KConfig now says
>>> +    depends on TCG || KVM
>>>=20
>>> but because the machine by default doesn't use KVM then
>>> trying to run the machine with no extra arguments falls
>>> over if TCG isn't present=2E
>>>=20
>>> This thing we put in to handle "creation of the SoC object
>>> via device introspection means it doesn't have an ms->cpu_type
>>> to look at":
>>>=20
>>> +    const char *cpu_type =3D ms->cpu_type ?: ARM_CPU_TYPE_NAME("corte=
x-a53");
>>>=20
>>> also probably won't do anything useful under a KVM-only config=2E
>>>=20
>>> I think the simplest thing here is to put the KConfig back to:
>>>=20
>>>   depends on TCG && AARCH64
>>>=20
>>> People building a KVM-only config almost certainly do not
>>> want this machine type and its devices, because the main
>>> reason to build KVM-only is because you're in the
>>> "virtualization use case" and want to not build in a
>>> load of not-security-supported machine types=2E
>>=20
>> Do we need this treatment for further machines, e=2Eg=2E isapc, e500, m=
ips? Or shall the CPU type handling in the SoC consider kvm_enabled()?
>
>Good point=2E My understanding is only virt x86/arm/ppc64/s390x are
>"security covered", but there is no explicit mention of that in
>our doc=2E (btw why not include isapc? as it is a subset of other
>covered x86 machines?)

Hi Phil,

Peter merged the updated security policy which enumerates all "security co=
vered" machines (sorry, don't have a link right now)=2E

Since the policy change was about decoupling of acceleration/virtualizatio=
n technologies from use cases, I'd actually prefer the imx8 machine(s) to b=
e enabled in a KVM-only configuration=2E For 10=2E2 I'd go for "depends on =
TCG && AARCH64" for simplicity=2E Will send a patch later=2E

Best regards,
Bernhard

