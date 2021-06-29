Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp4768665lfg;
        Tue, 29 Jun 2021 02:34:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwWNzJ8PL63SHiQhvgkSF1Qb57QBx/+Q/+qfNw4j2sIH1uSqJ98LKM4+ZZJ2T3Eq0uR6FgX
X-Received: by 2002:a25:af06:: with SMTP id a6mr37313796ybh.326.1624959271084;
        Tue, 29 Jun 2021 02:34:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624959271; cv=none;
        d=google.com; s=arc-20160816;
        b=reCbaxOLrvId7mN7GIYSOe60Gl2ryMZmhjeBSE1FH2ONSjyNWYJ30YJ3Bl9NHl8QSZ
         SBgHd2SssczT1vp/SqxgpmsUBARJymqjTjGyF2RiE7+u6pS6uecmENbPclS7xO7uWbM9
         hp2BjvCOsDzjlcPY2osPA/zfKZh6hoS/j5w7vdb53ZPsksiY3TiNbbO4dUVLjM//thUZ
         AR07S129BdY87GBY3V6UTKSEi57+g6d5pF+QNwIkEzLsQbR1/03lcAnEbhVRfKDTXpNc
         DYyqHqiqRKRbOnMT3XUcKQ6hutXcZkIhRK1LVz8gf+pxyboTCynTCTwAx0re57Td3w7a
         ooxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:mime-version:user-agent:date:message-id
         :subject:from:to;
        bh=U2gYKqCrLBpxvsn4NDiB7+k12XOOuqtJkqv+JlWF/Rk=;
        b=wIy1oitrX/m5s8M6LKTBADjIhloC17HwrIb782mDN/56sroTwp5Li7fMxecaZM+6pz
         snbVAzLaHjqvxTygGh0NV1FIdaK2kfwMWs1Ityb6he3Tmo9KCqgJrwH5fIvbd7iEPyXG
         H5Dv+trvqEs1aJIJ0aZiXi3KTF6NwlxFL2382LEh1rShDQXH3iVWmQ07VXbkczwVcb3e
         gXsxlhQwnu/9R9EA4DzZVYo+NTQR1G+f3dOKHFoiDmfaj8JNhIN+yyQ0lJFVWI6Mp9Kr
         Py9WnZ3LGlw3u2SWUxQ7LLQPB7tMwWSsjPn8axLGt+DfzgmPvopoDKG9KdFpwyMWbAjh
         5xXA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s8si6677674ybp.129.2021.06.29.02.34.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Jun 2021 02:34:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:53470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lyA8U-0003Fx-9S
	for alex.bennee@linaro.org; Tue, 29 Jun 2021 05:34:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lyA8B-0003FF-L9; Tue, 29 Jun 2021 05:34:12 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lyA83-0006eH-Vh; Tue, 29 Jun 2021 05:34:11 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GDfNP31DNzZnkT;
 Tue, 29 Jun 2021 17:30:45 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Tue, 29 Jun 2021 17:33:49 +0800
Received: from [10.174.185.210] (10.174.185.210) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 29 Jun 2021 17:33:49 +0800
To: Peter Maydell <peter.maydell@linaro.org>, Eric Auger
 <eric.auger@redhat.com>, "open list:ARM cores" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>
From: Kunkun Jiang <jiangkunkun@huawei.com>
Subject: [question] Shall we flush ITS tables into guest RAM when shutdown the
 VM?
Message-ID: <ef4df56d-5b60-99f1-fec6-fe2e62434d3f@huawei.com>
Date: Tue, 29 Jun 2021 17:33:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.185.210]
X-ClientProxiedBy: dggeme704-chm.china.huawei.com (10.1.199.100) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=jiangkunkun@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 51DYKkMAhBn9

Hi all,

Accroding to the patch cddafd8f353d2d251b1a5c6c948a577a85838582,
our original intention is to flush the ITS tables into guest RAM at the 
point
RUN_STATE_FINISH_MIGRATE, but sometimes the VM gets stopped before
migration launch so let's simply flush the tables each time the VM gets
stopped.

But I encountered an error when I shut down the virtual machine.

> qemu-system-aarch64: KVM_SET_DEVICE_ATTR failed: Group 4 attr 
> 0x0000000000000001: Permission denied

Shall we need to flush ITS tables into guest RAM when 'shutdown' the VM?
Or do you think this error is normal?

This error occurs in the following scenario:
Kunpeng 920 、enable GICv4、passthrough a accelerator Hisilicon SEC to the 
VM.

The flow is as follows:

QEMU:
vm_shutdown
     do_vm_stop(RUN_STATE_SHUTDOWN)
         vm_state_notify
             ...
             vm_change_state_handler (hw/intc/arm_gicv3_its_kvm.c)
                 kvm_device_access

Kernel:
     vgic_its_save_tables_v0
         vgic_its_save_device_tables
             vgic_its_save_itt

There is such a code in vgic_its_save_itt():
> /*
>  * If an LPI carries the HW bit, this means that this
>  * interrupt is controlled by GICv4, and we do not
>  * have direct access to that state without GICv4.1.
>  * Let's simply fail the save operation...
>  */
> if (ite->irq->hw && !kvm_vgic_global_state.has_gicv4_1)
>           return -EACCES;

Looking forward to your reply.

Thanks,
Kunkun Jiang






