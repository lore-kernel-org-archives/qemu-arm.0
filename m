Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp3179091ejb;
        Mon, 20 Mar 2023 12:30:50 -0700 (PDT)
X-Google-Smtp-Source: AK7set8Q6mqpxrFIzieWGbKF0mmOANAtIrxpNo3gpZH5rfkzIcP0GKGhko+I2bZZOIMbpcZaApXM
X-Received: by 2002:a67:efdb:0:b0:426:3b7f:64ad with SMTP id s27-20020a67efdb000000b004263b7f64admr61658vsp.29.1679340650162;
        Mon, 20 Mar 2023 12:30:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679340650; cv=none;
        d=google.com; s=arc-20160816;
        b=MKtQP7Oh2kJQZrKuNpeR4v9r+zfMKlgRFaFxchP4nEPNWH+qAEcGpFRbe+ME3QNZPm
         EFklfamvLL8nqrFwFIfMDmBf4lBZXtiB0J+LEhE1P028qxScTGDio2kOq+GjN+oNEzaq
         CI57AEegQSiaTqGWY7oafyad8wMGps5vdp6T4i20aPOZRZ2+QtFo2C+U0+hxoXwGuysO
         3XuPLGBhix4JA8FLjJbOsLdOTwryfzljpCKGpNavP41y3graaXiI5A7VW4bqfxm9Q5lo
         oN+nqr5SPb+IOFyfCO+xlsmWhZhUBqnaHqPMsDHkJnjVBVSVlQIesjmRIeChe3TYonz7
         Wp2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=SnUV8hN39JglPIbCSoORn1R7yDyPl5d1L/ZnrEvRfrw=;
        b=oXG/PlkuFuDOOz3RZGCEsrZWSUABSoAL0AaL/jyoPGGqBFtiRHdcs7ApqHMnsHQSJ0
         Ig8y7XKrarGdRdPZc0zvMBMGoF7ydDnI2KKYEGNogCh9tFh57HLp2c6+ZnimNSIlKiMZ
         Gjwz1f3pVghXQ+2xUGd8ugWPqlBsNq8A/+xxbRsB3atQNaBdBQVWh0vAxyxn8uahgtyB
         GqsIRcRCOkNI2pmXcL9IdXgZ9bXKiXtn2VlYNHtmg5bNy3mRr936baUJu2ms6U28w7Bw
         xfWJuMjt7fqammRhjYH79WQ+1ksIDfueGueW8WD+bOLCTht31j7mCQGt0yFztOkADUFS
         Sqkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=I5fcfXYf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d21-20020a376815000000b007456b2d8ddcsi6580121qkc.604.2023.03.20.12.30.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Mar 2023 12:30:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=I5fcfXYf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1peLCt-00010t-5X; Mon, 20 Mar 2023 15:30:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1peLCr-000100-AL
 for qemu-arm@nongnu.org; Mon, 20 Mar 2023 15:30:09 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1peLCm-0005fN-0d
 for qemu-arm@nongnu.org; Mon, 20 Mar 2023 15:30:08 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3ed5cf9a455so129335e9.1
 for <qemu-arm@nongnu.org>; Mon, 20 Mar 2023 12:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1679340600;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=SnUV8hN39JglPIbCSoORn1R7yDyPl5d1L/ZnrEvRfrw=;
 b=I5fcfXYfTp9KPUoFp4hSj0i0nL867aWFsTnLm35b9B/WToM6pN7jzsbE5CwHqyA43z
 5Rkvyj8T2Yx1usuoIadVv7RI6Ly3cWYjdKG0/8cnLwKYbR79hDFiCXijgvi7U6Mif9wj
 cYlpwOKh+F1RtQa+UcbMz5nsjlCrxSgcnqGuhLCFU8IlfffIZ+k5BMnqoQlgwDv0rcXy
 4MHKXvZlkSdCGFG2o3LB8dbBYNVB2QU+u5c/u2ovKxuh27XpYv/a8qasoUnKh/mKiZrV
 BZtVBKm7tkU2aQv9mL7OWaE04Y2r9Os4OAK/+rVk+fRbduPJcfSFmjw89mXV8iO3CQsQ
 LQLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679340600;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SnUV8hN39JglPIbCSoORn1R7yDyPl5d1L/ZnrEvRfrw=;
 b=tLObVugF5eTiMnlCBj81t2n6ntWQ3ndz3Nulo32USkuCV/lZS1E56Kc7Hx34R/HSlG
 9Md9tAv6lHZAfYlxiRZTw/ddOZHXAEDCoUXpl2fZnyePNwIa8REzlNIkJ85uVzaOYXQL
 1m9OhjM9ttOy5jyw34pKb6D+TyR0zuir7wWwkj09QEJIAg4yLH/iawtG1LBgRcxhAbnS
 GkpKAKu630k93Lf5lsKgw1yovU5CoZhJtdq5u0fStJe7SBmf8oDsDdiA3htzI6NIQUlx
 Ep2nmbXhB4YUgEN/K9+nkJRy0IV6/DPZJvpb5jSBU1pnseysuavzyv+POv7VwKzN/k6D
 bMhQ==
X-Gm-Message-State: AO0yUKVAyW4gHOpWZ0GVfDLQ6kERqOSWYL2+PHU/Ooe3hEH8AkLhvI2u
 he3QFX1dXn0En2YFZmtxin3ruQ==
X-Received: by 2002:a05:600c:1c12:b0:3df:f3ce:be44 with SMTP id
 j18-20020a05600c1c1200b003dff3cebe44mr27522wms.3.1679340600339; 
 Mon, 20 Mar 2023 12:30:00 -0700 (PDT)
Received: from google.com (44.232.78.34.bc.googleusercontent.com.
 [34.78.232.44]) by smtp.gmail.com with ESMTPSA id
 z23-20020a7bc7d7000000b003ee1b2ab9a0sm1146241wmk.11.2023.03.20.12.29.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 12:29:59 -0700 (PDT)
Date: Mon, 20 Mar 2023 19:29:54 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org,
 peter.maydell@linaro.org, qemu-arm@nongnu.org, richard.henderson@linaro.org
Subject: Re: [RFC PATCH v2 08/11] hw/arm/smmuv3: Add CMDs related to stage-2
Message-ID: <ZBi0MmXpQJFxh/bh@google.com>
References: <20230226220650.1480786-1-smostafa@google.com>
 <20230226220650.1480786-9-smostafa@google.com>
 <4960b6a9-4044-eee4-c790-fd18ce1033e8@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4960b6a9-4044-eee4-c790-fd18ce1033e8@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=smostafa@google.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: OpiL1thOV4SN

Hi Eric,

On Mon, Mar 20, 2023 at 05:51:07PM +0100, Eric Auger wrote:
> Hi Mostafa,
> 
> On 2/26/23 23:06, Mostafa Saleh wrote:
> > CMD_TLBI_S2_IPA: As S1+S2 is not enabled, for now this can be the
> > same as CMD_TLBI_NH_VAA.
> >
> > CMD_TLBI_S12_VMALL: Added new function to invalidate TLB by VMID.
> >
> > For stage-1 only commands, add a check to to throw CERROR_ILL if used
> s/to to/to
Will do.

> > @@ -1211,12 +1211,22 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
> >          {
> >              uint16_t asid = CMD_ASID(&cmd);
> >  
> > +            if (!STAGE1_SUPPORTED(s)) {
> > +                cmd_error = SMMU_CERROR_ILL;
> Well looking further this is not said explicitly this should return
> 
> SMMU_CERROR_ILL. Maybe you should mark it as a guest error because we do not expect a guest to send such command when S1 is not supported?
> 
I can add a check after the switch for SMMU_CERROR_ILL to log a guest
error. 
> > +                break;
> > +            }
> > +
> >              trace_smmuv3_cmdq_tlbi_nh_asid(asid);
> >              smmu_inv_notifiers_all(&s->smmu_state);
> >              smmu_iotlb_inv_asid(bs, asid);
> >              break;
> >          }
> >          case SMMU_CMD_TLBI_NH_ALL:
> > +            if (!STAGE1_SUPPORTED(s)) {
> > +                cmd_error = SMMU_CERROR_ILL;
> > +                break;
> 
> there is a VMID field. Can't this be used in S2 mode as well?
According to the user manual "4.4.2 TLB invalidation of stage 1"
CMD_TLBI_NH_ALL causes CERROR_ILL if stage-1 is not supported.

Thanks,
Mostafa
