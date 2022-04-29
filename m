Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp2502609lfu;
        Fri, 29 Apr 2022 08:06:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7TOjSd60rvH5p+1zihqxJ6OYQDBt1AX11t8vHsCIwqmqYajRPxEgkYpbfjRJUrVZsGazz
X-Received: by 2002:a81:7810:0:b0:2f8:5459:f840 with SMTP id t16-20020a817810000000b002f85459f840mr11854798ywc.13.1651244768779;
        Fri, 29 Apr 2022 08:06:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651244768; cv=none;
        d=google.com; s=arc-20160816;
        b=s8SDbLTc41jyDsGVS3dsJIKwZkkgM0NrOYY/9ibkjshk8/hNMcBVMA790o02DliQ0a
         +RkWh9eIZYvAqBzwdbJCpIm5uGbq5kYW+1RyTy2y3oKRfKZO0W3N1q/9HYcDL2QEWmxH
         Fml0rMPcn0ocJxWOg10v3CEq8mQ5EMuAIv+UE+dK1f4N2SSumivtWCifzZ7Yw766wLt2
         Rcng00+IDVRcmUdOKy+bt1E72XGQNBUipJYWT0SmDjPdUaxzF/bBjpN51vFem2brZ+g0
         ub2Or0KnNrJckfHXQWrGqwfHJkoP826Q5fRehHpZQS5yXQmkdF+WovaGRhR7aOyl8Z3S
         U9tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:to:from:date:dkim-signature;
        bh=1Z3kjwhrIPDN+JfWYCRFHqLdm9n4qZBs327Qi0dbXcg=;
        b=on6S1DXAReAQ6Qh1y9MSvpmyOOJCMxZjSB5R8ii1WCG5LnMp/L8709CLyoAkOqxE+r
         leWJRwB9DmRcrQKI/TvNjGaq0YFTJBtfsrqljpF1zlo0Crp6VstOo24pUNCcyItDah3A
         CRN8qCul8M1mplC/9cOhdARZOSeoZc+9jiAgXFF6E+OhoPW7FceBfNxit89IuHMCj/u0
         xcFzQC/iJ9VhwbHRFk6oyLTb5ey6UHp0Yqd1ipH3jWFNseFkfon5a3ie3Bc3fZT5xiNn
         1Vw58cEE9YCsTqM4kb8wxtQgekjdm/YgWmYAAU9+fsMH6wFTIqLtJbp1lDFcgSN7vXiv
         EKtg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@quicinc.com header.s=qcdkim header.b=NDIuYFl5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 186-20020a2503c3000000b00645492651f2si6366369ybd.394.2022.04.29.08.06.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Apr 2022 08:06:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@quicinc.com header.s=qcdkim header.b=NDIuYFl5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from localhost ([::1]:50378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nkSC8-0000Z3-5k
	for alex.bennee@linaro.org; Fri, 29 Apr 2022 11:06:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_llindhol@quicinc.com>)
 id 1nkS3d-00031X-CL
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 10:57:21 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:52541)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quic_llindhol@quicinc.com>)
 id 1nkS3b-0002Ov-0z
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 10:57:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651244239; x=1682780239;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=1Z3kjwhrIPDN+JfWYCRFHqLdm9n4qZBs327Qi0dbXcg=;
 b=NDIuYFl5JUF9gfI6vcdoP7tdu31s/WtvDFsooyF4YkxDLZvM5SqtaM3X
 6QWEdRTef4x233pYYzc7pnkCxRN5wVKD/oVNgPygsL3zEbAq7bmJ9I4np
 LjPwto3DsKQtwEr+FylBBol6KaqpT9nlbyRg9v+3c25RgTv3smQNDdl/f w=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 29 Apr 2022 07:57:17 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 07:57:17 -0700
Received: from qc-i7.hemma.eciton.net (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 29 Apr 2022 07:56:55 -0700
Date: Fri, 29 Apr 2022 15:56:52 +0100
From: Leif Lindholm <quic_llindhol@quicinc.com>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH] hw/arm: add versioning to sbsa-ref machine DT
Message-ID: <Ymv8tOY4WpEgZTqb@qc-i7.hemma.eciton.net>
References: <20220427182934.27075-1-quic_llindhol@quicinc.com>
 <991dee2c-c189-087b-f576-b2473cae229b@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <991dee2c-c189-087b-f576-b2473cae229b@kaod.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.47.97.222)
Received-SPF: pass client-ip=129.46.98.28;
 envelope-from=quic_llindhol@quicinc.com; helo=alexa-out.qualcomm.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jz6pNnBe4Qlb

On Fri, Apr 29, 2022 at 09:17:09 +0200, Cédric Le Goater wrote:
> > Signed-off-by: Leif Lindholm <quic_llindhol@quicinc.com>
> > Cc: Peter Maydell <peter.maydell@linaro.org>
> > Cc: Radoslaw Biernacki <rad@semihalf.com>
> > Cc: Cédric Le Goater <clg@kaod.org>
> > ---
> >   hw/arm/sbsa-ref.c | 3 +++
> >   1 file changed, 3 insertions(+)
> > 
> > diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> > index 2387401963..e05f6056c7 100644
> > --- a/hw/arm/sbsa-ref.c
> > +++ b/hw/arm/sbsa-ref.c
> > @@ -190,6 +190,9 @@ static void create_fdt(SBSAMachineState *sms)
> >       qemu_fdt_setprop_cell(fdt, "/", "#address-cells", 0x2);
> >       qemu_fdt_setprop_cell(fdt, "/", "#size-cells", 0x2);
> > +    qemu_fdt_setprop_cell(fdt, "/", "machine-version-major", 0);
> > +    qemu_fdt_setprop_cell(fdt, "/", "machine-version-minor", 0);
> 
> 
> Thanks for your reply in the other email. From what I captured, the
> DT aspect is not that important, but still, we could may be use some
> specific 'sbsa' property names :
> 
>     qemu_fdt_setprop_cell(fdt, "/", "sbsa,version-major", 0);
>     qemu_fdt_setprop_cell(fdt, "/", "sbsa,version-minor", 0);

I'm not wedded to the names, but given that SBSA is the (now defunct)
name of a (very much not defunct) versioned specification, I think it
would add to rather than remove from the confusion if we changed to
this; it makes it look like it's declaring compliance with a version
of the spec.

Fundamentally, these properties have no meaning to anything other than
the piece of firmware that knows that it is executing on top of the
qemu sbsa-ref machine. On one level, making it look *less* like a
well-designed device tree-binding is beneficial.

Best Regards,

Leif
