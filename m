Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2423547lfi;
        Thu, 26 Mar 2020 14:45:42 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vs17nN/8ISfFZGO2oegEXxnbEFyriq2DQmbLDnPb7sr+zZ4HzbIUThbtpuUVVwv9V6pEcKz
X-Received: by 2002:a0c:b90a:: with SMTP id u10mr10843768qvf.92.1585259141863;
        Thu, 26 Mar 2020 14:45:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585259141; cv=none;
        d=google.com; s=arc-20160816;
        b=yMOMUIsRAYzDIZqVzAGarspI6lZleYtCmE7K4d4bk6odY+gNJh2MxXRZcWLtC4VatC
         NClgZbcKRB1jEXuw7HM2YNDcO1LlhofF8fjGmQnQAgdtriIT53siMdezUtNp8xuI9L4B
         F9kagp7XwSOTQa+RpigDQyqNdFM8ybpk5eelSIc4244JbdpD5kRVbvLCfOFeZHxkpWFg
         UJYyeTNrvnIoIklHIv/H4CLktngOlOh6eD6KvMQrfymGQ0dunGGqIQOjPuOkohd7GtP3
         hhxi5ppgWQvkTwKuI77wqnkNqooa4aWo339NzTDFLWb0HqXr5KYpaJp/LS3CUtRyG1jL
         560g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=iIJml/paGDft77iresLwu7OhLTxm+EOldnil3k1PySI=;
        b=khXATaxJv5XLukKgTL8fZX+f/f1G2ZDne8LZ0jiiWIA+vkoD7sUqDI5UzJzFKjTtLS
         aTUUb8C9Ws7rDBxxNiULcbVc6qSqrGQ3OYacAGp0QtAv+U2OgtcfNGm+U7jTWNTSF+K6
         19pYMbeJR2xsguHTh05TB7CXarHSH3raRWZP4mf6JkjGC6q7vYwRqTF3OEGf6KQaoJrX
         2oWiy6OXpJKmlgWXOP79FqngVQlI/mim6VIJE2EuPwG+usa1s0e21OnTGRDCHvjqwfUe
         HmKhtc8lZTzrChNyq4YgwsrRRs3QhNLazvIRIMwghwGTaYCRmvTQyyPkGiJPVFSET0Pp
         /6Fw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RsWHG52B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k26si2384675qta.212.2020.03.26.14.45.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Mar 2020 14:45:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RsWHG52B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:32896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jHaJp-00035a-8r
	for alex.bennee@linaro.org; Thu, 26 Mar 2020 17:45:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41836)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jHaJR-0002ts-T4
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 17:45:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jHaJQ-0001H7-Qe
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 17:45:17 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:40054)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jHaJQ-0001FL-It
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 17:45:16 -0400
Received: by mail-ot1-x331.google.com with SMTP id r19so1787766otn.7
 for <qemu-arm@nongnu.org>; Thu, 26 Mar 2020 14:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iIJml/paGDft77iresLwu7OhLTxm+EOldnil3k1PySI=;
 b=RsWHG52B29eyg8Pi3JaQftoGk+yqSXnN4SiIAjTlpSpVDEfJ3SiF03f4swlCr/tpvw
 uIkPGoFOwrJXKE9wRopdMz+h9sefM3mG7nPP4DS+t77b4gbMkTxE0M1b6jL3kVJB26Wt
 gImMG0M02OZ/pzbhyGN+RM8dvVydQnmmO0ELke6JSaccOE3TDU0BCLXko0FiWOB7SqQ+
 So5T1eoEWBERec4c5kbSHY93O7XIVwOKS0Fuj8rdeOJHLeWYnbazADfWzGh7w3yLTjqk
 kPDf9t9WoGRn1bbRJJ6gtemb7LLHYKvIWkljWaqaBO9I3lRVBWiyFiJKYdOFnJufvLHL
 8a8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iIJml/paGDft77iresLwu7OhLTxm+EOldnil3k1PySI=;
 b=NKVzv0VuWRI5PeuAFixoKNkDecBYxF9nLvjD7IbjLn4RcoNQbHgatg/gyrRRuA8P4V
 TfITxfXT9anF89oUKUAAsV4RLG+Sp7uyiHcdImuLZXIc8yNAHxyfxpGIXz9ZOYK8wedP
 fG/CYXegT2S5TuhgYwUWDVVSIS2Sz+EDUIjIZ8lqKKruyuAHgPjRi3Z/QrS/ug87+U9m
 fQ1r9Qc2KQSccYAgrE2K5RhAXNpXoTmQkmE1dyGk3e69JmKkt8jdGVGnsw1z6iIqesc1
 AYFm7Q7qrBAJZvJh/ldCNcnG6pwXQzCc4XxdlrGAXPnzwNGrwkX+/mOqU2Sr0rhzjoK2
 puGQ==
X-Gm-Message-State: ANhLgQ13dnbs9DoiWOM0LaqBMxAPf2v6fORDiLZKqGNFWhIAIGqbEiM0
 4A+mScFFr5KliI5/RPweL6+vyXiUf9AJhVUqWcpaavmy7XQ=
X-Received: by 2002:a05:6830:18f4:: with SMTP id
 d20mr5418119otf.91.1585259115314; 
 Thu, 26 Mar 2020 14:45:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200325191830.16553-1-f4bug@amsat.org>
 <20200325191830.16553-5-f4bug@amsat.org>
In-Reply-To: <20200325191830.16553-5-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Mar 2020 21:45:03 +0000
Message-ID: <CAFEAcA9e8weisrD+2zHsOjGAP0UR513V1mN0RH5VJnd9m5hFqQ@mail.gmail.com>
Subject: Re: [PATCH-for-5.0 04/12] hw/arm/stm32fx05_soc: Add missing
 error-propagation code
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::331
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
Cc: Paul Burton <pburton@wavecomp.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Markus Armbruster <armbru@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm <qemu-arm@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-ppc <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EyBiwPlmFbmX

On Wed, 25 Mar 2020 at 19:18, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Patch created mechanically by running:
>
>   $ spatch \
>     --macro-file scripts/cocci-macro-file.h --include-headers \
>     --sp-file scripts/coccinelle/object_property_missing_error_propagate.=
cocci \
>     --keep-comments --smpl-spacing --in-place --dir hw
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/arm/stm32f205_soc.c | 4 ++++
>  hw/arm/stm32f405_soc.c | 4 ++++
>  2 files changed, 8 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
