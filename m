Received: by 2002:a17:504:c05:b0:1be9:327d:8ee3 with SMTP id k5csp1667691njf;
        Mon, 28 Oct 2024 11:19:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWMRWuK+Ft9CEzvuoDHMcBARL9uKWkOlxmJKYmhOwsXM1rCxIN6L+4XXjuD9lWBy3O+LehTGj/Py2qX8A==@linaro.org
X-Google-Smtp-Source: AGHT+IFPvsNjb6fjRatgoAXJbk4puFupcgER0k3UW2bQdRqB1B5rb67OvadTobY0bZh4o3+Q68iz
X-Received: by 2002:ac8:58d4:0:b0:460:a82a:39a8 with SMTP id d75a77b69052e-4613bff3422mr158368311cf.13.1730139596933;
        Mon, 28 Oct 2024 11:19:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730139596; cv=none;
        d=google.com; s=arc-20240605;
        b=Ss/z6D3zYIhPFV4pseQiSk/w0s8rfO1lkBfXWZA3NQqxT8O5qlj7NIIWi2EYn13/fl
         QSrC2W40nn8zHLlsZqDr7pHnc/eyp6GgW1ErOPjvz/0pSxHo96rj9tXkxvy0+Fy6tvxw
         CaXDGvk2VX2Tt0xd9X82ewJOv1PAPBnRSislV0FxysFWZLtF4pEzEfx2Znhm1n4RB0z3
         NzfesYMMcxEXuzWepmammmixhhBzOHt+4q73wh4ZSSZheBkZ02/y5zODxrj/5er/fW/m
         s14mS7dEhGTSXgbP6EEXZ6GFdYICg4UNH7Fv9Tn1ycO8EeLh+8bfv+Kd5Rv7LlZmb1cy
         7LbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=I9KpKqmLLGgWQg4P3FM7fUf1XDrH/wvRuXnmbYM3Wa0=;
        fh=0Zuabs5JsaFAl/9OSS7W5Bf/pNESBKuy1Z14SM5a9HI=;
        b=j04dml4jHfFrI/l02jsJImLH3wiF0KReeahPhSRAAfS8qv4uHnRx7zwhSSj0YVLzMS
         aMAYPrCh0Iprbcd6I04+AJ5VdC3RgBdV6LDyrdR6opoAknu4xybTbQaQfG0ZTuBstT6y
         wnn3cPKJYn5p5GG78irTCaCcEPnimayRlN4gQBdXdiVBaq5WyEuyVhMvDMZfqqVUO2il
         reC51U/zcBOxCMWhSS4kNlOSDPl7wBsGy7ccTTeQvNCmT/6DHkp6qtUhYYIDtP3zDlvP
         olgeAKsyJ2ZdcOZn4h8EnZxVQVp4KHk+8iLs9UD7mfz1QBr9cGyQLfJe4tQjIZXtf5i0
         enCw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=TrtiJPS2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46132411a67si89105071cf.744.2024.10.28.11.19.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Oct 2024 11:19:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=TrtiJPS2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t5ULD-0007To-6O; Mon, 28 Oct 2024 14:19:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1t5UKs-0007LM-7q
 for qemu-arm@nongnu.org; Mon, 28 Oct 2024 14:19:31 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1t5UKp-0003Fm-R0
 for qemu-arm@nongnu.org; Mon, 28 Oct 2024 14:19:25 -0400
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-539e66ba398so2784e87.0
 for <qemu-arm@nongnu.org>; Mon, 28 Oct 2024 11:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1730139558; x=1730744358; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=I9KpKqmLLGgWQg4P3FM7fUf1XDrH/wvRuXnmbYM3Wa0=;
 b=TrtiJPS2nMYzDDJifz04HGa+6f7RJl1gILbrX6K+3pe38Rtik+0bu8HebCHD9hNI6H
 alJEApvBJ6dsrlgHYmU8FrguH7bvmOu5cv1ehEprz+DfSD2SqKczErlGIP5HcXfpqtk6
 wLdilKuzZAR6yMYSzOEXGru0P6qzskWmdLb12cH35ePzPV0w6LbPrQT69WTwGnGctQhw
 jOeCw3/Hg6mkxjOzIpM3IDpewxZ4J8Bhf8vwjNRtiSzK/k/i+eOdl6AEULLS4zGjawGi
 znuBSapldFQMlWr4//S2niiSTCeiXP751kn+/1yO9LZcPzK+DxGpVN/zvPpxCm0lDqun
 3vOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730139558; x=1730744358;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I9KpKqmLLGgWQg4P3FM7fUf1XDrH/wvRuXnmbYM3Wa0=;
 b=TqZOlnzbvEvzEkMPbMvvWH/4JdBNjbzC4CYlJNlid0B5UHUip41bDVjnH0Y+Mh7MeH
 yYJc0FCw6qOGmQmOV6UF0rvHTlmpXJaziOnWOvI/P3RNkf34kQ2xAj8XAvoHo94K5KM8
 sN/rR5WObS+WDXEY+k6TSCrUgZDt/2WnW0nuXY9taBfxapDHUaU0yNyCPG83dFT2mP/q
 NkFVdi3sYeATtUPi+C6HcC4oZwplkvmsyIB5pL3zfVW/uqtvGxycDcHBCL4cx9LJgQUv
 Qf5l1wC5QwKp1favwwWYXKBgC8WOJLkguPXreirQySCqF1mmYwXk/mIwVTLs6B8urZ2Y
 KY2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWueLEYiD0cQwkM10nckC9R4WkrbxuaC69QTJZF52ehzNyLySr6nzoVjxv6pEW/jWwE1KVY5pajyw==@nongnu.org
X-Gm-Message-State: AOJu0YyREIFFsKPvflGSbX/NAdSKr0bdGqOnGne2RNHxyE+yzcRAAFIT
 s+sVuX24C7PMJwFkZ09dejSS8BXbUqZEArbew7rZB/5vDjYh19y3L+M4cNRHd/zY0u8cL2UvPKh
 eQt7o63ybW18M67COjNZH3ybRZPPLX/HsqfIS
X-Received: by 2002:a05:6512:4017:b0:538:9e44:3034 with SMTP id
 2adb3069b0e04-53b480a3b88mr19500e87.6.1730139557940; Mon, 28 Oct 2024
 11:19:17 -0700 (PDT)
MIME-Version: 1.0
References: <20241028181420.1438938-1-venture@google.com>
In-Reply-To: <20241028181420.1438938-1-venture@google.com>
From: Hao Wu <wuhaotsh@google.com>
Date: Mon, 28 Oct 2024 11:19:03 -0700
Message-ID: <CAGcCb13zjuH4dAspE=dAdWZXG88b5e3OkGFaE+KcwcWDjioyUQ@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: enable at24c with aspeed
To: Patrick Leis <venture@google.com>
Cc: clg@kaod.org, peter.maydell@linaro.org, steven_lee@aspeedtech.com, 
 leetroy@gmail.co, jamin_lin@aspeedtech.com, andrew@codeconstruct.com.au, 
 joel@jms.id.au, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000c3bb9306258d814a"
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=wuhaotsh@google.com; helo=mail-lf1-x133.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: cP3+KQ8xo9PK

--000000000000c3bb9306258d814a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 28, 2024 at 11:15=E2=80=AFAM Patrick Leis <venture@google.com> =
wrote:

> Enable AT24C with ASPEED in the KConfig because the boards build this
> device.
>
> Signed-off-by: Patrick Leis <venture@google.com>
>
Reviewed-by: Hao Wu <wuhaotsh@google.com>

> ---
>  hw/arm/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index e7fd9338d1..1b25e73578 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -539,6 +539,7 @@ config ASPEED_SOC
>      select PMBUS
>      select MAX31785
>      select FSI_APB2OPB_ASPEED
> +    select AT24C
>
>  config MPS2
>      bool
> --
> 2.47.0.163.g1226f6d8fa-goog
>
>
>

--000000000000c3bb9306258d814a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 28, 2024 at 11:15=E2=80=
=AFAM Patrick Leis &lt;<a href=3D"mailto:venture@google.com">venture@google=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">Enable AT24C with ASPEED in the KConfig because the boards build this<b=
r>
device.<br>
<br>
Signed-off-by: Patrick Leis &lt;<a href=3D"mailto:venture@google.com" targe=
t=3D"_blank">venture@google.com</a>&gt;<br></blockquote><div>Reviewed-by: H=
ao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com">wuhaotsh@google.com</a>&gt=
;=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0hw/arm/Kconfig | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig<br>
index e7fd9338d1..1b25e73578 100644<br>
--- a/hw/arm/Kconfig<br>
+++ b/hw/arm/Kconfig<br>
@@ -539,6 +539,7 @@ config ASPEED_SOC<br>
=C2=A0 =C2=A0 =C2=A0select PMBUS<br>
=C2=A0 =C2=A0 =C2=A0select MAX31785<br>
=C2=A0 =C2=A0 =C2=A0select FSI_APB2OPB_ASPEED<br>
+=C2=A0 =C2=A0 select AT24C<br>
<br>
=C2=A0config MPS2<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
-- <br>
2.47.0.163.g1226f6d8fa-goog<br>
<br>
<br>
</blockquote></div></div>

--000000000000c3bb9306258d814a--
