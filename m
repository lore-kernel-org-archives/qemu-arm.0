Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp631048lfg;
        Tue, 17 Aug 2021 08:36:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCPUC+mLmMm80cOK6YPkYx+2mjNu3WT4r1oioqWPxHQ/0BhTmpU1sm6eVMcGy3TCADc9S6
X-Received: by 2002:a1c:2390:: with SMTP id j138mr4108930wmj.51.1629214618494;
        Tue, 17 Aug 2021 08:36:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629214618; cv=none;
        d=google.com; s=arc-20160816;
        b=hU7Ryed/gPkJqOLWCXG5Y1dG+YuxwBX9i52vw6o2MvgM6ARrTHKIhNSw1KcM1NfoQj
         P5JtYupBML4BjVsajJ842hZoeIZzy/Cb4nYMP+fOPXSbtSkoHBeGAQS7KbiPMZBjwwge
         Vsnyq1T8atpetx2iVeVdDY967o0rrzvz91xAYPPVPVkhMzsL/WbwEAARU0oK45cSKz2U
         T40fKFzqxtT/HBBbjS5ojqGD4IaU3vWomZhfi+Shz4RVdogtWSjWNZhDLo2hxCA3tlLR
         cHwYp8z+B6DrjE1cWKMoRAmlRGxXL5U24TlyMaYrFiWcR4Pt0c47ghyPmYlxmttzy/6x
         3veQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=b+VmwD56EwOvPyi/fVA5MFZG0BcmnMhP9lsat+fDEL0=;
        b=B76ilOu+cukoH4SPPWI4z6QHvs4KDuunJuFG4dK6IG9yNk/Bmb2jjQSOjd4ChjTDf7
         jxhcJZJiObBWcEC5sWPaZkPPk+vuPqq+vzWk6FzazmA9HICr0ZDMKYLGxvCe29Kbk/b1
         z3svMXPjPgtcBL/1JLfRLJuC1G2MspiLGaN42QU1ceq0PLLapQkiQ1oQdUO45Ou2ix5R
         hCS4MdC9GEqGqvNmcPLZdNPF5VvJiu4D74DQqY74FjvFecBxRMf6ZGpvVFeRb4iTrLPy
         5tLr9ranGKPR/M79sDEkVDHT+haYH+tvPTdC7tmG6eUk/0TmnUWbon69toTOBCQHS0SS
         m2EQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=DPBG4lF9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c13si2608527wrm.572.2021.08.17.08.36.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Aug 2021 08:36:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=DPBG4lF9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mG197-0004U6-DZ
	for alex.bennee@linaro.org; Tue, 17 Aug 2021 11:36:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mG190-0004SW-G2
 for qemu-arm@nongnu.org; Tue, 17 Aug 2021 11:36:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mG18w-0005Eu-UV
 for qemu-arm@nongnu.org; Tue, 17 Aug 2021 11:36:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629214605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b+VmwD56EwOvPyi/fVA5MFZG0BcmnMhP9lsat+fDEL0=;
 b=DPBG4lF9ao3Kvmpew+5moqzMYGqqHxzD6sMdma6NezmqW3PqbSZgnRa0WcCExUItCus4kK
 3SqlTl5t5g0N4qw92Wg4E6q6kbstfD5sukRUPwpW6QB1dqxkkna8MV7vU3JC5RtvfD89uQ
 rSYNBAGyAQ8NtVlG2j4bOSL35PIdwkc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-mz-xHXhyN_yrzVxuRMgI6w-1; Tue, 17 Aug 2021 11:36:43 -0400
X-MC-Unique: mz-xHXhyN_yrzVxuRMgI6w-1
Received: by mail-ed1-f71.google.com with SMTP id
 di3-20020a056402318300b003bebf0828a2so6731101edb.8
 for <qemu-arm@nongnu.org>; Tue, 17 Aug 2021 08:36:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=b+VmwD56EwOvPyi/fVA5MFZG0BcmnMhP9lsat+fDEL0=;
 b=hs4PCpjgkTTADZpXp6PkGMDnzNO9VXGPr7K3/tjxj7zjucFbkrY1+EUmeR8y1S9ch+
 gGsAS59OFNyl0t5TDRN1RrrMLHrKxGidK9CC7nOoIyj9DgtQHglCdo/VPgSzVdlj2txL
 8d7uIgA2F+QwFHenokDwm0rMQzz1q88cBAKX1FFWLEmB+B6Zou/rV/VmOzViH/XV2yul
 09koWs2tXv+wmnrA+O8O8spf3sbLTjZKJEoGjxBKYtjXxLtTxb2BkxFl6if4wAM9IblB
 ShRtkBFroXicUq5vR3fXpnTm6pa2lH4KM/vJYGrplIOUwqY3z5JPaghPizGG7TceuKuc
 wtwA==
X-Gm-Message-State: AOAM531uVL6svYOD/yyLaRmdb+vgq2Ty2SvAdQJZ7H4QPYG4hHLJU2GG
 OOZguvMDy02fyUPcjM/svWIkiCkWyxtrvI8+cblwoPSzI2WDyDF2TXcB+jslo/CDdH4mcoMELvc
 LuxU6RFlhqyxZ
X-Received: by 2002:a17:906:e0d2:: with SMTP id
 gl18mr4638993ejb.35.1629214601453; 
 Tue, 17 Aug 2021 08:36:41 -0700 (PDT)
X-Received: by 2002:a17:906:e0d2:: with SMTP id
 gl18mr4638976ejb.35.1629214601284; 
 Tue, 17 Aug 2021 08:36:41 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id v10sm1254734edt.25.2021.08.17.08.36.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 08:36:41 -0700 (PDT)
Date: Tue, 17 Aug 2021 17:36:39 +0200
From: Andrew Jones <drjones@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v4 1/3] target-arm: Add support for Fujitsu A64FX
Message-ID: <20210817153639.o5fxdgmuhjusvyhq@gator.home>
References: <20210812060440.1330348-1-ishii.shuuichir@fujitsu.com>
 <20210812060440.1330348-2-ishii.shuuichir@fujitsu.com>
 <20210812091650.i5np3szvdoelu2cx@gator.home>
 <20210812092517.mwcfhksoe4cgy3cl@gator.home>
 <TYCPR01MB6160B0A6E08CAE7CB2C6D8F0E9FE9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
 <20210817115635.d2wxvnvis5kupegh@gator.home>
 <667f9384-cd28-8e4d-ebd1-4ed4b651676a@linaro.org>
MIME-Version: 1.0
In-Reply-To: <667f9384-cd28-8e4d-ebd1-4ed4b651676a@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XWH43QLxVugW

On Tue, Aug 17, 2021 at 05:23:17AM -1000, Richard Henderson wrote:
> On 8/17/21 1:56 AM, Andrew Jones wrote:
> > I guess it's fine. You could easily create a new cpu_arm_set_sve_vq()
> > which would forbid changing the properties if you wanted to, but then
> > we need to answer Peter's question in order to see if there's a
> > precedent for that type of property.
> 
> I don't see the point in read-only properties.  If the user wants to set
> non-standard values on the command-line, let them.  What is most important
> is getting the correct default from '-cpu a64fx'.
>

So maybe we should just go ahead and add all sve* properties, but then
make sure the default vq map is correct.

Thanks,
drew

