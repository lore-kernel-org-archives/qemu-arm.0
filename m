Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD13CCF9EB
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Oct 2025 13:49:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vE6Y7-0007pz-58; Wed, 29 Oct 2025 09:49:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vE6Xi-0007hU-VX
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 09:48:55 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vE6Xb-0003dI-SF
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 09:48:50 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-475dd54d7cdso18169505e9.1
 for <qemu-arm@nongnu.org>; Wed, 29 Oct 2025 06:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761745717; x=1762350517; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fTMVR8gw3EuZ3Za34lHf85PKBf7x5FlDWGpsot4bzmM=;
 b=XkFjobWO4Qdk9gOfj7L99h7Q6CyliBJ4QLNqplvS4N/OrHbuNqoFGx+besFd4QHdi5
 p9Y49n437qDFzuquLgPhThV65oYSRTOIQX07nsPzBnbthSQDhgjLGwpB9+P/0+19zSOJ
 zDkwEfWAZQEP9tPGQxquEKkhrHyISMoYypdhE1ogiZc6DHxm3BPNqM/NMYqRDcm9hndl
 2Xpu+erTwvcwOBWsDWiEEVjpBcM8ExvKmXD0ifBjpi3Xi8Qp9ZNBH3Hqkur5a2NTxDGC
 ZBnfh0ZaGyOC4SLj7H8TRFIfCBwqrkh1vZr5n1n40Q8uNrwATUvsuCzORQESmEYHgzDq
 odxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761745717; x=1762350517;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fTMVR8gw3EuZ3Za34lHf85PKBf7x5FlDWGpsot4bzmM=;
 b=VlNN66CH8GLWDp4fky0FfsICJP+v/VwwWb22Y90fcDSH3GVg2OZFDAnZn1D92bDmxo
 p3T22Kw97nHaEJjTEF+aRojlKapMdmTjdQ1Ns7S8nD0mhG94dFRGGsWxRGO8ISfslEuL
 LSGCS41yFUPsU0YiYsU5mRhBBQydylNi2eqn15P/CLYW7FdvkLimLVIfqR+3xIoWwl8J
 qj9OTk17Re789Xr9sZCqcDYPqNrisYhq0dBSAmCym7AbP/lUfevbWDNhdad6wIgVw436
 gu2WI0+X4QkUubxtyxPQvhmbWW1s6fezaV+446iMfkcZYQ91fVBmCt13ZusTnsTnV/1F
 znXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaJxAlrOzUxYqid6x+yGwsoiu0qpstFc09KXC/3R0mp3REBLWbF9VblqjtjHjw3jv2eA1lDiUpnw==@nongnu.org
X-Gm-Message-State: AOJu0Yyxq4KYElFgQDYPzw3U0tATb+XBciLZoxmtPbX4xpBURI4cWMu9
 mSOLtJmDtASQiAtrn50hUz8uMnzwd9XFNyf2k8uNTcieWyjavrnoJ+pyNoKnn4bb6y4=
X-Gm-Gg: ASbGncuT12Kw5mEc+6JtmKZUklEIl6+d437E3NvTKDOgZLbeM51NLZLmVLCEYz2oJEh
 h8C4Zmb9UaatBACHpGPqJp61DXtLdim1nh+X1bTPpQtAaICIEpDOW1isodHcnetZqWhh3b91Ynr
 HTvhy890fGU7+26oEHwQFPr6yzlGN1W6Nwlk/VM/p+0p9w5pjxW5stztJZQee3GtJunlZWXkVnZ
 Jo5teOWd0C+ssSDfvn4hmiQ1azDonHXnI8jC7cxU/bfDYWQ+mY2806Z66Lnzj+ZxI8vtO6SYO9X
 ooh0KFF7Hf4tgDQmHddZrXaQzJPM6EthrAqpwQfmXPbPvd8FjUvWZSpmby0eaS0uD45kx0XcaWe
 cZKCHotYAND/Sd8yW8kH/BTPiT6jXq8FWqsmGH9fP8FRv/2cifodsCztICsUw8m9KO78bbgOBvM
 30DnYOlvxULXFok/NTCEAC+xgAlQOZf2iZugHPiBt3KJw=
X-Google-Smtp-Source: AGHT+IEE4OerG0k8FqsWudZC+pY8KvgGj74uKL0ULy4gArPNCrKvEZ+60g57Yp+UyWKoksKXPKE+tA==
X-Received: by 2002:a05:600c:608e:b0:46e:4a13:e6c6 with SMTP id
 5b1f17b1804b1-4771e3f0102mr32000785e9.19.1761745717216; 
 Wed, 29 Oct 2025 06:48:37 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4771e39380dsm47474515e9.7.2025.10.29.06.48.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Oct 2025 06:48:36 -0700 (PDT)
Message-ID: <ba89ca04-c4fa-4181-80ee-ec74b8a4da37@linaro.org>
Date: Wed, 29 Oct 2025 14:48:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 20/35] audio: initialize card_head during object init
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
 <20251027151045.2863176-21-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251027151045.2863176-21-marcandre.lureau@redhat.com>
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

On 27/10/25 16:10, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   audio/audio.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


