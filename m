Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2508484lfi;
        Mon, 30 Mar 2020 02:22:59 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtNP5X1czecWviiqBcNdyae/2IfWXTrTcC43P2DKvv6nJyCNI5D0ksGKG+4Et2A/caQXN6z
X-Received: by 2002:ac8:6d0b:: with SMTP id o11mr10605699qtt.324.1585560179624;
        Mon, 30 Mar 2020 02:22:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585560179; cv=none;
        d=google.com; s=arc-20160816;
        b=FoWh8Y3oo/4N/fQN2SezolYqJ1KOjJCyVpiJjPByquS63FEragEzvmNi2crv1+xSvx
         isdZTkfe2y9LNKMrpfqVCjO8rYR7BVlEvP5pyZXT1rFbU8qWaxxr2905pPc6iMECducy
         dAc3WnE6GuYjnFH1H1gckmdWPHCYnnKZr52VvnaO2hifPBwbKZkzjpIiHb+IhgHa5QZr
         /OkbntIAdSuLIIa9cNqqu4kFzxHNdeoMDOyUtjoNQGDhr9B5MedyidmeOrl9hdBpQroE
         P7wfTm31NAD3wK41I3qMN5bzTvnFSu6pN42S/c9fJ7A512DKCHaslwTdj60x8yt2JAy/
         /rPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=+ySFxLUHxI+qg3bQ9Q0UqsrBaga3VngIR5RyFzU61eY=;
        b=KeJd39KfqkQbRFab/mXDY/BKxN5SGSjRgX1QErundRwKWJvbXrXgD+EZbVTbW+jZhG
         MdqxMBEr6sJp/KyrC3jj9+yYsYfrCl0zm/vIbW4awa+HxHOfTx5AL4LrEhK0TpedcMf5
         Pvv2AOPlu2TFGDtN79wPieZ0jDgswysAV4MIK7+VIFw1dm48kYv0GDCCywxZXa6dYuRU
         RdeffCICpQyYTfRuWXd6Xhk2ljfVMLQxHEnNemj5AlRU/zBHfezuhRK8QFMrLyly8HVK
         n8Ml0ZIfYAjIBXUS4vwqlaAtlVzAuiP9LnDwka4gn6iFGKA3ENNfLJcwxh7su7/PQpdF
         id8g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id y50si7815203qtj.387.2020.03.30.02.22.59;
        Mon, 30 Mar 2020 02:22:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 4AABB4B143;
	Mon, 30 Mar 2020 05:22:59 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -1.502
X-Spam-Level: 
X-Spam-Status: No, score=-1.502 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_MED=-2.3,
	SPF_HELO_PASS=-0.001] autolearn=no
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u4IzC0D9LMrw; Mon, 30 Mar 2020 05:22:58 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 2471E4B1F3;
	Mon, 30 Mar 2020 05:22:58 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 7ADD74B0BA
 for <kvmarm@lists.cs.columbia.edu>; Mon, 30 Mar 2020 05:22:57 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xWGtNYyJAcGR for <kvmarm@lists.cs.columbia.edu>;
 Mon, 30 Mar 2020 05:22:56 -0400 (EDT)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id C71124B0B8
 for <kvmarm@lists.cs.columbia.edu>; Mon, 30 Mar 2020 05:22:55 -0400 (EDT)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 3476A1E97E7AB0E559FA;
 Mon, 30 Mar 2020 17:22:47 +0800 (CST)
Received: from [127.0.0.1] (10.173.222.27) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.487.0; Mon, 30 Mar 2020
 17:22:39 +0800
Subject: Re: [kvm-unit-tests PATCH v7 09/13] arm/arm64: ITS: Commands
To: Eric Auger <eric.auger@redhat.com>
References: <20200320092428.20880-1-eric.auger@redhat.com>
 <20200320092428.20880-10-eric.auger@redhat.com>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <84493416-7b0d-df3e-df56-cedcbdd72010@huawei.com>
Date: Mon, 30 Mar 2020 17:22:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20200320092428.20880-10-eric.auger@redhat.com>
Content-Language: en-US
X-Originating-IP: [10.173.222.27]
X-CFilter-Loop: Reflected
Cc: kvm@vger.kernel.org, maz@kernel.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, andre.przywara@arm.com, thuth@redhat.com,
 kvmarm@lists.cs.columbia.edu, eric.auger.pro@gmail.com
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: 7U9g/c6Wo+Ts

Hi Eric,

On 2020/3/20 17:24, Eric Auger wrote:
> Implement main ITS commands. The code is largely inherited from
> the ITS driver.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

[...]

> +/* ITS COMMANDS */
> +
> +static void its_encode_cmd(struct its_cmd_block *cmd, u8 cmd_nr)
> +{
> +	cmd->raw_cmd[0] &= ~0xffUL;
> +	cmd->raw_cmd[0] |= cmd_nr;
> +}
> +
> +static void its_encode_devid(struct its_cmd_block *cmd, u32 devid)
> +{
> +	cmd->raw_cmd[0] &= BIT_ULL(32) - 1;
> +	cmd->raw_cmd[0] |= ((u64)devid) << 32;
> +}
> +
> +static void its_encode_event_id(struct its_cmd_block *cmd, u32 id)
> +{
> +	cmd->raw_cmd[1] &= ~0xffffffffUL;
> +	cmd->raw_cmd[1] |= id;
> +}
> +
> +static void its_encode_phys_id(struct its_cmd_block *cmd, u32 phys_id)
> +{
> +	cmd->raw_cmd[1] &= 0xffffffffUL;
> +	cmd->raw_cmd[1] |= ((u64)phys_id) << 32;
> +}
> +
> +static void its_encode_size(struct its_cmd_block *cmd, u8 size)
> +{
> +	cmd->raw_cmd[1] &= ~0x1fUL;
> +	cmd->raw_cmd[1] |= size & 0x1f;
> +}
> +
> +static void its_encode_itt(struct its_cmd_block *cmd, u64 itt_addr)
> +{
> +	cmd->raw_cmd[2] &= ~0xffffffffffffUL;
> +	cmd->raw_cmd[2] |= itt_addr & 0xffffffffff00UL;
> +}
> +
> +static void its_encode_valid(struct its_cmd_block *cmd, int valid)
> +{
> +	cmd->raw_cmd[2] &= ~(1UL << 63);
> +	cmd->raw_cmd[2] |= ((u64)!!valid) << 63;
> +}
> +
> +static void its_encode_target(struct its_cmd_block *cmd, u64 target_addr)
> +{
> +	cmd->raw_cmd[2] &= ~(0xfffffffffUL << 16);
> +	cmd->raw_cmd[2] |= (target_addr & (0xffffffffUL << 16));
> +}
> +
> +static void its_encode_collection(struct its_cmd_block *cmd, u16 col)
> +{
> +	cmd->raw_cmd[2] &= ~0xffffUL;
> +	cmd->raw_cmd[2] |= col;
> +}

The command encoding can be refactored like:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=4d36f136d57aea6f6440886106e246bb7e5918d8

which will look much clearer.

[...]

> +static void its_send_single_command(its_cmd_builder_t builder,
> +				    struct its_cmd_desc *desc)
> +{
> +	struct its_cmd_block *cmd, *next_cmd;
> +
> +	cmd = its_allocate_entry();
> +	builder(cmd, desc);
> +	next_cmd = its_post_commands();
> +
> +	its_wait_for_range_completion(cmd, next_cmd);
> +}
> +
> +

extra line.

> +static void its_build_mapd_cmd(struct its_cmd_block *cmd,
> +			       struct its_cmd_desc *desc)
> +{
> +	unsigned long itt_addr;
> +	u8 size = 12; /* 4096 eventids */

Maybe use desc->its_mapd_cmd.dev->nr_ites instead as we already have it?

> +
> +	itt_addr = (unsigned long)(virt_to_phys(desc->its_mapd_cmd.dev->itt));
> +	itt_addr = ALIGN(itt_addr, ITS_ITT_ALIGN);
> +
> +	its_encode_cmd(cmd, GITS_CMD_MAPD);
> +	its_encode_devid(cmd, desc->its_mapd_cmd.dev->device_id);
> +	its_encode_size(cmd, size - 1);
> +	its_encode_itt(cmd, itt_addr);
> +	its_encode_valid(cmd, desc->its_mapd_cmd.valid);
> +	its_fixup_cmd(cmd);
> +	if (desc->verbose)
> +		printf("ITS: MAPD devid=%d size = 0x%x itt=0x%lx valid=%d\n",
> +			desc->its_mapd_cmd.dev->device_id,
> +			size, itt_addr, desc->its_mapd_cmd.valid);
> +

extra line.

All of these are trivial things and feel free to ignore them,
Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>


Thanks

_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
