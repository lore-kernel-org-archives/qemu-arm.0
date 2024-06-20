Received: by 2002:a17:907:60c:b0:a6f:8e2c:4d9d with SMTP id wp12csp1856816ejb;
        Thu, 20 Jun 2024 02:55:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXwUR5wA1OnK2QbMqggXAsc5tLFeXnCWPkqRV4ILvBM74L5gA53XZYAaLIz0VQOlohFluuZhZemBxh80+HTPdJjpxU2umfa
X-Google-Smtp-Source: AGHT+IGtSAEUeVPa+sdgnW9cU/URUcmbfACN1aiHAVNK0kAYFhhSCKsp0GNCNd8lSNPpO0yOoNSK
X-Received: by 2002:a81:de4d:0:b0:615:3262:ffb1 with SMTP id 00721157ae682-63a8d922ea1mr60663837b3.12.1718877345497;
        Thu, 20 Jun 2024 02:55:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718877345; cv=none;
        d=google.com; s=arc-20160816;
        b=W4aRYCrA1SlzXSZvoSMPCG8o7pF5d/hNwr7gUwRq1jBXEJfCxLaZgRk8v6qkMAXBAQ
         cGvLw/AzyFGpUdz12LoYBmxKNzj+SX7IrwrJQ4u4yaMbYUsknYxPqoXMtW1mmqTeTdV7
         I7j/VFwy0xNaeawfTyMr4YNQ35sKzlffKVj0Mcg9mtIW422PeoT6XyaxSCz8wTpxEvUL
         zWPuLBAxlLbhHuk6xkwrrEgc2rClYz+WjCnlEDyU9398/pJX22Qzt7rm4bc/O1ZP1LvA
         +DdKXZB4JvmZxYkyq6lgXmZyeN8TeoSeNC6J/oxhi1kGiAM2Z3DJwlVom/vOKOuTQtC9
         FL4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:content-language:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=SUZwthDtG2fuP8/5EbZqEBmw672XXZZwzpx0iio86zQ=;
        fh=QDm03cw0UmfxT6tb0FxRccoXU45ZFf7P9I1TskEOMM8=;
        b=qhwR+3oh67d5Hs2gITFKYHtCHcCPTET3GWrKTB+icY8GlCPcLTH7493C242DiRFldT
         LIkQ3SlREqWt2pJEtFAKpWsoTChIt5vsI29vVUOkp5hApTgB6O+U7wGGCF01Sk5kmOXb
         eOEzce21V0f06RDUc3bTrjxjwX69YGBntZOEE4py6eeH/YQ8xkX3gmX1R2f9/5fO6Opx
         eEueuJNzrkABK26f6bOgP6LIR9rJULSnLyPDuk59JpwuKvIypxe60INh9akVUbq7lisj
         ruzHrdkheZ9+3n8Ljw+lNIHC4Ff0vfZR686gtS6s44WbM1z1wMUCOdupnqWIxYb5flAF
         gr/Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NZnseCNp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b2c5672b1esi115861086d6.73.2024.06.20.02.55.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Jun 2024 02:55:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NZnseCNp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sKEVk-0003VA-H8; Thu, 20 Jun 2024 05:55:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1sKEVh-0003Po-Rd
 for qemu-arm@nongnu.org; Thu, 20 Jun 2024 05:55:17 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1sKEVf-0005kr-Mn
 for qemu-arm@nongnu.org; Thu, 20 Jun 2024 05:55:17 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a6ef64b092cso73956166b.1
 for <qemu-arm@nongnu.org>; Thu, 20 Jun 2024 02:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718877314; x=1719482114; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=SUZwthDtG2fuP8/5EbZqEBmw672XXZZwzpx0iio86zQ=;
 b=NZnseCNpGsOwXfw+3DIfO4W205caEITCTKlpaQj7zqwOubCmFSqpVVJHFVHsADHrwC
 re0yPQ7J9yW76Bg7YoKWCoR/EM54aNI+xnbCGZ89clZ5rtXoUqgrmkDeY7IJGCSwLEt0
 GIEGFtuapQtMbsdmv9AUtQZqt9bl/E8MN+z5wseKrh6U9LVtRY/g2oMLTK2v5oOrPhXs
 fM2ADQddDWgUHwlYXO/uMYyd9pZ5pQUqLywtasrumAPCJCbZU2afDwShZMeIsOZRVtVb
 n7XFSvmrZk1q/D2Gspg3nvoc5NT6Vb9fM7U1WhsrQGyPl2FNOKpVGIEUWDelJCpRs16I
 4IOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718877314; x=1719482114;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SUZwthDtG2fuP8/5EbZqEBmw672XXZZwzpx0iio86zQ=;
 b=Ifat/Q2mSxsG32UP6YU68qj7pIymk8xwXNbx78uF3nDxM0SuReMbMYY/zn2Uwy+YPJ
 G3CIVYl81hgQTJcQvKm/81JaPFb8sT6BhcaHfT991SQK8x70N22tc/mP0kE+yE1vYzOH
 brTGreaebV5p3O4Aj7HmRPiDxstwGKB/tgxHBLZjysgZIFVXm9+pyt4X+8betb97jodJ
 3FXSWdh8yUre7Vsh2NbaQiZ8xmcSLSJIF5VSu8FxgoJxCvAqhlbqGzdJ93jZSjNAIW0t
 UJyT5ik5d+aLuv8THmTjbrL8jtdeiwYDaWK+QxgagVAwH5skd65NrqDFj1rtQo1rnTpF
 FB2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSbBLcDIyO7221trkYh59ydH9jXze6zZlF4MBH7V4YjtMqW9eESRPXqjXvaMYMAz4bPlCf5zZz5TRgqDquMhGS3RB5
X-Gm-Message-State: AOJu0YwLnTkb20S5KhqPktxvKXarBCDqkSgD13UrPwY9fyEV0otHKE0z
 of2YHfjDSpUkq6qzDfA6Qo8beAPbNoQVbQIwKiLCClMNwuj8cVUoW5cCnqznFcM=
X-Received: by 2002:a17:907:a644:b0:a6f:b60c:2c08 with SMTP id
 a640c23a62f3a-a6fb60c2f79mr245355166b.24.1718877313483; 
 Thu, 20 Jun 2024 02:55:13 -0700 (PDT)
Received: from [192.168.200.106] (83.11.22.244.ipv4.supernova.orange.pl.
 [83.11.22.244]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56db61ebsm744375966b.56.2024.06.20.02.55.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jun 2024 02:55:13 -0700 (PDT)
Message-ID: <d7880fca-2bfb-4368-9419-8227616f2ce9@linaro.org>
Date: Thu, 20 Jun 2024 11:55:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] tests/avocado: use default amount of cores on
 sbsa-ref
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-arm@nongnu.org,
 Rebecca Cran <rebecca@bsdio.com>, Ard Biesheuvel <ardb+tianocore@kernel.org>
References: <20240620060014.605563-1-marcin.juszkiewicz@linaro.org>
 <20240620060014.605563-2-marcin.juszkiewicz@linaro.org>
 <CAFEAcA9XbYr9jzYm908_stCUrZCqixB+cysFTRCe2MnAFW1FVA@mail.gmail.com>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Content-Language: pl-PL, en-GB, en-HK
Organization: Linaro
In-Reply-To: <CAFEAcA9XbYr9jzYm908_stCUrZCqixB+cysFTRCe2MnAFW1FVA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: GcEdyfX24kYD

W dniu 20.06.2024 o 11:34, Peter Maydell pisze:
> On Thu, 20 Jun 2024 at 07:00, Marcin Juszkiewicz 
> <marcin.juszkiewicz@linaro.org> wrote:
>> 
>> I was wondering why avocado tests passed with firmware which
>> crashes when anyone else is using it.
>> 
>> Turned out that amount of cores matters. Have to find out why
>> still.
> 
> This commit message confuses me.

Had no idea how to write in more readable form. Will reword it for v3 
(with reverse order of patches as recommended by Philippe.

> It reads like "running with two cores will make the guest crash",
> i.e. "apply this patch and the test suite will stop passing". I
> assume that's not the case, but what's actually going on here?

That's exactly the case. With sbsa-ref firmware which qemu uses now we 
have crash if more than 1 core is used. Avocado test hardcoded "-smp 1" 
and was passing fine.

And I forgot to mail qemu-devel when I got hit by that crash.

This week Rebecca Cran pointed me that crash is in BootLogoLib in EDK2 
and I wrote some workaround for make things work. Then Ard Biesheuvel 
found the real reason, fixed QemuVideoDxe in EDK2 and we got sbsa-ref 
running with any amount of cores.

The commit message of fix:

commit c1d1910be6e04a8b1a73090cf2881fb698947a6e
Author: Ard Biesheuvel <ardb@kernel.org>
Date:   Mon Jun 17 17:07:41 2024 +0200

OvmfPkg/QemuVideoDxe: add feature PCD to remap framebuffer W/C

Some platforms (such as SBSA-QEMU on recent builds of the emulator) only
tolerate misaligned accesses to normal memory, and raise alignment
faults on such accesses to device memory, which is the default for PCIe
MMIO BARs.

When emulating a PCIe graphics controller, the framebuffer is typically
exposed via a MMIO BAR, while the disposition of the region is closer to
memory (no side effects on reads or writes, except for the changing
picture on the screen; direct random access to any pixel in the image).

In order to permit the use of such controllers on platforms that only
tolerate these types of accesses for normal memory, it is necessary to
remap the memory. Use the DXE services to set the desired capabilities
and attributes.

Hide this behavior under a feature PCD so only platforms that really
need it can enable it. (OVMF on x86 has no need for this)
