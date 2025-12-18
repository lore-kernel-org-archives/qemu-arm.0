Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8919BD6ACFB
	for <qemu-arm@archiver.kernel.org>; Thu, 18 Dec 2025 13:01:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vWDdH-0001vJ-Vs; Thu, 18 Dec 2025 08:01:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1vWDd6-0001ll-Ni
 for qemu-arm@nongnu.org; Thu, 18 Dec 2025 08:01:21 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1vWDd4-0003yE-Qr
 for qemu-arm@nongnu.org; Thu, 18 Dec 2025 08:01:16 -0500
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b7ffa421f1bso294827466b.0
 for <qemu-arm@nongnu.org>; Thu, 18 Dec 2025 05:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766062872; x=1766667672; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pEvpthFoyv+5F7zG/vBi3EAs053ahrWPEry9nVqA8tY=;
 b=AXsl4IxNdkNzjjXLH6JPFD+grc8dTs/v2dqiphNnnDQls2Jl/oK5Y70/7R7Gr24DX9
 rtAxThoJM3UH5kybfzU8t19Z7JU5neVVe9P655EunQ+LqjArjumjxacF/Ia3cj60PiNz
 QUGQpfS88dJYS+oOJkkzjJsBN/yp/0ReXgHOJfCvHLcQEoUVsMkbhBscU7ifIpRIfLLU
 1nT1fCC7rSTvqfVjs3e8wiBZ3Ps5dVA5cr9zG2qkk31SYgFuUhXx9ZvJlEgC6XWso9fm
 0DsKaeyS7FLM7GrcZqiiw5EigrY3WNWuJCJ6in4pcKJBJzMJTVtbwY5voDPRi1+Ywv2w
 +9pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766062872; x=1766667672;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pEvpthFoyv+5F7zG/vBi3EAs053ahrWPEry9nVqA8tY=;
 b=vImLIKv9K8LZd6PgFYf3Sk4NL4+/saq5EkUDO1FKgGewa11DwLLma2s7Pni6DvXDuJ
 YYkM47FiznmbIMBXWj0HiKvafRuv654WNgiy2karMbsuoTVrRLz5uedlJfpRZdZwvs1/
 vIUer3exvdSfA6HpiVxURi7IjJH+X+c6SIFOp8heJOfEYPB7XGwg4aKlUdkUpHyPeG14
 mV81wWb4zbvmyRb+5Gajg7tnI3xKqIdeB//66la+DXqjIoRFUrwq6NhMVRVYUKIqSwex
 LcZBKOo2pkbxzcA1ODmJEGsMJbpzIe9SB3Q+FF5UF7HA4HykUBh5/QAtaSyBrDgDLNDl
 eHQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDL6xjIFCbNn1hT1eNzEZb/LvoKOtTORx9Ofc4hJnA6XDYXGuP+N7FBuuN0q0E3vw1oI+ZPBxvUQ==@nongnu.org
X-Gm-Message-State: AOJu0YxvgBO+TO96RKdFD3ChycNAyqsqGGwx7cLrRjXkaFsh1wszavmP
 JpON9Ot8h1+3lmExKvwipePxmE5MJkXZVgdQ/0juhomeMOt9UYhZ4ZuA1WqNBVNj+5Cou7PjMgX
 dehpUSgTcDrTBcr80umK+UL4jTNXuCQfp9aIxhhVRuw==
X-Gm-Gg: AY/fxX7mXO2UgsKOa1I+7+aCilzephteM1Qy0C4flDaYkcw0w5fjwTLs8hA0yMrbYyp
 G2dfaSDUJrhpaLcxBaWvQQZX1ISWzYN01YFkR9s7w5UY/F4rOvMRjmVxw6QoUxil+undIWTgoQg
 ms3shwCmyxvAdHLixjn9o+J3kXmd9hlE0x+38rmfvDe8y6PeeizYQ3Pb8vL+ISdhpIjpo2Vfz1V
 w6XHw1V9T6gIB29OBIZ5kwibP348jcE1kFmgw+y0VTHUO1FWCIB8k9Bbi99bIjp6Tlh9A==
X-Google-Smtp-Source: AGHT+IGZf7fAqfJxgoUSHCECkbDJEqQkLT3MO4wbCXC5Vlp19S8/KTPwFhob/GGepuC6AyWZzkQMofloK88VBakkcrQ=
X-Received: by 2002:a17:907:eb07:b0:b80:3205:5af3 with SMTP id
 a640c23a62f3a-b803205815emr21736066b.15.1766062872233; Thu, 18 Dec 2025
 05:01:12 -0800 (PST)
MIME-Version: 1.0
References: <20251217212018.93320-1-gustavo.romero@linaro.org>
 <20251217212018.93320-3-gustavo.romero@linaro.org>
 <cb5eca6e-23c1-4134-9145-7030bc10b649@linaro.org>
In-Reply-To: <cb5eca6e-23c1-4134-9145-7030bc10b649@linaro.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Thu, 18 Dec 2025 15:00:45 +0200
X-Gm-Features: AQt7F2oYqgTAe1WR-yg7vx2IV62WCaQ42gxk17R2FX6X7RKXfkit2JkmAzvTTto
Message-ID: <CAAjaMXbsH_EimcS7SDMYaicrWKt2OYCUUapy4Uab1kfVO-x7jg@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] target/arm: Add a _MAX sentinel to ARMASIdx enum
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, 
 richard.henderson@linaro.org, alex.bennee@linaro.org, 
 peter.maydell@linaro.org, Eric Blake <eblake@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
 Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ej1-x630.google.com
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

On Thu, Dec 18, 2025 at 9:21=E2=80=AFAM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> Hi Gustavo,
>
> On 17/12/25 22:20, Gustavo Romero wrote:
> > Add a sentinel to the ARMASIdx enum so it can be used when the total
> > number of address spaces is required.
> >
> > Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> > ---
> >   target/arm/cpu.h | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> > index 39f2b2e54d..00f5af0fcd 100644
> > --- a/target/arm/cpu.h
> > +++ b/target/arm/cpu.h
> > @@ -2336,6 +2336,7 @@ typedef enum ARMASIdx {
> >       ARMASIdx_S =3D 1,
> >       ARMASIdx_TagNS =3D 2,
> >       ARMASIdx_TagS =3D 3,
> > +    ARMASIdx_MAX
>

My two cents:

Here, "ARMASIdx_MAX" should be equal to the last variant, 3. So to get
the total count, it would be ARMASIdx_MAX + 1.
And it should be called "ARMASIdx_COUNT". Max is the last variant.

> The problem with including this in the enum is this confuses static
> analyzers:
>
> warning: enumeration value 'ARMASIdx_MAX' not handled in switch [-Wswitch=
]
>

If we add a "MAX" instead of "COUNT" variant, then the value of the
MAX variant would be handled in switch cases.  The following
definition does not emit a warning with -Wswitch:

typedef enum ARMASIdx {
  ARMASIdx_NS =3D 0,
  ARMASIdx_S =3D 1,
  ARMASIdx_TagNS =3D 2,
  ARMASIdx_TagS =3D 3,
  ARMASIdx_MAX =3D ARMASIdx_TagS,
#define ARMASIdx_COUNT (ARMASIdx_MAX + 1)
} ARMASIdx;

int main() {
  ARMASIdx t =3D ARMASIdx_S;
  switch (t) {
  case ARMASIdx_NS:
    break;
  case ARMASIdx_S:
    break;
  case ARMASIdx_TagNS:
    break;
  case ARMASIdx_TagS:
    break;
  }
  printf("Last =3D %d Count =3D %d\n", ARMASIdx_MAX, ARMASIdx_COUNT);
}

Outputs:

"Last =3D 3 Count =3D 4"









> To avoid that we /define/ it manually instead:
>
> #define ARMASIdx_MAX 4
>
> >   } ARMASIdx;
>
> Usually the definition is within the enum declaration, and we name
> it ${enum}_COUNT:
>
>      typedef enum ARMASIdx {
>          ARMASIdx_NS =3D 0,
>          ARMASIdx_S =3D 1,
>          ARMASIdx_TagNS =3D 2,
>          ARMASIdx_TagS =3D 3,
>      #define ARMASIdx_COUNT 4
>      } ARMASIdx;
>
> Unfortunately this didn't work well with QAPI, so we could never enable
> -Wswitch globally:
> https://lore.kernel.org/qemu-devel/20230315112811.22355-1-philmd@linaro.o=
rg/
>
> Today I'm not sure what is the best style anymore, so just take
> my comments are historical 2 cents.
>
> Regards,
>
> Phil.
>

