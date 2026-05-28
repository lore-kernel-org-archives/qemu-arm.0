Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A53CD5BD1
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 06:11:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSTxV-0003EV-Lt; Thu, 28 May 2026 02:11:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wSTxT-0003DQ-Ft
 for qemu-arm@nongnu.org; Thu, 28 May 2026 02:11:07 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wSTxR-0004En-Fj
 for qemu-arm@nongnu.org; Thu, 28 May 2026 02:11:07 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-45eebccc346so44086f8f.0
 for <qemu-arm@nongnu.org>; Wed, 27 May 2026 23:11:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779948663; cv=none;
 d=google.com; s=arc-20240605;
 b=FaXbZUQVS3xwdvpuSXp7xxO6JRITequ3wS7thRUd8BR4QS5wkiftYs+FlO0zM1lyDB
 P98E7FevbJ2rMY6b5gGDmh+gm90DYUrN4VR7lqB/FJCPVjw9NGfjbkgGOzxB4uKbBqM2
 EoAK4PvjarE3loojskgEjQvs/KohM3JUDYkm3YoTX64Z9s6aCdeC8UUmZMS8kGMjphcc
 8P3/D6eK+syV4qolNr9wGlq9ElRB2CFIcR2ZUcB/+58jYA75nXxWwWItMlWGRf0h3cWV
 UHyJiqEujCdPRyRR0HgMMsWQ/lQQfDvqJLRl2b66PBs5v5CLHUy5ClDomwgvjG2T01M2
 oY6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=BmP2mmq5DU6SnVzp3/Y3fQwcmxPvDtZzg2yLss5TQQY=;
 fh=VHf2aRkOmEU5rnNIcYyZ2n6Vw/IAAUFLl8gEWv4SwmA=;
 b=j+q4lPurjn1ExOD/Me3Teu1W8DY3fCFoXTGpfG/BmsUQpYqcXFzhUywmDh1L3sGg99
 7B/E3D+r0GwB/3V2l6O0uVErWo4sjobTNDFu3MjqKI7CsUBbY96FS4A/ukN5IXyXVrnF
 9HSZR3oUbQbRLIyZALLtoKyBzbPITZP/CPDTBO+8pSCEZ39+27MKwMyEYn4Vc7VBAVEL
 /weCiq+fDrtOhV/xJD2l7iU8m68a0UNlrDCifdHY/VwnaQ1yvJ1RntlHy7G/KYZwPShM
 lB3lb03KoG3nO8gxDKn/Z/1UQorD+xdQI1355/mMcGnhb+lzjWSV0mJ/nHLKaBTwqX94
 V7vQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779948663; x=1780553463; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BmP2mmq5DU6SnVzp3/Y3fQwcmxPvDtZzg2yLss5TQQY=;
 b=rKcLT9T8cPXSwpHJJHtqWah12HeEu3OwHhKYCeCpH4PLIF5Tb75OPGm7IF4BaCjxqK
 Z5D761XsMnkiQmLXotqrhWOVMoxo3F7e2ZWkCxIeXOEHhhE0box54pT3iGyhV8kl9yY1
 J+PMw+AkvvXBSw+URxdy2YnDHbmnrSRELgcNcEs+aTTCR/7EgYbiit7YWpxiKrTIPUv3
 Vp6qN47pB52PZW9mO4iHNNpfEtftxtt1TJ53YGXl7lDAj8puh5IyVOAfzd9nViGuBlTu
 ikjv2edIgKiRPYH02aI6a+xZGZAqps9PLVUWPAo7eEMkoza60f1n9l9vpjdbspinzayV
 sByA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779948663; x=1780553463;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BmP2mmq5DU6SnVzp3/Y3fQwcmxPvDtZzg2yLss5TQQY=;
 b=LlaBdQvFJnOd8TrXiU/oYaCwLLDAdc56y77mB4pBMLRs3Fqq2/GpBnkU57dECqdHmE
 aM/2w1LZtKA1KpUW4QzhGeEhHQ4COzfVKXeT6Wqvc3WAhY9C7+rzyo4EaFmhHjeigUJd
 mGFDCa/93nptKYBnTSHiujBz7Ntzl4GX1nedn1YoyDqWGVpy8iFt2IBMpUruTtQMd5IU
 pfW8LGco0pj3N8VXaM5OMm+K4q7R6iLBrSD2lwbDUthWMTWCXlt8LinCbJUxKNBTsd1W
 9JpvBJfGm5tlL3BBybeDC/LgOgPuyxotg1WWLHprcBGo1+JskLxewheWknDBkI73J3H2
 IaCA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/6XRV3vcqF1jxT2sTOSyE0AFINu4c36TFbT0yvNokM9dHYTJfGvGt0W/omNI8zTYitpvgot9o3Jg==@nongnu.org
X-Gm-Message-State: AOJu0Yxy4XhRgt+mTok1G7ikoNqd5RFjdi8jqXKaYl7v2v1k7bSNdoj+
 gMD2UsXsUHpw0w1F6QPB/3EWqxy8y7Szhch1oSatKGQ5NwW2QSuStbeVIGelnDIuUHJhDaQ/2A9
 mK0aMBUbNu3nnMndOva1gWH2jxl8TEJE9Kol5YIg+pQ==
X-Gm-Gg: Acq92OH8NGp0ZJodW+lWh6JyPTegpH7Od4I+ohKADBkEP76p9te1S6Dzm+ThdWXV8Z9
 X5W7wht+aeklDWK3VlxoIXPWLEnGdcLaDRqPDVojd9Jhu9HcPH8f71H+zTSAVjEj4Bd6Dugy6NA
 c4IIlrkW0x0BtEqaoMJ3/7TGu3QASjriSgyLmYFLAXnDZSBWB5MUCOAwPd/neX41AzT6T8G0v1U
 KANW7TOUN2t722zeK51FDwJHv8qI62h6TL/uMkU57PxagNr3RxpP+UGUFaZTdDFpEKOBZo6hl70
 BKfole9YX+lQbH7yZvGqRwUyWiHPxRoaBk/K6PVcOhbZ0QXcVDfPXkEE5X0FecZqi85HP7U=
X-Received: by 2002:a5d:5e87:0:b0:45e:eafd:bb33 with SMTP id
 ffacd0b85a97d-45eeafdbc63mr595844f8f.29.1779948663291; Wed, 27 May 2026
 23:11:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260528051642.115721-1-pierrick.bouvier@oss.qualcomm.com>
 <20260528051642.115721-7-pierrick.bouvier@oss.qualcomm.com>
In-Reply-To: <20260528051642.115721-7-pierrick.bouvier@oss.qualcomm.com>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Thu, 28 May 2026 09:10:37 +0300
X-Gm-Features: AVHnY4JHzF2g7cNPKdI8yWGi-BoNXwjgTxUCplvyczRd5X9FUcNlnhGVFGoJXfw
Message-ID: <CAAjaMXZJ395DJmNGUrEivN3=+3KZRgYHxn3OPKMQw-D9Q3E3Dg@mail.gmail.com>
Subject: Re: [PATCH 06/10] hw/net: use stub_ss for vhost_net-stub.c
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, 
 Eric Farman <farman@linux.ibm.com>, Weiwei Li <liwei1518@gmail.com>,
 Helge Deller <deller@gmx.de>, 
 Michael Rolnik <mrolnik@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-arm@nongnu.org, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, 
 Laurent Vivier <laurent@vivier.eu>, Glenn Miles <milesg@linux.ibm.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Artyom Tarasenko <atar4qemu@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-s390x@nongnu.org, 
 Zhao Liu <zhao1.liu@intel.com>, Alex Williamson <alex@shazbot.org>, 
 Brian Cain <brian.cain@oss.qualcomm.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-ppc@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>, Jason Wang <jasowang@redhat.com>, 
 Stafford Horne <shorne@gmail.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Max Filippov <jcmvbkbc@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Cornelia Huck <cohuck@redhat.com>, Song Gao <gaosong@loongson.cn>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>, 
 Peter Xu <peterx@redhat.com>, Pedro Barbuda <pbarbuda@microsoft.com>, 
 Chinmay Rath <rathc@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 qemu-riscv@nongnu.org, David Hildenbrand <david@kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
 Nicholas Piggin <npiggin@gmail.com>, Aleksandar Rikalo <arikalo@gmail.com>,
 Fabiano Rosas <farosas@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wr1-x435.google.com
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

On Thu, May 28, 2026 at 8:19=E2=80=AFAM Pierrick Bouvier
<pierrick.bouvier@oss.qualcomm.com> wrote:
>
> Removes conflict with several targets where some support vhost, and some
> don't.
>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
> ---

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

>  hw/net/meson.build | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/hw/net/meson.build b/hw/net/meson.build
> index 31025874699..84f142df222 100644
> --- a/hw/net/meson.build
> +++ b/hw/net/meson.build
> @@ -48,10 +48,9 @@ system_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: file=
s('net_rx_pkt.c'))
>  system_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: files('virtio-net.c'))
>
>  if have_vhost_net
> -  system_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: files('vhost_net.c')=
, if_false: files('vhost_net-stub.c'))
> -else
> -  system_ss.add(files('vhost_net-stub.c'))
> +  system_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: files('vhost_net.c')=
)
>  endif
> +stub_ss.add(files('vhost_net-stub.c'))
>
>  system_ss.add(when: 'CONFIG_ETSEC', if_true: files(
>    'fsl_etsec/etsec.c',
> --
> 2.47.3
>
>

