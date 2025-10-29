Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B65CCF9E9
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Oct 2025 13:45:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vE6UK-0005Yv-GV; Wed, 29 Oct 2025 09:45:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vE6UF-0005U7-Ka
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 09:45:15 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vE6U7-0002qn-Ja
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 09:45:14 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4710022571cso75580675e9.3
 for <qemu-arm@nongnu.org>; Wed, 29 Oct 2025 06:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761745501; x=1762350301; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=j0UZJUesIkyNDkiDrZBjXLzYyoQGF+99QP8wq3RHeAU=;
 b=alI4bpXn+R6nRG4OKWtKLZDNxBz/3vAhzqkmS8jZp2MILCGM1bnCwlo2yGUTGMvllz
 3RyRdMmkwc3H+WgnjV47QC/x3A2w8UEdU4eRtXpDApx2F5V34y66R+jWJhZqvayz3+ZT
 8WXlYO5TDic0TFptdPHsdVTwhraCYZak+mT+x8n6fBOFR0qFkvARd/9FX4gIS2oI2O9D
 5+h4RXxfWPFiw3FR1YCbBN3TwUElQd1/gnSq5cjl+ByAWJqcsCHPsbTMxB9evINt13Tm
 aC6mn6Tn93qyETVF+yFyttyTEs3z2g0Vd/1JTrWUqcQbb4vp+3ns5FYhvKXgdkrJZUhY
 Ra/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761745501; x=1762350301;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j0UZJUesIkyNDkiDrZBjXLzYyoQGF+99QP8wq3RHeAU=;
 b=DBsMDCflBsUQBtxcPPTT/eaZJDsdpNje/6sEOD0HaKEUkM9JErISqHOsmhgLElBExs
 ECbR8DkzuBSO16sESFiMDR8vMX9ikvZzTbjmgf+RzFWusAN6Qw1I+pMVBC0CT3GAWNBA
 145I+/zobhyBroRYkdmKOcN/C4ToRz7Hys8LZsXTsz2sIfpbjr09jGP4GscCPV4rXtja
 uCFI5/pDKHXt2wjXOiVPfsRXg5AWPAkr3UNorKH3BIUaG7ogGiKtBY9x+p5Dfc+8FhZc
 iNRW1Iwo6VLr/FITJJlIFUKsVeYErbQlU1uqw/6jD5R814KNr5U16PMQOOnNmKtVN631
 Zjrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5m+TLrVr/7Bp2CUEgxJdV92sANG5Ti95uoheY0tP9uDH0qxAcf0yyjkvcYEhdXRVb1J2ceJ6ZGg==@nongnu.org
X-Gm-Message-State: AOJu0YzW7BmmcxGKCJOZ34flqxAvLirH78p2xR3pj6fL926QtA4mdpRd
 3FMNCIaaB/GLq8psspj2Y9m3ewC6FjuAPyNBRMupAQmXWGap6wfQTn4IQKetkHLRYrM=
X-Gm-Gg: ASbGncveNjgb51z1N8x/T674b15R/SCmVZEqZkRCxOZDpVqzIKE1Sdy2+iSCI4I3NoM
 2NXcLUn4ah97keLRqs84uv/NCUK4DG5XmdrzBS5XfXknch0Hlkw0/p5AxObARIkB2hnd47HHNlP
 lnqem5bdxkvXfSV4+Ctkc2eVFgid1xU/bpbGIbrvC0PdsTALp09RvwvsAa6em/S/6WYH0eFuulr
 PHfG36LB2ZBNh3yl8w9Zu+8Z7cyI4OmASTx+wUbzIuAoS0R9vpgK/+JYXRoPEcXXN5JTtdolTSQ
 9RsnWa3gCgCL0989K2IxK2TXjip5aURaxv37Wz6ETG4cAscHnY/kIlKUJIbajPCxbBpx7tO5/TU
 FYNEfZkjcduJ9oQqyh9p5oqjQKrKztpKMIDCTpJrJrRMdk6fBdNrZFllewn67B+gqrDK9Tz9vmt
 IHb4LXCEVWuJ6le3PQDy8b+9uqX8LR+RJjyheIzZICXcA=
X-Google-Smtp-Source: AGHT+IGMrVUnRB444z2jvh++Bb1WPiBixGvNlnbra0gJqmVOpMbfvl6x51/BZwzJiKRdm9dHhFppHg==
X-Received: by 2002:a05:600c:8487:b0:471:152a:e566 with SMTP id
 5b1f17b1804b1-4771e183fecmr28390215e9.13.1761745501385; 
 Wed, 29 Oct 2025 06:45:01 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4771e3aae1fsm48245995e9.12.2025.10.29.06.44.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Oct 2025 06:45:00 -0700 (PDT)
Message-ID: <8f74cec4-d7fb-4ce7-a673-571d6d562e63@linaro.org>
Date: Wed, 29 Oct 2025 14:44:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/35] audio: move period tick initialization
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
 <20251027151045.2863176-17-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251027151045.2863176-17-marcandre.lureau@redhat.com>
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
> Part of QOM-ification.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   audio/audio.c | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


