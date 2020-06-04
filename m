Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp1586117lfc;
        Thu, 4 Jun 2020 09:07:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNS1d9jGMrHubtO2BAoCowBZGW9xUpUw2zWfGB8+641jkG87JTRlM/pFffRnX4qM0QkBDQ
X-Received: by 2002:a25:6dc2:: with SMTP id i185mr9199929ybc.370.1591286832859;
        Thu, 04 Jun 2020 09:07:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591286832; cv=none;
        d=google.com; s=arc-20160816;
        b=0wttJaWJL82MLfDLyUuUZurhGm6JsRc3VK39VW5OjkBz1oEwYvn6+HnbUDtuB79pD4
         Bngq7XgFKoA29VmdXOErSfdVzsWSlxBCwgs05p/bw3BC+6lK8WpfVnNsPSXZQXh2dIBb
         9Hq7bFDGuvEawH3vJeR2/f+aa1QH2UAuGUfw3kXtNoD+jvaSIoAKyfdBhN22gJ+RhflE
         NhVofxA5lkmAzeox+uygQmdUxdTnomVe+QLdHGEJQr3+RNUND43cm0bSky4DrIQmKAiJ
         cncgPGVrDU0x6E1Uz4uRXzUttz9dPlqer+UfYJMw6ya1ypx+zjCCnWehbYJMAtKffkR2
         dp2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=02p9Yf1L+VAOSaHm79JywoXQbGHV/s1Rp4SaiB6URfY=;
        b=xH/jUggiZPpbu8+tjKGdWJJkYx2b2DYhdL14wOSZbQmg4/fpJgwqbAoqrGszFmdu28
         fpKTJtxpyT29cOE+lXnXWlmUqrYfax5rAzRb7JqUA3ReDlIQxbjqle7xu1i+VthEGRrl
         Z+5nXr8iCzqXc4WEiydI8rYki/d+ALbtpIKQyqiwO7OuPJWuRVxe5oEl7CcRIh9uvlmi
         BlL9JqAEkAOfeCEABgpsp/nuNEVWyNx/2YLsUP4VRBDIrqBLs/8ey7tbPC6yHfN/M7B9
         JMCMbaCTLq3vgC5jj/cWrd0iJV8oyj7iFK0FO/xSJ6XqzHn7TIf0BIKt80q2J924H/1k
         8/Fw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=Rx6HPF2M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z192si4166940yba.387.2020.06.04.09.07.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jun 2020 09:07:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=Rx6HPF2M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jgsOe-0002qt-8h
	for alex.bennee@linaro.org; Thu, 04 Jun 2020 12:07:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1jgsKi-0007pG-P0
 for qemu-arm@nongnu.org; Thu, 04 Jun 2020 12:03:09 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:36760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1jgsKf-00031G-AA
 for qemu-arm@nongnu.org; Thu, 04 Jun 2020 12:03:08 -0400
Received: by mail-wr1-x42a.google.com with SMTP id q11so6743794wrp.3
 for <qemu-arm@nongnu.org>; Thu, 04 Jun 2020 09:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=02p9Yf1L+VAOSaHm79JywoXQbGHV/s1Rp4SaiB6URfY=;
 b=Rx6HPF2MCkzx1Sk8bPJNlpzxREFI04iu5B1Rtjc+DRWIETcU3mOKcaleb+mAlUz2T+
 NS4P/t0aGv7LKrrkCPMKnk4fuHrvh2/vUHvoZyK0nOC643ubjxKA2NOwkWrYyzmSjfBI
 wPDP2whn9BqizT6QtfJ2H4LclbcozxjvvD1bS1ynzgA8ydM4qSSCXKm0EF9RvQYFkDiF
 3/Gc83t68uUD7A+Zv2PkN0e17t6e9VXID75yFIYtGOxBwHvyPUgZzM+M8P+T+jZ1nJO9
 XQrs9LMa53s53+YSWrOCHdtSZB4I5jbJH4tbf+VR7hvfnVpdQfk3rqx/1x5Nb2xrzGgu
 tHLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=02p9Yf1L+VAOSaHm79JywoXQbGHV/s1Rp4SaiB6URfY=;
 b=pTMc0JdWgoGUgliy2wn0PEOSr9+ZpWskhv8MMltaKxmJsS6P8iU6b+muv94KbzhpVN
 fwAs+VEFAlZtyI09I1AwUGnIKJggchbVxnUXaLiWz90LNKPBdUKzatxQJ60quOKhM8aQ
 qHKr8oFsR6CZJOi/Vv+bd5w43IeVjl7osU9AfoUsbL+xoI9XaPUJ7f3U1gjPSEU/3EJj
 ah6yV94xTelJTUeDo8jDLrWRNyr/UrTyUdobLSD8ZSiIXeEaOv/N+QQj0yTZmaJ9aoUh
 QfqlQQKvwKZkyzQ2A0YN9nzwSSL7UJiK7t/rDdm1E1WKNbD9rzBHuuigRqg6nRU631uq
 cJnw==
X-Gm-Message-State: AOAM531Rzngb23gsHjwiGIA+CkHz72vXaOPlaDVNFarH/+4zyUiD9TJI
 sMu9Dz0joTCIpPm0L8MyPmyMjQ==
X-Received: by 2002:a5d:6581:: with SMTP id q1mr4951285wru.43.1591286583290;
 Thu, 04 Jun 2020 09:03:03 -0700 (PDT)
Received: from vanye ([2001:470:1f09:12f0:b26e:bfff:fea9:f1b8])
 by smtp.gmail.com with ESMTPSA id i10sm8404117wrw.51.2020.06.04.09.03.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2020 09:03:02 -0700 (PDT)
Date: Thu, 4 Jun 2020 17:03:00 +0100
From: Leif Lindholm <leif@nuviainc.com>
To: Andrew Jones <drjones@redhat.com>
Subject: Re: kvm_target, QEMU_KVM_ARM_TARGET_GENERIC_V8 questions
Message-ID: <20200604160300.GB28566@vanye>
References: <20200604125544.GW28566@vanye>
 <20200604131802.7w4hncgq2gopbw6z@kamzik.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200604131802.7w4hncgq2gopbw6z@kamzik.brq.redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=leif@nuviainc.com; helo=mail-wr1-x42a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SGrs3nHYdMQi

On Thu, Jun 04, 2020 at 15:18:02 +0200, Andrew Jones wrote:
> > - drop the call from aarch64_max_initfn to aarch64_a57_initfn, and
> >   copy the relevant bits into the former for the !kvm case
> 
> I don't have a strong preference here, but if the naming is what's
> troublesome, then I'd think we're better off creating something like
> an aarch64_aXX_initfn() function and then calling it from both a57
> and max, and anywhere else it fits.

Well, the naming isn't the only issue, although there looks like a
certain amount of duplication could be deleted from a57/a53/a72 and
also be used for max if there was a common initfn.

But there's also things like:
- a57_initfn explicitly setting kvm_target, then only being called
  from max_initfn for !kvm_enabled()
- a57_initfn setting cpu->dtb_compatible to "arm,cortex-a57"
- a57 initfn setting cpu->midr, max_initfn overwriting parts of it

Best Regards,

Leif
