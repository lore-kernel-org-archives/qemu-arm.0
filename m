Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7418BCD98E3
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Jun 2026 15:33:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZVmf-00082A-NF; Tue, 16 Jun 2026 11:33:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZVme-00081N-5f
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 11:33:00 -0400
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZVmc-0004EO-NJ
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 11:32:59 -0400
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-66058b880e9so4662638d50.2
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2026 08:32:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781623977; cv=none;
 d=google.com; s=arc-20240605;
 b=EvuUvOa48ocXPbV78+0Gril8SU3XECjahrEk2uEf9Qk20F3t3GAmbrPVbwtiaohHy6
 K/znIwR162wovo35jrCCzWs302xnpRZ4odsDvt48CuOLPAIo4yfLlNgWaeGO0CzKWRt2
 /3Oq5Srtz1Ncysx/5dNd2sMc0DxAo5HWjC4WHVQJnqDNpeSCaNrOpypqJzuTrkXVhBk4
 ccH+G2JJOWfe7YDMoiEsaWL+HcfFGYX+v7j1kQKOtM+hqXbDmdg1rgmgusezRVKdxFay
 4+zql6yvh+sit5K+Jfjg0VgsA8506prUmhKmtDKC0VFz7Us5EeEZ/xdWZlX11cJPunWN
 wBGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=fmlcTBy5GUF+phg4A0g5MTQk/Mzl6TKYJScxaFXs7So=;
 fh=YT2gkq7MC2l1iWnAg/eZTcsE+2XphSvnw9v3SAxqBws=;
 b=gAmBQy4AIUAfROcIAwZ8n80Y9lPlJVwI2xU2n0wT2qXgx9+y1QfTa9LmDlhzF2nXVC
 9qxrilxSY7aMQ9r/4ZVFGIT1K6fuIMlXIXx3fxWbL+RLgUg0lzlMBkqOZUhRiA3IHE7x
 YyNstejT6Q756yselm9bv3QEG5YH7JucZTZQXy5FNT5quoUGAGLZDiImXKme3/13W5L9
 vE+g2NZfy8E57BYMuMOdpCcDU6Ex4I2YrHwmQRBpFv8y53+g8tXof+bC3LuLp8tXn7pC
 TZYLDcM/p379ZF57N5Z4ZPC9O+wM6OHxFJgCWb8HB+6CfiTyQdU6GymCSEOHRNbIcIPB
 1yNg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781623977; x=1782228777; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fmlcTBy5GUF+phg4A0g5MTQk/Mzl6TKYJScxaFXs7So=;
 b=WYi4/FcJt9LjwpDDxLhtM1zxJCE9ToqiEvVFBnPBVQwslXBhPUR26Wlq3Uh6TYlkcp
 5wDLUlGGLMxIOEOSTU3nVTH1i3TxTpxsnarfrCwpWL+SlJcuj5aB2/xzhxl1O41AIoaW
 KPXyIv4ZvLGENAHd8qjk+rj3/taPepkoCGsLGaiNcYy80L8ZLH5uvVZsh1ZbCNdZc3oC
 mqKeZCnjyytXGdMXo958sWmFfloSxbtDs6snMYyIOFtcrlclm0kiCLWjAt6/xgyH0PZH
 8Ufy/kKXr9xrUhxBB68u4lrsnfdGnOMxthcEHbRfDDC9IVadvEkkV6RroTeZdui29jox
 V2+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781623977; x=1782228777;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fmlcTBy5GUF+phg4A0g5MTQk/Mzl6TKYJScxaFXs7So=;
 b=ipi+1kLYiY9daq1m0x2ttr9DE90k2bFMJkQH9olmLS42vRBtXxG94SE5UdBVs2HtZU
 9X3ZgfjEO8W47mQW6q/f7V41K1iVl5PpRJXjG63AIJTcacaNeNPwf2mwYkAAowtfkhL4
 5ta2wXkhqH9tcJsFeLGK/OWj6jgxXYiu6pBiEvacF6Y9cbtJjnV42K/ksktpTISMKrf6
 NTXTIHBe3UKIeMbtw9c7gizUihUk3/b+CGdLusfb6l8fVK20NDAzy0lwXRyq1U5YN3Wa
 t43zFDz2Y4cVUI2RzTuVIGxg0N1INMtLkhdB+yQoHrlvEg1znMzOMlCWlePvHaZb4I6v
 y3+g==
X-Forwarded-Encrypted: i=1;
 AFNElJ9TUTwKeWYSEev/x9VWIF/p1Yu0WprGNPjWFayljbCtSWKsZM3nWJ40GH0jRQANpesXXM7XlrmTSg==@nongnu.org
X-Gm-Message-State: AOJu0YxDzqmgKZEwxFScClJYZ7CbuLAnh9jhdccZMwA2N1D77k4BNKTs
 DCb6tdIB56XWfJ84GjyH8pjTy9UpViuTsORD2RJ4zrx9ME66+5RyDRqMgROnVAC4ns5DHo8CknI
 eZUu+px/ujpgcVqMfFRpOVYPCrj5qtFKVBfMZoZqvIA==
X-Gm-Gg: Acq92OGkKqh3djibXOFoy/w7SaSiySWJ6gzszeWw6ZrQMTIo/Qdzu49pkILBtPu6Iyj
 baqOk9cOWnsoiYSZj93u7cKK8dV1T2OmqM5EvPzcylPdCXPk/AmX8QlFNVyTaSyS8bcp2C4bC98
 F/LrhnUb0tMaFELj1dL9+5+1qVqe8ZFNkNE2+GeGYYls2CQNzIz1qzm31xQXorLRMAVAMgOEMz9
 RHB+LWulorvhDmhBWfz+BS917eXj6Vh1offjtWR8OqBa9uq3vyEEtUzP+TUaDZd9l99v8OzAAns
 /4pTXvWtt3IqIiLzhVGzzZTH8eDMwG04wXrQY6oS7IMLruG5wLNWfhGa7VrzOm6c2C8=
X-Received: by 2002:a05:690e:4183:b0:660:4117:e4a8 with SMTP id
 956f58d0204a3-662850c264fmr11319946d50.32.1781623976719; Tue, 16 Jun 2026
 08:32:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260604234852.573178-1-richard.henderson@linaro.org>
 <20260604234852.573178-26-richard.henderson@linaro.org>
In-Reply-To: <20260604234852.573178-26-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jun 2026 16:32:44 +0100
X-Gm-Features: AVVi8CdBQ_mcr_jyMzNOmTB1zCppsLRdrrPLgp9kLB1OvtP1noM2sihgE1SDdhA
Message-ID: <CAFEAcA_qwMxsJKF8T1-ZMxOapsqumhPVpgV6P+MBPUKm=uLSWw@mail.gmail.com>
Subject: Re: [PATCH 25/25] target/arm: Use expand_pred_N for
 helper_sve_not_zpz_N
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb133.google.com
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

On Fri, 5 Jun 2026 at 00:52, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These is a bitwise operation; with expand_pred_N,
> we can always operate on uint64_t.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

