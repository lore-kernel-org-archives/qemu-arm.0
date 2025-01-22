Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp592145njc;
        Tue, 21 Jan 2025 22:39:20 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUI3YXzy63mphshcUrsAyXDHA8p2plljval2SDTS4Ff1svVzeA+tfh506qBOEmrmHYgLtaZMVc+ptzScA==@linaro.org
X-Google-Smtp-Source: AGHT+IGH8Yfx71mivTJiduB23Pg9necEa3EPH7NFyXHRcTWtXnZbHVq6dvHBoWR0JrqAfDT0+7g+
X-Received: by 2002:a05:600c:3d05:b0:434:f767:68ea with SMTP id 5b1f17b1804b1-438b0dc9532mr37816075e9.5.1737527960603;
        Tue, 21 Jan 2025 22:39:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737527960; cv=none;
        d=google.com; s=arc-20240605;
        b=Zmgm4u0n+rUKwTZhGLbAnwud6VI+pMNoDDpKC/g4xqpAo/feZphlquYOwADyft5Z7r
         OfmQgaO1PWEedyCtH0DB9qy92nHChtDzNyCI+R68ORplDCAfoGroElwvPP+0yBKL1a7f
         KBswdHqM/g2kCcxWCLFr507cJ765f350m5gPg4lUMf9Gnnm9pqAHlhfXDTGu3Rx7RGK5
         sjsrxNYU82yzaA1XJ2JGYF+0md/EAzRDjwxlxD3V6MWdlCJ/gc0YBppF/zjg4mf5xRWP
         i5Cc8rgebg42LWfNe9T2ydofMg89Y1jKFnv6CQgLozualG28ah+T0cEF59446QeL/PcU
         0UfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=j8EXQvgURo8X1Ye9BX0shzlGgH6JOTfdK1fhtnuqqHw=;
        fh=jkH6dM/Jgs9himnUS9dDf106T2wMoYgrWODVkTGIyAs=;
        b=Q5cofLg/0YhLgsi786qEu8d+fLVtRL51WwnK7Av4Ff7VKd41rlfQcHeWvGAlmRob4z
         zASyX/4+2zBFXqTWtaTymCarYiVNHc9kOI/zJUdVMoP4YHeoIr46vaMCyMV0sCS0hcwU
         WLIatjRv/z1xXo6wjgXijBknEHmpOo/hhfNOxfchrcSGUTIQU5n+QFGeXmG1J32rLtp2
         WN3muPvrAHCH14sxeNOUMIKQ38LvyGt2+NpbEfhVYVpQktXs2CHbDpkvT38nbJO0sGUG
         1i5ZeA2fLfKumUOaSpcFEJTmowUvyCwc0Z0Q83L1/ZVCIkyXhojdYvZggtSetYnjryBm
         3YNA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=Cc1988+L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-438b31fc03dsi5728025e9.179.2025.01.21.22.39.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jan 2025 22:39:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=Cc1988+L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1taUO7-0003f1-J3; Wed, 22 Jan 2025 01:38:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1taUNv-0003dm-8d
 for qemu-arm@nongnu.org; Wed, 22 Jan 2025 01:38:45 -0500
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1taUNm-0007fm-Dp
 for qemu-arm@nongnu.org; Wed, 22 Jan 2025 01:38:36 -0500
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-53e44a42512so2990e87.1
 for <qemu-arm@nongnu.org>; Tue, 21 Jan 2025 22:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1737527912; x=1738132712; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=j8EXQvgURo8X1Ye9BX0shzlGgH6JOTfdK1fhtnuqqHw=;
 b=Cc1988+LCxONVx2+FgsxawhwY4bW0hrn5SklNVOnP52+iJxiKZzCyUVCVs5AbIeymy
 hbWWj7PcUN3gi2QcFZv8gjLlbCE+w/Bb1DasPWUcmH+IHojZxb4vljcM2fOBXCsP/dwE
 ryDEYfG87+7lOhtrnRTLttwV7AKy24fpPPfsnCAAYafqzuJlshFv1sEpiIndAXK2tpet
 0wo9A3ciGJ8BWhwv7/dQ/GGXgjqT7qdleZttFB1FjA44wzZVE87vH1J8EHH1yS051cB7
 CSffspRLV4BUk//wF8riYuq5JWAmfILQS0oBP9ajnUvZ0IpdypU3dEIjkMltkqNvA1Ks
 TqFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737527912; x=1738132712;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j8EXQvgURo8X1Ye9BX0shzlGgH6JOTfdK1fhtnuqqHw=;
 b=hN31A7oLDSwHc/bWWjuBiRj6bSUMreqvhRhMxbWAvb9oebiW+3lAKvVmcW7LVfdL1q
 dFi/ZgRm4HRyKxk9c1C/kztNaWlaQ/hzasdUy+KFKXonDOSG7AtYIYfip7ukoZLua29E
 PGqkY/3auD96KMGoNy7IFQJvFNCLfWMfgjVUjNQ6gBxFFOofm4KhyuFgdUkOeWIqvz+w
 9GG24KaaxaaMaWVEr83QqHUHKvbM5/crnXgY9osaPRjtqwm6+GOMmUrx6N5sHNHLNLyy
 ENCrFogi66yUvwa8LYX7o1oF1GwEP2Xu5/QlcmIGu1R0rj3b5kzqvU7rOUUHZqlm20Yb
 Urig==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZSWjIKIR34oAC5RsbQXMtxGOLJoAG4Z4JOncy1FA9ew4dMpNFDyZq1/Fo1TW5HbAzcjhghsgyOA==@nongnu.org
X-Gm-Message-State: AOJu0Ywhl337yvPYG+c8GpRmrss5tkdN1rBD8EdCE5urChAnUtSLPtZG
 ijw/Uf4Ki9M2FNtqCWFfuVVDppIy5zn4N08wPhZzTWwc9mWU3qI2a4tW9BF2Q7jg7Bm0GIn6KV0
 c73uPiuysRr/0HXyEruPS+XESZ0b/7FvKD86G
X-Gm-Gg: ASbGncsPyj+FPh9fK4M5zeIl+82XouuPTKiLSOQ712hSrEgYkecoQqjcgw3mxXlG13v
 fZzPZEeoKhIz9JWxZ+SKXPNcS3J2nYazKw68F59X4uXMO7AzL3F2tyZDyAB2kcMLyYXvZJK8Ii7
 Zcbb8=
X-Received: by 2002:a05:6512:38c6:b0:542:92ee:25ec with SMTP id
 2adb3069b0e04-543bcc812f5mr103740e87.1.1737527911692; Tue, 21 Jan 2025
 22:38:31 -0800 (PST)
MIME-Version: 1.0
References: <20250121105935.3069035-1-titusr@google.com>
In-Reply-To: <20250121105935.3069035-1-titusr@google.com>
From: Hao Wu <wuhaotsh@google.com>
Date: Wed, 22 Jan 2025 14:38:19 +0800
X-Gm-Features: AbW1kvbTlLIkmXv4WUusPWHjh8BoLCwAM2ZL_pAekvWHFpRRnsYh6J6LdeJS5dQ
Message-ID: <CAGcCb11V5oP3VBXK+L_MFBYPtj2FQuG-CM+zmCb3cyqbNke5=g@mail.gmail.com>
Subject: Re: [PATCH v2] hw/misc: i2c-echo: add tracing
To: Titus Rwantare <titusr@google.com>
Cc: philmd@linaro.org, minyard@acm.org, its@irrelevant.dk, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, clg@kaod.org
Content-Type: multipart/alternative; boundary="000000000000f76770062c45bd0a"
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=wuhaotsh@google.com; helo=mail-lf1-x12f.google.com
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
X-TUID: ZOTw4NahGXg0

--000000000000f76770062c45bd0a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 21, 2025 at 7:00=E2=80=AFPM Titus Rwantare <titusr@google.com> =
wrote:

> This has been useful when debugging and unsure if the guest is
> generating i2c traffic.
>
> Signed-off-by: Titus Rwantare <titusr@google.com>
>
Reviewed-by: Hao Wu <wuhaotsh@google.com>

> ---
>  hw/misc/i2c-echo.c   | 8 ++++++++
>  hw/misc/trace-events | 5 +++++
>  2 files changed, 13 insertions(+)
>
> diff --git a/hw/misc/i2c-echo.c b/hw/misc/i2c-echo.c
> index 5ae3d0817e..65d10029dc 100644
> --- a/hw/misc/i2c-echo.c
> +++ b/hw/misc/i2c-echo.c
> @@ -13,6 +13,7 @@
>  #include "qemu/main-loop.h"
>  #include "block/aio.h"
>  #include "hw/i2c/i2c.h"
> +#include "trace.h"
>
>  #define TYPE_I2C_ECHO "i2c-echo"
>  OBJECT_DECLARE_SIMPLE_TYPE(I2CEchoState, I2C_ECHO)
> @@ -80,11 +81,13 @@ static int i2c_echo_event(I2CSlave *s, enum i2c_event
> event)
>      case I2C_START_RECV:
>          state->pos =3D 0;
>
> +        trace_i2c_echo_event(DEVICE(s)->canonical_path, "I2C_START_RECV"=
);
>          break;
>
>      case I2C_START_SEND:
>          state->pos =3D 0;
>
> +        trace_i2c_echo_event(DEVICE(s)->canonical_path, "I2C_START_SEND"=
);
>          break;
>
>      case I2C_FINISH:
> @@ -92,12 +95,15 @@ static int i2c_echo_event(I2CSlave *s, enum i2c_event
> event)
>          state->state =3D I2C_ECHO_STATE_START_SEND;
>          i2c_bus_master(state->bus, state->bh);
>
> +        trace_i2c_echo_event(DEVICE(s)->canonical_path, "I2C_FINISH");
>          break;
>
>      case I2C_NACK:
> +        trace_i2c_echo_event(DEVICE(s)->canonical_path, "I2C_NACK");
>          break;
>
>      default:
> +        trace_i2c_echo_event(DEVICE(s)->canonical_path, "UNHANDLED");
>          return -1;
>      }
>
> @@ -112,6 +118,7 @@ static uint8_t i2c_echo_recv(I2CSlave *s)
>          return 0xff;
>      }
>
> +    trace_i2c_echo_recv(DEVICE(s)->canonical_path,
> state->data[state->pos]);
>      return state->data[state->pos++];
>  }
>
> @@ -119,6 +126,7 @@ static int i2c_echo_send(I2CSlave *s, uint8_t data)
>  {
>      I2CEchoState *state =3D I2C_ECHO(s);
>
> +    trace_i2c_echo_send(DEVICE(s)->canonical_path, data);
>      if (state->pos > 2) {
>          return -1;
>      }
> diff --git a/hw/misc/trace-events b/hw/misc/trace-events
> index cf1abe6928..d58dca2389 100644
> --- a/hw/misc/trace-events
> +++ b/hw/misc/trace-events
> @@ -390,3 +390,8 @@ ivshmem_flat_read_write_mmr_invalid(uint64_t
> addr_offset) "No ivshmem register m
>  ivshmem_flat_interrupt_invalid_peer(uint16_t peer_id) "Can't interrupt
> non-existing peer %u"
>  ivshmem_flat_write_mmr(uint64_t addr_offset) "Write access at offset
> %"PRIu64
>  ivshmem_flat_interrupt_peer(uint16_t peer_id, uint16_t vector_id)
> "Interrupting peer ID %u, vector %u..."
> +
> +#i2c-echo.c
> +i2c_echo_event(const char *id, const char *event) "%s: %s"
> +i2c_echo_recv(const char *id, uint8_t data) "%s: recv 0x%" PRIx8
> +i2c_echo_send(const char *id, uint8_t data) "%s: send 0x%" PRIx8
> --
> 2.48.0.rc2.279.g1de40edade-goog
>
>
>

--000000000000f76770062c45bd0a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 21,=
 2025 at 7:00=E2=80=AFPM Titus Rwantare &lt;<a href=3D"mailto:titusr@google=
.com">titusr@google.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">This has been useful when debugging and unsure if th=
e guest is<br>
generating i2c traffic.<br>
<br>
Signed-off-by: Titus Rwantare &lt;<a href=3D"mailto:titusr@google.com" targ=
et=3D"_blank">titusr@google.com</a>&gt;<br></blockquote><div>Reviewed-by: H=
ao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com">wuhaotsh@google.com</a>&gt=
;=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0hw/misc/i2c-echo.c=C2=A0 =C2=A0| 8 ++++++++<br>
=C2=A0hw/misc/trace-events | 5 +++++<br>
=C2=A02 files changed, 13 insertions(+)<br>
<br>
diff --git a/hw/misc/i2c-echo.c b/hw/misc/i2c-echo.c<br>
index 5ae3d0817e..65d10029dc 100644<br>
--- a/hw/misc/i2c-echo.c<br>
+++ b/hw/misc/i2c-echo.c<br>
@@ -13,6 +13,7 @@<br>
=C2=A0#include &quot;qemu/main-loop.h&quot;<br>
=C2=A0#include &quot;block/aio.h&quot;<br>
=C2=A0#include &quot;hw/i2c/i2c.h&quot;<br>
+#include &quot;trace.h&quot;<br>
<br>
=C2=A0#define TYPE_I2C_ECHO &quot;i2c-echo&quot;<br>
=C2=A0OBJECT_DECLARE_SIMPLE_TYPE(I2CEchoState, I2C_ECHO)<br>
@@ -80,11 +81,13 @@ static int i2c_echo_event(I2CSlave *s, enum i2c_event e=
vent)<br>
=C2=A0 =C2=A0 =C2=A0case I2C_START_RECV:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0state-&gt;pos =3D 0;<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 trace_i2c_echo_event(DEVICE(s)-&gt;canonical_p=
ath, &quot;I2C_START_RECV&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
<br>
=C2=A0 =C2=A0 =C2=A0case I2C_START_SEND:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0state-&gt;pos =3D 0;<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 trace_i2c_echo_event(DEVICE(s)-&gt;canonical_p=
ath, &quot;I2C_START_SEND&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
<br>
=C2=A0 =C2=A0 =C2=A0case I2C_FINISH:<br>
@@ -92,12 +95,15 @@ static int i2c_echo_event(I2CSlave *s, enum i2c_event e=
vent)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0state-&gt;state =3D I2C_ECHO_STATE_START_=
SEND;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i2c_bus_master(state-&gt;bus, state-&gt;b=
h);<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 trace_i2c_echo_event(DEVICE(s)-&gt;canonical_p=
ath, &quot;I2C_FINISH&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
<br>
=C2=A0 =C2=A0 =C2=A0case I2C_NACK:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 trace_i2c_echo_event(DEVICE(s)-&gt;canonical_p=
ath, &quot;I2C_NACK&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
<br>
=C2=A0 =C2=A0 =C2=A0default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 trace_i2c_echo_event(DEVICE(s)-&gt;canonical_p=
ath, &quot;UNHANDLED&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
@@ -112,6 +118,7 @@ static uint8_t i2c_echo_recv(I2CSlave *s)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0xff;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 trace_i2c_echo_recv(DEVICE(s)-&gt;canonical_path, state-&gt;=
data[state-&gt;pos]);<br>
=C2=A0 =C2=A0 =C2=A0return state-&gt;data[state-&gt;pos++];<br>
=C2=A0}<br>
<br>
@@ -119,6 +126,7 @@ static int i2c_echo_send(I2CSlave *s, uint8_t data)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0I2CEchoState *state =3D I2C_ECHO(s);<br>
<br>
+=C2=A0 =C2=A0 trace_i2c_echo_send(DEVICE(s)-&gt;canonical_path, data);<br>
=C2=A0 =C2=A0 =C2=A0if (state-&gt;pos &gt; 2) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
diff --git a/hw/misc/trace-events b/hw/misc/trace-events<br>
index cf1abe6928..d58dca2389 100644<br>
--- a/hw/misc/trace-events<br>
+++ b/hw/misc/trace-events<br>
@@ -390,3 +390,8 @@ ivshmem_flat_read_write_mmr_invalid(uint64_t addr_offse=
t) &quot;No ivshmem register m<br>
=C2=A0ivshmem_flat_interrupt_invalid_peer(uint16_t peer_id) &quot;Can&#39;t=
 interrupt non-existing peer %u&quot;<br>
=C2=A0ivshmem_flat_write_mmr(uint64_t addr_offset) &quot;Write access at of=
fset %&quot;PRIu64<br>
=C2=A0ivshmem_flat_interrupt_peer(uint16_t peer_id, uint16_t vector_id) &qu=
ot;Interrupting peer ID %u, vector %u...&quot;<br>
+<br>
+#i2c-echo.c<br>
+i2c_echo_event(const char *id, const char *event) &quot;%s: %s&quot;<br>
+i2c_echo_recv(const char *id, uint8_t data) &quot;%s: recv 0x%&quot; PRIx8=
<br>
+i2c_echo_send(const char *id, uint8_t data) &quot;%s: send 0x%&quot; PRIx8=
<br>
-- <br>
2.48.0.rc2.279.g1de40edade-goog<br>
<br>
<br>
</blockquote></div></div>

--000000000000f76770062c45bd0a--
