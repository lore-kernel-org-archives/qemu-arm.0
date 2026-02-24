Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A38DF3C9BE
	for <qemu-arm@archiver.kernel.org>; Tue, 24 Feb 2026 16:36:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuvOG-0007Tr-16; Tue, 24 Feb 2026 11:36:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1vuvOF-0007Tb-8x
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 11:36:03 -0500
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1vuvOD-0007Sy-GI
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 11:36:02 -0500
Received: by mail-qt1-x830.google.com with SMTP id
 d75a77b69052e-5069a785ed2so62951cf.1
 for <qemu-arm@nongnu.org>; Tue, 24 Feb 2026 08:36:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771950959; cv=none;
 d=google.com; s=arc-20240605;
 b=a38emJUYxY1wElw9sjmWSzuBucSWa5dW8q2VZWQCPfY3nUX50NQYY6StMW8zesOCvI
 atIa3lFmtmevWnBJRezToQZR/y3oOwTvOqMzIiVUB5kBB75gXg+PpmHTKRaiY7LsjgPl
 eJAiWlteMyHXaawT3O2fD1EsFsHmjnEwM9gZzhnLPdXiTnvdFozZtqjIrYM3WtWjo0kb
 1qFHjHSMC13H2iOCpOhUjbL1C4zNCGVnGXtLd5OJ2kedKc0ADMXMx9S77aezB2n3WFmb
 0+1UePiYMs3ivid0rHFbEIgPG0Eu+OGfFK5DqplELQw3HGqY+FEfoFgqva2VPPiZfzHv
 1Ipw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=PCtfCuHENWEXCalHDflSvkISbE8QjePpBnrO1b/uMEI=;
 fh=fIhhXKv8ONMfrGe6K1wVlUqnOv51KC/WrbptzV42c3E=;
 b=AYkYV6whQZFGEvxaKH1kAiA1piG2TV5dZg06olOlTO6p9e0NKDYDM1nmWcoBMET2ce
 1ua4SdQqJf7fB7IN/+zn7XscvxT8xklvYaGJbrThOuXyiyfCiryMX1LCYbSv50hXMKcr
 4K/ISy/N20nIKRaVdZFzqasYJvAuySkjyqrmDLsmZjQvx0pQ5NwJyi4hmCPssKH0VYGj
 73SLOFvFAoGTIg0+3n36knsl/wjnCWZsQqiUNq2mi3XjXrKTte+pNkINw77riLQ4utUr
 4El8TfEb82sDym302m3cm2HVFgR908Fner8yTKrBUDMEn/q769W2hFMFeOHCFZ/SRyM+
 dz2Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1771950959; x=1772555759; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PCtfCuHENWEXCalHDflSvkISbE8QjePpBnrO1b/uMEI=;
 b=aKKqrv4sy3Zzvrk1wuYs0p7JoGBIEyCdKCDSVxMNJQASZhcvv8r9UfIa3J9Ohm942U
 qLKTgEMFu4DRNqGWZnswGA/BFo7pwVMQShT6G1WyzaKJPC8Oe5GBSJd37GTXQrYoqnZU
 +fUVIghwejtNxVIisBKBS0NDndjEItqF+UCJAM9LFrde2rA+LT85HEuSj/PQOJ0SOVpY
 gwNFOZJ2OIgdfIqCL0+sNWf0lSDbCiDyIOqKN+nysCDYX5Fjd8NJz3K0GkxRXH/jUs12
 6pne66ct0ve9w7NPu/GhltwqKGxOdBXKUUCBycLspASCyv4pIFQby0TFNsWi+rJl8Ll6
 HU5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771950959; x=1772555759;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PCtfCuHENWEXCalHDflSvkISbE8QjePpBnrO1b/uMEI=;
 b=gtUyPiykzgtRMojoW3WXlvWCEpqR3CUwTWt7FbsyNdCSSbPiz6+xk+5XOFREv9aAw9
 ieOHp591aKrs8q/BOT4+8G1/m6qp7ZJKTUpWGVgWgZ+Ayb1/ycpY/Kv/cLcoH3B7L2bg
 wMQXPwNy05A4sSnjxdtu1QaPtu/1YoWk+iKj3UGQ3puOUWX+IBZoDhcy8VMJ2layqxz8
 jdIjhVBL+IZT0q+93XZUi1sk5MkNh2xTDJZNs8soFdnrHGSeFkU+OcspxHlCqINnhhVJ
 vHRguTCjqxHmpr7EP2Uspo/MLwFpRsqrSZX8CqT0ohnSILi/PeD2+OLe9Nj+hVlZm1oL
 LMPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUU4uLvr+cv/YU9tGvzELj3y6xh04GJicKee/5ZUxgtgEUB6JsUXfg/S7xchoPSEzLztTIr08tU2Q==@nongnu.org
X-Gm-Message-State: AOJu0YxS+76/SlxK88pXvAD/lHwpu/Win5V8ejX3CpVt6mr9Ie1DA0K+
 Gk4P+8k8ZkHGQmeFNUc8m3tUK+vsCk93e1bTAVF0Hi8UFbowfI+lH5c22xl2XihEDS9RteJsgoy
 yGDYTcOsQuowh+V0JH2QVKGIQxXTr1ZlmTdvENhBv
X-Gm-Gg: AZuq6aLLie0TNKFSfzlB9G2jU3de19+WXnfEflXsRSpswQt4itT3J/iDd67sxsVpkiy
 6XWBw58tCWKGPdWJ6rbROdTYV6OMvrp3CWsW3H423UHxyi3Ze3o2M3NUWRL/Zv4Y9ZsG1+HkVvX
 72lsL2E8Jg72WyjD9uVmP1UTP2r2D+1U8D8oOpyZyVtrUCcVXEMYrs2R/O2cja09llp+PxIcn9a
 gOAd12wB+qWKzbV01+e4v3j0SU6XWSRr86VnCxw801k31x3iyRgUPancYmAjeBdN8eG2VqZRsW4
 UUpDLjTTSBaVlwQFdCu5q6q9GcjlJbW6sQhM9z3E3+MYBhOvfLLYUdzAYksH5FLIK7DeknNhR5q
 5JlwMZDGiF2hJTnyRUaBkfV7yCQZx57ltJNKu
X-Received: by 2002:a05:622a:15d4:b0:506:a3c8:d44d with SMTP id
 d75a77b69052e-5072df03d92mr11183981cf.9.1771950958651; Tue, 24 Feb 2026
 08:35:58 -0800 (PST)
MIME-Version: 1.0
References: <20260224053613.589102-1-jamin_lin@aspeedtech.com>
 <20260224053613.589102-23-jamin_lin@aspeedtech.com>
In-Reply-To: <20260224053613.589102-23-jamin_lin@aspeedtech.com>
From: Nabih Estefan <nabihestefan@google.com>
Date: Tue, 24 Feb 2026 08:35:47 -0800
X-Gm-Features: AaiRm512_eNhMxLtQ6PtJok3ExPxyEcPfHX3ysWfbWxnFzdSEZ8ZKZU7nZAiz6c
Message-ID: <CA+QoejW1sU6dGFLaveLu36Cu0pk08erT_d+Mpgz_uNegAH40tg@mail.gmail.com>
Subject: Re: [PATCH v6 22/22] MAINTAINERS: Add I3C maintainers and reviewer
To: Jamin Lin <jamin_lin@aspeedtech.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, 
 Troy Lee <troy_lee@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 "komlodi@google.com" <komlodi@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=nabihestefan@google.com; helo=mail-qt1-x830.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

On Mon, Feb 23, 2026 at 9:36=E2=80=AFPM Jamin Lin <jamin_lin@aspeedtech.com=
> wrote:
>
> Add a new I3C section to the MAINTAINERS file.
>
> List Joe Komlodi and Jamin Lin as maintainers, and Nabih Estefan as the
> reviewer, covering the I3C core and related files under hw/i3c/ and
> include/hw/i3c/.
>
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>

Signed-off-by: Nabih Estefan <nabihestefan@google.com>

Thanks for taking ownership of getting these patches upstream Jamin!
- Nabih
> ---
>  MAINTAINERS | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 233d2a5e71..7bf78e0691 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3933,6 +3933,18 @@ F: include/hw/i2c/smbus_master.h
>  F: include/hw/i2c/smbus_slave.h
>  F: include/hw/i2c/smbus_eeprom.h
>
> +I3C
> +M: Joe Komlodi <komlodi@google.com>
> +M: Jamin Lin <jamin_lin@aspeedtech.com>
> +R: Nabih Estefan <nabihestefan@google.com>
> +S: Maintained
> +F: hw/i3c/*.c
> +F: hw/i3c/.h
> +F: hw/i3c/Kconfig
> +F: hw/i3c/meson.build
> +F: hw/i3c/trace-events
> +F: include/hw/i3c/*.h
> +
>  PMBus
>  M: Titus Rwantare <titusr@google.com>
>  S: Maintained
> --
> 2.43.0

