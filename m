Received: by 10.223.197.9 with SMTP id q9csp3429223wrf;
        Mon, 16 Oct 2017 04:41:22 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+RJ+oTbjUgKufHiyBd5EqE/ZImGa0dKQVaB0KixFGY2JtJ6jGWUAAb0KrUAvOBrNboj9TD0
X-Received: by 10.237.62.84 with SMTP id m20mr14101370qtf.82.1508154082156;
        Mon, 16 Oct 2017 04:41:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508154082; cv=none;
        d=google.com; s=arc-20160816;
        b=r5yYXs7upTGSN19HxXer40cALXcT47XIfKv5Q98W/JeQEX5jOZVb5jUn777YrHuoB8
         DybX9ldNGy2BbFaKwejx33dzUbFLTsTBUbgbGEoCbbN6IcNipgv/3YW1Ye4uPcj5y2nj
         LmKgkTroqXLpZMdxTvyopOTqydZLNSXTVPGbkKBP9JGCwgagZASB5ySfpxCOrKOe8SyB
         TcgUdInYm3kD/mZg+GPQmU0UAaL1TJ7mNaq/lPDPk2EIOlPFpHuucT01VPxhdX2RFVQ5
         y+vhfv8UtN8XF3jnPxiRuCCLGxXGcwY3N8P7a8U7tapyfam53Ps80IuxLz9rONhYuhSY
         bdYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=hNIYxVSj0cI1iihE9C0fJnv3K6yGj8XHBGk41HQ9XeM=;
        b=YoI1U/Z2Rq/ZcoslmRB+f2HjSk64nCsD40NQiFoqQoyklh0MvnZ1iS6+MlSjbMW+Eq
         9aU0bpZ6wIcg4riGfWTLnFI63nw6FlRVqMGFLPhNZqJMtTZ+hoAUH0JJEp0a3ktQPBwY
         24CZeIurjkTmK6XxjOcEiuNjWhvZSsIIS2z6K+tt4+jViyL35UcX8dLSC3PcWBrFjFlk
         6fIKgDxq+TUp/sfCfFQtNcjYqoJESEayjFhEMbgDsirU22cM+2z+SKymFtw5qSbmAczI
         oStIeZ4H9rMd4lhp5r4jO/RxHwRaKDmbrs3xbGHd+Unf94Fy376C9kX3iwIeDsIVcvY6
         owpg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u14si6360673qtk.265.2017.10.16.04.41.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Oct 2017 04:41:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60580 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e43ln-0004vL-Uq
	for alex.bennee@linaro.org; Mon, 16 Oct 2017 07:41:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53279)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1e43lg-0004v4-Jo
	for qemu-arm@nongnu.org; Mon, 16 Oct 2017 07:41:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1e43lc-0007de-4p
	for qemu-arm@nongnu.org; Mon, 16 Oct 2017 07:41:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35264)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1e43lb-0007dD-SF; Mon, 16 Oct 2017 07:41:08 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 89A8B13AA4;
	Mon, 16 Oct 2017 11:41:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 89A8B13AA4
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.33.192.189] (dhcp-192-189.str.redhat.com [10.33.192.189])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C3A505D9CC;
	Mon, 16 Oct 2017 11:41:04 +0000 (UTC)
To: Alistair Francis <alistair.francis@xilinx.com>, qemu-devel@nongnu.org
References: <cover.1506730372.git.alistair.francis@xilinx.com>
	<d057adf716f3dbd24ab2c0721baf8318c15a866c.1506730372.git.alistair.francis@xilinx.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <b7de158c-75d2-3c9c-7300-cecbebd2c67f@redhat.com>
Date: Mon, 16 Oct 2017 13:41:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <d057adf716f3dbd24ab2c0721baf8318c15a866c.1506730372.git.alistair.francis@xilinx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 16 Oct 2017 11:41:06 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 05/47] hw/arm: Replace
 fprintf(stderr, "*\n" with error_report()
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: alistair23@gmail.com, qemu-arm@nongnu.org, armbru@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1BLtBuh0FDlm

On 30.09.2017 02:15, Alistair Francis wrote:
> Replace a large number of the fprintf(stderr, "*\n" calls with
> error_report(). The functions were renamed with these commands and then
> compiler issues where manually fixed.
> 
> find ./* -type f -exec sed -i \
>     'N;N;N;N;N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
>     {} +
> find ./* -type f -exec sed -i \
>     'N;N;N;N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
>     {} +
> find ./* -type f -exec sed -i \
>     'N;N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
>     {} +
> find ./* -type f -exec sed -i \
>     'N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
>     {} +
> find ./* -type f -exec sed -i \
>     'N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
>     {} +
> find ./* -type f -exec sed -i \
>     'N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
>     {} +
> find ./* -type f -exec sed -i \
>     'N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
>     {} +
> find ./* -type f -exec sed -i \
>     'N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
>     {} +
> find ./* -type f -exec sed -i \
>     'N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
>     {} +
> find ./* -type f -exec sed -i \
>     'N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
>     {} +
> find ./* -type f -exec sed -i \
>     'N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
>     {} +
> 
> Some lines where then manually tweaked to pass checkpatch.
> 
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> Cc: qemu-arm@nongnu.org
> ---
> V2:
>  - Split hw patch into individual directories
[...]
> @@ -459,8 +460,7 @@ static int load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>          /* This is user error so deserves a friendlier error message
>           * than the failure of setprop_sized_cells would provide
>           */
> -        fprintf(stderr, "qemu: dtb file not compatible with "
> -                "RAM size > 4GB\n");
> +        error_report("qemu: dtb file not compatible with RAM size > 4GB");

Please drop the "qemu:" prefix when using error_report() now
(here and also in all the other affected strings in this patch).

 Thomas
