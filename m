Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp510430ejb;
        Thu, 16 Feb 2023 05:50:30 -0800 (PST)
X-Google-Smtp-Source: AK7set/h8TY0BlfiqzVbJltr3hCQn/U2v9BcQpd8ZdjqD6s1/WnG/QryiioQ+Jhv8pu8uqjLgjfW
X-Received: by 2002:a05:6214:2684:b0:56c:1b8e:826e with SMTP id gm4-20020a056214268400b0056c1b8e826emr4240023qvb.15.1676555430175;
        Thu, 16 Feb 2023 05:50:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676555430; cv=none;
        d=google.com; s=arc-20160816;
        b=RAShw7LHnAFaSSUFtjgt/8e4Mrl4nGWp4IlcEti4WMo0jhtseG2+eC/J4AQUcwt3V5
         a4O53u3MRZylS/hAgU+qvUAiyQD+Lm6zywv2yR74pDNcHG2opoG7L5eL13+fVf8CKuMu
         viCEtozjpZHkaJYtpMTWjMAlvcxjraiqtprNAnsKP6oKW7LaSQtFuJ0PUyZ1w2KFRwvY
         w8+P4klvnbUMQKT8aD4gwBmXvdkRfpg8m3GcYqxGL1Qo25z3z3LaGNhDaVIicfGCHU2F
         BonFVOdHANGvT4nF13GPrXyUvuEFvZLTwkeLGnUkr91q5yrBnNr/q1K4OOhtJgY3AetM
         tcCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=9WF/ipwq06Qz6B8HqIL7CGVV6RQod5X/4JXg8s1N/S0=;
        b=KiJHdrT9aR5MTh4XkR8hRsKXos0ArwfzljNv81eW4KXwo7Kn+8oSjjT5sbKRfzsZkf
         trRpRoa250anSz6dSp4JLvaLfR4HwxtA1uivDBHJS4VDbQqxEo0nBbXsFBv1+aTKC6lU
         ZPf07fzqhtGwR4SOL8tz/Mj+mwatDV+8Y6pqV7rQEISkwT0mruO1VjjP64h4Ys84dktu
         vioT039T/uMgamUWLaqc38j+TLSYZfDQX22p0mAmImUNGEt1PmCYnfzfliFqK8GQFFm7
         GdWN0Z62AZbLSYyiPdokf6Anou7QZyszSl+2Uko+515KW9SkSb2RDzHqVxbxeOw1PuS9
         R8ew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=Ai3AyeEu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r7-20020a05620a298700b007201d5b5f49si1601242qkp.661.2023.02.16.05.50.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Feb 2023 05:50:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=Ai3AyeEu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSeeE-0003fW-4n; Thu, 16 Feb 2023 08:50:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pSeeA-0003Vh-Sk
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 08:50:03 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pSee8-00027P-9c
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 08:50:02 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 l21-20020a05600c1d1500b003dfe462b7e4so4275824wms.0
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 05:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9WF/ipwq06Qz6B8HqIL7CGVV6RQod5X/4JXg8s1N/S0=;
 b=Ai3AyeEuhYcFHbB1HX6MJ5osG8TBwu7A7k+Wt3clZdHkHlK1VOP4FVmBeN32yXqcpe
 HcHTXBNtahmv5eQd2B441BFCakDJCKPyg3Hdugms28YNC7wc/V2vTJVQjrqO1p7BiuCB
 4XkZfa7jT3OHukT7fjwWLIGt7q4I1uX7Jle5zv7of1Mk+5l/Kj/L/tncN3piB1qjsN3A
 ODLPARhc/DMl2FBkNFlZ8Cfh+4PiokimD0sUFdWwxYGW5bP1TAiTRKJtnJ2F2o6eifVy
 zRQXzEIdYhkog9lQbY+a4A2j1pu8DvOBaM3l7DcUsNFG5OkREjNfgVbuZ6nIljpyFBZ7
 Xlsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9WF/ipwq06Qz6B8HqIL7CGVV6RQod5X/4JXg8s1N/S0=;
 b=Nm1jdpu942T5BHCr67hCqd67VLzt8/+Cig/Ord5Klq9GL1WbT2DZ5DAk5TYg/L+Ra1
 kdaeCqM1hnE8316S8717LVc5YNlng+z6cM7dak+tYACEjLMZUsOFMcTUM947HQF9joUF
 fIvl+Pszyv+kzvwW42BmedWia63EwOj2gc2MrGs4/05FLoP9FQ5TdjQOPZe/f8Y5SzXP
 kahJt3/1isqXQzCUMs/lAUYhDYKFWqcsBT2OciAbPwzVRJ8+SO7SCht3HO0X0Usnymz8
 9RPxxikR1UGJA758kFwhJC/zUVOTItXfPAZ+zJNJjHja1RIqR0UuF9kgnrXxX6cdFYOQ
 x+FQ==
X-Gm-Message-State: AO0yUKXJoo+RQVCQhbLMfF4OVC/LmzJ0lNbV61adpDw/c+wOWr3IJnB0
 8merfkTqRx64KQ/T1trl3GdNAg==
X-Received: by 2002:a7b:c84b:0:b0:3df:f3ce:be44 with SMTP id
 c11-20020a7bc84b000000b003dff3cebe44mr172375wml.3.1676555398961; 
 Thu, 16 Feb 2023 05:49:58 -0800 (PST)
Received: from google.com (44.232.78.34.bc.googleusercontent.com.
 [34.78.232.44]) by smtp.gmail.com with ESMTPSA id
 t16-20020a05600001d000b002c56287bd2csm1531263wrx.114.2023.02.16.05.49.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 05:49:58 -0800 (PST)
Date: Thu, 16 Feb 2023 13:49:54 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org,
 peter.maydell@linaro.org, qemu-arm@nongnu.org
Subject: Re: [RFC PATCH 10/16] hw/arm/smmuv3: Make TLB lookup work for stage-2
Message-ID: <Y+40glPkaM0aK5C/@google.com>
References: <20230205094411.793816-1-smostafa@google.com>
 <20230205094411.793816-11-smostafa@google.com>
 <00066890-06bc-3091-8484-bf39c29df77b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <00066890-06bc-3091-8484-bf39c29df77b@redhat.com>
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: HYgsLBo0piaM

Hi Eric,

On Thu, Feb 16, 2023 at 12:32:21PM +0100, Eric Auger wrote:
> >      SMMUTransTableInfo *tt;
> >      SMMUTransCfg *cfg = NULL;
> > +    uint8_t granule_sz, tsz;
> >      IOMMUTLBEntry entry = {
> >          .target_as = &address_space_memory,
> >          .iova = addr,
> > @@ -764,21 +767,40 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
> >          goto epilogue;
> >      }
> >  
> > -    tt = select_tt(cfg, addr);
> maybe we shall adapt select_tt for S2 instead of using temp? I know
> there is a single range on S2 but well, use tt[0]?
We can adapt select_tt for S2, but we would need to have an instance
of SMMUTransTableInfo in SMMUS2Cfg instead of having vttb,tsz..
inlined, as the function returns a pointer to the SMMUTransTableInfo.
I don’t think we can reuse tt[0], as this would change when we support
nesting, so I think we just isolate s1 and s2 from the beginning.


> > -    if (!tt) {
> > -        if (cfg->record_faults) {
> > -            event.type = SMMU_EVT_F_TRANSLATION;
> > -            event.u.f_translation.addr = addr;
> > -            event.u.f_translation.rnw = flag & 0x1;
> > +    if (STAGE1_SUPPORTED(s->features)) {
> maybe check the enable state instead.
Yes, if stage-1 is not enabled, tt might not be valid, I will update it.

Thanks,
Mostafa
