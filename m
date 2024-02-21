Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp1994449ejb;
        Wed, 21 Feb 2024 07:36:32 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW47aX5Ckt+bVMg2YoynD2XIK1b8XonjGr9P55zV218LAFmqrm1aun4bvVnHKylxu4BLhl1TxYoJTd8uxyY5Cep/xMxvP2y
X-Google-Smtp-Source: AGHT+IGQ9/I1rHw0L1ENnmAusAtbNSFDG+BKyAO1wZmA8T873eMt0nHmyQ0s9Ftg5vvG58zeAK0w
X-Received: by 2002:a0c:ae9a:0:b0:68f:5d8f:7c06 with SMTP id j26-20020a0cae9a000000b0068f5d8f7c06mr7657927qvd.14.1708529792160;
        Wed, 21 Feb 2024 07:36:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708529792; cv=none;
        d=google.com; s=arc-20160816;
        b=edChvimZW9wr6xV15voRkWg5Rc9rIaLzn5RWJAFgC8OnCjPQ9PDwfUeBuhddlSX+/v
         78crZplzDvy3kMIg/FdQfPMTB7+WPVnBzm28qcJj/40BdcBSa7Ecq2qUXPUgxrNsefEx
         I1BX5RGuIQfyVxgrlVkbaNvvLBpJnq+B9/jEaeUr6G7LbU5N9corz3CluPLVbMXWGs4d
         dcopSSDiN9sN/eYGzF52Yb4X5W9LtJblI/l790z+2vRsKhomsIx3C1eAMIRjp1E8AxLi
         cCQnK75eBlOs9NGhgUrhsiEnHBegWUh4Wn6uPYqxC2qKcLfT89gA9TLkhap8PpF1KK23
         7PYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:date:references:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=HOuCJgn0aHyrvzHDwAt1bFkH1ADdZr58ytTLv9fml6I=;
        fh=m/xNVKb0kzgzkpl24h4aD0FdUowHmASrwLdpZffa/MA=;
        b=C6pxYiTEBJ1+Tx7CzzrkK7n0ra8ifO4NbAf/9b/hsOB6LLHwmz+0qiwnLs50f26Wo0
         14Plb7h4u627Nd3g5skdvPseLVs2l38oNcIjsAL/Q+8zrSO7aWi6OXIEpkboygz2f9TL
         mUwZlv0tCLuT6X2dhypFzQGHXnLlftlpd55hIfIZeEbasCb2lItW6+bl0eWHmDnxFQY3
         qlm6RBOONXcCMBJWspAM30LjcdhF5jDCjYpL/ZNCzri/CP4HD1fEyPWD5aesLsf9NYIJ
         AtTrUzSaJi84jR9dwqmidG7+eVUSUCGCZAZ3K8uM20gBJKlzhnBl+P9m7MjxCwIFjxa1
         ty0w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ew5rpSYk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pn18-20020a056214131200b0068f0ff4276bsi11344918qvb.369.2024.02.21.07.36.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 07:36:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ew5rpSYk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rcoZR-0001bg-Ld; Wed, 21 Feb 2024 10:31:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1rcoP2-0004tQ-WA
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 10:20:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1rcl6s-0000I6-8L
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 06:50:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708516196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HOuCJgn0aHyrvzHDwAt1bFkH1ADdZr58ytTLv9fml6I=;
 b=Ew5rpSYkl9LSHX8jCeKLvpUWpHYnvkrOkFUKTTPZSA/QI26WaJcHJjYi++p7A7kfnRYnKh
 LNhPF3kSKVSPC+Dxc5SIQmviH/00PVSB0ERU4CmpjFZ6DieCUWEigfToR7+mCTNfLQx49C
 58r+4ZlSh77BjDQiXxMoNXIEcg2UNmY=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-170-_xvVJxn8OMG_MLfekMR0Tw-1; Wed,
 21 Feb 2024 06:49:52 -0500
X-MC-Unique: _xvVJxn8OMG_MLfekMR0Tw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B14B28C976B;
 Wed, 21 Feb 2024 11:49:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.55])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 74E80C0335F;
 Wed, 21 Feb 2024 11:49:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2E15821E66D5; Wed, 21 Feb 2024 12:49:46 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Zhao Liu <zhao1.liu@linux.intel.com>
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>,  Fan Ni
 <fan.ni@samsung.com>,  Laurent Vivier <laurent@vivier.eu>,  Alistair
 Francis <alistair@alistair23.me>,  "Edgar E . Iglesias"
 <edgar.iglesias@gmail.com>,  Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,  Alex Williamson
 <alex.williamson@redhat.com>,  =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Markus
 Armbruster
 <armbru@redhat.com>,  qemu-devel@nongnu.org,  qemu-arm@nongnu.org,
 qemu-trivial@nongnu.org,  Zhao Liu <zhao1.liu@intel.com>
Subject: Re: [PATCH 5/6] hw/pci-bridge/cxl_upstream: Fix missing
 ERRP_GUARD() in cxl_usp_realize()
In-Reply-To: <20240221094317.994454-6-zhao1.liu@linux.intel.com> (Zhao Liu's
 message of "Wed, 21 Feb 2024 17:43:16 +0800")
References: <20240221094317.994454-1-zhao1.liu@linux.intel.com>
 <20240221094317.994454-6-zhao1.liu@linux.intel.com>
Date: Wed, 21 Feb 2024 12:49:46 +0100
Message-ID: <87le7eujdx.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: oS8xXaT1qpmu

Zhao Liu <zhao1.liu@linux.intel.com> writes:

> From: Zhao Liu <zhao1.liu@intel.com>
>
> As the comment in qapi/error, dereferencing @errp requires
> ERRP_GUARD():
>
> * = Why, when and how to use ERRP_GUARD() =
> *
> * Without ERRP_GUARD(), use of the @errp parameter is restricted:
> * - It must not be dereferenced, because it may be null.
> * - It should not be passed to error_prepend() or
> *   error_append_hint(), because that doesn't work with &error_fatal.
> * ERRP_GUARD() lifts these restrictions.
> *
> * To use ERRP_GUARD(), add it right at the beginning of the function.
> * @errp can then be used without worrying about the argument being
> * NULL or &error_fatal.
> *
> * Using it when it's not needed is safe, but please avoid cluttering
> * the source with useless code.
>
> Currently, since cxl_usp_realize() - as a PCIDeviceClass.realize()
> method - doesn't get the NULL errp parameter, it doesn't trigger the
> dereference issue.
>
> To follow the requirement of errp, add missing ERRP_GUARD() in
> cxl_usp_realize()().
>
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
> Suggested by credit:
>  Markus: Referred his explanation about ERRP_GUARD().
> ---
>  hw/pci-bridge/cxl_upstream.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/pci-bridge/cxl_upstream.c b/hw/pci-bridge/cxl_upstream.c
> index e87eb4017713..03d123cca0ef 100644
> --- a/hw/pci-bridge/cxl_upstream.c
> +++ b/hw/pci-bridge/cxl_upstream.c
> @@ -289,6 +289,7 @@ static void free_default_cdat_table(CDATSubHeader **cdat_table, int num,
>  
>  static void cxl_usp_realize(PCIDevice *d, Error **errp)
>  {
> +    ERRP_GUARD();
>      PCIEPort *p = PCIE_PORT(d);
>      CXLUpstreamPort *usp = CXL_USP(d);
>      CXLComponentState *cxl_cstate = &usp->cxl_cstate;

The dereference is

       cxl_doe_cdat_init(cxl_cstate, errp);
       if (*errp) {
           goto err_cap;
       }

As noted in review of PATCH 3, we check *errp, because
cxl_doe_cdat_init() returns void.  Could be improved to return bool,
along with its callees ct3_load_cdat() and ct3_build_cdat(), but that's
a slightly more ambitious cleanup, so

Reviewed-by: Markus Armbruster <armbru@redhat.com>

