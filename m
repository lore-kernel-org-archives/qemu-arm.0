Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88860CD5BD5
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 05:25:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSTFK-0002MN-Aw; Thu, 28 May 2026 01:25:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wSTFI-0002L8-RZ
 for qemu-arm@nongnu.org; Thu, 28 May 2026 01:25:28 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wSTFH-00006p-81
 for qemu-arm@nongnu.org; Thu, 28 May 2026 01:25:28 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4905e190c71so47452985e9.3
 for <qemu-arm@nongnu.org>; Wed, 27 May 2026 22:25:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779945925; cv=none;
 d=google.com; s=arc-20240605;
 b=Q5vbhljNzurlzZMKw3xxnf1FSTNnJdSayBsrBzngCKWKTsPnpA6Qi7hHLruEs1c4DL
 /nTvhuNzSeMfL9nk7j2oKfCNVVkG0rLNeleRuGt+yTkm23fal05co2m3rIrXvbDRjj6a
 7qs0SDe2vpS8Uz58URhhoY6hNsOBKR5C3RQRE3ca1qCrsFdJuZsN7117mURh0jmpr1I0
 /CIVKzEWrQNuZos7ATLBcRuUARgHLCNnLDgm4bnhZ7WWaC/HHtEg5XcfJH1RJxRuq8o2
 /oqjCcqFFAixc7aEdyMVrdtXjsG3BUD2vG1kVI3CBIdmBs3JKRyecyrGQngWAQmUQZ++
 7/rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=5TCPJ3gJwHHXYJJXNVG1joXUuyTUjoTdvOy1PVh5k9c=;
 fh=j4hUMinua2Du0y86r+Ale/Fc8Wcj3g8ObMna/92FyIw=;
 b=LaVb7l01yNkuEOIjVJGcgO5vxNhNZfKQehkB5AVWRpQquyMgOFvUqjLLAGbTEO/7n7
 zydaejXc9qX/0Bv77STP1LCKbrRAOC8VjA4rtZlFjwvTnAUXQ/xRSSKHZBS6Vw7185xC
 PHnklK0/GHZiMPdrjPr7OYpbj1f2vD5XF/rnWlyaqRkoS+OJ2pw9ch1GJghPANoXNQLG
 yuCe3WwGnHSzOAGj8k0MYitpZ0M/SSxGqQB0SG/GySfGcCMv54iZy8DhH9kCn6Ox3xch
 HL/vO6pWGSCzTXf1lIBswCGh9n6M1hS5jTHspo9G9b4jYmqswWfuG19p6W6OttMbtTJw
 PSNg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779945925; x=1780550725; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5TCPJ3gJwHHXYJJXNVG1joXUuyTUjoTdvOy1PVh5k9c=;
 b=ecTPzw/m5qtLasVqJcVfTxXWT3xXeduE2pTMfNlj0v8RftIiLoscaYtXan6JlzQUkZ
 W7UK/rOvsfXT6m3Y8MiZON7QZa47VMiO/wAeSndDRV0oB8nt4z9FCx++ixi06cKU6zBo
 Zfm+MkbIs7JSSjkJIBTBbLNy9plQUoaMjIUiZzlN7nWQLqbEhAUYeSkjpRecw8/FQIe1
 oMMixtb4xrv74hqRDXI+aphU5RxTjcdwSKcRW7LJtgHHUz74sU8H3neuhgqTb2+nopkg
 GNHypeZj54P1+/LAjIv5E5qtxNm9L0iFghFhSun8HDvaIsRui7Tnq6RrFxiCz+pLnMuu
 OB1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779945925; x=1780550725;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5TCPJ3gJwHHXYJJXNVG1joXUuyTUjoTdvOy1PVh5k9c=;
 b=jscVZl6RvAkWe6PEeJLbKpnz7UVQHoZQKe83kfLYu/IZKQM60mHIb4zR3TVxdsoNHr
 Eh6ax1/V9TYlkGyS4hgjx9dsLGFz4KwwlMfGIys/HdJWY5bxi/A/QyOhPY1eBkFmwntG
 jJkzKTQlU6S+ZinjNG32WOXVDsdLRYSA3Aju08Q1H5C6Kwb066AmZXqZU4T+Mb2rAPoK
 WpCJNF+kH3mVsxEtY/XNFxC/WaaCdIdRVM6OxITOWUFzlsG1jZeRhyO4Pj9XPc+7Skwb
 m0ct7aBPzoJ6kancZIUsOuZkOCMAz8CBucg1ffLao6MW1iufja5KyV884vurrPr6P3UV
 03RA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9r6rlKhDvbZt3vPaXtOvvv1ZyXNWNTmu9uh+EbT+R4XRAFr+JRrnPjXvCvPv2Sg15GpTqw5/anCA==@nongnu.org
X-Gm-Message-State: AOJu0Yw6m557xLAQWjjPnCtt4EXiMHB5XOqhwiNvTIrLxyiZN7K55VB1
 f4fdDGZzkIbMxkK2ErelUXaEXAyRqywalJV/KpAPbu9WlhhBhZnzL7INCrNPykBcirKsWCxA4dh
 wRy0OFiaH0gsHd8drf6h95HVUsLD67uHm99O4vO06/w==
X-Gm-Gg: Acq92OE/QZqvOVePBuVgGbEcjQUYlA60elK+WZB1z7Z7takQwJLlaiiara1112B/5vM
 vkOcMkb3Y9R3fmtDx0XiRtAJh6KDZe/yZt02dPA4bacy3xhJ9zJtzp2jm4qYABUNgh+ySDT2+ok
 UXomO9HxpIuJqksXuvMK+h+X0zJ68crG8bO61k2zg31o8kIMOW9nReltd+aX+PR+jqpw8LCk7xi
 uR2eyS8Egf7J7K3VvGF5B+0cXGMKz5qzGbfjX6ZvvywnjYZ9SJ67UXL+uRzj0B9y/AvaOlnVIGr
 jL9/3sNbjdvmLPxV1ZDxBXkqXHJCbyMI7Y2tw6qJtUFvmabPwaZ8dffYqjE8
X-Received: by 2002:a05:600c:45d2:b0:490:6237:521d with SMTP id
 5b1f17b1804b1-490623753admr265617755e9.13.1779945924980; Wed, 27 May 2026
 22:25:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260528051642.115721-1-pierrick.bouvier@oss.qualcomm.com>
 <20260528051642.115721-8-pierrick.bouvier@oss.qualcomm.com>
In-Reply-To: <20260528051642.115721-8-pierrick.bouvier@oss.qualcomm.com>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Thu, 28 May 2026 08:24:58 +0300
X-Gm-Features: AVHnY4JQxodVSb-Pjx9_4rMS8rjHgy485LvNcnchqEleaADjMgl5nzLDvnCqCzA
Message-ID: <CAAjaMXa8EWF-iUwCuoEd=XFBqHuZRjq1xj4hbEZzpVePgDQqHw@mail.gmail.com>
Subject: Re: [PATCH 07/10] migration: use stub_ss for vfio-stub.c
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
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-x32b.google.com
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

On Thu, May 28, 2026 at 8:19=E2=80=AFAM Pierrick Bouvier
<pierrick.bouvier@oss.qualcomm.com> wrote:
>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
> ---

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

>  migration/meson.build | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/migration/meson.build b/migration/meson.build
> index e583822dec6..0a9a5d0d374 100644
> --- a/migration/meson.build
> +++ b/migration/meson.build
> @@ -50,5 +50,5 @@ system_ss.add(when: qpl, if_true: files('multifd-qpl.c'=
))
>  system_ss.add(when: uadk, if_true: files('multifd-uadk.c'))
>  system_ss.add(when: qatzip, if_true: files('multifd-qatzip.c'))
>  system_ss.add(when: 'CONFIG_VFIO',
> -              if_true: files('vfio.c'),
> -              if_false: files('vfio-stub.c'))
> +              if_true: files('vfio.c'))
> +stub_ss.add(files('vfio-stub.c'))
> --
> 2.47.3
>
>

