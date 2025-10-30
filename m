Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D59CCF9E3
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Oct 2025 16:41:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vEVhr-0008PT-At; Thu, 30 Oct 2025 12:41:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEVhl-000895-Qt
 for qemu-arm@nongnu.org; Thu, 30 Oct 2025 12:40:54 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEVhV-0003HC-Je
 for qemu-arm@nongnu.org; Thu, 30 Oct 2025 12:40:52 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b4539dddd99so304427166b.1
 for <qemu-arm@nongnu.org>; Thu, 30 Oct 2025 09:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761842432; x=1762447232; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=n3YWjyTbC+xe6Y47LFs2TmrbnnZ6YGIRWY7Vp+OyHiQ=;
 b=wcMfHJVF83gzvDRqyYQFs8oGztEfKVxZ93RmGu91MBY16Vse/8anlrXnmysPz+ywrx
 vGp/VdrC2bs9eOimmMoHK6Lno6bvK+8Q9b7C9uzm3XKEc8QTqJUTgqDVvnQ6cx4NDLha
 wcUujpNAxDaCCwqS9g95pHuzDncAk3+VgVRFC7IT5QJE8khRgJSxKkxaqWcqpZdu8MUW
 shBtpqQDXbKLUGwMu4RzpifA1f66odxyUbF/1q+3FuDSPWvdXr/YmB+wrQhRh5d4hrDG
 AfHpJd+sF11ruIi3zL8xhPqwqNVwnjLhJUort5gd5oWB4i0w0LcSDxeBj6n4W2zHCuAe
 dxqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761842432; x=1762447232;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n3YWjyTbC+xe6Y47LFs2TmrbnnZ6YGIRWY7Vp+OyHiQ=;
 b=j4qzfpWKF5jPZ+hA9+8EG0zCGDUhnIuQjbZa2k1vSRcE4Gbwd08Lg/H51k/ScAFDKe
 WXg2AVi597wLJR6D4TpGrhMZ++pXWWT8qDZa6Eef/R1iUWBN+SxT9ft+5MBf0WzXKXW6
 7EYsSQ9HZHN02R4Eu3H4qe10DIoYD+uFePK8iLFEA/jmr+yGwaiBzOrN5CyYAgMzJ5Mr
 bSerfXBhJaS8r2+VKfiRiKH7Hfp3N293mqSueYuhL3uxEINqemrM7Q/YtmQuIS9QJ0fV
 VsufixxvDUbDVvDW6U+DPGFVhmaa/xRIQuZx9N7VcoxTAgWFVmFcuVwyYv3U7E2TMb8B
 /cDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWF3gwfbRYjybYjjqBMVlurx72T62olv7THZ75Xd/rgoMj982GXjWSoQRiKJeDTft2cHBQlnRry+w==@nongnu.org
X-Gm-Message-State: AOJu0Yy6O7adnWqtuemJxIXfe+Q2PByZc2Ezxcd8RYHVoK7Ucp1MQsS1
 WvQwlaj3lj/YtzdzjnrFuIrDoNbQs99LHbH5D7X3mmOMuoHeVOfcH8lNvmh33zCJJLs=
X-Gm-Gg: ASbGncsPBy3BLuvZCIBzg8NqDgHG2NeD4g11myUs5J8BQSoLbuL/0EIYz9wV4d/jAy9
 +hxzhJVv+a06ozmSpoeUFLMaLz8JupuB3ifzPSk6CUNbFSkPjlccugY02emO5vnOEDnixlf8Pip
 +LCUvTYXJbfc31zvLL1azhKl472NOaCz1Bv7kVJ52zyqs1/VOXK5aLJ10L0VQBMhpCQv0jj3nQs
 A+qrVFSZFTsQQOoqdiqCPcXdJoJYMYHcaQublH4FVVP0NWMLD0VRy6QfGoPsmuKWqc6ST4JxZdi
 m/bc/9+/Y2nFBzCoRpnkVuFUC0C51y8sWGhJzk9m8iB+O2r3mXZwr+rU0ujc9NFw6yGYd8F8OQ3
 sz67/LstT26mpgal3ElotqcaBE825M2q7mliRff/AVQj47z2SjagdpS2HKEHad1BWIoWco31501
 grQscEmf7yZQoS9s0iXw33thNqWjsj+jIY8po7cZzWvQ==
X-Google-Smtp-Source: AGHT+IF83aVJAcc9Fc0RHqkJhZzsj1sH8crT0fm4JwaXtr9OmFhO8Y7Wjqz9YJg1ydfwP0oyt8QXuQ==
X-Received: by 2002:a17:907:7b8d:b0:b5c:753a:e022 with SMTP id
 a640c23a62f3a-b70701dc398mr12715666b.29.1761842432115; 
 Thu, 30 Oct 2025 09:40:32 -0700 (PDT)
Received: from [10.180.230.213] (183.105.204.77.rev.sfr.net. [77.204.105.183])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d85308c8dsm1800518766b.0.2025.10.30.09.40.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Oct 2025 09:40:31 -0700 (PDT)
Message-ID: <108b6d8e-e34b-4574-ab91-e141dcf77af2@linaro.org>
Date: Thu, 30 Oct 2025 17:40:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 32/35] audio: move capture API to own header
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
 <20251027151045.2863176-33-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251027151045.2863176-33-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
> For modularity/clarity reasons, move the capture API in a specific
> header.
> 
> The current audio/ header license is MIT.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   MAINTAINERS                  |  2 +-
>   audio/audio_int.h            |  1 +
>   include/qemu/audio-capture.h | 43 ++++++++++++++++++++++++++++++++++++
>   include/qemu/audio.h         | 30 -------------------------
>   ui/vnc.h                     |  2 +-
>   5 files changed, 46 insertions(+), 32 deletions(-)
>   create mode 100644 include/qemu/audio-capture.h

Good idea.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


