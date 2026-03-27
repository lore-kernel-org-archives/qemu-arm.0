Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 897A610ED67F
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 14:12:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w67ue-0008FY-3Y; Fri, 27 Mar 2026 10:11:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w67uc-0008Dt-39
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 10:11:46 -0400
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w67uZ-00069I-Sr
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 10:11:45 -0400
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-64edb56b70cso1971578d50.1
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 07:11:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774620703; cv=none;
 d=google.com; s=arc-20240605;
 b=bxD5OHP7OmxNaWDvYWvWO93/PZefdvVp+QxvBb90sbylSk9h87kjcJ0jgrKvH/bqLq
 +8Qn9zsosCe0a1pldKIOU4JBp/zTM8gLsG3uoJDYp1jkob9Ian+LHid8DHV925dl3uzB
 v4Q9Lo+pVBRJ3ln+2O0IubMfPJYoQg29auSoAtpxOYkNT+ROvY0nwFKh93XCyto8U5H7
 HNrShSi0qTTQMu54vorwituUGPmh6QN+Xb5APmsi24SddomKoAlgKA9uCAJzBK7JVuAr
 jXQKOLwJxUr8R7+wkZyVykoYJMoR4PNEQuqCMu+njMxh55Sbd56z+Lc0fLijZ56O1LS7
 wBhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=inifQfQgIY2IYfSgHyyln8KaB3fVOElqWi8O4mM7icU=;
 fh=xBNf1atHIltaf/cmWdNFu0S0FtEhp6lxOZfe/Rk3Cko=;
 b=GGlCY4LKuBPzgJM7BRHX/OsqBf6ztGts467C/6Q9IR0XdkT2y1dOumQdhAyBNXt6Uw
 TzP0t4NL2noaAsoDhSUA4MJcY43jMipNhQurxNvyiF4GtPh35ElCs8PXrUAGAL0e5qYq
 VX28woVS3CZDvmdR8wQpd6R8RIZDpO1ZBDuDHVlBltHL2qpi7+aq4tl8PlbGKCF7x8NJ
 TT2JbuoV+pmKXg+tLIPBj6w8BxE0vgJM2rGiAPwpJ2hnlk/j4clqzq28WRawGdCl64pR
 2yqKUyKGmyn+N5vS3MyX76VUwoqNokwRjTg9CyWe+UXZsFWjlGHCvqZ00FdUPdlByXQd
 zpwg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774620702; x=1775225502; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=inifQfQgIY2IYfSgHyyln8KaB3fVOElqWi8O4mM7icU=;
 b=P+xVbmovlhjv6g/sDtSzKdUD6QyCva4EObkdh56z4cSgeC9Ks8kSmIVapBT4RhoKOp
 zVhoR6OgUlUxf0jSV/yhzgUKMMFG0oLLdkxRa9tlQskM5ERpiUpya/xzSwTHhamQwmNs
 T4S23egkcPbjFWlysu7qeQpja4oU/fduuaJwIj5ABYJflbzatPvj3zuWnd3aT9z6k4u0
 s3GEdIbwuN5rGt9Nlm1aDb8lW+2y0TdoUVoHqwQrS8UViXfw4GBLWYtRRUF0UA/urs2w
 jbTO4csb/Qaf3m66JCKzRA8kTN+n+ElSNLf5+NsimlYwj3fudXiMC86C0I5s4tx98T8r
 nPRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774620703; x=1775225503;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=inifQfQgIY2IYfSgHyyln8KaB3fVOElqWi8O4mM7icU=;
 b=IY1ttknsl8FHh1K57U2lbYALkwpQpcSPxGUhSWOCmh0EMX+tRUgeAqvfDJXbuD57D0
 hPIEz51TiU3oaVZqrnBW28cKIH7wQ6KShnf5iRPWhjqp//I3DopwSi3HXh/iHMBjqwbf
 GpmA/taQVHvZv+1t8crTcyNXkufUXSUNjpjdn/T/igD9u3HtCdeEGmWG7qew69o5h3kz
 xmMyYfV3G3tOAJlMWjHx4UNAan8g6QUFbm3brgVUxTkKeJ1co/slxVeSJKBuD2S/x+Mi
 4wQfqHg4dr1CDYJ8euzKYvByxb+HFWMOdMbKXNZTzu4TyyUKO3SCvW8uryZT2Whs8rR1
 U2wA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXs+P4MsGzDiXJ0Qln74Fq11xsdUtcBNwb+HAxWUm1CmQ63pAdVdrJI4+SHtjY1sO7lTBPYJLdOmg==@nongnu.org
X-Gm-Message-State: AOJu0YybQAACNy95bkCts9zV/RWq+3txwyjhgxbULa+40eWp4meTsVVy
 tyjVAIcOL4+un3jhyqy4nrbqjaHyr80H9prm5Op5yTVWkNhwwWaB6bSXyZ/eVNJYw6+qmls7AOP
 bFsh9Ge8ydOvqTVgZ4uBVkh+/seL4RZ1W4EoPYN5OTQ==
X-Gm-Gg: ATEYQzyIVaYv9HNRdp5ZuP6vbj1Z2yxwgXaB6/tj8grllL7yfAx0gA0jYfHRVz0MiU/
 8P/XoHoFcCZ+pjXsy8vXkQ8GUE+lxc9ua2U9m78daqIf8IueOktJzkDXsk5qM0iOy21t7xfFl3f
 do8S4EheERB95Ono/ozAH3Zokd8q8ivDopkokurD2tUuSNkhYYKgAtdVKAwNHvU2RFUk4cJfbJ1
 NQL80CevdUgChkkBgBId+K5Q9jn3prlsimVZfVKQHVVrUnLhav+2MMFaXr95AAxPYFlT26JU1pz
 sGppq+7CFpVlY/BpamBbs/7pLOTEFMi5tGNGwiJ94igvr3SHYgWsnSDnBrO9r3wZ7qc=
X-Received: by 2002:a53:e101:0:b0:64e:f106:60f0 with SMTP id
 956f58d0204a3-64ff73cb80amr2139268d50.51.1774620702415; Fri, 27 Mar 2026
 07:11:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260327134401.270186-1-kkostiuk@redhat.com>
 <20260327134401.270186-4-kkostiuk@redhat.com>
In-Reply-To: <20260327134401.270186-4-kkostiuk@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Mar 2026 14:11:31 +0000
X-Gm-Features: AQROBzC-GF76seJ-pj6gXNfAn4m1CsFefNOgqbZYHJStea0S2XWUlyeb6quiHgw
Message-ID: <CAFEAcA-41M=AbGfk1Puxz_Tu9_mD2G1H-1h5ConJvcS4KCbOPw@mail.gmail.com>
Subject: Re: [PATCH v2 03/15] block: Use glib2 instead of
 strcasecmp/strncasecmp
To: Kostiantyn Kostiuk <kkostiuk@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 qemu-ppc@nongnu.org, kvm@vger.kernel.org, qemu-riscv@nongnu.org, 
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, 
 Nicholas Piggin <npiggin@gmail.com>, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Chinmay Rath <rathc@linux.ibm.com>, Glenn Miles <milesg@linux.ibm.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, 27 Mar 2026 at 13:44, Kostiantyn Kostiuk <kkostiuk@redhat.com> wrote:
>
> This is a change in semantics. g_ascii_strcasecmp() doesn't honour
> locale but strcasecmp() does. But this is OK for at least one reason:
>  (1) QEMU always runs with the C locale so there's not an actual
>      behaviour change here
>  (2) we want the comparison on url prefix and it should be a plain ASCII
>      one, not to do weird things with "I" in Turkish locales,
>      so g_ascii_strcasecmp() is better as it's explicit about that
>
> Signed-off-by: Kostiantyn Kostiuk <kkostiuk@redhat.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

