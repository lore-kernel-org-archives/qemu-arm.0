Received: by 2002:a17:906:7fcb:b0:a66:557b:2f6e with SMTP id r11csp2746198ejs;
        Mon, 3 Jun 2024 23:57:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU7r9zAYJl7HI5/M8dZZK37NYlNHecgzBbSCMUEDb9DxsbOej604VA2Ufg8uvw9Vn1GVtTfnLqfiBN2ZwO9p93iF8oRqeUO
X-Google-Smtp-Source: AGHT+IH1qfYxCbRC8wWwgfdh3KnW7PV7V3xS3LpqWE3lqh6zpvHWzqN8GHyZfUsSJ/ZyevO5gAIa
X-Received: by 2002:a05:620a:400a:b0:794:9661:e039 with SMTP id af79cd13be357-794f5c666camr1468352685a.4.1717484258696;
        Mon, 03 Jun 2024 23:57:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717484258; cv=none;
        d=google.com; s=arc-20160816;
        b=Vx4c11RMX9n+VsyFQoM/iKVIie/EwrC9/mjkK/S7hZJ3pA8Jy/tuRn4hZNpEnMrqZK
         8Pe5ZWgBHF9yPYFHhboJif5aodrbcqqyob6fuayaKNkpal+OCLnPmRywheB5lkWL5oPt
         3i1xlwjbU0vlh+Whmk+dKzHkI62dCvXX0QwFrEJ7O0jUH/1zAOftLCnxahSMf6LvWToB
         JpNqFVNTi+kFmCKvop2G7XibG0b/x6N6V6QjIj38Y5C2d1rItKRXz24zzSQHJ5xSfXBE
         l3VRxnfCD8X4srmvKgSdA/fmD8w4mAbTVbLUbyWGSbpNmh94kqOn+RPUjMAdjpZl2p7m
         blFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=4P4A9iepjzZGqS6yex/oat1l+Ol0L3OkNQUVBtpzWYs=;
        fh=llDuCKGHMEI6IfLOkNZr0tHC2uZecVEWSQR7rgHnUTE=;
        b=Ohwf0wOeZtqs+pLYrFYuyQlkpFtQtDf+6nighHEe6rziqDXT1hSEW8qEexqP95K+A5
         qlCx4uNAz84vpNvGD+wbJ2obsJ+Wpxk5+vgTWIqidgLHMzX8Nl6mBKdHt2V0VxZkvrdp
         0ddaHmK2/jRGZULNJzX8AmzQ2L3awfcKcg9/+dUGcTNplWIKSErswyNgILPuQwUK0ds2
         p5Gx+NeXSr1UnHQG1CeX8bo5LqvbNIcVy3ynxqUDx1Z27/93JK6mkujAKyXdZlvC0Z+7
         99LZf4Kt0yovSAr6fQKLF23521g6/2cKLHMabrPZjwiKUmBh20u30GfazDpL3ZOKgqYL
         TZpg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=N3txu6FI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-794f317c476si232462085a.421.2024.06.03.23.57.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Jun 2024 23:57:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=N3txu6FI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sEO6p-0005YS-8x; Tue, 04 Jun 2024 02:57:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1sEO6m-0005XM-BB
 for qemu-arm@nongnu.org; Tue, 04 Jun 2024 02:57:24 -0400
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1sEO6k-0001kw-8Q
 for qemu-arm@nongnu.org; Tue, 04 Jun 2024 02:57:23 -0400
Received: by mail-vk1-xa2a.google.com with SMTP id
 71dfb90a1353d-4eb053d4ce6so256805e0c.1
 for <qemu-arm@nongnu.org>; Mon, 03 Jun 2024 23:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1717484241; x=1718089041; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4P4A9iepjzZGqS6yex/oat1l+Ol0L3OkNQUVBtpzWYs=;
 b=N3txu6FIAZ3cgY7qj28kuO+/mlt/aXFZwMcbFmyYHceP3CZnLx9FOA42rZn0+vt/fE
 SNqQ2Ssfshvfnn2EyL0r9KrIqt42hRXxLMvYNB0nZExIm2lQuxy48i1XgraY5QFZ2IPG
 zgEq7zZNBmlcWeclB1IbDHAccBcYZAxp8ams8AJjBPy1G2fs9OwQHfKQL9W+eZ2eXO+g
 nYSqOgHQmb9p48u6S5awJ6ctZyQslx68uV5HlEzrCQdwke7TCAh8KlZjZkMaA5ErlWXH
 05ft+ZNNkhGeEFIKd3lIOmHKF3AFFXMy2BAE4QI0Uao7Y+4ssFjZPYAE2bjGqLsYvrN7
 m6uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717484241; x=1718089041;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4P4A9iepjzZGqS6yex/oat1l+Ol0L3OkNQUVBtpzWYs=;
 b=hfn1rlQQ+GBFNbkgwX/Rd5Fsi0UgfI7JEH9i6eFd8Lu7u3CW3tLcB8nZQ6Pvspu9BP
 rCElpGq41KR+uFsB1dvh149/fvNFuBKDw0pIlFXRugeJw3EGxru5aEJBqAFyCkZnarqf
 +A65snE9T6ozu2sr2ASeFXIOB83m0v06g3QoiSp5msGBiJGvsMGPIgwH+MTP1UljDo1A
 XGSEN+cwgJulILgqBLU3IGB+geCExgM58IMY2hpyi/4RZVzty0kaz44SGb/79i5dvtDg
 26njnpfA0FDn9BImTK21C35SfU5YA7s7C4OjeIFoqXGqR0aOt9kvGm4E7k/cXvXQLDW1
 TeHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4nDqWjuXi3WoqHJsKPkCuItnphMMLM7jpDQrPgjNpVe3nBhLr+efgvMgkuR5RH177GtvzqzYlP5atMtsRNiBSW+sq
X-Gm-Message-State: AOJu0Yx1UPo2BX2mVsuUP6El6Hr6mdUfbdY0BpCZQ05RYPpCwvOvkklI
 3vedMuzX9Z7nrR45AAEteVYjtmT/a7PPxrysvLyzn+7zMHB9ytcYvOP4yAUoB52Lv19U1ywQGAY
 lsKpKg8w8Fmik6fqO8hVqMVmZE2IsVs+7/3piyw==
X-Received: by 2002:ac5:c851:0:b0:4d4:21cc:5f4f with SMTP id
 71dfb90a1353d-4eb02e7bdf4mr9223483e0c.11.1717484241108; Mon, 03 Jun 2024
 23:57:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240603055248.3928469-1-fea.wang@sifive.com>
 <20240603055248.3928469-5-fea.wang@sifive.com>
 <CAJy5ezocZnmYec5TenZNtOe6+2-OxzaRaSXLW1XYHL5X0Xd8dw@mail.gmail.com>
In-Reply-To: <CAJy5ezocZnmYec5TenZNtOe6+2-OxzaRaSXLW1XYHL5X0Xd8dw@mail.gmail.com>
From: Fea Wang <fea.wang@sifive.com>
Date: Tue, 4 Jun 2024 14:57:10 +0800
Message-ID: <CAKhCfscM=B0TD4k_SgKwAyRbg0zuzFAT+M8Rq3kTSrkUZBMefw@mail.gmail.com>
Subject: Re: [PATCH 4/4] hw/net: Fix the transmission return size
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Jason Wang <jasowang@redhat.com>, "open list:Xilinx Zynq" <qemu-arm@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000195ece061a0af665"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2a;
 envelope-from=fea.wang@sifive.com; helo=mail-vk1-xa2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: d+pirbObhM2Y

--000000000000195ece061a0af665
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I just encountered this issue when running Linux, and the trouble will be
fixed after the patches. So I think they work.

Sincerely,
Fea

On Mon, Jun 3, 2024 at 6:31=E2=80=AFPM Edgar E. Iglesias <edgar.iglesias@gm=
ail.com>
wrote:

> On Mon, Jun 3, 2024 at 7:48=E2=80=AFAM Fea.Wang <fea.wang@sifive.com> wro=
te:
>
>> Fix the transmission return size because not all bytes could be
>> transmitted successfully. So, return a successful length instead of a
>> constant value.
>>
>>
> How did you test this patch, on Linux or something else? I have some
> memory that we had some trouble with similar patches before.
>
> Anyway, the change looks good to me:
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
>
>
>
>> Signed-off-by: Fea.Wang <fea.wang@sifive.com>
>> ---
>>  hw/net/xilinx_axienet.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
>> index 7d1fd37b4a..05d41bd548 100644
>> --- a/hw/net/xilinx_axienet.c
>> +++ b/hw/net/xilinx_axienet.c
>> @@ -847,7 +847,7 @@ static ssize_t eth_rx(NetClientState *nc, const
>> uint8_t *buf, size_t size)
>>      axienet_eth_rx_notify(s);
>>
>>      enet_update_irq(s);
>> -    return size;
>> +    return s->rxpos;
>>  }
>>
>>  static size_t
>> --
>> 2.34.1
>>
>>

--000000000000195ece061a0af665
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I just encountered this issue when=C2=A0running Linux, and=
 the trouble will be fixed after the patches. So I think they work.<div><br=
></div><div>Sincerely,</div><div>Fea</div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 3, 2024 at 6:31=E2=80=
=AFPM Edgar E. Iglesias &lt;<a href=3D"mailto:edgar.iglesias@gmail.com">edg=
ar.iglesias@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">On Mon, Jun 3, 2024 =
at 7:48=E2=80=AFAM Fea.Wang &lt;<a href=3D"mailto:fea.wang@sifive.com" targ=
et=3D"_blank">fea.wang@sifive.com</a>&gt; wrote:<br></div><div class=3D"gma=
il_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Fix the transmi=
ssion return size because not all bytes could be<br>
transmitted successfully. So, return a successful length instead of a<br>
constant value.<br>
<br></blockquote><div><br></div><div>How did you test this patch, on Linux =
or something else? I have some</div><div>memory that we had some trouble wi=
th similar patches before.</div><div><br></div><div>Anyway, the change look=
s good to me:</div><div>Reviewed-by: Edgar E. Iglesias &lt;<a href=3D"mailt=
o:edgar.iglesias@amd.com" target=3D"_blank">edgar.iglesias@amd.com</a>&gt;<=
br></div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
Signed-off-by: Fea.Wang &lt;<a href=3D"mailto:fea.wang@sifive.com" target=
=3D"_blank">fea.wang@sifive.com</a>&gt;<br>
---<br>
=C2=A0hw/net/xilinx_axienet.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c<br>
index 7d1fd37b4a..05d41bd548 100644<br>
--- a/hw/net/xilinx_axienet.c<br>
+++ b/hw/net/xilinx_axienet.c<br>
@@ -847,7 +847,7 @@ static ssize_t eth_rx(NetClientState *nc, const uint8_t=
 *buf, size_t size)<br>
=C2=A0 =C2=A0 =C2=A0axienet_eth_rx_notify(s);<br>
<br>
=C2=A0 =C2=A0 =C2=A0enet_update_irq(s);<br>
-=C2=A0 =C2=A0 return size;<br>
+=C2=A0 =C2=A0 return s-&gt;rxpos;<br>
=C2=A0}<br>
<br>
=C2=A0static size_t<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div></div>
</blockquote></div>

--000000000000195ece061a0af665--
