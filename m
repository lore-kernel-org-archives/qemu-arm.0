Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3863020lft;
        Tue, 5 Jul 2022 04:23:32 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vpb+STo1KD9bncRy8OPDYzv9V8K2bccj0sb5MfRcOed+r47pAG/n5Fq9eJ7dsdQmKtC0Qn
X-Received: by 2002:a5b:489:0:b0:655:be22:4757 with SMTP id n9-20020a5b0489000000b00655be224757mr35929045ybp.92.1657020212092;
        Tue, 05 Jul 2022 04:23:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657020212; cv=none;
        d=google.com; s=arc-20160816;
        b=RO10VcM5TyJkEX5rrtZHS5+8CZNK4f5cGdCG0GuOFILaM56Jnxx9spfQuIkUtm/mxH
         bdzLw7vQO45JSIZux7oaDGX4PQBZNk0JWhvPBl2zt3cNsMPwF9XogHyQKq7sgj5aLNsX
         P3lQV1kB1sGKbEVfJe8QjwYp58JFmFqJL5OO1Te137d220FvoNwUNjc6H2NkbmsrEYBT
         ILtZG5wj4GfwcVDw/FhftSllX583WqrIT8XsSMUkBPT7Tg8MPDY8Wcqk+PPNgrMyldx7
         y0BWoWrippgbMUVU8ozgYWnUTv1FpEBnTcnIWMCX73T6VNCzUmovusREvYOscld5xLNS
         iyIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=3n3B3N4N3LhDjXPTbBXgy2ADSpXAlZ3UdK/+UO7BDJQ=;
        b=d9OeelN2XOlpiK5OROLUM3vkyrKWTFpmArxeclnMpsITaXspFslKLG+b57kBoY2BbJ
         Xa4MmE9vmw2ZnC3qWQSRyNSHao0wAu2AB/YMZUs8Yugd+IaF/q7Fx+uDa5PVLh5V/G66
         OEW/bCQhTdCOI3TU8SbUVMXDL4tSMpLmFlo76exYlqL88//Xzs0Nsw6TSqWck0vVe3WM
         7uSKbEqwkyt11eXsAvIPaQh8lBS0z3pHFpW90B1u65dYTDlZ3O9YuwPK4TIju+goxU3U
         fEE5vkflezDvcZwlE3PVOSj5ZLlB8upHZOcRjY3o/g8F15IE6NCA3gwyUnJKoWQbR4bZ
         muvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V3gU8YhI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bc30-20020a05690c001e00b003177ec8d1d8si57314046ywb.331.2022.07.05.04.23.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Jul 2022 04:23:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V3gU8YhI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8geR-0007D5-G2
	for alex.bennee@linaro.org; Tue, 05 Jul 2022 07:23:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8gct-0005B7-1i
 for qemu-arm@nongnu.org; Tue, 05 Jul 2022 07:21:55 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:54894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8gcr-00059r-2x
 for qemu-arm@nongnu.org; Tue, 05 Jul 2022 07:21:54 -0400
Received: by mail-pj1-x102c.google.com with SMTP id s21so7308637pjq.4
 for <qemu-arm@nongnu.org>; Tue, 05 Jul 2022 04:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3n3B3N4N3LhDjXPTbBXgy2ADSpXAlZ3UdK/+UO7BDJQ=;
 b=V3gU8YhImQnupRFiPBdN36sfLAQ1hy+MxxLWRJi0IabfhCKBNq/Xs1zs4HRAVKjTn7
 psOdf68ThNVafjyB2RURdRE89dGPxAnR8CdXvYSEHf8s31K0KCD2b+uAhn8Tor0S9jQJ
 X4R6gp58AvEyBLXOvJ7BmEInp7btvxqahEXCy76t9A15efoO0qc/Q29aC0ObDnf3imMQ
 5uuPUCT2FbH3eRGMAPJxQAp1qIny0ZNqI1PdUkiMPOkIRqGh/s4vakHK2kNaSmV5YFBr
 waz35Ou6a7Sm96G8ZgrQb6/UjQ2Pbd1y+XDP9uOoGOKho/J+Hki8UDnG29c6mhYcCXDh
 xofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3n3B3N4N3LhDjXPTbBXgy2ADSpXAlZ3UdK/+UO7BDJQ=;
 b=JllBrZ4fYILKSf5t2G62UAYS2cPQJPxdaCkLswuyZmL5i/k8gbPJDzI4MyQCiw2Nv9
 DvjKyKTRcJLF61Co9iYRJjhtDZUswwfnHP4pJWn/WEGBY3L5RCi26XEDvc2NdXNcV9OC
 SjfSlEGPEStL6eJ+1K8jbhztBM9AcNgKIg2gwluz/QX2HmDGGiduydfKzT15Gfpf6JAy
 XOMzGUkYHOl3F9DjzOunQV4FhOVP9vFh7UCrSGha3HY9ux4GsvfCXlT85pXiMHhzKc8r
 LM2Tk3ZEqHOmWR03Q3HrYzhMU33icc/xsdS/BKPxU75WUyK4h8Mz6FMYb3H2WqXYCedy
 OuVQ==
X-Gm-Message-State: AJIora8SwCn5ZBHGaDY4dhi/vJhK65L9hG8neTu/r3U/jHQW6xPQApOi
 j6Oj6j6Zh8QuR1Q7pXIFkPSpFw==
X-Received: by 2002:a17:903:22c7:b0:16b:fa15:63d4 with SMTP id
 y7-20020a17090322c700b0016bfa1563d4mr58411plg.2.1657020111515; 
 Tue, 05 Jul 2022 04:21:51 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 cn13-20020a056a00340d00b0051c6613b5basm22528521pfb.134.2022.07.05.04.21.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jul 2022 04:21:50 -0700 (PDT)
Message-ID: <8d856268-551e-e53e-2f2a-b226374e0da5@linaro.org>
Date: Tue, 5 Jul 2022 16:51:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 20/45] target/arm: Implement SME LD1, ST1
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-21-richard.henderson@linaro.org>
 <CAFEAcA_qDAR9YmXdZ0wuVVkaBeV3ArGzknjLkU=BqJn7hBAbjw@mail.gmail.com>
 <52d072c4-b6e7-c413-b15e-3aae358b4b00@linaro.org>
 <CAFEAcA-p_-vK6rNdc5yZ0bK5+RodDG_VOQVP=Y1U8ZS=OEBUpg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-p_-vK6rNdc5yZ0bK5+RodDG_VOQVP=Y1U8ZS=OEBUpg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5MRh2euBZVvU

On 7/5/22 16:18, Peter Maydell wrote:
> Ah yes, I see how this works. I wonder if there's some way we
> can abstract out this sort of index calculation into a macro
> or function so that we can comment what it's doing there and
> then all the use-sites are more "obviously correct". Perhaps:
> 
> /*
>   * When considering the ZA storage as an array of elements of
>   * type T, the index within that array of the Nth element of
>   * a vertical slice of a tile can be calculated like this,
>   * regardless of the size of type T. This is because the tiles
>   * are interleaved, so if type T is size N bytes then row 1 of
>   * the tile is N rows away from row 0. The division by N to
>   * convert a byte offset into an array index and the multiplication
>   * by N to convert from vslice-index-within-the-tile to
>   * the index within the ZA storage cancel out.
>   */
> #define tile_vslice_index(i) ((i) * sizeof(ARMVectorReg))
> 
> /*
>   * When doing byte arithmetic on the ZA storage, the element
>   * byteoff bytes away in a tile vertical slice is always this
>   * many bytes away in the ZA storage, regardless of the
>   * size of the tile element, assuming that byteoff is a multiple
>   * of the element size. Again this is because of the interleaving
>   * of the tiles. For instance if we have 1 byte per element then
>   * each row of the ZA storage has one byte of the vslice data,
>   * and (counting from 0) byte 8 goes in row 8 of the storage
>   * at offset (8 * row-size-in-bytes).
>   * If we have 8 bytes per element then each row of the ZA storage
>   * has 8 bytes of the data, but there are 8 interleaved tiles and
>   * so byte 8 of the data goes into row 1 of the tile,
>   * which is again row 8 of the storage, so the offset is still
>   * (8 * row-size-in-bytes). Similarly for other element sizes.
>   */
> #define tile_vslice_offset(byteoff) ((byteoff) * sizeof(ARMVectorReg))
> 
> (or use functions if you like. Maybe we want versions that
> take (row,col) arguments too.)

That seems reasonable.  I'll work this into v5.


r~
