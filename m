Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA5F2D13C1B
	for <qemu-arm@archiver.kernel.org>; Tue, 27 Jan 2026 02:37:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vkYxA-0004oQ-Qu; Mon, 26 Jan 2026 21:37:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ktokunaga.mail@gmail.com>)
 id 1vkYx6-0004mG-Ri
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 21:37:12 -0500
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ktokunaga.mail@gmail.com>)
 id 1vkYx4-0001RJ-Mt
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 21:37:12 -0500
Received: by mail-dy1-x1332.google.com with SMTP id
 5a478bee46e88-2b4520f6b32so8268824eec.0
 for <qemu-arm@nongnu.org>; Mon, 26 Jan 2026 18:37:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769481427; cv=none;
 d=google.com; s=arc-20240605;
 b=C0i2NMjaNcYZQtLYKYAoZuQaQjrosnzfFY34hLi/r/RT1mZwzMB1UWmdP+5fZGD2UD
 PSNfp/0P/r2P/SgGFCM6dCbtfU08oERRiWxqFx9vPPYATRXBKe1dpEBwYcIaMBSMTXvB
 AsXXGggHFoas0RsK5k9fbOXQvAqABBEmq3suwkJGey5ue1PbBM2Von8TNaV2JoQDvhLW
 xxbR4vY2kJaTbR5xiyDDzyWDR4lK8KE8GByk/doNz0Zn8PeO2c+SrpMXFeEClAmxCV7+
 GrgTwfqgbXzVX3T9A2ZFsxe9W8GtdT66by8WR/0sA4Zpie4dJozP8FKt7OrnKKWGHZze
 gjyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=u67F4Kn5QxHMSdtqm0A4ShGfMSUUdj/w6/KQsvswZN8=;
 fh=uCgbT8t87RFZhSTEb6sAXqN8OJ5sohpVC7Ucqx/gFY8=;
 b=Nx2BlkqS1UUXJlXadDc9htuXVIi3VZa7wbKzev6XjJPc5B/iyjym2FSVMrmpQHvon9
 jdBfBmbFkqp0aeM2SR3xrUzm+RPT7CG4/cCtKdTuHV0hvkIMP/ReQMcgfgA6m0b2XUKr
 K0JGNqqCyRRCHD9tSZg72ixg1iMD0/vfKywaMy6RW38Y92akg2Q6PIknvbylJDU2QNMw
 W4LZZ9j2j1Lv+qi7t2Gj3BWCIcqXQXgvcKSoUNn83aOu8d63bp/BA1Vw6iSl/MltKCKM
 axxc8owvJKJ7vpaNU4fXkp9jnE/fbkj4zgcEKA9yNeVhFzKPEIdMH1XHXxItTIJR/U7Q
 u11Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769481427; x=1770086227; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=u67F4Kn5QxHMSdtqm0A4ShGfMSUUdj/w6/KQsvswZN8=;
 b=m2PSuBhjLt/5Vs/axE49Z1f9Zvldz47aVLz4qZ00XMlqkPertqURPcPVhDNcTQEd+s
 5bR7GUaU6oAjjCQvnt6ZTpW3g84xCGOFkYVs5Ux2ohu5Yna32kSkssdhTEdL+/xElEVG
 cfmYVmpvcUNCkffMoPgY0yrRioQRJPzvZuFmRkSCTeTsYXaCfC9V2IR5f7SoQ2FBeIN5
 S7UYLXeKup56f+tUcBzGekWYKQDJQufQA+shQPBg1mULo5ZALM/1/fPKJ+kJNlF14Bnl
 I38j6t40vm8H6HO6ZThj1ZkoGJWvs0CNu0Po2tCWoCAY5RVUraGo1/n3bByzZ73O877i
 AxZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769481427; x=1770086227;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u67F4Kn5QxHMSdtqm0A4ShGfMSUUdj/w6/KQsvswZN8=;
 b=gQlmVEMpMM6FxVU+F+66NQQ5lHbH+Vj7ylHQogByUL3JIMC7HIjF+QuYneUeTKy8zl
 uP/VhTjE16x3sDxv5cY/D1WcaZ0KVYqne0efpQfoP3bFItRgK69l1Qr1dxyTW+REJZxR
 1lGIzCnpWp4rAmFmRHmCFwohmHVOBlG7qIeupMC1aSB1/MPNXfTLkGfsk3pwAj+btj4n
 GiBhBqIQ+5Qd+b8oiPM24A6iyMeQTwK43NP8cFOOVpVlAao0i3xcroxfkI3pYvrtkBJl
 COIoZOvjz703sHMMJ6vt9fdd46a6tXWAtoI1RrwLCWVPpcZ3fym5JV1sxdiGZKVF5bXA
 PNmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvdAh8pNK2M6xzcIeIVgX2NCv2/PioOzfFm4qEVZ4rvKDifqZ5RWxkZ8nC0EOCIrDTUjmWX68ESQ==@nongnu.org
X-Gm-Message-State: AOJu0Yx4MwwfemecYEm2vEOEKvjx8VwCKr965BakpXKfih+W8nkURz6M
 jzFFcXVA0j/t3EvMaKEZoooUR+Jq3YEZw7PYiMU2TzExt0FvJIjzy3PgfSRxPZx1dxWqu7Lw/w0
 6NQtFQzRyRn1T8T3NbYtArM1nidCSmEU=
X-Gm-Gg: AZuq6aKDUVnF+n5+9A3qgRsWl5ZjfmwFZscnSS31nnJdDsXaRafTmBYlfgPMfIKYaz4
 tjtoE1ksAxKguNCStD2L+hMbGFZHWfkwB59qPzwar+TdFLC1mIhvtkQmw/w5PNwTSFfeDngZOdp
 SpMRvlpgXRVx2CcSbd/VkJdluN7+YaK+yq+2Em8CEj+v3IwPn+544rRU5jnH10uIfptmWMgMUF1
 Jc9Qq00Rnr6TTKOg80CfQSMG99WgUvb2un80UyK7eYwAq5eyAxbbOKP3vwjk6bZbFUdOYBE4NzW
 1TqGYXhu3huE2SwYCSCJKVp5SA==
X-Received: by 2002:a05:7022:128c:b0:11b:9e5e:1a66 with SMTP id
 a92af1059eb24-124a00993bcmr141137c88.14.1769481427418; Mon, 26 Jan 2026
 18:37:07 -0800 (PST)
MIME-Version: 1.0
References: <cover.1769407033.git.ktokunaga.mail@gmail.com>
 <2af460d17a47ec69d691dfb876f834e4685f9d6d.1769407033.git.ktokunaga.mail@gmail.com>
 <6dce5ad6-e88b-433c-8eef-98dbe72acbbd@linaro.org>
In-Reply-To: <6dce5ad6-e88b-433c-8eef-98dbe72acbbd@linaro.org>
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
Date: Tue, 27 Jan 2026 11:36:55 +0900
X-Gm-Features: AZwV_QhHJEGZmFJKMZT_p834jgO-uKjR83sRYkMiNigsB_dZdwm-HpImEqqJ3eY
Message-ID: <CAEDrbUZhz8hLQJ=Cvpj9MAy0f+bLqOk8wonHHLMaYEKEQAAFYA@mail.gmail.com>
Subject: Re: [PATCH v4 32/33] scripts: Add a script to run the wasm-compiled
 QEMU on node.js
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 WANG Xuerui <git@xen0n.name>, Aurelien Jarno <aurelien@aurel32.net>, 
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Aleksandar Rikalo <arikalo@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Stefan Weil <sw@weilnetz.de>,
 qemu-arm@nongnu.org, 
 qemu-riscv@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000eb03cc0649557f0e"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1332;
 envelope-from=ktokunaga.mail@gmail.com; helo=mail-dy1-x1332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

--000000000000eb03cc0649557f0e
Content-Type: text/plain; charset="UTF-8"

Hi Pierrick,

> I followed the instructions but could not get this running:
>
> $ /usr/share/emscripten/tools/file_packager.py qemu-system-aarch64.data
> --preload pack/ > load.js
> $ ~/node-v24.13.0-linux-x64/bin/node ./scripts/run-emscripten.mjs
> --preload ./load.js ./qemu-system-aarch64.js -- -nographic -m 512M -L pack
> file:///home/user/.work/qemu/scripts/run-emscripten.mjs:51
> if (preloadModule) preloadModule.default(Module);
>                                          ^
> TypeError: preloadModule.default is not a function
>      at file:///home/user/.work/qemu/scripts/run-emscripten.mjs:51:41
> Node.js v24.13.0

Thank you for trying the script.

That script requires the --export-es6 flag to file_packager.py. This flag
was introduced in Emscripten 4.0.13 so please update the Emscripten tools if
it is not available. If you're using emsdk, it provides the way to intall
newer tools, such as "emsdk update" and "emsdk install 4.0.23" [1].

[1] https://emscripten.org/docs/tools_reference/emsdk.html#how-to-guides

Regards,
Kohei Tokunaga

--000000000000eb03cc0649557f0e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Pierrick,<br><br>&gt; I followed the i=
nstructions but could not get this running:<br>&gt; <br>&gt; $ /usr/share/e=
mscripten/tools/file_packager.py qemu-system-aarch64.data<br>&gt; --preload=
 pack/ &gt; load.js<br>&gt; $ ~/node-v24.13.0-linux-x64/bin/node ./scripts/=
run-emscripten.mjs<br>&gt; --preload ./load.js ./qemu-system-aarch64.js -- =
-nographic -m 512M -L pack<br>&gt; file:///home/user/.work/qemu/scripts/run=
-emscripten.mjs:51<br>&gt; if (preloadModule) preloadModule.default(Module)=
;<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0^<br>&gt; TypeError: preloadModule.default is not a function<br>&=
gt; =C2=A0 =C2=A0 =C2=A0at file:///home/user/.work/qemu/scripts/run-emscrip=
ten.mjs:51:41<br>&gt; Node.js v24.13.0<br><br></div><div>Thank you for tryi=
ng the script.</div><div><br></div><div dir=3D"ltr">That script requires th=
e --export-es6 flag to file_packager.py. This flag<br>was introduced in Ems=
cripten 4.0.13 so please update the Emscripten tools if<br>it is not availa=
ble. If you&#39;re using emsdk, it provides the way to intall<br>newer tool=
s, such as &quot;emsdk update&quot; and &quot;emsdk install 4.0.23&quot; [1=
].<br><br>[1] <a href=3D"https://emscripten.org/docs/tools_reference/emsdk.=
html#how-to-guides">https://emscripten.org/docs/tools_reference/emsdk.html#=
how-to-guides</a><br><br>Regards,<br>Kohei Tokunaga<br><br></div></div>

--000000000000eb03cc0649557f0e--

