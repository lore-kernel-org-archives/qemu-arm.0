Received: by 2002:a17:505:3f8c:b0:1be9:327d:8ee3 with SMTP id bm12csp324176njb;
        Wed, 31 Jul 2024 05:33:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXnS+p/By41M6uMaqjqp8+s03z3+P+zTXm7ilMNATPvl+rKdda7yqoIWucXJH0rsokDfA8CMncvTOe9licglumCt2LyX5xW
X-Google-Smtp-Source: AGHT+IGaHaKjeC+CgTph0CE5LTXHcL1RhSb+0Qz4RogrZ1yKUy+khKB8l5oCJz3mSc8AzE5wi/+h
X-Received: by 2002:a05:6122:2215:b0:4ec:f8e4:e0bf with SMTP id 71dfb90a1353d-4f6e68b3189mr15769746e0c.2.1722429189280;
        Wed, 31 Jul 2024 05:33:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722429189; cv=none;
        d=google.com; s=arc-20160816;
        b=iKmR5Rqhm8WTEh0wkXK1HWt2e+dn3Dj46Nbpfqz8alOgqG1MWQIwKCWZP/mh4Kw47I
         IcCF4Lb2g8iwtJ9Ew1rwfnTQAYl6upDX+sDK+5rskDny5ryw2YZy8AxV3tjIbz3ljJ4O
         Hfi5w0rU4Ln+/dQHabNLD4NA/HriwK/xOeJeROeSDfKXyku4H7WSdALtcZuCWs3iKWEy
         gPZDyh/NAcQ4R/YMPzVdIzg3Ty8v7Be+6m5Rt6F5H3B5rbJ56NUfTftY/6tUuRkefFcp
         A9YriG9I21bmVjZ3GQ+YKCCxvmjwn4eTx+gz1l8CsmX4YmkoRJwjninWFL12r9vZovdI
         0YqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=wcUhUapOSPC/xpUeHp8ecRLUUNL4MA/ONK1NUCRXAdU=;
        fh=FQDto/8vw6o8fFuCSR7QTPhqvaPiLCTH99ooJ2tIJOs=;
        b=Pk0uoDc1UjyQbbe1aA/Mx66n+WUk0Dios7he8ukUEPzi4RPT3bGKhb08UHU1eoCOqa
         hBJPoqOnzwl4f0Mrk9brxVTf832z85c7tj2Ko56q0eDtdVwJbJ0G/S7lkbqIeK06JrT2
         sYjDFtkQz9uu/ZUYVhO0gFH8bk3DjP8Wnrv0p1Fgbjp08nepvYcpyCcjd30C/tkN+fB7
         nlbox4WzpNJrA+HIm0J+YSmeiR5e0cgEs4ThXBEedDXTdjVYpa7Y7k3atmJyrfiexVv3
         SNQXqFPaxhWfIX9/Q0rgFLWPWRE02kMlFZ1b9uhzCgp3YLbTKfeU+a07CZdn8ArVxrbF
         zABQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GP2WVK7N;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-4f6c88d079dsi2171607e0c.276.2024.07.31.05.33.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Jul 2024 05:33:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GP2WVK7N;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sZ8VS-0002MV-DY; Wed, 31 Jul 2024 08:32:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sZ8VQ-0002Hm-BO
 for qemu-devel@nongnu.org; Wed, 31 Jul 2024 08:32:36 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sZ8VN-00046r-AI
 for qemu-devel@nongnu.org; Wed, 31 Jul 2024 08:32:35 -0400
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2ef2c109eabso73343511fa.0
 for <qemu-devel@nongnu.org>; Wed, 31 Jul 2024 05:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722429151; x=1723033951; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wcUhUapOSPC/xpUeHp8ecRLUUNL4MA/ONK1NUCRXAdU=;
 b=GP2WVK7N1RLWhMEDxcdA5qvnY2k2m8YHz3C+0t4AQem+jB/0e3EdKmORA9Ls6NdFWU
 NnX7qskaRji3ngkuBdp3b4pN281te6Shu+7nEsJCUgsTUV7n5aYv4Vz/yN89ijOyClog
 M7SYUbNIui804UrmUndmNlwRwTu1I1eG6n54ll5uf8x9kLY6wup4AbS+d6Col54xjmdf
 nuSx/db0O9EiJ+KZZcv9+Y9jjHyX9WmOsz04Zb4gnKiDzjnKwGRoQXEcYPYnNndtJVDM
 6p9rmtA1xYv1OwD9yFat2sWjiq5DHDj3P7PTZhEFbRiCDNj4c82xXHxDU9B4HIVo6G9+
 P9XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722429151; x=1723033951;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wcUhUapOSPC/xpUeHp8ecRLUUNL4MA/ONK1NUCRXAdU=;
 b=EusjcL+MUWWz/CcPRHhKYcKCMoxyqKHCKIObsf1iqrvLw8zY7oPHcCd6vcu8QIIbWk
 Qq9Q7frMwR3OxtKZ9ZLF3kC8zGbattWrQc/sEkTj5AqLnhfsTIttC2Lo43Hf0qJjo+oy
 QYwthGTE1tPd9qxUd5nkkRBfO9OP/sKj/kz05gzheTqivy1RWG7ahaHQV8+obyLNuVlD
 PhOYzfza3MRAzin2OfE7sXI1KCX9TZPicRbJQLiUTHeXQyBl1vSvm1OU1DCSB+QP2/5d
 twFw3A1+UXEp7vz4aMzqd5YkMZPRJgFEbH1weWDTGUwBT9EHSWHygLe7BmTkgLn31Z+g
 FTqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdeGqMETXtA7cdXo9yeyhlFJGLd5RuogtFkya1f9Xg4KqVVudx+9eh+gRWey3i2lEMiKt4wJtnEY42ODGTDocyyXoai1I=
X-Gm-Message-State: AOJu0YyqspTovXConNXwLg01YgsWPckUdTdNID8Xm2KWe9/sNryM1MEV
 iF692oCwt+uJB3HaxdqHvSEhLoqRYz1W/ZQueNGV1EqZCjvVTl7YXSrHrm4ZO03pLBB8I9vivyp
 KSab6PGGWrnSsRDCEzalz0e5KWe0cxgUR2aHT/A==
X-Received: by 2002:ac2:4ec8:0:b0:52e:a60e:3a0a with SMTP id
 2adb3069b0e04-5309b269c0fmr8926440e87.2.1722429151194; Wed, 31 Jul 2024
 05:32:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240730160306.2959745-1-peter.maydell@linaro.org>
 <20240730160306.2959745-7-peter.maydell@linaro.org>
 <e0b7d735-e54a-44cc-bcb0-ef6f4518da5b@linaro.org>
In-Reply-To: <e0b7d735-e54a-44cc-bcb0-ef6f4518da5b@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 31 Jul 2024 13:32:20 +0100
Message-ID: <CAFEAcA8Pj636YHVjCO5rBz49MwaSJW1Jnsv0UVF=g6UqiH7SjA@mail.gmail.com>
Subject: Re: [PATCH 6/8] target/arm: Prepare bfdotadd() callers for FEAT_EBF
 support
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x229.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 2I+4BW85W7pt

On Wed, 31 Jul 2024 at 02:48, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 7/31/24 02:03, Peter Maydell wrote:
> > @@ -2790,7 +2790,7 @@ DO_MMLA_B(gvec_usmmla_b, do_usmmla_b)
> >    * BFloat16 Dot Product
> >    */
> >
> > -float32 bfdotadd(float32 sum, uint32_t e1, uint32_t e2)
> > +bool is_ebf(CPUARMState *env, float_status *statusp, float_status *oddstatusp)
> >   {
> >       /* FPCR is ignored for BFDOT and BFMMLA. */
> >       float_status bf_status = {
> > @@ -2800,29 +2800,50 @@ float32 bfdotadd(float32 sum, uint32_t e1, uint32_t e2)
> >           .flush_inputs_to_zero = true,
> >           .default_nan_mode = true,
> >       };
> > +
> > +    *statusp = bf_status;
> > +    return false;
> > +}
>
> Looking at the next patch, I think dropping the local variable is better.
>
>    *statusp = (float_status){
>        ...
>    };

Yes, I agree; I've updated this patch and the next accordingly.

-- PMM
