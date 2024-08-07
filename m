Received: by 2002:a05:7022:d82:b0:85:21:bd5b with SMTP id ec2csp418741dlb;
        Wed, 7 Aug 2024 09:17:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXBt9ZCdrvu/juPEid4Gqjp9D/meB052orOa9II/Qquv5pl84rdEy+bBapTHf3HHNR3rWZJLxNm1UxQ0A==@linaro.org
X-Google-Smtp-Source: AGHT+IHvURC19A4jishltpU6H3pW8ybI+dDQXhchoopxMmPDSdwLB1GTre6JsjWmXUc96eW62QN3
X-Received: by 2002:a05:6214:54c1:b0:6b7:97d1:9a94 with SMTP id 6a1803df08f44-6bb983eed64mr231344196d6.36.1723047451276;
        Wed, 07 Aug 2024 09:17:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723047451; cv=none;
        d=google.com; s=arc-20160816;
        b=PHcdTObNY5DvlNgLCwQ5Py6fqxJJlriQNUFJGPFvijzSGrQ6FmxUmhk+W/NEc2+OjE
         jlByZu8CuTsym/mQGrIj7A80mPMdoo2sRu0cqIb4lAi8DmUnwaze21R54wIh7QoqQb0i
         fAl5qx8vWBcpJpn2MjSXvejQ9hLoTE3SN+Y7tpKwTIft5JClMKJweFqpyaRt7VCZT9pP
         g15g3gvX8RHlbP0YdblpIZ3FeYM52BigUhRlw1m5CrDLdPUu31KFUq0ucPXZMk+HicT7
         0qiHzoVmX004CRvlmlDz3DelSIKmqJvB3x+wL6ey0W0aUlnEuGg6Xcydh5FZTkH9nwpo
         mZcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=MGB7lsf0ZQyPy4LluEQ3IekLkGnIH4iLXtYJ/dh0y5k=;
        fh=OkjnMi2kc+2SHUrtVE+d8RXGAF+BoweUUpg1NkKOeMs=;
        b=h9T9Zz1O8SzLg4UnT/KhGSbgbUDH23v15Apa9e20EAebVOhSKf4fOXIl9217j0tK/6
         cDeff5JsaKQfkgu8651iA3amg/UpcfYE2GW3LYNOC3xksCm0ZQB4twnkBBVtJmx5V/4u
         F1Fuaj/eadMzUxjn7OnjAHQ5QWGum9daeVYihtLXyzRXC+lV/K6uKgLqg7/4dSIIyrGF
         kPawMkdOo/xD7lMqgoFSzrMUVLTvJ+eGDqkmaha0AJhJB32uYLiqf5PFScbmTNsn/25B
         yHNHV2cUntfUS1hnzo7URAym679Pqvl8+o9VhRSycheHW+eALqV/n7TwRD5x+U7papie
         pTmw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Lyw9BDmu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bbbb8d0b6csi20923086d6.252.2024.08.07.09.17.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2024 09:17:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Lyw9BDmu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sbjLk-0004uE-J0; Wed, 07 Aug 2024 12:17:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sbjLi-0004q1-SD
 for qemu-arm@nongnu.org; Wed, 07 Aug 2024 12:17:19 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sbjLg-0002gf-OG
 for qemu-arm@nongnu.org; Wed, 07 Aug 2024 12:17:18 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5af6a1afa7bso2490455a12.1
 for <qemu-arm@nongnu.org>; Wed, 07 Aug 2024 09:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723047433; x=1723652233; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MGB7lsf0ZQyPy4LluEQ3IekLkGnIH4iLXtYJ/dh0y5k=;
 b=Lyw9BDmuO4a6eODbihBqJwPAC9q23uqx+dX8+zSUVM25qtRvGHCCGPvEYCtXLBIjFV
 6w75SwVE3es/LX++DtUCWfvgElg8gKh32rm/IrPfZDvQTZ+CNoKJ/jU7ij5/TWSiehE5
 0p4boB0w/+cfaPD3/1QCq5xGG70PRWWqnAn2g73QmXNXgnwDio+C2n3PwNwJkHaM5qB8
 Ex9DYVtiNY7s/EppYj6qkrcdcxdBRR+UKrnH9dZGGrsYUivA/t7Yz8Rbhniut+7NC2AP
 aLNHZoQkv0N21CQe1WatV/4Xjl5ngkOs+Mj5o7aXhbsdaJmcfPBEgbY1Hy2TlhtWRQ8l
 KCzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723047433; x=1723652233;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MGB7lsf0ZQyPy4LluEQ3IekLkGnIH4iLXtYJ/dh0y5k=;
 b=RiB6h/FuBTj2QRpSHYUw3er+taIlowLQ5u4LDaQgap7XtvtSGIKGvdbZHYQp73j08t
 zpHxdgex618HbXT+BpWn5DNA7CVCzd/p3Zokhd5wwFT8mR2TmQOix01yMJpEqo3MTmgx
 JQy/OMrcRRrJzzSs07feUlzbCnk6Sw+QzL1HljDXtJ12REk6lBfnYbRn4p5ZVRtUTx+g
 AXkIa1ATxJVoNMaU1umgmjDeybLem8buoJxFEuLJKLbJoYCjQG0nI/Ibeb5PsttISbOr
 nmf9umYB0NEIXNFTPTeJ5E4P0bVv/ATAcDqCV6nHdcALY+sapgWWSw89IH9wAIPvjz9r
 qJDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmhDyc4NB76nl1+FcqQyomOboL7lh8VrriUGY6m9Mu2HY6lfEmCZd2JyZTuLWBwtaEHBzKxxKyKg==@nongnu.org
X-Gm-Message-State: AOJu0YzpH/+gPLCEWsJzH1un2wxdqOl/2OhxD96iW/NmxhFkMaHl21XP
 2Mla/FRGqMNUEZyOZsF8WOpIoRRgEmp2bLETsJQjzpkn9gmJBIE0T4qR4aZUbNghZq1hD2u98+u
 6Rm2hr5KjR4UCDVUsn5Q3YZJ+j25BpaE6du8V2A==
X-Received: by 2002:a50:eac1:0:b0:5a4:2c8:abda with SMTP id
 4fb4d7f45d1cf-5b7f36f58e2mr13728476a12.3.1723047433030; Wed, 07 Aug 2024
 09:17:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240806141940.22095-1-philmd@linaro.org>
 <20240806141940.22095-2-philmd@linaro.org>
 <f82397e9-3be4-49be-b291-5598acdaf39b@linaro.org>
In-Reply-To: <f82397e9-3be4-49be-b291-5598acdaf39b@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 7 Aug 2024 17:17:01 +0100
Message-ID: <CAFEAcA9emwsK07+itUzMxReOLG8gHaxNdDE8ymuwyuBfsoY2Pg@mail.gmail.com>
Subject: Re: [RFC PATCH-for-9.1? 1/2] target/arm: Move
 qmp_query_gic_capabilities() to hw/intc/
To: Richard Henderson <richard.henderson@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, 
 qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
X-TUID: aXht8P8rV1Mq

On Wed, 7 Aug 2024 at 04:46, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 8/7/24 00:19, Philippe Mathieu-Daud=C3=A9 wrote:
> > qmp_query_gic_capabilities() is not specific to the ARM
> > architecture but to the GIC device which is modelled in
> > hw/intc/, so move the code there for clarity.
>
> But the GIC is certainly arm architecture specific.
> It's built into the CPU, and shares state.
>
> The fact that it's modeled in hw/intc/ and not in target/arm/ has always =
been a needle in
> the side, though it seems there are no good options.

In retrospect I wonder if we should have modelled the
"GIC stream protocol" described in the GIC architecture
spec, which formalises the communication between the
CPU (including the GIC CPU interface) and the rest of
the GIC (redistributors, distributor). It would probably
have been more work and perhaps less efficient but it
would have been a cleaner way to split the hw/intc
code from the target/arm code. But regardless I don't
think it would really be very feasible to move to that
design at this point.

WRT the commit message, the GIC is definitely
Arm architecture specific. There might be boards
with both Arm cores and non-Arm cores and a GIC,
but the GIC will be connected to the Arm cores, and
there won't be boards with a GIC but no Arm cores.

The QAPI command which this code is implementing is
also (a) target-specific and (b) unfortunately
designed so that it doesn't get passed a particular
CPU or particular device to query, it's just assumed
to be a part of the whole simulation.

-- PMM
