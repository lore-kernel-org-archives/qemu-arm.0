Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F20CCF9EB
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Oct 2025 13:52:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vE6an-0002jZ-EQ; Wed, 29 Oct 2025 09:52:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vE6ad-0002b5-HN
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 09:51:52 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vE6aY-0004Gr-TS
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 09:51:51 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4710683a644so10309135e9.0
 for <qemu-arm@nongnu.org>; Wed, 29 Oct 2025 06:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761745897; x=1762350697; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=S3EFCcFvKD34fTRFqPt5CRFwrg+Z5J50HVINceHnPS4=;
 b=mE0U5z89/rk7N/OpRJuaCqs4fe32tfb7//ByTGTUiD4z7Re3cWkojzxJx4w77vWXKR
 zr/KNw/7QW9jZqCryvkzKWNK8w2ysmgJMJmRw4//IJ9KAxXBmsH25qLJMwREAUfNEkTD
 hun4wCSJkxKNnjPZ5FpJ8O3soWAMJ41bn/N5fSz1kG0ccpII9wrW2+p/rFDWMQPn4wcm
 wRkRB7bG8NJDmGySC5bp9vayBhFytPiWnmnekhUYkHC2sXSz9VtdsIFomdv+7MyTJ36Q
 8GR2rq3erUpMURWVQh6tC/TRoMmMtSMNkuMRkMwfOof8eQSi4KGCW5y9E46+cZfMBB87
 /Zxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761745897; x=1762350697;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S3EFCcFvKD34fTRFqPt5CRFwrg+Z5J50HVINceHnPS4=;
 b=kCIHzbRHtKUsQ33rgrLsC3hSJfzsOw6aZ6G2nPMb9yRrotUivAbweIjEbPwgofc6ms
 3vosG9NRp7C6dcIlHCjKqT3aSTElnDp53TCz2UhhgIRcoMVjUZ2tPQBPRz4cU2vEzc/h
 VOaKoQesuEo2g5453+w8sc7wbEP4UuYvXNPGoOnwkm5KVtXgPvprOy+Fgo8n4wT/yP7v
 cJL+DQjm+r3bICxilQ74Z8eGBdtlpx3myqabvubpzGU1oYH3Et8xi1ZDmrr2WJJOseE2
 rg1DjUb3f69Qe+nCauzfTFaafLP/TDrafjyXxJVezG31I/cct2g7HU2mnGyM96vjHeLj
 CbdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4rfPbVILfczch6npi+lOXDJ3Kmd+bswSV7nmdU12PS6H2dGRHx7QQEKpxdLwQW9DKOqA6diIjWA==@nongnu.org
X-Gm-Message-State: AOJu0Yw43OB8ZvXk38H7e0zfCno1SzEIry5FR6AvlUELM+YY3K9qgNbf
 lWVhb5xeAvK8KtSB+ROpQXR1x7aMMEnTkikWUeXL6TkSsJ8FTd+j5fvYd3y6ZGdjjfs=
X-Gm-Gg: ASbGncsyVoX/Vp4zMDx7E/z2UKbV+9tX4ckwrJ832NmdSwmNO1NlVreXigekUqUBzTO
 GF3dRHJtcpbB0G+Kfs+4CBMSH4MzFe5mlS6un2aPvzT++NWAozbfE+7un/N5h7RnkqFGkHmLBxv
 +n7vQ02FB9BsFzgZHHjLDetuzARFxDDCETzXZf2oCmYFDVXe5YwWIYhjF2CshM0tr13OaFD96JL
 eBssk6eJseYPHZpxRq9ro95Hvrq2qKoqO0HPXd79vgMl1QGiht1EFwU1sizw/eU63mEoWhKfBkX
 OM8X7zzoNFe82LKDQSAVutxlBOeYYhemSYsxklD85fyonIeqyRWNKGQ8E2vMUMkdPDqkGF2QJfh
 CyeEekajejuZia7an3ZIAzAG+AFRy4qTSpZUf4ULuuf3efy7x5Gxi36UIN6mceS8hSP0uzEyttg
 N7NqJSX5lygiiJQmFhUdAbSgg5W7G3GJJ152d9cVFa1CU=
X-Google-Smtp-Source: AGHT+IGk969MaDnboiOUQgj9GWk8LuPpPzy9PMFUc0Bt18OVoKikX9llhYkMv09U3nU4Jm48A+TmZg==
X-Received: by 2002:a05:600c:a58a:b0:477:11a0:b746 with SMTP id
 5b1f17b1804b1-4771810b645mr40317845e9.6.1761745896764; 
 Wed, 29 Oct 2025 06:51:36 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4771e39380dsm47596885e9.7.2025.10.29.06.51.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Oct 2025 06:51:36 -0700 (PDT)
Message-ID: <876f8ea8-670d-454b-b05e-ad6be27e3624@linaro.org>
Date: Wed, 29 Oct 2025 14:51:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 33/35] audio: drop needless audio_driver "descr" field
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
 <20251027151045.2863176-34-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251027151045.2863176-34-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
> Was it ever used?
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
> ---
>   audio/audio_int.h   | 1 -
>   audio/alsaaudio.c   | 1 -
>   audio/dbusaudio.c   | 1 -
>   audio/dsoundaudio.c | 1 -
>   audio/jackaudio.c   | 1 -
>   audio/noaudio.c     | 1 -
>   audio/ossaudio.c    | 1 -
>   audio/paaudio.c     | 1 -
>   audio/pwaudio.c     | 1 -
>   audio/sdlaudio.c    | 1 -
>   audio/sndioaudio.c  | 1 -
>   audio/spiceaudio.c  | 1 -
>   audio/wavaudio.c    | 1 -
>   audio/coreaudio.m   | 1 -
>   14 files changed, 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


