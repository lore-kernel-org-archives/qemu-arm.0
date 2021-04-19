Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp1475160lfb;
        Mon, 19 Apr 2021 13:07:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxB6lIhfm7lETo2jzWem39I1VHAlhgpIrUkOH1dYareK60Se+/1e/QU2xXbD+IeXFS+IPd
X-Received: by 2002:a05:6602:2043:: with SMTP id z3mr16133610iod.77.1618862855362;
        Mon, 19 Apr 2021 13:07:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618862855; cv=none;
        d=google.com; s=arc-20160816;
        b=p2OmfRgCAX6OGmCvvRjjt057qhPcUAeNAtLcrNMdCD8Yhdig9jZjjt+NmBrHN+d2CU
         1ZWWCcGDfM0QiNCKIabejyjDrE1ZTiSAb+/Jngn/l+8EEOu4C24yhntSjs2NEPyW+401
         +hdihwmQcpVZvYpXJShkfEevVH2e6aHh+YIfeCqwZT+B6HV6tiCZIOyoiWU23KYXppwi
         5mtOzu35STkg+VNLpPja1ewsflr84/+LkG55sICjHjJINgGXCQ9Vp7+vDo9+GElFGpW+
         V9JURVOeEGdWxiHkL5uaWtGGguiTcvGfTIW/id3EYQe3o+7/D7E/axiQwZppUVh2ipt9
         XL2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-signature;
        bh=YQA6ZLQjkvtpH8vumzoquEs9A8ZoVpkt7pnrPnA76G8=;
        b=0Qtm3mXSuXXr4fqgrcZiglsHFU8rnkRZYI6+mF7dzkCwg7qzpr2oaBOqptBlFf+wQ6
         qFkaXb4Bpz+g4Oa/BLDzUG99mTv2LqOC3PvDXzYF6NVk/X8Pq0pG8vm6ZF2m6ySmqkcO
         3qL8pz4lspMSzy+SDeD1oieCBP9RdnZRQNNKE78ihDnZZTL8ZkEuSV4cEy23RNhW+XK2
         u7jTAYHO25yex+7eQLFJh3d+JVC5TM7uJIcHJ2JIt4fSRi3Vs68ZxEuZ3JCdxlB05Icb
         DRI+PVAL++5wkiz4eqDUI+bna4lH+jObDQ9r8gOuUtaEDiBnTbi6Fc03AYpGrlLPmGLm
         5E7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail (test mode) header.i=@bsdio.com header.s=xmission header.b=BFGrf8NJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u10si13493547ilv.5.2021.04.19.13.07.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Apr 2021 13:07:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail (test mode) header.i=@bsdio.com header.s=xmission header.b=BFGrf8NJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lYaBC-0003I8-HE
	for alex.bennee@linaro.org; Mon, 19 Apr 2021 16:07:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@bsdio.com>)
 id 1lYa9H-0002Ew-Ka; Mon, 19 Apr 2021 16:05:35 -0400
Received: from out03.mta.xmission.com ([166.70.13.233]:49514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@bsdio.com>)
 id 1lYa9F-0003mx-SG; Mon, 19 Apr 2021 16:05:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=simple/simple; d=bsdio.com;
 s=xmission; h=Subject:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Sender:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=H4h1DjIrtL0Fa0Yb5MbMUk1vUd2pdYsnrYWOLJ1HKeY=; b=BFGrf8NJgqM+wqT/Rnn7dmSL3V
 bUDCGs2Rh5MoWcVv7aZt6tSOLTGFYC6DgdUDIiZtDKjFacDX9pIwRWOkF7owmhTlvqCq1CWUKFRr7
 pfK8N0CyrgZlm7MlAFZWxLARgGmSoq0HI8xFoO1eY8YSR9ok0YBREPSup1GuTjg1lLP0=;
Received: from in02.mta.xmission.com ([166.70.13.52])
 by out03.mta.xmission.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <rebecca@bsdio.com>)
 id 1lYa8w-00H0Mp-OS; Mon, 19 Apr 2021 14:05:14 -0600
Received: from mta5.zcs.xmission.com ([166.70.13.69])
 by in02.mta.xmission.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <rebecca@bsdio.com>)
 id 1lYa8n-004OAv-At; Mon, 19 Apr 2021 14:05:14 -0600
Received: from localhost (localhost [127.0.0.1])
 by mta5.zcs.xmission.com (Postfix) with ESMTP id 27C0C1281072;
 Mon, 19 Apr 2021 14:05:05 -0600 (MDT)
X-Amavis-Modified: Mail body modified (using disclaimer) -
 mta5.zcs.xmission.com
Received: from mta5.zcs.xmission.com ([127.0.0.1])
 by localhost (mta5.zcs.xmission.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id UWHD52ZwvfEy; Mon, 19 Apr 2021 14:05:05 -0600 (MDT)
Received: from [10.0.10.120] (c-174-52-16-57.hsd1.ut.comcast.net
 [174.52.16.57])
 by mta5.zcs.xmission.com (Postfix) with ESMTPSA id D12C9128131C;
 Mon, 19 Apr 2021 14:05:04 -0600 (MDT)
To: Rebecca Cran <rebecca@nuviainc.com>, peter.maydell@linaro.org,
 richard.henderson@linaro.org
References: <20210414203231.824-1-rebecca@nuviainc.com>
From: Rebecca Cran <rebecca@bsdio.com>
Message-ID: <9f0792fd-3b5a-3315-26bd-7c8307e7dae0@bsdio.com>
Date: Mon, 19 Apr 2021 14:05:04 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210414203231.824-1-rebecca@nuviainc.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-XM-SPF: eid=1lYa8n-004OAv-At; ; ;
 mid=<9f0792fd-3b5a-3315-26bd-7c8307e7dae0@bsdio.com>; ; ;
 hst=in02.mta.xmission.com; ; ; ip=166.70.13.69; ; ; frm=rebecca@bsdio.com; ; ;
 spf=none
X-SA-Exim-Connect-IP: 166.70.13.69
X-SA-Exim-Mail-From: rebecca@bsdio.com
X-Spam-DCC: XMission; sa05 1397; IP=ok Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: *; Rebecca Cran <rebecca@nuviainc.com>, peter.maydell@linaro.org,
 richard.henderson@linaro.org
X-Spam-Relay-Country: 
X-Spam-Timing: total 9000 ms - load_scoreonly_sql: 0.16 (0.0%),
 signal_user_changed: 14 (0.2%), b_tie_ro: 11 (0.1%), parse: 2.2 (0.0%),
 extract_message_metadata: 23 (0.3%), get_uri_detail_list: 2.1 (0.0%),
 tests_pri_-1000: 7 (0.1%), tests_pri_-950: 2.1 (0.0%), tests_pri_-900:
 1.64 (0.0%), tests_pri_-90: 60 (0.7%), check_bayes: 57 (0.6%),
 b_tokenize: 9 (0.1%), b_tok_get_all: 7 (0.1%), b_comp_prob: 3.2 (0.0%),
 b_tok_touch_all: 34 (0.4%), b_finish: 1.17 (0.0%), tests_pri_0: 848
 (9.4%), check_dkim_signature: 0.90 (0.0%), check_dkim_adsp: 97 (1.1%),
 poll_dns_idle: 8099 (90.0%), tests_pri_10: 2.3 (0.0%), tests_pri_500:
 8036 (89.3%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH v7 0/4] Add support for FEAT_TLBIOS and FEAT_TLBIRANGE
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in02.mta.xmission.com)
Received-SPF: none client-ip=166.70.13.233; envelope-from=rebecca@bsdio.com;
 helo=out03.mta.xmission.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pvr/WhTyjpCI

Hi Richard,


Could you review this patch series again please?

I've fixed several issues recently, and am interested to know if it's 
ready to commit or would need further changes.


-- 

Rebecca Cran


On 4/14/2021 2:32 PM, Rebecca Cran wrote:
> ARMv8.4 adds the mandatory FEAT_TLBIOS and FEAT_TLBIRANGE.
> They provides TLBI maintenance instructions that extend to the Outer
> Shareable domain and that apply to a range of input addresses.
>
> Changes from v6 to v7:
>
> o Fixed the tlbi_aa64_rvae1_write the tlbi_aa64_rvae1is_write functions
>    to pass the correct value into functions which use an ARMMMUIdx.
>
> o Fixed comments in helper.c which referred to non-existent instructions.
>
> Testing:
>
> o Booted Linux 5.11 - verified the previous assert failure in qemu is
>    resolved.
> o Ran checkpatch.pl.
>
> Rebecca Cran (4):
>    accel/tcg: Add TLB invalidation support for ranges of addresses
>    target/arm: Add support for FEAT_TLBIRANGE
>    target/arm: Add support for FEAT_TLBIOS
>    target/arm: set ID_AA64ISAR0.TLB to 2 for max AARCH64 CPU type
>
>   accel/tcg/cputlb.c      | 130 ++++++-
>   include/exec/exec-all.h |  46 +++
>   target/arm/cpu.h        |  10 +
>   target/arm/cpu64.c      |   1 +
>   target/arm/helper.c     | 371 ++++++++++++++++++++
>   5 files changed, 555 insertions(+), 3 deletions(-)
>

