Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5272BFF493F
	for <qemu-arm@archiver.kernel.org>; Mon, 30 Mar 2026 04:31:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w74H3-00024e-JK; Mon, 30 Mar 2026 00:30:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1w74H1-00023H-Ie
 for qemu-arm@nongnu.org; Mon, 30 Mar 2026 00:30:47 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1w74Gz-0005Yj-OR
 for qemu-arm@nongnu.org; Mon, 30 Mar 2026 00:30:47 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-66aed966c7eso6385929a12.3
 for <qemu-arm@nongnu.org>; Sun, 29 Mar 2026 21:30:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774845044; cv=none;
 d=google.com; s=arc-20240605;
 b=Q2zPtX+9/Rr6mwAG2p5kDjWKemmIfOVPOYXKvznGElvdGzG7BpA2z31UXS6giBSnbM
 z0LjI1evDeFomICRk7tRp0v387SxwTJhpgTBSgNIkgrqUN9+sOa0uAc+qzElYegqAfp0
 gzsyISHW3a4PhAHxqNT9Ti2xTJlgH3g1PgGsnttHjVeS3Z9TvghZuVQk0BU9tv+limKS
 AC9BPTiGOeND2yGeh6o9onmcLrqYUS2FeQfLfpbtzNiN3cfrIFSir0Hx06+t3Hjvg0hT
 GS/QDl7+vlona4eu3Sn1Dl7GUBYyHQdXxXZPqp4jbJ3ZvWyGI18xEKIJ3w/zMvMzpHTx
 zEyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=BPjxy6libzJadxuLmZKM8vnCdotc78+FZWvRkopsIGg=;
 fh=/TYE6Tcwm2v8uQrGU1oesU9LNo34ErbS5dEh4oqtXI8=;
 b=aYl8goxP9teftKkrfEqn29JoQuiY5HD7rTxvjOqXWAxgqJND7uK81NbCUb6TXxnOF9
 upmb9etei9YLLDWbNcZto5R1e3NicGsdN5Qp0wErb/8N+fFtHu3aC7y8el7WSLmCluhd
 CrjiyPXMv9W8WZfdW9FJMu8HoieSIVFRA4a480KqwA4dGLIgBvwPgIOwfK0MCrbKLCDH
 9FS1ZoACdkd2y9kGeSq/+pZM8ANKWXMySf93SBEOS3Di5FdfZlAG+6CkeEOGPma1E94i
 cMxd+aXZHQ1jwYNC0EsFlDs+EcK588AUaYDCmUB5jcMt1RTNQ2H9TUUzhKN9q/mMdz+f
 Q9+A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774845044; x=1775449844; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BPjxy6libzJadxuLmZKM8vnCdotc78+FZWvRkopsIGg=;
 b=N58ti/xZldcUBk60NO1PWTtCqqjnamU8SThcRpeGBvufjqlWTRZPXbpu3/r8E9LqzH
 70oZIzvsK4H2YdwsF+fGKmHQljiq3+3rEacIh9A64XFLx0Dr0I79svvinFYqiCVRnwbA
 TxdT9yDKfb5bVz014QvAb3WQjIUxJB4O7pCK77sH+Fln0afMgrtgCjm0gVhfBkeEQw4V
 B8pxOCB5MG0HEpt/7XsSFXqFCNKRcfwUtvft9bjEhZp6KRVytrf1d6v6QcVvVXhEiHMf
 PhGW1/AgOkuavcw5zA0XG33u/r3tdasTxorOEOihtn/+r61r1isoERq/x/hUJ8oDG3ig
 PweA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774845044; x=1775449844;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BPjxy6libzJadxuLmZKM8vnCdotc78+FZWvRkopsIGg=;
 b=Z/ZxE8+lMsOdnAqR/EEDiIV+UqQzeXavmuXPBQAKYUlcWBxiZY7lA5mbGpdv23uO28
 f4iXMPLHCbzvdC72DQ7T/lS4S4JyfjW0yrGvLPK3J52CxcTwPQ+vW8STORH/ET8kR1jg
 1C5qS2HglBkluBPmqcdsHn/HYr3zveQuT3bKu33K//ol4lmc0fzrgh04OHTrBejw6Lvq
 KKg8hNRc/8jl9PhZglN8xO2AoHLwJNOYRNdb0eL6HHUawrkvQTMuy9EdX+Grpp+cowx4
 Y4ay7k2WI/6EDR8QT3XRXmtXdSVwV9pJSbdplx/eV0Gul0+/pyS4/Ar7Xdq/yAi9AF/x
 do/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsN9UrDDSm/MA8amgsCqPnMiwDvyFnvyYBpTixsLvWjjOP+PKZ2wwy7PG/N50a5QG+Hir/9OUtcg==@nongnu.org
X-Gm-Message-State: AOJu0Yw75lbV76qSfhNeN16S0b8Te8IMj/RG2EdYSjFv+PUFziwFGkJ/
 2AON5fxxNXjc+GxqIojcPtlV1sDA/Y5f2lp8lkF7pVsZvGmN7LgsFR1gfEx8iY6uQwjnG1tbj7l
 WO9du5juEvfcx/GR4B7n8MYZzU/U7HGY=
X-Gm-Gg: ATEYQzz0Aserw3BRdDjPQSLu0SQ15zp3elcWGMOjb4HA/3VNbnoXx+80Mw/oV7U7pTm
 /3hL1CrAz+TBvEn8Ayhzp3EJy0OZBA7Z35lluu4t7gLosCqxxfq0jbLFjAQsO5tARR6mLPcdr6K
 vmmL7yGafuT7LUNin1qBJwL2AQerTfdZcjIulJF0EF+Q+POSosm8af9SYDcL+jlurVVXg4fVfUD
 a3HBV24YxT6JbzjrmA9kRfPmhwOudfYv0ZvoCN0RweeH8DrswcCOT8PF+oU4ST1Crv1nZVsxVaH
 /FPSSFoUJ4HYCjVC+lQg8EW5AP3wHDv6Azf4uA==
X-Received: by 2002:a17:907:846:b0:b98:51d6:883b with SMTP id
 a640c23a62f3a-b9b502bee4bmr757822466b.4.1774845043511; Sun, 29 Mar 2026
 21:30:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260327134401.270186-1-kkostiuk@redhat.com>
 <20260327134401.270186-8-kkostiuk@redhat.com>
In-Reply-To: <20260327134401.270186-8-kkostiuk@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 30 Mar 2026 14:30:17 +1000
X-Gm-Features: AQROBzCyc19tRu5zAga141IylI9K_Dcr-ZY9WcxhtTTde6AyEq3ClpnQjXi3SG4
Message-ID: <CAKmqyKOG3Aw=NPSTXKJj5QHwFzypRCr4Ra6A3FZBf7WrYEXPhw@mail.gmail.com>
Subject: Re: [PATCH v2 07/15] target/riscv: Use glib2 instead of
 strcasecmp/strncasecmp
To: Kostiantyn Kostiuk <kkostiuk@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 qemu-ppc@nongnu.org, kvm@vger.kernel.org, qemu-riscv@nongnu.org, 
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, 
 Peter Maydell <peter.maydell@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, 
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Chinmay Rath <rathc@linux.ibm.com>, Glenn Miles <milesg@linux.ibm.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Fri, Mar 27, 2026 at 11:46=E2=80=AFPM Kostiantyn Kostiuk <kkostiuk@redha=
t.com> wrote:
>
> This is a change in semantics. g_ascii_strcasecmp() doesn't honour
> locale but strcasecmp() does. But this is OK for at least one reason:
>  (1) QEMU always runs with the C locale so there's not an actual
>      behaviour change here
>
> Signed-off-by: Kostiantyn Kostiuk <kkostiuk@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/monitor.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/monitor.c b/target/riscv/monitor.c
> index a9d3111444..bca04a7580 100644
> --- a/target/riscv/monitor.c
> +++ b/target/riscv/monitor.c
> @@ -303,7 +303,7 @@ static bool reg_is_vreg(const char *name)
>      }
>
>      for (int i =3D 0; i < 32; i++) {
> -        if (strcasecmp(name, riscv_rvv_regnames[i]) =3D=3D 0) {
> +        if (g_ascii_strcasecmp(name, riscv_rvv_regnames[i]) =3D=3D 0) {
>              return true;
>          }
>      }
> @@ -358,7 +358,7 @@ int target_get_monitor_def(CPUState *cs, const char *=
name, uint64_t *pval)
>              continue;
>          }
>
> -        if (strcasecmp(csr_ops[csrno].name, name) !=3D 0) {
> +        if (g_ascii_strcasecmp(csr_ops[csrno].name, name) !=3D 0) {
>              continue;
>          }
>
> --
> 2.52.0
>
>

