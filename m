Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4293806lfm;
        Tue, 25 May 2021 02:11:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGMUsUQxzG5ZM/QhNJoQ2LGHPhVJbdbeYh9Y3jQ90z2uJqRcxI8HgQZAJ7DlvA4JXaQMP/
X-Received: by 2002:a25:8885:: with SMTP id d5mr39080040ybl.75.1621933902200;
        Tue, 25 May 2021 02:11:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621933902; cv=none;
        d=google.com; s=arc-20160816;
        b=Ku9oQhWIZ4mF853gq51cPixChFhknHwLx5a86vUicft6PrCqBwWVyCkUjbmwpkrC/z
         4W9ifvhTLqXocstZdfBw5xl6Ad5dTVG85vfBGLJT3p/Cspk+FawxvdXIdcQNmS0PwuCQ
         tZHNVHqZPk4qRUZP/WvjdXKprfa9yaQ553ySRSX51AsjLM9FxGaSaNCffzRoK+z7j1pE
         Gr/srFU7q6Sesq9JJRUu3DGNFx4q9I4LcX8SvVkjKxClN22WqZBWaJl7HET+yuychQlW
         r4oE+Op8YsLjjplgmxIHkwY6wZyB/DmwWGGNFboK84XS2fxyb4lTTHFuzAPH5X/NmuS1
         wOpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=7soc/hBSe8lOJQvadw6e3JbNcCOouv6LPLVmunyO3nE=;
        b=cBDAiGZ5VFLIdhArx0/5/0vNWqShISazz1xRMicbjEwMeXT58gxv/MkE/nzYTR9WA1
         WNS/fqp4NQK5dilF+P15iQz3Oaj4Opw3inBv0uqybhD/kGN7unYWlzl5lm2zue/nKlQX
         oYhBmibbs3Fhcwzrzn096lO+Hiwg0QWOx2HWfvjdUpsVZYQTzafYQp6nyU/bOOHIrVe7
         w5Gfe2lYU9q6EAsyUHnIaKBzZLuamB6WrXIeOmjh4L669seJLv543xJyxAaSKzniecZj
         epQ8e4N2o6Arp/W7EP+sYwzmj8Er0k0vzoA8g4mWRluWiK/9x4qfAJwICHhCNqlTZutH
         Wthw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xCV9Z5uo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s5si17485536ybu.75.2021.05.25.02.11.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 May 2021 02:11:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xCV9Z5uo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llT6D-0002s3-KX
	for alex.bennee@linaro.org; Tue, 25 May 2021 05:11:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llT66-0002rl-GS
 for qemu-arm@nongnu.org; Tue, 25 May 2021 05:11:34 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:36519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llT64-0002Py-HF
 for qemu-arm@nongnu.org; Tue, 25 May 2021 05:11:33 -0400
Received: by mail-ej1-x62c.google.com with SMTP id c20so46219257ejm.3
 for <qemu-arm@nongnu.org>; Tue, 25 May 2021 02:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7soc/hBSe8lOJQvadw6e3JbNcCOouv6LPLVmunyO3nE=;
 b=xCV9Z5uoIhPEppKRDqVOajsJVmrF6Qj20VulEyyFeShujI17eTaxG0MNnRLsoSlEai
 zsLqRw+N3MpiQvnxoC0uCLM8aoy8jZKXy04kpyHLXh/edptkNJfa5nMrlJ7qwaYknlAk
 R+RI9aUqDKsqon+UYkA92avGTVTavCC9ruXqcQKQIlsbrAOe0e1DHFk/ZvB8EzXAKzjk
 X+LnG6/2S04QxUjehNcXoMvqUNjXmLBXmd42gPXv5yB6zano4X4w1bUNtVI+a+PQ1Aee
 M/5noWALOnWVhQ9aP858opTS5HS1NFaOwnxYfnBi0nD1qDchko3Fg4CmDyJRli2YSZGi
 Xpxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7soc/hBSe8lOJQvadw6e3JbNcCOouv6LPLVmunyO3nE=;
 b=omzWtT5YBZjnER3aqT9O5ZxP/14yC8t5+FUkmvctnmisNLLZHATnWfB+V8/hcOIXfg
 JLFnKVfRZNIc8wPdut77FtlQJXkjscEEHB1e0gdDxmc09R8COufOyXe3qTDVkkxAJLRg
 G2BIIewO+UfbjwF/VYZyC0ZFpjeQoKl7PVt4dtxWCUxhWVDYAymiRqZ8b+mfKg/69tBU
 nxmE8GzrzlA7t1xG5IJz0BaeHpfm2SrhzZUje6wPsY0EOE4pG7Sva6j9HYn3IMGTQhoE
 fCD7/8z7P31JRh6JUjJd+mb9Lox7TYS93Jxj/ud8IsKRlMdHY1+RKNkYeK85ypDupuQD
 eT7w==
X-Gm-Message-State: AOAM532QUe6VIWGnD4cOEd2z2Ff4zUKY5vFLfavJ725OXpxDqCOxV64z
 wm6qpY/wEINKeqlZr58u1Mp7TDyHterj3N13sl/8oQ==
X-Received: by 2002:a17:906:9bd6:: with SMTP id
 de22mr27244033ejc.382.1621933890817; 
 Tue, 25 May 2021 02:11:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210516171023.510778-1-f4bug@amsat.org>
 <51541937-e1af-6c8b-c434-80918c2a5d9d@amsat.org>
In-Reply-To: <51541937-e1af-6c8b-c434-80918c2a5d9d@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 May 2021 10:11:07 +0100
Message-ID: <CAFEAcA9m_OQ-Mo=BH3fVY5ewE+_Hp3eHWKm+hj7Ug6jYB8WDWw@mail.gmail.com>
Subject: Re: [PATCH v2] disas/libvixl: Protect C system header for C++ compiler
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iPViMzyJ57te

On Tue, 25 May 2021 at 08:47, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Hi Peter, since libvixl is mostly used by the Aarch64 target,
> can you take this patch via your ARM tree? (Thomas reviewed
> it).



Applied to target-arm.next, thanks.

-- PMM
