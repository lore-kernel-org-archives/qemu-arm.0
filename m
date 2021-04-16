Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp423220lfr;
        Fri, 16 Apr 2021 07:11:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOnKIYbAmg0wHAiYPNWRiALiLqIU0S3LuUV4mQPwxz3Gl8ewu23NbdxBRHXe5Te7sCXtrF
X-Received: by 2002:adf:ef84:: with SMTP id d4mr9385734wro.74.1618582278220;
        Fri, 16 Apr 2021 07:11:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618582278; cv=none;
        d=google.com; s=arc-20160816;
        b=rvdz4aYgTge35zpNBOqHrreAv8zoTT1LHuy4OAZ84ETKOLjsCN4+6RUpmhsEfOU2fb
         u6wFkMoruLAT7l3Ig6JSPOwoenJVw4jZ/BaOYwQC7dqocM7Ov82M8QEggFrchEGxguK0
         AX8MusU0HW8ai/Yw7u8qcsc5xe11dzLzlJsOxe30vpFwsbQZabjsk0w3Be01lhlHnbRO
         IqcpoM9J6YUFZ5torS6HNoICuO5rrU+1zR0HL0wwI0ofx0uwgkXqrYrN0EROqWqDVLPe
         5V9piiqvx2ejnVZ9IWMvvvQ2bWgWwXDIRiN3gtww1MOT4QpOprQQT17YUShYQn6JITj9
         GHdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IPZpvGks/i5oe8yrSf39bSTkCfi5w1ciO0y9KaI0XgY=;
        b=cAG4i7DhwcKNHCCYiDdA2bgobRAj0RyJGJcqEWeK2WV5ykTNWX7nUGBmX4kHtFCPl1
         fIWHQwH+CpfOySuWJ9rxF/5ud6jCbtVOu/lzk1NwqeROTDPWDb7je+NCawky7qr4RDkE
         TlCbrTIjRhmyZbHFojVniqRV/Ywbm1/iKsuABuOG5I7b9ARL//apzssIa5LL7rv2cgyh
         g8/wG5b3L8AYXzZSIIskN6GZgWt2b8qesoAannR5z8KP100n0oZYuXA5RkI+9KCF4IbZ
         +EyLf4HD8C6HXwgPQHARw3WuLTaGo3Uj0Tm+j6/jIM73k72eZdkFV1BPemNSYgjmjho4
         UN4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Mqv5Nb+j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m1si7596339wrn.81.2021.04.16.07.11.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 07:11:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Mqv5Nb+j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXPBl-0008E6-4q
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 10:11:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lXPBc-0008Dz-RS
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 10:11:08 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:42886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lXPBZ-0005en-PK
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 10:11:08 -0400
Received: by mail-ed1-x52c.google.com with SMTP id d21so12342228edv.9
 for <qemu-arm@nongnu.org>; Fri, 16 Apr 2021 07:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IPZpvGks/i5oe8yrSf39bSTkCfi5w1ciO0y9KaI0XgY=;
 b=Mqv5Nb+jql35jT4dsOicYtQkucptk9EjTWclgkt+ZvQO2+aUpGvU2jwxYQUu/V/BP+
 8oGBlGSY4GGA4Au9eMQdtGvkBfLb01ZwRmLOlcfzrk4P34blz3isXSp+L3YKiAq3Dx+E
 57TvvE3s7/xtn1wNi36vczOrs12nkcTaC6NBiOrZvESwEXxVQtOEY/+l82odBF0obd8D
 Nh1uUer8JTR5VymcPApQiBpkHc+HW7V6b4piHpivcUjoMvPrKSPDNN78VceKVCGmzl9s
 H3OMOP3085Z+HJHm9ElbKE99l9NbHtxo8JDUVgDs5j7h2MZMVYF02kRPI9b6vsu/cRr6
 Po7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IPZpvGks/i5oe8yrSf39bSTkCfi5w1ciO0y9KaI0XgY=;
 b=Y0z1WDfrIRuyfC2/moQ0XEAuheL/HEV4cqC3nYzLqC52Zv35bxV04i6IeII9ySrXQy
 6g14/A+QsqVPGr87ZlhSkEbZZDLbgGlPAEJGo9RDNx0Xh11azlrFs3KC+J2FPbz5AMKu
 m9LvYguoqzGg7eIG7o35wNT3cnFpGGTVytUoSeB8OVROaw7XaaFKuzsfmsZEndBK5fSs
 +lt1Iurlcp5MItCINY5BIslGiAK9Hh5RKBwU4d2uS8awGkVPETfBXDrARrppvC6suRCe
 8+ZgabhqCEQPFkcrnVwkFWI/6U1Wzpo9XV1xAazWh5Jj5b6QAWLbKaOQtI4THgVKRr6n
 YmOQ==
X-Gm-Message-State: AOAM533hKwbrMJd2Cz/Gr3k6CVQmn6eaLZzedxhKzL7o2Gk8DJZqof12
 MrGMTCKW41ygHD9BuvSG0P+Fd32IugIRP0YDNY8fnA==
X-Received: by 2002:aa7:cb0a:: with SMTP id s10mr10155918edt.36.1618582263941; 
 Fri, 16 Apr 2021 07:11:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210415130305.28640-1-iii@linux.ibm.com>
 <20210415130305.28640-3-iii@linux.ibm.com>
In-Reply-To: <20210415130305.28640-3-iii@linux.ibm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Apr 2021 15:10:15 +0100
Message-ID: <CAFEAcA-8yh2GNEdP5yuY=_rKG_g4TLHauU=nYfGR_O-fT-2oMw@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] target/arm: Make sure that commpage's tb->size != 0
To: Ilya Leoshkevich <iii@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z9FYCj8yp/ZR

On Thu, 15 Apr 2021 at 14:03, Ilya Leoshkevich <iii@linux.ibm.com> wrote:
>
> tb_gen_code() assumes that tb->size must never be zero, otherwise it
> may produce spurious exceptions. For ARM this may happen when creating
> a translation block for the commpage.
>
> Fix by pretending that commpage translation blocks have at least one
> instruction.
>
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>  target/arm/translate.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 62b1c2081b..885f69b044 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -9060,6 +9060,7 @@ static void arm_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
>      unsigned int insn;
>
>      if (arm_pre_translate_insn(dc)) {
> +        dc->base.pc_next += 4;
>          return;
>      }

Why does the call to arm_pre_translate_insn() in arm_tr_translate_insn() need
this change but not the one in thumb_tr_translate_insn() ?

thanks
-- PMM
