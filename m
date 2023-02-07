Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp5631861ejb;
        Tue, 7 Feb 2023 10:08:34 -0800 (PST)
X-Google-Smtp-Source: AK7set/IQoQHmMz3ypLYZaCIMaFBXVrjl3WEnMfhqDLFBn6pjhc+VMCiJ4gQfWOgS6nlUo5pqcKM
X-Received: by 2002:a05:622a:493:b0:3b8:3391:bde5 with SMTP id p19-20020a05622a049300b003b83391bde5mr7408794qtx.26.1675793314788;
        Tue, 07 Feb 2023 10:08:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675793314; cv=none;
        d=google.com; s=arc-20160816;
        b=Ibnn8or4ykHWdm5hFAmIy7QOE+e89hzujtQoemORCWO/V21uFtW7t/3WFtMYYWbkJC
         bTaA/f64EUSdq3BxLpysOHgKPFWHytm1nEo9e7RuSMGchxe/0RkUHhwv2UtJgNk6n0Ea
         D+JhFVgamn3OEmZdIU95lcYgssg6fuXHz34S/MCxkbukzgDw+PEx59zUoZPdmL+A8Jqj
         lwwPEIWqaY5EUIP624kRjuFhDT6xY9DMVbkjchYDOofVurDtwMxl9n3sEravuokwJpWO
         vMUfuhjah56yTkuCvnQC9M36pYulasMPVGxug6I075HVf7cH+89+b2Ddfc9wlvUs+kY4
         15ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=Ph3FtF6Gv/w/0QY5AV76m674VYhK0WMzSLKeXPU3VT8=;
        b=I8cOCQpP08UPg1yKdwD8SrxB2hROsiBYl3OahuUpE3GgG3EDwVImO4h6LMqkzC5XdB
         a+aY0lD99D2QVm1Eg/MtNltQU8jmKiGctMl/UlkTsgyVlR7EfAOqR6tnRBTv28LOOQ0p
         cZshT+fLkHalJUn9QFZDYpj9H4EBwVZP8eHaHIsOoyYKAJPYSIhVqN7gsTe89nswZ/XM
         nRFZtgWpoTYophfWieOzUACPdrxF+UddI3hykfYphXbBjAxvczNCNCipeHA3QlWErUhU
         U3DwOMobSupGFwxyFofKr1aKBUmk20BtXQ7deu/r3nCs3p4yCCPftz48/He+CL2MG8TB
         nXKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=ZTQViDBF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 128-20020a370786000000b00719f547eb67si11427963qkh.183.2023.02.07.10.08.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Feb 2023 10:08:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=ZTQViDBF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pPSNy-0003zT-GU; Tue, 07 Feb 2023 13:08:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pPSNx-0003yW-3N
 for qemu-arm@nongnu.org; Tue, 07 Feb 2023 13:08:05 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pPSNv-0002B3-GS
 for qemu-arm@nongnu.org; Tue, 07 Feb 2023 13:08:04 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so13810755wmb.2
 for <qemu-arm@nongnu.org>; Tue, 07 Feb 2023 10:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Ph3FtF6Gv/w/0QY5AV76m674VYhK0WMzSLKeXPU3VT8=;
 b=ZTQViDBFio4J73KYlhcTZjeY0cK+IYZM6QJsf3Sg8ZCV1DZn3iZDbP4rOyioCTmygL
 0rCPYjyKKbUK6mo95nGrc7nMp7GfLIkUEDs+AYqxm78PYj/7CSXHRBFBXYQq8WaydroM
 A7j9oQi3ynhcj+BHe+k3UzPeReATp1t4PuxbKP1cLBd4sgZGb5PnMymnJRr5dolz4IOA
 y7p8RQKqWB/z2HtX58bhaWJipgDxWLk44oo2UPSZtVSjLKV+LZqy4iG2zxPlZwoTO4aE
 Db3rho7cmnHeYIeX4BDeeKmhFr1Xl2VWhdSzqjXKph90paFQq4XDq/Y8zp/S5nebSdzh
 /TVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ph3FtF6Gv/w/0QY5AV76m674VYhK0WMzSLKeXPU3VT8=;
 b=pt/TCMv4DH7SKYBJrCE8JJtMjQEWxUfThFaAzgzPDhvR7IFZkA/hv0/QGW/ICTbRvQ
 CHDF9FUTNcRPMlla+/OXhUyJb2b+xuZnXEgs/sEpLpMNpO3OF1aAS2pwhgnSEumnKdZT
 mokX7Ipzxrbj+tn7oLo0+G+lhQyfNV49o/o0eXDM1igwBo8rHpCMngtib6D2oBjI7482
 0TDqXdWpemTO7d4wIN64Wi4WfeNQb3ijbrSr2C1/Dw0vMqmpQLSv4efGovTfJLuLbMG4
 n/taQxQzhL/jMUadiRJi32zr6C3wEylMrrMP3DGHwT0v1+QVDp2bAJRm09/OWIcMN9Jk
 TMGg==
X-Gm-Message-State: AO0yUKVzUQs+IGzsWlvVxk6REAJAqMrU2IfKU+OyDPcChNSUoeKyEE7J
 o8PIDEkDRPG4rjvPma7WNwRU0A==
X-Received: by 2002:a05:600c:4f54:b0:3df:f3cb:e8cb with SMTP id
 m20-20020a05600c4f5400b003dff3cbe8cbmr242685wmq.4.1675793280796; 
 Tue, 07 Feb 2023 10:08:00 -0800 (PST)
Received: from google.com (44.232.78.34.bc.googleusercontent.com.
 [34.78.232.44]) by smtp.gmail.com with ESMTPSA id
 i3-20020a5d5223000000b002bfae1398bbsm11805596wra.42.2023.02.07.10.08.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 10:08:00 -0800 (PST)
Date: Tue, 7 Feb 2023 18:07:44 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org, eric.auger@redhat.com,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v2] hw/arm/smmuv3: Add GBPA register
Message-ID: <Y+KTcKmTGXqKGID7@google.com>
References: <20230126141120.448641-1-smostafa@google.com>
 <CAFEAcA_gdg_bUwasDs0O54qL5_2=DEMzAFu22x4d7mrx6W5vLA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_gdg_bUwasDs0O54qL5_2=DEMzAFu22x4d7mrx6W5vLA@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=smostafa@google.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: jVEf0d+GUxtc

Hi Peter,

On Tue, Feb 07, 2023 at 02:03:02PM +0000, Peter Maydell wrote:
> On Thu, 26 Jan 2023 at 14:12, Mostafa Saleh <smostafa@google.com> wrote:
> >
> > GBPA register can be used to globally abort all
> > transactions.
> >
> > It is described in the SMMU manual in "6.3.14 SMMU_GBPA".
> > ABORT reset value is IMPLEMENTATION DEFINED, it is chosen to
> > be zero(Do not abort incoming transactions).
> >
> > Other fields have default values of Use Incoming.
> >
> > If UPDATE is not set, the write is ignored. This is the only permitted
> > behavior in SMMUv3.2 and later.(6.3.14.1 Update procedure)
> >
> > As this patch adds a new state to the SMMU (GBPA), it is added
> > in a new subsection for forward migration compatibility.
> >
> > Property "migrate-gbpa" was added to support backward compatibility.
> > However, if the GBPA.ABORT is set from SW at time of migration, the
> > GBPA migration will be forced to avoid inconsistencies where a qemu
> > instance is aborting transactions and it is migrated to another
> > instance bypassing them.
> 
> Nothing ever sets the migrate-gpba property to anything
> except its default 'true' value, so this (a) means that
> it breaks migration compat and (b) seems a bit unneccessary.
> 
> Can we say "migrate the field only if it is something other
> than its reset value", not have the property, and get
> migration compatibility that way ?
> 
> Otherwise the patch looks OK.
> 
> thanks
> -- PMM

Thanks for reviewing the patch. I am not really familiar with migration,
My understanding that this would be set from cmdline(that is how I tested it).

But yes, you are right, this is actually unnecessary, we can just
migrate only if GBPA value is different from reset value.

I will send v3 with this change.

Thanks,
Mostafa
