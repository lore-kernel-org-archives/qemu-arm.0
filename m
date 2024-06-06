Received: by 2002:a17:906:acd:b0:a66:557b:2f6e with SMTP id z13csp255711ejf;
        Thu, 6 Jun 2024 05:06:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUuLgvj5i8LuCqGWb23g2onWuYGP/0/HzigQm7vtIW55tJ1XjtDqIWE6y6W2Zpb9UxRmBNBaenft5WQNGCURvgD+qY4A4yC
X-Google-Smtp-Source: AGHT+IFbkTAG9/ImPXixtC1bmJEY9yL6uA7KfU+8hJ/Ga9DE4gWzaZHxeuVZ5DCMikd82eNmfnjq
X-Received: by 2002:a05:6214:2b9e:b0:6af:6799:912c with SMTP id 6a1803df08f44-6b030a7d2cdmr47293346d6.54.1717675612264;
        Thu, 06 Jun 2024 05:06:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717675612; cv=none;
        d=google.com; s=arc-20160816;
        b=gqZ23jTURCLZ3rruqnhliESLDd13HV6hdMan53McfKgD0cvjQktiEGWwx46Ntif6Ay
         1knUF1GKMH8JJaG+XJ6D7IW/jVxMbf2fHfX0LVc8JpXzXXnEVeNDk63X3VbY0/Vlgl8j
         BcpiM0/hR+sJSU2+JDALBfLhsY5gO7Ckw4efGMcdilkLAc5ykjENbRpsnK081rIa742b
         Zdw+Rm6etSU1kVmz2GpRAsGYHP1d6+Hx4Q4UPJra1eWq68ISyyzQannGyym7tTtJFW/j
         VFy2yyMST62REw108Y3UK2A1rNMuAshupnXnm1VHd0BofzVP9M4K864XaQNVUrO91wWK
         Veyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=TxXgPziTQpLFtp9Vru6V5/hkWgIzMI58uy6QN1sgnEk=;
        fh=497QeNxH+EnmaO2kmJQ1QuinOC2JF5N2kXbks4+78Tg=;
        b=0KGnezN3TkxQwIdgNdxKWo45nDGYVJ5atVrukX6/dHcjrmhO+FHkUxr5r9b4S2k86L
         +Y6MEg9i+x9gjAml70U9MHZQ1piavDW+FTkwj1q2MN24lbHfF276NadxBuPC50HbEV+7
         hIBg8c7/W4V7TIzKIzFeks9zpWzPECLoE6ih7FcuvDdMtlC+f7j5/UCEhsdr+4i753h8
         IqD0ZCm2UQfuh+ZwYtzc2QtCnU/sfNtr09GhPs1JAfof0Mwr3dA2vn7Q2dctny2DRi1L
         o08aqAdzaU5fp0TGhh7UEW3g5w4G2FgiwsVrwfkHTuZiiwPbpqAeNHHveuzEZle5Fadr
         +wqg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jBJnoPfF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44038b83899si14198561cf.756.2024.06.06.05.06.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Jun 2024 05:06:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jBJnoPfF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sFBsf-00050c-7b; Thu, 06 Jun 2024 08:06:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sFBsc-00050L-SL
 for qemu-arm@nongnu.org; Thu, 06 Jun 2024 08:06:07 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sFBsa-0004Bf-VD
 for qemu-arm@nongnu.org; Thu, 06 Jun 2024 08:06:06 -0400
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a6267778b3aso83388966b.3
 for <qemu-arm@nongnu.org>; Thu, 06 Jun 2024 05:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717675563; x=1718280363; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TxXgPziTQpLFtp9Vru6V5/hkWgIzMI58uy6QN1sgnEk=;
 b=jBJnoPfFjIw279H3+5FXqGxOI90Su5Pqgd3iwk/GoJXQrhIkmwcMIi0evSd3OUIMCp
 MeC/01Ykw00ovpkjt5k3XiKn4BF5WaST/EVAhxZdeFYPtov7Pnvmb48yvKRO3Buvk5yM
 svITG2sNHFS+X8O233GHrqD3Y63QCGkc6C6542s+HIOT0m/1pxAzxcV0r2ponNgESnfa
 sCgvldBJpYY+xHxQ7fHzVwwfpANCTtV/JGfyOO+gqfVgXO4Lyq2rvPKpvRdEc5hBFA1E
 HOoxBnqC4OWnwhOfXJZVqHgTKh66PqkMO2tsMCvGycqsDoz79mw/bba10QDJIrf0tVFD
 dFSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717675563; x=1718280363;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TxXgPziTQpLFtp9Vru6V5/hkWgIzMI58uy6QN1sgnEk=;
 b=gsaOHJcXOZZbcl9W41aY1RhAxlfuxxWWqPOsejLKLuNUfTaBkqWYd5gjqaYJGAC/RW
 YCFblcjnhDv7PuduKQP4STfWyw6zv0gg3FLCByTiFeye3mRAzJ7AuuaF+AVruIjMjQcV
 MMRQayaFSGjM/4b+MRpaRHdTQFjHNujO37J+CRp6q4QrQWPZjdbZMTlyq8IApFg8n2cl
 oXbHRLQ2/l7QsNdjh4B/1desp2pW0x1HSq6hW7bW1EDYZkeFxygnArgQi8Jg8V/7Vlp/
 AvrIIvdmXezmt/Iiq4YjV5ODI/BIg94JyxbIgX9eDRlxdvKvoKztaM0EE4F2IT7IJRU9
 6VdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUD3ZMpuDnnHwh6X9uNPpNbM0DvA4BEy/M8BIVvSc+1CTw+JS1YQ+1/s15GOQJW7HEYqXmApKiI6YuwP17Tn9EhR0cH
X-Gm-Message-State: AOJu0Yz+4ZqTvw4gjaAVFt/bcEKTSFY+6y/0U2nsYJbV/1AghXkUXdib
 ZLrO/ZC5iZksovhFcuUMuxhb9HJ2WHUu2TB/nUqQQuKUzkjLy4s2+heGWO60E2ChwfNSC6KUDIS
 08B6poRRSrW6vxCF6MYIJsOp/Jh9NljdVJaxYwA==
X-Received: by 2002:a17:906:f213:b0:a69:180e:9dde with SMTP id
 a640c23a62f3a-a699fa98534mr359430466b.26.1717675563100; Thu, 06 Jun 2024
 05:06:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240606095952.2133-1-andrew.yuan@jaguarmicro.com>
 <CAJy5ezqq51bJG4O9HA-Pv4sw9rYqGdFW-EezCRPfDbTx=9SwyQ@mail.gmail.com>
In-Reply-To: <CAJy5ezqq51bJG4O9HA-Pv4sw9rYqGdFW-EezCRPfDbTx=9SwyQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Jun 2024 13:05:51 +0100
Message-ID: <CAFEAcA8fSS-qt6KmN_06uEMXddjbqjATh-FkUJVSrPuiu50+PQ@mail.gmail.com>
Subject: Re: [PATCH] hw/net: cadence_gem: fix: type2_compare_x_word_0 error
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: "Andrew.Yuan" <andrew.yuan@jaguarmicro.com>, luc.michel@amd.com,
 alistair@alistair23.me, 
 jasowang@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: L9kz11mAsrfu

On Thu, 6 Jun 2024 at 12:04, Edgar E. Iglesias <edgar.iglesias@gmail.com> w=
rote:
>
> On Thu, Jun 6, 2024 at 12:00=E2=80=AFPM Andrew.Yuan <andrew.yuan@jaguarmi=
cro.com> wrote:
>>
>>         In the Cadence IP for Gigabit Ethernet MAC Part Number: IP7014 I=
P Rev: R1p12 - Doc Rev: 1.3 User Guide, the specification for the type2_com=
pare_x_word_0 register is as follows:
>>         The byte stored in bits [23:16] is compared against the byte in =
the received frame from the selected offset+0, and the byte stored in bits =
[31:24] is compared against the byte in
>>         the received frame from the selected offset+1.
>>
>>         However, there is an implementation error in the cadence_gem mod=
el in qemu=EF=BC=9A
>>         the byte stored in bits [31:24] is compared against the byte in =
the received frame from the selected offset+0
>>
>>         Now, the error code is as follows:
>>         rx_cmp =3D rxbuf_ptr[offset] << 8 | rxbuf_ptr[offset];
>>
>>         and needs to be corrected to=EF=BC=9A
>>         rx_cmp =3D rxbuf_ptr[offset + 1] << 8 | rxbuf_ptr[offset];
>>
>> Signed-off-by: Andrew.Yuan <andrew.yuan@jaguarmicro.com>
>
>
>
> LGTM:
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
>
> At some point it would be nice to add the missing logic for the DISABLE_M=
ASK bit that
> extends the compare range from 16 to 32-bits.

I had a look at this device's code, and I'm trying to
figure out how we know at this point that there really are
two bytes pointed to by rxbuf_ptr.
 * The get_queue_from_screen() function takes a rxbufsize
   argument, but it never uses it...
 * the callsite in gem_receive() will (in the "strip FCS" case)
   pass its buf argument as rxbuf_ptr, but it will use a
   rxbufsize argument which has been raised to at least
   GEM_DMACFG_RBUFSZ_MUL, even if the input size argument
   is smaller, so even if get_queue_from_screen() honoured
   its rxbufsize argument it wouldn't help

Would somebody who understands the device like to have a look ?

This is a separate issue from the incorrect array offset
argument this patch fixes, though.

thanks
-- PMM
