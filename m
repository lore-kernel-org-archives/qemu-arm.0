Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp508091ejc;
        Thu, 23 Feb 2023 01:06:37 -0800 (PST)
X-Google-Smtp-Source: AK7set/1/I+aodHMtb2r09mXknMNdG9NYVzwcB4aVpZq4kgYgECaoYo8uPzZzmsOZ+1WgWz0NK/Z
X-Received: by 2002:a05:6214:764:b0:56e:9ef7:e76d with SMTP id f4-20020a056214076400b0056e9ef7e76dmr22351711qvz.1.1677143197788;
        Thu, 23 Feb 2023 01:06:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677143197; cv=none;
        d=google.com; s=arc-20160816;
        b=btfBVS9ZDzWj49EguPYDLzLqC9MNgIqcnhOawzlkPEOKiJddoHYh8nQzfw8RoJKqfi
         Xu6veMat3J3L3AJNntu4CNoY1P/W0pdjaMTCPxUhySXW7sdHx54IwTFO0jZoA0MFRBlq
         e6YpI2Za7ay4PM2WcD2FNeHLDEK1LqObU47HlMTWd4fHKe0HYdHpaO28M4FnjrK1xk4w
         gAdiM6hNMvt92dmf1lt88htYuA+/BkG3yMw9rY3MLR//Pfy986sNXLSNn3Iv8zzAswm0
         ysZuj5+ggez4xDofR/yvs1XUg1bbUqqlG5SPLjPMfszimEVPa7HsrmN965KzDfs2In/G
         Lcgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=XHU07NFC76FnPEy31HMMnE6DgiOJ7zJNC5+01Fwgdks=;
        b=GcMS8uVm+ZVg66btOUAFlRsQ/5zZbj7m6fquq1JSVUuqLB015Arqa1w+Z73+SxAgE+
         E+V3s67h+8RJwVGcAEPYf6jZnVEPEOdBhudBu/6EWlBmUB5KoNTl5m6gw7Cx+1Px0weT
         UApWYRDFW6E9IZ+LmSlQnXZQk9fxuKSUzIDkIPHHiHNGVURQPKFyU1TS6D5I46BYOeUT
         JKSlvNLwpdmCMAr+D7ZZFkYfihYchZy/MqSnOaCWWdV5udzd4QTwO7jSU/Bm9AzjLKF+
         UufIfaHVJqeSMuG9P8S/wRZRrRDlBOH7blXWqBrICr9vn8srtlyK74PTnpQBiTZOsUU6
         H1GQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TJRfSwWl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r19-20020a05620a299300b0073b7ce94c22si1639298qkp.229.2023.02.23.01.06.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Feb 2023 01:06:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TJRfSwWl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pV7YE-0000XL-0n; Thu, 23 Feb 2023 04:06:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pV7YC-0000WR-1w
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 04:06:04 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pV7Y8-0001UA-TL
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 04:06:03 -0500
Received: by mail-wr1-x42d.google.com with SMTP id l25so9641001wrb.3
 for <qemu-arm@nongnu.org>; Thu, 23 Feb 2023 01:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XHU07NFC76FnPEy31HMMnE6DgiOJ7zJNC5+01Fwgdks=;
 b=TJRfSwWlMqYHMdr8ebFGJvLDSvTKGkfEpWznI3p/yImnJk0lJxLgtFBGzJUN+aHViu
 B1O/FDCEk88hLsbI6h0kcqnhP+hYPjImIWqJnE07PXFweOmY+7x5LOomexRcQ0IdE9Ak
 aA/ARYgTAs6iTM/uD20JLoMbOd7ew3tb0AXP8xkd/gJNgHmbEddS5w32KtckeCEoJ5qa
 I+rw5ufB6SNheqZ4qtXenyZjbppmrbOGCURg3A9giKkHiH2X+LuePBMV+PBacK/ksrU/
 mh307lDClscw+E3udM14taDQeQ8m6WXy0L6YRLA3eN5HvW1ET5ednPQvv3rcL767ZvW5
 KBRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XHU07NFC76FnPEy31HMMnE6DgiOJ7zJNC5+01Fwgdks=;
 b=2DJXd4pnqjEi40OlZaeAgE2qKkOT9v4LsdL3WZ9KJyF750avDuOegUq9y5BTUPCFLh
 bQ50cht8dGwBiWjkZP/Zoq6TVXM87UYnxvaAPp+Su+pOxqvfs2iBRzGmyeOnH998u0Ls
 ZyXT7O1Pe/6CBOoLpyevZEvcKSP+1ofdwY3Kywr1eJ5Cawt5LRJhwywKLUMHThUmilGy
 t3XhM6wFeTUbqvl0FyN9xa6HbpwNltL7aw+xorGFilH70QUbITEkTIemLtDwkJ5vGoio
 UDOv+7Up/jh+PAorlgZonqZ/L8kWxOGb9dnyKtpN7r09Don21PAqUIhAoBvcAi7dp/fM
 0EUg==
X-Gm-Message-State: AO0yUKVFs75UQ1KYXTOoXtRUt5Px4Io+S711N19iTE97dAauOLSpKpRA
 X/Jy3/JxEaGg7+KLTWL5adPY4w==
X-Received: by 2002:adf:f147:0:b0:2c5:c4c9:515a with SMTP id
 y7-20020adff147000000b002c5c4c9515amr10401654wro.51.1677143158160; 
 Thu, 23 Feb 2023 01:05:58 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 w18-20020a05600c475200b003e220998b6bsm12185152wmo.17.2023.02.23.01.05.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 01:05:57 -0800 (PST)
Message-ID: <1fd1606c-3dde-b780-14f7-d8a9ae4dedf5@linaro.org>
Date: Thu, 23 Feb 2023 10:05:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/4] numa: Validate socket and NUMA node boundary if
 required
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, rad@semihalf.com,
 peter.maydell@linaro.org, quic_llindhol@quicinc.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, thuth@redhat.com,
 lvivier@redhat.com, pbonzini@redhat.com, imammedo@redhat.com,
 yihyu@redhat.com, shan.gavin@gmail.com
References: <20230223081401.248835-1-gshan@redhat.com>
 <20230223081401.248835-3-gshan@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230223081401.248835-3-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.102,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: ImxEESpJi+RT

On 23/2/23 09:13, Gavin Shan wrote:
> For some architectures like ARM64, multiple CPUs in one socket can't be
> associated with different NUMA nodes. Otherwise, the guest kernel is confused
> about the CPU topology. For example, the following warning message is observed
> from linux guest with the below command lines.
> 
>    -smp 6,maxcpus=6,sockets=2,clusters=1,cores=3,threads=1 \
>    -numa node,nodeid=0,cpus=0-1,memdev=ram0                \
>    -numa node,nodeid=1,cpus=2-3,memdev=ram1                \
>    -numa node,nodeid=2,cpus=4-5,memdev=ram2                \
> 
>    ------------[ cut here ]------------
>    WARNING: CPU: 0 PID: 1 at kernel/sched/topology.c:2271 build_sched_domains+0x284/0x910
>    Modules linked in:
>    CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.14.0-268.el9.aarch64 #1
>    pstate: 00400005 (nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>    pc : build_sched_domains+0x284/0x910
>    lr : build_sched_domains+0x184/0x910
>    sp : ffff80000804bd50
>    x29: ffff80000804bd50 x28: 0000000000000002 x27: 0000000000000000
>    x26: ffff800009cf9a80 x25: 0000000000000000 x24: ffff800009cbf840
>    x23: ffff000080325000 x22: ffff0000005df800 x21: ffff80000a4ce508
>    x20: 0000000000000000 x19: ffff000080324440 x18: 0000000000000014
>    x17: 00000000388925c0 x16: 000000005386a066 x15: 000000009c10cc2e
>    x14: 00000000000001c0 x13: 0000000000000001 x12: ffff00007fffb1a0
>    x11: ffff00007fffb180 x10: ffff80000a4ce508 x9 : 0000000000000041
>    x8 : ffff80000a4ce500 x7 : ffff80000a4cf920 x6 : 0000000000000001
>    x5 : 0000000000000001 x4 : 0000000000000007 x3 : 0000000000000002
>    x2 : 0000000000001000 x1 : ffff80000a4cf928 x0 : 0000000000000001
>    Call trace:
>     build_sched_domains+0x284/0x910
>     sched_init_domains+0xac/0xe0
>     sched_init_smp+0x48/0xc8
>     kernel_init_freeable+0x140/0x1ac
>     kernel_init+0x28/0x140
>     ret_from_fork+0x10/0x20
> 
> Improve the sitation to reject the configuration where multiple CPUs

Typo "situation".

> in one socket have been associated with different NUMA nodes. The
> newly introduced helper set_numa_socket_boundary() is expected to
> called by specific machines (boards) where the boundary is required.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>   hw/core/machine.c     | 34 ++++++++++++++++++++++++++++++++++
>   hw/core/numa.c        |  7 +++++++
>   include/sysemu/numa.h |  4 ++++
>   3 files changed, 45 insertions(+)


> diff --git a/include/sysemu/numa.h b/include/sysemu/numa.h
> index 4173ef2afa..160008fff4 100644
> --- a/include/sysemu/numa.h
> +++ b/include/sysemu/numa.h
> @@ -86,6 +86,9 @@ struct NumaState {
>       /* Detect if HMAT support is enabled. */
>       bool hmat_enabled;
>   
> +    /* CPUs in one socket can't break socket boundary */
> +    bool have_socket_boundary;

This field belong to MachineClass, please add it as
numa_have_socket_boundary just after to numa_mem_supported.

Next patches become:

---
diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index f778cb6d09..a48f1b2329 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -864,6 +864,7 @@ static void sbsa_ref_class_init(ObjectClass *oc, 
void *data)
      mc->possible_cpu_arch_ids = sbsa_ref_possible_cpu_arch_ids;
      mc->cpu_index_to_instance_props = sbsa_ref_cpu_index_to_props;
      mc->get_default_cpu_node_id = sbsa_ref_get_default_cpu_node_id;
+    mc->numa_have_socket_boundary = true;
  }
---

Otherwise LGTM :)
