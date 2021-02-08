Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp1383322lfc;
        Mon, 8 Feb 2021 10:14:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxtsP9D80yizP42v7bMyuOge7A4U12AN+9b9VRR849+lk4JsWuutL4ZbIk4LwiraPs439ck
X-Received: by 2002:a25:5c85:: with SMTP id q127mr29016266ybb.101.1612808055523;
        Mon, 08 Feb 2021 10:14:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612808055; cv=none;
        d=google.com; s=arc-20160816;
        b=SVyO/h2m1JsApTsahieskrZJoqujgplRo+EIyGM7EC/SQ+P2VpT4U6hEDLX0bSf/4x
         HjrD6JDa+mWIQ0LbgZkwqR9+zF2isqYhOEa83DDn9w2lBGEE0c2m+wtRzPrmx8zJ3wff
         +L0gC6tB3p2wAnTE4GMHlPW6Ytt56R6froIOXU6EUlMnawhGEPbTSjLIFG5OnjZQDv1I
         SZGLVqj/jK48n6wjy8KyZTD+SUbG3qb8Pzu53Iun3xlw11rEGK6hCrqWXHi7Mfy5tBbl
         4dAGSYblGYCxpx7O05sXqEkrRNjNblNWWCnl511tbm1xxLwCxRjdvJFxkKP3YR6bOuqI
         CWUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YhdeYlDMJ0sr6Dnu/8XckT4/MgIlzGrOwTUsBL9D8Wk=;
        b=QMPgF1w09RCPIbhhqbposo1QIqo8f9/9n1AZZjLvisPNxjkeW+gz6xlmLWOXzKWitE
         q5BemMtksqleB+ybIcYx55TLIbYCcIcFczB/9qL6KU3TSI9pS+8d6rhnuDzgXE7Ohtak
         94JEg5mJ3qA0RFsk3EAl7XtCWd7gJEy1It0muI3hqhRKyOEOR7hkB5QuSvPmK1mPq7bB
         47TIsgh1jGjkn3UCeDimDv6MV5362S8Ad4weD4BsghtOITyQbxaIRhDx/UbORshZqVld
         rvKxJrgkiQSn+ZbKlOeu+hKyYC9FUmVTakM9j2+lMxgmimCSzjztVYkj3T6AyL6xATY6
         EitQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Iqr/xdSD";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x23si17645833ybi.496.2021.02.08.10.14.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Feb 2021 10:14:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Iqr/xdSD";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l9B38-00080W-Sg
	for alex.bennee@linaro.org; Mon, 08 Feb 2021 13:14:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l96lT-0003In-A0
 for qemu-arm@nongnu.org; Mon, 08 Feb 2021 08:39:48 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:45136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l96lJ-0005FR-Ix
 for qemu-arm@nongnu.org; Mon, 08 Feb 2021 08:39:43 -0500
Received: by mail-ed1-x535.google.com with SMTP id t5so18055947eds.12
 for <qemu-arm@nongnu.org>; Mon, 08 Feb 2021 05:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YhdeYlDMJ0sr6Dnu/8XckT4/MgIlzGrOwTUsBL9D8Wk=;
 b=Iqr/xdSDdswrgdU6yCSZ4IAQ+rv/G2fpkHOgsFeFYheLMUnFd2WfDVn18GJeoBd8md
 0vDXBxInN4jeFHm/DjPjdNY1WMBYVoupInUglomVqJjLNl4RWeOxRxjjwi8RWcE3EPVX
 pioywOaRbH66fGw9+chSgpp9zmAXDygU25SolvlJ6VWCemWmDTHVMN9nIpnVG72Bmis2
 ZJQRBWxafEMs+H9kdUbGalkNhfAjMFoSXCdGxr1zeulZHcFLzgD6DahckXOeQ+HuhG7f
 oZarpe4ajGBX2eGrmG0P+Xytz+JZJoRcst3ywfmx2iIwGZjS+NLX/YS2XAltCBV4CjK+
 Vn4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YhdeYlDMJ0sr6Dnu/8XckT4/MgIlzGrOwTUsBL9D8Wk=;
 b=E7Pa0wpBhMNXzxYcBHq0jxgTXBDvYqEvs9klLCtzrA8QJSc62wQhPqDVAOVAyVnixI
 yKMMDMQfZrxaxCPCFXWMtHG22pN5pQzGZWfvOxfiwzghvWxeWjpKxkPAybn2KD5b8L9H
 9Bixw5kH3RtWuPsedkuStEtICnOsDLirBuw9LmfMWnGAhGLssO9sRUg5e7uuoi1zHYxr
 kARTOOT0i3sovTXxOWmA9Ax0IW1Dy0oxv/q2+TOdfDQMpzRl5lzvlMOmLf4X9Q9FXMyx
 D44qjEg0DnMug8ljIJY0Fzbmz3WKdb8JEb+yLmSYblx90HaJJPPB7Tsj/dHvIx0zXC+V
 95jQ==
X-Gm-Message-State: AOAM531/wNiov9PT4/jnPLoI11oRBM3rnqfT/jSXYHANHfebsH1nmIWv
 p/jHOKXicCqc4TShz/k1TWzChRSuxXsGTGGiMD+Esg==
X-Received: by 2002:a05:6402:3494:: with SMTP id
 v20mr17651896edc.146.1612791570115; 
 Mon, 08 Feb 2021 05:39:30 -0800 (PST)
MIME-Version: 1.0
References: <20210203190010.759771-1-richard.henderson@linaro.org>
 <20210203190010.759771-13-richard.henderson@linaro.org>
In-Reply-To: <20210203190010.759771-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 13:39:19 +0000
Message-ID: <CAFEAcA-ou+uQRCwXYNLc2fBem=sLR-SBYBdK5UzA2+Cd-DDCoQ@mail.gmail.com>
Subject: Re: [PATCH v5 12/31] exec: Use cpu_untagged_addr in g2h;
 split out g2h_untagged
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MeD7QZxsUiaX

On Wed, 3 Feb 2021 at 19:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use g2h_untagged in contexts that have no cpu, e.g. the binary
> loaders that operate before the primary cpu is created.  As a
> collolary, target_mmap and friends must use untagged addresses,

"corollary"

> since they are used by the loaders.
>
> Use g2h_untagged on values returned from target_mmap, as the
> kernel never applies a tag itself.
>
> Use g2h_untagged on all pc values.  The only current user of
> tags, aarch64, removes tags from code addresses upon branch,
> so "pc" is always untagged.
>
> Use g2h with the cpu context on hand whereever possible.

"wherever"

>
> Use g2h_untagged in lock_user, which will be updated soon.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
