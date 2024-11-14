Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp260370njc;
        Thu, 14 Nov 2024 03:49:48 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXV/9acEoYgdG2ei+oHHbo2Kh2RS/JhwcKjLoVZMDNrqTSqznOAJdlqfxyqeGyyvB5J6OgdY9zlACuKDg==@linaro.org
X-Google-Smtp-Source: AGHT+IEIGi4Y3ZJO9qWZcQCJwN1MTxBiIYGpePQgM+36U1IasOfXsuTbFhyE6i1/qIU5GYSZic/K
X-Received: by 2002:a05:6902:12cf:b0:e2b:d6e6:4023 with SMTP id 3f1490d57ef6-e337f8bd240mr21523937276.36.1731584988178;
        Thu, 14 Nov 2024 03:49:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731584988; cv=none;
        d=google.com; s=arc-20240605;
        b=Rqg2zcylxvA81WPEtW8AO1y4kSKubMaPnczw0KZ4AuUGelR6haanpZAplxMvqFFSAN
         TYxiP2x4sJqA7UHO6XosJUjXcqEBdkk0jcB7i0UeErInRT8wuHJkPNaaZJlyMsJnDxuN
         DelAO59UiEEIippm7Ojp4moXW7AuZGEnP/KSJeWagzTsYg8zCQh3GrRdoD8TKCmpR+mn
         KiWTRSGWSOiK1mcGVNd2X4CJGxkKfEbQJNQFvfM6Ucqy9V1425u7rqbhyZnbljm3usUZ
         tmYLgvklD8sfbyRllq6BaOMZ6E4q5yPCNDxBHCDG6JaWh0SA90MmkkjtX3xxagIrst8Y
         sjvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=501jsXslFSInMb22a4IkIVmsRKR1Y9JBkjmGZehl0Zk=;
        fh=T3C8I5N1C01a/qdBZy6oxAuxAr6H3V30+zue8IhhuKU=;
        b=gxRwOe86L+ZTvRhBAxPB73/h0Ost31lTkOyFYtqCdg272NxATbZ8tR5orZM4rlKbTU
         icpdo/wSMbiECM73m0lJJqpJzd3Vp47jQhjv2VmDLCIV8xheN8CtRA0R7jU5xaArxFIn
         l0yyZpApA/4lc4IiD+g0ct2XThWBuhh/vXrtozT/G8+r0m+dWzaGsqzRdunx/rz7+ir0
         k40XZ7wgV2DWXcaoUBqVOoETQHA6hJVk+2mlPA0Kpg/eSk+NiYAiwBJqghfkrrhZltxZ
         4yGqH/TDJKji6B5sb95eCpyAM1W5Hgfx++60+tDE2eePly2AGotlSGdUz9QZKRZVHU7L
         b9ew==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=boQriYt4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d3ee930004si10483656d6.360.2024.11.14.03.49.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Nov 2024 03:49:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=boQriYt4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tBYLc-000562-7z; Thu, 14 Nov 2024 06:49:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1tBYLa-00055a-HP
 for qemu-arm@nongnu.org; Thu, 14 Nov 2024 06:49:14 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1tBYLZ-0003xW-0c
 for qemu-arm@nongnu.org; Thu, 14 Nov 2024 06:49:14 -0500
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5c934b2c991so11086a12.0
 for <qemu-arm@nongnu.org>; Thu, 14 Nov 2024 03:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1731584951; x=1732189751; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=501jsXslFSInMb22a4IkIVmsRKR1Y9JBkjmGZehl0Zk=;
 b=boQriYt45rM8N4KdB3iueoutoy+EcOeijCg4NPbvMzS/M2HtKZvrhYnHdtiXZNcL4B
 qBt22Kdx7hKkgJ0zLdslvJhqqF3Nud5xyy0uYiL7rSaLwaSVEwdyY4hAy1VNlNrwMKIy
 F2lDFMqFmwnGKxugrJ+Q6Gib+AA/USxjBL/0zc0Xw/rAX9QvvtYNwl2RMsIfSXmaE4DH
 MrYojzbaA8a8gd3M+5JXz6nZlCpGEnbOazDlYyPm2yZIm0dzVaUquVwtyAM53Z5dP5EG
 DWQ63aKEQSm5qQqLNqbCojmYAtLgSDU5p+oUf0ionZ8p2csJlKoo3J8AR2gwfBi1NO7r
 NEKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731584951; x=1732189751;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=501jsXslFSInMb22a4IkIVmsRKR1Y9JBkjmGZehl0Zk=;
 b=eKO1tu8/cUdeiZ3U5306xFsfPQ9w3rx7PNw/4zhVZIR/+p2UY4aAP3hs3Nx+RE/4d9
 jU7ccPoAZnaE5+gnWVzDe4SCc/fFTuFk0/SiRkKQzyOvoAqasAto0TLSJDs3xSVxWsyN
 7R7NiY+CLgNvR1BC37bRyGreAHCt2crJQKennCHZVG/EXwzHEo6bkYLl0PZNqhpqhkWL
 51Wc+fDghQF5rvlwPvuRzicT2syUnydfBiyNn6Jwbf1lpKqTQM4sKSHk4HG106fJkNRc
 E7DYqxqZYim2oubrYLKkrTy1IBSBxvuLPi1yUh203Ke3Jd3AbjzuPYq6HBo2pPXfI5yl
 8+KQ==
X-Gm-Message-State: AOJu0YxvFn5OennKh9H6OQn2VwHdzX9qM/m2A30FsoP3SjJ4GQYCpAnS
 +YLfffS6B7KXDiMKezV9JIxwTdzT636hEeSrYgeqWn/eaXR7ootAieVq08Q2WA==
X-Gm-Gg: ASbGnctARsbPAu7jItX2abLtljuBPd0KwiPd7gHvuj0VuvtJBiz6q2ZE0xMa1PvO7e1
 56lGhrxtGugvDz1TrgsiigdMfaYCeOhD62GK1/MzFrD89KYzVx9NTt3bS71mbK4v/ckdTATwkaw
 z52NsSvrinOcB1VluRbxCEpKUxIML2DFuxknKJah7KUxIThx/yNYPAX/tmmUw6csNb3peFoa9fC
 zj9HDh9whVtdCzWMjiNXNndDOIGbdT5ghpiP1bVFmj/AjE2YHAYmMHM7usTXHpT+uPZolwTlZ3c
 s5V+emVZpRXW
X-Received: by 2002:a05:6402:1cb1:b0:5cf:7b6b:8eb6 with SMTP id
 4fb4d7f45d1cf-5cf7b6b8f0dmr103286a12.2.1731584951121; 
 Thu, 14 Nov 2024 03:49:11 -0800 (PST)
Received: from google.com (158.100.79.34.bc.googleusercontent.com.
 [34.79.100.158]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432da29ffe9sm21305275e9.44.2024.11.14.03.49.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2024 03:49:10 -0800 (PST)
Date: Thu, 14 Nov 2024 11:49:06 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "jgg@nvidia.com" <jgg@nvidia.com>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>,
 "ddutile@redhat.com" <ddutile@redhat.com>, Linuxarm <linuxarm@huawei.com>,
 "Wangzhou (B)" <wangzhou1@hisilicon.com>,
 jiangkunkun <jiangkunkun@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>
Subject: Re: [RFC PATCH 0/5] hw/arm/virt: Add support for user-creatable
 nested SMMUv3
Message-ID: <ZzXjsvIz-ukxXi2Y@google.com>
References: <20241108125242.60136-1-shameerali.kolothum.thodi@huawei.com>
 <ZzTQ5Dn8ckIJjxc-@google.com>
 <200df57473694689a914e16f3db8db59@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200df57473694689a914e16f3db8db59@huawei.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=smostafa@google.com; helo=mail-ed1-x532.google.com
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
X-TUID: iCYbTZGDEAr4

Hi Shameer,

On Thu, Nov 14, 2024 at 08:01:28AM +0000, Shameerali Kolothum Thodi wrote:
> Hi Mostafa,
> 
> > -----Original Message-----
> > From: Mostafa Saleh <smostafa@google.com>
> > Sent: Wednesday, November 13, 2024 4:17 PM
> > To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> > Cc: qemu-arm@nongnu.org; qemu-devel@nongnu.org;
> > eric.auger@redhat.com; peter.maydell@linaro.org; jgg@nvidia.com;
> > nicolinc@nvidia.com; ddutile@redhat.com; Linuxarm
> > <linuxarm@huawei.com>; Wangzhou (B) <wangzhou1@hisilicon.com>;
> > jiangkunkun <jiangkunkun@huawei.com>; Jonathan Cameron
> > <jonathan.cameron@huawei.com>; zhangfei.gao@linaro.org
> > Subject: Re: [RFC PATCH 0/5] hw/arm/virt: Add support for user-creatable
> > nested SMMUv3
> > 
> > Hi Shameer,
> > 
> > On Fri, Nov 08, 2024 at 12:52:37PM +0000, Shameer Kolothum via wrote:
> > > Hi,
> > >
> > > This series adds initial support for a user-creatable "arm-smmuv3-nested"
> > > device to Qemu. At present the Qemu ARM SMMUv3 emulation is per
> > machine
> > > and cannot support multiple SMMUv3s.
> > >
> > 
> > I had a quick look at the SMMUv3 files, as now SMMUv3 supports nested
> > translation emulation, would it make sense to rename this? As AFAIU,
> > this is about virt (stage-1) SMMUv3 that is emulated to a guest.
> > Including vSMMU or virt would help distinguish the code, as now
> > some new function as smmu_nested_realize() looks confusing.
> 
> Yes. I have noticed that. We need to call it something else to avoid the 
> confusion. Not sure including "virt" is a good idea as it may indicate virt
> machine. Probably "acc" as Nicolin suggested to indicate hw accelerated. 
> I will think about a better one. Open to suggestions.

"acc" sounds good to me, also if possible we can have smmuv3-acc.c where
it has all the specific logic, and the main file just calls into it.

Thanks,
Mostafa

> 
> Thanks,
> Shameer
> 
