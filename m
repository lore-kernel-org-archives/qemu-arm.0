Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp2980229eje;
        Wed, 12 Jul 2023 17:28:50 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHS7hen57EjPfsqqxOuGe4AbDPFLPVXTLnSqfI/ZlpCwlDaxRiAomWbTzQ80O6SRsk7+w15
X-Received: by 2002:ac8:5bd3:0:b0:400:79c0:cb69 with SMTP id b19-20020ac85bd3000000b0040079c0cb69mr130590qtb.58.1689208130173;
        Wed, 12 Jul 2023 17:28:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689208130; cv=none;
        d=google.com; s=arc-20160816;
        b=qPr/YvwugdRv9cylDC5/egshPRvopJnMpDmyS5zKP6ogWsaP7WjDV7EIJ3KZUdLQOo
         hNJwZTkzmAMlIMnd7aTW3kr20ojwK3A90zNDPAJzlhwgtIkpT45WvSk+5GxwmqcWIIG1
         2+CfIS9tVVM1gZZkmfLq5pvit7Bi+nzPu6UVgFi9o7x+JjRrwFyPs563I6+qRVRxqYS/
         eSHM9AZtsLS15rRSu/tZCNWg2+9KSUPeRjiGaCOFPA6PTWgJ8Q9JynJ2GDRSlWPBWlyX
         nmS7c/JE9YRvTqTmuGmBRLbiYwJ/zWNwNnDqgaxS5u/XsxkSrBPLZZzXHxzpAZZeCxyB
         5q6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=voWVlpmm7MeCDv7tg7yl30rZqUK9Zw54JqfyPKuCRLo=;
        fh=0i3RqAlJIgOm7IXbA9mONbXyitXAhS4Ah70v5qRUg2k=;
        b=gWmfDDvPwhkzXmgT0t5xPT3RXvIW1OxktImFSeb1SwZaszh93fvcR3ceF3f3kaWKAp
         rdmNINIe/iWRETAMHUXB9gf2KPWnDmxgq7vwAVFVljYOteTCq3/q3wjWXS0DiMaUQIZr
         35+sBWspXzP7N0C0hTItEjC4knDXKXgiQS7wjALvc/wYjK86v5g4gymuYeAkCDBFUaV6
         QL/2DBoTccdd1VdxPE04hspfEQFAhg3QpYr2xTAE+ZfenXZ6v1hkzdbk8HjOFS+BQ+Xd
         GIWPtRuINObBr8nGhOcWq2oQABL9HiIOfYbBoJ8+dT0oW7vB3BIOm/yR+454BrAwYp7F
         TaEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RqeFULAx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a17-20020a05622a065100b00403c6a9fa74si1062646qtb.350.2023.07.12.17.28.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Jul 2023 17:28:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RqeFULAx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qJkC3-0002Hf-Cp; Wed, 12 Jul 2023 20:28:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qJkC1-0002HU-CP
 for qemu-arm@nongnu.org; Wed, 12 Jul 2023 20:28:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qJkBq-0000ls-G1
 for qemu-arm@nongnu.org; Wed, 12 Jul 2023 20:28:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689208093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=voWVlpmm7MeCDv7tg7yl30rZqUK9Zw54JqfyPKuCRLo=;
 b=RqeFULAxFgM2qeDeuhG+nz7csBaO4sKHVQbvjsCl9CXGK8S2uRUnDGaHAMMSd0MBP+Uxz6
 iEezETnsD4jyBDVIKoAPu6hcY0u3QSPHANxZ8/WXnL2xlmKllCavEfuTwVxXXMJy0h2JoJ
 3VXc+QrYT40YP+dd3gC9ZOjAjiXxMIs=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-382-R7c2KadfMY2SSVn6eWQ4hw-1; Wed, 12 Jul 2023 20:28:06 -0400
X-MC-Unique: R7c2KadfMY2SSVn6eWQ4hw-1
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-1b9e8ebe767so1359025ad.0
 for <qemu-arm@nongnu.org>; Wed, 12 Jul 2023 17:28:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689208085; x=1691800085;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=voWVlpmm7MeCDv7tg7yl30rZqUK9Zw54JqfyPKuCRLo=;
 b=GhWGOVQgZkjErHaJRuh/uKRVY7C+AspQHGaHKoOyH4F0u4lPVBBHuLe5xmEeFEKcd8
 R56/6CemJ3Hrifnpi30zTZnIHuOhPeI93IAqgXO/cO407UG2EwGLw6QSU68vKe2k5Ne/
 W665F2rX3Q22dxh8FyKyOlYP9j7qa3RA7XUdTFsUIpSiL8JHtewwpBQ8dPwHcORi9YuH
 qeZhOCBE72GgQwPLNAeLEAt/j9MjYxXQopHuFtMZNPyz8MiFwbuLOpbxE+rc7c9D6GIR
 7uL6RIOyXEQabTc1H8Qj7f8Fafgw4f8nWRC5YKHR0/V0+K9akeMzxjF8GBWsUeNEcU0Q
 bhMg==
X-Gm-Message-State: ABy/qLZReEwBe0lPLUEOX/86HR4ElKIazOn1Fbkg9474ooyax1dKYHKf
 vmzh+HBexC3JuEg5v0kdIB2BTjAll1cGUcyWJCNrdThtSPoMyQgGFYsHOEzH2G0/nxAF3+Hh/Ka
 KBl3gzobNK75D
X-Received: by 2002:a17:902:f68c:b0:1b5:91:4693 with SMTP id
 l12-20020a170902f68c00b001b500914693mr266228plg.1.1689208085443; 
 Wed, 12 Jul 2023 17:28:05 -0700 (PDT)
X-Received: by 2002:a17:902:f68c:b0:1b5:91:4693 with SMTP id
 l12-20020a170902f68c00b001b500914693mr266210plg.1.1689208084952; 
 Wed, 12 Jul 2023 17:28:04 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5?
 ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
 by smtp.gmail.com with ESMTPSA id
 io12-20020a17090312cc00b001b9dfa24523sm4531541plb.213.2023.07.12.17.27.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jul 2023 17:28:03 -0700 (PDT)
Message-ID: <7f524e2a-e773-4de0-09ed-b18eaec8ff16@redhat.com>
Date: Thu, 13 Jul 2023 10:27:57 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v1 0/5] target/arm: Handle psci calls in userspace
To: Salil Mehta <salil.mehta@huawei.com>, Shaoqin Huang
 <shahuang@redhat.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Cc: "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "james.morse@arm.com" <james.morse@arm.com>,
 Cornelia Huck <cohuck@redhat.com>, "kvm@vger.kernel.org"
 <kvm@vger.kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Salil Mehta <salil.mehta@opnsrc.net>
References: <20230626064910.1787255-1-shahuang@redhat.com>
 <9df973ede74e4757b510f26cd5786036@huawei.com>
 <fb5e8d4d-2388-3ab0-aaac-a1dd91e74b08@redhat.com>
 <539e6a25b89a45839de37fe92b27d0d3@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <539e6a25b89a45839de37fe92b27d0d3@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.11, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: AJ5dJWWr04HB

Hi Salil,

On 7/4/23 19:58, Salil Mehta wrote:

> 
> Latest Qemu Prototype (Pre RFC V2) (Not in the final shape of the patches)
> https://github.com/salil-mehta/qemu.git   virt-cpuhp-armv8/rfc-v1-port11052023.dev-1
> 
> 
> should work against below kernel changes as confirmed by James,
> 
> Latest Kernel Prototype (Pre RFC V2 = RFC V1 + Fixes)
> https://git.gitlab.arm.com/linux-arm/linux-jm.git   virtual_cpu_hotplug/rfc/v2
> 

I think it'd better to have the discussions through maillist. The threads and all
follow-up replies can be cached somewhere to avoid lost. Besides, other people may
be intrested in the same points and can join the discussion directly.

I got a chance to give the RFC patchsets some tests. Not all cases are working
as expected. I know the patchset is being polished. I'm summarize them as below:

(1) coredump is triggered when the topology is out of range. It's the issue we
     discussed in private. Here I'm just recapping in case other people also blocked
     by the issue.

     (a) start VM with the following command lines
      /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64       \
      -accel kvm -machine virt,gic-version=host,nvdimm=on -cpu host \
      -smp cpus=1,maxcpus=2,sockets=1,clusters=1,cores=1,threads=2  \
      -m 512M,slots=16,maxmem=64G                                   \
      -object memory-backend-ram,id=mem0,size=512M                  \
      -numa node,nodeid=0,cpus=0-1,memdev=mem0                      \

     (b) hot add CPU whose topology is out of range
     (qemu) device_add driver=host-arm-cpu,id=cpu1,core-id=1


     It's actually caused by typos in hw/arm/virt.c::virt_cpu_pre_plug() where
     'ms->possible_cpus->len' needs to be replaced with 'ms->smp.cores'. With this,
     the hot-added CPU object will be rejected.

(2) I don't think TCG has been tested since it seems not working at all.

     (a) start VM with the following command lines
     /home/gshan/sandbox/src/qemu/main/build/qemu-system-aarch64     \
     -machine virt,gic-version=3 -cpu max -m 1024                    \
     -smp maxcpus=2,cpus=1,sockets=1,clusters=1,cores=1,threads=2    \

     (b) failure while hot-adding CPU
     (qemu) device_add driver=max-arm-cpu,id=cpu1,thread-id=1
     Error: cpu(id1=0:0:0:1) with arch-id 1 exists

     The error message is printed by hw/arm/virt.c::virt_cpu_pre_plug() where the
     specific CPU has been presented. For KVM case, the disabled CPUs are detached
     from 'ms->possible_cpu->cpus[1].cpu' and destroyed. I think we need to do similar
     thing for TCG case in hw/arm/virt.c::virt_cpu_post_init(). I'm able to add CPU
     with the following hunk of changes.

--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2122,6 +2122,18 @@ static void virt_cpu_post_init(VirtMachineState *vms, MemoryRegion *sysmem)
                  exit(1);
              }
          }
+
+#if 1
+        for (n = 0; n < possible_cpus->len; n++) {
+            cpu = qemu_get_possible_cpu(n);
+            if (!qemu_enabled_cpu(cpu)) {
+                CPUArchId *cpu_slot;
+                cpu_slot = virt_find_cpu_slot(ms, cpu->cpu_index);
+                cpu_slot->cpu = NULL;
+                object_unref(OBJECT(cpu));
+            }
+        }
+#endif
      }
  }

(3) Assertion on following the sequence of hot-add, hot-remove and hot-add when TCG mode is enabled.

     (a) Include the hack from (2) and start VM with the following command lines
     /home/gshan/sandbox/src/qemu/main/build/qemu-system-aarch64     \
     -machine virt,gic-version=3 -cpu max -m 1024                    \
     -smp maxcpus=2,cpus=1,sockets=1,clusters=1,cores=1,threads=2    \

     (b) assertion on the sequence of hot-add, hot-remove and hot-add
     (qemu) device_add driver=max-arm-cpu,id=cpu1,thread-id=1
     (qemu) device_del cpu1
     (qemu) device_add driver=max-arm-cpu,id=cpu1,thread-id=1
     **
     ERROR:../tcg/tcg.c:669:tcg_register_thread: assertion failed: (n < tcg_max_ctxs)
     Bail out! ERROR:../tcg/tcg.c:669:tcg_register_thread: assertion failed: (n < tcg_max_ctxs)
     Aborted (core dumped)

     I'm not sure if x86 has similar issue. It seems the management for TCG contexts, corresponding
     to variable @tcg_max_ctxs and @tcg_ctxs need some improvements for better TCG context registration
     and unregistration to accomodate CPU hotplug.


Apart from what have been found in the tests, I've started to look into the code changes. I may
reply with more specific comments. However, it would be ideal to comment on the specific changes
after the patchset is posted for review. Salil, the plan may have been mentioned by you somewhere.
As I understood, the QEMU patchset will be posted after James's RFCv2 kernel series is posted.
Please let me know if my understanding is correct. Again, thanks for your efforts to make vCPU
hotplug to be supported :)

Thanks,
Gavin



     

     
         

