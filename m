Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7789CCF9EE
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Oct 2025 21:50:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vEE3x-0005KQ-VV; Wed, 29 Oct 2025 17:50:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEE3v-0005Jd-U8
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 17:50:36 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEE3n-0007aB-Bu
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 17:50:35 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3ed20bdfdffso290114f8f.2
 for <qemu-arm@nongnu.org>; Wed, 29 Oct 2025 14:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761774621; x=1762379421; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2D7klcxJy6rKu923rI/ea6BUOY5sf8X73yhLfvIEfxw=;
 b=E22axF8KkWsVZRIBFzU7xIbqr3FLzXiI1HujAikWqCS8vopX/iXoWlphePE1xkEZ4U
 DPz08TJsJs6oZYSwtD4k8BynxBIdBH0ynjyOht96iVnJYUV1RfEfKOTW3ZC1u7dW4w2S
 vyRIE9zKZMTWeVazdCmqF1jNz2bjn7cilgZi2ucLAny454QOmzv1HyY+KM01SLbd0yBY
 KKTggoDkG6BcwhVvMv7vCT3K/Vi71ShNfXfzTXA2uQSEK4dkTuova/AuqmKglzCWzB/t
 z0qxr/wCcEkitgLty81X7hRjT+i/N/1hxs8pjnizuQIwdKYb7WKJ+Mb+IA7AL1MvteF7
 aOYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761774621; x=1762379421;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2D7klcxJy6rKu923rI/ea6BUOY5sf8X73yhLfvIEfxw=;
 b=lnxgoa/ytMEHtDb254ycAdsrZ1yDMC7/ezO4BE5g2yGAewaYBt9D/NicIIjRrQLgKJ
 T40sG+5rqPpkMHATy6c55YkFEDpv/HrZQWpyzKx94Dn3OBJziEu4bjgisXQqJjpF2LoU
 3HQtQ2KwBG4PgJG5qigVAo2S6jUk8FtWov7/+Ka3eW/+xHdRFxyaemrJ/8lLLcMSOcls
 S5LNLC0ubbKLVhdJ8wurbXgf69HzWm2LKlbXRKLtb1RDIILso38+PDniCVSbuCxSHGU5
 ySEzH0TjQLWfNeD7XQFQb2ohn2qMRJ5eBJVnTiKMWfrBZkildGHTwtiTroJlc77eTw/K
 NE/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSRUVdXndgiixu4blH0w0sOX2XY9heZro9glOIe9IcW4CD/g0DpYWMgCB0/RsJneLGfbYGto6ngg==@nongnu.org
X-Gm-Message-State: AOJu0YztDBbhQrZu+RTf/AlN9AKFaXJy/DH9GhOQozpaSY3J5Y8w3vT6
 L1ojcqmzOAz0upr26AuaXWUHrM2LGWL0PO4mn+G/G3WJppi+6zegx6+/r/in1nBVCQE=
X-Gm-Gg: ASbGncsISZrAZrUGDe3/TphoOFaNPGv1wKckfRuehUamjHejfJI6U4HX6HmgjRkG5PO
 N99xZ6aQ10UzLvPEcwXDYCVwpcmggDRTkxQK4emhw97HAAosB8hahsKZ7jcWSdmjAULnf6taekd
 2lt+PU2rHeVZMj3PebBpnxSn7bKst1mcqTuB2+Bo7mhk58yzcsBcPnYh7f3X+0X74x2UBCXvIbD
 9nLvWxpfeXIwWQHY/oe/wVlvubQdCPU0IFFEoIecKsD8J1PLbdVSbtXjDhLjvQAriUEPDW+zq5O
 B33BRARmpeYJ0GntyZ+DDC4qTh4l9vHJhrKppkZUTJ/exoffmd6UT0clGPUIzJ/zcArQK+H8fEe
 G+hupykQ5azv7ZmeB7B26geQZ6lHCBrb2TBqYPY84UH31KiBCGNRqLcJpn17m7j+JgF6empCtPH
 vn8UuSGh4vIP6HAADVwxdLHEreCeJXa2iWehchj5NDaow=
X-Google-Smtp-Source: AGHT+IHgkeaADTG3/YA/cckALLFnM9ByojJGFR/5rni+ROgTvPHOk4XhFr8VDCrBVLc+0iAwp00AvA==
X-Received: by 2002:a05:6000:2c09:b0:3ec:db0a:464c with SMTP id
 ffacd0b85a97d-429aefef289mr3728250f8f.44.1761774621549; 
 Wed, 29 Oct 2025 14:50:21 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952da645sm27064400f8f.30.2025.10.29.14.50.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Oct 2025 14:50:21 -0700 (PDT)
Message-ID: <f21770ea-59b5-4715-90b5-110bd5a74eee@linaro.org>
Date: Wed, 29 Oct 2025 22:50:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/35] audio: simplify audio_driver_init()
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
 <20251027151045.2863176-16-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251027151045.2863176-16-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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
> Catch and return from error early to avoid indentations and ease the
> flow & return a bool for success value. All driver init() calls have
> been checked to set errp on error.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   audio/audio.c | 48 ++++++++++++++++++++----------------------------
>   1 file changed, 20 insertions(+), 28 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


