Received: by 10.28.173.206 with SMTP id w197csp3752325wme;
        Tue, 9 Jan 2018 06:21:50 -0800 (PST)
X-Google-Smtp-Source: ACJfBouUYF7+U0difh5zpza2oBbd+EK4EvEExwdPel3A5O8E8kO/gWg0nV29ToN9TmSSHh07wEcJ
X-Received: by 10.129.159.132 with SMTP id w126mr1547974ywg.87.1515507710122;
        Tue, 09 Jan 2018 06:21:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515507710; cv=none;
        d=google.com; s=arc-20160816;
        b=kO9i0rYO98ubg4JJ+Vs4m4SBfigDyrsqowrZ9k3Cm9wWaGUG7cPx9RHHag2HFH4l/P
         58f9sgTcQBOxTZb37n0Wc3Wl/LyeVeWkhZGlXf1GY+QYDtYxY2JyevBQbB3SLNeysB5B
         PlJ82XI/0cLMD4oxExOzwWr0twMuZr0NJsOTAuctYV+dVWSaSRGEKlTnAhR5X7ZnBBSP
         NMFVP6LXecdSK9D3Z3KUb//dwycQtPtYVeo50KJCpW+Hukje7lBd1qqFonwnbj8QdA2B
         zjEU/cd7gxaN61a8hbi92u00WHRpDL+akt9xacDWtdWgBc4dlPfCj2CpBkYj0/DXcOD2
         jRXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=rT+i1VnZBjjFK3GDb5G5e9fswExN/DyPdYfHYfUQXIU=;
        b=Zo9axOOZ5YAQdQgcgKAFy26aO56WqM/1KdMAZGeJ3G98f0wSXJL2hKg/4t5kh8YHgo
         AvAeCf9r83LzlSGlzNmgkJWS+PkC4M+cX6lrZ6qG92bfcYqtJYyopcSR6LnRz/4rEZ3U
         9tPP2PSKqg6QD2etHjJYK9WOry5TQXGauYtxb6DIxkPYGNaySGNqf1kVCjr/jK1pYagb
         FKnEj4zJogiLnEB71xq0qZ34RRjqAwBST1T5HrdOW1IFBIlWJHBB8W3+xsJQTVRECfY1
         21wdHyjBb1hlvRQHC3vzr9gt0n8I3IaV3yISGpb0+amPYniYo58O1uzXXxes+m2Zr4LZ
         XpaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UUTz/xZn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n2si3063238ybn.509.2018.01.09.06.21.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 09 Jan 2018 06:21:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UUTz/xZn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55198 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYumj-0007qY-IY
	for alex.bennee@linaro.org; Tue, 09 Jan 2018 09:21:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41387)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eYumX-0007pC-AK
	for qemu-arm@nongnu.org; Tue, 09 Jan 2018 09:21:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eYumW-0006Tn-70
	for qemu-arm@nongnu.org; Tue, 09 Jan 2018 09:21:37 -0500
Received: from mail-oi0-x229.google.com ([2607:f8b0:4003:c06::229]:46056)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eYumW-0006SY-38
	for qemu-arm@nongnu.org; Tue, 09 Jan 2018 09:21:36 -0500
Received: by mail-oi0-x229.google.com with SMTP id j129so1302163oib.12
	for <qemu-arm@nongnu.org>; Tue, 09 Jan 2018 06:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rT+i1VnZBjjFK3GDb5G5e9fswExN/DyPdYfHYfUQXIU=;
	b=UUTz/xZnDPkSepsHbsQSdKxar0BD7jmwFISEI2Xn+lZnMKPO3Kr85wN8VfCK5zxFZ5
	SIkt1kmFLfcdCQKhMay455K0y5IRKJ2rjNI7wvZuVBl2q/TCDXt814JcZNS6qBAi7JHd
	oXhoJDGVS9dKJuOuExf4C2IRHPaH55n+TtNXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rT+i1VnZBjjFK3GDb5G5e9fswExN/DyPdYfHYfUQXIU=;
	b=mTK/CDRaKp6hBon8E2dPNU66EJeC7cIMhcRoQnAt2RUZdMsgiMJzKXT96TtbL8rcfc
	Ot1rkFw5tnEn8T8LTggKa6GNxrVIRhzf05HheNdZbO/cEzTK37WBQypXOj5CPiV6Na3K
	mLhQb0q3usXI1lj/5MAgMbJ57qa/viyNhybaHL4u/yjXWVjSbQcBPBXYfnv3dUKFcKqx
	blJQ3MAar5wGa1zJ2Ye4er3y2tWsMppRaRB4X9LDFhJ0p9+7TwQ6MORlp4jdgCsaHqR8
	fYgW2MaVCGBYlyFnVoE07P7DZ8/JzmTra3KPiGaDozKUwDWbxOPD68u2fPJTPvPF3sFn
	UDuw==
X-Gm-Message-State: AKGB3mLWhRqgQ4xxnOXL4TD6k0SXJ31N4a+mQ+xAtp2B9HsgiRldh3wY
	bmBsrWVb01ffiBbqiHmE5o7ETD+NPmenj00ZB3cx6HWK
X-Received: by 10.202.75.80 with SMTP id y77mr8244236oia.328.1515507695308;
	Tue, 09 Jan 2018 06:21:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Tue, 9 Jan 2018 06:21:14 -0800 (PST)
In-Reply-To: <1512742402-31669-1-git-send-email-peter.maydell@linaro.org>
References: <1512742402-31669-1-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jan 2018 14:21:14 +0000
Message-ID: <CAFEAcA8-5Rgt82tfDFkh3niUYsvSUKmHeTsk7e+Mzq3HJMBbpA@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::229
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] get_phys_addr_pmsav7: Support
 AP=0b111 for v7M
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andy Gross <andy.gross@linaro.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zd3xudSyKwU6

Ping for code review?

thanks
-- PMM

On 8 December 2017 at 14:13, Peter Maydell <peter.maydell@linaro.org> wrote:
> For PMSAv7, the v7A/R Arm ARM defines that setting AP to 0b111
> is an UNPREDICTABLE reserved combination. However, for v7M
> this value is documented as having the same behaviour as 0b110:
> read-only for both privileged and unprivileged. Accept this
> value on an M profile core rather than treating it as a guest
> error and a no-access page.
>
> Reported-by: Andy Gross <andy.gross@linaro.org>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 91a9300..2f53dd8 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -9229,6 +9229,13 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
>                  case 6:
>                      *prot |= PAGE_READ | PAGE_EXEC;
>                      break;
> +                case 7:
> +                    /* for v7M, same as 6; for R profile a reserved value */
> +                    if (arm_feature(env, ARM_FEATURE_M)) {
> +                        *prot |= PAGE_READ | PAGE_EXEC;
> +                        break;
> +                    }
> +                    /* fall through */
>                  default:
>                      qemu_log_mask(LOG_GUEST_ERROR,
>                                    "DRACR[%d]: Bad value for AP bits: 0x%"
> @@ -9247,6 +9254,13 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
>                  case 6:
>                      *prot |= PAGE_READ | PAGE_EXEC;
>                      break;
> +                case 7:
> +                    /* for v7M, same as 6; for R profile a reserved value */
> +                    if (arm_feature(env, ARM_FEATURE_M)) {
> +                        *prot |= PAGE_READ | PAGE_EXEC;
> +                        break;
> +                    }
> +                    /* fall through */
>                  default:
>                      qemu_log_mask(LOG_GUEST_ERROR,
>                                    "DRACR[%d]: Bad value for AP bits: 0x%"
> --
> 2.7.4
