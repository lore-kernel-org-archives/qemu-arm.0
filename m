Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B99CD4851
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 08:12:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNneC-0002SY-8a; Fri, 15 May 2026 04:11:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wNneA-0002Oi-RA
 for qemu-arm@nongnu.org; Fri, 15 May 2026 04:11:50 -0400
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wNne9-0003sG-6o
 for qemu-arm@nongnu.org; Fri, 15 May 2026 04:11:50 -0400
Received: by mail-yx1-xb12a.google.com with SMTP id
 956f58d0204a3-65c2cd216c9so10410108d50.3
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 01:11:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778832708; cv=none;
 d=google.com; s=arc-20240605;
 b=K0n4rm4up7lWOyrp0hCm7N2pnin6NkHRnkk9xmKQnRIHKFlSxtt0AWwbqzjQ7puOP5
 b4MsATyKXmrEAQX+1nfCPrZg17qXVuzrvXnYgbcV5wLdvmkoNtZsjrij9gTfv+2xa1VD
 GutunZirOYRDcHj38+bzu78XcaKzEgDIE6q7RIqGH4bCadmRBZQgy9P8JwJqjlJdsbA8
 ZceqHsDQuHSduVhHALgiAPM5V7lF3F/D/CtjC5dfUf9i3R8nzBKCcS8/CHyhlkkVw1ag
 v3WSEGIzCfXlbUd1aBcqnU08zzSJtB/w7QKDGhuXnzz9LHrK5k6QR9LOBtsVLlMPnmiq
 Dzcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=ZDR/TctYAg7dyCpCTZzxSFUFUkHrHKvXimU1RucBfc4=;
 fh=8RkjfNBjWO3naoExImlI+rzf8sVgUZS6b1nIKZSI4m4=;
 b=go2xF9LN0Cj5C3dSwSZs5275a8lx8wQWEPv7hraxmRFA0QxL3iOSkHnIr9OSn/Sfkq
 JVEbhprFl0hvKWK1r+q25s5FEsspWiDZfrOBXfuAONtG8nhDOwfcLJxGvadcY3tGvQdV
 vYN2fkoLiL9U4QENw2pr6pYFe8DTPHaXx1cmBbkT2rJ0WhRLej9HhbviG/ziH0sKqKZI
 RrCmDX9VRTeHynuKvi+0e9vr4HYeQk2ggDJZ8sw04BlONx2o/Y8cVi9E3eozrDD59WmC
 KSMO7ANFBnqKDZ0vVW2XN6vEi8eAFfyTG6g8JuSknNZTUZ1RKmfGDJSVOouK2P4Q3epb
 np/w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778832708; x=1779437508; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZDR/TctYAg7dyCpCTZzxSFUFUkHrHKvXimU1RucBfc4=;
 b=yKJUVe5buHJ6qj7hNfeLAg7qW0ES0MgltTSJG2KOUgKzX/y156ivJJtlbtktFKZwAm
 AVZ3C2SmAYnB+Z0ODUvUpDYrsVIn5+4ZUet/2Wc/su+iLwXvDokQQzQ5lSQzqH7yR68V
 MRP68A06V4mfh/vs/iDdsz5Om5a7itj4kRf6vIvUkfVYmIv2e1RH3a+oZYTqCPzowRPx
 QMFbmznuBx5wpEXk0Qt5OB9yzZ8xkNQupb27Tbp5G2GvessWmNs3lQRxrHYeSt1OaE5b
 iIZiAJ8pV9Pjv3I60vwby6jQ6w+/yFwd9fARzOj2ItyTcge0p6hoMje/Ux4+A2x9l49U
 66PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778832708; x=1779437508;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZDR/TctYAg7dyCpCTZzxSFUFUkHrHKvXimU1RucBfc4=;
 b=VPKV+A0VCX/qKIe1sK4yqFbL1TimPwOp+MYRyWegOZMSeVC9odeikwM8cQ1qiNrpR2
 b7MAH+mBkYgiQR2+zzdRNmt9XtthxBzLFhMM4HZKCGtANQIbsYo0FLOvgaplDxOSlY9E
 1hZUHMHp+7p6fgDNM0cZxBNJbaPffkuNrQ0NwVZCf5trwT7u/dDhTEA1R5oct7U6i/Im
 LKfbbXwU/hnNcDRD93hGZ8azUVZALEU/SdnwmArJEwWMtCWJXWlI6QFFquTJRW6Y0XBN
 gqiXYedgLusx/nyaHRnqWfgvbz6yePvDZMD9pgrQD18sOFrIDTKKE8fGwvPFaGGrLPtf
 WUrg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8QCBmHKwc6b+4BTCrUeb0AUDy/ioehvYlv12gv2AZ8QkmtCaruKpvpjdUXtyehrm/5i6pmNCnSjg==@nongnu.org
X-Gm-Message-State: AOJu0YxquwRQJghM4pMJJ79dq2+9yfwFN3GW4gN2LFzYIiwgaumbjYdE
 cR6SuK5oNF0JVcVkWcG5rWm1Yb6cij27pPojopx4CNAmzn/Yay0QwhVC2mFQeWpUYz8uuxBVCij
 Xr/r+sAmdIJN7/olJFEHfGHwHoJwXWSZK/tS2lCI6SwXpckw6hbiao5c=
X-Gm-Gg: Acq92OEkiHwZ0cutS9byRMbLKFyVhlNESFjOQOa9z4TddjCdwooRAU0pc6GkkctFxZN
 D8JEWeKF58BtkhLFb7YKpNMKU5SczWHXoCA5auIxaMVzKPJcrYRV4fm1+UA8OKMqn8enlVAIHJ6
 fNMMhnYNYfNk7x297lfPHnhfT8XIWWzizjppeUKUU3ITqRzgtamOmm4LNvmwo+wG01kAvkWWOvC
 Nb6F4Zt6kyj/yXc8Cg/eo9wo+d6mafiviznzGuzaw26UGp8ZBtHCMLY/+CEJMELcLny1gydnhNK
 YpO9VAYXpVt/uH8Xti3llW6i6ADG65gOddaAZvsemcSoVFmeuYzGbs2eCTlSfNC3+Z8=
X-Received: by 2002:a05:690e:4409:10b0:650:18fc:f557 with SMTP id
 956f58d0204a3-65e2285bec6mr2437951d50.56.1778832707833; Fri, 15 May 2026
 01:11:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260513105517.146706-1-corvin.koehne@gmail.com>
 <20260513105517.146706-9-corvin.koehne@gmail.com>
In-Reply-To: <20260513105517.146706-9-corvin.koehne@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 May 2026 09:11:36 +0100
X-Gm-Features: AVHnY4In3s5nVTtvcAWbR1qVW2DMDAag6GjZGnCWkp1a5--5BW6TB4a8zQLv4bw
Message-ID: <CAFEAcA8mESUEDOOizjppQtODoF9fj4p6JXe6zAnTiyEMFhJpbQ@mail.gmail.com>
Subject: Re: [PATCH v6 08/15] hw/misc: Add dummy ZYNQ DDR controller
To: =?UTF-8?Q?Corvin_K=C3=B6hne?= <corvin.koehne@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-arm@nongnu.org, 
 =?UTF-8?Q?Corvin_K=C3=B6hne?= <c.koehne@beckhoff.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 =?UTF-8?Q?Yannick_Vo=C3=9Fen?= <y.vossen@beckhoff.com>, 
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12a.google.com
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

On Wed, 13 May 2026 at 11:55, Corvin K=C3=B6hne <corvin.koehne@gmail.com> w=
rote:
>
> From: YannickV <Y.Vossen@beckhoff.com>
>
> A dummy DDR controller for ZYNQ has been added. While all registers are p=
resent,
> not all are functional. Read and write access is validated, and the user =
mode
> can be set. This provides a basic DDR controller initialization, preventi=
ng
> system hangs due to endless polling or similar issues.
>
> Signed-off-by: YannickV <Y.Vossen@beckhoff.com>
> ---

Please address the code review comments from v5:

https://patchew.org/QEMU/20251204093502.50582-1-corvin.koehne@gmail.com/202=
51204093502.50582-9-corvin.koehne@gmail.com/

thanks
-- PMM

