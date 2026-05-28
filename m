Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84D18CD5BD5
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 06:11:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSTxr-0003Qn-VA; Thu, 28 May 2026 02:11:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wSTxq-0003Pa-RD
 for qemu-arm@nongnu.org; Thu, 28 May 2026 02:11:31 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wSTxp-0004Rm-5U
 for qemu-arm@nongnu.org; Thu, 28 May 2026 02:11:30 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-4585a116a4aso10372552f8f.3
 for <qemu-arm@nongnu.org>; Wed, 27 May 2026 23:11:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779948688; cv=none;
 d=google.com; s=arc-20240605;
 b=FX29jwXfBgN/ELTKMTp+vbJhzKOiYqnAJJdzRc0LrhWRisHjdj3DlhdKDk3EHcDze0
 FYllASUOrVnO20TGTHFoJN/86bOjmtSZkT2iCii/53IuKK9wW6/tpJWUJQTOuW4CIC5H
 hrAaP5lw7hbFQSuX+4VjCKQgWfZawjfSmcziCGdQL1GKRLvSE7F9O/Mowqt+TdAyzKfs
 3bmCNaII3XjXrhAjugXnSyApAv9gpHKtN2Kp33oJvootgs3dFYkGe4US5NCbakLflp4c
 oCuk4iLF5lsbhtj7POlVsNFMNnCJ15pPJh239wN27ec2d8ro8yYHw45UnQ8Pi6OIWs2c
 Fs6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=987p3tTTfT5NU3Jz/Tj67qE9H1wl8NyOwiSvElqoVHY=;
 fh=dTiCKhLR0SXkdC6TGTQomBpN1ZMy1gSHpg+QWXfG/is=;
 b=F+HqDI901cMip0PwUflzQ7/OTKeickqYSFdrdJ902YyaXt4mKS15PyGp+FrQDR6TMq
 YLCnJcebHR8Np96lmW1PH8SyE3qStQ5Te3XsYVCsw7NteBfamgAvGlS7Pl3Od3SDaGdf
 5nrz3rq34Rka96FhjY2F2KpYj0LXnkaEu+tVQpwZ4tzwKljxZL0fwhcolAexhY5tlX/j
 dDcnGLYBZWdrnls4LPrilcRg2xUf8WDmJtxB5iOc+ZNvs01hd/+9T8g5U1x6REwbtU5M
 LzH+q2kuCEllhIVKZPfRy4TgggTqqSIU1+ee5n5sb6WyizYgBPfiZp4A9juE9Xlz6/ro
 W5gw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779948688; x=1780553488; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=987p3tTTfT5NU3Jz/Tj67qE9H1wl8NyOwiSvElqoVHY=;
 b=uV5ZlCadyw2VGfLinawnfv+DRYwHMhuhSf1F7PTF4uECphnewgeUo0DoINdS4AFfaR
 CEMjfZx6zGqAn8laR7+xK8dWQO/JoP0I/AJRJZuaUddciqIXsT8d+s38nj9Z87cjvP1W
 Lb1cI3vlqbnE1hBMDdy3x2sMxQ7KG4E3fCUTQ/E/HjUrm5QfoFmKlouXsiHacryOy0DC
 bgHgCv6NzJaGxdqRnJdxg4e7TAbR3Nxbaj+yaD08gEIsay1C6yE3/Spu8LhEPyaxwf9W
 nDtoYIMqDpblQVV8fE8VhVMTY4NVhe2XRpHkPcWGzwOqG8t87QDIbcyMS82GtoCyBLcB
 oawg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779948688; x=1780553488;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=987p3tTTfT5NU3Jz/Tj67qE9H1wl8NyOwiSvElqoVHY=;
 b=UafplIrW+BhoxwYB6jAv66J7J2WR6aiuj/66tZdOMQ3G5sHXHyqfSniQqzYOKDDZH7
 ri0Ks7dQVZ3jWb7+JyNCMV/6ts+QASwx9uM267uYQOg4vRF6XI58/TmVSUzatyufSMCa
 b80VAkk9QlicZgzOYdb2/NTd0VLnyIVZWMoB3JX5ui2LUI7sU5WAHDDsp81dX/pNC0a1
 xpGl/wjokuZTTGgBGjH1ef7mU2/YLYugjbrq5LihVdwGgM9nE8Uep7KqopHgeETCdLQV
 SCiJgx3TfUVA5Vm1ssSxo/762JjBSVLFXXavU/iO5DdA5DS+CKXGAqwR6YqvI+ePzpAV
 1I1Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ8zMX6W/WkbCcCY6yTr2qPgyYGRPbU0nas3qmit/chOFcBvg5vmNtICUzYQ7zJ4cLMi51gMVAiDaw==@nongnu.org
X-Gm-Message-State: AOJu0Yy6wshCiBLoNSRQ5HJ3Bgz6xvM+1OSILxjpklqmvdbBXuUDqigA
 kzs+pmY5JR53F8y2q8kaHz+HfvFiSv4Zgrr189ctECB/LTw+3oWHG1rCwLtTSwAMyCM3/Pomj16
 Jz7rOLonorz3KixJqiQC9OkNTjIcfEMtFZ8n1GrKbxg==
X-Gm-Gg: Acq92OHtNgXY+XgKls1IpgSBaMJSV6TtpsZ/jYqBpmgofUQ0p3P72NV98m6AESKeuD9
 8WpEnHn3KmIA8qn7wWcNviOCqP6zY1+DYvJsiRQkFHd4HniXovCP9mPnG8pb62riD77u3pPlHr2
 nsWqT2fdgr55qt3VEW9HgZVBvsnSg1zhh4rFa5uTZcPUB27fromRrh7aJVH1/e2YkAYZiNoFd9C
 f+9+MGzEpHxad/8gb6dULAjhHim5CRohD8TgGBAhsMF6qmXvhRM/rPR+a6U9mw9PYyl7ywJANOk
 1NB8bmDIlaI00hTTOfzSCYTXPbuL7yvL2q8ecObJOlEEu0awGEsYj4NxDj0+GrtMsuvQgZA=
X-Received: by 2002:a5d:5e8c:0:b0:43c:f90b:5668 with SMTP id
 ffacd0b85a97d-45eb36acd72mr41400771f8f.23.1779948687025; Wed, 27 May 2026
 23:11:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260528051642.115721-1-pierrick.bouvier@oss.qualcomm.com>
 <20260528051642.115721-3-pierrick.bouvier@oss.qualcomm.com>
In-Reply-To: <20260528051642.115721-3-pierrick.bouvier@oss.qualcomm.com>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Thu, 28 May 2026 09:11:00 +0300
X-Gm-Features: AVHnY4I-NlqunV7wGFvsqjvPsEW0Kz4bYN0AMsmvycIhhQ5fzxo0IqI0aq8IobA
Message-ID: <CAAjaMXaajQ0XsZmru3rtkT5G=0Zf5w0NUNdeeoq0P7pchc1iOw@mail.gmail.com>
Subject: Re: [PATCH 02/10] target/arm/whpx: move whpx-stub to arm_stubs_ss
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
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wr1-x434.google.com
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
> This eliminates symbol conflicts for whpx symbols on windows-aarch64 host=
.
>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
> ---

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

>  target/arm/whpx/meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/arm/whpx/meson.build b/target/arm/whpx/meson.build
> index 3df632c9d30..7385c14f534 100644
> --- a/target/arm/whpx/meson.build
> +++ b/target/arm/whpx/meson.build
> @@ -2,4 +2,4 @@ arm_system_ss.add(when: 'CONFIG_WHPX', if_true: files(
>    'whpx-all.c',
>  ))
>
> -arm_common_system_ss.add(when: 'CONFIG_WHPX', if_false: files('whpx-stub=
.c'))
> +arm_stubs_ss.add(files('whpx-stub.c'))
> --
> 2.47.3
>
>

