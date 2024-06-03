Received: by 2002:a17:906:7fcb:b0:a66:557b:2f6e with SMTP id r11csp2127075ejs;
        Mon, 3 Jun 2024 03:32:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWrw3YbpRNr3b+x0lktfUwLtDQcNKedHOsOZumJqdpb+W3TTizpdcRAH8Fxy3RPm9WWRkU6KQbquAd5MsBWuyb/egJpLdL/
X-Google-Smtp-Source: AGHT+IH/P/6oydZpWwRcJ3ElWYnVQlO9rxxTOphVkZXrnTP1FlKkB/erDWfO9kvLN1tIvMALjSQB
X-Received: by 2002:a54:4381:0:b0:3d1:d2e2:6116 with SMTP id 5614622812f47-3d1e35c4563mr8972987b6e.49.1717410764990;
        Mon, 03 Jun 2024 03:32:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717410764; cv=none;
        d=google.com; s=arc-20160816;
        b=A+X5jyPtSbG+a9dnKxFXzyAOeYrh7xmz8tB8AsPj8ASoPn6no7il4sgDLWVLoCowkY
         5OUGfP+bwS+sH+f30bdgA1O0QV01iSmkEpFkVl+NAXS7AxHyxf2RjCaWKtmIRbux3GPE
         CNGDFLKI89bHvQO792qCIN45DEQj5ltevDDt0sZSg77vkKOLLJAVN35rZ1Jah6ze1hhY
         MYaq34SR+GHgscoEU+L/4JUgtA8D1+f+ZjDnsOISMCGiKsuVvrIzJTNUZHwtNOBZhlbG
         ju1r/RFs4Ug7EO9nElrJn4lhDxmL7uQ6tO52Lv6r4Eaoj4M73kQsH4KZww9EkeXPvM45
         u97w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=SvLRwyIBI3cbGGaqHKdWaAaofQdbiKv1o3OWz8axq+8=;
        fh=e+cD9sANEWDvYDlMD+5CPkpzV0r37PLCC2UE9Cep7hk=;
        b=VIAJMZybBHnS4qzf4E+RU2bCPqOdRxWgbGkGzIPcUs1NTVan6S77w0CskMJvdjzr0Y
         ZKktuFTyqkkN9jrDZfjS2wkHC9WXfmc6iak88z8PQPtJbvmM7s6bqzBy6urlArqDy6SF
         kpyDA7EFnw5fGvMKWdKCwHlZ2tzDO/Hvh7QRWB3etKA5sdYYseyQ2PwIOAG+Q1bHx/6o
         RLIzFkX81Rii7Fc4HOfrBzf5t2+hvmBrvoySfKIO3sTU5GQ81GXN3yBCg2yGMWdAT8Sd
         d5Qnk8A/dVj36JCbf+nvdq9fxHIwz5dutyETXNv88mSBGWiro2vhciTxGjBbIdepBcQs
         XdCQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=gLF67TKU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ae4b42c46fsi81450516d6.462.2024.06.03.03.32.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Jun 2024 03:32:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=gLF67TKU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sE4ym-0006R3-Hy; Mon, 03 Jun 2024 06:31:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1sE4yj-0006QO-KJ; Mon, 03 Jun 2024 06:31:50 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1sE4yU-0005EO-5o; Mon, 03 Jun 2024 06:31:49 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-57a50ac2ca1so1777493a12.0; 
 Mon, 03 Jun 2024 03:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717410690; x=1718015490; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SvLRwyIBI3cbGGaqHKdWaAaofQdbiKv1o3OWz8axq+8=;
 b=gLF67TKU6xgZXFDWk1RtUcAaO81qpK6abrS/is92vw0eXs2ngHw81iFsY/xTdunKdC
 auOLcEIHcIZ+PGeS0vSFMgovzGUdfQyWOik6UK1syhullApojLn/FLAXzOI2v/OrD8zZ
 shhsd6rcSD8PM9ti21fsvHRwae74TQk3h5SWoC6MjmO3qVC34MVzpTaoL8W5lYBezvOs
 UxZ01Ibn/QGHS9m8zOdUyHJ8X8xi7jH3woVD+6jXcDwhwn14W4gugNVOinc57+NyGe+V
 6THsWw9g9NO0Iir7pPdMHaEdzku9mtMirMhsa8jvVSB1Ar+nrkp4AGtpUaHR+Bywz4Dy
 5G3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717410690; x=1718015490;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SvLRwyIBI3cbGGaqHKdWaAaofQdbiKv1o3OWz8axq+8=;
 b=KzT0uTIQRNIYIUnKzMpC4cbRQrT0nrX+6/gNklzTF86PD1tI8oP/gXH3FioI1J9jHN
 yxH/VfNwKLHLRW3Dru3sny2LYPXtPd3p9eFdFB/MfDOAfQHblFa9APO30ADG6lyCSllx
 ZqK1X7jhhfFNIyZ9jVkDMlMhoZPwyhlqb+5zR/sEwKgjxu58JxSr1AHpt+txJu8iDq0t
 GIkJTDWeo1aD+6G+p5M6oYHGLlHul+SpFJDdYi4v/4SvTOiClncb22XZ1Vx5frV5CSJO
 +k0wJ6FahLlz4pCiP6LVgcq/aq4PNFp85m6QyDsRFC4UsUggnHKqeq23Nvh3uDM1Ljak
 z7pg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWARpT3N32RCdzMgXHInWH+FLFFqP7lALlKz003IXvFKf+/kHCJqwAnUJg8jS+ZDQm2lJpPFrfodmnyoQM9kWLfi46EaqymhkWPdW7/5Ds7OkXVzObRQRSQ+fI=
X-Gm-Message-State: AOJu0YwdST54e/enIHbgpSH4tIZo+2ju5N3kaa6WQJnwOjtdAIlaDUxt
 Gjk/46Gp2UKUjg2E4zeNfI+ikP2D9HWZIuhGEzR/rGdb/7jzoluZaQnGNIKJJ6iIKhm9rreRmNw
 +pETIJOU17vyFj2nE3HBc/ywA5mo=
X-Received: by 2002:a50:8e04:0:b0:57a:1ef8:da99 with SMTP id
 4fb4d7f45d1cf-57a365400d4mr5742455a12.32.1717410690204; Mon, 03 Jun 2024
 03:31:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240603055248.3928469-1-fea.wang@sifive.com>
 <20240603055248.3928469-5-fea.wang@sifive.com>
In-Reply-To: <20240603055248.3928469-5-fea.wang@sifive.com>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Mon, 3 Jun 2024 12:31:18 +0200
Message-ID: <CAJy5ezocZnmYec5TenZNtOe6+2-OxzaRaSXLW1XYHL5X0Xd8dw@mail.gmail.com>
Subject: Re: [PATCH 4/4] hw/net: Fix the transmission return size
To: "Fea.Wang" <fea.wang@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Jason Wang <jasowang@redhat.com>, "open list:Xilinx Zynq" <qemu-arm@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000001f8d350619f9d604"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
X-TUID: g6RdvSKJioPO

--0000000000001f8d350619f9d604
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 3, 2024 at 7:48=E2=80=AFAM Fea.Wang <fea.wang@sifive.com> wrote=
:

> Fix the transmission return size because not all bytes could be
> transmitted successfully. So, return a successful length instead of a
> constant value.
>
>
How did you test this patch, on Linux or something else? I have some
memory that we had some trouble with similar patches before.

Anyway, the change looks good to me:
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>



> Signed-off-by: Fea.Wang <fea.wang@sifive.com>
> ---
>  hw/net/xilinx_axienet.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
> index 7d1fd37b4a..05d41bd548 100644
> --- a/hw/net/xilinx_axienet.c
> +++ b/hw/net/xilinx_axienet.c
> @@ -847,7 +847,7 @@ static ssize_t eth_rx(NetClientState *nc, const
> uint8_t *buf, size_t size)
>      axienet_eth_rx_notify(s);
>
>      enet_update_irq(s);
> -    return size;
> +    return s->rxpos;
>  }
>
>  static size_t
> --
> 2.34.1
>
>

--0000000000001f8d350619f9d604
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Jun 3, 2024 at 7:48=E2=80=AFAM Fe=
a.Wang &lt;<a href=3D"mailto:fea.wang@sifive.com">fea.wang@sifive.com</a>&g=
t; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">Fix the transmission return size because not all bytes=
 could be<br>
transmitted successfully. So, return a successful length instead of a<br>
constant value.<br>
<br></blockquote><div><br></div><div>How did you test this patch, on Linux =
or something else? I have some</div><div>memory that we had some trouble wi=
th similar patches before.</div><div><br></div><div>Anyway, the change look=
s good to me:</div><div>Reviewed-by: Edgar E. Iglesias &lt;<a href=3D"mailt=
o:edgar.iglesias@amd.com">edgar.iglesias@amd.com</a>&gt;<br></div><div><br>=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
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

--0000000000001f8d350619f9d604--
