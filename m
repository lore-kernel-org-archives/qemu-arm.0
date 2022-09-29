Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp1352938ocs;
        Thu, 29 Sep 2022 16:19:11 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM57CSuf4z1s5jrS3Epl0lEiJknX4n5tNeaAKS4P1p8W1poUb1W1im4RSE4/qxlgBEeyQShl
X-Received: by 2002:a05:620a:472a:b0:6ce:d97a:fcc2 with SMTP id bs42-20020a05620a472a00b006ced97afcc2mr4255378qkb.96.1664493551683;
        Thu, 29 Sep 2022 16:19:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664493551; cv=none;
        d=google.com; s=arc-20160816;
        b=Yi0KIuVMV/DJyKXgtCuYyIYE9u7dzaJUB77f6++85PuQ7EfXCFN61ChgZD4l3kHood
         KYOrsKBuz3mh2TJO2gdnU4oYa2s8m6H01zjIsoYys9yOSgeiBGeOwnPTOfb5uv8UxBcc
         jylE2i3JUnSwr00mMsyzukqir5PuyaAcvQt+XdyFMlW9NLHjPfR4A+GpfumM9RhlkcGt
         KBsHu34nBdO2daKqZa4Y2odlSSuAQHgxEVf+vE+RhnTnAhKDBEnUT6/2waAZ1LP5tHzh
         P0ueAhDh48yzucv5dlofY+Zy69U6VKHSkZOE2SDtYYB4Kp+Ql+0JGiPiVsm0VINMBe/0
         IKyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=hF9rYpsMRu8iOlbcHGs9P0pihfhi1JnBQIDJPmBi7NA=;
        b=rAyQv+7NZT75ul1KpEoJKM/+vLSivmA0GQiElUc99kUTOkXGD4+wIRwxIfGZU94cBX
         8bwEpxIEVHQpEe3bDBUnr7REiJJBvsSF1r+zjem4DlCmtdKVWDYcdunsdanAmSJ+BJ6I
         L5+gwDM15HQ6ImmbeIgERCZv29ezlHgRpctaZYFjy8EOsPiaQFFP5MaO82mdnKsQtlqS
         2+JqFtJkcjfCcAx1wpweX8/Xtn946cNEmXM7Y6E8R3xI1totmD+N6Y3LQnAqfaaMTkRp
         Z7vlqXW67mhv2B4RvutgIIHEVx5E4qMJGfoFQwcG+apecpwhYTL1+2KXP0evtO8kjBbq
         7OfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@zx2c4.com header.s=20210105 header.b=ZhXtdz51;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=zx2c4.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bt13-20020ac8690d000000b0035cd5e9dd55si300961qtb.708.2022.09.29.16.19.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Sep 2022 16:19:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@zx2c4.com header.s=20210105 header.b=ZhXtdz51;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=zx2c4.com
Received: from localhost ([::1]:41450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oe2oA-0001Bl-8m
	for alex.bennee@linaro.org; Thu, 29 Sep 2022 19:19:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=kpRN=2A=zx2c4.com=Jason@kernel.org>)
 id 1oe2nz-0001BZ-BN; Thu, 29 Sep 2022 19:18:59 -0400
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1]:40834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=kpRN=2A=zx2c4.com=Jason@kernel.org>)
 id 1oe2nx-0007vA-5y; Thu, 29 Sep 2022 19:18:59 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7D465B8267F;
 Thu, 29 Sep 2022 23:18:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFB8FC433C1;
 Thu, 29 Sep 2022 23:18:52 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="ZhXtdz51"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1664493530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hF9rYpsMRu8iOlbcHGs9P0pihfhi1JnBQIDJPmBi7NA=;
 b=ZhXtdz51ay/cKdp/0jcr2iIwNciYY0Ki1+5GOwUYR9kbtuLPOubOjkchkOBi8R02JPngtE
 5ot4xYYPyiGnxc5SGzumOo4HgOK1FHGeXN17ItVlC5FHmUlKBBS2kEzLvV4QD1a+CwsJHg
 GERqKOMplnc9UrVyJZukU1UwRSJA5HY=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2906c4f9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Thu, 29 Sep 2022 23:18:50 +0000 (UTC)
Date: Fri, 30 Sep 2022 01:18:48 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: qemu-devel@nongnu.org, peter.maydell@linaro.org, qemu-arm@nongnu.org
Subject: Re: [PATCH] arm: re-randomize rng-seed on reboot
Message-ID: <YzYn2EJPpfF1HbV4@zx2c4.com>
References: <20220927160742.1773167-1-Jason@zx2c4.com>
 <YzYGsjlGBwh4Hi78@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YzYGsjlGBwh4Hi78@zx2c4.com>
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=SRS0=kpRN=2A=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hZvG52QQOCVh

On Thu, Sep 29, 2022 at 10:57:22PM +0200, Jason A. Donenfeld via wrote:
> Hi Peter,
> 
> On Tue, Sep 27, 2022 at 06:07:42PM +0200, Jason A. Donenfeld wrote:
> > When the system reboots, the rng-seed that the FDT has should be
> > re-randomized, so that the new boot gets a new seed. Since the FDT is in
> > the ROM region at this point, we add a hook right after the ROM has been
> > added, so that we have a pointer to that copy of the FDT. When the
> > reboot happens, we then look for RNG seeds and replace their contents
> > with new random data.
> > 
> > Cc: Peter Maydell <peter.maydell@linaro.org>
> > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> 
> Just FYI, I'm waiting for your feedback on this approach, first, before
> I add a similar thing for other architectures (at which point perhaps
> rerandomize_fdt_seeds will be moved into device_tree.c or something).

Actually, I think I'll generalize it now, and then we can evaluate it
all together. It actually looks a bit nicer split into patches. So I'll
have a replacement series for you shortly.

Jason
