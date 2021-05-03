Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp2890352lfg;
        Mon, 3 May 2021 11:27:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDn5HNbyF9aShaNXhxoGG6YhxaGWF5zasLRK5JBb+VmiNxkLua9UC6z3WTdZy3EFMsdHQm
X-Received: by 2002:a02:5b85:: with SMTP id g127mr20350352jab.80.1620066474847;
        Mon, 03 May 2021 11:27:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620066474; cv=none;
        d=google.com; s=arc-20160816;
        b=D5FLo31bRuQOoGHGG1COL4aiHm7FYW1vufhlIbuvJ5UgyaYkExvFO6JYuhxj8wr6ay
         ZMSiFog2QKoXlt2sByw9e7BtPPn9dUO/frA/WFMI+OT/gwAYT9IbRF1SrcoxJF2SzZRK
         BCHNUaPM6udmqdXzgUPY/+LScdBVrokQjx2f4bIjh7IWKlT12bFvPYprRyY1dbW+lHJ0
         jN2gPCRrV4D+zHgQzXc22J5rE+GADuXE0A3yq1uhYQJiOfo/hd+c9AkT6w+lsSZzEee9
         4gJBFbYhfxYUKzzfcLAUQJBeTs9V23LOJRSCunGItGH3ONQkpIUXIh78kbKqJUpRFY3T
         M66w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:organization:from:references:to:subject:dkim-signature;
        bh=1E+BaIjDxhZl6GZ7y81/Hi7Q9ChK6qWJNShgYtoeN+8=;
        b=EdiBrd4l3KMjO0fD2f4G5N+QjyuU7pvO49PMPbcoXBQ4+bA0Scz2UCuJ0Ce89XRSCF
         qgO7f0Qr+oKZIepO9mddBpdJ0HdRqCknfHJt9reUvDYx+9u2AH6UOACcLuTZB2uXt5g9
         /91hHppdxwO7rWTDaOn4lNj8P28qlVEbaM7actAT1WqIT5gy2JG2+wvhpWvOJcbofesX
         XJjmVvrzc9qOdQdgUUR0DvrrZ3lDF5MEJ3QMmzeimY7Ga0C5xLNXAhmbfNxZZ/Gp7ANZ
         FZYcneOBI9bvhMha68gjr6fkPX/1CYngJ3YwO5Juj65H5Vlg3J0rhd/uDdWySYxmeFsJ
         Y4Vg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="TsXL/87r";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q11si16027901ilo.71.2021.05.03.11.27.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 May 2021 11:27:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="TsXL/87r";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lddIQ-0001us-5U
	for alex.bennee@linaro.org; Mon, 03 May 2021 14:27:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lddIF-0001rD-U2
 for qemu-arm@nongnu.org; Mon, 03 May 2021 14:27:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lddIB-0003Tr-V0
 for qemu-arm@nongnu.org; Mon, 03 May 2021 14:27:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620066458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1E+BaIjDxhZl6GZ7y81/Hi7Q9ChK6qWJNShgYtoeN+8=;
 b=TsXL/87rUTLipbq5dCEGPJtVg7cpMHXWvKY5QQCGiUTduSBI7jRhH9FEdm7mmzf41baFRU
 tzlOrPBl/s9Q1iTJ82XqWtFhWQRBMPpKgAf7wy+VGXZp6nAOFShEJkxRnekRSNQm3Gbz69
 r0/VW9haHFC0OXG7Lt461iWRL54sDy4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-1VUIJ22kPluutAz6Czm1Rw-1; Mon, 03 May 2021 14:27:35 -0400
X-MC-Unique: 1VUIJ22kPluutAz6Czm1Rw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA43318B9F41;
 Mon,  3 May 2021 18:27:32 +0000 (UTC)
Received: from [10.3.114.144] (ovpn-114-144.phx2.redhat.com [10.3.114.144])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 608806061F;
 Mon,  3 May 2021 18:27:23 +0000 (UTC)
Subject: Re: [PATCH v4 3/3] nvdimm: Enable sync-dax device property for nvdimm
To: Shivaprasad G Bhat <sbhat@linux.ibm.com>, david@gibson.dropbear.id.au,
 groug@kaod.org, qemu-ppc@nongnu.org, ehabkost@redhat.com,
 marcel.apfelbaum@gmail.com, mst@redhat.com, imammedo@redhat.com,
 xiaoguangrong.eric@gmail.com, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 richard.henderson@linaro.org, pbonzini@redhat.com, stefanha@redhat.com,
 haozhong.zhang@intel.com, shameerali.kolothum.thodi@huawei.com,
 kwangwoo.lee@sk.com, armbru@redhat.com
References: <161966810162.652.13723419108625443430.stgit@17be908f7c1c>
 <161966813983.652.5749368609701495826.stgit@17be908f7c1c>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <f035a4ce-c070-6bb9-5792-da0a2d9d0a99@redhat.com>
Date: Mon, 3 May 2021 13:27:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <161966813983.652.5749368609701495826.stgit@17be908f7c1c>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: linux-nvdimm@lists.01.org, aneesh.kumar@linux.ibm.com,
 qemu-devel@nongnu.org, kvm-ppc@vger.kernel.org, shivaprasadbhat@gmail.com,
 bharata@linux.vnet.ibm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 85cselV9KpG1

On 4/28/21 10:49 PM, Shivaprasad G Bhat wrote:
> The patch adds the 'sync-dax' property to the nvdimm device.
> 
> When the sync-dax is 'direct' indicates the backend is synchronous DAX
> capable and no explicit flush requests are required. When the mode is
> set to 'writeback' it indicates the backend is not synhronous DAX

synchronous

> capable and explicit flushes to Hypervisor are required.
> 
> On PPC where the flush requests from guest can be honoured by the qemu,

s/the qemu/qemu/

> the 'writeback' mode is supported and set as the default. The device
> tree property "hcall-flush-required" is added to the nvdimm node which
> makes the guest to issue H_SCM_FLUSH hcalls to request for flushes

s/to issue/issue/
s/request for/request/

> explicitly. This would be the default behaviour without sync-dax
> property set for the nvdimm device. For old pSeries machine, the
> default is 'unsafe'.
> 
> For non-PPC platforms, the mode is set to 'unsafe' as the default.
> 
> Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
> ---

> +++ b/qapi/common.json
> @@ -197,3 +197,23 @@
>  { 'enum': 'GrabToggleKeys',
>    'data': [ 'ctrl-ctrl', 'alt-alt', 'shift-shift','meta-meta', 'scrolllock',
>              'ctrl-scrolllock' ] }
> +
> +##
> +# @NvdimmSyncModes:
> +#
> +# Indicates the mode of flush to be used to ensure persistence in case
> +# of power failures.
> +#
> +# @unsafe: This is to indicate, the data on the backend device not be
> +#          consistent in power failure scenarios.

s/This is to indicate, the/This indicates that/
s/device not/device might not/

> +# @direct: This is to indicate the backend device supports synchronous DAX
> +#          and no explicit flush requests from the guest is required.

This indicates the backend device supports synchronous DAX, and no
explicit flush requests from the guest are required.

> +# @writeback: To be used when the backend device doesn't support synchronous
> +#             DAX. The hypervisor issues flushes to the disk when requested
> +#             by the guest.
> +# Since: 6.0

6.1

> +#
> +##
> +{ 'enum': 'NvdimmSyncModes',
> +  'data': [ 'unsafe', 'writeback',
> +            { 'name': 'direct', 'if': 'defined(CONFIG_LIBPMEM)' } ] }
> 
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

