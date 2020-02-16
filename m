Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4350086lfp;
        Sun, 16 Feb 2020 12:49:48 -0800 (PST)
X-Google-Smtp-Source: APXvYqypnyam96ZaytFABNHdSCc+Wqn/fd5DW7HGpcTQaeDHTJnF7A57JdpkPAOtVjDxoMv9+fj+
X-Received: by 2002:ac8:176f:: with SMTP id u44mr10657063qtk.379.1581886188231;
        Sun, 16 Feb 2020 12:49:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581886188; cv=none;
        d=google.com; s=arc-20160816;
        b=Omiwu2i3kwFG+pGreGW8lZmVuLb9dm3MWS+2YC5Nas6dxHEOTgxk955rvVgrNjnPGl
         mk/tDU2k6QLx0dtdN3PRq5QHJmY1bmErah4yXbyTGrxnPi2Cp4GrzfbQop9k5quJpt50
         bXBx/kd2mrKxVs19ubDFPNZSP0ARL5UlQ96eZRYF+hVeaHHFKYqzv2Lxs0tVepQ0pHMY
         6SUJSRyJ9+9pO3gv+k6EEwIz8uZgflSBs2NQ6Xn+YGM9Zh9oq1HXfo67bT3qPxFBJ/1K
         ccyfkcQuJPbe72FD9aSwJAiM8dmek6oKLxzBXVQAPKb8gLIJqL9LoFINSAPMeYLoSOxu
         BKfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=14QYsuapzbDaPwF+vtYMIhYK6HSjTpn5v3qbb5kuPmQ=;
        b=eQtPrfEETO1oDOZwIAMHGKcolbq2Sxt3SMYs0ckTybCn9r0y46i2bpUvoXRfa/Cn8N
         C+yNnwt0SnUpvtQCZC3olixQRXNHprGrsoc2rYW13XKS3N696SA94orPqO12VHtRg+dJ
         WWqtlVBbiKKzIYEJHfaTPtoffcw5fyMXcwLmqK610kHXw7pEm/RUIn20BhDVdmUBI3QE
         HKZQqhEwWbrjC0qXgp3BFmCzzMk+2Pfku1ljO5V7zstgmQcQ7iFIRDAUIPD0lkHaUu+Y
         tocbmevAeE+RjhW3A2hG5vbQqQYO7OaDIjmixMTl/Peex8q6wiZbSaSHuS5PWUZ0ganD
         mlIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lUYcd7tK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 89si5636820qta.317.2020.02.16.12.49.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 Feb 2020 12:49:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lUYcd7tK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3QrL-0000ca-Mg
	for alex.bennee@linaro.org; Sun, 16 Feb 2020 15:49:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41809)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j3QrC-0000aw-Ru
 for qemu-arm@nongnu.org; Sun, 16 Feb 2020 15:49:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j3QrB-0002SQ-MD
 for qemu-arm@nongnu.org; Sun, 16 Feb 2020 15:49:38 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:38160)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j3QrB-0002RB-IF
 for qemu-arm@nongnu.org; Sun, 16 Feb 2020 15:49:37 -0500
Received: by mail-ot1-x341.google.com with SMTP id z9so14162680oth.5
 for <qemu-arm@nongnu.org>; Sun, 16 Feb 2020 12:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=14QYsuapzbDaPwF+vtYMIhYK6HSjTpn5v3qbb5kuPmQ=;
 b=lUYcd7tKHnMnPkYv3KqcIs65fQvfwi/24hctUKwYjo4C7flZw9FDmOQoiUvLJLLVoq
 YIGIjpA+fPt8CsKIUZ1joe34kSqYlvcsYq/HbtgIZ8cLF5nR4O5dNiCXbuiyGmWJmbGx
 sRpjNdQoYsTpiDB95iTSgQl75UENCEHwEmJc7X+fFkiqGTSUXUubICGVIdgk5842WUMs
 cJSoVGe61wHK+OkuozKZ5Fg7As6Jl2v/G69yyMEnVRoRfjEMudjL9A6QvnU67idKtGyB
 EtRaeh23tIgWxaZ6IW7EPtamIFjdaYaSDTTCgT6JscCDhHlfl8gj84T9nAkilKWRsG90
 0XLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=14QYsuapzbDaPwF+vtYMIhYK6HSjTpn5v3qbb5kuPmQ=;
 b=BiusS+9/vqUs77Yb3kR4yRrHrKPV0bgZdFJ+jh/gewOIBrdMPCHSW+GQ9WOyjWedj7
 h/C5uqcBCutz/14KxV21MtaszuTzwQDPaAQEaY22t7IrzEPHuMcuy2nV+XyI9dJ576S1
 KhOVFOm2FPRfG2bFGb/WUCwyWnEHAG0R5ZbW73BzoQJf9SL2vVESvbMD7bkECyOVaV+c
 obiCRgGP7C6naHU+QsByHFGJJSL7xyq6Jx66NhsaKsw43Q8alXcsOWM5Gkp3TTI2+zbn
 ls48aUbve+HHrKx5wLRxteQlW5fulaz6pNRzmKn5Z4GMGyikjiPMcYax1L2RNU/X60tN
 mskQ==
X-Gm-Message-State: APjAAAVzLyr1QCZtg8PSOEl5Zf1W3BiMfQLRaytZlFlmMn1eWuQqCOEM
 q/fAQSocWRexXIG61DQG7Anvb+oDWMs+oCZaXq9pOQ==
X-Received: by 2002:a05:6830:184:: with SMTP id
 q4mr10032085ota.232.1581886176266; 
 Sun, 16 Feb 2020 12:49:36 -0800 (PST)
MIME-Version: 1.0
References: <20200216194343.21331-1-richard.henderson@linaro.org>
 <20200216194343.21331-2-richard.henderson@linaro.org>
In-Reply-To: <20200216194343.21331-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 16 Feb 2020 20:49:25 +0000
Message-ID: <CAFEAcA9zuhhUa5YFn=TKX45H60x664xs4gjkFsPOk50MaSnnZg@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] target/arm: Use bit 55 explicitly for pauth
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: I7tT3qqbWqYa

On Sun, 16 Feb 2020 at 19:43, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The psuedocode in aarch64/functions/pac/auth/Auth and
> aarch64/functions/pac/strip/Strip always uses bit 55 for
> extfield and do not consider if the current regime has 2 ranges.
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/pauth_helper.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

('pseudocode', but I'll fix the typo when I apply it if
it doesn't need a respin for some other reason)

thanks
-- PMM
