Received: by 2002:a17:505:1116:b0:1be9:327d:8ee3 with SMTP id pu22csp951689njb;
        Mon, 26 Aug 2024 00:14:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWI2buqyyfuVMCN5CDDDQzRs9Zjc+aG1Tk8Gm8IXb2aOGhnb/aqPOwZV5MTntxa8GrCpJoSCCcPA9cGTw==@linaro.org
X-Google-Smtp-Source: AGHT+IF/lndRufR1u6qOWJX7oL0MhLRXb+CdlFA33jBShNHf9q1GEfhYbABvw3qABz6QFUR0KKup
X-Received: by 2002:a05:620a:400d:b0:7a4:d5a1:e41e with SMTP id af79cd13be357-7a67d4b77fdmr2081085685a.35.1724656499026;
        Mon, 26 Aug 2024 00:14:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724656499; cv=none;
        d=google.com; s=arc-20160816;
        b=drmOOhi4EICRW6Asz4I3YgSnb5WdTIHH2QYQlMlEVH1+kwPkCsJDM4UYhxTKYiX7WD
         Ng+LX1sJe+ef4fzGYkNJlwrfylUtYVhIFrBivuYFRx52IXmH81asntDte2OeSiyUxSuc
         sZkDGARiPnQCScOF5dcZ0SyXktiTbX1riHZBmhM4sItP9jPlq/KoYulKmqmGUcj+0aAX
         jdes9JHa+wq5IILsLUWkA6aaEFHr8xgb0rp0iOB4Cu2QgoJdc602qKo2gRJw1gtJd+Ud
         q3Ij91H8udKik0gDGDnLSQwiwGjLpzITWOgrGM90d97G6ssIoUsN/9B5EoZcUqaex/k/
         cjsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=qORsi9Nht/pObnlnY1pqrTC+d0QjjOs3FipKFGQYNWM=;
        fh=NcvSN9LLWWWIPQcdJ9MQ4MSxyH4eQsj8kB/WvNIn+R0=;
        b=Sf34ENaKpNA4tZX6oJsgg1uVT6cdpBo+FAeRFk0kIs/IqtugHt+3jOPJ4hGrOJOBac
         l0Y7wYr8GS9KyTYL/yg7PtPqnRdrSPGf0KUhIr0dhFjcbo0OM5nrb3yDiQz8Ur42qiIC
         Gndnx3KJF+bXtVb7n5IFiSa0x2NiyKTpSRPXh5M9TW2V+5IKc0DzZkOLC6OpO2AugyeV
         PxeDaZ6GnU8SCbVFXjo9iAl6mJZfNV2pd2IVQyZ8Ut6hOOkVto1D90I9KAwNfW1Jpglt
         MYYn2A1blsIUeZc3oWNiEoO9Uo8acneNDL5C8VMzJVQHmUaBvcREt+vSqmMvXm8ffGVR
         iJSg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=AlZMagYh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a67f3d5c97si986612885a.297.2024.08.26.00.14.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Aug 2024 00:14:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=AlZMagYh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1siTvT-0003BK-S9; Mon, 26 Aug 2024 03:14:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1siTvR-00035Z-Uq
 for qemu-arm@nongnu.org; Mon, 26 Aug 2024 03:14:06 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1siTvO-0004s1-Oi
 for qemu-arm@nongnu.org; Mon, 26 Aug 2024 03:14:05 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-428141be2ddso34091015e9.2
 for <qemu-arm@nongnu.org>; Mon, 26 Aug 2024 00:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1724656441; x=1725261241; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qORsi9Nht/pObnlnY1pqrTC+d0QjjOs3FipKFGQYNWM=;
 b=AlZMagYhvyUsNZfNPy81+SsE1FPnbwR1Hl9YXPggdxhkyx1G4plp+wZcWaOtJdgv2y
 QaPl7KBKabart4wPGESHDIZB8WMO3i/q8C1nCdE8mq9tvrMEax/MTRDIxKAwXhaAPCOf
 6nCWXiY1aWo4s8LZ1Za0nrT40N7tl5rk5tNb3Dk6LMhipgkGdnWKUS05MxaSE2sooUUR
 9MIOusG4St6WPpxNzMERsjRf5HzOrYWQaNF6QzbItrAfexhaXT9P7WtYI3aMRcicjB2+
 8MI7c11GQVEuqHxX9MZemNJ9UGfaB9Ni3o+BpGrsVm08jzh/wg1ljzBNeO8uIKt0OMS1
 Rf0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724656441; x=1725261241;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qORsi9Nht/pObnlnY1pqrTC+d0QjjOs3FipKFGQYNWM=;
 b=TMpu7skSUPf0Ct1CN6iILhe31PVIHQ54ubggc8xUkfLUEIXdBBWGVTZf3XbIL5p/99
 Xx/sMTONGnY93pLyG7iZedh/GWAWMgXpPdrf2vEyhlVflF2yR5SVgEn+gNEyqEJuBkaU
 MqdIUoXcm6daNZrrK63CBc/63jtyzWqgiGp1gCf8rzrjThMuvgjjRnj2y3AgyYMHaxd8
 Msi0a97ZRpPsYy2om6omeOgKTHolPV+gnN2qOEIN+MYDBKMyGtvqYQcl4b0vvf32xDQm
 hKGnaqco0+2n7L3JrMD1i4z0LEGXNyDBv3+wFCI8X2rdxF35n3U0ESWuKARwdoBiRO9m
 qCcg==
X-Gm-Message-State: AOJu0YyP1K9F/F6IQfU1fWKxZKTkNm2rr6ueX51lhoHSK/lbPASmLYHi
 Fm9xeNKCFOSYBPPXIG+QKdmR93YIw/IPPLJnT0jnAlsFbkWGMal0F3AvwaqGa/A=
X-Received: by 2002:a05:600c:4e94:b0:429:c771:f32f with SMTP id
 5b1f17b1804b1-42acd5e41d9mr48346415e9.36.1724656440438; 
 Mon, 26 Aug 2024 00:14:00 -0700 (PDT)
Received: from sunil-laptop ([106.51.198.16]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42abed8b6a8sm183192545e9.2.2024.08.26.00.13.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2024 00:14:00 -0700 (PDT)
Date: Mon, 26 Aug 2024 12:43:48 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: JeeHeng Sia <jeeheng.sia@starfivetech.com>
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "mst@redhat.com" <mst@redhat.com>,
 "imammedo@redhat.com" <imammedo@redhat.com>,
 "anisinha@redhat.com" <anisinha@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "alistair.francis@wdc.com" <alistair.francis@wdc.com>,
 "bin.meng@windriver.com" <bin.meng@windriver.com>,
 "liwei1518@gmail.com" <liwei1518@gmail.com>,
 "dbarboza@ventanamicro.com" <dbarboza@ventanamicro.com>,
 "zhiwei_liu@linux.alibaba.com" <zhiwei_liu@linux.alibaba.com>
Subject: Re: [PATCH RESEND v4 0/3] Upgrade ACPI SPCR table to support SPCR
 table revision 4 format
Message-ID: <ZswrLDbIFpPpZDAW@sunil-laptop>
References: <20240823113142.161727-1-jeeheng.sia@starfivetech.com>
 <ZsicubCBw2YAjq9c@sunil-laptop>
 <NT0PR01MB1278D6E5A7CD617D9783C7259C8B2@NT0PR01MB1278.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <NT0PR01MB1278D6E5A7CD617D9783C7259C8B2@NT0PR01MB1278.CHNPR01.prod.partner.outlook.cn>
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: ezxXv2WE7CTi

Hi Jee Heng,

On Mon, Aug 26, 2024 at 07:04:11AM +0000, JeeHeng Sia wrote:
> 
> 
> > -----Original Message-----
> > From: Sunil V L <sunilvl@ventanamicro.com>
> > Sent: Friday, August 23, 2024 10:29 PM
> > To: JeeHeng Sia <jeeheng.sia@starfivetech.com>
> > Cc: qemu-arm@nongnu.org; qemu-devel@nongnu.org; qemu-riscv@nongnu.org; mst@redhat.com; imammedo@redhat.com;
> > anisinha@redhat.com; peter.maydell@linaro.org; shannon.zhaosl@gmail.com; palmer@dabbelt.com; alistair.francis@wdc.com;
> > bin.meng@windriver.com; liwei1518@gmail.com; dbarboza@ventanamicro.com; zhiwei_liu@linux.alibaba.com
> > Subject: Re: [PATCH RESEND v4 0/3] Upgrade ACPI SPCR table to support SPCR table revision 4 format
> > 
> > Hi Jee Heng,
> > On Fri, Aug 23, 2024 at 04:31:39AM -0700, Sia Jee Heng wrote:
> > > Update the SPCR table to accommodate the SPCR Table revision 4 [1].
> > > The SPCR table has been modified to adhere to the revision 4 format [2].
> > >
> > > Meanwhile, the virt SPCR golden reference file for RISC-V have been updated to
> > > accommodate the SPCR Table revision 4.
> > >
> > > [1]: https://learn.microsoft.com/en-us/windows-hardware/drivers/serports/serial-port-console-redirection-table
> > > [2]: https://github.com/acpica/acpica/pull/931
> > >
> > Just curious - whether this needs changes in linux side as well? Does
> > current linux code work fine with version 4 of SPCR table on RISC-V?
> The current Linux ACPI Table has not yet been updated to support SPCR v4.
> However, Linux RISC-V will be able to use the information in the QEMU's
> SPCR table to boot with behaviour similar to ARM. 
> > 
So, it means even if qemu risc-v SPCR is upgraded to version 4,
current linux continues to work. It may be just able to decode SPCR v2
fields only until enhanced to understand v4 but but doesn't break
anything or crash. Is that correct?

Just wanted to confirm qemu changes can get merged without any
dependency.

Thanks!
Sunil

