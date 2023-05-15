Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6593814ejq;
        Mon, 15 May 2023 08:31:02 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6UvpEeEUh/RFN+noQnSdNnXCtSJ0P0imCHa5z4QwGrYW5AMNtyxpsY2yEsNtd5l/MH8pXG
X-Received: by 2002:a05:622a:2d4:b0:3f3:8b74:dee1 with SMTP id a20-20020a05622a02d400b003f38b74dee1mr46418263qtx.43.1684164662671;
        Mon, 15 May 2023 08:31:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684164662; cv=none;
        d=google.com; s=arc-20160816;
        b=bjPV1NHfBq8+Usk99B1IKMkeUnFYKzXOp+9Z6DK4OaiEvOwDZhLSG5XGegY4CQqd3d
         LiFXISyYlqjk8oVqVH/Y5zda/2Dx4Upn8dBtmapVmNjfcfZl6fe6yw7WFJu7wBT2Vrm4
         bMVp0xUgAT/EZX77oIJXoZvkGZmtDycmeie74KAY267XszuExSudD/t0JyDRJsFldSmX
         xP4kza1iIQrMfk4aM82XXmvHXMTDqs8mCKFMzhgyQWrNc8W492Pp6FSn8rLwt6y0g2qi
         S9XHcUQnMDUIWzZzlD2X6jDmsz7BdV8+7IpofpDukVoXwiBPYH9UCMIMZrdVUPb8314C
         2J3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=k6WHLFZ5fR8+TGTJrOacBSkcyB3koTblBrGWoH2pfwg=;
        b=lVNyYyPJLBFK2Wg5ThAse54pWW37SVm1689f4wHl8xY5pxLm6H8XxM81euXn5WGKLV
         CkWjINELxt0HL3z18vOj6UuS/6L45d8SD7O9mBzeVXdR0PI+OUx8Oe9Umk5u/2n+jrEy
         9eVgfgHSavDtVUC4d9gCGW8uFSdj8dFA8xAdmzcCpNB1oz+3+8Wcqk587H6pBcIKqy8d
         EDvY+Y20PpcgQeSB7EL2d4brp4LH7fN6g6tlYy4k36cRBOtIvjAJ7B9xogg4wp6HkkaY
         3LYp9pcRcK2llPoJ6xRxxThL+UhqOlhstG0jqiLpz0rrX0DoshAK+0Qt0sxb49C08UYf
         v06g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kuYCBZ+2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j17-20020ac85f91000000b003f4f386bb1csi6322160qta.459.2023.05.15.08.31.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 08:31:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kuYCBZ+2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pya9l-0008TZ-9i; Mon, 15 May 2023 11:30:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pya9c-0008RH-Hj
 for qemu-arm@nongnu.org; Mon, 15 May 2023 11:30:29 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pya9X-0002CO-HG
 for qemu-arm@nongnu.org; Mon, 15 May 2023 11:30:27 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-50bc3088b7aso24039845a12.3
 for <qemu-arm@nongnu.org>; Mon, 15 May 2023 08:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684164618; x=1686756618;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=k6WHLFZ5fR8+TGTJrOacBSkcyB3koTblBrGWoH2pfwg=;
 b=kuYCBZ+2JOxlJIDf8m+v5gLyXeDPUVzwb0ABi5nKi5dYgt7cFIfQNogkbyziD0x7tc
 onA+k6F49cMO23/KTo0BXo70JzQYY1HJP+41T2poxoQ2Om7ztWHkZsmZJncKwHqlwGHb
 3q9AmqLseES9qWf819UBiwKjyAcI2DMXAkySInTvY/bsquRyowrQytzg4J6ohaWnkU4J
 dAtP2tuBqYx8DyfFsPonWWqEF+hcpU0Ks0XkxnpIsllYvkL9XGhjATG3ypvhO+97Y5DV
 1WELcYinzjE6xEDLvErDMY5ko29D7wJUUilW0SbCbmLYFY8dE36Q2h7RcSnv62WuKI5A
 yzXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684164618; x=1686756618;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k6WHLFZ5fR8+TGTJrOacBSkcyB3koTblBrGWoH2pfwg=;
 b=YJ/wno4qIs9E0NCm5dRB1AIHObi6ruTUS1iVKGAdYdAwn14WXqiq96kK5Dkt/glXbn
 EPezU1aVNCacTiBHE16VdzoIV6f0vRMRjBpOlGuK5uuNEVEeSbs0CQECoLi82MSnRgF9
 NfI28TxaJS62va7UpRKTAiPpsdoMuxUOOYmnM51HeQOW7quboXcC82aKPJDlbAVoxGCD
 rOeCJJaIUpBns4gHFrp8TCdX+xGCo9UdvZSlCSbOttl6jN+xd9G8TLnLSTf2qpPWq4q0
 /mBSu6xzxeFHyMSNBK8DO4HqbWpzsTjgiDvtZkKUUNYOQKoRlXfvodtTLoVSC4t+ytTM
 tY4Q==
X-Gm-Message-State: AC+VfDxIBm/qo/enj9koxb4tJiPhpCutv0h3vpcWiQqLZjrwDL12nvNN
 UGP76+7R6/Acfoc/YMVToodrzVrbHLpz3Rhw4TV+Sw==
X-Received: by 2002:a05:6402:322:b0:50b:c689:8610 with SMTP id
 q2-20020a056402032200b0050bc6898610mr29763801edw.18.1684164618575; Mon, 15
 May 2023 08:30:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230504104232.1877774-1-richard.henderson@linaro.org>
In-Reply-To: <20230504104232.1877774-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 May 2023 16:30:07 +0100
Message-ID: <CAFEAcA-MdYoQiTvp_c+m3342aNAQ50FtpeaVijhwmv0HcvzeTw@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fix vd == vm overlap in sve_ldff1_z
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-TUID: YvUNceW9YWfM

On Thu, 4 May 2023 at 11:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> If vd == vm, copy vm to scratch, so that we can pre-zero
> the output and still access the gather indicies.
>
> Cc: qemu-stable@nongnu.org
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1612
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---



Applied to target-arm.next, thanks.

-- PMM
