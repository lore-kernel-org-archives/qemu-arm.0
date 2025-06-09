Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp1329192njc;
        Mon, 9 Jun 2025 15:54:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXmS7+Y3J8EJvSHt0a0f4rRHmXnFPHq3ZhMgGvV7aOXJtnupMSV7HzTukkmuI3bZPVeo96JLgfNt7nfWw==@linaro.org
X-Google-Smtp-Source: AGHT+IEnogXMfUDfDlnq5yT8IwwTTrEirK2FsOg+01BfPfJz0+2RF69ZOOBJZfIewGZ1r+geKULm
X-Received: by 2002:a05:622a:5813:b0:4a4:4101:ab1a with SMTP id d75a77b69052e-4a70abee4femr6722351cf.2.1749509672036;
        Mon, 09 Jun 2025 15:54:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749509672; cv=none;
        d=google.com; s=arc-20240605;
        b=MmaPISMhjHvoOo4Azyb6FiNPtKQ5OgCEmw6G2iHNXKt/VJn9oqBIfYcJzXuNCCqy78
         r5q8CxqgydXkcQsiz+SElhue1zpn/uzpkFhhFEMGKSq+zZD5X23nwk6fWI6zNiPGgVl5
         iAPcGIiofeEofPT0h94YwAPwbp71mF6dVAOF3fE9ayfllRJ8bdnhM1j4tULHHctp1BcR
         oip7Qu3Ur+St+6S9VPL3VE9ubVPJkYtUZRXSGHiJ4dtR9F01dWAILcUtYZfCmirAjXGF
         k/Ehly4jZpxmc2hXeaRBKFmpiuwnwE9+HSUxXbel8J2aZr48smuTt4QZ2G4ncfMD2ggv
         P4Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from
         :dkim-signature:date;
        bh=jxOE58UHkmyNaPXHD2BEAW9G/zuBXBYxX7HObtol/Pk=;
        fh=gjKYH6VT2aKZpX9E8Hgj4XAIOF2XqOq4i9aJzNPnAn8=;
        b=TZJUz2t5m73VEd5eVX6pevyV7OZBn/AC/tdzKCwUa4QUJTTIdIoFNVPMj9aE0qWfVG
         Z0VME2+p5NXxrgKKM8YWzmbgNiKpZPECpHqQlqvmw0q1llABuKgdc+2CBUGdj1JeFvwm
         HljD0DvvGeMZBSBwDTbN0Z5qA4M3i3iU9f0i9XS7G1oLMKKYXCC5SsV/DYJTf4Bl5QUH
         owaFDB0OExLV5QzWwNWbIRkgQpNhNZd+zZcNCBATo7d4NSvoxElDGNEZPYg5YFKHaU0E
         fraqtQVOTSvwQbBAehDU30zn2qXeNA7NnP2EISBvyrp9qDK3zdHNMMAxywHwiC3TpyZ6
         F8XA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linux.dev header.s=key1 header.b=o2JUa19n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.dev
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a61117c66fsi86606941cf.144.2025.06.09.15.54.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jun 2025 15:54:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.dev header.s=key1 header.b=o2JUa19n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.dev
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uOlNM-0001As-RH; Mon, 09 Jun 2025 18:53:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <itaru.kitayama@linux.dev>)
 id 1uOlNL-0001Ai-K5
 for qemu-arm@nongnu.org; Mon, 09 Jun 2025 18:53:55 -0400
Received: from out-177.mta1.migadu.com ([2001:41d0:203:375::b1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <itaru.kitayama@linux.dev>)
 id 1uOlNJ-0000hd-ML
 for qemu-arm@nongnu.org; Mon, 09 Jun 2025 18:53:55 -0400
Date: Tue, 10 Jun 2025 07:53:31 +0900
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1749509621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jxOE58UHkmyNaPXHD2BEAW9G/zuBXBYxX7HObtol/Pk=;
 b=o2JUa19nU6VI9eHrFmLm25tJTWCrylx3+QZroe5AtZqrqHSWWwAc2MzoKO83N+hbDd8hjx
 HyQqaHCfTW8t5FzjBfT+L9eV6o0jHQyK/vdZp/MiRy1DmVuO5ZjFU+En4Khm3f1BbCz5oa
 4LZuymeS5mnmDQOre3uoa5uWqZUUvPA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Itaru Kitayama <itaru.kitayama@linux.dev>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: qemu-devel@nongnu.org, Fan Ni <fan.ni@samsung.com>,
 Peter Maydell <peter.maydell@linaro.org>, mst@redhat.com,
 linuxarm@huawei.com, linux-cxl@vger.kernel.org, qemu-arm@nongnu.org,
 Yuquan Wang <wangyuquan1236@phytium.com.cn>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Alireza Sanaee <alireza.sanaee@huawei.com>
Subject: Re: [PATCH v14 2/5] hw/cxl: Make the CXL fixed memory windows devices.
Message-ID: <aEdl6xvqyOsU+Z2S@vm4>
References: <20250528110726.226389-1-Jonathan.Cameron@huawei.com>
 <20250528110726.226389-3-Jonathan.Cameron@huawei.com>
 <20250529160801.00003ade@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529160801.00003ade@huawei.com>
X-Migadu-Flow: FLOW_OUT
Received-SPF: pass client-ip=2001:41d0:203:375::b1;
 envelope-from=itaru.kitayama@linux.dev; helo=out-177.mta1.migadu.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: Q1F75YYUHkzE

On Thu, May 29, 2025 at 04:08:01PM +0100, Jonathan Cameron wrote:
> On Wed, 28 May 2025 12:07:23 +0100
> Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:
> 
> > Previously these somewhat device like structures were tracked using a list
> > in the CXLState in each machine.  This is proving restrictive in a few
> > cases where we need to iterate through these without being aware of the
> > machine type. Just make them sysbus devices.
> > 
> > Restrict them to not user created as they need to be visible to early
> > stages of machine init given effects on the memory map.
> > 
> > This change both simplifies state tracking and enables features needed
> > for performance optimization and hotness tracking by making it possible
> > to retrieve the fixed memory window on actions elsewhere in the topology.
> > 
> > In some cases the ordering of the Fixed Memory Windows matters.
> > For those utility functions provide a GSList sorted by the window index.
> > This ensures that we get consistency across:
> > - ordering in the command line
> > - ordering of the host PA ranges
> > - ordering of ACPI CEDT structures describing the CFMWS.
> > 
> > Other aspects don't have this constraint. For those direct iteration
> > of the underlying hash structures is fine.
> > 
> > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> I'll not post v15 for a while to give time for review, but I just realized
> this snippet was in a patch I was carrying on top of this and should have
> been in this patch.
> 
> diff --git a/include/hw/cxl/cxl.h b/include/hw/cxl/cxl.h
> index a610795c87..de66ab8c35 100644
> --- a/include/hw/cxl/cxl.h
> +++ b/include/hw/cxl/cxl.h
> @@ -46,7 +46,6 @@ typedef struct CXLState {
>      bool is_enabled;
>      MemoryRegion host_mr;
>      unsigned int next_mr_idx;
> -    GList *fixed_windows;
>      CXLFixedMemoryWindowOptionsList *cfmw_list;
>  } CXLState;

With this one line removed on top of v14, today's Dave's cxl/next kernel makes
cxl test suite ran through without a single failure.

Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>

Jonathan, Zhi jian of Fujitsu gave you feedback on the QEMU core CXL emulation code, 
are you still waiting on any other reviewers to take a look at the series v14 (or
v14-ish)?

Thanks,
Itaru.

> 
