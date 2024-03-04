Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp2843812eja;
        Mon, 4 Mar 2024 13:12:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUZj7Zz9qrpA16e2Ufb3nqMIlS0y+jbo2CKc55DCUiReQQKcVKF5eXIseOkWJZOePGSlfXwV02ENN0gN/v56FXAiYdXSdhZ
X-Google-Smtp-Source: AGHT+IE+Nk760aMySnqykFgkbZvtSlX/a2IkQz50XfJBcn6Q2YTyqCGcn4ft4g7BAgtVTZ0ujwDG
X-Received: by 2002:ac8:5f46:0:b0:42e:f950:d225 with SMTP id y6-20020ac85f46000000b0042ef950d225mr75373qta.1.1709586725327;
        Mon, 04 Mar 2024 13:12:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709586725; cv=none;
        d=google.com; s=arc-20160816;
        b=qd6yN/GB7a6Aoyp45hMyGjCCtAndxdMy7xcbtoauyXlv2hQ9fm0QgADNLQQLbW0ksE
         0tU86uX25b37XivYaTPsaIZawWzZHn/y35i40n3op5CloSWpLGzzdFhHPUrfbU/ZCw9m
         TOXXo+0tMmGRuecASuFWb8owAK1NCkBE8tkm1gppZgHN+3qSrlY9lCiy/Q4/9p1OTvaQ
         0jUEEBiA1KT+dsJUOioAmDHPxsDh8MTdHKQ1YL3s/BzFgnEuyyuF4W5qvRV4cHrRNO4q
         XmeJZZMfPzEOidpfRditC1RiCIiL1ZCIFckPL4AeyYxP629NfT2EuRiCT4au7g6YRDb2
         qb6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=+Hqb1C+XYVn3thuSGrZUtKLKE9O91b1Ym1bO374eQt0=;
        fh=2KZjj4iCoV0BAbZ14DdBcUgIjyeOA3ZwQiZ0LxzCyMU=;
        b=u1v9KaWtfuufvwzk2ANuQuVrlzoYkKMlL60TiYZoNoD1BycWAX3bC4hfgfrQwtoLOB
         0E3A12pAsASMdkHyUHoovRFoeZU5+HzLqAwpkj5pc8QOTBp5xUZYKvRAsEHTZNxI+w9x
         8q+mupaAH4VyVccIi75Kn0OFJDfw9THzJ74PRNyXTMBeo5wD3LGLED2MYxnwDmApGZRK
         7zFidoRpyoIQpQmEr32AbrQeKEsFcM9bg8dT/lOoBJuNN7WXZyMyR0/TTeQ9FqXNiRcu
         hUxAFVonCMIGw3QhHn1a794jklpGoxUnMDNBrXyWeZZ5fZGSbjP+UsZ7USLQ1ejt2hzj
         OY7Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=jjNDGPba;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t24-20020a05622a181800b0042ef6d8d4edsi1853896qtc.784.2024.03.04.13.12.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Mar 2024 13:12:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=jjNDGPba;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhFav-0007j2-02; Mon, 04 Mar 2024 16:11:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1rhFao-0007hX-FH
 for qemu-arm@nongnu.org; Mon, 04 Mar 2024 16:11:27 -0500
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1rhFal-0006sB-MU
 for qemu-arm@nongnu.org; Mon, 04 Mar 2024 16:11:26 -0500
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-6e125818649so2643430a34.1
 for <qemu-arm@nongnu.org>; Mon, 04 Mar 2024 13:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1709586681; x=1710191481; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+Hqb1C+XYVn3thuSGrZUtKLKE9O91b1Ym1bO374eQt0=;
 b=jjNDGPba7VAwH17WKKUVg+n58YRgzMBHNTkm0RhSz8xAvroKfah+F/OgJ7IZFCD/uo
 72pcove1bfIdfDc7pTjYDRxaWAr/6cfYqkMM49MXEopm5WWbA485jtLlzWWsFGHnVuxX
 QCZpJ3Ac0XCB2mglOv9POHOh97ZfZwGFjVYvPsG2BM1yT1U09VBrxLS/0OrsL4TK75jA
 ooumNdXAMMeJHmnFsSExqdyDkQg7EdJbPa0IG7Dx5oYV/+5QyfTJYiEbQCw+U5H69/5q
 2hhRMHlIdlaKw7iH3Y9s8wQ8MhmfSRvHfWmer2Ud43p4bg9F2OoHP6slvsnTwkDl/h/3
 4QwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709586681; x=1710191481;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+Hqb1C+XYVn3thuSGrZUtKLKE9O91b1Ym1bO374eQt0=;
 b=ndKDA9/riGHE+/nkX7BP9FWaYL6N41xfYvUYTdaR+BKZA5dx76+uEOWsuNESAmvqsR
 DOK0GF/xCYTuLvT1IRP+7TTsl4YttPXgOFBA3Xknm42g3EhikAo+myARz4z/JXMX8cDq
 SJ9jkfcPDq1Caetb9oCZmYmfoNimsDTbTA6uC8cEsq9ICjuvyIxnvbVSzptbrk1/doHa
 Do6xQ8TQWvRcLQ0mkADDrKynexIqSQA+s7g360RRR4c4UnPRwZHF8CL97K6s3tY+1CyZ
 VEnfPHfWRFPxqYpk7nCe/9ATBb3ndNyFYpx3OgsKema7yhi8Wq5AciQNi62QaajNjvAA
 +iOw==
X-Gm-Message-State: AOJu0YzX9LP3SeTs7CyBY00qDi4s2Rt/nMXQah6BZDfEz4kC8eMquUzZ
 8CVmIi8w9EP6wH/h/fAq02N9foVAVYki93bMmozESMEOERMHzyxjvVPUfKydYDhRRmhk2UVbj/X
 DwzI1Latyeyo17+3lVLw5L5koYnS0eCKeaNfs
X-Received: by 2002:a05:6870:1645:b0:220:a0b0:6d4a with SMTP id
 c5-20020a056870164500b00220a0b06d4amr12339900oae.57.1709586681421; Mon, 04
 Mar 2024 13:11:21 -0800 (PST)
MIME-Version: 1.0
References: <20240221170027.1027325-1-nabihestefan@google.com>
In-Reply-To: <20240221170027.1027325-1-nabihestefan@google.com>
From: Nabih Estefan <nabihestefan@google.com>
Date: Mon, 4 Mar 2024 13:11:09 -0800
Message-ID: <CA+QoejU3y=0k3-hMQzzmOV-RxkxTe1pnSVpU-xv=B0WLHq3n4A@mail.gmail.com>
Subject: Re: [PATCH 0/2] SMBIOS type 9 descriptor implementation
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 its@irrelevant.dk, kbusch@kernel.org, eric.auger@redhat.com, mst@redhat.com, 
 imammedo@redhat.com, anisinha@redhat.com, flwu@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=nabihestefan@google.com; helo=mail-ot1-x32a.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: mWmIfJpJfy+i

Friendly ping on review for this patchset!

It's been ~2 weeks since it was sent out, please let us know if
there's any changes that should be done to upstream it!

Thanks,
Nabih Estefan

Nabih Estefan (he/him) |  Software Engineer |
nabihestefan@google.com |  857-308-9574



On Wed, Feb 21, 2024 at 9:00=E2=80=AFAM Nabih Estefan <nabihestefan@google.=
com> wrote:
>
> This patch series implements SMBIOS type 9 descriptor, system slots.
> For each system slot, we can assign one descriptor for it if needed.
> In versions later than 2.6, a new PCI device field was added to make sure=
 the
> descriptor is associated with a certain device, if provided.
> For ease of usage, qemu-options.hx was updated.
>
> Felix Wu (2):
>   Implement base of SMBIOS type 9 descriptor.
>   Implement SMBIOS type 9 v2.6
>
>  hw/smbios/smbios.c           | 142 +++++++++++++++++++++++++++++++++++
>  include/hw/firmware/smbios.h |  17 +++++
>  qemu-options.hx              |   3 +
>  3 files changed, 162 insertions(+)
>
> --
> 2.44.0.rc0.258.g7320e95886-goog
>
