Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp3619721ejb;
        Sun, 12 Feb 2023 05:24:11 -0800 (PST)
X-Google-Smtp-Source: AK7set+5Ls86DTYx6AItv8sXBkKsVG5iBfrPixR1JYcwc4Qrs1LQIhZONrtIz6y5swt29Z/eMtNX
X-Received: by 2002:a05:6214:2522:b0:56e:99f2:1b91 with SMTP id gg2-20020a056214252200b0056e99f21b91mr12447813qvb.23.1676208251598;
        Sun, 12 Feb 2023 05:24:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676208251; cv=none;
        d=google.com; s=arc-20160816;
        b=Wxk1qHPfMQOFy80sXw8vr189qknc8UU5/vyH96yDXejtcqQQBwWg+OzFts82SU2kxP
         yJfe/XpjJzHiI8wlbSvawNL3tLft5BEBOK3DfGNQ0m/ZlX+aoOuQWqtVhIJ3dmX/4fZn
         NV+HfZhuYrHU6/sBDDcIiSmO8FRC9YsKJilRF5Dhj9NgOqaYyWys+UunTDkENfEdmv/X
         cFnAXujM0VBkpWsUs+1/LnzuHpFvdrjodBUjQNLLhsF+LJdQpMx4HA5Lt8I1bXICdOUR
         jLlSwdjEVBv+Fp5Y4+szsrJxvDTgmCpMlHwp0sfbCGRf1JHjTV0n+EhE35QsnCdB+0Lt
         jimg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:from:date
         :dkim-signature;
        bh=N27fPuB3jlFdibuLChm0kDRCfgTLPmc4/wRlsVMHL6w=;
        b=kmXaf1xWmsFvZVKOy83zav+CvUF3u0a5ymKNt6mQSs2wgYG2G1hc96YeIn0vgynRn4
         96PrOHENDKsfObqsJsxG6xSPgrQuZlunhLLxHJI6NxGkh9syDozW77aKde/SK3bFQQ/H
         N/u3f2xBwd8suO1Uc4VD7JOVWLoDsMaXGRZRWhLpLkYgRzj6jvnWZJ6SmrroNvsllVSt
         23G46FHPTqZNdy11EwBfdO8OA2gTG58cYOvbV5BpnKC3dMwkvzo7GCR+SPMDtHtZCBLC
         dE5ouemZd0Nkdvrx2fpEoQDDIeraR34PF03rSI1zSTx1qMGp0yLF+xZvTKrzVbhLBwyO
         gHhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=tETpUDrK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g17-20020a0cf091000000b005355c76d48bsi7658694qvk.537.2023.02.12.05.24.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Feb 2023 05:24:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=tETpUDrK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pRCKi-0003oQ-8r; Sun, 12 Feb 2023 08:23:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pRCKg-0003oB-RD
 for qemu-arm@nongnu.org; Sun, 12 Feb 2023 08:23:54 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pRCKf-0003s5-4a
 for qemu-arm@nongnu.org; Sun, 12 Feb 2023 08:23:54 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 j29-20020a05600c1c1d00b003dc52fed235so7176464wms.1
 for <qemu-arm@nongnu.org>; Sun, 12 Feb 2023 05:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=N27fPuB3jlFdibuLChm0kDRCfgTLPmc4/wRlsVMHL6w=;
 b=tETpUDrK6v1J1FgB0IPw+vV5p3eXlGyo7BEntipAuU9QURgjMcnLLTZxNJCBVdwbUM
 S7B+VYifzqdwTxGNcvFQaxxToy+x9/NvxF7FYUabR3QgkwWjtQARM54511p2jAM1CkVA
 Vy91z0THXTu6/3438Nfbl26Q1LTPrbhqhlkeCIjxBLoh+baLSTx2XThFHsbuxgn+U/Dh
 UbqPjCyfDXdxoezBCFELrHE7pibxfwLGeFzgcMR6SjbUDhQ6P83z+c7nm/WjxPc4rvgJ
 y5YJJqM2kEry3YSjCfa8gbvWTqkIer+ivkQpYUBLpIMKbb6uCTSUnjQjnydADVRnPgQB
 ldjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N27fPuB3jlFdibuLChm0kDRCfgTLPmc4/wRlsVMHL6w=;
 b=pv3Jv8hhnuE1clmV4RNx8k1q/CaSrGxPd+eZFkl8ScRBIdsMJ2NCUkxdj5VUrGSE1R
 GrRZGgZxjh+ZeLXi/knk+I6/JfjwD7XBdQOBFbTSYuGOIJrMO2YK/tnD/PNlgYH8jJ0J
 oX6olluaLGKOnbE0mthyyX80JJOyYDH16lHJT1zlyrojj874wmJBREfkdA3+YyNV4Lp/
 5aMYFDtJ3rGMu51Dp/DCGUU7u32k2NSI7hMwV3acP68qsSJhIRDVrar++y9usXq7aoDA
 kouVz7cwZ44QoVh0QpdDbFvnh+DR8ef58qbcyuhesrTZPG2xOHAcYSAjHclTEsE1yL5o
 b6UQ==
X-Gm-Message-State: AO0yUKX6GYPDb4IfRk49SmYscPnnoIsg1Kq6pjEsNUGFbWYrz7y67Dcc
 h4A9qBoQesS9nhYFk8e9O10u1Q==
X-Received: by 2002:a05:600c:3c90:b0:3dc:37b4:7983 with SMTP id
 bg16-20020a05600c3c9000b003dc37b47983mr331441wmb.0.1676208231041; 
 Sun, 12 Feb 2023 05:23:51 -0800 (PST)
Received: from google.com (44.232.78.34.bc.googleusercontent.com.
 [34.78.232.44]) by smtp.gmail.com with ESMTPSA id
 e1-20020adfe381000000b002c54f39d34csm3608806wrm.111.2023.02.12.05.23.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 05:23:50 -0800 (PST)
Date: Sun, 12 Feb 2023 13:23:46 +0000
From: Mostafa Saleh <smostafa@google.com>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org, eric.auger@redhat.com,
 peter.maydell@linaro.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v4] hw/arm/smmuv3: Add GBPA register
Message-ID: <Y+joYrG4aKC5cje5@google.com>
References: <20230210221951.1298668-1-smostafa@google.com>
 <9619db1f-5595-b95b-7643-ae345759a59c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9619db1f-5595-b95b-7643-ae345759a59c@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=smostafa@google.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -165
X-Spam_score: -16.6
X-Spam_bar: ----------------
X-Spam_report: (-16.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, MISSING_HEADERS=1.021, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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
X-TUID: OcFg6oyuT7Z3

On Sat, Feb 11, 2023 at 01:48:57PM -1000, Richard Henderson wrote:

> Just "return s->gbpa != SMMU_GBPA_RESET_VAL;".

I will update it.

> > @@ -1512,6 +1553,10 @@ static const VMStateDescription vmstate_smmuv3 = {
> >           VMSTATE_END_OF_LIST(),
> >       },
> > +    .subsections = (const VMStateDescription * []) {
> > +        &vmstate_gbpa,
> > +        NULL
> > +    }
> 
> Actually, I suspect that you need a pre_load hook that resets gbpa, which
> will then be overwritten if and only if the saved value != reset value.
> 

Please correct me if I am wrong. From what I see, the initial for value
GBPA will be set from smmu_reset_hold which is called from context of
qemu_system_reset from qemu_init context.
And migration will start after that in migration_incoming_process from
qemu_main_loop context.

I validated that also by printing the value of GBPA from vmstate_smmuv3
pre_load at migration without GPBA, and it is the same as
SMMU_GBPA_RESET_VAL.

Thanks,
Mostafa
