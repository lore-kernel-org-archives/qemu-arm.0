Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2416237lfi;
        Thu, 26 Mar 2020 14:36:58 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtEADCTtrqalcbJxcbH4vLLXsdxGdpZMWMSu0vcK2XNxioe5cPLln0T/bvbRVWfWxtc5tyw
X-Received: by 2002:aed:2a55:: with SMTP id k21mr11319601qtf.159.1585258618621;
        Thu, 26 Mar 2020 14:36:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585258618; cv=none;
        d=google.com; s=arc-20160816;
        b=Zeur5hojz5gZkoet+cpdnX/qrkdn4GMtdHoXxtWpcWwrtjBes0cpPpkKxHRYSs//6l
         HG5wW/rXMp2N0rdFm8k2FUrzX1nuxXax/CVhTkNLi1B/eVv8SubKJNnTwWmRnx5inZZi
         I9eO/e/um9LDkO1+O/Q5CTv4iMO9WK7rXxzcFb/2QkfjDHqATdEXMRIf440lYiQrwQEw
         rL6RqpENq73/M7EUroMwg3BzKE7glzZAmcgXrMMuZxrVNkXJ/E7PmkjLbRorl5az8X1i
         4ja8yEaIV4/m/gqELv+n61uJdMRCigfyvselbVSzXq+vZhmQXbHzUDBxtmu/XuvWHQbn
         cYUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=FHPo6R9+P4ugxx2FOsK+YSWlnmcqgznNMFclaNoulYo=;
        b=s0QMA3PwltxvYXVR196fMpPNOBEM5Xt7x29EjPHRjEDAM9JwNoXEU7GDBcPf1iDdDW
         Y0aaNCigoD3PsVp38xjaEDD9nN0x9cIFxHiRNExoyrapg+juKsjNg6ogm5W5TdHcOAm7
         l39EKXXktOgigqJyV1pgocEuDyoif/cfF4d4PdJhUHV372i19RziIQ0HA7+KKgddNSw1
         G6AJY2mdAEltFNNUrpFTybkOButnuqe8TtYveDXfHqaS1Dysi/AgfzFs7bPMESqtIJxg
         9cCnrRk0X2NZCyj4HzsWlKS8eFdAPI+n/Km+V/NpK7c6JM0xrV7bZNjmDM11iUynpkv7
         KZAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xXjTsfX2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d22si2352167qkl.211.2020.03.26.14.36.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Mar 2020 14:36:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xXjTsfX2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jHaBO-0002ic-37
	for alex.bennee@linaro.org; Thu, 26 Mar 2020 17:36:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55845)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jHaAD-0001qw-Oz
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 17:35:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jHaAC-0008B4-Ow
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 17:35:45 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:41332)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jHaAC-00089Y-J6
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 17:35:44 -0400
Received: by mail-oi1-x232.google.com with SMTP id k9so6960328oia.8
 for <qemu-devel@nongnu.org>; Thu, 26 Mar 2020 14:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FHPo6R9+P4ugxx2FOsK+YSWlnmcqgznNMFclaNoulYo=;
 b=xXjTsfX2ZVmKAmop6OwPTzhWbT9gVeZ3yJLoK0oOZFXD0U9ztptIbfAKVzNhV6EopB
 o94GVhCUzIhF1RFnY9t5aPdYaAWhqgJvK91aPJDFgYPptIXIvO/4E7WF4BpVffrqx/1Y
 wufz5jcUI49v5GbQuzpVvw6sDaF91KvvXeJQYbjXzCUDpZ7FpBlTts+ltAIEEoLA/fMp
 Y7ABJt/GXh7yCAO7u3VbrNzThlHMGkSD3ONNyNNQ2EMlxDr8gpiXL4wOALbWQznSxQY7
 PwuVjBF9Xv/wtg6/TiWjVj+q3Fez8clEOf/F+a+UmdMRLNEctQ7qhH9mWM1XtoUgBiWJ
 afjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FHPo6R9+P4ugxx2FOsK+YSWlnmcqgznNMFclaNoulYo=;
 b=IafJMl9Lqn9/KYa3clxJYVF4hlm+IBPB/7ed3sNDeIT3k8hAUfENCGGn2ksd8Kz74u
 CI2Y/u51YntrTcbgqETheZj4JGCQ5h5uDSk/9mkt+MKCBHrWoy5RBulCHMYRTAE2gGBZ
 mUhZODj1GlahX10i/t9XpYZnHP9tdHGIrjYXt8bxhC5qHqDKPWcJDlh15pS+9a7XYX7R
 ZzkDfeAn6cro0/Ug84XmDNdRKYbpyO+rwCfSsD3ZS6uutwo31A8Rlw+Hh5/HA1hP4y4u
 yHx1RLLMh891UBAIrcnJX1ud3GMYoML15JhuTnkMaab30w59yV5Ha641II4OM69sePbZ
 Yx5A==
X-Gm-Message-State: ANhLgQ0i1sTgeA59b6oZKZ35IeQ7c+ayvHpv4kj2e9aIzWie0MwG4rXL
 oEaSA7CSt+GaG5artm+L0qixCZlzLbGzseK99WAXAxbz+Pk=
X-Received: by 2002:a05:6808:8cb:: with SMTP id
 k11mr1745762oij.48.1585258543758; 
 Thu, 26 Mar 2020 14:35:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200325191830.16553-1-f4bug@amsat.org>
 <20200325191830.16553-4-f4bug@amsat.org>
In-Reply-To: <20200325191830.16553-4-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Mar 2020 21:35:32 +0000
Message-ID: <CAFEAcA_bxHKfw8Oh2A-xtyfkeYk7-vrGvmG0MCjFR7Si-ErfKQ@mail.gmail.com>
Subject: Re: [PATCH-for-5.0 03/12] hw/arm/fsl-imx: Add missing
 error-propagation code
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::232
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paul Burton <pburton@wavecomp.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /z9zXJvORLGP

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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
