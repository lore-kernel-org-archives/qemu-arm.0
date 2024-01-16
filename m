Received: by 2002:a17:906:18b1:b0:a2e:1324:ea5c with SMTP id c17csp952453ejf;
        Tue, 16 Jan 2024 07:35:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFoKt3+yk05+MbWec0szx4Qd27bWlC6H6HgJaYqyEc0YmRBGVcUM8+5IJlo/ekERsDZa2gz
X-Received: by 2002:a05:620a:560f:b0:783:47c6:6ae5 with SMTP id vu15-20020a05620a560f00b0078347c66ae5mr8110790qkn.149.1705419353139;
        Tue, 16 Jan 2024 07:35:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705419353; cv=none;
        d=google.com; s=arc-20160816;
        b=j03EcuPsyMA67jegqGXMXrlVS8WznEfKTp3z20e9Lz8ku+et4zjn5VcX49A+f/ZcBN
         UzeEZ0WGqyzCIpkpY6gADkbWXbYXQwPq3HfF74OcJGcQLtI0u3tr1FPzGxM2HF9E6jOe
         kPH3DjDu/ZFqIaRMwbkNsD7OdsX4+tYU5TyNULtX84cH6SRTLDGxtYX/fKvHPoeCm2wD
         VmvP+dnbjC7j8joCS7tA5N/j5l59PRxeCUC/H7cSPVbMeBdDStUp8q4pVOmq0DGBVM/8
         XvEB0ZWosqN9+wVS/BNKTTOuj5an5Hzst3NmbB2q6EP1LdE2s/x0N2L50sdt9UfaeLBn
         Cdjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=5/HxhFNv2D0FhjaUowOiVQsUgxb47pxbOi1FkGS7kjk=;
        fh=G4ej1JnN8P6fgAZk0wPFnEOwbCZSOB2m6YxI6BipXl8=;
        b=iJ3dYwEjLKhpbUN5j4E811hEkXFca47YcYPkdRRMOP37u4U4P/kRmvcIwipzA/g5vV
         IBzBUvGT5dw7sjsEAGmnYD6Zb0pBsmhtxEbLcKqU4asKrvNzkhvXyyQVu4J75aOWiCMC
         U+LaRQlMiRo2NqGX/2yr2dj0+FQZBDljaRbmxnThI8mgzGagoD8+kaxy+uY8j4PYuM4C
         kJCCqVIRGPPirKnteMQr+p/0MvZUgg8Q9VLvLrnmC6ryle9AK3pxtIXpueEXHwfnrGgV
         R8ut7Bcve6NABmAj2iQRQnWE4jGrzUMcbSm2tC9NlNuAiU70mKwD7/Ad0IB75Qo+Qtfi
         Dj8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dG948k5z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b20-20020a05620a119400b00781e3ce60b6si9779080qkk.103.2024.01.16.07.35.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jan 2024 07:35:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dG948k5z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rPlTe-0002s6-Sa; Tue, 16 Jan 2024 10:35:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rPlTc-0002rV-OA
 for qemu-arm@nongnu.org; Tue, 16 Jan 2024 10:35:45 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rPlTa-0001fI-2S
 for qemu-arm@nongnu.org; Tue, 16 Jan 2024 10:35:44 -0500
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-557c188f313so15721133a12.1
 for <qemu-arm@nongnu.org>; Tue, 16 Jan 2024 07:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705419340; x=1706024140; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5/HxhFNv2D0FhjaUowOiVQsUgxb47pxbOi1FkGS7kjk=;
 b=dG948k5z2kWIV/jF9+UO9kSGiEBSwooDc9Rtw44CSV7fRlGNfEjoHYHMjPq50TY3FE
 gDIwbYgrppqxfACGrl4rsGTOw2pAUEc4F1eJaASwxxJfPCZIJRLKuMUt0H8UlyhpzcKC
 gJRmblQxVUTRGBKxIcVar97Cgk1IGTv/6sabqHRIKbr01r+dMqI7u/ByMchGqWczNnfP
 7TW4FDX1FQBvL9EIbS7uc3mCNIZ+8rl6AniZFyqSMJnghDF3k6FkugxzRYuEa8VRnVMY
 ccvvytrodXYR/1m7Hwf+t8ACLWEQoYfAGxX9PBp5tPXUI81U6+pbBRmfXDSz4vNdVgcg
 cKWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705419340; x=1706024140;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5/HxhFNv2D0FhjaUowOiVQsUgxb47pxbOi1FkGS7kjk=;
 b=f1SqpmvjDr8BLs9ijoAC/8hpx5ArqAGZsTR9cJJc2vTAPDB1y16Np52r9uhdVNOXlQ
 d8pevT5uOUJ8+L9CwwqDRhuPQf9t7GJGcEyYOwciyDbA/x5Wveiagn6X6AgBp/kpn9a1
 k5h5q4QIVy7KoXsl/GinMQvhrZNPeyNJ2MIMnpZSHvgYMcqnzkPHsf260tNOMZybBiLc
 f6rZgjoIDx3lzJixQg3URxQes4dWiLrf3EHmu5ivaUWYERBzjouNoHqNIFIX9rM2lSAd
 rwDt6KbjewdN1DmoevMUqXKMEMsLVixoO3j28FUoE01krTroPq7c6ElMMwY5g4UOLNBb
 zb2g==
X-Gm-Message-State: AOJu0YxuNedDdipYmNkIbh67PR9gowU7w3Bm7xJcIS5G88Ghhi8MbTkD
 ge3mwWCxJAI8WU6KJs4u12qfsZv8exNiDnvKRj0cmqRN6YOyxg==
X-Received: by 2002:a05:6402:1747:b0:558:308f:db04 with SMTP id
 v7-20020a056402174700b00558308fdb04mr6919837edx.18.1705419340383; Tue, 16 Jan
 2024 07:35:40 -0800 (PST)
MIME-Version: 1.0
References: <20231218113305.2511480-1-peter.maydell@linaro.org>
 <20231218113305.2511480-28-peter.maydell@linaro.org>
 <20240116130940.00002523@Huawei.com>
 <CAFEAcA-94-TeFw4AmTsuQaJROADaet8aWDEBXbt9H_gc1Fs6pg@mail.gmail.com>
 <20240116145051.000004f7@Huawei.com>
 <CAFEAcA8=CK00w_Yk-X=+6cm2X5BWSiTw7_y6uQN8qyFHF4-iFg@mail.gmail.com>
 <20240116152919.00001571@Huawei.com>
In-Reply-To: <20240116152919.00001571@Huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jan 2024 15:35:29 +0000
Message-ID: <CAFEAcA-txzOZ_Z0x3n+idTLp-3QevV_Jpur74kdCOhFmBy1Atw@mail.gmail.com>
Subject: Re: [PATCH 27/35] target/arm: Report VNCR_EL2 based faults correctly
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
X-TUID: INgffK8sml0N

On Tue, 16 Jan 2024 at 15:29, Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> On Tue, 16 Jan 2024 14:59:15 +0000
> Peter Maydell <peter.maydell@linaro.org> wrote:
>
> > On Tue, 16 Jan 2024 at 14:50, Jonathan Cameron
> > <Jonathan.Cameron@huawei.com> wrote:
> > >
> > > On Tue, 16 Jan 2024 13:20:33 +0000
> > > Peter Maydell <peter.maydell@linaro.org> wrote:
> > > > Bisecting to this patch is a bit weird because at this point
> > > > in the series emulation of FEAT_NV2 should be disabled and
> > > > the code being added should never be used. You could put
> > > > an assert(0) into the code in translate-a64.c before the
> > > > call to syn_data_abort_vncr() and in arm_deliver_fault()
> > > > assert(!is_vncr) to confirm that we're not somehow getting
> > > > into this code for some non-FEAT_NV2 situation, I guess.
> > >
> > > Not that, but surprisingly is_vncr == true.
> > > in arm_deliver_fault()
> > >
> > > Frigging that to be false gets me up and running. I'll see
> > > if I can figure out why it is set.
> >
> > I don't know if this is the cause, but looking again at the
> > line that sets is_vncr I see at least one obvious bug:
> >
> >     bool is_vncr = (mmu_idx != MMU_INST_FETCH) &&
> >         (env->exception.syndrome & ARM_EL_VNCR);
> >
> > is testing the wrong variable -- the first part
> > of the condition should be "access_type != MMU_INST_FETCH".
> >
> > If you fix that does the failure go away ?
> Ah - indeed that fixes it.
>
> I guess that makes sense. Presumably the bit is used for
> something else for instruction fetches.
>
> Thanks for your quick help!

Thanks for testing -- I'll send out a proper patch in
a bit.

-- PMM
