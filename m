Received: by 2002:a17:906:7fcb:b0:a66:557b:2f6e with SMTP id r11csp2121722ejs;
        Mon, 3 Jun 2024 03:22:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU9JB3o4aMAU87zvLaCYGHoCdbYe0F5oXC86an7q40RbmmrYpt4QD45PTLjsB1W10xPYmolSajbWAt5qP7UbxhLjs3ufCv5
X-Google-Smtp-Source: AGHT+IHw01VrObNpPzZA+daRZTCbOZD3Lu1cmTL/YVZD85EUQd1dCK7kc3UaPRUDtXGE2xKANr0N
X-Received: by 2002:a81:ae0b:0:b0:627:c0ac:8e4a with SMTP id 00721157ae682-62c79890f15mr80856927b3.48.1717410130457;
        Mon, 03 Jun 2024 03:22:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717410130; cv=none;
        d=google.com; s=arc-20160816;
        b=O2Q5N/TvepD+epNz0xf8RmuCasYOy+S+YwkIh1dApGvsZscExMQYemVC/uBcG9qAi9
         hNTRph+02aK10ylusejsHVgxPuudP3HKrhuDSZZ9Gjtvz0WO8N8ct8e2k1ePxOSsTB07
         bfj11E3bikLrXWxX9tHWEK7j5+ZM/0suTucPXqGhhfAT51FaZM3XL/drbkasPX44d6k2
         XkpntRlpNAzaIL0xkaAu7YomZgG6F63lmG5VIlqS/nrR1X6TN32FA4wm0IugT4mGAtBZ
         1moy8654cw+0MgQUT+8DlIlxsb8lhcWpkAgRwUeHh/sIwJo4aFSWNFBvHRcVx9vI9yFJ
         VfsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=uEQPfGhMMknrOO0R7rofZg4Wk+PCgMsskyLxnBw2WNE=;
        fh=/jTXoCXsSNSJRGjyr1eWyjvYomHMe50b+TdWmxd0ntw=;
        b=egV0IJRH7O1uNwN3habVghvLexL0q44ycHASzDCuusOkHis7HeiDkbhG6UPT2Wiywh
         mFBZH9L96W1WtYLhoaxC2FvGsrWdy4T399FHLVGdfP7dt3Zv03HFQMBwnYlWL2iY8QgS
         44IMrSi/gXS6TkRpAJAEfAZ7dyagSYaNSCDQJZsHp5MfKayUdzyhRE4e3LssiwyyUIK1
         lgOVS2nN0YJG+Xoq8CbXjvuco8+x80+G/AQvEs4JzYVsG77SH+CYKcVFBPXZNytXxHcv
         n/OIPKvZI7/QnZXXyJmO/xmGJSGrdh7z2pcrmb1AkbUZ4NEul5ZtOwggY65x9fFYxiOz
         x+gw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=j+AkR39Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-794f2f055d1si904020285a.119.2024.06.03.03.22.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Jun 2024 03:22:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=j+AkR39Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sE4p4-00016H-TZ; Mon, 03 Jun 2024 06:21:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1sE4oy-00011K-Q3; Mon, 03 Jun 2024 06:21:44 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1sE4ox-0002wx-4W; Mon, 03 Jun 2024 06:21:44 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-57864327f6eso6716624a12.1; 
 Mon, 03 Jun 2024 03:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717410100; x=1718014900; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uEQPfGhMMknrOO0R7rofZg4Wk+PCgMsskyLxnBw2WNE=;
 b=j+AkR39Ywym1VgeJ/k4KhGPoFqB86Owu+XEXpIoLCLUGIDE4st2uvKZCWTveX65ISX
 u1AiYhOmPEblnwjbtp5TLxJe04dQTurrJXfoyUwFjRzBV0JjMExwYV/H4x1K9e+tLNJy
 PTiDGoxjj+DkhOTI0Cf/h8XKVmgoHikKnT/enAnPWqdvX5wAANmO18UMDlQyTSaG/4dN
 A7EHB8XBLh97vd5HZXVrCDHlwWX+zmnj6NNExHqyCS3AweXDNraQba+7/vJnQAo88j2Y
 p3gVO75oBc+A+lIa9D1QqjWFBTrNMzyGOS6Kh0bQXjnh62jZ0MEqIfXtAyOGE58fAKot
 5hug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717410100; x=1718014900;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uEQPfGhMMknrOO0R7rofZg4Wk+PCgMsskyLxnBw2WNE=;
 b=C28usRiRmkRu8FP9mCB7ZgBgkTlW2ebBzJIEAXIIGGAUKFsAPIOTqS7P9bPcDNqGBG
 /V95FcCemeZYDB+EecZLqPwjYQNEuhuC0fzk+lEz4W3jlmvRZyaDeBkDo4SY6iHGlYF5
 8utDzfo/PqedVyxV+6QSatCh1yc63qB4vqxfCSuMXPt5FwJ5guwrIuPIf3wbj8OQoQhK
 td0AFusXWhdo40ILhjx7akS7FO0YQan8awp8JOA3F7pxF5mWfHdTt85LCXRl8JZ3Fhsy
 cMD6lpfbydcRKkkio1zzrPNAjKr8pTqS7OSr0zU4+jHTzXnc51VCaTaXNC5/ZrfvQwmK
 atuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVitgzM24qQ8mCIW/R6wjajlZkqNTyVkO3VGdpM24ssqPnFn43vwWOrJrbvd/ZO3V+jKP4SbBOcQvSoVhS4UhdtsB14qHuVFhF7gwE1EblB/ISkQa8e94cxDg=
X-Gm-Message-State: AOJu0YzxnbvN82gkK8sCAIr5bEyOJSUGY34Q5X6z4iOVloGV25VdDt+J
 ocjsFwuAxQkWTFwdWhd+PgBDHtIahEQbSV7sB9qA6hX3m4b7v6M9A4vv79uzWadH3wL6FFToJSf
 ofmSmxRdkKkQwKLtgHp2NtzQKDTw=
X-Received: by 2002:a50:9349:0:b0:578:6484:24ff with SMTP id
 4fb4d7f45d1cf-57a19f546ddmr10345054a12.6.1717410099023; Mon, 03 Jun 2024
 03:21:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240603055248.3928469-1-fea.wang@sifive.com>
 <20240603055248.3928469-3-fea.wang@sifive.com>
In-Reply-To: <20240603055248.3928469-3-fea.wang@sifive.com>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Mon, 3 Jun 2024 12:21:27 +0200
Message-ID: <CAJy5ezp6pkpEqCHc+ggXi+-VR+u+3HKyn5inzasyqBR9FaGiog@mail.gmail.com>
Subject: Re: [PATCH 2/4] hw/dma: Break the loop when loading descriptions fails
To: "Fea.Wang" <fea.wang@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Jason Wang <jasowang@redhat.com>, "open list:Xilinx Zynq" <qemu-arm@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000e2d72f0619f9b20d"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 44g6Dkkt5O8z

--000000000000e2d72f0619f9b20d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 3, 2024 at 7:48=E2=80=AFAM Fea.Wang <fea.wang@sifive.com> wrote=
:

> When calling the loading a description function, it should be noticed
> that the function may return a failure value. Breaking the loop is one
> of the possible ways to handle it.
>
> Signed-off-by: Fea.Wang <fea.wang@sifive.com>
>


Looks good, a nitpick comment, I would either squash this with patch #1
or move the change to return of error code in stream_desc_load() to this
patch.




> ---
>  hw/dma/xilinx_axidma.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
> index 4b475e5484..b8ab5a423d 100644
> --- a/hw/dma/xilinx_axidma.c
> +++ b/hw/dma/xilinx_axidma.c
> @@ -291,7 +291,9 @@ static void stream_process_mem2s(struct Stream *s,
> StreamSink *tx_data_dev,
>      }
>
>      while (1) {
> -        stream_desc_load(s, s->regs[R_CURDESC]);
> +        if (MEMTX_OK !=3D stream_desc_load(s, s->regs[R_CURDESC])) {
> +            break;
> +        }
>
>          if (s->desc.status & SDESC_STATUS_COMPLETE) {
>              s->regs[R_DMASR] |=3D DMASR_HALTED;
> @@ -348,7 +350,9 @@ static size_t stream_process_s2mem(struct Stream *s,
> unsigned char *buf,
>      }
>
>      while (len) {
> -        stream_desc_load(s, s->regs[R_CURDESC]);
> +        if (MEMTX_OK !=3D stream_desc_load(s, s->regs[R_CURDESC])) {
> +            break;
> +        }
>
>          if (s->desc.status & SDESC_STATUS_COMPLETE) {
>              s->regs[R_DMASR] |=3D DMASR_HALTED;
> --
> 2.34.1
>
>

--000000000000e2d72f0619f9b20d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Jun 3, 2024 at 7:48=E2=80=AFAM Fe=
a.Wang &lt;<a href=3D"mailto:fea.wang@sifive.com">fea.wang@sifive.com</a>&g=
t; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">When calling the loading a description function, it sh=
ould be noticed<br>
that the function may return a failure value. Breaking the loop is one<br>
of the possible ways to handle it.<br>
<br>
Signed-off-by: Fea.Wang &lt;<a href=3D"mailto:fea.wang@sifive.com" target=
=3D"_blank">fea.wang@sifive.com</a>&gt;<br></blockquote><div><br></div><div=
><br></div><div>Looks good, a nitpick comment, I would either squash this w=
ith patch #1</div><div>or move the change to return of error code in stream=
_desc_load() to this patch.</div><div><br></div><div><br></div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0hw/dma/xilinx_axidma.c | 8 ++++++--<br>
=C2=A01 file changed, 6 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c<br>
index 4b475e5484..b8ab5a423d 100644<br>
--- a/hw/dma/xilinx_axidma.c<br>
+++ b/hw/dma/xilinx_axidma.c<br>
@@ -291,7 +291,9 @@ static void stream_process_mem2s(struct Stream *s, Stre=
amSink *tx_data_dev,<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0while (1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 stream_desc_load(s, s-&gt;regs[R_CURDESC]);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (MEMTX_OK !=3D stream_desc_load(s, s-&gt;re=
gs[R_CURDESC])) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (s-&gt;desc.status &amp; SDESC_STATUS_=
COMPLETE) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;regs[R_DMASR] |=3D DM=
ASR_HALTED;<br>
@@ -348,7 +350,9 @@ static size_t stream_process_s2mem(struct Stream *s, un=
signed char *buf,<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0while (len) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 stream_desc_load(s, s-&gt;regs[R_CURDESC]);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (MEMTX_OK !=3D stream_desc_load(s, s-&gt;re=
gs[R_CURDESC])) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (s-&gt;desc.status &amp; SDESC_STATUS_=
COMPLETE) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;regs[R_DMASR] |=3D DM=
ASR_HALTED;<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div></div>

--000000000000e2d72f0619f9b20d--
