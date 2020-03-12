Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp380907lfc;
        Thu, 12 Mar 2020 02:20:08 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vthixkahuFg7l/neHov1F14BjzG0V0/BmOYrTeHYbzWaUxPBR6UYjNo/+50HMHqcjZ83b/r
X-Received: by 2002:a05:6830:1b6e:: with SMTP id d14mr5451011ote.117.1584004808489;
        Thu, 12 Mar 2020 02:20:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584004808; cv=none;
        d=google.com; s=arc-20160816;
        b=y5ILnPB5uAOXj+wANQKnb+C5ZMY0xkeCvVBU6VeCh8MN2nVuVsZa9eDF3dVETsAZj3
         o0UZVtDFtO/1/QLfQXDj9Vvpr5WDuDfID9Mplmgwm+C4N/jeL8+zkkI+HaEj/kS9WrOo
         UrDuj9lIouOBkq3UdwHvAFUypO++CKePYFr4FH/Uy3s7FWbiXieY0ojcWPO+fRc86y6m
         1YqEq3GpkNQRz9DGZG54w2jCj276YBgouq/zSq9bQOtMO8WXEk+uh5h7wts4Tn1nC/Gf
         JdiFDM0YaXCY0oqP9w7nBLx6SQ3pYNHb6RllPcZYPzUXENBaDAnlaKwgcQI9YZPFVt/w
         SK5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject;
        bh=WT70PB2oWUZCjQ4Swp57FMuf1ze9qTJSPeAnmi6bj3s=;
        b=EizjskSDH0Lr8VYhKTMsIjKv7q6b1BE0M++9/Fu1PSm9I6RDLlu/dh8BFRwoWJE8MX
         jAa22fQ++w/OwtJpVKebz70bIAn7QofjjDY8kuqJfTQLSwzFS8FhPtjhOUoQ46HMNMt2
         tcq3sAKnGdApMhtIocJ5U9E43/tSNoQDIK+MR780k1bQDyDsuPSDIrCnMxnxTpp5g39h
         NOtTnBcwBJB+rTCIb2w4PO/lS5TzcOu0UIwVzOAVVqh0OcRX+F7F9dGkEuATb3J6vGpt
         +sGsq4ugC4Ryo0c2Nxaix2nCfXdn9Xoalp4kkLVjyHvWkLjBy72N9xR7uy1NiJ0Wfv2a
         jNpw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id l20si1317123oil.6.2020.03.12.02.20.08;
        Thu, 12 Mar 2020 02:20:08 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726567AbgCLJUH (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Thu, 12 Mar 2020 05:20:07 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:53564 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726385AbgCLJUH (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 12 Mar 2020 05:20:07 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id EDEF9ED6D8587C08CEB4;
        Thu, 12 Mar 2020 17:20:04 +0800 (CST)
Received: from [127.0.0.1] (10.173.222.27) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Thu, 12 Mar 2020
 17:19:54 +0800
Subject: Re: [kvm-unit-tests PATCH v5 10/13] arm/arm64: ITS: INT functional
 tests
To:     Marc Zyngier <maz@kernel.org>, Auger Eric <eric.auger@redhat.com>
CC:     <eric.auger.pro@gmail.com>, <kvmarm@lists.cs.columbia.edu>,
        <kvm@vger.kernel.org>, <qemu-devel@nongnu.org>,
        <qemu-arm@nongnu.org>, <drjones@redhat.com>,
        <andre.przywara@arm.com>, <peter.maydell@linaro.org>,
        <alexandru.elisei@arm.com>, <thuth@redhat.com>
References: <20200310145410.26308-1-eric.auger@redhat.com>
 <20200310145410.26308-11-eric.auger@redhat.com>
 <d3f651a0-2344-4d6e-111b-be133db7e068@huawei.com>
 <46f0ed1d-3bda-f91b-e2b0-addf1c61c373@redhat.com>
 <301a8b402ff7e480e927b0f8f8b093f2@kernel.org>
From:   Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <7fb9f81f-6520-526d-7031-d3d08cb1dd6a@huawei.com>
Date:   Thu, 12 Mar 2020 17:19:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <301a8b402ff7e480e927b0f8f8b093f2@kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.173.222.27]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: FTkyH6fnIpJw

On 2020/3/11 22:00, Marc Zyngier wrote:
> That is still a problem with the ITS. There is no architectural way
> to report an error, even if the error numbers are architected...
> 
> One thing we could do though is to implement the stall model (as described
> in 5.3.2). It still doesn't give us the error, but at least the command
> queue would stop on detecting an error.

It would be interesting to see the buggy guest's behavior under the
stall mode. I've used the following diff (absolutely *not* a formal
patch, don't handle CREADR.Stalled and CWRITER.Retry at all) to have
a try, and caught another command error in the 'its-trigger' test.

logs/its-trigger.log:
" INT dev_id=2 event_id=20
lib/arm64/gic-v3-its-cmd.c:194: assert failed: false: INT timeout! "

dmesg:
[13297.711958] ------------[ cut here ]------------
[13297.711964] ITS command error encoding 0x10307

It's the last INT test in test_its_trigger() who has triggered this
error, Eric?


Thanks.

---8<---
diff --git a/include/kvm/arm_vgic.h b/include/kvm/arm_vgic.h
index 9d53f545a3d5..5717f5da0f22 100644
--- a/include/kvm/arm_vgic.h
+++ b/include/kvm/arm_vgic.h
@@ -179,6 +179,7 @@ struct vgic_its {
  	u64			cbaser;
  	u32			creadr;
  	u32			cwriter;
+	bool			stalled;

  	/* migration ABI revision in use */
  	u32			abi_rev;
diff --git a/virt/kvm/arm/vgic/vgic-its.c b/virt/kvm/arm/vgic/vgic-its.c
index d53d34a33e35..72422b75e627 100644
--- a/virt/kvm/arm/vgic/vgic-its.c
+++ b/virt/kvm/arm/vgic/vgic-its.c
@@ -1519,6 +1519,9 @@ static void vgic_its_process_commands(struct kvm 
*kvm, struct vgic_its *its)
  	if (!its->enabled)
  		return;

+	if (unlikely(its->stalled))
+		return;
+
  	cbaser = GITS_CBASER_ADDRESS(its->cbaser);

  	while (its->cwriter != its->creadr) {
@@ -1531,9 +1534,34 @@ static void vgic_its_process_commands(struct kvm 
*kvm, struct vgic_its *its)
  		 * According to section 6.3.2 in the GICv3 spec we can just
  		 * ignore that command then.
  		 */
-		if (!ret)
-			vgic_its_handle_command(kvm, its, cmd_buf);
+		if (ret)
+			goto done;
+
+		ret = vgic_its_handle_command(kvm, its, cmd_buf);
+
+		/*
+		 * Choose the stall mode on detection of command errors.
+		 * Guest still can't get the architected error numbers though...
+		 */
+		if (ret) {
+			/* GITS_CREADR.Stalled is set to 1. */
+			its->stalled = true;
+
+			/*
+			 * GITS_TYPER.SEIS is 0 atm, no System error will be
+			 * generated.  Instead report error encodings at ITS
+			 * level.
+			 */
+			WARN_RATELIMIT(ret, "ITS command error encoding 0x%x", ret);
+
+			/*
+			 * GITS_CREADR is not incremented and continues to
+			 * point to the entry that triggered the error.
+			 */
+			break;
+		}

+done:
  		its->creadr += ITS_CMD_SIZE;
  		if (its->creadr == ITS_CMD_BUFFER_SIZE(its->cbaser))
  			its->creadr = 0;
