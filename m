Received: by 2002:a17:907:90c2:b0:a52:4db9:938b with SMTP id gk2csp2754910ejb;
        Tue, 14 May 2024 02:23:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUYA5ida+niQIeY721whUCScFhekQYTBXqCFdPrfGiUpRdqPaNjbvEM0qd12P0Bdt+xmrbHPU8/deWJrw3pvgHb7NtbEUdD
X-Google-Smtp-Source: AGHT+IGODBdzqgsoqhj9LYV1BZHQtULgeMxo+Ul5707ubhTWA9+P6k1VlYRDwyKZTkD185/fiCMg
X-Received: by 2002:a05:6122:221c:b0:4d1:34a1:c892 with SMTP id 71dfb90a1353d-4df8837f9b5mr9783048e0c.13.1715678606391;
        Tue, 14 May 2024 02:23:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715678606; cv=none;
        d=google.com; s=arc-20160816;
        b=0OTfXmaX8lnxfttxiwVX9exKP38oc2vZsOgLdKZwt+zwyIUdrwJ+qOhB1ppSms85eZ
         UZHC5dTY+xHLc7hmG1hFz/llHmGRNNMZQIrUVv3MdOfjbfVp+1tbWYHAzDsZ5pQZioGV
         aRYamntaFc3ct94VvqDdasSfothcyHphwgCjQnyHvKq3DluNE9bnjGPK8H6gbCQMtFqE
         5l7ts7KI7L9TgSZanyt+Pd9AN95YqQUhCHayfwLW2zG9cpRfBR1ZHZP1in5ae9hthPOC
         tB5HVQwzPUT+HPizuNBz34zU7TBHQLu8hgA9I01BYDRttXGc5MSFl0ZL4Z6qmV9qczHW
         AL2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=sQqtgD0BAbOpn3bhvamG0qImrAv7heRdXbr5/huWwMA=;
        fh=BMjs3e8MgoHzy5U0/r/1VEXhXdYYarjv6w95KoEYR2I=;
        b=Xl7t/2NDh7Nff1avuB+vGr/bKiTtrdvv4sltOCOd/irgHmuA4p4ryuFJsO5hsiar5i
         BpGSvP2DqLaQ+f82XYBUrbwgN7xs0YE3rfCfnXamLjZCXvHV3qGYvlb9a1UHtK941Fn2
         /DcawcpZYjeIHKv30otMVVR18o2yxSp996OJViTAizR5KwAziEYFn6rq/1fKvT/bYMrN
         q1kba2tm7CAEz8ab/hPl/VFQT4qq2H6BH/kUuFAInpHJLS1E0jpJT7GtvjNDX9ysmi7K
         GQSuaBU7AOUcRzXrVIImfL+EDN1G6Ux2oUZV0dHe7ggre0talNwLvcMITSrkZTiuO3OZ
         MCfg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="k4jNm+W/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-792d7a867dbsi639233385a.92.2024.05.14.02.23.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 May 2024 02:23:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="k4jNm+W/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s6oN7-0006T2-PM; Tue, 14 May 2024 05:22:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s6oN5-0006Q4-L9
 for qemu-arm@nongnu.org; Tue, 14 May 2024 05:22:55 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s6oN3-0005Zh-Ny
 for qemu-arm@nongnu.org; Tue, 14 May 2024 05:22:55 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a59b58fe083so1133200866b.0
 for <qemu-arm@nongnu.org>; Tue, 14 May 2024 02:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715678572; x=1716283372; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sQqtgD0BAbOpn3bhvamG0qImrAv7heRdXbr5/huWwMA=;
 b=k4jNm+W/tEMmRFfJ4jgDomcD0a/P/bd5Brt5KicZiI2WkQqTWgHtNDynW5hQIXj1bE
 ceIW1iH0Id+Rpatou0VesxLacBUIl37A/CJYbsLPF8urh4ewtGCx0fjT4K9JIO0WUWlA
 eksDt+dysl5V9hH9x5SnddirdjJVPR3G3gw4BdTeXhtzSMQwcW+OvwPPRqpBJji8KYun
 BohKde2a0jvg6fDVjQ1GmitH3q4upvfCQccXRrbXa+bcYJoQ0nhowD6o4Qm/xK0E5fP+
 NH1v+Tp12MxEgqOfBOp0iVY0ERBcqUm1MVZE1SNawV1jwNxUlu7lN7H/nWu/rUErdzbj
 LORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715678572; x=1716283372;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sQqtgD0BAbOpn3bhvamG0qImrAv7heRdXbr5/huWwMA=;
 b=aIOyZfKl4t9bSUoAxRNAX1B0oeQuKqJsiyQ1uhCtJlq1u9qaJz3Q5rcdBOZwLj9FwW
 BSUb+gQVhZh6EPrrbvhDAPEDpRbDNZVVOjXph6Sc4rxADtAJn2ElwiycUSUA5G/Z5Q+L
 ZhxLJfaHWKIMsCmJL1Qhgllw+N2lzRwFcSPbYQGmmjGfFOV/2zRVwq+t7bxGksPd1gUq
 BRzwV7+nbAUCzm+KTiF7lRxCeof5Q9GucOOFsEDKwCjWG9BafcA0qoXKh0xpxvSsJ1Fi
 5A32PstqDBFOaKEWKOAicz2JpeFtVx1cUK5rukH8Xp8aosX63DbkF81mtsKNhPjACciP
 +4UQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9iUfsIHjvfcT6HOlX+qkCsDtqxXTj1EiY81EzQgkYmJ9yZwyjtLqtYTz8+ohCPNj/J4x6KZ8SfAaMfakP7+ywJp4n
X-Gm-Message-State: AOJu0YxLlNJZmg/V6GCq4QzOct05DVvqEXSY7n7ScLpwwJKKbrmasORI
 fB+hXKtfJEwn8c94cmVw70tJZFeMjX46jWMrd9Lamy7GJzRieft963ShNTlnpKsLAdjN1mGH9Eh
 7Km/9NtcNhk+Z62U+Lo9+9H+zuDWkqsWZggHM1g==
X-Received: by 2002:a05:6402:1746:b0:573:50a6:d3b0 with SMTP id
 4fb4d7f45d1cf-57350a6d402mr7933301a12.3.1715678571755; Tue, 14 May 2024
 02:22:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240507052212.291137-1-jeeheng.sia@starfivetech.com>
 <20240507052212.291137-2-jeeheng.sia@starfivetech.com>
 <CAKmqyKOmt1UAbSnVbQ2fLVwoPP3u=6r5hX+gVO2xhLKidQ-8-A@mail.gmail.com>
 <20240513023110-mutt-send-email-mst@kernel.org>
 <CAKmqyKP1fmvyNsY0uXasK7jdHK9C_cizJdiqivK=Nxtfo37OxA@mail.gmail.com>
In-Reply-To: <CAKmqyKP1fmvyNsY0uXasK7jdHK9C_cizJdiqivK=Nxtfo37OxA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 May 2024 10:22:39 +0100
Message-ID: <CAFEAcA-cF7EXRd1VZAJ=ApuBuU8=zkjhLAKkcbms9wqJy_WObA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] qtest: allow SPCR acpi table changes
To: Alistair Francis <alistair23@gmail.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Sia Jee Heng <jeeheng.sia@starfivetech.com>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org, imammedo@redhat.com, 
 anisinha@redhat.com, shannon.zhaosl@gmail.com, sunilvl@ventanamicro.com, 
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com, 
 liwei1518@gmail.com, dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: KhPY8AElrXRi

On Mon, 13 May 2024 at 11:36, Alistair Francis <alistair23@gmail.com> wrote=
:
>
> On Mon, May 13, 2024 at 4:32=E2=80=AFPM Michael S. Tsirkin <mst@redhat.co=
m> wrote:
> >
> > On Mon, May 13, 2024 at 01:55:50PM +1000, Alistair Francis wrote:
> > > On Tue, May 7, 2024 at 3:24=E2=80=AFPM Sia Jee Heng
> > > <jeeheng.sia@starfivetech.com> wrote:
> > >
> > > Can you describe why you are doing this and that it will be reverted
> > > in the commit message?
> > >
> > > Alistair
> >
> > What motivation are you asking? This follows the normal acpi test updat=
e
> > procedure.
>
> I find it clearer to have commits describe that they are disabling
> tests for a specific reason. That way it's easier to track what's
> going on.
>
> If ACPI test updates don't usually do that then that's fine with me

The only reason for the existence of this ignore-these-blobs file
is for the purpose of the commit sequence:
 * add the blobs to the whitelist
 * make a change that alters what the expected blobs are
 * regenerate the golden-reference blobs and remove the items
   from the whitelist

So we don't usually say much in the commit that is adding a blob
to the whitelist.

thanks
-- PMM
