Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50F30C83F27
	for <qemu-arm@archiver.kernel.org>; Tue, 15 Jul 2025 22:24:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ubo4Y-0001uQ-Gx; Tue, 15 Jul 2025 18:24:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1ubo4L-0001qS-P0
 for qemu-arm@nongnu.org; Tue, 15 Jul 2025 18:24:15 -0400
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1ubo4I-0007mm-Uj
 for qemu-arm@nongnu.org; Tue, 15 Jul 2025 18:24:13 -0400
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-554f9a46164so1114e87.1
 for <qemu-arm@nongnu.org>; Tue, 15 Jul 2025 15:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1752618246; x=1753223046; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CPCk36xB/KKy226d6CuRdX7mewTT269FIj3//HjbjKE=;
 b=eEKEl6M52lezxpS22R1r+iHHMgEF/id7jsKw8jSoCgPYY5qSnD18H2CMFZzfYmqbh5
 1AIWEe0l3NAAqKqpPXeS0AOBt9xGuHe+vkjv343r8IxRfTUdtKbIhsH4jzF0N16FdXn6
 OZJZHPgmhzDTkA7GN+nVd200Ih3oQTlfG12lS592Wjrt9H4dm6Xd4rjfBJ8T/MregdFz
 8lxSgeceaxu21g0f5JSalloTsaCbnTW6I8g3DMVdc7BedUqWW7ntgLDOIplLHkqiPAvA
 d6z2v965mJzzTY/EKC6Frm0ypYWSIpyfxB2mXHz1f6ErXI62ezGOH4mGh30imMT5E6gE
 F+qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752618246; x=1753223046;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CPCk36xB/KKy226d6CuRdX7mewTT269FIj3//HjbjKE=;
 b=UA8b5v8GKbK0GWvP83PS3QHUcK5yiU1SHlUzgD7IjBKwrNg74nsDWz0yt0KK7hANUB
 WkJSF8TfSBp2p+rDArgFV/+2yh+ahc1urxZts6a+uJMXGI8F9AghWoOXXJgBr0baaE60
 /6gm/ZIv343//75FHrOb5zD8B0BS6+lRYp/m5ZaSrT7JOwB9+0MlquUZHlq+svf7yH5N
 +j1HyaTwUCF91c5o2crQ21p8nst+YuD/X4F9LwwQmoPqOKGQXHYf+vsgqS1TCykcU25B
 XTI/22lk1QMIEOLUv1EOezsXCNqB4rtetHGdjyanHFixjWU3e2BA+XeL8y1yQpLZj5DR
 d3Pg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrfwhCGe2punOCk6gGk+T4qVdfBQopIjUFpntqfaFiFPVyzxjE6kR+m7gx503eUO/AO6VAW6ReWw==@nongnu.org
X-Gm-Message-State: AOJu0YyhdS5na/vOV2Qh2c1hIUDEPXoKN4KYtpeheUriwDUmmMigsipK
 CIW1A+Z20b0qR7rcfsMLmXGmoW3OmEKh0EXBEJFZCDdF2mXT/2oE2LUW5yxxvsWJ3odf0UhPk36
 wuP8/isNeRR0fsmtCwzWY+Q9CIXyRE/ZTYlFkhL/q
X-Gm-Gg: ASbGncvwX4qf/aLmDqazHoYh3ibWSSpYu6UhUIdbvzTkxi9UoRHuihuLukiAadeyKtj
 mOmz633wUTRRxMn6pOYEs83wihI7gnF+QMODRT2NaptFHewqdNMOMV+QrBEEq1b7WFAADUqZrS4
 RdW58dq5sDLs81fMNc8QzGuoQtR733eelzYryg7pmJREsgzzucNyXU3/+9tfGBTiWPij2p4dTaa
 yym5yDeGktJK0bkIP6vSerEIIIxROC4FDfcWw==
X-Google-Smtp-Source: AGHT+IGIOsA+vNOOAPjA+Qic1Rgu0+d1eKpjpN2vGp23cCpeYz/QXcYzlmn0e/diQIe3GH8vhsLoWOy7GZwbiGVMg7g=
X-Received: by 2002:a05:6512:60e:20b0:553:bfb8:3b10 with SMTP id
 2adb3069b0e04-55a24593184mr13657e87.2.1752618245860; Tue, 15 Jul 2025
 15:24:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250714165523.1956235-1-peter.maydell@linaro.org>
 <20250714165523.1956235-4-peter.maydell@linaro.org>
 <3138a372-7649-404a-8e8e-53b097c33094@linaro.org>
In-Reply-To: <3138a372-7649-404a-8e8e-53b097c33094@linaro.org>
From: Hao Wu <wuhaotsh@google.com>
Date: Tue, 15 Jul 2025 15:23:51 -0700
X-Gm-Features: Ac12FXz4Jlt8-8ri6ktptCAIFk04SmlGcvP8Y9_8vX49epF3ZtSgHjnagwQzLqo
Message-ID: <CAGcCb1184552Ut7r4K7aGxnHXf53Hbqjn6fDKze7+RwFT-qd_w@mail.gmail.com>
Subject: Re: [PATCH 3/4] hw/net/npcm_gmac.c: Correct test for when to
 reallocate packet buffer
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, 
 Tyrone Ting <kfting@nuvoton.com>, Jason Wang <jasowang@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000f907170639ff3bd4"
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=wuhaotsh@google.com; helo=mail-lf1-x12b.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
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

--000000000000f907170639ff3bd4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for catching that!

On Mon, Jul 14, 2025 at 1:08=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 <philmd=
@linaro.org>
wrote:

> On 14/7/25 18:55, Peter Maydell wrote:
> > In gmac_try_send_next_packet() we have code that does "if this block
> > of data won't fit in the buffer, reallocate it".  However, the
> > condition it uses is
> >    if ((prev_buf_size + tx_buf_len) > sizeof(buf))
> > where buf is a uint8_t *.
> >
> > This means that sizeof(buf) is always 8 bytes, and the condition will
> > almost always be true, so we will reallocate the buffer more often
> > than we need to.
> >
> > Correct the condition to test against tx_buffer_size, which is
> > where we track how big the allocated buffer is.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >   hw/net/npcm_gmac.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>

--000000000000f907170639ff3bd4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thank you for catching that!</div><br><div class=3D"g=
mail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On =
Mon, Jul 14, 2025 at 1:08=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 &lt;<a hre=
f=3D"mailto:philmd@linaro.org">philmd@linaro.org</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">On 14/7/25 18:55, Peter May=
dell wrote:<br>
&gt; In gmac_try_send_next_packet() we have code that does &quot;if this bl=
ock<br>
&gt; of data won&#39;t fit in the buffer, reallocate it&quot;.=C2=A0 Howeve=
r, the<br>
&gt; condition it uses is<br>
&gt;=C2=A0 =C2=A0 if ((prev_buf_size + tx_buf_len) &gt; sizeof(buf))<br>
&gt; where buf is a uint8_t *.<br>
&gt; <br>
&gt; This means that sizeof(buf) is always 8 bytes, and the condition will<=
br>
&gt; almost always be true, so we will reallocate the buffer more often<br>
&gt; than we need to.<br>
&gt; <br>
&gt; Correct the condition to test against tx_buffer_size, which is<br>
&gt; where we track how big the allocated buffer is.<br>
&gt; <br>
&gt; Signed-off-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linar=
o.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0hw/net/npcm_gmac.c | 4 ++--<br>
&gt;=C2=A0 =C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linar=
o.org" target=3D"_blank">philmd@linaro.org</a>&gt;<br>
<br></blockquote><div>Reviewed-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@go=
ogle.com">wuhaotsh@google.com</a>&gt;=C2=A0</div></div></div>

--000000000000f907170639ff3bd4--

