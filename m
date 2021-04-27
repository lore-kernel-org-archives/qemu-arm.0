Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp4612517lfb;
        Tue, 27 Apr 2021 02:31:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPlEcET4S48UIBdr4Y/ggk+7vw2Y2Qv/dXCTGM5OcTT+B+1iWLMpHVvmsbGUsUGVARUAKp
X-Received: by 2002:a67:e902:: with SMTP id c2mr16311193vso.42.1619515888217;
        Tue, 27 Apr 2021 02:31:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619515888; cv=none;
        d=google.com; s=arc-20160816;
        b=u3RV6PwLkw0okee31bFI2BnCNFTgllrnSmgIsQw+Vcbtk/w/XQOsgvRUhlie8iPmoC
         zNjaHLZNvdmElmZHEsIFW4EXaOwo5VNF1SVlJZazfjQIcIbABBcsPJbamLYshk21zx0L
         zRdxyvaRlJDSRsvB/0jwn4acbcdRTwLDvIySexQuSgsj76k/GNevHTdfUuRcERbhe479
         MHshjlHcS1oAd1k3Rbp5el9hsYocUYGLFTYhIlmVr716m31Szi1tLAplX8BOGxI3yZaB
         8JlVi80kzYCidnAVP/+xRC+hwVzrYILknD5/jYYyzGXHJeSZOPz6OkXVB4xYIAr/d7IG
         5TJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k9u2x5D3SOubZEe3RPaRcH6N4VCiHCuSYmkbJnihiIk=;
        b=n8H0j9tsdghGT9Klbgg+Co4lh1Yy2bf9Lt0DfZ6AmbZHGQSSF+hso2lO6rFGZOAl8j
         hZ24VlgL9QHpRPGRYcrqCzKQLvIEMsNrATSAPhQXRY5vyifscfIAZQuF9rJTqODX49Lp
         dMZdLMZREoAX8CYno3XgE+kzYeXCth+dBU4RQi3FUASTCuHWu+7adKs/n2Y+qfo0tE74
         8Tpkvnfi33GHGEzwBV9BrhdLeiLV4nrFQyGsKW/xvZwWT74Epod/BC4HehW5un3L/dwH
         f8sPHeRVaaICS2BM/P4MkB9V82gB1OYWIeAmdIWJgyNohB0FUUaT+KrtcgSKXQR6DFun
         CINA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UvSLacxn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n8si1809541vsj.206.2021.04.27.02.31.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Apr 2021 02:31:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UvSLacxn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lbK3z-0004kK-Hi
	for alex.bennee@linaro.org; Tue, 27 Apr 2021 05:31:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lbK2o-0004jj-Sh
 for qemu-arm@nongnu.org; Tue, 27 Apr 2021 05:30:16 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:33482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lbK2m-00052I-MD
 for qemu-arm@nongnu.org; Tue, 27 Apr 2021 05:30:14 -0400
Received: by mail-ej1-x62b.google.com with SMTP id t4so5268019ejo.0
 for <qemu-arm@nongnu.org>; Tue, 27 Apr 2021 02:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k9u2x5D3SOubZEe3RPaRcH6N4VCiHCuSYmkbJnihiIk=;
 b=UvSLacxnw2uKejNpLSUzJnZITiwpJusQp0SCD/z0aZ+5reuuo5go0MstucPbi6LBcE
 0qnOZ2vcnzV4N3xPW5jfPK3sIZpp2yJhGIMB4zZB3m9aLvw5i8YRpOng0p9xw5RQgIEM
 8o5WHBAsh0lSOFAciZH3gMSeO/cxiRObCrojN01F+QuKWk7ltqaCW5BteME3ukxejRI8
 tsU4Uyl5325f6YPXhu1A4oSs8f1GvbW3diiXKQLSDtmK05Y1GVzoOVBsF9iUHDYQ20aq
 qgpsaFAnxek+xTBFWqB8BdSIpxbV/LWLyzEAZQd5Ho1YzYUnjVwzDADjLAa5annEvAms
 Ixvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k9u2x5D3SOubZEe3RPaRcH6N4VCiHCuSYmkbJnihiIk=;
 b=RMNsju3QBN2rrydqQdiRGUEfhA/UGKoFpAOkZC7F+iMNuIvmI/2GaQHf+3u3W/sCa7
 rFRk5OYE2kU0aQFFD6wsiyzdxq52hpnn2liz2723DKk6Zcqz1OoJIfB1nDWtcmjcpvgo
 2i4q6kIoUZfAqPbRLCjp1QA6kbARi0GX1Ji8i0q4GtJiHXnQ/qBG3FDx+J3Wlza1OyCu
 bsNLjKwB2faUBq/lOVK3AC2JVzFISnqCwBbte+2VWPvbbWbg0Gk6GEQXReJUSflxUEbx
 8veVusQGlFW6UPRohKAqEdn2yDgK4ox7uS2jq4cK4zEzRxUZoDWInzeFch0Ok7ts3opy
 4HHw==
X-Gm-Message-State: AOAM532QW2weoyN/en9aQnu3n+jF86uaF+MxVtYxhvYsqLa+nUC0uq/3
 pQWhxCSAAqDO6THvxQDAdYg0xYyR4rSnP+X7ozQENQ==
X-Received: by 2002:a17:906:6d41:: with SMTP id
 a1mr22721695ejt.482.1619515810486; 
 Tue, 27 Apr 2021 02:30:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617281290.git.haibo.xu@linaro.org>
 <80d8bac17a21b41b36cde3eec6c9681b93f43d7c.1617281290.git.haibo.xu@linaro.org>
In-Reply-To: <80d8bac17a21b41b36cde3eec6c9681b93f43d7c.1617281290.git.haibo.xu@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Apr 2021 10:29:11 +0100
Message-ID: <CAFEAcA93EC1+ctNi3uh7vXP3F+zV8kunEXdXTHkBHqd5L1Q-2w@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 3/6] target/arm/kvm: Add an option to turn
 on/off el2 support
To: Haibo Xu <haibo.xu@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrea Bolognani <abologna@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XBi8n+SyFYqH

On Thu, 1 Apr 2021 at 13:55, Haibo Xu <haibo.xu@linaro.org> wrote:
>
> Adds an el2=[on/off] option to enable/disable el2(nested virtualization)
> support in KVM guest vCPU.
>
> Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
> ---
>  target/arm/cpu.c   | 11 ++++++++++
>  target/arm/cpu.h   |  4 ++++
>  target/arm/cpu64.c | 52 ++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 67 insertions(+)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index ae04884408..30cc330f50 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1349,6 +1349,17 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
>                  return;
>              }
>          }
> +
> +        /*
> +         * Currently, vCPU feature 'el2' only supported in KVM mode.
> +         */
> +        if (kvm_enabled()) {
> +            arm_cpu_el2_finalize(cpu, &local_err);
> +            if (local_err != NULL) {
> +                error_propagate(errp, local_err);
> +                return;
> +            }
> +        }

I don't understand this. EL2 is supported in TCG as well...

thanks
-- PMM
