Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp562362lfb;
        Thu, 9 Jun 2022 09:41:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/etz1skSOSj2vGicGNbcTkJz/L0vhjZSgBbuXNqWsQTP+dWXVUFieqoFsnxAfV7mKr+kY
X-Received: by 2002:a05:6214:1bc5:b0:464:559c:3f13 with SMTP id m5-20020a0562141bc500b00464559c3f13mr42389957qvc.110.1654792917728;
        Thu, 09 Jun 2022 09:41:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654792917; cv=none;
        d=google.com; s=arc-20160816;
        b=0UFzbsDns6dPc5yYR0QXKKEtr5THawTDiwuwWdTLEJs5VgXTj8ZGCinW5OEEEZTfXj
         hTfSB0IqgJtN+d7HtPHj1oYnjvl9Ke1dtudPxOGLizpSdbd1ij2xZi3BSYPyh7/zQyWj
         m87q9ybOhxMsCYlm9jRDWiMKKwGs7pESLTLxyINX2RnH0r/r1SpdaGT/qjl5QAARpeaL
         LpOQcyEk6d1xsg4hozlJ+NJlzN5/GiLj8Ru5wT/785/zxFbbJOk2j648ldZs0rYX3Dml
         IagQy90lmGmGF/n8rtERY+j41iuJ2/jsAeE2Xm1e81YuakLnR4YxwgvL+WMsSf0Bpgva
         rCYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=uqdeI0LnulE82Kiz0cR+AAU/Q28ML4+90WKXvDm2gAQ=;
        b=etMYJQA9FiORFdKgZMvX+yqfHJ4iinlM5PyhvbLVZ69fMbj1lHjnhUdRsmjG9h4yDQ
         esNLBNcZqDAMBIJTiyYvwaSgftOUN9ANTqVlOOZ1ntzwAm9zofbMPwZ4xbYAPW4EVdzT
         TPnCAIMglTqcQ3BE4qaMlEVAE0Z3cmOe9NVSJIsWhvsjSj0du+GwuXfUKgpchFpskZZ4
         1DS/eK9PgNuisHp8a6+nArRDV9F9n7jR8ur+uU/VGhifhGKiUXRxbIbRKyuPMRT8ExBM
         Fk1IHwhLcK1jcQqbMmw7Nx901E2qb3pr1tM84RzpNfQT/S13a+qGVmfHnXf9bsEP8Eqf
         Y63w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=muClPK2Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z18-20020a05622a061200b0030503115a33si2781287qta.423.2022.06.09.09.41.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 09:41:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=muClPK2Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzLEL-0007qk-88
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 12:41:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzKA2-0007yR-Po
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 11:33:27 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:37771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzKA1-0002De-29
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 11:33:26 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-31332df12a6so97062937b3.4
 for <qemu-arm@nongnu.org>; Thu, 09 Jun 2022 08:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uqdeI0LnulE82Kiz0cR+AAU/Q28ML4+90WKXvDm2gAQ=;
 b=muClPK2QvoPlnm+7uLNr4/IPCOPlzb4UIsaSPMqw0NKs76ughzGQ9TARiclc9wxxb3
 BaPBMZ1Pjp5SmYM49OsN5kKj1c0+62V5J7fm9hgy3vyQNXAgx1UibZPLBY6u+1txkbv8
 n30HEmKgM8D9cDk0ZC3N59FJWkKJ8SXzObyHTQ6DzZOw4jdA5B/+ukOpVdgvldGKxdqn
 bDCzfJ3eczP2a255TVVL1A4VDaxlhApwJv41Dymsq42iCm+dvmrEJekgswbuB/HUbeOb
 3z2HSXcqJV/yx1EJhQrlp175qdB2EaKbEgzMupL13+fABIDrYIq5Mk5Ry/QWBooWWIf6
 XE6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uqdeI0LnulE82Kiz0cR+AAU/Q28ML4+90WKXvDm2gAQ=;
 b=NjjkXxysih+wfuEhDpDwKLO0DpCaUA+LT5eQxFMFkmFM+wU9nMFGm5wKKh63dxFUD2
 TMs1dY+H4CHbJ41xA/xdacIl6Qh0YHLUHe3e4GoSVZIMLSVOzDlvK4CN1MC9r5y0P226
 HqxWzq7wegE+VX8xUEx42alSakuojiPI1w0VzVmCDwQF/0G74dGnakegD1SayFWAx736
 Auhd2nBUJ+JYwagD4TejHeGON+9F8Z6F9AHUWfiQ+vcR2T0tlcV0VRKxhdSETDM5ygKZ
 kgDeMVdHZ1NIl+RIOWwI7/4Vyov/q7rCEvfi98RIuaN2H/CSSvCbKmiSn4qwM2LGulX9
 xuZQ==
X-Gm-Message-State: AOAM532PDivkov17WCNXOogFK/2w51s3FefwMzxYMe80qfSMPbrMgl0n
 dJtSKrKTQ63/tySSR8qZOI/WJGVq2iPEYKWP5XUd3bgIc5A=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr43790633ywb.257.1654788804051; Thu, 09
 Jun 2022 08:33:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220607203306.657998-1-richard.henderson@linaro.org>
 <20220607203306.657998-39-richard.henderson@linaro.org>
In-Reply-To: <20220607203306.657998-39-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 16:33:13 +0100
Message-ID: <CAFEAcA82JYna0e7ebgirj0Ad92OBNcZTVFM+8kQo7t77PdofiQ@mail.gmail.com>
Subject: Re: [PATCH v2 38/71] target/arm: Introduce sve_vqm1_for_el_sm
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: rzs57S2P1ML7

On Tue, 7 Jun 2022 at 21:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> When Streaming SVE mode is enabled, the size is taken from
> SMCR_ELx instead of ZCR_ELx.  The format is shared, but the
> set of vector lengths is not.  Further, Streaming SVE does
> not require any particular length to be supported.
>
> Adjust sve_vqm1_for_el to pass the current value of PSTATE.SM
> to the new function.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
