Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp2362107lfo;
        Tue, 8 Mar 2022 06:03:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxpN4SGvE+Iws8mrB2U48AhLAvPSYx4sRFnbF51R5JMHRe3vv6+Skw46gS/937Dnj85CSlm
X-Received: by 2002:a05:6102:5cc:b0:320:9bd2:3823 with SMTP id v12-20020a05610205cc00b003209bd23823mr6003150vsf.81.1646748203241;
        Tue, 08 Mar 2022 06:03:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646748203; cv=none;
        d=google.com; s=arc-20160816;
        b=InjEty7+cGRsSpBf+KoYCryYsx8FT66pHCVBKddepifmmCQT0vPe4ZOgtFJEHtPJJ5
         mWS/1JCe4DDUccKqdaXwlTzF67CLMMK0SPvYtLbSkRmfvvCfG24Tm2DZuX+ede5kCmbk
         uWdnlWJMV7IioouhH3pyklx9yCNLUOi3X0OcAhlbCEtUyzb1VgtY4nl9cWPfsujC441t
         /NZEIyEGsVSSMaXlufJ2gFeCJCff4mjSv6KeSADCJKh1Sr2TedNea1oMDvKRPhQi1IsE
         vEmILChTM58HGXxKBgcPuY4hdzSQ0oN4sQWrqDUaHFlBIQP2N7njQvI2g7dqyARRtRi8
         F1Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:to:from:date:dkim-signature;
        bh=YQrUVaqHJM9HWSAZ1hemk/z4wOBte6SO+9I0vIiF5tw=;
        b=osBI2mwzFoS864VXcCeEaSaSeXPhLTEK8AYl9YzQ4iXNO0p7jy9ptgubAji157A/WY
         bPMUql0xA2r0xfEMrCJZ3jQIoU1SKa86auKdFVQnq3eWa7NKn9wBnprcFvRUC4gpM8o+
         CrL0wWQInHv0qYKQNa1OhIG2Obe/K+cux2LzwGwFoDhFxkMn7C+OA9OC/S4qK1fB6EyC
         gNxw7GlpE93uRZ0uQ0iUm0zqAE6ntZcQyQ6Ynwj/T2/crVlbcdU9ArLIe4EboHF/226K
         0MYPjZx3E9Go1HLVQBVy/3A+5To0PSw7ThNHX2WDknzf6Oqr3SREFNlTF+Glpj3AWdLZ
         I48Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=o7FudXFs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q18-20020ab06c52000000b0034a0f561726si1354526uas.29.2022.03.08.06.03.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Mar 2022 06:03:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=o7FudXFs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nRaQs-0001EJ-Jd
	for alex.bennee@linaro.org; Tue, 08 Mar 2022 09:03:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1nRaHK-0007Vq-Of; Tue, 08 Mar 2022 08:53:30 -0500
Received: from [2607:f8b0:4864:20::829] (port=39437
 helo=mail-qt1-x829.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1nRaHJ-00053p-1O; Tue, 08 Mar 2022 08:53:30 -0500
Received: by mail-qt1-x829.google.com with SMTP id u29so611302qtc.6;
 Tue, 08 Mar 2022 05:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=YQrUVaqHJM9HWSAZ1hemk/z4wOBte6SO+9I0vIiF5tw=;
 b=o7FudXFshCVYt8GFlJF6lJq7KE/QXSc9igtFIFEU2uCmEx8ca9PfAr1Ls/y+2+cCfG
 YPxesYU65EObEUTsJaOG99L8RzBvHWePZwpdEO3FIdj2jfLdzYw2rBIkypaPDEcVYrhF
 D8QK+412OWwPWY2TWVp1WkjtdvF3Z9YDyBRo8sWuDeWNz2LuSlcC94xw82J8jPBL3nhE
 Jfg0Qt0TlZh9TbM557S8W1dWLP5GT7AU9921jTUZ+U88ShhH7/g9kOHPEg4bZmiIrG6b
 ++e/vhUTHl/qSkY6F1eTR4ERLKZ8DmaEGxF6xFu1BSRY+qw5VzOl38suvOePuPwoRpZq
 jbfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=YQrUVaqHJM9HWSAZ1hemk/z4wOBte6SO+9I0vIiF5tw=;
 b=8RkdKtxmg47vFlhLCV4AJ1RW+Yeh/hQz+A49w58UMOvmjgQ5phDN14hrzseoSCTzOT
 6mf4KyAgcExjRG08c39JJMVVydilSSusRXwNb0tGof4vZht4ADejRQYRjbU+czfuB5XJ
 DS47dHza95lFNo5FT9CdoZSjk2bw1GZ3qtscRL2gP4o6cw9EyeIlcJkXttqrjfwNWXfz
 KpzwcA6GU17c26SIiig01+PiVEyO2SPCeTCnmxlsyrP5R6sJGMnOUFJrE4AS50r4pHRP
 tANErf1GOk4ZKOm+vuZwO+oGrvhOP5zU1xryCGs4Rn76mRHTs8Lsz+4i7B8VOD2q79uh
 jVzw==
X-Gm-Message-State: AOAM532+oAIduSsb9Br9wl7QhDnRqa8dCjOEfQOKf7on9G4d0N6J8Vr5
 s1UtmpfKShYnAcGx9cJtFJh0fONBJA==
X-Received: by 2002:ac8:5f91:0:b0:2de:2c33:53a0 with SMTP id
 j17-20020ac85f91000000b002de2c3353a0mr13535812qta.86.1646747607209; 
 Tue, 08 Mar 2022 05:53:27 -0800 (PST)
Received: from serve.minyard.net ([47.184.144.75])
 by smtp.gmail.com with ESMTPSA id
 x12-20020a05620a14ac00b0060deaee7a21sm7618790qkj.51.2022.03.08.05.53.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 05:53:26 -0800 (PST)
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:c14:fa13:8678:3728])
 by serve.minyard.net (Postfix) with ESMTPSA id 0EB0D1800BC;
 Tue,  8 Mar 2022 13:53:26 +0000 (UTC)
Date: Tue, 8 Mar 2022 07:53:24 -0600
From: Corey Minyard <minyard@acm.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v3 0/9] This patch series contains updates to PMBus in
 QEMU along with some PMBus device models for Renesas regulators. I have also
 added myself to MAINTAINERS as this code is in use daily, where I am
 responsible for it.
Message-ID: <20220308135324.GU3457@minyard.net>
References: <20220302015053.1984165-1-titusr@google.com>
 <20220304214354.GL3457@minyard.net>
 <CAMvPwGpzO3VyCqGJY28QVQoo9AwYxxrvP3RqPS6JTgpTk8ojtw@mail.gmail.com>
 <1af23dba-8f7a-8d93-706d-6e16067cdce2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1af23dba-8f7a-8d93-706d-6e16067cdce2@gmail.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::829
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=tcminyard@gmail.com; helo=mail-qt1-x829.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-To: minyard@acm.org
Cc: peter.maydell@linaro.org, Titus Rwantare <titusr@google.com>,
 venture@google.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 wuhaotsh@google.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lG0ajqJSiYRw

On Mon, Mar 07, 2022 at 01:00:02AM +0100, Philippe Mathieu-Daudé wrote:
> On 5/3/22 00:42, Titus Rwantare wrote:
> > On Fri, 4 Mar 2022 at 13:43, Corey Minyard <minyard@acm.org> wrote:
> > > 
> > > On Tue, Mar 01, 2022 at 05:50:44PM -0800, Titus Rwantare wrote:
> > > > v2:
> > > >    - split PMBus commit with updates into individual fixes
> > > >    - renamed isl_pmbus[.ch] adding _vr for voltage regulators
> > > > 
> > > > v3:
> > > >    - split uint refactor commit and removed commit renaming files
> > > >    - rename rolled into preceding commits
> > > >    - update commit description for uint refactoring change
> > > 
> > > This all looks good to me:
> > > 
> > > Acked-by: Corey Minyard <cminyard@mvista.com>
> > > 
> > > Do you have a plan for getting this in to qemu?  Like through the ARM
> > > tree?  I could take it into an I2C tree, but there's really not much
> > > activity or work there.
> > > 
> > > -corey
> > 
> > In general PMBus is more specific to i2c than ARM, but I'm not sure of
> > the QEMU implications.
> 
> Titus, could you address my comments?
> 
> Corey, if you are busy, I can take care of this series.

It's not a "too busy" sort of thing, the i2c tree doesn't get much
traffic.  I can take it, but it's not much different than just pulling
it directly.

So it's probably best if you take it.

Thanks,

-corey

> 
> Regards,
> 
> Phil.
> 
