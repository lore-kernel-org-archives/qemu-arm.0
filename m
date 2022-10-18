Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp2804588ejn;
        Mon, 17 Oct 2022 18:27:31 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6uCL+0Le+bxlVD2aTwRcu+jPpOkNTIbf0hBmPgqGAEZiHWsQ/bEqQEJtpKwF+ntjEUwEnh
X-Received: by 2002:a05:622a:181:b0:39c:bd89:7b9 with SMTP id s1-20020a05622a018100b0039cbd8907b9mr383364qtw.590.1666056451231;
        Mon, 17 Oct 2022 18:27:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666056451; cv=none;
        d=google.com; s=arc-20160816;
        b=vRfwom0ZZNTlLKGd5AtigbLblXDVz+fxmlaTf+HKhI2Q6FfAqhTmVolG6Mtg5DNTMA
         h4h+8HaqW7Dk/mf/I71BVQ3HD6pD50KLtPs6WrlnRdd2kau4kQMvhj6+Dlqb18pIkYqj
         o8qYGNcCDpjILqnW9bUMIJqUd1E7zQUDNiPNOAHRp1VRj5/SsrSZifu0RERnKhNCOOdT
         D6/WUNyDuhge6JQ7PPeyiDYWD5eMBnzQ8MW+nO5CMocW0NQA2ABR3VtT4zHxm6kF3eLq
         zkYAM4kl3HqObJfCxuNFOzEkJHRof418bYgUaSmOWWJRJQiCCpsnFa4Rl0I48O6eQ5Vl
         fs/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :references:message-id:in-reply-to:subject:cc:to:from:date
         :dkim-signature;
        bh=7u/9/476+GZRW42WZ/rLQyoGmRQZgiI0iG1W5rpoubk=;
        b=A1kB8XNc+rkXjRr8jqc7OImG+MXoL2RnxUJtPKDVPD41AdBTo6A3zUeppvubdwX9yE
         h2fFl2PmMfW2iNwRU8z0mZK+tX4Bw7yM7/rqjabuMCovcbp6SAGj+vIoYEYYJ/p3e4Ei
         7USrWbhsGHMpMD94KHer2CYdQRy32QZhGr9Bs+gN50dC3ahxLa4voAQo+UjA4GbC10ty
         EkcXYJjttzu+XU8uJKBqYl5x7WBTVLM8OZjaPb2i5k+hqB8CvobCOYkpjUETasj9m3AL
         B87capu+1LUh/AyisVixq+V8iXIncxFzXLxtYiqGsz6V9siaoFV4g4C0K9n2vTJ32E5R
         hRLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=fWMyBqND;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t17-20020a37ea11000000b006e174e104besi6506834qkj.670.2022.10.17.18.27.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Oct 2022 18:27:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=fWMyBqND;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from localhost ([::1]:59526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1okbOE-0002Db-Nm
	for alex.bennee@linaro.org; Mon, 17 Oct 2022 21:27:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1okbNd-0002DA-NH; Mon, 17 Oct 2022 21:26:53 -0400
Received: from dfw.source.kernel.org ([139.178.84.217]:33882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1okbNc-0006Ci-0F; Mon, 17 Oct 2022 21:26:53 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5E180612F4;
 Tue, 18 Oct 2022 01:26:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF227C433D6;
 Tue, 18 Oct 2022 01:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666056407;
 bh=T68CN2SGOaBpQNuMZfn7mBL9Zq41PiKYwHxZzpuuZRQ=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=fWMyBqNDPxEMfzKCer3hc8hnYg8Lk9xRepw33WRjRSobJS3ZkNy4j2M+ytM3AHPgO
 8nZX2q7JSxnhFwjUi29UzhNw/w0Ezeu5OHNVTajm2KF26i3cvC6kbUBPQWX/FPvITg
 cPLO+kkx5cQmScEmOd1SbvFJT+YJjYs1eri2HUQaKpnhdjniSUGPOAtGT0EBIlo9E1
 nMXiMDKfwdXP2NJQNgVLbVPOzba119X1a+s0A1Mwl1T94WMaHJ3Sm06Ca7+2Dv5L7k
 SN3dVcGoAT8e4MbCyFnz93pRYPWwA2ycmdgh5DuUwQyGmJ4z6w1iybe3J4woIuGQus
 1RjqNpjcKcrzw==
Date: Mon, 17 Oct 2022 18:26:43 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-devel@nongnu.org, 
 stefano.stabellini@amd.com, Peter Maydell <peter.maydell@linaro.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, 
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v1 10/12] hw/arm: introduce xenpv machine
In-Reply-To: <3e504b1b-197d-b77b-16e1-86530eb3d64c@xen.org>
Message-ID: <alpine.DEB.2.22.394.2210171345450.2351079@ubuntu-linux-20-04-desktop>
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
 <20221015050750.4185-11-vikram.garhwal@amd.com>
 <3e504b1b-197d-b77b-16e1-86530eb3d64c@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=sstabellini@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -73
X-Spam_score: -7.4
X-Spam_bar: -------
X-Spam_report: (-7.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OGv+PX00PA8K

On Sun, 16 Oct 2022, Julien Grall wrote:
> Hi,
> 
> There seem to be some missing patches on xen-devel (including the cover
> letter). Is that expected?
> 
> On 15/10/2022 06:07, Vikram Garhwal wrote:
> > Add a new machine xenpv which creates a IOREQ server to register/connect
> > with
> > Xen Hypervisor.
> 
> I don't like the name 'xenpv' because it doesn't convey the fact that some of
> the HW may be emulated rather than para-virtualized. In fact one may only want
> to use for emulating devices.
> 
> Potential name would be 'xen-arm' or re-using 'virt' but with 'accel=xen' to
> select a Xen layout.

The benefit of 'xenpv' is that it doesn't require any changes to libxl.
It is even backward compatible so it could be used with an older version
of Xen/libxl. Backward compatibility aside, if we come up with a
different name then we'll need changes to libxl and to manage those
changes. For instance, if we use 'xen-arm' that would mean we would need
to handle per-arch QEMU machine names.
