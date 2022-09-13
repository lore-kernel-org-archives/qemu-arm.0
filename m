Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp567557ejy;
        Tue, 13 Sep 2022 11:30:02 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7A47ckWYeiACRj/me1Ie1RDVIB03tqIPd2tWnibdc2OR6BdKp40RVAvnIvQiSPB50scU9d
X-Received: by 2002:ac8:5ad4:0:b0:344:5e40:7824 with SMTP id d20-20020ac85ad4000000b003445e407824mr29783951qtd.482.1663093802233;
        Tue, 13 Sep 2022 11:30:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663093802; cv=none;
        d=google.com; s=arc-20160816;
        b=hdeooSndU4vLagvQsYaRg8k6QnXa7xE9AW6wGk5K0+1Zqn5/12zawpQzVXG9RBA2Bm
         nKzaf9fx6H/HZyNnp4qeDnX+5z8mwYA3+DjnRCsdwS3V3AXwdYbqJeTJV3SyXcvuscCw
         AJ31riZ9ucs3aqeYUEs41pehjxTeuthl6clTxJL2J54E/dAALkGhY3TB6TIRTBR6E88c
         m6W61E+5aIRgre0HFgTQusHxctSX06m93WYOW58JA1SNmXlvthe2vJd3wYPZYHcbCkp3
         kjrcDVWEQEmfe6/QcBTn+CSvK25brMgEHB1cH5iLKk8/2TzXirDQ7JojfffGS8vf8xVt
         4LBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=vdpSw8+PtHpAQyo8pl0/USlNugYQ2VLasY9z9HCOvjo=;
        b=H/qYAnBKUfyhyd3QDWXbYXDZsG8/gPXb8cpTGcic1qhB7I56cF0i1qd5tYUw3va0r0
         baz1xVzPRCjroMhxIWGV85oy7YmR4+EydzsPQ8b4/WY7PwcHMvS6rOm6+6azWyX6iKC2
         ZYJ/N3kvi3Qb6xFBUWCSXfWC66lG70K7h5LAMrzcQKHnijiYREb/9s96NZEiWeU7l63Q
         6E1WfB2wGE92Xwyc49mFlGXN8HjoCurWpCALhKMC5lec5vxp2chBJrSeVk+vnvd885rW
         +A3wTU6nWbUR1TLLVHfExMkCmFHGvoGARJ6Pe5ab+NIb0PTk4F/0ntKIxYUBWyVvH+zS
         cQDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=kQIsUU9j;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d5-20020ac85445000000b00343d051f5f1si16322qtq.640.2022.09.13.11.30.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Sep 2022 11:30:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=kQIsUU9j;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:45140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oYAfZ-0005S2-0O
	for alex.bennee@linaro.org; Tue, 13 Sep 2022 14:30:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1oYAXt-0004nL-EY
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 14:22:07 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:42660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1oYAXp-0007Ok-Gn
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 14:22:04 -0400
Received: by mail-pg1-x530.google.com with SMTP id q63so12084004pga.9
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 11:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=vdpSw8+PtHpAQyo8pl0/USlNugYQ2VLasY9z9HCOvjo=;
 b=kQIsUU9jdFbHJdY4+dFIg1J5NaeSmsrNc3dT7UNte8cLw8PZXX3Wexn9l+PF3SRixE
 w8U1KHb27yFiUP0Sl6Drj8bM2N91whpbLRgkR/bT5MWliSW1bLt78UHgAV/DyX6cDhxx
 /MxLiI17GVQHgZUWLNZCX77RQmt50n4wr+5N9Zw9EnzLFMFJPxoWL4s6BurXUK2E5idt
 W/IZC8qLybrOxjskY/BhuR02BEr2fIg8xO9dnOrrJtS9SXJPHzcNMew3Wemj6iIWXzB3
 NhJZXZ9KuEjxDcHkkoxtJsrellxKqbsXKiiIDiUkU/evigsDPRyppL0nWTMYoShBEji9
 K8KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=vdpSw8+PtHpAQyo8pl0/USlNugYQ2VLasY9z9HCOvjo=;
 b=13neDXbOYrJm71oaqS3GUPWoCDRzdHQ1GIcmDxFdpk7mr6cVNJD6lhdWyfXgU8x5DI
 C3N6vbZXy/mnF/ZaX9B++H22kPNOf310EtnXMKs11Sf+4gwsrmgEyVMxUp0KrcMnxxeo
 MKonX4mXW1T2FHwXJotmvDV02+gdpRP1RO6MCgw66m2NHfep+AebZpnCMqkku8wO/YJn
 hJs3hdqbDopnVJIHI39xtAEgvWKHPxnpzq9j4IBTdA4MZVQS7ixfYJAI8YGM1b/IfcqF
 uGNvuzaJ4Bwqx1nC7oWCl28/u+nhQRQHpXr/u4dgLM6tY9AW9Wtoeq7yggYpxcCGJkq6
 qjHQ==
X-Gm-Message-State: ACgBeo0LZVvsJe4V49N68hzd8eg62R/gp1thjWooA2kv4uPDDPjcE8gs
 U9g2pqUPfHqecmf6eMqcG3UPseGj6F+K/DBt/Q+cBA==
X-Received: by 2002:a63:a26:0:b0:434:abac:148c with SMTP id
 38-20020a630a26000000b00434abac148cmr28191671pgk.524.1663093320346; Tue, 13
 Sep 2022 11:22:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220906220552.1243998-1-titusr@google.com>
 <20220906220552.1243998-4-titusr@google.com>
 <YxuYehCwKw/CmWhN@pdel-fedora-MJ0HJWH9>
In-Reply-To: <YxuYehCwKw/CmWhN@pdel-fedora-MJ0HJWH9>
From: Titus Rwantare <titusr@google.com>
Date: Tue, 13 Sep 2022 11:21:23 -0700
Message-ID: <CAMvPwGoB9jm_mF0bkFBXmHKH2oxbw3N7Z_QgNqs7F=Bktmnu1w@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] hw/peci: add support for EndPointConfig reads
To: Peter Delevoryas <peter@pjd.dev>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, patrick@stwcx.xyz, 
 iwona.winiarska@intel.com, tmaimon77@gmail.com, quic_jaehyoo@quicinc.com, 
 Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=titusr@google.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dbhfo+3JQoLs

On Fri, 9 Sept 2022 at 12:48, Peter Delevoryas <peter@pjd.dev> wrote:
>
> On Tue, Sep 06, 2022 at 10:05:52PM +0000, Titus Rwantare wrote:
> > Signed-off-by: Titus Rwantare <titusr@google.com>
> > Reviewed-by: Hao Wu <wuhaotsh@google.com>
> > ---
...
> > +++ b/include/hw/peci/peci.h
> > @@ -112,6 +112,26 @@ typedef struct PECITempTarget {
> >      uint8_t tjmax;
> >  } PECITempTarget;
> >
> > +typedef enum PECIEndPtType {
> > +    LOCAL_PCI_CFG = 3,
> > +    PCI_CFG,
> > +    MMIO_BDF,
> > +} PECIEndPtType;
> > +
> > +typedef struct __attribute__ ((__packed__)) {
> > +    PECIEndPtType msg_type;
> > +    uint8_t addr_type;
> > +    uint8_t bus;
> > +    uint8_t dev;
> > +    uint8_t func;
> > +    uint16_t reg;
> > +} PECIEndPtHeader;
> > +
> > +typedef struct {
> > +    PECIEndPtHeader hdr;
> > +    uint32_t data;
> > +} PECIEndPtConfig;
>
> I noticed the summary is "hw/peci: add support for EndPointConfig reads"
> but type definitions here use "EndPt", maybe they should be
> "PECIEndPoint*"? I don't think extending to Point is too long.

Fair, fixed in v2.


Titus
