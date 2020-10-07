Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp281584lfq;
        Wed, 7 Oct 2020 03:32:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGy6A3wjR8X3LbJxDgczKUimx2gs7cPyyfkkrDYhfCVt4tevf8ezQAjoFLgldIDzvkvyZv
X-Received: by 2002:a25:3783:: with SMTP id e125mr2877819yba.423.1602066763178;
        Wed, 07 Oct 2020 03:32:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602066763; cv=none;
        d=google.com; s=arc-20160816;
        b=KUyBODLLjvt8U2aYtd5u50YU9MZJpP+nUWjoogFvzEyKiCqJONR+NWS0nSdLbnHxVq
         vpCak2UV2c9X/wfyr5oTSroGGL+J/t3yXP0yeI1xNPM7CYJUyX4MQQVtiUaEtgaL7gke
         MpU3r+EUugmFGWhEE8KdJ71OZ2g2eioI5sIym5jkEySO8XkNJhwQBYeQPY7Gr+W4yf5n
         +W0u2YDMIrr9+YsHutUmEIpU5nYTdDCGw9HfiS3FMRgmBoKTPd38oNx0xurQDuTSulRV
         zoAp1W2/0EI8Xt0Z1LBbhmORPqcgANf1NiqAd/2Gcfc43nNX84G3h0fo/S/zGcVFO3nM
         Tsfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:to:from:date:dkim-signature;
        bh=PvHAkugYI6mUFLhUjoi9PIM1Uw1E52iGTx5pkdOuhdI=;
        b=mp1LdT/crgtOVG6ISsT9bggE7XlAKdvZZYziQDPErLq0lWG9Q3SBnH0OfWT+/faY09
         KizJga5nKEcEfgGHTe6W2RfM/1KhbqdDOzZw3qK8tFZIUs2QMtm9eqQyLzNUDBF5AyKm
         pY3Rq5c9CzvEbaBLC7RyF24WWvkNqoQiffPHRyfNRd+10JEbgxHHg9qIHPGIwnAZ8B2a
         RrhE5lB1+0yDD0fvwC/9yPdve9YVynUAmHWHRqEUSCjU1feN4Yy+qfAKnmoIyXOVdxMe
         xgjHp8fjsyy+zzj+bDEFBEvy1osbzskwwGkZGrvSk86Bzw7LmvQWT/xdQDSkHH7zfsoK
         ivdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=WHZfX4Lp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h23si1830379ybj.454.2020.10.07.03.32.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Oct 2020 03:32:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=WHZfX4Lp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kQ6kU-0006xR-Iq
	for alex.bennee@linaro.org; Wed, 07 Oct 2020 06:32:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <graeme@nuviainc.com>)
 id 1kQ6kE-0006vW-Pw
 for qemu-arm@nongnu.org; Wed, 07 Oct 2020 06:32:26 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:37981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <graeme@nuviainc.com>)
 id 1kQ6kC-0007m1-L0
 for qemu-arm@nongnu.org; Wed, 07 Oct 2020 06:32:26 -0400
Received: by mail-wr1-x442.google.com with SMTP id n18so1546612wrs.5
 for <qemu-arm@nongnu.org>; Wed, 07 Oct 2020 03:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=PvHAkugYI6mUFLhUjoi9PIM1Uw1E52iGTx5pkdOuhdI=;
 b=WHZfX4Lp0ofYlD6O6T+VXfHCPyRE/0RgMwHeDfW/UzeNmpaSuTCgvYSUg7RrFoR6xG
 M4JeIZYLc4tghvkoLJHMl22/6JdIcX2f3YEntm1AQKchIMXkPoIgTLsVOamLu00iKIkT
 E/DH2PSrjqzHWHmDdHVnDPZ6HGtb+bUl/B4/dK7tfTv2nzth+c1S4eGO99jSLwUanm5U
 VXIIQRDK/JXcbVliweqfSpbtUINDoqy394rfwRxQLlxLBVH3jF445TC8nRLMzkelxTcJ
 YFKH/9ln02USAf7sgIT2hrChiVbCLvQtnWx1NRveF5ySz8KbP3EMM4kjW/ruW9SrUm3/
 wVjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=PvHAkugYI6mUFLhUjoi9PIM1Uw1E52iGTx5pkdOuhdI=;
 b=oRAR+b1aRCc6Ig2RAynweVOGUzufRKjlluDFgy4bQW4f9xfBZKN4FHRcuEQ6tLXImG
 eWvKlz6dCtuG82Oq6tuI1GKF3kAlPxBAq4BDH/Soe3JEwBu6gIdNSYm2o73UG6S4Vf7p
 4WPrBJRjBQM8B1FqRn0oFKxGg+atXpZ2Kk2FwLU+l00C20YNhBkRgUnt9QcWp9NOVK27
 /1P77uMFBuPaMx0teWcK+SCoGfEaxht5lJi1Li3YQj9y35KDDd3O3S0xYb1bObbVN7Up
 Y7TfzXTKPZZeSjLSGPIp8wp+TagT80iOCA3WnrCTMF5FxdKOIGypOJhNhHGtiAG8fe5k
 hE5w==
X-Gm-Message-State: AOAM533bi3gXPeizb2qYhYup7IJS8Ri8Fv4US4Ead9zXd3Kio5IHE31T
 odtxSbmhPzpKgGtCvCobb/1LMQ==
X-Received: by 2002:a5d:52ca:: with SMTP id r10mr2578845wrv.195.1602066742984; 
 Wed, 07 Oct 2020 03:32:22 -0700 (PDT)
Received: from xora-monster ([2a02:8010:64d6::1d89])
 by smtp.gmail.com with ESMTPSA id g14sm2320666wrx.22.2020.10.07.03.32.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 03:32:22 -0700 (PDT)
Date: Wed, 7 Oct 2020 11:32:20 +0100
From: Graeme Gregory <graeme@nuviainc.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 1/2] hw/arm/sbsa-ref : Fix SMMUv3 Initialisation
Message-ID: <20201007103220.z5pc5qjoyxbowyrb@xora-monster>
References: <20201007100732.4103790-1-graeme@nuviainc.com>
 <20201007100732.4103790-2-graeme@nuviainc.com>
 <c518a446-94ca-f21a-2e49-e2cd8171e581@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c518a446-94ca-f21a-2e49-e2cd8171e581@amsat.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=graeme@nuviainc.com; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, leif@nuviainc.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, rad@semihalf.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uvcj0C6P6DHU

On Wed, Oct 07, 2020 at 12:24:32PM +0200, Philippe Mathieu-Daudé wrote:
> On 10/7/20 12:07 PM, Graeme Gregory wrote:
> > SMMUv3 has an error in a previous patch where an i was transposed to a 1
> > meaning interrupts would not have been correctly assigned to the SMMUv3
> > instance.
> > 
> > Fixes: 48ba18e6d3f3 ("hw/arm/sbsa-ref: Simplify by moving the gic in the machine state")
> > Signed-off-by: Graeme Gregory <graeme@nuviainc.com>
> 
> Again, this fix is already in Peter's queue:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg732819.html
> 
> But if you repost, please collect the reviewer tags,
> so we don't have to review it again. This one has:
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> 

Ah I thought splitting the patch invalidated Eric's reviewed by?

This is a different fix to the one you are referring to, previous one
was in PCIe.

Apologies if I have missed an email from you but I have not received a
Reviewed by from you for the SMMUv3 IRQ fix.

Thanks

Graeme

> Thanks,
> 
> Phil.
> 
> > ---
> >  hw/arm/sbsa-ref.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> > index 9c3a893bed..65e64883b5 100644
> > --- a/hw/arm/sbsa-ref.c
> > +++ b/hw/arm/sbsa-ref.c
> > @@ -525,7 +525,7 @@ static void create_smmu(const SBSAMachineState *sms, PCIBus *bus)
> >      sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
> >      for (i = 0; i < NUM_SMMU_IRQS; i++) {
> >          sysbus_connect_irq(SYS_BUS_DEVICE(dev), i,
> > -                           qdev_get_gpio_in(sms->gic, irq + 1));
> > +                           qdev_get_gpio_in(sms->gic, irq + i));
> >      }
> >  }
> >  
> > 
