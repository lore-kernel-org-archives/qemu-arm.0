Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp4235703lfi;
        Mon, 6 Apr 2020 10:48:03 -0700 (PDT)
X-Google-Smtp-Source: APiQypJG18TtTuXFHjgMYf4DhPiMa4sLPTDcwRsLvz6deVKtA5V1W9wjaKgHUwVsNBWOmgrC4v52
X-Received: by 2002:a0c:a2c5:: with SMTP id g63mr872382qva.114.1586195282877;
        Mon, 06 Apr 2020 10:48:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586195282; cv=none;
        d=google.com; s=arc-20160816;
        b=IjqxtvmXAOi2obM1xIDM3EdWMaxqY6iri1sQ0bJ9h7f5klLU0LTIqU24eMElEQ2Tyo
         GtWM8QUvqFcz/E4MpsemrDfjzuMlqRgxLTiiDfoNwmZkNDlXpS9Ijka4BF9C0TXxH8O8
         Q3FA+ibLKMtSC8MJMhIC2YC8xyjLdIpS3qEb0nLZX8esuA0iFYpJjsIgmS0Svw2s55Je
         Co1/L6rbiEUjg/4R4zDnNp4BbFnExWzwd1xyfTg28qPVUhtAKdju8m9srQ2N9o8h2CXJ
         afzGj+PznQGLf6KHlcJeE5DovMVKOHzGMzqW/lk4YUpL+DNhyYQkXvW0J0L+fdLP7SSn
         tqvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=BH2VYTUXcsfl/0dH3y012NaqwkbVBg2RcLAh0syExwQ=;
        b=gikvlufjFSbgaGKbN1hsHt6VfgbqIqwachdHmCL5DacG3qNUIlLJ1Npnv93mAtNpkc
         JxbCbTbvuHvmhFOVE/IMi7xr3MElUKcZxUn2s/q3CqfIY0PAyizEfkPwqmYC3GckEupj
         ui17UfcLK6hmuPg4A8zArVzb87HB40LnI7aBjIRnkHio0HJ3s7mDhOedpZPnFfFiX0aJ
         XZhYyKXyrfhfethdWApxXkygD6Gd09FG8KZOMPBOuyFECgSLM1prbphD/GGrMfT3M3Fr
         6BU4mGawZM+m4Ss0YNeAC8y9xJJbppLOiwi4clk3ld4D50lugzMA7UUbsiuz/x6CcAJP
         ymNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="U/EifyN5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o21si194546qtl.201.2020.04.06.10.48.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Apr 2020 10:48:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="U/EifyN5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jLVqs-0001KC-Ad
	for alex.bennee@linaro.org; Mon, 06 Apr 2020 13:48:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35601)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jLVqD-00015K-Cv
 for qemu-arm@nongnu.org; Mon, 06 Apr 2020 13:47:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jLVq4-0000aQ-OK
 for qemu-arm@nongnu.org; Mon, 06 Apr 2020 13:47:15 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:57848
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jLVq4-0000Yo-GH
 for qemu-arm@nongnu.org; Mon, 06 Apr 2020 13:47:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586195231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BH2VYTUXcsfl/0dH3y012NaqwkbVBg2RcLAh0syExwQ=;
 b=U/EifyN5xUgZtW3pu9AHEWZqdi5Xv9yq4iKCiaC/W9powd7XiruDGSRhGsMgp3sTJdv41Q
 OufbWToPVS8UEHy9iQc+K3+P2YALK/uPZGFgYP8hFMXO6TXwiaJvBJ6kuo9hPTGbAElew8
 ksqq92WB2ESa97rfi1PQWh6G8FTUgns=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-Tht1hExuNwSFpKHzHN3zDw-1; Mon, 06 Apr 2020 13:47:07 -0400
X-MC-Unique: Tht1hExuNwSFpKHzHN3zDw-1
Received: by mail-wm1-f69.google.com with SMTP id r8so44509wmn.1
 for <qemu-arm@nongnu.org>; Mon, 06 Apr 2020 10:47:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YKe0BgM0CmuS/l7Co2UJ4kTaHPz04qaQEvypXhdFiFE=;
 b=ua3kMdcOJ6XXYb8qmb2gY5SwewXwSCxSBW0xTClxifPUdGxaFQ6ShELs3PIwb2dgp1
 Zj0NEV4rBKxcDMh8ImNaheozSFy19AmZfC+kwlqG0Gp3cOut5dh/swtkKlCVC4A1fiuv
 Fp8wK1Dv+ls5xNouNGeln62nM16cB+vvp0vlFfi4dWpJzXS7NJnYv6Y+fgyIB31wbvbQ
 jSxPU+jhd0gVVUgfq5w3uBc0J0AmH/hQ7AwWlRKSqbV3Yjpicc39mkNYSAfUS5oB2VYL
 EfjvQMkO8CmS0Z0z6wx9n3rtYjcawmTgOCgE0Km9jmWqmFEmHCsE9GFj+2SrEmzataqr
 56nQ==
X-Gm-Message-State: AGi0PubI9nEiHk0h9PVl109LAdq+LfpsvgcrC6OlaLTXB7xcaBnLRbuU
 RRxQUve7QuUnvJ9OOdnHBC3hrK3CXqqTKRWHPc+fFNT+0OErHAm7xNXtpN2rbULvT6MDAxhC0WP
 rK9fCEzeEeTdG
X-Received: by 2002:a1c:dc0a:: with SMTP id t10mr454865wmg.113.1586195226075; 
 Mon, 06 Apr 2020 10:47:06 -0700 (PDT)
X-Received: by 2002:a1c:dc0a:: with SMTP id t10mr454814wmg.113.1586195225719; 
 Mon, 06 Apr 2020 10:47:05 -0700 (PDT)
Received: from [192.168.1.39] (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id o67sm398413wmo.5.2020.04.06.10.47.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Apr 2020 10:47:04 -0700 (PDT)
Subject: Re: [PATCH-for-5.0 00/12] hw: Add missing error-propagation code
To: Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20200325191830.16553-1-f4bug@amsat.org>
 <CAAdtpL7rC1u=B-xW+ZbrRbpSMKvGx0kq_hug1J9-cxx6NgJR1Q@mail.gmail.com>
 <20200330092127.GE73285@stefanha-x1.localdomain>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <22fd27d1-6d22-c91d-716f-6518a062dd21@redhat.com>
Date: Mon, 6 Apr 2020 19:47:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200330092127.GE73285@stefanha-x1.localdomain>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm <qemu-arm@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 "qemu-ppc@nongnu.org list:PowerPC" <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f+1388+urMvO

On 3/30/20 11:21 AM, Stefan Hajnoczi wrote:
> On Wed, Mar 25, 2020 at 08:20:49PM +0100, Philippe Mathieu-Daud=E9 wrote:
>> On Wed, Mar 25, 2020 at 8:18 PM Philippe Mathieu-Daud=E9 <f4bug@amsat.or=
g> wrote:
>>>
>>> This series is inspired of Peter fix:
>>> "hw/arm/xlnx-zynqmp.c: fix some error-handling code"
>>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg691636.html
>>>
>>> Add a cocci script to fix the other places.
>>>
>>> Based-on: <20200324134947.15384-1-peter.maydell@linaro.org>
>>>
>>> Philippe Mathieu-Daud=3DC3=3DA9 (12):
>>
>> Hmm is that a git-publish bug?
>=20
> Please run git-publish once more on the same branch and inspect the
> $TMPDIR/0000-cover-letter.patch email in an editor when git-publish
> prints "Stopping so you can inspect the patch emails:".
>=20
> It would be interesting to see how your name is formatted, as well as
> the MIME Content-Type and Content-Transfer-Encoding headers.

Content-Type: text/plain; charset=3D"utf-8"

Content-Transfer-Encoding: quoted-printable


Philippe Mathieu-Daud=3DC3=3DA9 (12):


>=20
> This information can be compared to the final email sent to the list
> and/or received by the mailing list.
>=20
> Stefan
>=20

