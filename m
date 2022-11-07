Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp2978909ejx;
        Mon, 7 Nov 2022 05:03:03 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4YYHn9G9+aWkUY7HvQZM49P1CGYOq2lC/TXgnQcQtxRnm6IBked6UFfdPI4atlQxFhPkMh
X-Received: by 2002:ac2:5ec3:0:b0:4a4:6e90:c55f with SMTP id d3-20020ac25ec3000000b004a46e90c55fmr17159559lfq.344.1667826183393;
        Mon, 07 Nov 2022 05:03:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1667826183; cv=none;
        d=google.com; s=arc-20160816;
        b=B5E9X6lVMGRejpIwiOIkudOCzLiGYCdV1VEnnAjIFiRZlBtVQYz7EyJw0vcd5pR0Hu
         LfZys+v81zekH9b2yXUN84gThd/P11jOUdrhIhqzeMa5WhG0O3guJUzsop0l4Ws36bxe
         35e5OV9AozBHd+Wva7eOP1Y+/ve3ubJ8ppKDcslD4skfj/linlKX764AidU3pDs1DaCi
         R9gGgG4kv9uQu2w1uFHEwvIt2J8c/GYitnO/8zvEjOH5MOwbbQvOUHXKUaGhVO5h6Eqq
         dsu0rWWPHfyZKRnATlvO64/HjeB2Gce5aBJnDCXaQZfO8j0ez4wsF9ZBrVdJOrzKOrhg
         UDdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:references:message-id
         :content-transfer-encoding:cc:date:in-reply-to:from:subject
         :mime-version:dkim-signature;
        bh=yFc7AHHWZsXV7KKo5Me+Cltl7LLv1r4e5xRt7D3nZ38=;
        b=cc/hoW6ot2Tnzy+kaigPP41ijkEeGZIyvwqj7aJqE+Tqu0mhcVjZTa16dRVz7GRpVw
         NXZc5y845S+DJIJVZ2MJok7Y0r/HgWeHm3yHCsd7YEjmMteDwKbkTUbLl4M/oLgbb5Y5
         HBE92U/YoQ9/s4tjg51dgUoWjm7Sk2nLNxie5Nrb1ruj389+BSjQmoEJTva1wO26Icwd
         9hR03D5GBg+3H0Vt8yV4e3h7xUsXblNX+MwfPXc3dujRIxZRd85yc5SK1PUOGl+Z4DNK
         ltn9+bSCyYufPqqcpPfOv1FVFZlq99kBqoEy2Q+9LnzyDoMEwvv9fHCV94ByGHc5mhln
         gi+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ynddal.dk header.s=sig1 header.b=YsFZJK58;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f22-20020a2e9e96000000b0026e2bac05a2si5136841ljk.399.2022.11.07.05.03.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Nov 2022 05:03:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ynddal.dk header.s=sig1 header.b=YsFZJK58;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os1l0-0004cm-8b; Mon, 07 Nov 2022 08:01:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1os1ko-0004Yx-40
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 08:01:35 -0500
Received: from mr85p00im-zteg06022001.me.com ([17.58.23.193])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1os1kQ-00021K-W3
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 08:01:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
 t=1667826065; bh=yFc7AHHWZsXV7KKo5Me+Cltl7LLv1r4e5xRt7D3nZ38=;
 h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
 b=YsFZJK58qe1SxS2bgVGv3l9K3bnBpzL+O9JtsXAwGEOkrwWUUNZdzhDpv9fxNq32R
 oTpHvjSzLMjcgeg34AYSVjS+uKX7ttGWTaJl1waL/j8jNyHXa20i1Vh53C2I/h+cav
 Lk6QJGCk93Qr9fffKdauDpl6JZlNpN3Ba78Q3L6JAvcgwi88oKzxblwjuQd+Ys/I93
 qO3+MGLgO9zZpBjXQ59Rk8t6AwV6qHK9QMFnDXDy175fapNKEe2jimuE9RxNwd4DbU
 ATSENd787oEjHDHXnGlRWTeeNEI+dxSjx1D8yN6gZpI4Hw/LjQCCPWOTh9jKXGEotq
 g9dm4G99iYmqA==
Received: from smtpclient.apple (mr38p00im-dlb-asmtp-mailmevip.me.com
 [17.57.152.18])
 by mr85p00im-zteg06022001.me.com (Postfix) with ESMTPSA id 067BA8001E7;
 Mon,  7 Nov 2022 13:01:02 +0000 (UTC)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.200.110.1.12\))
Subject: Re: [PATCH 3/3] hvf: handle writes of MDSCR_EL1 and DBG*_EL1
From: Mads Ynddal <mads@ynddal.dk>
In-Reply-To: <20221104184101.6923-4-fcagnin@quarkslab.com>
Date: Mon, 7 Nov 2022 14:00:50 +0100
Cc: qemu-devel@nongnu.org, dirty@apple.com, r.bolshakov@yadro.com,
 peter.maydell@linaro.org, qemu-arm@nongnu.org, agraf@csgraf.de,
 pbonzini@redhat.com, Francesco Cagnin <fcagnin@quarkslab.com>
Content-Transfer-Encoding: 7bit
Message-Id: <F938E58E-F2FF-40F5-86AC-E6026A9A4E46@ynddal.dk>
References: <20221104184101.6923-1-fcagnin@quarkslab.com>
 <20221104184101.6923-4-fcagnin@quarkslab.com>
To: francesco.cagnin@gmail.com
X-Mailer: Apple Mail (2.3731.200.110.1.12)
X-Proofpoint-GUID: Jbsz-duPWhQp2cdHippFKeQ2K_KEcxhg
X-Proofpoint-ORIG-GUID: Jbsz-duPWhQp2cdHippFKeQ2K_KEcxhg
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.425,18.0.816,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2022-01-18=5F01:2022-01-14=5F01,2022-01-18=5F01,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=328
 adultscore=0 mlxscore=0 phishscore=0 malwarescore=0 suspectscore=0
 spamscore=0 clxscore=1030 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2211070106
Received-SPF: pass client-ip=17.58.23.193; envelope-from=mads@ynddal.dk;
 helo=mr85p00im-zteg06022001.me.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-TUID: ugqzIKv/conF


> On 4 Nov 2022, at 19.41, francesco.cagnin@gmail.com wrote:
> 
> From: Francesco Cagnin <fcagnin@quarkslab.com>
> 
> This proved to be required when debugging the Linux kernel's initial
> code, as the Hypervisor framework was triggering 'EC_SYSTEMREGISTERTRAP'
> VM exits after enabling trap exceptions with
> 'hv_vcpu_set_trap_debug_exceptions()'.
> 
> Signed-off-by: Francesco Cagnin <fcagnin@quarkslab.com>
> ---
> target/arm/hvf/hvf.c | 140 +++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 140 insertions(+)

Reviewed-by: Mads Ynddal <mads@ynddal.dk>
