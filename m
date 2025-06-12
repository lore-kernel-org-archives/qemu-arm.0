Received: by 2002:a05:7022:658b:b0:a0:2f73:dc0d with SMTP id bd11csp3274521dlb;
        Wed, 11 Jun 2025 23:09:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUgCev+FTgmPsa85OEhnz1fTCvPmPQI0GmsZJEyO0AaXWOYrcKaLbgMyZA/WEJrImry8zEtiOQuUdgFDQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFdMRoGfN1L7qYp/A/q2po5ZWzAmFOTs+OOAqSHr0boFqB0ekqldd/XrYL3M8Kuw60dEr9w
X-Received: by 2002:a05:6214:5099:b0:6fa:bbcd:2786 with SMTP id 6a1803df08f44-6fb34ebe855mr33654776d6.38.1749708563614;
        Wed, 11 Jun 2025 23:09:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749708563; cv=none;
        d=google.com; s=arc-20240605;
        b=Wss1GSPJkyOzs5yZ+YKrgTc9J20k1stB9hEsXiIvVsZAK2xai3PvWWOi3H5YEuhK7z
         4C0sbd5Y+SmS/rVG/bgx2Dd2LGC0eKJdH4Lf1BtATaidnuK+V5CHE2lG7hW3uhOhL7oH
         /YlpOn0tIPtP9xZpKEO2f3nkjFGwNmK001FTEFMm/Kh+WTBMcUu/marDGMTU2/S0tW6M
         wVFJlnckxW9ro7AN5Yc99zIKNeURKDE+41lN1V2N2VYrSlE1W5fVYryIergkP1fLHDzr
         cKeXCtgsdV/LpxUjP5EY5V/rmOMtIUnMH02Gm+ZnqYMDr9ByNwsee45XeaBp18A5EOTl
         pHrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=Sm3991lpez0COJtwT+oTQPq9Ga1yM8iUreg0LZXFtak=;
        fh=9I6dAxTJt1lvMz1FSHugqG7+nD4dIR3C5X46bP8UqIk=;
        b=g6AuYdo00T2r5gFvxqNz0zacCi340SkeM6nIxi0a2LA9cjXcVsaCDHa6suesIl+Nia
         oDfDqBYtvWcMb2tEOAkC/zGZzE2A7yqi/qcg/byL63CFsZFLkxqAGgA8PqEeycj1M56p
         /TosZ8l8Fnx+F1Jy/uXT3NXOLTrCekVGPhn+PVQmb/BhPNus9IWcrUoS0wWseOWYAA3g
         bHfRjfKkFEVxafoxgS+UiBj0YEZbt+45d3y3+hrZ02ytEpvjCePNS9jsPWRB+LvdWR3N
         pdZE8ly+05NbXyuFvF88x8mjTNJwnlv9fWgVzumT/xtCzsrrrsYoN5cJCrQU4dHtt950
         PjaQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LSZsJR8T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fb35c3d893si9725976d6.486.2025.06.11.23.09.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Jun 2025 23:09:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LSZsJR8T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uPb7j-0001td-27; Thu, 12 Jun 2025 02:09:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uPb7h-0001t0-Mg
 for qemu-arm@nongnu.org; Thu, 12 Jun 2025 02:09:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uPb7f-0004nj-Qd
 for qemu-arm@nongnu.org; Thu, 12 Jun 2025 02:09:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749708549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Sm3991lpez0COJtwT+oTQPq9Ga1yM8iUreg0LZXFtak=;
 b=LSZsJR8TN2jbqprS238qk+5hp6tP71n9WRmQN8z8cB4srCADsByC0Ik/2JUab7eRn8Pz4y
 o1iEytojPrMgIhp/kamJnKFsx59xpDoWMeRyhUlfplX+vEah18a1BQWojNfMDWww2wvK5i
 +az25YrJxz3bJ/A4Fu42NXqUQR41Ta0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-2-0JyRA5v3OjaQJsQe0q031A-1; Thu, 12 Jun 2025 02:09:08 -0400
X-MC-Unique: 0JyRA5v3OjaQJsQe0q031A-1
X-Mimecast-MFC-AGG-ID: 0JyRA5v3OjaQJsQe0q031A_1749708547
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3a4eb9c80deso276649f8f.0
 for <qemu-arm@nongnu.org>; Wed, 11 Jun 2025 23:09:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749708547; x=1750313347;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Sm3991lpez0COJtwT+oTQPq9Ga1yM8iUreg0LZXFtak=;
 b=QBZAJcRINC59KQtuIdAKrfPmYxDYwRv4k43kvZbZJLvZBxKWEdanjruh+neEGXS15x
 1MCr3enk5A1vuwHW7t7X11Lf71OdCJhQmLaKWxqPNlA3kE1v5PbmpHBpi+6ATZupPnvo
 iIrF19tW1XmRQ3r6TKJYW6ZDi9246jsI0PuMViFGLF79GK9rrMaGBtNCR5PfB2ORitRM
 g5gDISyIEZW5ZCWjdMxy1ukCkO8W+qZ0VHpSjo+aETxBpop8I5UDeNLIIYqHaYKS7zSs
 sQzadRA5vrAU70bNUyPs5EKKib0jNIxt0Lx31Hqwu6UXY9SLbPQNJySuOByMcPG5TEtt
 O1ZQ==
X-Gm-Message-State: AOJu0Yz2FlV9gpFZMwnzVODorxAoFXemqe+3AELnc2Cnc4u3q87lAW2j
 zYSDiCGSn+WO1UppSJmviEzJwMCqPPezddVhaehZ1t3FS+nE1Nm5PxOeGOVp/4YqM1Oi0nvgVR7
 O8SMatm9BIkD6s/f6Kz35JzBouTdG4hm/wBfqpWKeGoTl34EpBIL5xw==
X-Gm-Gg: ASbGncuTchZyPSAQKRHpFwfeh6/uG4g0Ma4lisKTUi2z+cifHSipKpmKJ3Uoesu5rw2
 Dh6TtXjDFl7AXBGXezLaaMqkY2psocW5OzNhXoXHYOVhNM0Or4WYdOrgHWVCaLp5GW53tZl6ta4
 cYseHW7IM8pxK3mIhKdiXCl0Wn48ogRE7kxpa30NyRawomKbiotI3cZMJt14J2xRyXXdfqbUIcW
 EVoWhtanASTlxvne+q/DSBUufRmVBb+nGrgNHf3m515Y6D+yUr0ZHhdHSQQAlNBFzrOFXB2vSY3
 83goEiRKF/NhZo+yNyS6707M
X-Received: by 2002:a05:6000:2403:b0:3a4:f2aa:2e32 with SMTP id
 ffacd0b85a97d-3a560747a57mr1357597f8f.44.1749708546893; 
 Wed, 11 Jun 2025 23:09:06 -0700 (PDT)
X-Received: by 2002:a05:6000:2403:b0:3a4:f2aa:2e32 with SMTP id
 ffacd0b85a97d-3a560747a57mr1357576f8f.44.1749708546483; 
 Wed, 11 Jun 2025 23:09:06 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.64.79])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3a561a3c0absm966681f8f.58.2025.06.11.23.09.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jun 2025 23:09:05 -0700 (PDT)
Message-ID: <f3a4daf7-19ca-4938-bce8-dbe7d1ff8649@redhat.com>
Date: Thu, 12 Jun 2025 08:09:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] DTB build housekeeping
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
References: <20250610204131.2862-1-shentey@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20250610204131.2862-1-shentey@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3bC_EtmA3s9u74ugKc-lyNDZk-ObbInqqgkvlE_vqhk_1749708547
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: Rp43cVBcrrxQ

On 6/10/25 22:41, Bernhard Beschow wrote:
> This series removes the bundled device tree blobs from the repository which are
> redundant to the bundled device tree sources. To make this work, the device tree
> compiler 'dtc' is now required for the boards which rely on these device trees.
> Building these board can be enforced with a 'dtc' build option which should
> help packagers. For simplicity, 'dtc' is searched for in the system only rather
> than also considering the 'dtc' submodule.
> 
> I also tried unsing Meson's source_set::add(when: ...) for building only the
> needed DTBs but eventually found it to be too over-engineered.
> 
> Last but not least two inconsistencies regarding QEMU_FILE_TYPE_DTB are fixed
> which seem to be latent bugs (one of which materializes in my e500-fdt branch).

Applied patches 1-3, thanks.

Paolo

> Bernhard Beschow (5):
>    hw: Fix type constant for DTB files
>    pc-bios/dtb/meson: Prefer target name to be outfile, not infile
>    scripts/meson-buildoptions: Sort coroutine_backend choices
>      lexicographically
>    configure: Add dtc option
>    configure: Require dtc for boards with bundled device trees
> 
>   MAINTAINERS                          |   2 +-
>   meson.build                          |  12 ++++++++++++
>   hw/arm/boot.c                        |   2 +-
>   hw/ppc/e500.c                        |   2 +-
>   Kconfig.host                         |   3 +++
>   hw/microblaze/Kconfig                |   4 ++--
>   hw/ppc/Kconfig                       |   4 ++--
>   meson_options.txt                    |   3 +++
>   pc-bios/dtb/bamboo.dtb               | Bin 3211 -> 0 bytes
>   pc-bios/dtb/canyonlands.dtb          | Bin 9779 -> 0 bytes
>   pc-bios/dtb/meson.build              |  19 ++++++++-----------
>   pc-bios/dtb/petalogix-ml605.dtb      | Bin 9882 -> 0 bytes
>   pc-bios/dtb/petalogix-s3adsp1800.dtb | Bin 8161 -> 0 bytes
>   scripts/meson-buildoptions.sh        |   5 ++++-
>   14 files changed, 37 insertions(+), 19 deletions(-)
>   delete mode 100644 pc-bios/dtb/bamboo.dtb
>   delete mode 100644 pc-bios/dtb/canyonlands.dtb
>   delete mode 100644 pc-bios/dtb/petalogix-ml605.dtb
>   delete mode 100644 pc-bios/dtb/petalogix-s3adsp1800.dtb
> 

