Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp3315138ejf;
        Tue, 9 Aug 2022 12:14:47 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6+Z4clg9NZMM904TwmW+3Gz4V+s+j6lNiHXeErV0PIGGNTZRKXNP4fgMzb1RBvkNU8RCDK
X-Received: by 2002:a05:620a:25ca:b0:6b8:7633:baf with SMTP id y10-20020a05620a25ca00b006b876330bafmr19357752qko.515.1660072487173;
        Tue, 09 Aug 2022 12:14:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660072487; cv=none;
        d=google.com; s=arc-20160816;
        b=rPvaxvEkAGIk5jD9P3ywkEFGROTRT6kFwCeQ2Iicgq44ExMsCbm4/o2FYJ71HXchAG
         Qjgm3By6qWHyfRkTFjhEv/GSgU8pp1mvp+1vlRpAxciu5YQhgcitcJNPiZ7UyjkCHxCA
         iwdMPgkqAs0Dc1PlyAPr+MsJJ4loHdj+tKidjtXsvlbMNDRCJdwQyA4RUXKc1ZFyy+QW
         GR3rLjBiu88N12S3f5uUq0zm1b16GQmeZ2NsEUe5fZXoAs+aVw1lMk4KcGlI/40rB+LJ
         KTsCIp8W0Jktz3CiJhxjggqtpUmCY2qEdkYsa2KAxLnYnZCtEv996zdO5/kLoIuiOdGo
         S/bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date;
        bh=pRh/fGZDMcB5yNprkAxP2QlmSixfpHlEa34A7i6doPw=;
        b=I9ZCZnbMHtCtRgzZWBm3d07iv6+mQyCrhsvdwZhkTeZhA8UCcJE2iZQxBppauhNwDS
         8XCCMaYrp8WFFAGM8n32S4An9XIYeCNYc9jpSkjvIob4b1gX98SZmQgwB+BzyV8hOMmJ
         n/shxO4iecyzr7gQA58DNa4rIWBFaDhUbQAMLOybqVlY0pVxt2ef8wm07YDQ5+oL9Jkd
         qYkbxr7zCN2PccuWkHjCNhso8cxFWLVuxDl7LouPHIxNhrDtpgB6J5xVJQmK9B5Gh6yB
         IF+y4pnZ7TfAw8Ispex0a0/mk4NaZvT4mo90irHi6bhlC7cOcFror1Rxsh0z1UubuYX5
         QRgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x6-20020a05620a448600b006b98e3bfdbbsi1096632qkp.750.2022.08.09.12.14.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Aug 2022 12:14:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oLUgg-0000ux-KO
	for alex.bennee@linaro.org; Tue, 09 Aug 2022 15:14:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@fluff.org>)
 id 1oLUeL-00071r-BK; Tue, 09 Aug 2022 15:12:21 -0400
Received: from test-v6.fluff.org ([2a01:4f8:222:2004::3]:40962
 helo=hetzy.fluff.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@fluff.org>)
 id 1oLUeI-0005QN-M8; Tue, 09 Aug 2022 15:12:21 -0400
Received: from ben by hetzy.fluff.org with local (Exim 4.89)
 (envelope-from <ben@fluff.org>)
 id 1oLUeD-0008Bd-GD; Tue, 09 Aug 2022 20:12:13 +0100
Date: Tue, 9 Aug 2022 20:12:13 +0100
From: Ben Dooks <ben@fluff.org>
To: Ben Dooks <qemu@ben.fluff.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, Alistair.Francis@wdc.com,
 peter.maydell@linaro.org, qemu-arm@nongnu.org
Subject: Re: add qemu_fdt_setprop_strings() and use it in most places
Message-ID: <20220809191213.v7auszvz6r7uczw6@hetzy.fluff.org>
References: <20220809185639.750345-1-qemu@ben.fluff.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220809185639.750345-1-qemu@ben.fluff.org>
X-Disclaimer: These are my views alone.
X-URL: http://www.fluff.org/
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: ben@fluff.org
X-SA-Exim-Scanned: No (on hetzy.fluff.org); SAEximRunCond expanded to false
Received-SPF: pass client-ip=2a01:4f8:222:2004::3; envelope-from=ben@fluff.org;
 helo=hetzy.fluff.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WfhXS+twrm2T

On Tue, Aug 09, 2022 at 07:56:34PM +0100, Ben Dooks wrote:
> Add a helper for qemu_fdt_setprop_strings() to take a set of strings
> to put into a device-tree, which removes several open-coded methods
> such as setting an char arr[] = {..} or setting char val[] = "str\0str2";       
> 
> This is for hw/arm, hw/mips and hw/riscv as well as a couple of cores. It
> is not fully tested over all of those, I may not have caught all places
> this is to be replaced.                                                  

I've put a github repo up with this and possibly some other bits I am
working on:

https://github.com/bendooks/qemu/tree/dev/fdt-string-array-v4

> Changes:
> 
> v4:
>  - fix checkpatch issues
>  - remove error checking in hw/core/guest-loader.c
> v3:
>  - fix return value for the call                                                
>  - add better help text                                                         
> v2:                                                                             
>  - fix node/path in comment                                                     
> 
> 
> 

-- 
Ben Dooks, ben@fluff.org, http://www.fluff.org/ben/

Large Hadron Colada: A large Pina Colada that makes the universe disappear.

