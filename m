Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp2193605ejc;
        Tue, 12 Mar 2024 19:13:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVWmTgN0LD1RwRV+MzFUQxPSqrAK+YWGEp2UTVF/4tBJjCSh44SdY2wSqKmX8KAztHRVTi4hJ5nAXB5VRXwuGUf1h0C0NAN
X-Google-Smtp-Source: AGHT+IHCV6zhQ8EF/ayMjhaGotCSGGG3szCbxG/vPrs/aiUXYdlaRJguftKpYgeCQe0VhbtqOo14
X-Received: by 2002:a05:6102:34d4:b0:473:7db:1b5b with SMTP id a20-20020a05610234d400b0047307db1b5bmr8930707vst.24.1710296023524;
        Tue, 12 Mar 2024 19:13:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710296023; cv=none;
        d=google.com; s=arc-20160816;
        b=uCOxszYZ1RkMd8ka/JlTycCBdagFwMSDHCWrmpkX0/jCyxWn7fDHFUwFFPR4+piANa
         6b3tyMP4XbSt2pztO7ESAYoUbVyRbRjJpnK3Xeoeh3XSiWNv2BCnN/+LctSkC7tL7Zio
         XNxGY2Yso9WJ9pu2Mm08gE5nNNiIrBclxYP1Yv4wmneq8PTw4y7W3lMk4rT0O8wmax+p
         nCiSloqXbJUAn6IyhQbrH//AzmkEGqvVj4jIcUcPzA+X4ZIT9S9IqhKCp+mU7ak8zuLd
         W1r7vHy/PclHe06VNKEg6hlPF7cITmCKWMRSfZexP0Xiuf77jgWoM5rCZ5Y57Du/lpIj
         6f+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=1hMYbuo0Lk9jEHgL6djrcSXYdknzIGBCBVPmM4UCSH0=;
        fh=pTb13JATqenlskxLbJ0tjRpC9GsBf4XLd2E4wcRCHd4=;
        b=hi5CDe7Rc3wv9EsOjhHBtMWEwBp4RVGczH3hG0688Rcaxs+DQfQjDCF7WaGUqkVqkW
         Et+0tytAqJyYev0PZ+YLfyG2HyPsfIxeGPuWuJpI1mdx15YW/D0MciKqSaDzJfkeBmKd
         fK5wE15ZVeTJlmMmM6Pwptxahe1BEBSrZ8/D9J4lnPVBvi0iQnlxs2HiY3adSJ92nifQ
         o99/90BjiPMB5y8mhYZyKHRhno0z7meFCP21zVmzVLDrYZbThiNveSV6/IjyAXxLiTy/
         01DYWEExbMIfBA82lby5fgmuCEgj8L+Tr9WBCdN4XDL/WAKpm6T0//qZG+6RHEQr8qZF
         xQJQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=BRPssKra;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id wk11-20020a05620a578b00b0078857811e97si8448346qkn.380.2024.03.12.19.13.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Mar 2024 19:13:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=BRPssKra;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rkE7E-0005GH-Pb; Tue, 12 Mar 2024 22:13:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1rkE75-0005FC-2g; Tue, 12 Mar 2024 22:13:03 -0400
Received: from mgamail.intel.com ([198.175.65.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1rkE72-00005t-Kz; Tue, 12 Mar 2024 22:13:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710295981; x=1741831981;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=v38YNtJy/YG6uK8903FNNbXlOx4a9Ia/xHQiui7fk2Q=;
 b=BRPssKraj9vpkocw/J4nrVdNi40E0nZQi9p7nJuhiR1XJhRsW4tJkZDK
 uHWeBA6VNi3QroqOSBuQ7lSOpdolWBD2MhpC1Swaq7tb53HTGlWPLwiS4
 Ay7xzN6NaTt9kW3yc5zgmvvzt3ibqHIP6AqnYAgmSDMAkCZLhC50CU3oS
 VKnXR/k+K8ikEumZi9LoLj/hiOKUBvZ1rYwOHj/1BXbr5/ZEq+VxKk/LT
 MMQyvczRPZFRtXJut0lbFTjtZTlJ53XhjRJzQ8nwNmL04c0OTCcObus1Z
 2PV9PvysyG+qtvsQUeHo0QdwVsJeYzPOSQrrCV2CafMetGuLdx09SwiUK Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="4905912"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="4905912"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 19:12:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="11644382"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.36])
 by fmviesa009.fm.intel.com with ESMTP; 12 Mar 2024 19:12:54 -0700
Date: Wed, 13 Mar 2024 10:26:43 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org
Subject: Re: [PULL 36/68] hw/misc/xlnx-versal-trng: Check returned bool in
 trng_prop_fault_event_set()
Message-ID: <ZfEO4xhZwgyrWk8M@intel.com>
References: <cover.1710282274.git.mst@redhat.com>
 <305446015848f0b5d71b817b53e7e02b08c36ede.1710282274.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <305446015848f0b5d71b817b53e7e02b08c36ede.1710282274.git.mst@redhat.com>
Received-SPF: pass client-ip=198.175.65.19; envelope-from=zhao1.liu@intel.com;
 helo=mgamail.intel.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.687,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: thWfCr2uA5mB

Hi Michael,

Thanks a lot and aslo this one, I forgot to update the status :/,
this patch has been merged (commit 1e0efa9735635,
"hw/misc/xlnx-versal-trng: Check returned bool in
trng_prop_fault_event_set()"). Sorry to make you
repeat the merge.

Best Regards,
Zhao


On Tue, Mar 12, 2024 at 06:27:22PM -0400, Michael S. Tsirkin wrote:
> Date: Tue, 12 Mar 2024 18:27:22 -0400
> From: "Michael S. Tsirkin" <mst@redhat.com>
> Subject: [PULL 36/68] hw/misc/xlnx-versal-trng: Check returned bool in
>  trng_prop_fault_event_set()
> X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
> 
> From: Zhao Liu <zhao1.liu@intel.com>
> 
> As the comment in qapi/error, dereferencing @errp requires
> ERRP_GUARD():
> 
> * = Why, when and how to use ERRP_GUARD() =
> *
> * Without ERRP_GUARD(), use of the @errp parameter is restricted:
> * - It must not be dereferenced, because it may be null.
> ...
> * ERRP_GUARD() lifts these restrictions.
> *
> * To use ERRP_GUARD(), add it right at the beginning of the function.
> * @errp can then be used without worrying about the argument being
> * NULL or &error_fatal.
> *
> * Using it when it's not needed is safe, but please avoid cluttering
> * the source with useless code.
> 
> But in trng_prop_fault_event_set, @errp is dereferenced without
> ERRP_GUARD():
> 
> visit_type_uint32(v, name, events, errp);
> if (*errp) {
>     return;
> }
> 
> Currently, since trng_prop_fault_event_set() doesn't get the NULL @errp
> parameter as a "set" method of object property, it hasn't triggered the
> bug that dereferencing the NULL @errp.
> 
> And since visit_type_uint32() returns bool, check the returned bool
> directly instead of dereferencing @errp, then we needn't the add missing
> ERRP_GUARD().
> 
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> Message-Id: <20240223085653.1255438-5-zhao1.liu@linux.intel.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  hw/misc/xlnx-versal-trng.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/hw/misc/xlnx-versal-trng.c b/hw/misc/xlnx-versal-trng.c
> index b8111b8b66..6495188dc7 100644
> --- a/hw/misc/xlnx-versal-trng.c
> +++ b/hw/misc/xlnx-versal-trng.c
> @@ -644,8 +644,7 @@ static void trng_prop_fault_event_set(Object *obj, Visitor *v,
>      Property *prop = opaque;
>      uint32_t *events = object_field_prop_ptr(obj, prop);
>  
> -    visit_type_uint32(v, name, events, errp);
> -    if (*errp) {
> +    if (!visit_type_uint32(v, name, events, errp)) {
>          return;
>      }
>  
> -- 
> MST
> 
