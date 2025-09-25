Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD9CCCAC5A5
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Sep 2025 13:24:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1lxH-0007K0-SJ; Thu, 25 Sep 2025 09:24:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v1lxH-0007Jn-0F
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 09:24:15 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v1lx9-0003AG-Dl
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 09:24:13 -0400
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b30f8d14b9cso152961666b.3
 for <qemu-arm@nongnu.org>; Thu, 25 Sep 2025 06:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758806642; x=1759411442; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vgiPj1g3LbRwQGf0tFC1ezm4NNNMo9eY7QGMXPTOWZA=;
 b=DfvPAo8wKvEZkZgRbeO6B5/YfoZxDk1yHOqxxwKO3mVlL72vjRvFj3DIkIEnalTlfk
 vDbWzcJfQA7gh15sU+VXlifpYMbAohDjqwoznGXi7Syi5mYOL7oZXCpYkyM6ji3kCmMs
 GqMuqzmNOhr6jR7eAGE2JjUqqzpa1QBtyLfaq8HuDpkgPbrYCujDHY+27oooKJAvLvSd
 NS6Vgtkz6qWowkuVRK4pDLMpjlZZSz2UDqjZZPJ5gxDZf0i++ay2w+5VSLGSeuOoHaj4
 kvp4ErVs28t6/ndsOvYVS+sjznHXptkugSia8L3H9kk4YDUe2N+rHlLcoK5ZQpgvkTbg
 cSKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758806642; x=1759411442;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vgiPj1g3LbRwQGf0tFC1ezm4NNNMo9eY7QGMXPTOWZA=;
 b=suDwe1qNpgDQGjNHf2DfCFP85TwGUzfGWlMSofaFfrmVhNxODwWEPj4efArhvy/QEi
 eg7R4P6tWWLQMzd7q/3UYYxIVFbkcMXLLLxCo9stbDlJt4sDjINoqV+Pl/wYDmMGneFu
 flLuqtaPo1UgwC+EqQX4u71k5k3cWBHbuNCMYINxdKR+SA5OvrbB+xnCT/NJCRc3vo+7
 4jNJNpWf8+LW4F1Sq1nN7GcrwI5vH35MmPbrT6ub2EGWEWwzsLbeDP0qn8/JwqYXUnuy
 lREZfngFcHcj+6aibGfgP7ALm0d0wHdCh/qDDYW5ADWP//mk5Ksx8YSv5aQD4RP2hLXj
 NfAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdKV7NNBk3x/z+iAPfLA26iNr5+8Z8lQo55ohqZpzOSBm9l89yLbTiSrm30SX+SGPxhltsAF6B8g==@nongnu.org
X-Gm-Message-State: AOJu0YyzX6hmF4SlbJ8bljBNdOrSOjnJNSFow6rfdK5xvIltF7u4+i8X
 LjyOjk+284Pv7thPaJdVt0rKST5/pGzVT+ME+gZMgq1AS/rdJQ9tI9WsCMeCY5pg4qXiWzz324b
 AplxFMaE+TkmJvVeF0FwegodsGkKKmrqLKHsfYaaIpQ==
X-Gm-Gg: ASbGncsZ935/iEgobS9aNn6o4B8ZKqNEybEBPxkfnWofQigD0hDykbCDm8zU5Zm38ZS
 coblkGQJgfgO2EnBtfwY6lnKopvraYNFfKhPRVQmYUE8Lyg+5WKgR5EvdNMfEzllYGILG31i2rE
 Yc5a4gDHvQI/S86pqyXKig4YKgu0rISuJL5Jz1nCtpql6GIflac0qm4cq8D+PDRyI3hbkEQVvb1
 we4gfl0
X-Google-Smtp-Source: AGHT+IGTMKdLMpXicDW0fLs7RbT1LVFRXHZKRZjRPJus8JsfD1XsKelzlri8X20rG5A31YHVSk9NTI1aUbg11xLrC+s=
X-Received: by 2002:a17:907:9710:b0:b04:8358:26fe with SMTP id
 a640c23a62f3a-b34bbbd9a1fmr375302266b.34.1758806642266; Thu, 25 Sep 2025
 06:24:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250916142238.664316-1-richard.henderson@linaro.org>
 <20250916142238.664316-9-richard.henderson@linaro.org>
 <59ae43f2-d392-4582-96dc-8465bf893bb1@linaro.org>
In-Reply-To: <59ae43f2-d392-4582-96dc-8465bf893bb1@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Sep 2025 14:23:48 +0100
X-Gm-Features: AS18NWCkkR_qMKtmEisoD2JXa5ujJGfsCmf37uG0wTkJxgRKc71ZUHtPSuwYkt8
Message-ID: <CAFEAcA9QSfz=JaDhLyf0v6ttCGX3fsy6U1tJMV4hqHRfZSitDg@mail.gmail.com>
Subject: Re: [PATCH v2 08/36] target/arm/hvf: Sort the cpreg_indexes array
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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

On Thu, 25 Sept 2025 at 11:33, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.o=
rg> wrote:
>
> On 16/9/25 16:22, Richard Henderson wrote:
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > ---
> >   target/arm/hvf/hvf.c | 3 +++
> >   1 file changed, 3 insertions(+)
> >
> > diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> > index b043eac8c6..99d8672b9b 100644
> > --- a/target/arm/hvf/hvf.c
> > +++ b/target/arm/hvf/hvf.c
> > @@ -925,6 +925,9 @@ int hvf_arch_init_vcpu(CPUState *cpu)
> >       arm_cpu->cpreg_array_len =3D sregs_cnt;
> >       arm_cpu->cpreg_vmstate_array_len =3D sregs_cnt;
> >
> > +    /* cpreg tuples must be in strictly ascending order */
>
> I don't get the "why". If this is related to a previous change,
> maybe better to squash there?

It's a requirement on the cpreg list data structure;
compare kvm_arm_init_cpreg_list()'s comment
    /* Sort the list we get back from the kernel, since cpreg_tuples
     * must be in strictly ascending order.
     */
and the one in init_cpreg_list():
    /*
     * Initialise the cpreg_tuples[] array based on the cp_regs hash.
     * Note that we require cpreg_tuples[] to be sorted by key ID.
     */

The underlying reason for this is the algorithm we use
for incoming migration in cpu_post_load(), where we
iterate through the incoming-data list and the one
we have on the destination comparing indexes. This
only works if the list is in order so that we can
easily identify "register in our list but not theirs"
and "register in their list but not ours" by comparing
the next value in the index lists.

-- PMM

