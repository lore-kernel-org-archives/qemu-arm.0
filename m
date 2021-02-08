Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp1368330lfc;
        Mon, 8 Feb 2021 09:55:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyuChTXLJGP9YkRLyTAAOilSOQaEz9GAhStXUP56T81gNPjZdZL7rEhaEkASNHILx6qnxvT
X-Received: by 2002:a25:c901:: with SMTP id z1mr27588630ybf.497.1612806949121;
        Mon, 08 Feb 2021 09:55:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612806949; cv=none;
        d=google.com; s=arc-20160816;
        b=PvxvI8rfnoaHCHOP/m9wrrH7HtDVct7a5y4F5OMUTfHTsL3aIOW9Wfwbb4YNTOKwMi
         CNxOU5djZi4KrobU3yntwqZg1Pke4i7VONR8xj4QffRwHOQm6Bq+CRqWoXXluvSOAZeo
         hMTVwMdNhvTNBz7oyb/8xy5pn85qg+bxUUuZZ3vrixZZ9GyA71L1vBISpvVBCojxAXiv
         FnbWiuqR1dE0Po+xLzuLIthwOE++pGKCdQRS3oisQaiBCa7g3sJRcEEin4lQd2Jg1zon
         pDH6Gpa32qz2nWCFePjRA7d5hU+1LK5hwOV+bnALVuh6qSk/CvLCXjRXUfPLQ6pUO0tC
         vqdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=plKY2wpE4hZGbUZ6XfHjbd5l8S9jLjeBrlgWEdcjm7o=;
        b=kVbZuL4FwipBg8uD/cHyEsXX6YxQJjnYUTgTUK7U1Cabamis7h+wQ02b2iRG2RfuRt
         6b4BlfdKSBnp5pOR1hcgFyw+3qLpNNViyxmoT7TqBR04QftStkTbtwb4m4900dGK5TW6
         stBuR2DJYtWiX2SUV79NcFdjqKfzXW21eloCCLTg3OV/aZ56hT4RAO3xAGVUduDyysXn
         THUkQb0q3wJzHChcida53MBvjOYzKH2tKUpIbkDVOJzYcBn5EWg1B7ZW9fGTG2MzNEbS
         AsPfq4DxVkiHvmDwTYwseAn/EMQUSfqSg5oNbnRneUMQZgve3mSn4zsJ8MuNFO4dVqLX
         Cjow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eXi51Uum;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b97si20066637ybi.1.2021.02.08.09.55.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Feb 2021 09:55:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eXi51Uum;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l9AlI-00041n-HE
	for alex.bennee@linaro.org; Mon, 08 Feb 2021 12:55:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l96Kn-0007tq-9p
 for qemu-arm@nongnu.org; Mon, 08 Feb 2021 08:12:13 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:36614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l96KS-0007Ni-1K
 for qemu-arm@nongnu.org; Mon, 08 Feb 2021 08:12:03 -0500
Received: by mail-ej1-x62f.google.com with SMTP id lg21so24575017ejb.3
 for <qemu-arm@nongnu.org>; Mon, 08 Feb 2021 05:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=plKY2wpE4hZGbUZ6XfHjbd5l8S9jLjeBrlgWEdcjm7o=;
 b=eXi51UumDtbYUK42yAlRt5C+BIZz+IV1xfGl558Qq71WCl7KhI5oMoVWudpEDctivI
 vgsdv2W0NrPR62GkdKkZno8OmAgEXV0IuGOqPswrbtCSJNW+/Dv4XvvmpObkZd89PJ+N
 rq5PHvNRBwrP6G+1F2n4Dk0m4DOTDL7RRNq4b8djrvm8R9nmDw7k/cVhGEfHVr2ejWZt
 AHGEKOiK15Sb+a3uNBsG9LP9zJnZBiXORCY/HmEAHgo5h5BkF1+OKnvycWznB3aC/8Dw
 VHgyoCuvXlkBk9wBtcN+n9imEPX9rnaE2WZTA+EFXHdDquO1MxWnsxc54XxrxnN2/QJ+
 q2fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=plKY2wpE4hZGbUZ6XfHjbd5l8S9jLjeBrlgWEdcjm7o=;
 b=bwvmgL4jaN7AzLlfhXJHyqCOr9TWyXhPpq5WJKCsvn30FyR3cwZKXRLa+JzHuAjYJy
 vH5jraaJhur0A/u7id0kLEivCzPdJDw7qULB1j+gDCbIjhdAOkAJ8aztZqjZe2RWXJhe
 5o8jkP0mN1/4EYn3eV/pc5OVD54EKsucspwdrOPAifKOsGcSc9EjLenqS7kMTm475Wo5
 w0ZAYaDUhgpyk7M3chaoc/eIou9lqI7biUBzDfNeknf/NjKu2PpV9AH+uHW2sgFucngy
 s/OkXKozWbezrNVddAB9Shiq+g4NusU84HU6i+t6AZVVm3e0BHVX69qdhYd3HT/B96rV
 obdQ==
X-Gm-Message-State: AOAM533+PQEDxyQLiOGL/w+JZypXTRts0wHAKGt63D2pY110psZCpiun
 F0twWm5m4ScU6gIPnhj7hGKJy13c3FofWaiJ4rWxAw==
X-Received: by 2002:a17:906:b4a:: with SMTP id
 v10mr12555145ejg.382.1612789904248; 
 Mon, 08 Feb 2021 05:11:44 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA-qq-Eue+ktR1tNO7FZdtCe428=5vdA5472W-16p=d75A@mail.gmail.com>
 <20210203161340.55210-1-aaron@os.amperecomputing.com>
In-Reply-To: <20210203161340.55210-1-aaron@os.amperecomputing.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 13:11:33 +0000
Message-ID: <CAFEAcA-0KmTR4R6tWNcNwv7shAZbqNkZSkDtg7P5mSFG9vR+Xg@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Don't migrate CPUARMState.features
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Andrew Jones <drjones@redhat.com>, Juan Quintela <quintela@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vPPImiMlbnT/

On Wed, 3 Feb 2021 at 16:14, Aaron Lindsay <aaron@os.amperecomputing.com> wrote:
>
> As feature flags are added or removed, the meanings of bits in the
> `features` field can change between QEMU versions, causing migration
> failures. Additionally, migrating the field is not useful because it is
> a constant function of the CPU being used.
>
> Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/machine.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)



Applied to target-arm.next, thanks.

-- PMM
