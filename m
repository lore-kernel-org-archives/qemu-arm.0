Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F52CCF9EB
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Oct 2025 13:43:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vE6Rx-0004Tr-B5; Wed, 29 Oct 2025 09:42:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vE6Ru-0004TG-SB
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 09:42:50 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vE6Rp-0002N4-Pg
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 09:42:50 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-47112edf9f7so48082625e9.0
 for <qemu-arm@nongnu.org>; Wed, 29 Oct 2025 06:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761745362; x=1762350162; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yLXEqp9AMFVQkqy41V1LQbG8mPckdyIcZyzJQ1+3qok=;
 b=n7HXwOVz2ewJMYu+me/nAqZsYVbF4VS4Nk9/ouFcIo0TezgMxY89bEX8/2H0K+dqSW
 p5fKS5cvYgbgJHeT9YrMQpsucCch0E6XDOCKf7/5LTZs6XGD4WOnPKBSdal7ahp3e8lh
 9j2AxwMh71PnN47D6yi6xgdiA0QHYTuHrGzpAos62Rwx9KZ648KAmkTzsEfTlQQRV2XO
 vxTpILKVVDh+IzLUNAJ+BG+GaG589JgEJ2RsLvjfJVpqVtr7zcmBoMGJg5wmneiDI64O
 cxGxWimcCpP5KmuGKg7O8Zi45MuAr5Ntvb77DPcJy0ChcHiExhaM3XcbVVyR785fyG0Q
 xYJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761745362; x=1762350162;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yLXEqp9AMFVQkqy41V1LQbG8mPckdyIcZyzJQ1+3qok=;
 b=DOgI3jDSGOAhVDuB1ROCmo60ifJ4zZfaD4ce59Q7/+lzALxSN/nz97w1Jsz0zy5j/V
 W2ISNO6RVcZglAkBnjPKt/44PWlcB+fPyZVxi0zXhJ/b0uKqEsRVBMZQxmj/eLiBRQFP
 YE8ILOE+2fV3lH7bavDVExtFmy0/RJgTmSRR90ie7YBCbAu8JfY6XLUV4I5IaYs2nXRK
 lLwESGBC8OAV8GZzAgYd6KdXozfPwIRRA/xgVud3GpZAp+zV+QhNsGNi2Alvc3ykqVIL
 4v60YErOS8sRhEWOf9IvBi7ecxh8A+KwXPAkIXqG2zI6wNj4gSWa60eL19bph47xxysr
 GXtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRmz43JwUqwxAl0pPHscP4u2hd4UUN6/3YK7Kb9ZmHyIV2c1pt27z+K0sDfPmBM46npi2ZsSbWDQ==@nongnu.org
X-Gm-Message-State: AOJu0YxNlVtxOT7IBoPzDRkEqgm2h3lKSesDdwbdt7WMRoLxdRWMle4u
 /0FpC68d/V7wMZfzDAltGgofMdZgVyTZhremqEWMxU9XMY/vNJxFqrN3iM2F7fV6Jd0=
X-Gm-Gg: ASbGnct67N3fJ+SVPLclhU81F5OS5OUgegPsBfqkuGuJzf9VPlX+QUpr8txNqLU5hLu
 nKzUrLCUimqv1LVcCqTtPQVxKlppYCzYxHS89pOO974tRK8k2TkatUhSUtgG8eJxSQ3oPPxMI/M
 YFDMWJBwKtWJszGGijh+Gs4NeaWkAnKBJNsMduIUavtnmE+WDmAwkctEuyJSNjrJXjOUILpf4o4
 06elIkcZbK9r90V2wFj2HTCLWypVVrv2ugtsi77S2Wq1xCTBr3jjQvCgBsqltnPdBCQuo+Dqiqi
 rKjVRqAbVCqNK+oBqkp3Mi0+f/3AWYXpYSK94geanyo+L3lyaeaLWYreLzh/XWrc4/U75xLE8rF
 jg3FEEgIV0NeN1SmFJg3pMmgvBZrhU7uOqm2MQl6m81Z3fuimh2lqJ/ZgsUwmn2i6XOK38ifEkq
 vWCdzNxiTqRtwIH/gBkmzyJQEsONz2XJ7Ooz0/6nyA0Mg=
X-Google-Smtp-Source: AGHT+IE1hmcoBZoZObbarq/8wPi5BLyKPTgD2lU/IyYdYctNJopLmVgddbjhI6ZCMqV0GJ+8k5oJOw==
X-Received: by 2002:a05:600c:4e09:b0:46e:206a:78cc with SMTP id
 5b1f17b1804b1-4771e1e1079mr32781795e9.28.1761745360541; 
 Wed, 29 Oct 2025 06:42:40 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952da645sm25223925f8f.30.2025.10.29.06.42.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Oct 2025 06:42:39 -0700 (PDT)
Message-ID: <2c4470f9-e71f-4c2b-acdb-860648c2e571@linaro.org>
Date: Wed, 29 Oct 2025 14:42:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/35] audio/dsound: simplify init()
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
 <20251027151045.2863176-14-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251027151045.2863176-14-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
> Use dsound_audio_fini() on error & fail if the capture failed to
> initialize too.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   audio/dsoundaudio.c | 29 +++++++++++------------------
>   1 file changed, 11 insertions(+), 18 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


