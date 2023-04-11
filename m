Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp481638ejc;
        Tue, 11 Apr 2023 05:58:36 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZKaWcLtLJTdfsToll5PcDDeba5SjrxkkkSZ2+60ppm2Jhj05ruvzvj1+MgDlcE1PheNJnH
X-Received: by 2002:a05:622a:86:b0:3e3:9621:bd1f with SMTP id o6-20020a05622a008600b003e39621bd1fmr3450895qtw.19.1681217916338;
        Tue, 11 Apr 2023 05:58:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681217916; cv=none;
        d=google.com; s=arc-20160816;
        b=boCGc4dRKWiJ+qCOUIORzplCKAW3qFt28jxjT4R1mvNKjfH8S0qVnbPLawQtjG8TjY
         68/0oZiyM9LaINqaNJrQy/u+/eg5xBTBnvx4HAK2j0dMJ3ehRLmegfMCbI+aGrCBx9O+
         bG/IGvQPVsBNpBx1E8AAWSTvTIbySCY4zCU2UFKnlTkhVWI91Ey86c1O229uq6Qp7TRJ
         5qkjW8Ir3qlujT7N0zr9HL7LVeJ4RlTB0xYON4siE53BXU5rdznSXkGwMju+92mXrMu+
         dDgv3J3vQBADgE5Py62l/ReZEOWUnWT2n4fa4SCCViwoYaAUgbN+XF7Ub41RFLw98QRj
         BPKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=xJvJS40WCNqHmshT8Ne3VQVW4OPsMKMaWe8mRIHcQ2M=;
        b=sKs4HQgT8LExxJfAbRUcg29WQ3Ox1T18COb/et+giUypcGxVYSE5wHhNKlthUXL9l6
         j1T49CM+4SyEO4WGKTvKO++5Qdx+iAt+hJPoNly8WFzfvjQJsUU1L4jHBjF/w4VuAbWJ
         93fD8LzrHKQ9btUHYsPZJrzMlSy9wVw6RglrkN6Q7D6xBgq4N7sAkAwg1zfdyGjNAB9N
         Vy0GeaGIppMKWlTrxsEzEvaEKTW6aXG+qBNcCfUSBGS1UieZ5KoMvv8u/xV+Qrn56A9B
         oA7Evt6aCCXv27gfrC0YSMeRi/cW61z6Kw49m0mLwPj52ggUgJ/EfIYPSN8i3RcngWZm
         20bQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jaSZLb17;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f19-20020ac87f13000000b003e65631fff1si9076125qtk.454.2023.04.11.05.58.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Apr 2023 05:58:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jaSZLb17;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pmDZV-0007ho-K5; Tue, 11 Apr 2023 08:58:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmDZK-0007gQ-Bg
 for qemu-arm@nongnu.org; Tue, 11 Apr 2023 08:57:55 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmDZF-0006Te-QZ
 for qemu-arm@nongnu.org; Tue, 11 Apr 2023 08:57:52 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-50480ce88a6so2183826a12.2
 for <qemu-arm@nongnu.org>; Tue, 11 Apr 2023 05:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681217866; x=1683809866;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xJvJS40WCNqHmshT8Ne3VQVW4OPsMKMaWe8mRIHcQ2M=;
 b=jaSZLb17ZlVYLTLZRNEYLeS3zUtfdUvTukc1hQcIHMr6SKWiBHZc1BDGCTF3rLzXw/
 qqD2l1dW0n63eu5Sav3OmLx5TcsibaqMa1LxAXtJrLzt4ZuH3IxVBPrb44zhNH8xdFt1
 RLlCilnrSO2LDBVyNr1VR5mLSbl1bsjw4cuuV4IHNfs0P7KpICO1iM6hJ1DsIVBZ+a8Z
 ALUTsq3G68B1ErIkJob8xKaoPT4RW/z6rglIcVbo4ohH+egUPAFIPin3A5JdradG5ObN
 c0k26Xgn5ql8pjumqVAnzdo/HBF31EpZr0PNeEHIh1nJT5aGZgjlK+nhPWHTcgamg4kX
 ylAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681217866; x=1683809866;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xJvJS40WCNqHmshT8Ne3VQVW4OPsMKMaWe8mRIHcQ2M=;
 b=5VdakJ9xx/SXiovrnEEJUEzqyZFcWz/J1/ZcmMJD544N0IoJ/8zxpcKAUCxg1bw7iG
 FlLZVI9ask5MOwGelrDRJuZeRGil3ry6hbiof98b54UkD/QM+9MwX5eQekqCyk25Fzra
 uObvFPFFkkFYpNRZi1KIubA0Z861nVMFKnY3xSb9ElXAffBrrVQR41qW7ClzSTO/TEHL
 Sgy5nL4p6vqENT5dSHf0LhEsJgTja6TWscTnbtBlhIvTtNYwoVZB4CewmBA/cyajbF/J
 n3MktKfFPsKv8KKUBxJFXb2p7xCZYK1Z7VkQKmO0vfIOvP6YLGa504epSqN5nuSeIS8+
 /RZQ==
X-Gm-Message-State: AAQBX9fL/kUxRh3dKUxbgc4vxjrn+khojBrlgJ4XKT5LVeB3Dky8sf06
 pZJtIlLVI4+Ufd8gZknipXTUJldDWyyT7KunWOg27g==
X-Received: by 2002:a50:d0c3:0:b0:4fb:7e7a:ebf1 with SMTP id
 g3-20020a50d0c3000000b004fb7e7aebf1mr6726356edf.6.1681217866332; Tue, 11 Apr
 2023 05:57:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230409200526.1156456-1-sw@weilnetz.de>
 <0dd900ec-cb08-b89c-bf09-851cca144afd@linaro.org>
In-Reply-To: <0dd900ec-cb08-b89c-bf09-851cca144afd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Apr 2023 13:57:35 +0100
Message-ID: <CAFEAcA_cQF+GmQy2hy1VW1fbhioyWaYnU2iHg3-f13G4D5NsPw@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: Fix some typos in comments (most found by
 codespell)
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Stefan Weil <sw@weilnetz.de>, Shannon Zhao <shannon.zhaosl@gmail.com>, 
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Br2TSuZX48k1

On Tue, 11 Apr 2023 at 11:42, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> On 9/4/23 22:05, Stefan Weil via wrote:
> > Signed-off-by: Stefan Weil <sw@weilnetz.de>
> > ---
> >
> > The patch does not change code and could also be applied for 8.0.
>
> But not user-facing, so can wait 8.1 :)
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Applied to target-arm.next for 8.1; thanks.

-- PMM
