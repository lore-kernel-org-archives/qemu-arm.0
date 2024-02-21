Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp1986012ejb;
        Wed, 21 Feb 2024 07:22:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVDWyuoFIjCvYtW/1xRiunpNWWYhdvcKrrBAPdfp0z+fpcaVGB1kWaUvWI9cxED6zdkz+G8dfxlVJ7mRMSVLF1AYgce5C2F
X-Google-Smtp-Source: AGHT+IEbDOc6FVFzPLWSxopJv9htGFIHlVHIWXa7aOTeHFBLB8TbyWbTgIWSXDY65ghcDTMcCGbJ
X-Received: by 2002:a05:620a:cec:b0:787:3307:121e with SMTP id c12-20020a05620a0cec00b007873307121emr16385228qkj.2.1708528948972;
        Wed, 21 Feb 2024 07:22:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708528948; cv=none;
        d=google.com; s=arc-20160816;
        b=H/iVqCZB1cxcKIzGv/42J+1fagWeS35ZBo64DW3VyhPnf9W4zU0BnRauxE6j0d3lXJ
         dQ/7WbCIGZK3a9qO3EOcm8fSECDhjmmeHVCUlmY9b0EHYY1FZv/h4W60ikQ1Tz/oUwQm
         bK+nquXyNxxOU7vj3W1BcmEx9c541SAH3LfTXeDjz4q9fX5EO0w+quuHjLtwtVkpeGnD
         XwyHHX+2aO8e2m1wCK+Hf4DFYt3BQUCsW+34lVYvFSnijkdwLC961PMZCTjkJWl1kZMq
         H9+6t8sqNZ8bnRK/eHNEU3+qNwc2xku8KTmSzbjEDgNprgqNo+xWPYbngxrIyIWrxFd8
         Nqhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=k/A7z26YafA1xdJ1RkDYSFvjFtwdqa5JfNA9448n5CU=;
        fh=0iw/UlccmZ9ywTIouiTxMlYBb4YYQ/NaKx8KfIMUVZU=;
        b=n31UV7TKUyeE5aSF210DzUFdmXnu2ZjG+oE9KWjDysZNrKRXDdevFzUZ4q4XcaVtfT
         iK2uFVk3VthCAQCmp5EkBZs4r3bhNLQAcJG4/1YpMdYQFAWtginFsTexVXQHl8Rq0L5c
         /2rg5g86uGs4R/fDKO7ZZN4LXu2Mv/aHhsz5/lEyddZllD0FmDtrn6IYla8MGxTDKGiJ
         ZxV8NvXnNPl2WyFGLHFELEyzYn7ozJ/CdnPM6lQEdtsf+lY10ULXZAXRdLsDzwJDN+0N
         Bs9KOC0SlKl17xy8fsNVifKFgOdCe251yP7KYNKjHE7cHr67ctlx0hv3nMjupeHS7sma
         KTgQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="K9kdT/Zl";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f17-20020a05620a20d100b00783f2040be5si11194905qka.535.2024.02.21.07.22.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 07:22:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="K9kdT/Zl";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rcoOy-0004TM-GY; Wed, 21 Feb 2024 10:20:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1rcoL4-0001hh-KD; Wed, 21 Feb 2024 10:16:52 -0500
Received: from mgamail.intel.com ([192.198.163.16])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1rco2Z-0007Tg-3P; Wed, 21 Feb 2024 09:57:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708527463; x=1740063463;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=N/Rh861QxK57N9KeQmommhQkchtjVhc8QkT0maRgZQo=;
 b=K9kdT/ZlExtJEnpjVVA61JAaJbV7ZjBqIkaAz2X63vrWuqzWEMQ0GBr8
 aTCaZm28kBFB34ehyf3I3SeMFhoX3uUsMmLYWG2Wu6Rb5IfSHIYHBw8Sv
 +Kp9vZ4RAh7IF237XrlkiUmSz/J+yKdS2TFixyBLneuNXd7REOp+ihWkW
 /0+vnUIr5cOqjaI9wPGaMOE7HgjD3ueKziR9daN0e95W60Dd8E4WRSgqG
 Y0PIJM9hycS8pdZziNjeh19qu7LUVo/mYZURHCAGVooJqgc3BygXXn+6E
 9GcQTpJnNrGarBrsvokSUys6kbUqy4JgqzrTYwOV2iNHT5GSkKcMyDqJx Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="3173218"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="3173218"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 06:57:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="9752563"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.36])
 by fmviesa004.fm.intel.com with ESMTP; 21 Feb 2024 06:57:33 -0800
Date: Wed, 21 Feb 2024 23:11:12 +0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>,
 Fan Ni <fan.ni@samsung.com>, Laurent Vivier <laurent@vivier.eu>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-trivial@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>
Subject: Re: [PATCH 3/6] hw/mem/cxl_type3: Fix missing ERRP_GUARD() in
 ct3_realize()
Message-ID: <ZdYSkNRkZBsfHJea@intel.com>
References: <20240221094317.994454-1-zhao1.liu@linux.intel.com>
 <20240221094317.994454-4-zhao1.liu@linux.intel.com>
 <87zfvuuk18.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zfvuuk18.fsf@pond.sub.org>
Received-SPF: none client-ip=192.198.163.16;
 envelope-from=zhao1.liu@linux.intel.com; helo=mgamail.intel.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 3eJSuiJ32fbd

On Wed, Feb 21, 2024 at 12:35:47PM +0100, Markus Armbruster wrote:
> Date: Wed, 21 Feb 2024 12:35:47 +0100
> From: Markus Armbruster <armbru@redhat.com>
> Subject: Re: [PATCH 3/6] hw/mem/cxl_type3: Fix missing ERRP_GUARD() in
>  ct3_realize()
> 
> Zhao Liu <zhao1.liu@linux.intel.com> writes:
> 
> > From: Zhao Liu <zhao1.liu@intel.com>
> >
> > As the comment in qapi/error, dereferencing @errp requires
> > ERRP_GUARD():
> >
> > * = Why, when and how to use ERRP_GUARD() =
> > *
> > * Without ERRP_GUARD(), use of the @errp parameter is restricted:
> > * - It must not be dereferenced, because it may be null.
> > * - It should not be passed to error_prepend() or
> > *   error_append_hint(), because that doesn't work with &error_fatal.
> > * ERRP_GUARD() lifts these restrictions.
> > *
> > * To use ERRP_GUARD(), add it right at the beginning of the function.
> > * @errp can then be used without worrying about the argument being
> > * NULL or &error_fatal.
> > *
> > * Using it when it's not needed is safe, but please avoid cluttering
> > * the source with useless code.
> >
> > Currently, since ct3_realize() - as a PCIDeviceClass.realize() method -
> > doesn't get the NULL errp parameter, it doesn't trigger the dereference
> > issue.
> >
> > To follow the requirement of errp, add missing ERRP_GUARD() in
> > ct3_realize().
> >
> > Suggested-by: Markus Armbruster <armbru@redhat.com>
> > Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> > ---
> > Suggested by credit:
> >  Markus: Referred his explanation about ERRP_GUARD().
> > ---
> >  hw/mem/cxl_type3.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
> > index e8801805b90f..a3b0761f843b 100644
> > --- a/hw/mem/cxl_type3.c
> > +++ b/hw/mem/cxl_type3.c
> > @@ -645,6 +645,7 @@ static DOEProtocol doe_cdat_prot[] = {
> >  
> >  static void ct3_realize(PCIDevice *pci_dev, Error **errp)
> >  {
> > +    ERRP_GUARD();
> >      CXLType3Dev *ct3d = CXL_TYPE3(pci_dev);
> >      CXLComponentState *cxl_cstate = &ct3d->cxl_cstate;
> >      ComponentRegisters *regs = &cxl_cstate->crb;
> 
> The dereference is
> 
>        cxl_doe_cdat_init(cxl_cstate, errp);
>        if (*errp) {
>            goto err_free_special_ops;
>        }
> 
> We check *errp, because cxl_doe_cdat_init() returns void.  Could be
> improved to return bool, along with its callees ct3_load_cdat() and
> ct3_build_cdat(), but that's a slightly more ambitious cleanup, so
> 
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>

Thanks! I can continue to consider such the cleanup in the follow up.

Will also add the dereference description in commit message to make
review easier.

Regards,
Zhao


