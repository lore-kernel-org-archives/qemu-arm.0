Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E151C61DC4
	for <qemu-arm@archiver.kernel.org>; Thu, 27 Aug 2026 15:38:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzcB7-0004Cl-Il; Thu, 27 Aug 2026 11:38:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wzcB6-0004Bv-6a
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 11:38:08 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wzcB4-00080q-Jv
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 11:38:07 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-836f34a0ceaso26540667b3.1
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2026 08:38:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787845085; cv=none;
 d=google.com; s=arc-20260327;
 b=UUdndqkV/8VlZf7MuWJUh8xMHgyL41CFCBrSFPQBiSyM7C0MswoRqxW5UekUmydYv4
 RYHSlK7kkOGibJDZ/0HiSrIebM6ASc1MoypH7V3xdP5g5IeyaWFjG51ACXkTwXj8uDxg
 wvAgH6GGJGHX85afuszNslmX1BvDABMLRM9TpiyWesuU8p9XAowQsf8KzL96Z+hnSdBi
 cXdc86iqJtVPKyfVI4G5r38i/F/+In4BehokvD+BtgyQpfs2Qb7xFCn487TlgJ11L+of
 xTFVm2zAyNPhNcWoV/G5Had6wBkH2YDtiDNDSXDKodAPjyH0MzdHV4gusiBxBeHygbXl
 UJcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=evPZoOd3J89BjWhfOiGTl7xqmjIVFC1jrvFqOzTwlSU=;
 fh=CePyfLLQYsZTzsnIB/pCDi17MpXL7W1jg8pxuh/pVIY=;
 b=jvrS4e/+IfGHGDnN2SMFNEHDXnMMWaPN5o+hW6jLGDm0P3St3vvwbR5Py8GLTmGZSh
 6R4xJrONbOa5nxtgCYs1hEIQ6i41hSu38EU53MIvModenGVlFnR5uawpfZTmP9PrsDGj
 nBVyooU9cWNjB6I0me5NbFwmBdU+R8O8+awXrJyr0CskuTpIvM22fEk8KSmYInbMXru3
 CN36Xyt5JKx1y4q38vWat/UNi8uVEE3HrC8T1fHqJpKsNf1CVPfszpxcrCCBYhVD/fSZ
 xGpl0yRA0MdnUefrmhxanGWQgxjCpfeg6L2CnFTSROPJ4KZkcGQjoWiOJsz81RL22jN7
 jY7w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787845085; x=1788449885; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=evPZoOd3J89BjWhfOiGTl7xqmjIVFC1jrvFqOzTwlSU=;
 b=jlxYAZFS3LKEGm1PYl7X1sZMcDhkf6sOu4Rfh1eJObAnoLu/rrDTe3Mf7j+eegEr8W
 K9fl+Uq3HpycKv/gTql/Seq/0KK3dz0IGTYqi30XygCCRl34UlCT+BO7gMWfbDeD9rCV
 JVF+EOAGY4eKT2FzgZxqZjhQ00rEXqLpi4yD4MKpvCuCaGVsab6qAJdH4ARR0TXkuYy8
 H5mPz3qwcD6S/Kz1bog8oB+9yDSPQNoModvvW70qJ0eGVoWUtXKFn0vDoOodZB0DR0ka
 +3fK2cq8Uy/S99tHGh5T7KrB6daQQxTjSCbgApkaqMPUWIHxsCiS4PshGewvjCv3X4XS
 mJcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787845085; x=1788449885;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=evPZoOd3J89BjWhfOiGTl7xqmjIVFC1jrvFqOzTwlSU=;
 b=gDLyV+w3+G/cmbMbRvOeL4PtQJWarH4z4GbdDnlYeikEvUNspYARumv82suZcp2sHI
 fPVb1allr+gll9wEkZeAZqGjPHdnbCTc4nJtQCV4rELhy+0L6ZlHtSsI1LcrgDqcsD3U
 bh4I0wiDKAG5Ux07X9v9KFIUWLD7RSAFaJmL+XO/7u89moaLKmhJ/wpsbwMANOiUJVT6
 lJUojhUWKWpP05IwLtJItwXnMjgQo4TMgCxuqCmzkk7QD/Ae0o8Gdzca+RHGBx8QQ7WD
 K2ryOjEKFKKEfdIN+zLXX0k6x3EABP4D6RqSouXd7WIXfPYWcONNh9mI4G9pkAZQmmEf
 tBNA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrTMeQPn4wMOfQdIIQVc499nDjcsVkZ1ZF0oi/bP1D2VxtoH0DymGb5FE5kUkCKLR6Y1wUM/Gn2cw==@nongnu.org
X-Gm-Message-State: AFuF++m5/FVyjQgvEwiifkPOXHIsZtY6xGNx4w479spmOfl0P39Gvf/R
 PeaZlVCldpBm0auqgKjuSe77TP9T89sn/y4jz48bcCUkkqDb54ocYaMDQqr4wN5BZqtT/TKZ03z
 4vA0tVQ9OOzXFXDLOX/GSGWxjBu32hczVvTJ+ZtdzGA==
X-Gm-Gg: AR+sD10muCZqApkNBy0GxMtn/e8akiIJ0wfm0UHoCOfOcRvHzYBwBCq+eVmZKd5PQWx
 cImMFt+uwo5gq/+C9WHWtlIG0pdgpvVYvm7LhiT/dEo9MbRdpsUn5FQkgRe4Msa2L69leWMiLG5
 vF2KdLt8PfvnLxHmlQ+3SMHko/53x1LbW2ewWDNj0JSvWxxVPrkMNiL5YM78NN656ZbVk/Hf+eu
 zIBPx2lebLYT9ITD25xLDAEGmB3LzclJaUWHkMI1MVXE3DTirYTMMZmtGM/3p+g52O8qAzv1u+l
 qt9AfPB8fsCd8p7HC2223AGMCqYlwl0SMi5ByUKzs51YI/wDBHAiubPR3rsudZ+c4PcWexeYevM
 Ci/8B++RGVdbdyjhVYJfyoxY/328r
X-Received: by 2002:a05:690c:660b:b0:80e:dc2:873b with SMTP id
 00721157ae682-85d6c7ea528mr103807b3.16.1787845085072; Thu, 27 Aug 2026
 08:38:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260827041557.775080-1-richard.henderson@linaro.org>
 <20260827041557.775080-5-richard.henderson@linaro.org>
In-Reply-To: <20260827041557.775080-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Aug 2026 16:37:53 +0100
X-Gm-Features: AcwNN1XttaOzpnC91BNEx_86K4PMo7UkBT5co3atTT9xspb5NiKgrkKAOBQHpGc
Message-ID: <CAFEAcA8jk7w00+avXj14pkMEgvS0DPY8uR87psLP6+e2_fE1NQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] target/arm: Introduce cpu types max-v8 and max-v9
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 pierrick.bouvier@oss.qualcomm.com, philmd@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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

On Thu, 27 Aug 2026 at 05:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Introduce the names and allow them with the virt and sbsa-ref
> machine types.  So far, the cpu types both exactly match "max".
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

