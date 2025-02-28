Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp1022615njb;
        Fri, 28 Feb 2025 07:57:08 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXBwUWzYwxqtcOE1N0zeazmP3SK0uw7/5veXAsJ+I/77vSNlEDZSGmP9QesDU+CqtV/OPu1CeUEy1kORA==@linaro.org
X-Google-Smtp-Source: AGHT+IGaEkB6CZBoG1P9NSIYNtrMi3onUKAn3JESyKiFjyYSD2Fr3TMXQsYYHVh8FWfq7LTD+czF
X-Received: by 2002:a05:622a:309:b0:472:a26:7450 with SMTP id d75a77b69052e-474bc0701cemr52090551cf.19.1740758228622;
        Fri, 28 Feb 2025 07:57:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740758228; cv=none;
        d=google.com; s=arc-20240605;
        b=X+mJaPoe3GtCiYVB8c9qpLtlF2ZwoMOmmgdtnrlA+l9cNnShThFlx/fvCX0dtAEBU9
         L2wkxCISa3ABtU+D0q3LIg9s81WfCundI4gE4EZUkfxBwyXhQVmJzaLsX+ueeVMwBGdN
         DC9GglTkgWF+68TfSgrvUfipkYG3MnFN/VjazJOnYp6EZQ+06eTsDS4T9ZlpQQl/Fm62
         y8d8iHCA7F+NBR17pYBlKSAtNdaXKUhqu6yPnZgjZfsXj83bpwpoZCjnmy9B4A4KzZAk
         XURV9O6WXWHTXs6+vrSxL9NJ82McgWbDfI2/zKUv+6HsRvI4xQLoR48ZntMT5NW46DLD
         VhKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=YxZngTfPQFh8X9NjXfdctlRzN1rGCJK1yfvZgvEz4F0=;
        fh=aJp6FguB1k+1UK3MlBQR3TmJ6V+Ti/upV33RAZmdtII=;
        b=DXa7/eEWTAE35x5hYui+c7XLSwDtsf0J/C2O0ux6N6tU8qJVwdhF6dbVdYD8DIoT21
         rU7McnOgDT8Row/35doyX64aIbxV7iA1Zul5wNmqahOnPKcvFtkexIz5tphQLDitkYyF
         O2OJthAmLOPyF5e8JtwMJATEIdAXZBxD2GQ+gbK8ziESnvDLtruiW0UzXpSXHBX8+SEP
         31U4YuWDbwEfP7/FGNTN2DolXZ215iOkNnKYxgbAvyif6Mgu7t2t2DFrnnX2hEj9Rt4u
         yAPTEinUeQHzEB9Ecz1Wl1enH96AahDTwQxuue7ejoUBaAARJ/HPalGuxV49EtBa6Uxa
         h59Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@xenproject.org header.s=20200302mail header.b=DYZZAMjz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=xenproject.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4747240dab7si34497801cf.457.2025.02.28.07.57.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Feb 2025 07:57:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@xenproject.org header.s=20200302mail header.b=DYZZAMjz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=xenproject.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1to2j1-0003HB-Pj; Fri, 28 Feb 2025 10:56:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony@xenproject.org>)
 id 1to2iz-0003Fy-RV; Fri, 28 Feb 2025 10:56:30 -0500
Received: from mail.xenproject.org ([104.130.215.37])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony@xenproject.org>)
 id 1to2iy-00070j-8V; Fri, 28 Feb 2025 10:56:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
 bh=YxZngTfPQFh8X9NjXfdctlRzN1rGCJK1yfvZgvEz4F0=; b=DYZZAMjzcSqLtHtQKnOde4o9C0
 SP3jqQfdwDtn8Q9Jzjrv79icSZbqCXGc9JQK9xuDEcuNfDvbIbNUIifGl3Rj2Ij5AE23MB8RRFPfm
 N4/ZsmMcSfGZ/M8yZq3NgXyI+vmzkpRAUnSmN8d7GbhobDuNIVz6vbylDD8by+CYmcmk=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1to2ip-00AMT3-2a;
 Fri, 28 Feb 2025 15:56:19 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1to2ip-00FOBo-0m;
 Fri, 28 Feb 2025 15:56:19 +0000
Date: Fri, 28 Feb 2025 16:56:14 +0100
From: Anthony PERARD <anthony@xenproject.org>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, qemu-arm@nongnu.org,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Vikram Garhwal <vikram.garhwal@bytedance.com>,
 Thomas Huth <thuth@redhat.com>, Jan Beulich <jbeulich@suse.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH 6/8] hw/xen/xen-bus: Reduce included headers
Message-ID: <Z8HcnnRd-_hXkjiF@l14>
References: <20250218162618.46167-1-philmd@linaro.org>
 <20250218162618.46167-7-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250218162618.46167-7-philmd@linaro.org>
Received-SPF: pass client-ip=104.130.215.37;
 envelope-from=anthony@xenproject.org; helo=mail.xenproject.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: zwRkXjH5VY0W

On Tue, Feb 18, 2025 at 05:26:16PM +0100, Philippe Mathieu-Daudé wrote:
> Have "hw/xen/xen-bus" include the bare minimal set of headers.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD
