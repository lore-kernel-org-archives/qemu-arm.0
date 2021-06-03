Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp219525lfa;
        Thu, 3 Jun 2021 06:14:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2fPwZbKLopRUU3zr6IpYu5k0JJ7NvP7pUrPRnjRbfsvYUTyOG6z410s4VHjcw41sZ88HA
X-Received: by 2002:a17:906:8041:: with SMTP id x1mr16774893ejw.81.1622726081053;
        Thu, 03 Jun 2021 06:14:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622726081; cv=none;
        d=google.com; s=arc-20160816;
        b=XVzWJ2pp4fH7YDgdVJJ29EIDnawpA1NiNB+tms1VpBwRyFNv/xIjdAC7E64+AdP04F
         Yom1ymaAVy7mqtjzC9JTKH4Y59Pf7Pl685qGX1kZO9A07fY/6wEuw/mF+sdwETOSd6Iw
         iE1S9z72Xcu2yAoXUCc4qnLAzAThKmGlmSBLJJ6yQ9Emte1l45osIqtZ9NBubViH0vZd
         5NB65PSB5ayDsDGAOlU9xO7MRxz9pwgq+tvxenGzszIwX+a+F6Kx4DbcC1Am7ORw1Mly
         nJCAJHpUQrwz6jh6xXtCne+oQiCo2nadPj7HRHT5z0Ww2rY+v2a28dVMEKaiIIQBb2tJ
         fmmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:to:from:date:dkim-signature;
        bh=F676EvZh6+/fHCV7QL7FXoEu3+pozfhQgCzOtfOkrLI=;
        b=OJOflo5xZOGrtOCQuPQ7pyr6dCnRiqqm6Ea+9yahhtI43iYFbRAIcCngPGoEl4Mx60
         ONJfIE3N/d7dde/RTDGRFzR3MVz/IYwtta5LlIAM9xyOI4g12AzPkDw/pEWn+bk2v8tU
         0f5ZLGnDvRTdUtIY3kx3vJrGEypLtgYv4Moig2EucD6gtE8kBQa0QNrmqELqdodTG+Se
         MLvmI/3ySQu7FX6kWzcGAsF47RUmai/p2wCadCzqcwLSLFUnEFGBj8juFmwzBU3o4Yse
         92MMiamvmXsawXulXmw3lcsiFcil972kKou9SLvkiuQafqkotMyc9GLIXz8KDpJnEeaY
         fzOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UIe0tOPt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id lz7si2362848ejb.40.2021.06.03.06.14.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jun 2021 06:14:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UIe0tOPt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lonBI-0004ZB-5R
	for alex.bennee@linaro.org; Thu, 03 Jun 2021 09:14:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1lonBA-0004XR-10
 for qemu-arm@nongnu.org; Thu, 03 Jun 2021 09:14:32 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:41613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1lonB5-0000cf-Oh
 for qemu-arm@nongnu.org; Thu, 03 Jun 2021 09:14:31 -0400
Received: by mail-ed1-x52a.google.com with SMTP id g18so5060442edq.8
 for <qemu-arm@nongnu.org>; Thu, 03 Jun 2021 06:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=F676EvZh6+/fHCV7QL7FXoEu3+pozfhQgCzOtfOkrLI=;
 b=UIe0tOPtYy69nHh/pWS3ZVg/IIQJUcwCzOT1D06kj/e2TFz8aI3NMib7Md2GtWAIeL
 e8NPaSWaHyrWFlimh36UxQ7mJ5etHNZfYTM13DOAArU6mLZidVgsq9KwcnB1n3+9VDQK
 6T2k14FBdeSLmOfY5PuMwEN4AJvxRjro6rd3peU8r9C0b8Zx9gRXIOFCEp0j52FCQCxO
 kfXWiNvk4UL4CGKjkgjF4ktgQfeatIHmNj9MMye8Ry5Pj9K0PPpOpAJtiBbz/PpEQRn7
 jTgzD1aaz5xTNefi367p0/l9mq96IYYfH5aFUso80i/BFGiGkeG2sBCXHF7VjFl+NocA
 NWYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=F676EvZh6+/fHCV7QL7FXoEu3+pozfhQgCzOtfOkrLI=;
 b=UnzE5er9lY8VM/P8O5EZ8HGHYdwbOOUsrYA+8BjuLHYpIhCv5eY0HHKi2LcgrTNAeP
 mt86Lv4gXw/WzjgwV33IegOPf+KYmv6mNz4elDcJWAmB5cFgTPXHtqqajSPtT2PkhkHl
 Z0cRd0y4gXqWaOktx4X5AC4H0zK/85Kb+MsqIoJktQV600Hg5eAAEXJsjjdysb+DiUK0
 mV1Bi7WfdEZw8nw0GYQPnnKVE9sG8UPnRYjQFLfd+YtZf281hB6J6wxg1qZHX9tgHX3h
 nRfUd7L5jQ4yaSjFSTPLII2ESR8Y2kfhwriLPbbnNb2jOgb+nKu+xX7/bCjr8JLoxn38
 jDBg==
X-Gm-Message-State: AOAM533us0grdcfkaq6Z3WKMN+Hb/75h7NwNuCZ1+4MhQfx4h3e3zzTN
 mUpalx3AruZvRnGq8JVVuhDxxQ==
X-Received: by 2002:aa7:c7c7:: with SMTP id o7mr41360967eds.231.1622726064113; 
 Thu, 03 Jun 2021 06:14:24 -0700 (PDT)
Received: from myrica (adsl-84-226-111-173.adslplus.ch. [84.226.111.173])
 by smtp.gmail.com with ESMTPSA id v1sm1532076ejg.22.2021.06.03.06.14.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 06:14:23 -0700 (PDT)
Date: Thu, 3 Jun 2021 15:14:05 +0200
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] hw/intc/arm_gicv3_cpuif: Tolerate spurious EOIR writes
Message-ID: <YLjVnWV7ZgEj/cpw@myrica>
References: <20210603110012.1182530-1-jean-philippe@linaro.org>
 <31c4e422-5451-3c0a-f5e6-df75559c9a9b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <31c4e422-5451-3c0a-f5e6-df75559c9a9b@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=jean-philippe@linaro.org; helo=mail-ed1-x52a.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DJ1T9zgIue2V

On Thu, Jun 03, 2021 at 02:39:30PM +0200, Philippe Mathieu-Daudé wrote:
> > diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
> > index 81f94c7f4a..1d0964c9bf 100644
> > --- a/hw/intc/arm_gicv3_cpuif.c
> > +++ b/hw/intc/arm_gicv3_cpuif.c
> > @@ -1357,7 +1357,8 @@ static void icc_eoir_write(CPUARMState *env, const ARMCPRegInfo *ri,
> >          }
> >          break;
> >      default:
> > -        g_assert_not_reached();
> > +        /* No interrupt was active, this is UNPREDICTABLE. Ignore it. */
> 
> A qemu_log_mask(LOG_GUEST_ERROR, ...) call here could be useful,
> do you mind adding it?

No problem. I had it at first, but then wondered if that meant I should
update similar cases in the GIC device that silently ignore guest errors
at the moment (e.g. the guest writes a number > 1023 to EOIR) and decided
against it. I'll resend with only this error report if there is no
objection.

Thanks,
Jean

> > +        return;
> >      }
> >  
> >      icc_drop_prio(cs, grp);
> > 
> 
