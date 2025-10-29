Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F32CCF9EE
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Oct 2025 21:48:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vEE1g-0002aL-1A; Wed, 29 Oct 2025 17:48:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEE1e-0002Yw-O8
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 17:48:14 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEE1V-0006pK-6N
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 17:48:14 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-46e6a689bd0so3233775e9.1
 for <qemu-arm@nongnu.org>; Wed, 29 Oct 2025 14:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761774476; x=1762379276; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HMV4D1zqNPd0U3XrTFgmqX0FeI/ZzqBfVv2ZQim39cg=;
 b=aqwuC8IthqiR6RD9Ph4jAdYeJimU7LaGwEEiHNjSHeobC1W1bdUOSFfrYXM8CZUWVg
 wWwBoHZYGIMb5kOA5D2AjFaJ7XjOXJ6EEBRDbt7Y5+fJfbvcY9HuXQm0L8d9Lg/MZGCv
 r0LhLamn9HGGprA4Hkok5a9iLWMlrF42QuCL+zMmvzG7+VL2E4mElvReuiyy/OHuhxf3
 38wknB43dtNDhrcH/QZe5f1+aFQfzjwzCy6P6JE6Clil8fNa95r77WMjvd5YCmcQKA7i
 pYCTu1poj9zr/pZCrSXAYTkOEkWhSHgatz77MVO3oWtUGK0o13EcgoqO35Su8TmOeH07
 kRXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761774476; x=1762379276;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HMV4D1zqNPd0U3XrTFgmqX0FeI/ZzqBfVv2ZQim39cg=;
 b=EymbTnEODu2c7WqNvqmBVumaMHo/zeUM5BAnhMQSD451pb8YBFQm8jDQUEIOz0f/6n
 aRQlspgVN7CJwiVgj6sb0ClsA0/SRFm9imW+ANYYWQ1aaajzpsAfJ+FQZqn43RGSOQ+E
 6oHYZrTzRADQHp80jtgUR4XTRee+0GQUalvueOATlKF+V/1zW+jn1w8c1ZIJXvdhR+Ph
 6IZ2UzCeA7OWaZVgLOQmnGF0ryrHEngHI6t61OEq6os+5DgpcUw+9AmHPOhrKeVvFn+C
 8AuKuha5XPLjH3NO6vbbSbGbnTlHlf1xX25OmCgWWkuNJ/4E27LlAl17+JupWM0h6Oo/
 CAVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmQZsb/jamDrs6r6n90fZZyTxM0J43Uu1BFlf/ZTdQhT8eX6wxqzoFULOszbduT85gjF8Cn54FsQ==@nongnu.org
X-Gm-Message-State: AOJu0YzCmXKjUwWiVe3NJfAOo9T2ZMvPhm8cCZg0fTanwwMF6dxiiBip
 fTNWZAaVA4mXzjfHcMpyQU4hEZWuOWogba1yUs3z9mfL2lXQ0k6kWINZxhJiBPK/aKI=
X-Gm-Gg: ASbGncv9a2OgZjsetaVdGJQzkedOi5KHQuTlMfejFSEnzm/uDNOHwIGFgEV4gPudbBG
 DUgvu/+amAyW6YxDVpJl1U7XaBwf92/3wl9lwtRBKwYThQVsvBCW/aAWBZgSIu4pOHr83Ltp3sl
 DA+nv5yEXxuEY+dx5XCNvrNtaPctWbJa8RE3be2UnnmDwTHbliwS9Ih+n7Z4JsjF+LHR97kKhxc
 Ou6XmMHYWPJwTSzg6jWfDw7QkKX7+UCf2W95+mIYR87yW8ZPsoc4orpPYhj5jyIMFC5DGuTJDod
 rSZpRHI3pzvUZtJCU32cRHCVkDqk9d4+jHvjB54Co8OKEvFMZHXwjV9kkhXCD5EXceto5h4Fvrk
 NaNW/cyxNuqgCLvFQOHTQc++xBlro1Pp3fpREYf5KbO0jp92Vq+QDkpX+8BD7++hfYvCw1tPudR
 mqbgwAk3khChgOJINU/91YVEXFid5qdeQpvCojUEpsoV8=
X-Google-Smtp-Source: AGHT+IHoCsuNBhAAnlYzS1c1lZuBjLyuSz2j24w4/0gz+umMtU2uOJ6tCuRf0UbPo+zBmyPv4ocKkw==
X-Received: by 2002:a05:600c:3b8c:b0:46e:2562:e7b8 with SMTP id
 5b1f17b1804b1-477267bc9e1mr7263985e9.21.1761774476152; 
 Wed, 29 Oct 2025 14:47:56 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952d5c9dsm29552826f8f.26.2025.10.29.14.47.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Oct 2025 14:47:55 -0700 (PDT)
Message-ID: <a6b15e1f-3476-45c7-8451-7dd81adcafa0@linaro.org>
Date: Wed, 29 Oct 2025 22:47:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/35] audio: use /audiodevs QOM container
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
 <20251027151045.2863176-12-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251027151045.2863176-12-marcandre.lureau@redhat.com>
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
> audio_cleanup() is already called at exit (similar to chardev)
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   audio/audio_int.h |  2 --
>   audio/audio.c     | 38 +++++++++++++-------------------------
>   2 files changed, 13 insertions(+), 27 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


