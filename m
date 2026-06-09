Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A970CD8CA4
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 08:53:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWsCE-00072Z-MO; Tue, 09 Jun 2026 04:52:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWsCD-00072E-9d
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 04:52:29 -0400
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWsCB-0002l9-LS
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 04:52:29 -0400
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-6606d5900dbso1823848d50.2
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 01:52:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780995146; cv=none;
 d=google.com; s=arc-20240605;
 b=TMIQjI/zPyC3M+YobW5unXOE5+aQcQSpnXYiTVvpe0/ijxb5+gdoNHnUKagWmH2p39
 Wmeh8KPEoWnva/ObBal2FtrtKxSHUdC8K1JvJ9LJgVrpzvld3QnNcgQFZCtngfrA8Ah+
 wqZpDxUPb0TwuTV36YKES2nIAbrrIH+WYDdoDJ9PLeuzZZjjtIN/0XdOQKmMk8RVe8L5
 oYjXOrqatwqOXUPnpnjwxYc3UlEg6tdhOfsMhTg9b7GQw/2aa21hGgt+2pBbn5POr+oc
 KDjCZ8PX1cd5nD46/YBZpKWFv+Y5DttRpbCUd4CEC9WHwZLTpT7RffWhzyBd35yFhyzN
 2pPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=tVYJmPhbNbnvFH5UeAEKScjpOPfQEYgoxl8yaE1+iWg=;
 fh=ZQXR1XfZk1jAawkKd5L1oszczawxqAmR9APk0nr8fLQ=;
 b=L7HcJvYHHgxW/UBxwsHC/nCIaifEwsoyZQsu6f7zu0b75sjDq2h41o0b4zH7hIPu5s
 RwkA8bNxImcZoFsp7QtBo0OSppmB9j76CMOxM443dLlbZrx/ApByUz8EsU+M8ibsYLZ6
 g3yTfEipirxHymaVi4rIKH5hj5UJE2LRzSpWu8przKRflQdDmGTm2y+lt0Me8Fv9ZEbO
 E4r5dOu39y30rZHnIpep/vL2W3VV1ufjU2jcLVXNgwBNBZ4osmynQ26eO92NtPBFujmk
 24n4lZKHa7SAjyD6Ecv3rsYL1snyi3/z4njta3xL1wVnZ0AoJJ96rd0dw29ObBm0xXpN
 koag==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780995146; x=1781599946; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tVYJmPhbNbnvFH5UeAEKScjpOPfQEYgoxl8yaE1+iWg=;
 b=PiInyCbU4OcdHXBQaggYgVUAodw4l9sr4FX/caeLF+K1WnxmpY0t5I/GSd+A1VxGRm
 9+iZgVHiDQGFfv1JbTlz1j5lkMPqDg7BSrWFllJL7otkizSH4wa9otObrNzpFJ6WX4n8
 4+3P4qV2S+/QUmkaC0rcFJcMpdS2QrRwPu699Nkx8XzX2iiKDHX4t7L44a/pAph/vW37
 au0MVphEPkddJr/hkDBiTEp8u0loy34ry0Q+5o5n54whMtmTh2/UEhcLafjXQWmb3+9g
 fk7olt2A6A/iQdp/uYyWrpR9pmvVx35gX0BXZWlqm9dgcuUUlHxkPK20TG6iSWWZ2Eb4
 WOHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780995146; x=1781599946;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tVYJmPhbNbnvFH5UeAEKScjpOPfQEYgoxl8yaE1+iWg=;
 b=BYlZi3qaQ5O4J/+NdTkdXEgJ6s3V2HHD+UFTw6iHnC0xUC1zdQ4ww0GahneciLglKJ
 InNtiEgMdESK3WgfWdp2KQsmH1XqYvupKpSzk2qhqYkTp9sTHRuIDJaujm+BXgmx8u2X
 O6r4Nz20U0IM0VDHKEqPKMTrRmFtt5grRaATMZjyWtrOwhpKr4K96otcvrZ/iFE3nyMz
 MaHt3f5qtnBb9nsk05w7AmpAA5IAGpo1JBvcf40YYn19PKOpgjiKhQ69VXmBY9xKqgfC
 LN8H+2d7z/+2Nkevt6VM6ZjnrwPNNMxw9WhR+NByLUar7rmp62iPxns0iXk6HUWlvDso
 AzJA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8WY0OlfU4bEL0K4KK/dg8i/b7QRJ2TB5XMwMbvQ8JA4MdjTKjTOFmL4OPe61ITU7KFzKRm9sGYbQ==@nongnu.org
X-Gm-Message-State: AOJu0Yyba5HdSvqwd95LLzIC1m2b3z/znSFX93D9qsi89u2I/bT1dkQd
 UsqqNa2jXCLJyTf+yjvtcey3mE9YZVh65Mr4hcUzHZ4N/GZ5nd8XICmbPqPQ2CVV60M7zATard5
 YHiyNLetCqVzQ3GPcLeK5XrZYDKmWSPDN2P8WRFAoYg==
X-Gm-Gg: Acq92OEYACah7CBaw/Ld7YClR3EUaUmeQBpX3TY+G+mLYI3/DOU5dOE7R2fFK8WaZ0b
 GGPLl9yd1ewtUysNxJ59qNURgnb+KlyriI9WtCO/thu1azf8yXqSAL1nXH5Ytt6wFLxrfRjRbmv
 BbLYGpvcxwQYNHdLbX5GcTZHPDxVy/SifveTIsawDHTNaS/ES90gNuev6XQekj9it20QxXSkESN
 lION7c4rtjHuwlgKXOYtq+9ZIl4w6zJQ3otGB1rtMhXf/XcTyxYnAi/DTlu7WjswnjIYtk/CWcY
 7euGUD1zAIp6HrJ2xmLWH0WRnUw/QzKU+ITlrXlzNv8wfvoFMD+F37XJviQCBJte6VdPd2ub4zV
 WXw==
X-Received: by 2002:a05:690e:1385:b0:658:fc74:ed79 with SMTP id
 956f58d0204a3-66106de9d00mr18592992d50.11.1780995146018; Tue, 09 Jun 2026
 01:52:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260603032855.106930-1-richard.henderson@linaro.org>
 <20260603032855.106930-15-richard.henderson@linaro.org>
In-Reply-To: <20260603032855.106930-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jun 2026 09:52:14 +0100
X-Gm-Features: AVVi8CeruBTVcyquuOPXtcTE0lue0I9M3l_5O4w-logQpmiQkED_x2iP43tfnIA
Message-ID: <CAFEAcA-RzkAX4k2xqN3pwfSUZ3LDmCa0Or9bKo-Rpwbk1aXQNg@mail.gmail.com>
Subject: Re: [PATCH v9 14/45] target/arm: Implement BFCVTN for SVE
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, 3 Jun 2026 at 04:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>
> diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sv=
e.c
> index c47e79637e..eccb5b191c 100644
> --- a/target/arm/tcg/translate-sve.c
> +++ b/target/arm/tcg/translate-sve.c
> @@ -4100,6 +4100,9 @@ TRANS_FEAT_STREAMING_IF(BF1CVTLT, aa64_sme2_or_sve2=
_f8cvt, aa64_sme2,
>  TRANS_FEAT_STREAMING_IF(BF2CVTLT, aa64_sme2_or_sve2_f8cvt, aa64_sme2,
>                          do_f8cvt, a, gen_helper_sve2_bfcvt, true, true)
>
> +TRANS_FEAT(BFCVTN, aa64_sme2_or_sve2_f8cvt, do_f8cvt,
> +           a, gen_helper_sve2_bfcvtn_bh, false, false)

The pseudocode has

if IsFeatureImplemented(FEAT_SME2) then CheckSVEEnabled()=CD=BE else
CheckNonStreamingSVEEnabled()=CD=BE end=CD=BE

so shouldn't this be TRANS_FEAT_STREAMING_IF(..., aa64_sme2, ...) ?

Otherwise

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

