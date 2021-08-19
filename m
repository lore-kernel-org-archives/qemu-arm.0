Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp413268lfg;
        Thu, 19 Aug 2021 08:09:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzM0yu1BGJsn99WNSIi0TF4V9Uu6ezJe4K18PBfAQQRRfXrgi4Ll/m1ZuX6F9t6X1x8Tv7k
X-Received: by 2002:a05:600c:510a:: with SMTP id o10mr14319134wms.84.1629385741920;
        Thu, 19 Aug 2021 08:09:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629385741; cv=none;
        d=google.com; s=arc-20160816;
        b=gucKLRxXC8ACmnlyE5nshAZJTY2EvHHpzPaRslKXft9/I8etr6rXPJtSTYQGpmPMlV
         zT2LP3cSHo7QmWT+WLdH+hpxDJyXodxVlbcDv2x1HWJ7xbKjE1xDjH4k3a/Oi8xWB7Kt
         a5ghOSyKOASQgkar5PvCzef4DP9bwsJQ8Foa2vjWSKhsb28GqTGbw63+CDLhreEFM+Fv
         rltQtRQdNZRqp7B14+HQryHJ5OQOoCB0NhgBzKtsWR/pb7p4B+N+QtPJhd+ayylY3BRL
         txA7/Ye+jqt5eZUOA/RyEg+9Dh6NL5VBEvHknDGhIvCOrbtRdop8ScWFZWSsOqQvcwie
         2RPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=wTSfdHKyrfUWF/a3HOMjyp2gpqSV0AyL3rRVVlr+QnY=;
        b=d1Bk4CZf7VR3roW+XpKzSteZvcdNd8p8A9Ki8FVKqUzp2Pz/YyDEOC5YuV+nm3bqCO
         iPVQywtj8CTlQWN4FIFlocXF1/is4WshL+rBz1mN2dtlkkC/dDClcgRJZA2jaNwarNvi
         Xsv7UPE6Cl41dC8JESOhENVIXCW0LPidjOnJ5V6zDHA/RrrJbZWdXaPTvweTjM7DKdvA
         tBNH2XwuSB29nZQQL+J363aHTnuvkubfkvhuK68o+TRxLDKDB0SkGe87+SOH8VnARKoC
         /j12i5G31lxfNVIvbj54nC2rP3KHSh5/9ZMjmNUlHIgPIohjIFkbkpmy27/x0JRUNE8L
         4DEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LyDwb7pz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x3si3297687wmc.93.2021.08.19.08.09.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Aug 2021 08:09:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LyDwb7pz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:51668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mGjfB-00035m-0t
	for alex.bennee@linaro.org; Thu, 19 Aug 2021 11:09:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1mGjf3-00035a-0K; Thu, 19 Aug 2021 11:08:53 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d]:36425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1mGjez-0005gq-Tn; Thu, 19 Aug 2021 11:08:52 -0400
Received: by mail-lf1-x12d.google.com with SMTP id r9so13730639lfn.3;
 Thu, 19 Aug 2021 08:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wTSfdHKyrfUWF/a3HOMjyp2gpqSV0AyL3rRVVlr+QnY=;
 b=LyDwb7pzc56LuuPon7gZF8IGtd3dAfojDcmiZOX6dlg1uaZV+R5uwtyAi8jFQe0FkT
 XUxlEgErvFSGJjA7+RGDhIusOAz+KjnQDwISom1C/a12GqhfXpbpDqloWpTO3TZ33lXW
 N3pCfKDA2f9Q66TCUAktsiTXo+DGHNQCbxI2Or9MICX/oPqCq2nQveq5qZsXOvWiuk0H
 szNq2dTgGWuc+yiOCbu9KZfgERLIHS4/I0wy9EhDRakiwIee10FiEKu1NC7d7wPcmCWc
 kcAkQ9pZz1h1PsFhK3LjLid2V/A1y/qvZL2QJOtQUwdgMuPdcs1EMW+nK5X8DhYEAyzK
 js6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wTSfdHKyrfUWF/a3HOMjyp2gpqSV0AyL3rRVVlr+QnY=;
 b=VDlAYas0SATB3pzNlAFjHs0XdfBxGZZC9rzWKbkPWmwcBKfG8A2DbtxHz7egxa/Nvn
 gNV8XbOeBawZWAo4aR54x4ufKpSMTNfbmKOjbw4+FXVU8TZ6do6F4x/hrM5lwdUMxid/
 Bfpb0y0MsossOVOyML0+B0WaIMOO948gvyH4fFcXOoeO3DDw6be/QA1wzq91j3fI6J3b
 Iz5s+6F3Mq6EBE7fdudBJb2JBX8p1GvlytS/NivtPLqZDy2tHcwoXVcZdB9irWBtAiQm
 mccsEDZCR+Q/uLCQYDWdJd4WliIzQUCI4pq1VvyMjsxOY1gsj6i3+4sCmWFcmHFMmBgE
 EoYw==
X-Gm-Message-State: AOAM530qqaHgFzA08TQCKFbNh30OPAkk0L02iPDcnyeC9aSORRzO6oAz
 k5/eIdXvzDQ4IdQkhLLfwWc=
X-Received: by 2002:a05:6512:3c9d:: with SMTP id
 h29mr3876131lfv.206.1629385726953; 
 Thu, 19 Aug 2021 08:08:46 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id v14sm287148lji.32.2021.08.19.08.08.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 08:08:45 -0700 (PDT)
Date: Thu, 19 Aug 2021 17:08:45 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Tong Ho <tong.ho@xilinx.com>
Subject: Re: [PATCH 0/9] hw/nvram: hw/arm: Introduce Xilinx eFUSE and BBRAM
Message-ID: <20210819150845.GF3586016@toto>
References: <20210819040308.675057-1-tong.ho@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210819040308.675057-1-tong.ho@xilinx.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 alistair@alistair23.me
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Q8JjcT6RRRxK

On Wed, Aug 18, 2021 at 09:02:59PM -0700, Tong Ho wrote:
> This series implements the Xilinx eFUSE and BBRAM devices for
> the Versal and ZynqMP product families.
> 
> Furthermore, both new devices are connected to the xlnx-versal-virt
> board and the xlnx-zcu102 board.

Hi Tong,

A few general comments.

Patch #1 should probably be moved to be the last patch of the series.

I think we should remove the commands about register generation
"Partially generated by xregqemu.py". It may be confusing to others
since it's not a tool we run in the build process but rather a one
off extraction of reg definitions...

Thanks!
Edgar

