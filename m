Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA66CCF9EE
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Oct 2025 21:52:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vEE5R-0006Lj-QU; Wed, 29 Oct 2025 17:52:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEE5L-0006IN-BN
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 17:52:03 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEE59-0007pZ-JO
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 17:52:02 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3ecde0be34eso1019202f8f.1
 for <qemu-arm@nongnu.org>; Wed, 29 Oct 2025 14:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761774705; x=1762379505; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nIc13SZQBDmIQ8+zujnMI9gijPzWOXDFfbaZsmNomsg=;
 b=eCs5yxFQzOHJPDaQ5UdUKu74mbRBtLSG4nQ0TbPewkvC+eHG1+eCt2BizZej1S0EgC
 Odi8700CHpRR3SO2SauoXr79I4O3HJyB/sm8GJRJaa7szmtc7GR9tHqy59LIFaAUt2sE
 A+mhwwGDVxbCUbAu9stt3JC5Hp/CH/5t+41jEFP5JnC8MhlOr+AdskIP+uamV36A4YCk
 aK24WO4KAsZvvCwJvZzacxb+A2sJwfTS+XaXUhdKIa8f1vbBX/wwnGarZdTaC05D9qXm
 yzBF8K2Scl3jGr4nqwhH1fGUzUQ81WPGgQuT3yr6OZI3+KV9ca4zLb3mpj777SzKOX9m
 SwJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761774705; x=1762379505;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nIc13SZQBDmIQ8+zujnMI9gijPzWOXDFfbaZsmNomsg=;
 b=YkhH6RyuT4wiJsLHXJfqcabJHl3xmYpkIIn9ne06j+Knia5pLOxNw3yZDxyK28gYx5
 1iTo51euD+iiVrb3XqNAaGPZ1iAHx5zpo6KnDcFCuwHIDE6vv/YFpG89a4z0r/Fg60iH
 KaU3OYfGTPpc7UJdHwYU8Ct67o4koNvf1V0AjVGRiDS3DeS1iJM1f4Qxo9uuSQHcvlsU
 gLY09EWY4afo6dBGcpXTom3KssYxEp1qb0HpW3OO/niPLmYujF5tHAaWGf2PnbnyA2CG
 0LHkHWg9IKE512AZU+ENjuWEJkUZC5xNgOi9AS+vAQX+jil2AcJ6X7lBhLu8E9H4Lbbx
 K6Ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5UCgQaecS0BSFextXDup5CRWrrJZCIoLJzAwT/ulVodbBbRHDBYaAMI2EmVdi1uoHAdF8+xHlGw==@nongnu.org
X-Gm-Message-State: AOJu0Yyj2KYnt/W23gPhdDvIRKFgiCj2YWgFTCrP3TADSbWNh1iQaOIi
 wNoFEEv0XFJEe5y0np58Z48eGf2sN65WYHS1F9K2do12+XMuM+sjrMbUnRlu+9NQamA=
X-Gm-Gg: ASbGnct2OEPqN9NuhmPo9C+eb7mFFjAfGUVBPK/fIK2v/QhBOJH28jI/4SzcPdyW9Nm
 DdtCnICdO8y6PCkoiJJTjpErVnjISRLw+fTYeNL90ApMCpmxssDiK+yxJRa2+CO3awsWqZuD0xt
 wfEQIh3R5Bnekc2VnojcoNOFHRSkWG47wBdHv3SoozkqwsdUrEauze51XZFw6bXVgwBz0Oz2bj5
 RN9iLu6Tuf/UadCJ6Bxi3TIL1BU8jDxXgxb1EYnYtNnjxk1IMhEp6IAVhGs0fwwItL9w+C1iJyp
 sf2Yx10D5xXwFnO5xOPIDkUG+ys2kk8M2GvSZsT3C/Wy6dXZ9dwCs+okPAJM7D/2pFsWwvB3r9d
 f1l/A0AXVg4yofFzshuk0nIi9BawpGrkEtj00tQ6rv0CtqF+6FVQBYI1R+tKcHXarywFzq3lsW5
 Qr9Lmi+CnshL/O4R04UIt5MiJ4yQ6t2ukeOsEZdaWmZwM=
X-Google-Smtp-Source: AGHT+IFKBwXOGSNuwF+MfTP6NWYsZQYq5U8SbSN7wDe5uZELAIktJv3AlfH72FX3m8MQrfDTTA+K7A==
X-Received: by 2002:a5d:5d13:0:b0:410:f600:c35e with SMTP id
 ffacd0b85a97d-429b4c38275mr899593f8f.8.1761774705245; 
 Wed, 29 Oct 2025 14:51:45 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952db839sm29580402f8f.34.2025.10.29.14.51.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Oct 2025 14:51:44 -0700 (PDT)
Message-ID: <2f7a3fa1-bd36-4717-9949-2dbcd5842d18@linaro.org>
Date: Wed, 29 Oct 2025 22:51:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 24/35] audio/replay: fix type punning
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Alexandre Ratchov <alex@caoua.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Jan Kiszka <jan.kiszka@web.de>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Thomas Huth <huth@tuxfamily.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-ppc@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 qemu-arm@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 Zhao Liu <zhao1.liu@intel.com>, =?UTF-8?Q?Volker_R=C3=BCmelin?=
 <vr_qemu@t-online.de>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Laurent Vivier <laurent@vivier.eu>
References: <20251027151045.2863176-1-marcandre.lureau@redhat.com>
 <20251027151045.2863176-25-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251027151045.2863176-25-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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

On 27/10/25 16:10, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   audio/audio.h           | 6 ++++--
>   audio/mixeng.h          | 1 -
>   include/system/replay.h | 3 ++-
>   audio/mixeng.c          | 6 ++----
>   replay/replay-audio.c   | 2 +-
>   replay/stubs-system.c   | 2 +-
>   6 files changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


