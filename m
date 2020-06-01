Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp3048816lfc;
        Mon, 1 Jun 2020 05:17:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMYJEhguSADXqywewWknN8A7ZxeSsyFYbUsy5gdzMWIk1VrL5YhdyL6jy2PP2u/oJCwcZJ
X-Received: by 2002:a25:34c4:: with SMTP id b187mr33335817yba.88.1591013865587;
        Mon, 01 Jun 2020 05:17:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591013865; cv=none;
        d=google.com; s=arc-20160816;
        b=aGkcKblUaHe3Dkigjh2ww0PNcr55QIlCuL+oK6n626rULEuWL07cxOtvYRQXqg1iZo
         ZiUWCO77+6I5i18MFPeh3sPlT1xO2kCEmkJqVCfAg5RHsGbsoBXHjiIfAI3k2IFEZXar
         9TR2Nm+SApwvAZ49/Gk1+sRoBIaR/SCycpgzaKpnOK6z0OTGmYQpKycM6TP/9bynBEm/
         zH3PfcbYAp+tarFldY9AIphwyLfmvx64858RmpXsNsVgb2hHCuFP1pmobR8kkkl7SMs3
         LF1uljRzLMMym59vNl1Nd5ebjOMSGKIVOjpyOfNnKv/WkuV5WHOTan0rrF+lyE/LJYGH
         PjoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=8D3ltgdEKOYHHzcTB4IMIvlyaWbzQwSDtZpnthKiHTM=;
        b=PqssLqut3KtWz8epmtGwe/Feg++Mx/U06qiLNdQ4i5p6BvQ41ySW8EntgA3o3TXsFD
         xXbicpueMyIObL/3VCm1/yKpSrn/ttTN7itAsR+VbHXhPCw8Qr+9SM5PEPOLIRMA6DIw
         0PzJK/YspVrYRl4MV5863ZaHOy7bTD6TRT68TMw3LHLC8PJOPLdFvo+X8BaDTKXRY9e4
         FZz7q10YUsgVciIJfzUoBfG35raXTxp7SYp7BGJWo2AdE8ckclX6usC7Q2LKiAcNP/e5
         5PvX1jI6t4m8Hd1+9PWWkuCzPPK1O8HLbfMDP49tfzwUnH/RDpwaLgoehOgsIMcphvFI
         oJrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eaNfcivp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v191si15228366ybe.473.2020.06.01.05.17.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jun 2020 05:17:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eaNfcivp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:32844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jfjNw-0007Fb-Te
	for alex.bennee@linaro.org; Mon, 01 Jun 2020 08:17:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jfjNa-0007F1-3K
 for qemu-arm@nongnu.org; Mon, 01 Jun 2020 08:17:22 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:38450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jfjNZ-0007fG-2Y
 for qemu-arm@nongnu.org; Mon, 01 Jun 2020 08:17:21 -0400
Received: by mail-ot1-x341.google.com with SMTP id o13so7776191otl.5
 for <qemu-arm@nongnu.org>; Mon, 01 Jun 2020 05:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8D3ltgdEKOYHHzcTB4IMIvlyaWbzQwSDtZpnthKiHTM=;
 b=eaNfcivpwAkOvZbVHrVYlg0h7QR62myZBy73KYNcEt4EN77xe34WkS5iiJldfhkYsK
 jw8nsuQaP/8UiQUhnJjH7JekktryK17FKc6fQRK3T7G4cvOz7T4EfYIi/If7UsBQc+Pu
 oF5J/D4QqgPBVKTqx38EXcd5LMHEs7v5D1UI5OhrG9wuWMZz79j5utyA+j8eQN5T8sSI
 49CTk9NoDhs5dwQs73jDtyHmT9kaK66UbTaqP1H64KOwRk3iKPxCJVfhnD87Mob/Djci
 MXgmBT7gqmdVLT78slt8y8a6W2H255X+c3RWkWLgnBSscg1MULwGSKpq/kj1aaYMeUjp
 NVUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8D3ltgdEKOYHHzcTB4IMIvlyaWbzQwSDtZpnthKiHTM=;
 b=VYqwrguG/CRgTn9o8pJl73We/5h2DYuB7/EER0SosltUyHUu7ePaBcF44AhmPKaNkQ
 8gZVawYVpS4yn+stl9fRNUXAMiJc8zdffklymrgtPfrZ34/+MekeiF4H8g80NJTGsOTh
 LUT3CNIWcMhKb8j/VU03ek5DDKoAH4BvmgNrGhmAcXHxvcJduxRdHFQObJfnwC8HLCeE
 2aKK/KbEForrEZKUgeKEMro0SLwL0VwvMVFMEhgdObotJ3gGitTfCTT3weWcWaHZRnQ1
 xyH88hmhclFk0kDiEMRZrAZ4Ntnov/6twzYHVQgpQ9oyyhEH9ca5WKdGo4g+15/ornvH
 mGnw==
X-Gm-Message-State: AOAM533aWQ+nfJEApleI6T2U/lY6mwGxEB979rRgC7UMjN8t+MtMJ7zM
 iCmRRcggjJKgurA5icQnqFDLO8vy7EYQ2rznAjRPNg==
X-Received: by 2002:a9d:3623:: with SMTP id w32mr16206294otb.91.1591013839911; 
 Mon, 01 Jun 2020 05:17:19 -0700 (PDT)
MIME-Version: 1.0
References: <4bdfe2a9431643f5b6265e5198a8620f@svr-ies-mbx-02.mgc.mentorg.com>
In-Reply-To: <4bdfe2a9431643f5b6265e5198a8620f@svr-ies-mbx-02.mgc.mentorg.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Jun 2020 13:17:08 +0100
Message-ID: <CAFEAcA92KXS88nx9fvS4ECA21PKonRv_mHqcuvEhLs12Aru+AA@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH 10/20] nvic: Add NS alias SCS region
To: "Magdy, Mina" <Mina_Magdy@mentor.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BtELiiCWefHd

On Sun, 31 May 2020 at 16:58, Magdy, Mina <Mina_Magdy@mentor.com> wrote:
> I=E2=80=99m currently going through this QEMU patch that related to addin=
g the NS alias for SCS region in ARMv8m cores.

> Why did you assumed that secure accesses to the alias act like NS accesse=
s to the real region registers. I discovered the any register that is acces=
sed through its alias address behaves like accessing it in no secure state =
(except some cases where current security state is also considered along wi=
th the accessed region) ?

I believe that this is the architecturally required behaviour. In the
v8M Arm ARM (DDI0553B.j) rule R_CFPK says "The Secure view of the NS
alias is identical to the Non-secure view of normal addresses unless
otherwise stated".

More generally, the reason that the NS aliases exist is so that
secure software can read and write the NS versions of the registers.
If secure software wants to be able to make changes to bits that are
only writeable in the secure version of the register, it can do
that already via the normal non-alias register.

> My question was come up due to an issue while setting Application
> Interrupt and Reset Control Register (AIRCR). BFHFNMINS , I tried
> to set in secure state  but through the alias register. But as
> investigated from QEMU code, the current security state is set to
> 0 (no secure) but the CPU state is still secure and wasn=E2=80=99t switch=
ed
> at this point.

This is what I would expect. The alias is provided so that Secure
code can access the Non-secure version of the AIRCR register. In
the Non-secure version of the AIRCR register, BFHFNMINS is read-only.

Do you find that real hardware behaves differently to QEMU?

thanks
-- PMM
