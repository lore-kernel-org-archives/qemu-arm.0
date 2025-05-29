Received: by 2002:a17:504:1b46:b0:1be9:327d:8ee3 with SMTP id t6csp544043njh;
        Thu, 29 May 2025 08:08:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWuT8KfGHbvQm1R6Z4tTcE5RINJzvcDBKgghPoLL5sSmFZ4OOqpY22q+sUjT6w7tWPMwIRlyaf286eqag==@linaro.org
X-Google-Smtp-Source: AGHT+IEzsyadvxhxzndrDXMMCC1JXyeIv3nTovaN96g7P0HIgFy7tZUvs6JZ7SDG0hUYPamC/V+e
X-Received: by 2002:a05:600c:1d94:b0:442:ccfa:18c with SMTP id 5b1f17b1804b1-450d659c48fmr546395e9.32.1748531326488;
        Thu, 29 May 2025 08:08:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748531326; cv=none;
        d=google.com; s=arc-20240605;
        b=Pxx++BeWy6HaLFoL1Qo1PVCpkP8UPLCEokwwue434l920yK3VQ/TEs3wVxKpMu++7G
         7fLzz+gzGQ8BJ+NWQ/I7EvLL2+m1Lh4n7pF5PPVbry/wpY2bcYmBXEb12YN1HraCD93V
         XQKRj+hFGuA6DEx7zk5KUowrhTH8B/dG5keZgFJderuIN0bv3msb8Ui4OhEBEwsWZBjY
         PFvjdYO8mVs+9+D+XdDfZ0YPQnDsjsnoQBWvdiKdgQh1GOFis+sXc8ZkDGV0GS3Fg1dQ
         WhMcoozTxBIv+2qoEWs4b+3z0PTzukUBtpFBpW2KvXOTmX+6HgRt1OMT/Bn34cQQrT+c
         IjfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:date;
        bh=R+Eox+peX3SScSmb5bOG5sEEBZHdrl661p5QjzAzLTs=;
        fh=M7JeQ9S2IqwYZHyc4qZ2XQxaraJZGXIFx0/yfya+TdM=;
        b=G9ZLdfDDISor3GRs2xVzy121WwvcRhbGgemUzlDD9Ucj0vlYWPbE1zRtEpvACkjZX7
         oZqyEzS/UxZjad89TN5y7AGev4peNowgAA4ogFgHW+2N/PbOnvC52IbiahWxTlCGf3JO
         sbI+1WD2Q7oGQQjIuqV9a6OJzgBKbpuCLqVe7iVd4bS3VNoMqJVypTe2Y7cofBfkB+07
         9RNABFzJls4Szn8sI0mfnziPNMGJ4a2FaqKwp3Y2APb2yA3l4ky4G1vvgUXBoBUbTC+/
         OKq9yq75pWCJsSPEHGCBpS1aU7jMKsckb6FnTA9NKFBtL8vpqr+wusjq078DT8X0NvYh
         1EsQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a4f008b22fsi1200378f8f.458.2025.05.29.08.08.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 May 2025 08:08:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uKero-0002gf-WC; Thu, 29 May 2025 11:08:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1uKerl-0002gB-7d; Thu, 29 May 2025 11:08:21 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1uKeri-0003ID-5h; Thu, 29 May 2025 11:08:20 -0400
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4b7V9W202wz6K8hM;
 Thu, 29 May 2025 23:07:59 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 81B8514022E;
 Thu, 29 May 2025 23:08:03 +0800 (CST)
Received: from localhost (10.122.19.247) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 29 May
 2025 17:08:02 +0200
Date: Thu, 29 May 2025 16:08:01 +0100
To: <qemu-devel@nongnu.org>, Fan Ni <fan.ni@samsung.com>, Peter Maydell
 <peter.maydell@linaro.org>, <mst@redhat.com>
CC: <linuxarm@huawei.com>, <linux-cxl@vger.kernel.org>, <qemu-arm@nongnu.org>, 
 Yuquan Wang <wangyuquan1236@phytium.com.cn>, "Itaru Kitayama"
 <itaru.kitayama@linux.dev>, Philippe =?ISO-8859-1?Q?Mathieu-Daud?=
 =?ISO-8859-1?Q?=E9?= <philmd@linaro.org>, Alireza Sanaee
 <alireza.sanaee@huawei.com>
Subject: Re: [PATCH v14 2/5] hw/cxl: Make the CXL fixed memory windows devices.
Message-ID: <20250529160801.00003ade@huawei.com>
In-Reply-To: <20250528110726.226389-3-Jonathan.Cameron@huawei.com>
References: <20250528110726.226389-1-Jonathan.Cameron@huawei.com>
 <20250528110726.226389-3-Jonathan.Cameron@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.122.19.247]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 185.176.79.56 (deferred)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qhMPBEbnK6nC

On Wed, 28 May 2025 12:07:23 +0100
Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:

> Previously these somewhat device like structures were tracked using a list
> in the CXLState in each machine.  This is proving restrictive in a few
> cases where we need to iterate through these without being aware of the
> machine type. Just make them sysbus devices.
> 
> Restrict them to not user created as they need to be visible to early
> stages of machine init given effects on the memory map.
> 
> This change both simplifies state tracking and enables features needed
> for performance optimization and hotness tracking by making it possible
> to retrieve the fixed memory window on actions elsewhere in the topology.
> 
> In some cases the ordering of the Fixed Memory Windows matters.
> For those utility functions provide a GSList sorted by the window index.
> This ensures that we get consistency across:
> - ordering in the command line
> - ordering of the host PA ranges
> - ordering of ACPI CEDT structures describing the CFMWS.
> 
> Other aspects don't have this constraint. For those direct iteration
> of the underlying hash structures is fine.
> 
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

I'll not post v15 for a while to give time for review, but I just realized
this snippet was in a patch I was carrying on top of this and should have
been in this patch.

diff --git a/include/hw/cxl/cxl.h b/include/hw/cxl/cxl.h
index a610795c87..de66ab8c35 100644
--- a/include/hw/cxl/cxl.h
+++ b/include/hw/cxl/cxl.h
@@ -46,7 +46,6 @@ typedef struct CXLState {
     bool is_enabled;
     MemoryRegion host_mr;
     unsigned int next_mr_idx;
-    GList *fixed_windows;
     CXLFixedMemoryWindowOptionsList *cfmw_list;
 } CXLState;

