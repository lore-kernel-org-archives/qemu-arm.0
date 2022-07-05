Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3841197lft;
        Tue, 5 Jul 2022 03:49:32 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s/dG4siX8rtnkQCMS6QYs26S41MZIAL2QLhjccGVte3E4WvVJJleJR6NwIWalKk56FzFcJ
X-Received: by 2002:a81:12d8:0:b0:31c:ab66:4693 with SMTP id 207-20020a8112d8000000b0031cab664693mr8186460yws.452.1657018171821;
        Tue, 05 Jul 2022 03:49:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657018171; cv=none;
        d=google.com; s=arc-20160816;
        b=AnFqnsI2hAJSjiR37r2QBtjHs5L+3KxgCmLKwizUO3lvx+tpkNJOYyln2HEoaZBiDn
         l0sYSZJtC/rLpHi6enVPWClIJ1Mr8ivfSWJSKhdiUWJQRBlzalto/KUZ5q25ftzE+202
         /dpcB9cwg7C62fEXZ6gvqtNbUlUL9gKZGxinykM6JoTHQck7dZYBO98OAJRREfMTigM4
         frucNQ2Ahcq4I7iQRl0q/zQQbvxgZLpGv6atuCefK9KfxE68GESrZj0cFHSYzDK3ZrxT
         AcKaVzMxxxD0KP1LxneH9JhEhMmlyJXsd+tSNYZTDIGg1gzhjf0eA6WAUYonSsQkqQlR
         SzIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=hNt2/Z12Sph7R0/rCb5j+raACJjxNpCweHGXcmG/dMg=;
        b=T4S/Pe4/bDDtca4qSuUWW+cxr0ryzdr7dXnNI05q/0sweHFNWRLq6LZzjEaJtbkqDw
         gCSXxzIlBW1C0GpPJ4Lng65Ogo0bAadfUoJ0flp3QMdARDXlpLb9oOIllDlNAlPURZpb
         aXAzjxCvJ/5m3mZ0eNMK8NPaBPvVgpcz7etRlOBKmXO0OJ8yGLfp/ZtBP0n1QmQDYNaK
         VZeFlWV2Mak0ezuKLQ17fto4DWQ+MrUcHhCaj7MhHmbHM0VBICHwZKO1YFD38Pr98Vin
         nOH8csStAo/tGpAz9lmX1XikhWhG/IN/ipaiXo70Tn/Qh9C4dfTn6RfWy6TZFutO84Hq
         Z4wQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gbimLGyq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 186-20020a8114c3000000b0031ca9eedc29si6265229ywu.317.2022.07.05.03.49.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Jul 2022 03:49:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gbimLGyq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8g7W-00013G-5L
	for alex.bennee@linaro.org; Tue, 05 Jul 2022 06:49:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8g7I-00011g-G4
 for qemu-arm@nongnu.org; Tue, 05 Jul 2022 06:49:16 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a]:38726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8g7D-0007X6-Gz
 for qemu-arm@nongnu.org; Tue, 05 Jul 2022 06:49:16 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-31c8a1e9e33so52213797b3.5
 for <qemu-arm@nongnu.org>; Tue, 05 Jul 2022 03:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hNt2/Z12Sph7R0/rCb5j+raACJjxNpCweHGXcmG/dMg=;
 b=gbimLGyqxChjoBRDXwMC3irVa2LV2eAmZIRxae90yXKOqX4ZrdPKuHxmznLOsSAaPj
 aMMyZ4cqcDemnkKfAPyBqj29t7WLr4xLa9E/GbIW0DNRcUw5x2M7i5XnRvgv063j+lq3
 kLgw83x0TzkWpkGyPceui2fBHPwNVfxCTIzs1WWDCxQ+gxI0ZT/2M4ki1kPKM9QdxLb3
 QJVjH9U13CnY3lkeO1lV2Lq7nuLUdngU5zvoaHyZhedTlMUZWGgPlXLXvZ+zagK+zI71
 1BAQLAPkIGsL0QmR/90YehaVdiqMfQSC0pEwJZi9BVVkr+UWbA9H56/dGmrdOxmHutBD
 9Nvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hNt2/Z12Sph7R0/rCb5j+raACJjxNpCweHGXcmG/dMg=;
 b=ckGvsZ2wkSet1/qRyGg6kMJLAdGawJoNZ9pIx2F33r0edyUe7mQK5eiYshkD4qogTB
 V33YhNyvIt2vP+j8cjhglRaLKJIkaj/jb+Qfq+xD6tMiEN+xIVlaS+DqlPRcOQ8lyOEi
 taRTvTQGE7GS24sEee80whA5rBWHWWbfdhfXla/sPoKjIXGNVHgH9kdBXULDHK4UcUzg
 WtzaWm4FoLm3Ab14A9GzTPD6EKBYFAWoQTELBdjTeaDGtfC5kFsX+gv5jcRXSzhvFNlt
 NWIyyIqQp/U5Ce4VGxMXYu41ztkTkPUEr6DcWmG4XqImJaCBySuF2sZdgGw3Ysk4H6MJ
 G6ew==
X-Gm-Message-State: AJIora+eTSJ/a4DzeTojNWfKeo44/QA3V8LvLHiwe1V1x7rPreL/1m6T
 vtqAZet8xE3fzUbPpLFVqah9KsOsa3rPIUn7oMXmcQ==
X-Received: by 2002:a0d:eb83:0:b0:31c:8741:a033 with SMTP id
 u125-20020a0deb83000000b0031c8741a033mr15478142ywe.455.1657018149909; Tue, 05
 Jul 2022 03:49:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-21-richard.henderson@linaro.org>
 <CAFEAcA_qDAR9YmXdZ0wuVVkaBeV3ArGzknjLkU=BqJn7hBAbjw@mail.gmail.com>
 <52d072c4-b6e7-c413-b15e-3aae358b4b00@linaro.org>
In-Reply-To: <52d072c4-b6e7-c413-b15e-3aae358b4b00@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Jul 2022 11:48:59 +0100
Message-ID: <CAFEAcA-p_-vK6rNdc5yZ0bK5+RodDG_VOQVP=Y1U8ZS=OEBUpg@mail.gmail.com>
Subject: Re: [PATCH v4 20/45] target/arm: Implement SME LD1, ST1
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: uHau1hB1fOdz

On Tue, 5 Jul 2022 at 02:49, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 7/4/22 16:09, Peter Maydell wrote:
> >> +static void copy_vertical_h(void *vdst, const void *vsrc, size_t len)
> >> +{
> >> +    const uint16_t *src = vsrc;
> >> +    uint16_t *dst = vdst;
> >> +    size_t i;
> >> +
> >> +    for (i = 0; i < len / 2; ++i) {
> >> +        dst[i * sizeof(ARMVectorReg)] = src[i];
> >
> > Similarly the array index calculation for dst[] here looks wrong.
>
> I don't think so in this case.  I'm not mixing indexes and byte offsets like I was above.
>
> Recall that the next vertical tile element is not in the next physical row, but in the Nth
> physical row.  Therefore there are always sizeof(ARMVectorReg) elements in the host layout
> between vertical tile elements.
>
> I agree it looks strange.

Ah yes, I see how this works. I wonder if there's some way we
can abstract out this sort of index calculation into a macro
or function so that we can comment what it's doing there and
then all the use-sites are more "obviously correct". Perhaps:

/*
 * When considering the ZA storage as an array of elements of
 * type T, the index within that array of the Nth element of
 * a vertical slice of a tile can be calculated like this,
 * regardless of the size of type T. This is because the tiles
 * are interleaved, so if type T is size N bytes then row 1 of
 * the tile is N rows away from row 0. The division by N to
 * convert a byte offset into an array index and the multiplication
 * by N to convert from vslice-index-within-the-tile to
 * the index within the ZA storage cancel out.
 */
#define tile_vslice_index(i) ((i) * sizeof(ARMVectorReg))

/*
 * When doing byte arithmetic on the ZA storage, the element
 * byteoff bytes away in a tile vertical slice is always this
 * many bytes away in the ZA storage, regardless of the
 * size of the tile element, assuming that byteoff is a multiple
 * of the element size. Again this is because of the interleaving
 * of the tiles. For instance if we have 1 byte per element then
 * each row of the ZA storage has one byte of the vslice data,
 * and (counting from 0) byte 8 goes in row 8 of the storage
 * at offset (8 * row-size-in-bytes).
 * If we have 8 bytes per element then each row of the ZA storage
 * has 8 bytes of the data, but there are 8 interleaved tiles and
 * so byte 8 of the data goes into row 1 of the tile,
 * which is again row 8 of the storage, so the offset is still
 * (8 * row-size-in-bytes). Similarly for other element sizes.
 */
#define tile_vslice_offset(byteoff) ((byteoff) * sizeof(ARMVectorReg))

(or use functions if you like. Maybe we want versions that
take (row,col) arguments too.)

Even though we're just multiplying by sizeof(ARMVectorReg)
in both cases it feels to me like having the calculation behind a
function or macro named to indicate whether we're doing byte or
index arithmetic should help make the callsites clearer, and the
reader then only has to convince themselves about the implementations
once.

thanks
-- PMM
