Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp850685wrs;
        Fri, 23 Aug 2019 10:30:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw/IFH9YtkI9kuOPfdkV6W8pplHntt31N00gagGiFSmZql3sOlb98J8t+U0O6A9EoE0+BKQ
X-Received: by 2002:a37:a58f:: with SMTP id o137mr5269414qke.84.1566581416230;
        Fri, 23 Aug 2019 10:30:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566581416; cv=none;
        d=google.com; s=arc-20160816;
        b=Tek/lTTpwWj7z/2cojAANe6hbaOS588LWRIaJC0GNvyPuhO6FbO7N1S2oaTIIanN59
         nGFFgrkDeCrTUqf+xmxWcsSPKMOeoZ78zrm/xMZaXl/vB2DtAdVqMyCF3fJsA0UcZuF8
         0b/xFhlJl6KcNp1rx3IWWdcq8didQgT2J5uRAWmi9MoNpBcRq1f9k6Iepmhcpm+FKHCt
         O/uxmodsf/M0Xc6vgVEicsdJQHRmZfiYvWzlAHJlDuZU1q9HkXW0rAte7Y4aNVgHUEg9
         rKIiy112OlsSEW9C04/wFPcRNDy3fDmX1y+YSS9iqgxxYNNyBJTALakeTo1qbuhyfGJd
         Qs+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VUD8n7OC2ux8NyoIT2qOnbI/PPMDtdmpdrWexT6wtgM=;
        b=M1tFvxIeSlXNgzQ0Ncwq/BbLMLcPZrQdiSdr0TQdoqPVvp5tdNt8rDsEvN3iUqyVv2
         P0+cFwqWiCbx2T7bNsd64t6BKzL3hsr7i57AnGyb8Kc5fieiU0h5eAHjVP+eLdiK6hA4
         paiCXFnJF/OWVGMt0Ax//jelTJhT8WWpKNtmydCm5ZnvAsSGpn/yIGq2PZAb4qMiv716
         rSVRHh43ldIhU0ktrSOOtdMI1wbbtwZLzm261kNBlaBcqZpWXzNTBMj/CheEV2yV4OYg
         KNXAlpP6M8a8qR9Ugiw22f1sygC8k4vUb7vFwPPK5WwHqBd0Tq0WloWO1HdBXgRZp+6K
         wmpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uX1cX9Sh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c12si2493013qvc.67.2019.08.23.10.30.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 10:30:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uX1cX9Sh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i1DOB-0005R7-7s
	for alex.bennee@linaro.org; Fri, 23 Aug 2019 13:30:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58482)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i1DNN-0004m5-46
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 13:29:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i1DNM-0004vK-1m
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 13:29:25 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:46829)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i1DNL-0004vB-U2
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 13:29:24 -0400
Received: by mail-ot1-x343.google.com with SMTP id z17so9411265otk.13
 for <qemu-arm@nongnu.org>; Fri, 23 Aug 2019 10:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VUD8n7OC2ux8NyoIT2qOnbI/PPMDtdmpdrWexT6wtgM=;
 b=uX1cX9ShaFw5VPyeSU95W9yV4/r815qnbjKy3rjkqYb/hQviv6ZK3L3lJ15BnTbPSK
 AWinjNkEDFUIaTOMCN/8ZAr3LLdgAo1IGgGXsza+MQtnGg2lHnsRaKKBR59GMgglmLLx
 5uQ5BwraHAX/sVJ4SH/Ivewpwcfv+ZsmhUQpSFcL3Mx59ux4kBR8fMn/mt0VcBOSrgL6
 bRGPvdJjtig6CuGhfldbcQyheAms8ccufJJIiBJchHPRNCeNjqp5SsL4TL8+9l3x/d0/
 +OTKZo0gD8p2slEzJ3gZ26bhzgqjDFxetH3KOY+qr8v6iGeYYwsg6uJZ4JhZlDCyG8b8
 Qtog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VUD8n7OC2ux8NyoIT2qOnbI/PPMDtdmpdrWexT6wtgM=;
 b=MF73ApXeiXrcXXBUW1JmhukVBK0x0/fNxsB9N5WzWWic2es/CoZsKI3UazQwkvN69E
 JWghFLFSvZmH7/MmW0Uic2wNRTxcyUxfDkuHFmo2q87kly+kyJvmY03W7G3wY6gWinaz
 l/bBa2Qo+avlJ1u2WprRp8Qq7HSaNZFhucFcUShxQ9w69fAbx3dWfDmgX+4SRIMvf78E
 Tjh7CQPcCux3MsztchZoZFeOSBOZLqH+DlLuwlaBXvSxdHfBwkg14sAjxJPnO/f7126C
 /NkF+8eyMspNv9nX1DlaI1ppRxGLqwMGBzdk1uYKgDSHsVvofQYAx84djtkmF0I3sSPc
 iOfw==
X-Gm-Message-State: APjAAAXO3C1XuTPEHJ/yiTLkOFE4ZMZEENJP+vaHwZOrwqvlcNQDoncs
 0HIj2rmU5eokrFBSzbYVbGfEoT/kN1EPLQHsAgeqdw==
X-Received: by 2002:a05:6830:2103:: with SMTP id
 i3mr5211671otc.135.1566581361646; 
 Fri, 23 Aug 2019 10:29:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-29-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-29-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Aug 2019 18:29:10 +0100
Message-ID: <CAFEAcA80UB-0R14raqoFF=1MDMVAR=PVfE2CPzg6U1YWwhBQHA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [PATCH v2 28/68] target/arm: Diagnose writeback
 register in list for LDM for v7
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
X-TUID: rp4oQr3DoEVL

On Mon, 19 Aug 2019 at 22:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Prior to v7, for the A32 encoding, this operation wrote an UNKNOWN
> value back to the base register.  Starting in v7 this is UNPREDICTABLE.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 4451adbb97..29e2eae441 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -9880,6 +9880,14 @@ static bool do_ldm(DisasContext *s, arg_ldst_block *a)
>
>  static bool trans_LDM_a32(DisasContext *s, arg_ldst_block *a)
>  {
> +    /*
> +     * Writeback register in register list is UNPREDICATABLE

Typo: UNPREDICTABLE

> +     * for ArchVersion() >= 7.  Prior to v7, A32 would write
> +     * an UNKNOWN value to the base register.
> +     */
> +    if (ENABLE_ARCH_7 && a->w && (a->list & (1 << a->rn))) {
> +        return false;
> +    }
>      return do_ldm(s, a);
>  }

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
