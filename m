Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp1996512ejb;
        Wed, 21 Feb 2024 07:40:15 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXsHUoDNbnDLaQLl/7uL9K1UfHRYqi3F2XSDmqwR6eSEtz/6Z6v9STz/0Yf9JjSPGtCCNCoyYNqzP+LI6RVx80mIYOX4LB0
X-Google-Smtp-Source: AGHT+IGRNWQ1b7L8+rlsKsMSLXOQdfOPtdoJRVUIcGKtsHWQowu7eNdwmUAFMfPHBuRihtjglc6X
X-Received: by 2002:a05:620a:1350:b0:787:2768:edf4 with SMTP id c16-20020a05620a135000b007872768edf4mr19702095qkl.57.1708530015073;
        Wed, 21 Feb 2024 07:40:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708530015; cv=none;
        d=google.com; s=arc-20160816;
        b=DJ76RQ8mhVO+RhYUOiPNdwMSrO9d3O86ywl+1sOit2hG8fG/mbkBvM1O299BkWe1jv
         xWAhYTIPHcVOaTz6Wew8IsZnIocNWR/I/gLM5SAqAbd3oiGJkaRaV/f9s993l4TDKaDf
         piKPkQWqg9S8FiuZtwzMzyzkeapyIaSpA1jdLG5rcdt+YsOu3RhMoFa8lFNGfkTfFLYC
         KEfiHcTWY5/eTRFBRqRi5U+rTZ7Zmf+Fdwh5FlU1/5Euje730/iFQDRtWYph/nu+e2YR
         CO9f1oJRENOWzlnsgIKWBm1P88SKwlKOQzMh/NzMLRUfF/1OUtcrl4nVDV5oIbEMvHme
         OBtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=CHmMiCoa7WqdIbB4EnR3GB4dZWs3b+EEUwuP6JpmE00=;
        fh=0iw/UlccmZ9ywTIouiTxMlYBb4YYQ/NaKx8KfIMUVZU=;
        b=W0LZJhfa8U61HEmSHoJ7j65TcWUDWbwQg1Xq6f9UoXzxVKBK4RR2EcF0y1fZxWf0Kr
         c7rldNdTD/alknWwX9JeK2FWd59kSAU9njNVKk6DnKEN9W8iHBv83LbZaugOWlY+o9jG
         pnZFqE0YbaKXl93akvE/CeTSnu9T9Ml0LP0yRWA1S9dgEdQu+FV/CZ0YAxJD11awEuTZ
         NpyjbrFozG1AMfS7HkHSIrY83i3ZM9V/QOns52GvChcrku2MPXLJd9STZGlwuZ3qbc8G
         D09AWKfTUhPFTinLhsRA8XJ953RGqvA5CitYcs0B458O0agcyF4cfsGr09QIaQBNwfpf
         u8Vw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=BfMv1H19;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z9-20020ae9c109000000b00785db0e12bbsi10743280qki.652.2024.02.21.07.40.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 07:40:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=BfMv1H19;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rcoPx-0007Oe-Bc; Wed, 21 Feb 2024 10:21:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1rcoKz-0000wC-2h; Wed, 21 Feb 2024 10:16:45 -0500
Received: from mgamail.intel.com ([198.175.65.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1rcnvv-0006fX-6p; Wed, 21 Feb 2024 09:50:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708527051; x=1740063051;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=F06opmdQj8jsmdUPOzllj+66O8Vb8X3YdS5EM/vRWJE=;
 b=BfMv1H19DsC6cfZ5lweun26Uo60Y5G9vqgRCf6MMtPGZ60sGoPE8XV6A
 cvhiGeBRYfv9AEjNwScPjc/T0NsMWn5JNI9x1AGMFjxuPUFxNXuvPrcsf
 b823f/HMNhaj0IY9uL2U35TnfjKBdCAPp3Epxs7T9hQe3303Lt2CZQJi7
 WFaya4jEN/ytEkS3RJbUv5ow8GGTn0r8npUL6HnrhYOQrLxv36zRpHwoG
 Qip8oj7JzDFMPIYgHMvA9x2XJ0P1I6e3lHrHpkR76/uPda+as//NzUZ8C
 XCcyEWSjF+ZdGIbJpcWqxX5ErzoPbyamb9Ac4Ir4aYLIGWGn6m2yYZYmx Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2551701"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="2551701"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 06:50:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="913318118"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; d="scan'208";a="913318118"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.36])
 by fmsmga002.fm.intel.com with ESMTP; 21 Feb 2024 06:50:44 -0800
Date: Wed, 21 Feb 2024 23:04:23 +0800
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
Subject: Re: [PATCH 1/6] hw/cxl/cxl-host: Fix missing ERRP_GUARD() in
 cxl_fixed_memory_window_config()
Message-ID: <ZdYQ99m6BXzxb+nf@intel.com>
References: <20240221094317.994454-1-zhao1.liu@linux.intel.com>
 <20240221094317.994454-2-zhao1.liu@linux.intel.com>
 <878r3evyth.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878r3evyth.fsf@pond.sub.org>
Received-SPF: none client-ip=198.175.65.19;
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
X-TUID: 9CqMJPsLptUL

On Wed, Feb 21, 2024 at 12:31:06PM +0100, Markus Armbruster wrote:
> Date: Wed, 21 Feb 2024 12:31:06 +0100
> From: Markus Armbruster <armbru@redhat.com>
> Subject: Re: [PATCH 1/6] hw/cxl/cxl-host: Fix missing ERRP_GUARD() in
>  cxl_fixed_memory_window_config()
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
> > Currently, since machine_set_cfmw() - the caller of
> > cxl_fixed_memory_window_config() - doesn't get the NULL errp parameter
> > as the "set" method of object property, cxl_fixed_memory_window_config()
> > doesn't trigger the dereference issue.
> >
> > To follow the requirement of errp, add missing ERRP_GUARD() in
> > cxl_fixed_memory_window_config().
> >
> > Suggested-by: Markus Armbruster <armbru@redhat.com>
> > Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> > ---
> > Suggested by credit:
> >  Markus: Referred his explanation about ERRP_GUARD().
> > ---
> >  hw/cxl/cxl-host.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/hw/cxl/cxl-host.c b/hw/cxl/cxl-host.c
> > index 2aa776c79c74..c5f5fcfd64d0 100644
> > --- a/hw/cxl/cxl-host.c
> > +++ b/hw/cxl/cxl-host.c
> > @@ -26,6 +26,7 @@ static void cxl_fixed_memory_window_config(CXLState *cxl_state,
> >                                             CXLFixedMemoryWindowOptions *object,
> >                                             Error **errp)
> >  {
> > +    ERRP_GUARD();
> >      g_autofree CXLFixedWindow *fw = g_malloc0(sizeof(*fw));
> >      strList *target;
> >      int i;
> 
> The dereferences are
> 
>        fw->enc_int_ways = cxl_interleave_ways_enc(fw->num_targets, errp);
>        if (*errp) {
>            return;
>        }
> 
> and
> 
>            fw->enc_int_gran =
>                cxl_interleave_granularity_enc(object->interleave_granularity,
>                                               errp);
>            if (*errp) {
>                return;
>            }
> 
> We check *errp, because neither function returns a suitable error code.
> 
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>

Thanks! I'll attach your description to the commit message.

Regards,
Zhao

