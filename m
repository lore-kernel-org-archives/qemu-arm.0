Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp582499ejb;
        Thu, 1 Jun 2023 09:46:01 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7B+7ogp9KpeywTUbeHEmkB0Hox3gSQUbW9azBHbLvRqbs5QHD57DTUYiczGfQLbx+G3WcK
X-Received: by 2002:a05:6214:21e8:b0:628:335a:173d with SMTP id p8-20020a05621421e800b00628335a173dmr6355347qvj.43.1685637961276;
        Thu, 01 Jun 2023 09:46:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685637961; cv=none;
        d=google.com; s=arc-20160816;
        b=gO1kM9pkIRpTQupUAIPhqHdkz+HlCJqrC8Xi2FtOhMB5ttk0wXaX1zBAA39GDm08I0
         m1jNRuyabMSKAR4gCHmXemSBnsHgZ6VsLXZZWKmRveFwMBHjuseFlQ61kT9Kb7WOTzCK
         40QXOyMNRyxaSFejQM5Iroh5aKbZKtzC23E80hUCwQJ2PEao0KgJ9IC26LybD3n1OCGx
         CaeKoDVM5E5JSIuuQkK3D/dHxqg42dMeq1zhLUTjnnaCUSN4aAAhDNxaYKZeXh7e1qPk
         pPnEvfElJMxxI+5tQocZhCLsWbyeOncmIUvtQWUKnuDgtyx71SjkM85nurysWSFB+rSI
         zXvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=11ObepHFm1VZX7NKytPUbInDRykC2nhHqdcBAYi1ytY=;
        b=YHpv8i9+eoa7QFxUpAhyaGrk/z17iGa9NT3pouqR7vxdzhfpIkORlR7++/ybiKKb9R
         qRm6D6bq3buXmNewDirvoz1rLofwSYv6tVXOQ7Y/e+JKc4mXCQH07+dHBDRkVu6ZWUTB
         NWzts0q5lwoRCe0lOD+XqO6Q1qAZ1uut4Fmmi9p2U1UF702VKYmjy2kmieou5erQ755H
         GwDBF8D48EV6S6YoVdjFkkvMD/pqAED3RNB2LVARBsCuHks93OFA7XpsB9MVW5lkoUNm
         HxjM0+Pr0fS3OaAvp1OLzQRILs8Vm/4YqN1NfNXFzb4rijsujSLQSIaP09C1AOQimZ1L
         vO/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="OO/81TB0";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r12-20020a0562140c8c00b006211063ede2si5044199qvr.180.2023.06.01.09.46.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Jun 2023 09:46:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="OO/81TB0";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4lQs-0001Zm-BJ; Thu, 01 Jun 2023 12:45:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q4lQO-0001Nw-DQ
 for qemu-arm@nongnu.org; Thu, 01 Jun 2023 12:45:21 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q4lQM-000169-Ks
 for qemu-arm@nongnu.org; Thu, 01 Jun 2023 12:45:20 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-974265a1a40so512071066b.0
 for <qemu-arm@nongnu.org>; Thu, 01 Jun 2023 09:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685637917; x=1688229917;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=11ObepHFm1VZX7NKytPUbInDRykC2nhHqdcBAYi1ytY=;
 b=OO/81TB0SLm1N57k9ni+ZofhPx/gRjxh2/t2Czqy+BYMj6KZ0Z+sFamVsBT5b9aAYR
 MJM5nZDYarSIwLnK8w49MNJ55jY9zoClQll+vQ5NETtyfomLOE9hdEWGycXlF31YXBtp
 Ie4NPpjzUc6S643eKDHHyRm5/hf5UM7GzfonhsCEKP1BO8N4pQAOCX2Orr2G87+FGZ8t
 kx6Hm7qQ/upOJgVSOPqFfws6Lc7Sks3vhEmjrLR7ZfDc4J2bv+aBunAH454KzK7LofLi
 FuWsN2BuKXJ2JPFil7vkPrBNF5HfYf8g+L73miDPaGDNp9kLu9knYHtjvaS0GXbUpzJV
 Ibrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685637917; x=1688229917;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=11ObepHFm1VZX7NKytPUbInDRykC2nhHqdcBAYi1ytY=;
 b=cFKel/qDzs3HOZhMjOhlHz6pti7YtGeCq7AK08TtrUh1RPxR9E2KG73BohS+8ScRqU
 KBP50NH55C7yHq+rIRTL91TO2lSsfHhFo1qW+QY21+9ys8hzqqlEZ8TCD2WHqzZ3bBvA
 /+KcB+yAKYJInKh/itOEnTia/nb5IJHUUrdIvffi63qe+EwmA867HRRynNAjkr3fiWw7
 tGobJwj7ndAfE/sTauv9FvfkMAKMSkZAC+aVURQLcXo+ZRKEBVu6C370AxCTHCxhaNtO
 dyJnoRQmV0if5E4qo71ef0d3Bj9BWU9yISDvy/6rkhshefO5+s6Izjww0gn31Q9lcyqu
 0B/g==
X-Gm-Message-State: AC+VfDx+FGP0Ug/59MlKzgGu1LOgn1XjXBDRB4yRx4VsKD/5z+7UzqBy
 UGVXLsLsTUfTbHtmn9JNGcLw0rGWmF7IuOyp/enP1A==
X-Received: by 2002:a17:907:3eaa:b0:96f:add6:c1ed with SMTP id
 hs42-20020a1709073eaa00b0096fadd6c1edmr2146654ejc.38.1685637916997; Thu, 01
 Jun 2023 09:45:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230601143312.69691-1-quic_acaggian@quicinc.com>
 <CAFEAcA-92-zExcOFMwaNYvP5pXLTUETsYi3mpuvTp2txfVEp9Q@mail.gmail.com>
 <11f8fb60-abe7-d99d-c3bb-aaa405425668@quicinc.com>
 <B0A9BD1B-B98C-4710-987D-03ADDBB993B7@quicinc.com>
In-Reply-To: <B0A9BD1B-B98C-4710-987D-03ADDBB993B7@quicinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Jun 2023 17:45:05 +0100
Message-ID: <CAFEAcA8tCZ0shxEiA4hOVsHhOBvGmQ6HLJq1dPKDuSqBXKdtJw@mail.gmail.com>
Subject: Re: [PATCH] hvf: Handle EC_INSNABORT
To: Mark Burton <quic_mburton@quicinc.com>
Cc: Antonio Caggiano <quic_acaggian@quicinc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Alexander Graf <agraf@csgraf.de>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: yovuVqSJMppw

On Thu, 1 Jun 2023 at 17:00, Mark Burton <quic_mburton@quicinc.com> wrote:
> This patch came from a discussion on the KVM call the other day.
> It may well be the case there is a better/different implementation
> - so the patch is more by way of asking the question.
>
> Re-phrasing your question - I think it boils down to =E2=80=9Cshould HVF
> (and KVM) support executing instructions from IO space?=E2=80=9D.

I think this falls into "might theoretically be nice but is
probably too painful to actually implement". In practice
well-behaved guests don't try to execute out of MMIO devices.

> In that case, this is a =E2=80=98partial=E2=80=99 answer to providing suc=
h
> support for HVF - partial in that it relies upon a memory
> region being created =E2=80=9Cdynamically=E2=80=9D for the IO space that
> has been accessed as a side-effect of a normal access.

But nothing in (upstream) QEMU magically creates MemoryRegions
just because the guest tries to access them. Either there's
nothing there in the AddressSpace at all (definitely can't
execute from it) or there's already RAM (happy case) or there's
already a device there. If there's already a device there
then something would need to do a "put a bit of RAM in
temporarily, fill in the single instruction by doing an
address_space_read() to find the data value and writing it
to the scratch RAM, tell KVM/HVF to do a single-step, undo
everything again".

-- PMM
