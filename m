Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp615334wrp;
        Thu, 5 Sep 2019 03:50:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwnjjOmnhtZk97INjGbosaZDdN6unZm6daCRa4HQtcIBaJYX6x6WV886NVseXbekma+HQ06
X-Received: by 2002:aa7:da01:: with SMTP id r1mr2973688eds.87.1567680622772;
        Thu, 05 Sep 2019 03:50:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567680622; cv=none;
        d=google.com; s=arc-20160816;
        b=ZoOY19sYaS9y46vMMDJWX+RP6qe3bOfxZWtDS+sIzeZwwDqjvVwK8QwTK2I0f3SqZW
         wtRqYXljTo9umAhYOtW514Rhxx5hiKJov/YVebhNK8bEFmaNvX/USRnjTomo/zZbO5w9
         jHLNI8isyLNTTTviX0gUn5Cpx8fjQoZLuaoQvcelUCV/TiB1FUw1S9N4+VL/KvaZ1FT8
         MTduXWWHzlanAzVMumR5gqEYUaD9WEqKG1kbExQxUQkcJ/hdndX/Z8R/TMriAqeJ7DpU
         ger7gZrtNm7paZ7gUwBENG+LVfVtWKgl9iV2KAxSuhOheReX86vlZ2ILOpVkSNIGvUVl
         +3sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=sU39y0TplcCnastL3n07N/wcnBjfdNXSMDUM4qcSD0M=;
        b=A5+hh16gWW4c9K9tkMhRFjKLtmUmRhW5Qb1IWoDZ8TtrfL+zCr0a3fYsKDt0wfsbGk
         6mFgDaRWR7gvmd0kpvpyw1SnzNZenrVDOn1cHoe9HVeeKs8cngsXSKiC/4ciMV6RDnDm
         KJWpkJR1bQk0utzBY0WbYJrizqvzpTB6ZI7Q7/I0OtOJxAbo5Q79JEZV0xfR1Vm9BnFt
         zRMOXj9R7NTJjZSpZDj/r6HzjpaQdK57YfhDic+QCvRyQ+CTwI1nWufwzxy72AYtQMT1
         9s/2rRs9nWQA3xz7j16egvWg9sNQxDFvNVIQUzpKc0DTDahuQonFWwrj2FUXeYg2iR5n
         x7lQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i3si944354ejr.347.2019.09.05.03.50.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Sep 2019 03:50:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5pLJ-000385-S4
	for alex.bennee@linaro.org; Thu, 05 Sep 2019 06:50:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39522)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1i5pK4-0002Et-TA
 for qemu-devel@nongnu.org; Thu, 05 Sep 2019 06:49:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1i5pK3-0004qq-UD
 for qemu-devel@nongnu.org; Thu, 05 Sep 2019 06:49:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41282)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1i5pK3-0004qF-Md
 for qemu-devel@nongnu.org; Thu, 05 Sep 2019 06:49:03 -0400
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AE645C04BD33
 for <qemu-devel@nongnu.org>; Thu,  5 Sep 2019 10:49:02 +0000 (UTC)
Received: by mail-wr1-f72.google.com with SMTP id s5so794410wrv.23
 for <qemu-devel@nongnu.org>; Thu, 05 Sep 2019 03:49:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6pM+3eZHIWqCoFeesnYPtsSMBI5mAk9ZSdVAV3cN4oo=;
 b=Snr/YsXtbr1IsqZh1dVGi+MEhc56Av43vx2iPqSapyhljHgt05jclPsmjk4gDrM9/g
 oqscFl/lkqFxPAR2gZSp1fVD7UIF7ZbC5jVc4FzDbYWPb4WWOTAMGS3Im9bmDtTZiEub
 DvegUZNBE+WARCHFtJz6WVmiqyfmT2vucQpc9vY1sgKFjdr9hKXzb6InWcIh5WvAv0Xv
 kkgomtIOtmH6qhlSyr16yf52pbh7btGswBmwL43GIAVoNuMbVFpQUyJ1VgdpSc6l7ugM
 Ez920h6bODT35wSddf65/t+9zwzGvlGDxuyVHvZ7trLWbCS6xNazdrnag818nCUvgTg5
 j9lQ==
X-Gm-Message-State: APjAAAUMQg2QWRhMApq/1j/erynrjJmpi9PYt+bVNiSjmwbcco3hHUzF
 Dd3c5Td78BfzQpVZVOQvFnqOTwT7cHcSgjLWWOBgCrrGY5Jo3gnQDyHQUNokt0l6UppNOb00JNc
 ZXIYiN+lAawNNmmI=
X-Received: by 2002:a5d:4247:: with SMTP id s7mr2068491wrr.110.1567680541504; 
 Thu, 05 Sep 2019 03:49:01 -0700 (PDT)
X-Received: by 2002:a5d:4247:: with SMTP id s7mr2068479wrr.110.1567680541349; 
 Thu, 05 Sep 2019 03:49:01 -0700 (PDT)
Received: from [192.168.1.48] (251.red-88-10-102.dynamicip.rima-tde.net.
 [88.10.102.251])
 by smtp.gmail.com with ESMTPSA id o129sm3047459wmb.41.2019.09.05.03.49.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Sep 2019 03:49:00 -0700 (PDT)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20190904193059.26202-1-richard.henderson@linaro.org>
 <20190904193059.26202-60-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <a315b399-292d-420c-3b78-df1d3c13bc8a@redhat.com>
Date: Thu, 5 Sep 2019 12:49:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190904193059.26202-60-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v4 59/69] target/arm: Convert T16, nop hints
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ffK0P5m27mIZ

On 9/4/19 9:30 PM, Richard Henderson wrote:
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c |  3 +--
>  target/arm/t16.decode  | 17 +++++++++++++++++
>  2 files changed, 18 insertions(+), 2 deletions(-)
>=20
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index b70491d39e..69092c12c3 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -10891,8 +10891,7 @@ static void disas_thumb_insn(DisasContext *s, u=
int32_t insn)
> =20
>          case 15: /* IT, nop-hint.  */
>              if ((insn & 0xf) =3D=3D 0) {
> -                gen_nop_hint(s, (insn >> 4) & 0xf);
> -                break;
> +                goto illegal_op; /* nop hint, in decodetree */
>              }
>              /*
>               * IT (If-Then)
> diff --git a/target/arm/t16.decode b/target/arm/t16.decode
> index 19a442b894..5829b9a58c 100644
> --- a/target/arm/t16.decode
> +++ b/target/arm/t16.decode
> @@ -19,6 +19,7 @@
>  # This file is processed by scripts/decodetree.py
>  #
> =20
> +&empty           !extern
>  &s_rrr_shi       !extern s rd rn rm shim shty
>  &s_rrr_shr       !extern s rn rd rm rs shty
>  &s_rri_rot       !extern s rn rd imm rot
> @@ -204,3 +205,19 @@ SETEND          1011 0110 010 1 E:1 000         &s=
etend
>  REV             1011 1010 00 ... ...            @rdm
>  REV16           1011 1010 01 ... ...            @rdm
>  REVSH           1011 1010 11 ... ...            @rdm
> +
> +# Hints
> +
> +{
> +  YIELD         1011 1111 0001 0000
> +  WFE           1011 1111 0010 0000
> +  WFI           1011 1111 0011 0000
> +
> +  # TODO: Implement SEV, SEVL; may help SMP performance.
> +  # SEV         1011 1111 0100 0000
> +  # SEVL        1011 1111 0101 0000
> +
> +  # The canonical nop has the second nibble as 0000, but the whole of =
the
> +  # rest of the space is a reserved hint, behaves as nop.
> +  NOP           1011 1111 ---- 0000
> +}
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
