Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp848792wrs;
        Fri, 23 Aug 2019 10:28:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqydsoZhXIRAFUUun6OnxoPomuKxkQo6JPyZDFlxe1dWlm53flOGdzse1Fvk8EA9ercX6viR
X-Received: by 2002:a37:9c81:: with SMTP id f123mr5086061qke.135.1566581309618;
        Fri, 23 Aug 2019 10:28:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566581309; cv=none;
        d=google.com; s=arc-20160816;
        b=OsvKceWU+2oMBRh9PSrIWqFD8Jij+QOSo3KzDGn5jucxDYrtEd400wJeGC8NxkJvzg
         fOcOYZX408QmUNvx8vVfvkz9G7gMoi1+sWyYb29h5LXMRL8CDHc9gWuQoSiPGTR7XbH7
         r8IShM39Pr5Erc7b0xPlk5A8vzaHBcwgDMDAIPPJ4jf2W3YjHto2Z+CIO8BF4sRvwPUv
         WzS3N/PoInYtwoeII+caoNYGWquKWA7FwcHIrP2m/+r22aBnfXgl0kbLA8c9+mc8LmT8
         jvOwj8drdCO/CMb/Rik7EX+BBZp0qrvX64ss2VDJRnLeYeUVFlKaeJY6ZxbTlPN7/h9C
         9PoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3dfMnY5H/E4kd9IZGpBeIvZ/0GZqXikgjlWRAbBSdwA=;
        b=Nb9W4z81jCPsjsIkw1/LUa8CdU1wszCC+6uNAQGlRoX+uXiDk4Tqh0GfvOZjxhQQxm
         7bXQpGr8SmKBD8CZEsmkTMN7tPVTx2G+GEW824gh+eH2xcrXZ4bfxp0l5jT9vPmPlEwu
         kxDguBwJo4sNOKsozZsX3AHkMaLNwuolGyO81apdKtq2QYRMUIQpEmsePwQXnnsrmRyf
         OdUfctZxsrR+b2E7ld9Qfq9b4nu1S5G836uRV+9jpw6yqSPxwgsUgNK7Y3Xwseb8pGZS
         0Jv1UpwfKL5U2NsbBTf7+Xl3ONGWAV+tUME66R4Dq8GHPSx8rBeuRmzby1NHyuCHK6jZ
         A5nw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FGikniVl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s77si2214577qke.29.2019.08.23.10.28.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 10:28:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FGikniVl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i1DMR-0003DF-MI
	for alex.bennee@linaro.org; Fri, 23 Aug 2019 13:28:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58110)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i1DLo-0003CH-Ri
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 13:27:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i1DLn-0004JU-EU
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 13:27:48 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:45117)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i1DLn-0004J0-8V
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 13:27:47 -0400
Received: by mail-ot1-x343.google.com with SMTP id m24so9426243otp.12
 for <qemu-arm@nongnu.org>; Fri, 23 Aug 2019 10:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3dfMnY5H/E4kd9IZGpBeIvZ/0GZqXikgjlWRAbBSdwA=;
 b=FGikniVlnkp8Ows/k98bDWZmspG26OwuwTaUO22GwlUujQuKUFN7sLLRz5KmYRb/cw
 lWGIcMAnDlG9d/u9j8aXQrgNXKSIH7sSYkdbJz1y5sZGr8QU4oYSXx50zSuqXpZCNA9A
 gCipyNM5j+ZRUb376M0mxrQtoHgil1PCSd2rGWWWlXs3uSxqAoBdX5zO8/jqlCXv7spn
 IOZr8pYjZ/tYNO01z8CI8+keODNGWXpDw+mM/cYl46hPurLZM7sRb+N3JjKtQqwP82g/
 JmB7Hmo+JjUtzIFfMrf2nIFHNm5WCXzfpIDvmMuFNKPi9vNpoVLEe1yOweWeuBcDyeKZ
 +xOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3dfMnY5H/E4kd9IZGpBeIvZ/0GZqXikgjlWRAbBSdwA=;
 b=G9t2RFP+iRJq/wcnhXMGclJAi6ustChEje8Sv2MluV4uN4QSotlG1EE5uNzY3J3Do5
 5+CWrFkjdgo6/2VhJuNwA9LijnxDUjATdGwKmf8NWIQSyobwVjr5t7ogNbC6SZZ5ln9o
 nYJsDsfRNQZ4fSaXDYoNj2FFQo+JE1l3UC04UiFvxe032Wm6oBHF+ZriRPmqKfmHN5Xj
 Q0ku+FahKrIGqW9ihhklKUPlAs5zFX3lXzDB+3FWVH1W2UKB/UBQlJkjzs8nai45bS2t
 Cac27FudeFjqEfydCV7zmx7sTaYeOn2df+yXOYP5v5gUAwq0WjE8nmC6U6d+ZsTPxxha
 shYw==
X-Gm-Message-State: APjAAAVum7LbZOtCqFmsx5sv7PFihne0KYnan/BNGHWZhORMG18iJHiN
 o8mviTgdtcvYHiwoC895/C4DYmAlP6xKkXROyejUaQ==
X-Received: by 2002:a9d:4817:: with SMTP id c23mr2187627otf.97.1566581265390; 
 Fri, 23 Aug 2019 10:27:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-28-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-28-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Aug 2019 18:27:34 +0100
Message-ID: <CAFEAcA9ngP_C_BWKdsovom+Ary2Cq507_DZB+2GCZwdp3QvA6g@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [PATCH v2 27/68] target/arm: Convert LDM, STM
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
X-TUID: 3Mk+FpxbrNGm

On Mon, 19 Aug 2019 at 22:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This includes a minor bug fix to LDM (user), which requires
> bit 21 to be 0, which means no writeback.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
